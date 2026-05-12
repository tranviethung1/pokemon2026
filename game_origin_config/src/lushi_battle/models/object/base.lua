slot0 = class("AutoChessObjectBaseModel")
AutoChessBattle.ObjectBaseModel = slot0

function slot0.ctor(slot0, slot1)
	slot0.scene = slot1
	slot0.buffs = CMap.new(AutoChessBattle.AutoChessBuffModel.BuffCmp)
	slot0.buffOverlayCount = {}
	slot0.recordBuffDataTb = {}
	slot0.extraRecord = BattleExRecord.new()
	slot0.exRecordNameTb = {}

	battleComponents.bind(slot0, "Event")
	slot0:setListenerComparer(AutoChessBattle.AutoChessBuffModel.BuffCmp)
	AutoChessEasy.registImmune(slot0)
end

function slot0.reset(slot0)
	for slot4, slot5 in slot0.buffs:order_pairs() do
		slot5:overClean()
	end

	slot0.buffs:clear(AutoChessBattle.AutoChessBuffModel.BuffCmp)

	slot0.buffOverlayCount = {}
	slot0.extraRecord = BattleExRecord.new()
	slot0.exRecordNameTb = {}
end

function slot0.damageFinal(slot0, slot1)
	return slot1
end

function slot0.iterBuffs(slot0)
	return slot0.buffs:order_pairs()
end

function slot0.getBuff(slot0, slot1)
	for slot5, slot6 in slot0.buffs:order_pairs() do
		if slot6.cfgId == slot1 then
			return slot6
		end
	end
end

function slot0.hasBuff(slot0, slot1)
	return slot0:getBuff(slot1) ~= nil
end

function slot0.hasBuffGroup(slot0, slot1)
	for slot5, slot6 in slot0.buffs:order_pairs() do
		if itertools.include(slot6:group(), slot1) then
			return true
		end
	end
end

function slot0.getBuffOverlayCount(slot0, slot1)
	if not slot0:getBuff(slot1) then
		return 0
	end

	return slot2:getOverLayCount()
end

function slot0.triggerBuffOnPoint(slot0, slot1, slot2)
	if not slot0.components_.Event then
		printWarn("add buff to deleted obj id:%s unitID:%s triggerPoint:%s", slot0.id, slot0.unitID, slot1)

		return
	end

	if slot0.components_.Event.listeners_[slot1] then
		slot3.array = nil
	end

	slot0:dispatchEvent(slot1, slot2)
end

function slot1()
	return {
		order = CVector.new(),
		list = CVector.new(),
		__bindKeys = {},
		__globals = {},
		__filters = {}
	}
end

