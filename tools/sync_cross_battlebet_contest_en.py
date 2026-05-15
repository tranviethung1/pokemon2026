#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
from pathlib import Path


ROOT = Path("/home/hungtv/pokemon2026")
DEFAULT_TARGET = ROOT / "game_config/cross/battlebet/contest.csv"

CONTEST_NAME_MAP = {
    "小组赛A1": "Group Stage A1",
    "小组赛A2": "Group Stage A2",
    "小组赛B1": "Group Stage B1",
    "小组赛B2": "Group Stage B2",
    "小组赛C1": "Group Stage C1",
    "小组赛C2": "Group Stage C2",
    "小组赛D1": "Group Stage D1",
    "小组赛D2": "Group Stage D2",
    "小组赛A3": "Group Stage A3",
    "小组赛A4": "Group Stage A4",
    "小组赛B3": "Group Stage B3",
    "小组赛B4": "Group Stage B4",
    "小组赛C3": "Group Stage C3",
    "小组赛C4": "Group Stage C4",
    "小组赛D3": "Group Stage D3",
    "小组赛D4": "Group Stage D4",
    "小组赛A5": "Group Stage A5",
    "小组赛A6": "Group Stage A6",
    "小组赛B5": "Group Stage B5",
    "小组赛B6": "Group Stage B6",
    "小组赛C5": "Group Stage C5",
    "小组赛C6": "Group Stage C6",
    "小组赛D5": "Group Stage D5",
    "小组赛D6": "Group Stage D6",
    "四强赛1": "Top 4 Match 1",
    "四强赛2": "Top 4 Match 2",
    "四强赛3": "Top 4 Match 3",
    "四强赛4": "Top 4 Match 4",
    "半决赛1": "Semifinal 1",
    "半决赛2": "Semifinal 2",
    "季军赛": "Third-Place Match",
    "冠军赛": "Championship Match",
}

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
    idx_contest = header.index("contestName")
    idx_weather = header.index("weatherDetail")

    updated_contest = 0
    unchanged_contest = 0
    missing_contest: list[tuple[str, str]] = []
    updated_weather = 0
    unchanged_weather = 0
    missing_weather: list[tuple[str, str]] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        row_id = row[idx_id].strip()
        if not row_id:
            continue

        current_contest = row[idx_contest]
        if current_contest:
            english_contest = CONTEST_NAME_MAP.get(current_contest)
            if not english_contest:
                if not any("\u4e00" <= ch <= "\u9fff" for ch in current_contest):
                    unchanged_contest += 1
                else:
                    missing_contest.append((row_id, current_contest))
            elif row[idx_contest] != english_contest:
                row[idx_contest] = english_contest
                updated_contest += 1
            else:
                unchanged_contest += 1

        current_weather = row[idx_weather]
        if current_weather:
            english_weather = WEATHER_MAP.get(current_weather)
            if not english_weather:
                if not any("\u4e00" <= ch <= "\u9fff" for ch in current_weather):
                    unchanged_weather += 1
                else:
                    missing_weather.append((row_id, current_weather))
            elif row[idx_weather] != english_weather:
                row[idx_weather] = english_weather
                updated_weather += 1
            else:
                unchanged_weather += 1

    remaining_cjk_contest = []
    remaining_cjk_weather = []
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        contest_value = row[idx_contest]
        weather_value = row[idx_weather]
        if any("\u4e00" <= ch <= "\u9fff" for ch in contest_value):
            remaining_cjk_contest.append((row[idx_id], contest_value))
        if any("\u4e00" <= ch <= "\u9fff" for ch in weather_value):
            remaining_cjk_weather.append((row[idx_id], weather_value))

    print(f"updated contestName: {updated_contest}")
    print(f"unchanged contestName: {unchanged_contest}")
    print(f"missing contestName mappings: {len(missing_contest)}")
    for row_id, value in missing_contest[:20]:
        print(f"  - row {row_id}: {value}")
    print(f"remaining CJK contestName rows: {len(remaining_cjk_contest)}")
    for row_id, value in remaining_cjk_contest[:20]:
        print(f"  - row {row_id}: {value}")

    print(f"updated weatherDetail: {updated_weather}")
    print(f"unchanged weatherDetail: {unchanged_weather}")
    print(f"missing weatherDetail mappings: {len(missing_weather)}")
    for row_id, value in missing_weather[:20]:
        print(f"  - row {row_id}: {value}")
    print(f"remaining CJK weatherDetail rows: {len(remaining_cjk_weather)}")
    for row_id, value in remaining_cjk_weather[:20]:
        print(f"  - row {row_id}: {value}")

    if dry_run:
        return

    target.write_text(dump_rows(rows), encoding="utf-8-sig")


def main() -> None:
    parser = argparse.ArgumentParser(description="Sync cross battlebet/contestbet contest.csv text columns to English")
    parser.add_argument("--target", type=Path, default=DEFAULT_TARGET, help="Target CSV path")
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()

    sync_file(args.target, args.dry_run)


if __name__ == "__main__":
    main()
