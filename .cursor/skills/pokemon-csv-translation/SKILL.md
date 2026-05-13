---
name: pokemon-csv-translation
description: Use this skill whenever the user asks to translate a Pokemon 2026 game config CSV from Chinese to English, for example "dịch giúp tôi file game_config/...csv".
paths:
  - GAME_DICTIONARY.md
  - DANH_SACH_CSV.md
  - game_config/auto_chess/key_words.csv
  - game_config/**/*.csv
---

# Pokemon CSV Translation Skill

Use this skill when translating one requested CSV file from Chinese to English for the Pokemon 2026 game project.

## Core References

- `GAME_DICTIONARY.md` is the source of truth for existing Chinese-to-English game terms.
- `DANH_SACH_CSV.md` tracks which CSV files have been translated.
- Existing translated content in `game_config/**/*.csv` is reusable context. Search for the same Chinese phrase or similar game text before choosing a new translation.
- If useful, compare with the matching file under `game_origin_config/` to understand the original meaning, but edit only the requested `game_config/...csv` file unless the user asks otherwise.

## Required Workflow

1. Confirm the requested file path and read it together with `GAME_DICTIONARY.md` and `DANH_SACH_CSV.md`. For auto chess text with `【…】`, also open `game_config/auto_chess/key_words.csv` for token mapping.
2. Inspect the CSV structure before editing:
   - Preserve row count, column count, delimiter, quotes, escapes, and line endings as much as practical.
   - Preserve escaped newline tokens exactly as data (for example `\n` must remain two characters `\` + `n` inside the cell). Never convert escaped `\n` into literal multi-line cell content.
   - Do not translate CSV metadata/header rows. Keep rows such as `变量名`, `默认值`, and the `ID,...` description row exactly as they are unless the user explicitly asks to translate headers.
   - Preserve IDs, variable names, enum keys, file paths, icon paths, numbers, formulas, placeholders, markup, color tags, braces, brackets, percent signs, and control tokens.
   - Translate only human-facing Chinese text. Do not translate technical identifiers unless the surrounding CSV clearly treats them as display text.
3. Translate into polished English with a game UI tone:
   - Prefer concise, natural wording suitable for menus, achievements, item names, skill descriptions, tutorials, rewards, and battle text.
   - Follow Pokemon franchise names and established game terms from `GAME_DICTIONARY.md`.
   - Keep terminology consistent with already translated files.
   - Keep placeholders in the same order and form, such as `%s`, `%d`, `{0}`, `{name}`, `$1`, `#C0x...#`, `<...>`, `[]`, `()`, `【...】`, and `\n`.
   - **Bracket keywords `【…】`:** For auto chess (and similar), each `【Chinese】` token must become the matching English token **still in full-width brackets**, e.g. `【流水】` → `【Flow】`. Look up the Chinese form in `game_config/auto_chess/key_words.csv` (`key` → `name`). If it is missing there, use `GAME_DICTIONARY.md` or add an explicit fallback in the translator script—do not drop the brackets.
4. After editing the CSV, review for untranslated Chinese characters. Any remaining Chinese must be intentional and explained to the user.
5. Identify new reusable terms found during translation:
   - Add important new Pokemon names, feature names, item names, attributes, status names, UI terms, and recurring phrases to `GAME_DICTIONARY.md`.
   - Add them to the most relevant existing section/table.
   - If no section fits, append a clearly named section such as `## Translation Additions` with columns matching the dictionary style.
   - Do not add one-off full sentences unless they are likely to recur.
6. Mark the requested path as translated in `DANH_SACH_CSV.md` by changing `- [ ]` to `- [x]`.
   - If the path is missing from the list, add it in the appropriate sorted/nearby location and mark it `[x]`.
7. Run an appropriate validation when practical:
   - Prefer a small Python CSV parse/check for structural integrity.
   - Check the edited file for remaining CJK characters.
   - For columns expected to stay single-line in source format, verify there are no literal newline characters inside translated cell values; escaped `\n` is allowed.
   - Use `ReadLints` only when linter diagnostics are relevant to edited source files.

## Translation Rules

- Use English output only in the CSV.
- Use title case for short names/titles when the surrounding file uses title case.
- Use sentence case for descriptions and tutorial text unless existing file style says otherwise.
- Keep Pokemon names in official English form.
- Translate Chinese punctuation to natural English punctuation where safe, but preserve punctuation that is part of placeholders or markup.
- Keep spacing readable around placeholders, numbers, percentages, and icons.
- Do not invent mechanics. If a Chinese term is ambiguous, infer from nearby rows, dictionary entries, and existing translations before editing.

## Completion Response

When finished, briefly tell the user:

- Which CSV was translated.
- Whether `GAME_DICTIONARY.md` was updated and with what kind of terms.
- That `DANH_SACH_CSV.md` was marked done.
- What validation was run, including any intentional Chinese left unchanged.
