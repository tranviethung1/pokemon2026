#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")
ALL_ATTR_RE = re.compile(r"^击杀者所在服务器玩家在竞标对战中全属性加成\+(\d+)%$")
RESOURCE_RE = re.compile(r"^击杀者所在服务器玩家的资源生产速度加成\+(\d+)%$")
PLUNDER_RE = re.compile(r"^击杀者所在服务器玩家在竞标对战中抢夺加成\+(\d+)%[，,]被抢夺损失-(\d+)%$")
ULTIMATE_RE = re.compile(
    r"^击杀者所在服务器玩家在竞标对战中全属性加成\+(\d+)%[，,]"
    r"抢夺加成\+(\d+)%[，,]被抢夺损失-(\d+)%[，,]资源生产速度加成\+(\d+)%$"
)

NAME_OVERRIDES = {
    "测试": "Test",
    "属性增强": "Status enhancement",
    "产出增加": "Product increase",
    "抢夺增加": "Plunder increase",
    "终极BUFF": "Ultimate BUFF",
}


def load_rows(path: Path, encoding: str) -> list[list[str]]:
    text = path.read_bytes().decode(encoding)
    return list(csv.reader(text.splitlines()))


def dump_rows(rows: list[list[str]]) -> str:
    output = io.StringIO()
    writer = csv.writer(output, lineterminator="\r\n")
    writer.writerows(rows)
    return output.getvalue()


def load_dictionary_md(path: Path) -> dict[str, str]:
    cn2en: dict[str, str] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line.startswith("|") or ":---" in line:
            continue

        parts = [part.strip() for part in line.split("|")]
        parts = [part for part in parts if part]

        if len(parts) >= 4 and CJK_RE.search(parts[0]) and not CJK_RE.search(parts[2]):
            cn2en.setdefault(parts[0], parts[2])
            continue

        if len(parts) >= 3 and CJK_RE.search(parts[0]) and not CJK_RE.search(parts[1]):
            cn2en.setdefault(parts[0], parts[1])
            continue

        if len(parts) >= 3 and parts[0].isdigit() and CJK_RE.search(parts[1]) and not CJK_RE.search(parts[2]):
            cn2en.setdefault(parts[1], parts[2])

    return cn2en


def translate_name(text: str, dictionary: dict[str, str]) -> str:
    text = text.strip()
    if not text:
        return ""
    return NAME_OVERRIDES.get(text) or dictionary.get(text, "")


def translate_desc(text: str, dictionary: dict[str, str]) -> str:
    text = text.strip()
    if not text:
        return ""

    if text == "测试":
        return "Test"

    if text in dictionary:
        return dictionary[text]

    if match := ALL_ATTR_RE.fullmatch(text):
        pct = match.group(1)
        return f"Players on the killer's server gain +{pct}% to all attributes in bid battles."

    if match := RESOURCE_RE.fullmatch(text):
        pct = match.group(1)
        return f"Players on the killer's server gain +{pct}% resource production speed."

    if match := PLUNDER_RE.fullmatch(text):
        gain_pct, loss_pct = match.groups()
        return (
            f"Players on the killer's server gain +{gain_pct}% plunder bonus "
            f"and lose {loss_pct}% less when plundered in bid battles."
        )

    if match := ULTIMATE_RE.fullmatch(text):
        attr_pct, plunder_pct, loss_pct, resource_pct = match.groups()
        return (
            f"Players on the killer's server gain +{attr_pct}% to all attributes, "
            f"+{plunder_pct}% plunder bonus, lose {loss_pct}% less when plundered, "
            f"and +{resource_pct}% resource production speed in bid battles."
        )

    return ""


