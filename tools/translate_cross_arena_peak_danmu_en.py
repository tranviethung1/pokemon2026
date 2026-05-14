#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
import re
from pathlib import Path


TRANSLATIONS = {
    "1": {
        "str1": '#C0x5B545B#Welcome to the arena of Gigantamax Peak! I am Steven. The stage of Gigantamax Peak brings together elite contenders from every region, and they will define what it truly means to stand at the peak!',
    },
    "2": {
        "str1": '#C0x5B545B#This stage brings together Kings and Masters from multiple 【Cross-Server Arena】 brackets. It is truly the most prestigious top-tier tournament of them all!',
    },
    "3": {
        "str1": '#C0x5B545B#A clash of masters everywhere you look, where team composition and raw ability are pushed to their limits! What kind of sparks will fly?! Let us wait and see!',
    },
    "4": {
        "str1": '#C0x5B545B#Viewers at home and friends here at the venue, Gigantamax Peak is about to begin! I am Steven. Let us witness the birth of a new champion together!',
    },
    "5": {
        "str1": '#C0x5B545B#Fans here in the arena, welcome to the live stage of Gigantamax Peak! The air is already thick with adrenaline. A peak showdown is about to erupt. Are you ready?',
    },
    "6": {
        "str1": '#C0x5B545B#The lights are set, the applause is ready, and the war drums of Gigantamax Peak are about to sound! Every corner of the arena is filled with anticipation. Hold your breath with us and welcome this visual spectacle!',
    },
    "101": {
        "str1": '#C0x5B545B#We are bringing you live coverage of the Gigantamax Peak Points Match right here. Even outside the arena, you can feel the blazing spirit of the trainers and their Pokemon. Cheer loudly for their spectacular battles!',
    },
    "102": {
        "str1": '#C0x5B545B#Watching Pokemon fight with such brilliance is exactly what I hoped for. The beauty of Pokemon deserves to be seen by even more people!!!',
    },
    "103": {
        "str1": '#C0x5B545B#May every contestant show their unique charm. I believe the trainers on this stage can let their Pokemon tell the most moving stories~',
    },
    "104": {
        "str1": '#C0x5B545B#Water-type Pokemon really are the most elegant! The Water-type partners fighting here have earned Milotic\'s approval~',
    },
    "105": {
        "str1": '#C0xF76B45#{name1}#C0x5B545B#\'s Pokemon are using their graceful forms to put the perfect finishing touch on this battle! Elegance at its finest~',
    },
    "106": {
        "str1": '#C0xF76B45#{name1}#C0x5B545B# may look to be at a disadvantage, but those Pokemon have never lost their resolve. Show the whole arena the power of you and your Pokemon!',
    },
    "107": {
        "str1": '#C0xF76B45#{name1}#C0x5B545B# has pulled ahead of the other contenders on points. Audience, please give them a round of applause~',
    },
    "108": {
        "str1": '#C0xF76B45#{name1}#C0x5B545B#\'s Pokemon squad is brimming with fighting spirit. Can they take this round? Let us wait and see!',
    },
    "109": {
        "str1": '#C0x5B545B#What a gorgeous battle! After the match, #C0xF76B45#{name1}#C0x5B545B#, please allow me to invite you to the next Wallace Cup~',
    },
    "110": {
        "str1": '#C0xF76B45#{name1}#C0x5B545B#, your aura has changed. I can feel it. Relax and trust your partners.',
    },
    "111": {
        "str1": '#C0xF76B45#{name1}#C0x5B545B# and #C0xF76B45#{name2}#C0x5B545B# are both dazzling on this stage, but who is truly the more elegant battler? I will be waiting here in the arena to find out!',
    },
    "112": {
        "str1": '#C0xF76B45#{name1}#C0x5B545B# defeated #C0xF76B45#{name2}#C0x5B545B#. The winner should not grow arrogant. Keep up that fine form in the battles ahead~',
    },
    "113": {
        "str1": '#C0xF76B45#{name2}#C0x5B545B# fell to #C0xF76B45#{name1}#C0x5B545B#. The one who lost should not be discouraged. Shine brightly in the battles ahead~',
    },
    "114": {
        "str1": '#C0xF76B45#{name1}#C0x5B545B# and #C0xF76B45#{name2}#C0x5B545B# delivered an absolutely spectacular battle. Even Milotic wants to test itself against these two fierce rivals.',
    },
    "115": {
        "str1": '#C0x5B545B#Everyone! Please give your applause to #C0xF76B45#{name1}#C0x5B545B# and #C0xF76B45#{name2}#C0x5B545B#. Their battle deserves every bit of this praise.',
    },
    "201": {
        "str1": '#C0x5B545B#So many champions from different brackets have gathered here. It makes me want to jump into battle with them myself!! Cynthia, you feel it too, do you not??',
        "str2": '#C0x5B545B#Of course. Still, these days I am even more drawn to feeling the bond between trainers and their Pokemon. To reach this stage, they must truly love their partners~',
    },
    "202": {
        "str1": '#C0x5B545B#The road to the championship is incredibly tough! It takes unwavering and formidable willpower!',
        "str2": '#C0x5B545B#And absolute trust in your partner Pokemon as well~',
    },
    "203": {
        "str1": '#C0x5B545B#Cynthia, what do you think of this match?',
        "str2": '#C0x5B545B#I need a little more time to think. Both trainers and their Pokemon are very strong.',
    },
    "204": {
        "str1": '#C0x5B545B#Everyone! Choose the contestant you believe in and place your Prediction Coins!',
        "str2": '#C0x5B545B#It is a difficult choice between these two contestants. The Prediction Coins you place are your greatest show of support for them.',
    },
    "205": {
        "str1": '#C0x5B545B#Waiting for the match to start is the hardest part!! Cynthia, let us go have a battle!',
        "str2": '#C0x5B545B#We are here as hosts this time... We can spar after the matches.',
    },
    "206": {
        "str1": '#C0x5B545B#The crowd\'s cheers are getting my blood pumping too!',
        "str2": '#C0x5B545B#Yes, I can feel the audience\'s excitement as well. But do not forget to support the contestant you are rooting for~',
    },
    "207": {
        "str1": '#C0x5B545B#This match begins at 19:00! Once it starts, betting will be closed!!!',
        "str2": '#C0x5B545B#While you are still deciding, do not miss the window to make your prediction~',
    },
    "208": {
        "str1": '#C0x5B545B#I think #C0xF76B45#{name1}#C0x5B545B# has the better chance to win! I can feel that powerful resolve!',
        "str2": '#C0x5B545B#But #C0xF76B45#{name2}#C0x5B545B#\'s bond with their Pokemon is no less impressive. Their chances are strong too.',
    },
    "209": {
        "str1": '#C0xF76B45#{name1}#C0x5B545B# has some of the same spirit I had back then. I think they will win.',
        "str2": '#C0xF76B45#{name2}#C0x5B545B#\'s bond with their Pokemon is every bit as strong as mine. I think they will win.',
    },
    "210": {
        "str1": '#C0x5B545B#When the battle begins, I will be keeping a close eye on #C0xF76B45#{name1}#C0x5B545B#! If you win, come battle me next!',
        "str2": '#C0x5B545B#I will be watching #C0xF76B45#{name2}#C0x5B545B# more closely, to feel the connection between them and their Pokemon. There is a lot to learn from.',
    },
    "211": {
        "str1": '#C0x5B545B#I wonder how prepared #C0xF76B45#{name1}#C0x5B545B# and #C0xF76B45#{name2}#C0x5B545B# are.',
        "str2": '#C0x5B545B#No need to worry. #C0xF76B45#{name1}#C0x5B545B# and #C0xF76B45#{name2}#C0x5B545B# will surely bring their best form to face a powerful rival.',
    },
    "212": {
        "str1": '#C0x5B545B#Today\'s wind is perfect for a thrilling battle! The clash between #C0xF76B45#{name1}#C0x5B545B# and #C0xF76B45#{name2}#C0x5B545B#!',
        "str2": '#C0xF76B45#{name1}#C0x5B545B# and #C0xF76B45#{name2}#C0x5B545B# would surely agree.',
    },
    "301": {
        "str1": '#C0x5B545B#The battle is in full swing! Just watching it gets my blood racing!',
        "str2": '#C0x5B545B#Even I am getting nervous. I cannot tell which of the two will come out on top.',
    },
    "302": {
        "str1": '#C0xF76B45#{name1}#C0x5B545B#\'s team coordination is incredible! That strike looks so promising!',
        "str2": '#C0xF76B45#{name2}#C0x5B545B#\'s Pokemon still have plenty left in the tank. Their determined eyes show no sign of giving up. I believe in them!',
    },
    "303": {
        "str1": '#C0xF76B45#{name1}#C0x5B545B# and #C0xF76B45#{name2}#C0x5B545B# are putting on such a spectacular battle. It reminds me of that match I once had with Ash!',
        "str2": '#C0x5B545B#Indeed. #C0xF76B45#{name1}#C0x5B545B# and #C0xF76B45#{name2}#C0x5B545B# are timing their commands, offense, and defense with perfect precision~',
    },
}