function slot0.addOverlaySpecBuff(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot1.csvCfg.easyEffectFunc
	slot6 = lushi.OverlaySpecBuffCfg[slot5]
	slot7 = slot0.recordBuffDataTb

	if not slot0.recordBuffDataTb[slot5] then
		uv8 = "csvCfg"
		slot8 = slot8()
	end

	slot7[slot5] = slot8
	slot7 = slot0.recordBuffDataTb[slot5]

	if not slot2 then
		errorInWindows("addOverlaySpecBuff must need refresh")
	end

	slot8 = slot7.list:size() + 1

	for slot12, slot13 in slot7.list:ipairs() do
		if slot13.id == slot1.id then
			slot8 = slot12

			break
		end
	end

	if slot6.overlayType == lushi.BuffEffectOverlayType.Normal then
		if slot6.overlayLimit < slot8 then
			slot1:overClean()

			return
		end
	elseif slot6.overlayType == lushi.BuffEffectOverlayType.PopTop then
		if slot6.overlayLimit < slot8 then
			if slot0.buffs:find(slot7.list:pop_front().id) then
				slot10:overClean()
			end

			slot8 = slot8 - 1
		end
	elseif slot6.overlayType == lushi.BuffEffectOverlayType.SameMode then
		slot10 = nil

		for slot14, slot15 in slot7.list:ipairs() do
			if slot15.mode == slot1.mode then
				slot9 = 0 + 1
				slot10 = slot15.id
			end
		end

		if slot6.overlayLimit < slot9 + 1 then
			if slot0.buffs:find(slot10) then
				slot11:overClean()
			end

			slot8 = slot7.list:size() + 1
		end
	end

	if not slot7.list:at(slot8) then
		slot9 = slot4 and slot4.new() or AutoChessBattle.BuffEfffectBase.new()

		slot9:init(slot1, slot7)
		slot7.list:push_back(slot9)
	end

	slot2(slot7.list:at(slot8))

	if slot3 and slot8 > 1 and slot7.list:size() == slot8 then
		slot7.list:sort(slot3)
	end

	slot0:refreshOverlaySpecBuffOrder(slot5)

	slot1.effectBuffData = slot7.list:at(slot8)
end

function slot0.refreshOverlaySpecBuffOrder(slot0, slot1)
	for slot6, slot7 in ipairs(type(slot1) == "string" and {
		slot1
	} or slot1) do
		slot8 = slot0.recordBuffDataTb[slot7]
		slot9 = nil

		slot8.order:clear()

		for slot13, slot14 in slot8.list:ipairs() do
			slot9 = true

			for slot18, slot19 in ipairs(slot8.__filters) do
				if slot19(slot14) then
					slot9 = false

					break
				end
			end

			if slot9 then
				slot8.order:push_back(slot13)
			end
		end
	end
end

function slot0.addOverlaySpecBuffFilter(slot0, slot1, slot2)
	slot3 = slot0.recordBuffDataTb

	if not slot0.recordBuffDataTb[slot1] then
		uv4 = "recordBuffDataTb"
		slot4 = slot4()
	end

	slot3[slot1] = slot4
	slot4 = slot2 or function ()
		return true
	end

	table.insert(slot0.recordBuffDataTb[slot1].__filters, slot4)
	slot0:refreshOverlaySpecBuffOrder(slot1)

	return tostring(slot4)
end

function slot0.deleteOverlaySpecBuffFilter(slot0, slot1, slot2)
	for slot7, slot8 in ipairs(slot0.recordBuffDataTb[slot1].__filters) do
		if tostring(slot8) == slot2 then
			table.remove(slot3.__filters, slot7)

			break
		end
	end

	slot0:refreshOverlaySpecBuffOrder(slot1)
end

function slot0.checkOverlaySpecBuffExit(slot0, slot1)
	if not slot0.recordBuffDataTb[slot1] then
		return false
	end

	if slot2.order:size() == 0 then
		return false
	end

	return true
end

function slot2()
	return nil
end

function slot0.ipairsOverlaySpecBuff(slot0, slot1, slot2)
	if not slot0:checkOverlaySpecBuffExit(slot1) then
		uv3 = "checkOverlaySpecBuffExit"

		return slot3
	end

	slot3 = slot0.recordBuffDataTb[slot1]
	slot5 = slot3.list
	slot6 = 0
	slot7 = 1
	slot8 = slot3.order:size()
	slot2 = slot2 or function ()
		return false
	end

	return function ()
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
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
		--     return _build_string_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
		--     node.value = state.constants.complex_constants[index]
		--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end
end

function slot0.ipairsOverlaySpecBuffTo(slot0, slot1, slot2, slot3)
	slot4 = nil

	return slot0:ipairsOverlaySpecBuff(slot1, function (slot0)
		uv1 = "ipairsOverlaySpecBuff"

		if slot1 then
			uv1 = "ipairsOverlaySpecBuff"

			for slot4, slot5 in slot1:ipairsOverlaySpecBuff("ignoreSpecBuff") do
				if not slot5.cfgIds[slot0.cfgId] then
					uv7 = "ignoreSpecBuff"

					if slot5.specBuffList[slot7] then
						return true
					end
				end
			end
		end

		uv1 = "cfgIds"

		if slot1 then
			uv1 = "cfgIds"

			if slot1.ignoreBuffGroup then
				for slot4, slot5 in ipairs(slot0.group) do
					uv7 = "cfgIds"

					if itertools.include(slot7.ignoreBuffGroup, slot5) then
						return true
					end
				end
			end
		end

		return false
	end)
end

function slot0.deleteOverlaySpecBuff(slot0, slot1, slot2)
	if not slot1.effectBuffData then
		return
	end

	if not slot0.recordBuffDataTb[slot1.csvCfg.easyEffectFunc] then
		errorInWindows("buffData not exist, buffCfgId = %s", slot1.cfgId)

		return
	end

	slot5, slot6 = slot4.list:size()
	slot7 = 1
	slot8 = nil

	for slot12 = 1, slot5 do
		if slot4.order:at(slot7) then
			if slot8 then
				if slot8 < slot13 then
					slot4.order:update(slot7, slot13 - 1)

					slot7 = slot7 + 1
				end
			elseif slot13 < slot12 then
				slot7 = slot7 + 1
			end
		end

		slot6 = slot4.list:at(slot12)

		if not slot8 and slot6.id == slot1.id then
			if slot2 then
				slot2(slot6)
			end

			slot4.list:erase(slot12)

			if slot4.order:at(slot7) and slot4.order:at(slot7) == slot12 then
				slot4.order:erase(slot7)
			end

			slot8 = slot12
		end
	end

	if slot6 and slot5 > 0 and slot4.list:size() == 0 then
		slot0:triggerBuffOnPoint(lushi.BuffTriggerPoint.onHolderSpecBuffOver, {
			name = csv.auto_chess.buff[slot6.cfgId] and slot9.easyEffectFunc,
			overType = slot1.overType
		})
	end
end

function slot0.getOverlaySpecBuffByIdx(slot0, slot1, slot2)
	if not slot0:checkOverlaySpecBuffExit(slot1) then
		return
	end

	return slot0.recordBuffDataTb[slot1].list:at(slot0.recordBuffDataTb[slot1].order:at(slot2 or 1))
end

function slot0.addOverlaySpecBuffFunc(slot0, slot1, slot2, slot3)
	if not slot0:checkOverlaySpecBuffExit(slot1) then
		return
	end

	slot0.recordBuffDataTb[slot1][slot2] = slot3
end

function slot0.doOverlaySpecBuffFunc(slot0, slot1, slot2, ...)
	if not slot0:checkOverlaySpecBuffExit(slot1) then
		return
	end

	if not slot0.recordBuffDataTb[slot1][slot2] then
		return
	end

	return slot0.recordBuffDataTb[slot1][slot2](...)
end

function slot0.getOverlaySpecBuffInnerData(slot0, slot1)
	return slot0.recordBuffDataTb[slot1]
end

function slot0.addExRecord(slot0, slot1, slot2, ...)
	slot0.extraRecord:addExRecord(slot1, slot2, slot0:getEventMainKey(), ...)

	slot0.exRecordNameTb[slot1] = true
end

function slot0.getEventByKey(slot0, slot1, ...)
	return slot0.extraRecord:getEventByKey(slot1, slot0:getEventMainKey(), ...)
end

function slot0.cleanEventByKey(slot0, slot1, ...)
	return slot0.extraRecord:cleanEventByKey(slot1, slot0:getEventMainKey(), ...)
end