def sync_file(
    target: Path,
    encoding: str,
    dictionary_path: Path,
    dry_run: bool,
    sync_source_columns: bool,
) -> None:
    rows = load_rows(target, encoding)
    dictionary = load_dictionary_md(dictionary_path)

    header = rows[0]
    idx_id = header.index("变量名")
    idx_name = header.index("buffName")
    idx_name_en = header.index("buffName_en")
    idx_desc = header.index("buffDesc")
    idx_desc_en = header.index("buffDesc_en")

    updated_name = 0
    updated_desc = 0
    updated_source_name = 0
    updated_source_desc = 0
    missing_name: list[str] = []
    missing_desc: list[str] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        row_id = row[idx_id].strip()
        if not row_id:
            continue

        translated_name = translate_name(row[idx_name], dictionary)
        if translated_name:
            if sync_source_columns and row[idx_name] != translated_name:
                row[idx_name] = translated_name
                updated_source_name += 1
            if row[idx_name_en] != translated_name:
                row[idx_name_en] = translated_name
                updated_name += 1
        elif row[idx_name].strip():
            missing_name.append(row_id)

        translated_desc = translate_desc(row[idx_desc], dictionary)
        if translated_desc:
            if sync_source_columns and row[idx_desc] != translated_desc:
                row[idx_desc] = translated_desc
                updated_source_desc += 1
            if row[idx_desc_en] != translated_desc:
                row[idx_desc_en] = translated_desc
                updated_desc += 1
        elif row[idx_desc].strip():
            missing_desc.append(row_id)

    remaining_blank_name = []
    remaining_blank_desc = []
    remaining_cjk_name = []
    remaining_cjk_desc = []
    remaining_blank_source_name = []
    remaining_blank_source_desc = []
    remaining_cjk_source_name = []
    remaining_cjk_source_desc = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        row_id = row[idx_id].strip()
        if not row_id:
            continue

        name_en = row[idx_name_en].strip()
        desc_en = row[idx_desc_en].strip()
        source_name = row[idx_name].strip()
        source_desc = row[idx_desc].strip()

        if not name_en:
            remaining_blank_name.append(row_id)
        if not desc_en:
            remaining_blank_desc.append(row_id)
        if CJK_RE.search(name_en):
            remaining_cjk_name.append(row_id)
        if CJK_RE.search(desc_en):
            remaining_cjk_desc.append(row_id)
        if not source_name:
            remaining_blank_source_name.append(row_id)
        if not source_desc:
            remaining_blank_source_desc.append(row_id)
        if CJK_RE.search(source_name):
            remaining_cjk_source_name.append(row_id)
        if CJK_RE.search(source_desc):
            remaining_cjk_source_desc.append(row_id)

    print(f"buffName updated: {updated_source_name}")
    print(f"buffDesc updated: {updated_source_desc}")
    print(f"buffName_en updated: {updated_name}")
    print(f"buffDesc_en updated: {updated_desc}")
    print(f"missing name translations: {missing_name}")
    print(f"missing desc translations: {missing_desc}")
    print(f"remaining blank buffName rows: {remaining_blank_source_name}")
    print(f"remaining blank buffDesc rows: {remaining_blank_source_desc}")
    print(f"remaining CJK buffName rows: {remaining_cjk_source_name}")
    print(f"remaining CJK buffDesc rows: {remaining_cjk_source_desc}")
    print(f"remaining blank buffName_en rows: {remaining_blank_name}")
    print(f"remaining blank buffDesc_en rows: {remaining_blank_desc}")
    print(f"remaining CJK buffName_en rows: {remaining_cjk_name}")
    print(f"remaining CJK buffDesc_en rows: {remaining_cjk_desc}")

    if dry_run:
        return

    target.write_bytes(dump_rows(rows).encode(encoding))


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Fill English buff names and descriptions for cross mine boss.csv."
    )
    parser.add_argument(
        "--target",
        type=Path,
        default=Path("game_config/cross/mine/boss.csv"),
        help="Target CSV path",
    )
    parser.add_argument(
        "--dictionary",
        type=Path,
        default=Path("GAME_DICTIONARY.md"),
        help="Shared dictionary markdown path",
    )
    parser.add_argument(
        "--encoding",
        default="gb18030",
        help="CSV encoding used for reading and writing",
    )
    parser.add_argument(
        "--sync-source-columns",
        action="store_true",
        help="Also overwrite buffName and buffDesc with the English translations",
    )
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()

    sync_file(
        args.target,
        args.encoding,
        args.dictionary,
        args.dry_run,
        args.sync_source_columns,
    )


if __name__ == "__main__":
    main()
