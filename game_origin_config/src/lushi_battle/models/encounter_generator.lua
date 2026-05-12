require("lushi_battle.models.encounter_battle")
require("lushi_battle.models.encounter_shop")
require("lushi_battle.models.encounter_enhance")
require("lushi_battle.models.encounter_story")
require("lushi_battle.models.encounter_pvp")

slot0 = lushi.EncounterShowNum
slot1 = class("ChessEncounterDataModel")
AutoChessBattle.ChessEncounterDataModel = slot1

function slot1.ctor(slot0, slot1, slot2, slot3)
	slot0.scene = slot1
	slot0._chapters = slot2
	slot0._cards = slot3
	slot0._factory = nil
	slot0._shopItemsRecords = {}
	slot0._chapterIdx = 1
	slot0._encounters = {}
	slot0._processed = {}
	slot0._completed = {}
	slot0._tempHide = {}
	slot0._queue = {}
	slot0._extraQueue = {}
	slot0._chapterCount = {}
	slot0._totalCount = {}
	slot0.isFake = false
end

function slot1.chapter(slot0)
	return slot0._chapters[slot0._chapterIdx]
end

function slot1.encounter(slot0, slot1)
	return slot0._encounters[slot1]
end

function slot1.nextChapter(slot0)
	slot0._chapterIdx = slot0._chapterIdx + 1
	slot0._factory = nil
end

function slot1.passedChapterCount(slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0._chapters) do
		if slot5 == slot0._chapterIdx then
			break
		end

		if not csv.auto_chess.chapter[slot6].fake then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

function slot1.getExtraQueueLen(slot0)
	slot1 = 0

	if slot0._extraQueue[slot0._chapterIdx] then
		slot1 = table.length(slot0._extraQueue[slot0._chapterIdx])
	end

	return slot1
end

function slot1.isChapterOver(slot0, slot1)
	if next(slot0._encounters) then
		return false
	end

	return table.length(slot0._queue) + slot0:getExtraQueueLen() + table.length(slot0._tempHide) == 0
end

function slot1.isAllChapterOver(slot0)
	return slot0:chapter() == nil
end

function slot2(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0) do
		table.insert(slot1, {
			slot6,
			slot5
		})
	end

	if table.length(slot1) > 0 then
		slot3, slot4 = unpack(slot1[ymrand.random(1, table.length(slot1))])

		table.remove(slot0, slot4)

		return slot3
	end
end