def translate_file(path: Path, dry_run: bool) -> None:
    rows = list(csv.reader(path.read_text(encoding="utf-8-sig").splitlines()))
    header = rows[0]
    idx_id = header.index("变量名")
    idx_str2 = header.index("str2")
    idx_str1 = header.index("str1")

    updated = {"str1": 0, "str2": 0}
    missing: list[str] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        row_id = row[idx_id]
        mapping = TRANSLATIONS.get(row_id)
        if mapping is None:
            missing.append(row_id)
            continue

        for field, idx in (("str1", idx_str1), ("str2", idx_str2)):
            value = mapping.get(field)
            if value is None:
                continue
            if row[idx] != value:
                row[idx] = value
                updated[field] += 1

    remaining_cjk = []
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        for field, idx in (("str1", idx_str1), ("str2", idx_str2)):
            if re.search(r"[\u4e00-\u9fff]", row[idx]):
                remaining_cjk.append((row[idx_id], field, row[idx]))

    print(f"updated str1: {updated['str1']}")
    print(f"updated str2: {updated['str2']}")
    if missing:
        print("missing row ids:")
        for row_id in missing:
            print(f"  - {row_id}")
    print(f"remaining CJK rows: {len(remaining_cjk)}")
    for row_id, field, value in remaining_cjk[:10]:
        print(f"  - {row_id} {field}: {value}")

    if dry_run:
        return

    output = io.StringIO()
    writer = csv.writer(output, lineterminator="\n")
    writer.writerows(rows)
    path.write_text(output.getvalue(), encoding="utf-8-sig")


def main() -> None:
    parser = argparse.ArgumentParser(description="Translate cross arena peak danmu.csv to English")
    parser.add_argument(
        "--target",
        default="/home/hungtv/pokemon2026/game_config/cross/arena_peak/danmu.csv",
        help="Target CSV path",
    )
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()
    translate_file(Path(args.target), args.dry_run)


if __name__ == "__main__":
    main()
