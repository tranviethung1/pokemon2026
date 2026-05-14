#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
from pathlib import Path


ROOT = Path("/home/hungtv/pokemon2026")
DEFAULT_TARGET = ROOT / "game_config/cross/circus/theme.csv"

NAME_MAP = {
    "无垠灼枫": "Blazing Maplebound Expanse",
    "遁影幽怨": "Shadow-Hidden Grudge",
    "闪断绵雨": "Flashbreak Drizzle",
    "尘沙坠石": "Falling Sandstone",
    "颤锻寒魂": "Chilling Tempered Soul",
    "奇念幻灵": "Mystic Mirage",
    "凛空瞰望": "Skyfrost Watch",
    "无华霸劲": "Unadorned Dominance",
    "蛊毒疫瘴": "Venomous Pestilence",
    "分节段奏": "Segmented Movement",
    "诸神之战": "War of the Gods",
    "属性混奏": "Elemental Ensemble",
    "属性分奏": "Elemental Counterpoint",
    "属性单奏": "Elemental Solo",
    "渐近的死亡": "Approaching Death",
    "不灭的意志": "Undying Will",
    "刺痛的枷锁": "Stinging Shackles",
    "浴血的希冀": "Bloodsoaked Hope",
    "无尽的拳影": "Endless Fist Shadows",
    "戏弄的欢愉": "Mischief's Delight",
    "堕落的审判": "Fallen Judgment",
}

DESC_MAP = {
    "分段起伏的乐谱，紊乱的乐章--同一场比赛中，精灵分成三组上阵，每一组分别为1只2只3只，一方精灵阵亡后换下一组，一方已经获得两次胜利后对战结束": "A score with shifting sections and a chaotic movement -- in a single match, Pokemon are split into three deployment groups of 1, 2, and 3 units respectively. When one side's current group is defeated, the next group takes the field. The battle ends once one side has claimed two victories.",
    "悦居高位的乐谱，震撼的乐章--队伍仅允许上阵史诗或神话精灵，没有其余限制": "A lofty score with a thunderous movement -- the team may only deploy Epic or Mythic Pokemon, with no other restrictions.",
    "复合杂糅的乐谱，调和的乐章--队伍仅允许上阵至少4只双属性精灵，没有其余限制": "A blended score with a harmonious movement -- the team may only deploy lineups containing at least 4 dual-type Pokemon, with no other restrictions.",
    "规律严谨的乐谱，秩序的乐章--对于属性的有严苛的挑剔，需上阵2只冰系或龙系的精灵，另外还需上阵1只水系的精灵": "A strict score with an orderly movement -- the lineup has demanding type requirements: deploy 2 Ice- or Dragon-type Pokemon, plus 1 additional Water-type Pokemon.",
    "规律严谨的乐谱，秩序的乐章--对于属性的有严苛的挑剔，需上阵3只虫系或妖精系的精灵，另外还需上阵2只火系或草系的精灵": "A strict score with an orderly movement -- the lineup has demanding type requirements: deploy 3 Bug- or Fairy-type Pokemon, plus 2 additional Fire- or Grass-type Pokemon.",
    "单一不染的乐谱，柔和的乐章--队伍仅允许上阵单属性精灵，没有其余限制": "A pure score with a gentle movement -- the team may only deploy mono-type Pokemon, with no other restrictions.",
}


def load_rows(path: Path) -> list[list[str]]:
    return list(csv.reader(path.read_text(encoding="utf-8-sig").splitlines()))


def dump_rows(rows: list[list[str]]) -> str:
    output = io.StringIO()
    writer = csv.writer(output, lineterminator="\r\n")
    writer.writerows(rows)
    return output.getvalue()


def sync_file(target: Path, dry_run: bool) -> None:
    rows = load_rows(target)
    header = rows[0]
    idx_id = header.index("变量名")
    idx_name = header.index("name")
    idx_desc = header.index("desc")

    updated_name = 0
    updated_desc = 0
    unchanged_name = 0
    unchanged_desc = 0
    missing_name: list[tuple[str, str]] = []
    missing_desc: list[tuple[str, str]] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        row_id = row[idx_id].strip()
        if not row_id:
            continue

        current_name = row[idx_name].strip()
        if current_name:
            english_name = NAME_MAP.get(current_name, current_name if not any("\u4e00" <= ch <= "\u9fff" for ch in current_name) else None)
            if english_name is None:
                missing_name.append((row_id, current_name))
            elif row[idx_name] != english_name:
                row[idx_name] = english_name
                updated_name += 1
            else:
                unchanged_name += 1

        current_desc = row[idx_desc].strip()
        if current_desc:
            english_desc = DESC_MAP.get(current_desc, current_desc if not any("\u4e00" <= ch <= "\u9fff" for ch in current_desc) else None)
            if english_desc is None:
                missing_desc.append((row_id, current_desc))
            elif row[idx_desc] != english_desc:
                row[idx_desc] = english_desc
                updated_desc += 1
            else:
                unchanged_desc += 1

    remaining_cjk_name = []
    remaining_cjk_desc = []
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        if any("\u4e00" <= ch <= "\u9fff" for ch in row[idx_name]):
            remaining_cjk_name.append((row[idx_id], row[idx_name]))
        if any("\u4e00" <= ch <= "\u9fff" for ch in row[idx_desc]):
            remaining_cjk_desc.append((row[idx_id], row[idx_desc]))

    print(f"updated name: {updated_name}")
    print(f"unchanged name: {unchanged_name}")
    print(f"missing name mappings: {len(missing_name)}")
    for row_id, value in missing_name[:20]:
        print(f"  - row {row_id}: {value}")
    print(f"remaining CJK name rows: {len(remaining_cjk_name)}")
    for row_id, value in remaining_cjk_name[:20]:
        print(f"  - row {row_id}: {value}")

    print(f"updated desc: {updated_desc}")
    print(f"unchanged desc: {unchanged_desc}")
    print(f"missing desc mappings: {len(missing_desc)}")
    for row_id, value in missing_desc[:20]:
        print(f"  - row {row_id}: {value}")
    print(f"remaining CJK desc rows: {len(remaining_cjk_desc)}")
    for row_id, value in remaining_cjk_desc[:20]:
        print(f"  - row {row_id}: {value}")

    if dry_run:
        return

    target.write_text(dump_rows(rows), encoding="utf-8-sig")


def main() -> None:
    parser = argparse.ArgumentParser(description="Sync cross circus theme.csv names and desc to English")
    parser.add_argument("--target", type=Path, default=DEFAULT_TARGET, help="Target CSV path")
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()

    sync_file(args.target, args.dry_run)


if __name__ == "__main__":
    main()
