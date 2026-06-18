#!/usr/bin/env python3
"""Sync game_config/gym/gate.csv *_en columns and translate _beizhu notes."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path

CJK_RE = re.compile(r"[\u3400-\u9fff]")
TEXT_FIELDS = ("weatherDesc", "palce", "placeDesc", "specialEffDesc")

BEIZHU_OVERRIDES: dict[str, str] = {
    "岩石送分": "Rock Easy Win",
    "地面送分": "Ground Easy Win",
    "大岩蛇小拳石": "Onix + Geodude",
    "岩杂": "Rock Mix",
    "打地鼠": "Diglett",
    "嘎啦嘎啦": "Marowak",
    "6岩柱子": "6x Rock Pillars",
    "6岩斗士": "6x Rock Fighters",
    "地面系主阵容": "Ground Core Team",
    "可多拉+犀牛": "Lairon + Rhyhorn",
    "6大钢蛇": "6x Steelix",
    "班基拉+固拉多": "Tyranitar + Groudon",
    "固拉多": "Groudon",
    "水晶大岩蛇": "Crystal Onix",
    "哥斯拉大战金刚": "Godzilla vs Kong",
    "岩地馆主": "Rock-Ground Gym Leader",
    "水系送分": "Water Easy Win",
    "冰系送分": "Ice Easy Win",
    "水冰送分": "Water-Ice Easy Win",
    "水系御三家": "Water Starter Trio",
    "露力丽": "Azurill",
    "可达鸭": "Psyduck",
    "反伤": "Reflect Damage",
    "雪妖女": "Froslass",
    "雪妖女美纳斯": "Froslass + Milotic",
    "雪花+玛狃拉": "Abomasnow + Weavile",
    "乘龙+水龙": "Lapras + Kingdra",
    "6暴鲤龙": "6x Gyarados",
    "红色暴鲤龙": "Red Gyarados",
    "水系主阵容": "Water Core Team",
    "冰系主阵容": "Ice Core Team",
    "超级暴雪王": "Mega Abomasnow",
    "酋雷姆": "Kyurem",
    "水冰馆主": "Water-Ice Gym Leader",
    "草系送分": "Grass Easy Win",
    "飞行系送分": "Flying Easy Win",
    "一般系送分": "Normal Easy Win",
    "百变怪送分": "Ditto Easy Win",
    "草系御三家": "Grass Starter Trio",
    "6爆音怪": "6x Exploud",
    "妙蛙+月桂叶": "Bulbasaur + Bayleef",
    "音波龙+螳螂": "Noivern + Scyther",
    "6一拳": "6x One-Punch",
    "谢米": "Shaymin",
    "卡比+树枭": "Snorlax + Decidueye",
    "三马桶": "Three Regis",
    "三圣鸟": "Three Legendary Birds",
    "百鸟朝凤": "Ho-Oh Legend",
    "6时拉比": "6x Celebi",
    "普草飞馆主": "Normal-Grass-Flying Gym Leader",
    "火系送分": "Fire Easy Win",
    "格斗送分": "Fighting Easy Win",
    "火系御三家": "Fire Starter Trio",
    "5怪力": "5x Machamp",
    "喷火龙全家桶": "Charizard Family",
    "火炎狮残局王者": "Pyroar Endgame King",
    "格斗三傻": "Fighting Trio",
    "6V6单挑 属性": "6v6 Duel Types",
    "6V6单挑 斗": "6v6 Duel Fighting",
    "火系主阵容": "Fire Core Team",
    "无限火力": "Ultra Rapid Fire",
    "全员肉搏": "All-Out Melee",
    "6凤王": "6x Ho-Oh",
    "火斗馆主": "Fire-Fighting Gym Leader",
    "龙系送分": "Dragon Easy Win",
    "电系送分": "Electric Easy Win",
    "龙电送分": "Dragon-Electric Easy Win",
    "迷你龙送分": "Dratini Easy Win",
    "电击魔+电龙": "Electivire + Ampharos",
    "黏美龙+X喷": "Goodra + Mega Charizard X",
    "皮卡丘": "Pikachu",
    "四龙": "Four Dragons",
    "电系主阵容": "Electric Core Team",
    "皮卡丘电系阵容": "Pikachu Electric Core Team",
    "6自爆磁怪": "6x Magnezone",
    "龙系主阵容": "Dragon Core Team",
    "皮神": "Pika God",
    "龙电馆主": "Dragon-Electric Gym Leader",
    "恶系送分": "Dark Easy Win",
    "鬼系送分": "Ghost Easy Win",
    "恶鬼混合送分": "Dark-Ghost Mixed Easy Win",
    "日夜交替-免疫特攻": "Day-Night Cycle - Sp. ATK Immune",
    "日夜交替-免疫物攻": "Day-Night Cycle - P. ATK Immune",
    "6索罗亚克": "6x Zoroark",
    "魔灵+娃娃": "Dusknoir + Banette",
    "镜像": "Mirror Match",
    "恶系主阵容": "Dark Core Team",
    "鬼系主阵容": "Ghost Core Team",
    "耿鬼家族": "Gengar Family",
    "真·噩梦副本": "True Nightmare Dungeon",
    "6Y神": "6x Yveltal",
    "恶鬼馆主": "Dark-Ghost Gym Leader",
    "钢系送分": "Steel Easy Win",
    "绿毛虫送分": "Caterpie Easy Win",
    "毒系送分": "Poison Easy Win",
    "虫系进化": "Bug Evolution",
    "毒队": "Poison Team",
    "尼多家族": "Nido Family",
    "自爆螳螂": "Scizor",
    "6瓦斯弹": "6x Koffing",
    "剑队": "Sword Team",
    "虫族场地": "Bug Zerg Terrain",
    "钢系主阵容": "Steel Core Team",
    "6超坏星": "6x Toxapex",
    "钢柱+3可可": "Steel Pillars + 3 Aron",
    "虫系协战": "Bug Support Battle",
    "螺帽基拉祈": "Nut-cap Jirachi",
    "超能送分": "Psychic Easy Win",
    "妖系送分": "Fairy Easy Win",
    "超、妖送分": "Psychic-Fairy Easy Win",
    "超能控制队": "Psychic Control Team",
    "梦幻超梦": "Mew + Mewtwo",
    "6超梦": "6x Mewtwo",
    "胖丁": "Jigglypuff",
    "妖精系主阵容": "Fairy Core Team",
    "6洛奇亚": "6x Lugia",
    "沙奈朵家族": "Gardevoir Family",
    "巨金怪+美梦": "Metagross + Gardevoir",
    "超级胡地": "Mega Alakazam",
    "真·魔神本": "True Hoopa Dungeon",
}

# CSV-only rows (not present in Lua source).
FALLBACK_CN_EN: dict[str, dict[str, str]] = {
    "80533": {
        "specialEffDesc": (
            "\nIn warfare, avoid the strong and strike the weak\n"
            "#C0xFFDEAD#Meaning: attack the odd one out"
        ),
    },
}


def has_cjk(value: str) -> bool:
    return bool(CJK_RE.search(value))


def unescape_lua_string(value: str) -> str:
    replacements = {
        r"\"": '"',
        r"\n": "\n",
        r"\r": "\r",
        r"\t": "\t",
        r"\\": "\\",
    }
    for old, new in replacements.items():
        value = value.replace(old, new)
    return value.replace("\u00a0", " ")


def lua_text_to_csv_cell(value: str) -> str:
    return value.replace("\\", "\\\\").replace("\n", "\\n").replace("\r", "\\r")


def extract_string_field(block: str, field_name: str) -> str | None:
    match = re.search(
        rf"\n\s*{re.escape(field_name)}\s*=\s*\"((?:[^\"\\]|\\.)*)\"",
        block,
    )
    if not match:
        return None
    return unescape_lua_string(match.group(1))


def extract_int_field(block: str, field_name: str) -> str | None:
    match = re.search(rf"\n\s*{re.escape(field_name)}\s*=\s*(\d+)", block)
    if not match:
        return None
    return match.group(1)


def iter_top_level_blocks(text: str, marker: str):
    start = text.index(marker)
    index = text.index("{", start) + 1
    depth = 1
    in_string = False
    escaped = False
    block_start: int | None = None

    while index < len(text) and depth:
        char = text[index]
        if in_string:
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                in_string = False
        else:
            if char == '"':
                in_string = True
            elif char == "{":
                if depth == 1:
                    block_start = index
                depth += 1
            elif char == "}":
                depth -= 1
                if depth == 1 and block_start is not None:
                    yield text[block_start : index + 1]
                    block_start = None
        index += 1


def load_source_entries(path: Path) -> dict[str, dict[str, str]]:
    entries: dict[str, dict[str, str]] = {}
    text = path.read_text(encoding="utf-8")

    for block in iter_top_level_blocks(text, "csv.gym.gate = {"):
        row_id = extract_int_field(block, "id")
        if not row_id:
            continue
        row_fields: dict[str, str] = {}
        for field in TEXT_FIELDS:
            value = extract_string_field(block, field)
            if value is not None:
                row_fields[field] = value
        if row_fields:
            entries[row_id] = row_fields

    for row_id, fields in FALLBACK_CN_EN.items():
        merged = entries.setdefault(row_id, {})
        merged.update(fields)

    return entries


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def detect_encoding(path: Path) -> str:
    data = path.read_bytes()
    if data.startswith(b"\xef\xbb\xbf"):
        return "utf-8-sig"
    for encoding in ("utf-8", "gb18030"):
        try:
            data.decode(encoding)
            return encoding
        except UnicodeDecodeError:
            continue
    raise SystemExit(f"unable to decode {path}")


def read_csv_rows(path: Path) -> tuple[list[list[str]], str]:
    encoding = detect_encoding(path)
    with path.open(encoding=encoding, newline="") as handle:
        return list(csv.reader(handle)), encoding


def load_dictionary(path: Path) -> dict[str, str]:
    mapping: dict[str, str] = {}
    source_index: int | None = None
    english_index: int | None = None

    for raw_line in path.read_text(encoding="utf-8").splitlines():
        if not raw_line.startswith("|"):
            source_index = None
            english_index = None
            continue

        cells = [cell.strip() for cell in raw_line.strip().strip("|").split("|")]
        if all(set(cell) <= {":", "-", " "} for cell in cells):
            continue

        if "English" in cells:
            english_index = cells.index("English")
            if "Gốc (CN)" in cells:
                source_index = cells.index("Gốc (CN)")
            elif "Gốc (CSV)" in cells:
                source_index = cells.index("Gốc (CSV)")
            elif english_index >= 2:
                source_index = english_index - 1
            else:
                source_index = 0
            continue

        if source_index is None or english_index is None:
            continue
        if max(source_index, english_index) >= len(cells):
            continue

        source = cells[source_index]
        english = cells[english_index]
        if source and english and not source.startswith(":"):
            mapping.setdefault(source, english)

    return mapping


def translate_beizhu(value: str, dictionary: dict[str, str]) -> str | None:
    if value in BEIZHU_OVERRIDES:
        return BEIZHU_OVERRIDES[value]

    translated = dictionary.get(value)
    if translated and not CJK_RE.search(translated):
        return translated

    return None


def copy_en_to_base(
    rows: list[list[str]],
    fields: tuple[str, ...],
    *,
    only_when_en_nonempty: bool = True,
) -> dict[str, int | list[tuple[int, str, str]]]:
    header = rows[0]
    stats: dict[str, int | list[tuple[int, str, str]]] = {
        "base_updates": 0,
        "base_unchanged": 0,
        "missing_en": [],
        "remaining_cjk": [],
    }

    field_pairs = []
    for field in fields:
        en_col = f"{field}_en"
        if field not in header or en_col not in header:
            raise SystemExit(f"missing columns {field!r} or {en_col!r} in CSV header")
        field_pairs.append((field, header.index(field), header.index(en_col)))

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or not row[0]:
            continue

        row_id = row[0]
        for field, base_index, en_index in field_pairs:
            while len(row) <= max(base_index, en_index):
                row.append("")

            english = row[en_index].strip()
            if only_when_en_nonempty and not english:
                missing = stats["missing_en"]
                assert isinstance(missing, list)
                if has_cjk(row[base_index]):
                    missing.append((line_number, row_id, field))
                continue

            if row[base_index] != row[en_index]:
                row[base_index] = row[en_index]
                stats["base_updates"] = int(stats["base_updates"]) + 1
            else:
                stats["base_unchanged"] = int(stats["base_unchanged"]) + 1

            if has_cjk(row[base_index]):
                remaining = stats["remaining_cjk"]
                assert isinstance(remaining, list)
                remaining.append((line_number, row_id, field))

    return stats


def copy_tw_to_base(
    rows: list[list[str]],
    fields: tuple[str, ...],
    *,
    only_when_tw_nonempty: bool = True,
) -> dict[str, int | list[tuple[int, str, str]]]:
    header = rows[0]
    stats: dict[str, int | list[tuple[int, str, str]]] = {
        "base_updates": 0,
        "base_unchanged": 0,
        "missing_tw": [],
    }

    field_pairs = []
    for field in fields:
        tw_col = f"{field}_tw"
        if field not in header or tw_col not in header:
            raise SystemExit(f"missing columns {field!r} or {tw_col!r} in CSV header")
        field_pairs.append((field, header.index(field), header.index(tw_col)))

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or not row[0]:
            continue

        row_id = row[0]
        for field, base_index, tw_index in field_pairs:
            while len(row) <= max(base_index, tw_index):
                row.append("")

            traditional = row[tw_index].strip()
            if only_when_tw_nonempty and not traditional:
                missing = stats["missing_tw"]
                assert isinstance(missing, list)
                if row[base_index].strip():
                    missing.append((line_number, row_id, field))
                continue

            if row[base_index] != row[tw_index]:
                row[base_index] = row[tw_index]
                stats["base_updates"] = int(stats["base_updates"]) + 1
            else:
                stats["base_unchanged"] = int(stats["base_unchanged"]) + 1

    return stats


def sync_beizhu(
    rows: list[list[str]],
    dictionary: dict[str, str],
    *,
    force: bool,
) -> dict[str, int | list[tuple[int, str, str]]]:
    note_index = rows[0].index("_beizhu")
    stats: dict[str, int | list[tuple[int, str, str]]] = {
        "beizhu_updates": 0,
        "beizhu_unchanged": 0,
        "missing_beizhu": [],
        "remaining_cjk_beizhu": [],
    }

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or len(row) <= note_index:
            continue

        current = row[note_index].strip()
        if not current:
            continue

        if not force and not CJK_RE.search(current):
            stats["beizhu_unchanged"] = int(stats["beizhu_unchanged"]) + 1
            continue

        translated = translate_beizhu(current, dictionary)
        if translated:
            if row[note_index] != translated:
                row[note_index] = translated
                stats["beizhu_updates"] = int(stats["beizhu_updates"]) + 1
            else:
                stats["beizhu_unchanged"] = int(stats["beizhu_unchanged"]) + 1
        else:
            missing = stats["missing_beizhu"]
            assert isinstance(missing, list)
            missing.append((line_number, row[0] if row[0] else "", current))

        if CJK_RE.search(row[note_index]):
            remaining = stats["remaining_cjk_beizhu"]
            assert isinstance(remaining, list)
            remaining.append((line_number, row[0] if row[0] else "", row[note_index]))

    return stats


def sync(args: argparse.Namespace) -> int:
    rows, encoding = read_csv_rows(args.target)
    lineterminator = detect_lineterminator(args.target)

    if len(rows) < 3:
        raise SystemExit("target CSV must include metadata, default, and description rows")

    if args.copy_en_to_base:
        copy_fields = tuple(
            field.strip()
            for field in args.copy_en_to_base.split(",")
            if field.strip()
        )
        copy_stats = copy_en_to_base(rows, copy_fields)
        print(f"encoding={encoding}")
        print(f"copy_fields={','.join(copy_fields)}")
        print(f"base_updates={copy_stats['base_updates']}")
        print(f"base_unchanged={copy_stats['base_unchanged']}")
        missing_en = copy_stats["missing_en"]
        assert isinstance(missing_en, list)
        print(f"missing_en={len(missing_en)}")
        for line_number, row_id, field in missing_en[:20]:
            print(f"missing en line={line_number} id={row_id} field={field}")
        remaining_cjk = copy_stats["remaining_cjk"]
        assert isinstance(remaining_cjk, list)
        print(f"remaining_cjk={len(remaining_cjk)}")
        for line_number, row_id, field in remaining_cjk[:20]:
            print(f"remaining cjk line={line_number} id={row_id} field={field}")

        if args.dry_run:
            return 0

        with args.target.open("w", encoding=encoding, newline="") as handle:
            writer = csv.writer(handle, lineterminator=lineterminator)
            writer.writerows(rows)
        return 0

    if args.copy_tw_to_base:
        copy_fields = tuple(
            field.strip()
            for field in args.copy_tw_to_base.split(",")
            if field.strip()
        )
        copy_stats = copy_tw_to_base(rows, copy_fields)
        print(f"encoding={encoding}")
        print(f"copy_fields={','.join(copy_fields)}")
        print(f"base_updates={copy_stats['base_updates']}")
        print(f"base_unchanged={copy_stats['base_unchanged']}")
        missing_tw = copy_stats["missing_tw"]
        assert isinstance(missing_tw, list)
        print(f"missing_tw={len(missing_tw)}")
        for line_number, row_id, field in missing_tw[:20]:
            print(f"missing tw line={line_number} id={row_id} field={field}")

        if args.dry_run:
            return 0

        with args.target.open("w", encoding=encoding, newline="") as handle:
            writer = csv.writer(handle, lineterminator=lineterminator)
            writer.writerows(rows)
        return 0

    source_entries = load_source_entries(args.source)
    header = rows[0]
    field_pairs = [
        (field, header.index(f"{field}_en"))
        for field in TEXT_FIELDS
        if f"{field}_en" in header
    ]

    stats = {f"{field}_en_updates": 0 for field in TEXT_FIELDS}
    stats["unchanged"] = 0
    unresolved: list[tuple[int, str, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or not row[0]:
            continue

        row_id = row[0]
        source_fields = source_entries.get(row_id, {})
        changed = False

        for field, en_index in field_pairs:
            if field not in source_fields:
                continue
            target_value = lua_text_to_csv_cell(source_fields[field])
            while len(row) <= en_index:
                row.append("")
            if row[en_index] != target_value:
                row[en_index] = target_value
                stats[f"{field}_en_updates"] += 1
                changed = True
            if has_cjk(row[en_index]):
                unresolved.append((line_number, row_id, field, row[en_index][:80]))

        if not changed:
            stats["unchanged"] += 1

    print(f"encoding={encoding}")
    print(f"source_rows_with_text={len(source_entries)}")
    for field in TEXT_FIELDS:
        print(f"{field}_en_updates={stats[f'{field}_en_updates']}")
    print(f"unchanged={stats['unchanged']}")
    print(f"remaining_cjk_en={len(unresolved)}")
    for item in unresolved[:20]:
        print(f"unresolved line={item[0]} id={item[1]} field={item[2]} value={item[3]!r}")

    if not args.skip_beizhu:
        dictionary = load_dictionary(args.dictionary)
        beizhu_stats = sync_beizhu(rows, dictionary, force=args.force_beizhu)
        print(f"beizhu_updates={beizhu_stats['beizhu_updates']}")
        print(f"beizhu_unchanged={beizhu_stats['beizhu_unchanged']}")
        missing_beizhu = beizhu_stats["missing_beizhu"]
        assert isinstance(missing_beizhu, list)
        print(f"missing_beizhu={len(missing_beizhu)}")
        for line_number, row_id, value in missing_beizhu[:20]:
            print(f"missing beizhu line={line_number} id={row_id} note={value!r}")
        remaining_beizhu = beizhu_stats["remaining_cjk_beizhu"]
        assert isinstance(remaining_beizhu, list)
        print(f"remaining_cjk_beizhu={len(remaining_beizhu)}")

    if args.dry_run:
        return 0

    with args.target.open("w", encoding=encoding, newline="") as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--source",
        type=Path,
        default=Path("game_origin_config/gym/gate.lua"),
    )
    parser.add_argument(
        "--target",
        type=Path,
        default=Path("game_config/gym/gate.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument(
        "--copy-en-to-base",
        metavar="FIELDS",
        help="comma-separated base fields to fill from *_en (e.g. weatherDesc)",
    )
    parser.add_argument(
        "--copy-tw-to-base",
        metavar="FIELDS",
        help="comma-separated base fields to fill from *_tw (e.g. specialEffDesc)",
    )
    parser.add_argument("--skip-beizhu", action="store_true")
    parser.add_argument("--force-beizhu", action="store_true")
    parser.add_argument(
        "--dictionary",
        type=Path,
        default=Path("GAME_DICTIONARY.md"),
    )
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
