# -*- coding: utf-8 -*-
"""Build tools/data/brave_challenge_badge_desc_mt_en.json (incremental writes).

  .venv-trans/bin/python tools/scripts/build_brave_challenge_badge_desc_mt.py

Requires:  python3 -m venv .venv-trans && .venv-trans/bin/pip install deep-translator
"""

from __future__ import annotations

import csv
import json
import re
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BADGE = ROOT / "game_config/brave_challenge/badge.csv"
DICT_MD = ROOT / "GAME_DICTIONARY.md"
OUT = ROOT / "tools/data/brave_challenge_badge_desc_mt_en.json"

CJK = re.compile(r"[\u3400-\u9fff]")
TAIL_MARKER = "#C0x5B545B#"

MODE_KEYS = frozenset(
    [
        "该玩法内己方全体反弹率提升20%",
        "该玩法内己方全体反弹率提升5%",
        "该玩法内己方全体吸血率提升20%",
        "该玩法内己方全体吸血率提升5%",
        "该玩法内己方全体回怒速度提升30%",
        "该玩法内己方全体回怒速度提升5%",
        "该玩法内己方全体控制率提升15%",
        "该玩法内己方全体控制率提升5%",
        "该玩法内己方全体治疗效果提升40%",
        "该玩法内己方全体治疗效果提升5%",
        "该玩法内己方全体速度提升25%",
        "该玩法内己方全体速度提升5%",
        "该玩法内己方前排伤害减免提升10%",
        "该玩法内己方前排伤害减免提升20%",
        "该玩法内己方前排双防提升10%",
        "该玩法内己方前排双防提升20%",
        "该玩法内己方前排必杀抗性提升10%",
        "该玩法内己方前排必杀抗性提升20%",
        "该玩法内己方前排抗爆率提升10%",
        "该玩法内己方前排抗爆率提升20%",
        "该玩法内己方后排伤害加成提升10%",
        "该玩法内己方后排伤害加成提升20%",
        "该玩法内己方后排双攻提升10%",
        "该玩法内己方后排双攻提升20%",
        "该玩法内己方后排必杀伤害加成10%",
        "该玩法内己方后排必杀伤害加成20%",
        "该玩法内己方后排暴击率提升10%",
        "该玩法内己方后排暴击率提升20%",
    ]
)

EXACT_SKIP = frozenset(
    [
        "这是一个神秘的徽章",
        "己方全体精灵免控率和伤害加成提升10%~30%",
        "己方全体精灵免控率和伤害加成提升10％~30％",
        "每个大回合结束，己方随机一个精灵的血量和怒气获得恢复",
    ]
)

EXTRA_SPECIES = {
    "龙系精灵": "Dragon-type Pokémon",
    "坚盾剑怪·盾牌": "Aegislash (Shield Forme)",
    "谢米·天空": "Shaymin (Sky Forme)",
    "超级巨沼怪": "Mega Swampert",
    "超级暴雪王": "Mega Abomasnow",
    "小智版皮卡丘": "Ash's Pikachu",
}


def load_pokemon_cn_en(md: Path) -> dict[str, str]:
    text = md.read_text(encoding="utf-8")
    pat = re.compile(r"^\|\s*\d+\s*\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|", re.M)
    out: dict[str, str] = {}
    for m in pat.finditer(text):
        cn, en = m.group(1).strip(), m.group(2).strip()
        if cn and en and not cn.startswith(":"):
            out.setdefault(cn, en)
    out.update(EXTRA_SPECIES)
    return out


def species_order(cn2en: dict[str, str]) -> tuple[str, ...]:
    return tuple(sorted(cn2en.keys(), key=len, reverse=True))


def pre_replace_species(s: str, order: tuple[str, ...], cn2en: dict[str, str]) -> str:
    for zh in order:
        if zh in s:
            s = s.replace(zh, cn2en[zh])
    return s


def need_mt(s: str) -> bool:
    s = s.strip()
    if not CJK.search(s):
        return False
    if s in MODE_KEYS or s in EXACT_SKIP:
        return False
    if s.startswith("招募"):
        return False
    if s.startswith("该玩法内"):
        return False
    return True


def polish(s: str) -> str:
    s = s.replace("In this gameplay", "In this mode").replace("in this gameplay", "in this mode")
    s = re.sub(r"\s+", " ", s).strip()
    return s


def translate_one(translator, zh: str, order: tuple[str, ...], cn2en: dict[str, str]) -> str:
    if zh.startswith("#C") and TAIL_MARKER in zh:
        head, sep, tail = zh.partition(TAIL_MARKER)
        prep = pre_replace_species(tail, order, cn2en)
        try:
            en_tail = translator.translate(prep)
        except Exception:  # noqa: BLE001
            en_tail = prep
        return polish(head + sep + en_tail)
    prep = pre_replace_species(zh, order, cn2en)
    try:
        return polish(translator.translate(prep))
    except Exception:  # noqa: BLE001
        return prep


def flush(path: Path, data: dict[str, str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def main() -> None:
    try:
        from deep_translator import MyMemoryTranslator
    except ImportError:
        print("pip install deep-translator in .venv-trans", file=sys.stderr)
        sys.exit(1)

    translator = MyMemoryTranslator(source="zh-CN", target="en-US")
    cn2en = load_pokemon_cn_en(DICT_MD)
    order = species_order(cn2en)

    with BADGE.open(encoding="utf-8-sig", newline="") as f:
        rows = list(csv.reader(f))
    di = rows[0].index("desc")
    keys = {r[di].strip() for r in rows[3:] if len(r) > di}
    todo = sorted(k for k in keys if need_mt(k))

    out_map: dict[str, str] = {}
    if OUT.exists():
        out_map = json.loads(OUT.read_text(encoding="utf-8"))

    print("to translate:", len(todo))
    for i, zh in enumerate(todo):
        if zh in out_map and not CJK.search(out_map[zh]):
            continue
        out_map[zh] = translate_one(translator, zh, order, cn2en)
        if (i + 1) % 25 == 0:
            flush(OUT, out_map)
            print("  checkpoint", i + 1)
        time.sleep(0.12)

    flush(OUT, out_map)
    leaky = sum(1 for k in todo if CJK.search(out_map.get(k, "")))
    print("done. entries:", len(out_map), "mt todo still CJK:", leaky)


if __name__ == "__main__":
    main()
