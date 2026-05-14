#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
from pathlib import Path


ROOT = Path("/home/hungtv/pokemon2026")
DEFAULT_TARGET = ROOT / "game_config/cross/battlebet/contest.csv"

WEATHER_MAP = {
    "据宝可梦气象台预报，第1回合至第3回合有雪，第5回合至第6回合有雨\\n\\n【雨天】（水系精灵速度提升，火系精灵伤害降低，每个大回合结束时驱散全体精灵一部分负面效果）\\n【雪天】（冰系精灵双防提升，所有非冰系精灵每个大回合结束时受到一定冰元素伤害，并有几率被【冰冻】）\\n\\n#C0xDCDCDC#              天有不测风云，预报结果仅供参考#C0x5B545B#\\n#F10# \\n#F40#": "According to the Pokemon Weather Observatory forecast, snow will fall from Round 1 to Round 3, and rain will arrive from Round 5 to Round 6\\n\\n【Rainy】(Water-type Pokemon gain Speed, Fire-type Pokemon deal reduced damage, and at the end of each major round part of all Pokemon's negative effects are dispelled)\\n【Snowy】(Ice-type Pokemon gain P.DEF and S.DEF, while all non-Ice-type Pokemon take a certain amount of Ice damage at the end of each major round and may be 【Frozen】)\\n\\n#C0xDCDCDC#              Weather can be unpredictable. Forecast results are for reference only.#C0x5B545B#\\n#F10# \\n#F40#",
    "据宝可梦气象台预报，今日风和日丽，万里无云，是个对战的好天气\\n\\n#C0xDCDCDC#              天有不测风云，预报结果仅供参考#C0x5B545B#\\n#F10# \\n#F40#": "According to the Pokemon Weather Observatory forecast, today's weather is bright and clear with not a cloud in sight. A fine day for battle.\\n\\n#C0xDCDCDC#              Weather can be unpredictable. Forecast results are for reference only.#C0x5B545B#\\n#F10# \\n#F40#",
    "据宝可梦气象台预报，第3回合至第8回合有雪，气温下降，注意防寒~\\n\\n【雪天】（冰系精灵双防提升，所有非冰系精灵每个大回合结束时受到一定冰元素伤害，并有几率被【冰冻】）\\n\\n#C0xDCDCDC#              天有不测风云，预报结果仅供参考#C0x5B545B#\\n#F10# \\n#F40#": "According to the Pokemon Weather Observatory forecast, snow will fall from Round 3 to Round 8. Temperatures are dropping, so stay warm~\\n\\n【Snowy】(Ice-type Pokemon gain P.DEF and S.DEF, while all non-Ice-type Pokemon take a certain amount of Ice damage at the end of each major round and may be 【Frozen】)\\n\\n#C0xDCDCDC#              Weather can be unpredictable. Forecast results are for reference only.#C0x5B545B#\\n#F10# \\n#F40#",
    "据宝可梦气象台预报，第1回合至第3回合有雪，第4回合至第6回合有雨\\n\\n【雨天】（水系精灵速度提升，火系精灵伤害降低，每个大回合结束时驱散全体精灵一部分负面效果）\\n【雪天】（冰系精灵双防提升，所有非冰系精灵每个大回合结束时受到一定冰元素伤害，并有几率被【冰冻】）\\n\\n#C0xDCDCDC#              天有不测风云，预报结果仅供参考#C0x5B545B#\\n#F10# \\n#F40#": "According to the Pokemon Weather Observatory forecast, snow will fall from Round 1 to Round 3, and rain will arrive from Round 4 to Round 6\\n\\n【Rainy】(Water-type Pokemon gain Speed, Fire-type Pokemon deal reduced damage, and at the end of each major round part of all Pokemon's negative effects are dispelled)\\n【Snowy】(Ice-type Pokemon gain P.DEF and S.DEF, while all non-Ice-type Pokemon take a certain amount of Ice damage at the end of each major round and may be 【Frozen】)\\n\\n#C0xDCDCDC#              Weather can be unpredictable. Forecast results are for reference only.#C0x5B545B#\\n#F10# \\n#F40#",
    "据宝可梦气象台预报，比赛期间持续降雨\\n\\n【雨天】（水系精灵速度提升，火系精灵伤害降低，每个大回合结束时驱散全体精灵一部分负面效果）\\n\\n#C0xDCDCDC#              天有不测风云，预报结果仅供参考#C0x5B545B#\\n#F10# \\n#F40#": "According to the Pokemon Weather Observatory forecast, rain will continue throughout the match\\n\\n【Rainy】(Water-type Pokemon gain Speed, Fire-type Pokemon deal reduced damage, and at the end of each major round part of all Pokemon's negative effects are dispelled)\\n\\n#C0xDCDCDC#              Weather can be unpredictable. Forecast results are for reference only.#C0x5B545B#\\n#F10# \\n#F40#",
    "据宝可梦气象台预报，大雾黄色预警，能见度小于500米，出行注意安全，保持间距~\\n\\n【雾天】（全体降低大量命中率）\\n\\n#C0xDCDCDC#              天有不测风云，预报结果仅供参考#C0x5B545B#\\n#F10# \\n#F40#": "According to the Pokemon Weather Observatory forecast, a yellow fog warning is in effect. Visibility is below 500 meters, so travel carefully and keep your distance~\\n\\n【Foggy】(All Pokemon suffer a large Accuracy reduction)\\n\\n#C0xDCDCDC#              Weather can be unpredictable. Forecast results are for reference only.#C0x5B545B#\\n#F10# \\n#F40#",
    "据宝可梦气象台预报，比赛期间多雷雨，莫说大话，谨防雷击\\n\\n【雷雨】（电系技能伤害提升，每个大回合结束时降下落雷砸向场上随机一个目标，造成大量伤害（电系精灵有几率吸收该伤害），非电系精灵有几率被【麻痹】）\\n\\n#C0xDCDCDC#              天有不测风云，预报结果仅供参考#C0x5B545B#\\n#F10# \\n#F40#": "According to the Pokemon Weather Observatory forecast, thunderstorms will be frequent throughout the match. Don't get cocky, and beware of lightning strikes\\n\\n【Thunderstorm】(Electric-type skill damage is increased. At the end of each major round, lightning strikes a random target on the field and deals heavy damage. Electric-type Pokemon have a chance to absorb this damage, while non-Electric-type Pokemon may be inflicted with 【Paralysis】)\\n\\n#C0xDCDCDC#              Weather can be unpredictable. Forecast results are for reference only.#C0x5B545B#\\n#F10# \\n#F40#",
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
    idx_weather = header.index("weatherDetail")

    updated = 0
    unchanged = 0
    missing: list[tuple[str, str]] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        row_id = row[idx_id].strip()
        current = row[idx_weather]
        if not row_id or not current:
            continue

        english = WEATHER_MAP.get(current)
        if not english:
            if not any("\u4e00" <= ch <= "\u9fff" for ch in current):
                unchanged += 1
                continue
            missing.append((row_id, current))
            continue

        if row[idx_weather] != english:
            row[idx_weather] = english
            updated += 1
        else:
            unchanged += 1

    remaining_cjk = []
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        value = row[idx_weather]
        if any("\u4e00" <= ch <= "\u9fff" for ch in value):
            remaining_cjk.append((row[idx_id], value))

    print(f"updated weatherDetail: {updated}")
    print(f"unchanged weatherDetail: {unchanged}")
    print(f"missing mappings: {len(missing)}")
    for row_id, value in missing[:20]:
        print(f"  - row {row_id}: {value}")
    print(f"remaining CJK rows: {len(remaining_cjk)}")
    for row_id, value in remaining_cjk[:20]:
        print(f"  - row {row_id}: {value}")

    if dry_run:
        return

    target.write_text(dump_rows(rows), encoding="utf-8-sig")


def main() -> None:
    parser = argparse.ArgumentParser(description="Sync cross battlebet contest.csv weatherDetail to English")
    parser.add_argument("--target", type=Path, default=DEFAULT_TARGET, help="Target CSV path")
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()

    sync_file(args.target, args.dry_run)


if __name__ == "__main__":
    main()