function slot1.randomWeightPool(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		if (slot0._chapterCount[slot7] or 0) < csv.auto_chess.encounter[slot7].chapterLimit and (slot0._totalCount[slot7] or 0) < slot8.totalLimit then
			table.insert(slot2, {
				id = slot7,
				weight = slot8.weight
			})
		end
	end

	slot3 = {}

	for slot7, slot8 in ipairs(slot2) do
		slot3[slot7] = (slot3[slot7 - 1] or 0) + slot8.weight
	end

	slot4 = table.length(slot2)
	slot9 = 1

	for slot9 = 1, slot4 do
		if ymrand.random(1, math.max(slot3[slot4], slot9)) <= slot3[slot9] then
			slot0._chapterCount[slot10] = slot0._chapterCount[slot2[slot9].id] or 0
			slot0._totalCount[slot10] = slot0._totalCount[slot10] or 0
			slot0._chapterCount[slot10] = slot0._chapterCount[slot10] + 1
			slot0._totalCount[slot10] = slot0._totalCount[slot10] + 1

			return slot10
		end
	end
end

function slot1.initChapterEncounter(slot0)
	for slot4, slot5 in pairs(slot0._encounters) do
		slot5:complete()
	end

	slot0._tempHide = {}
	slot0._chapterCount = {}
	slot1 = csv.auto_chess.chapter[slot0:chapter()]
	slot0.isFake = slot1.fake
	slot2 = {}

	for slot9, slot10 in ipairs(csvClone(slot1.must)) do
		slot11 = nil
		slot11 = (slot10 ~= 0 or slot0:randomWeightPool(csvClone(slot1.random)[0 + 1])) and slot10

		assert(slot11, string.format("ChessEncounterDataModel no encounter random, pos %d", slot9))
		table.insert(slot2, slot11)
	end

	slot0._queue = slot2
	slot0._encounters = {}
	uv7 = "pairs"

	for slot9 = 1, slot7 do
		if slot0:getNextEncounterID() then
			table.insert(slot0._encounters, slot0:newEncounter(slot10, slot9))
		end
	end

	slot0._processed = {}

	if slot1.chooseSkill then
		slot0.scene.trainer[1]:findSkill()
	end

	if slot1.bg and slot1.bg ~= "" then
		gRootViewProxy:proxy():changeMainBg(slot1.bg)
	end
end

function slot1.getNextEncounterID(slot0)
	slot3 = nil

	if slot0:getExtraQueueLen() > 0 then
		if table.length(slot0._queue) <= 1 then
			uv4 = "table"
			slot3 = slot4(slot0._extraQueue[slot0._chapterIdx])
		elseif ymrand.random(1, 2) == 1 then
			uv5 = "table"
			slot3 = slot5(slot0._extraQueue[slot0._chapterIdx])
		end
	end

	if not slot3 and slot0._queue[1] then
		slot3 = slot0._queue[1]

		table.remove(slot0._queue, 1)
	end

	return slot3
end

function slot3(slot0)
	return csv.auto_chess.encounter[slot0].type == lushi.EncounterType.battle and slot1.battleType == 3
end

function slot1.completeEncounter(slot0, slot1)
	slot2 = slot0._encounters[slot1]
	slot3 = slot2.id
	slot0._encounters[slot1] = nil

	table.insert(slot0._processed, slot3)
	table.insert(slot0._completed, slot2)

	if csv.auto_chess.chapter[slot0:chapter()].jump == slot3 or slot0:isChapterOver(slot4) then
		slot0:nextChapter()

		if slot0:isAllChapterOver() then
			slot0._encounters = {}
			slot0._processed = {}

			return
		end

		slot0:initChapterEncounter()

		return
	end

	if not slot2.nextEncounterID then
		uv6 = "_encounters"

		if slot6(slot3) and slot4.jump then
			slot5 = slot4.jump
		end
	end

	if not slot5 and table.length(slot0._tempHide) > 0 then
		slot0._encounters[slot1] = table.remove(slot0._tempHide, 1)

		slot0._encounters[slot1]:awakeFromHide(slot1)

		return
	end

	if slot5 or slot0:getNextEncounterID() then
		slot0._encounters[slot1] = slot0:newEncounter(slot5, slot1)
	end
end

function slot1.getLeftEncounterNum(slot0)
	return table.length(slot0._queue) + table.length(slot0._tempHide)
end

function slot1.tempHideEncounter(slot0, slot1)
	slot2 = slot0._encounters[slot1]
	slot3 = slot2.id
	slot0._encounters[slot1] = nil

	table.insert(slot0._tempHide, slot2)

	slot0._encounters[slot1] = slot0:newEncounter(slot2.tempHideEncounterID, slot1)
end

slot4 = {
	[lushi.EncounterType.battle] = AutoChessBattle.AutoChessEncounterBattle,
	[lushi.EncounterType.shop] = AutoChessBattle.AutoChessEncounterShop,
	[lushi.EncounterType.story] = AutoChessBattle.AutoChessEncounterStory,
	[lushi.EncounterType.enhance] = AutoChessBattle.AutoChessEncounterEnhance,
	[lushi.EncounterType.pvp] = AutoChessBattle.AutoChessEncounterPVP
}

function slot1.newEncounter(slot0, slot1, slot2)
	slot4 = nil

	if csv.auto_chess.encounter[slot1].type == 2 then
		uv5 = "csv"
		slot4 = slot5[slot3.type].new(slot1, slot0.scene, slot0._cards, slot0._shopItemsRecords)
	else
		uv5 = "csv"
		slot4 = slot5[slot3.type].new(slot1, slot0.scene)
	end

	slot4:init(slot2)

	return slot4
end

function slot1.getCompletedBattles(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0._completed) do
		if csv.auto_chess.encounter[slot6.id].type == lushi.EncounterType.battle then
			table.insert(slot1, {
				id = slot6.id,
				sid = slot6.sid,
				result = slot6.result
			})
		end
	end

	return slot1
end

function slot1.getCompletedStorys(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0._completed) do
		if csv.auto_chess.encounter[slot6.id].type == lushi.EncounterType.story and slot6.choice then
			table.insert(slot1, {
				id = slot6.id,
				sid = slot6.sid,
				choice = slot6.choice
			})
		end
	end

	return slot1
end

function slot1.getShopBuyCount(slot0)
	slot1 = 0

	for slot6, slot7 in ipairs(slot0._completed) do
		function ()
			error("Decompilation failed")
			-- Exception in function building!
			-- Traceback (most recent call last):
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
			--     return _build_function_definition(prototype, state.header)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
			--     node.statements.contents = _build_function_blocks(state, instructions)
			--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
			--     statement, line_marked_elements = _build_statement(state, addr, instruction)
			--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
			--     return _build_var_assignment(state, addr, instruction)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
			--     assn = func(*args, **kwargs)
			--            ^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
			--     expression = _build_const_expression(state, addr, instruction)
			--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
			--     return _build_numeric_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
			--     number = state.constants.numeric_constants[index]
			--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end(slot7)
	end

	for slot6, slot7 in pairs(slot0._encounters) do
		slot2(slot7)
	end

	return slot1
end

function slot1.getEnhanceCounts(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0._completed) do
		if csv.auto_chess.encounter[slot6.id].type == lushi.EncounterType.enhance then
			if not slot1[csv.auto_chess.choose[slot6.sid].type] then
				slot1[slot9] = 0
			end

			slot1[slot9] = slot1[slot9] + slot6.useCount
		end
	end

	return slot1
end

function slot1.insertEncounter(slot0, slot1, slot2)
	slot2 = slot2 or 1
	slot3 = table.length(slot0._chapters)
	slot4 = slot0._chapterIdx

	if not slot0._extraQueue[(slot2 ~= 0 or ymrand.random(slot0._chapterIdx, slot3)) and math.min(slot0._chapterIdx + slot2 - 1, slot3)] then
		slot0._extraQueue[slot4] = {}
	end

	table.insert(slot0._extraQueue[slot4], slot1)
end
