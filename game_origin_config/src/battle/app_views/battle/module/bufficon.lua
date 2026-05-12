slot0 = class("BuffIcon", battleModule.CBase)

function slot1()
	slot0 = cc.Node:create()
	slot0.prevVisible = nil

	return slot0
end

function slot2(slot0, slot1)
	if slot0.prevVisible ~= slot1 then
		slot0:setVisible(slot1)

		slot0.prevVisible = slot1
	end
end

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.layer = slot0.parent.gameLayer
	slot0.layerPos = slot0.layer:convertToWorldSpace(cc.p(0, 0))
	slot0.buffTexts = {}
	slot0.units = {}
	slot0.allIconVisible = true
	slot0.allTextVisible = true
end

function slot0.getRecord(slot0, slot1, slot2)
	if slot0.units[tostring(slot1)] == nil and slot2 then
		slot6 = cc.Node:create()
		uv6 = "tostring"
		slot6 = slot6()
		uv6 = "tostring"
		slot6 = slot6()
		uv6 = "tostring"
		slot4 = {
			visible = true,
			lineLimit = 5,
			buffLastIndex = 0,
			buffEffectsMap = {},
			delArray = {},
			shadowNode = slot6,
			buffGroupNode = slot6,
			buffOverlayNode = slot6,
			buffTextNode = slot6()
		}
		slot0.units[slot3] = slot4

		slot4.shadowNode:addTo(slot1.lifebar):xy(cc.pSub(slot1.lifebar.buffAddFirstPos, slot0.layerPos))

		slot5 = slot4.shadowNode:convertToWorldSpace(cc.p(0, 0))

		slot4.buffGroupNode:addTo(slot0.layer, battle.GameLayerZOrder.icon + slot1.posZ:get()):xy(slot5)
		slot4.buffOverlayNode:addTo(slot0.layer, battle.GameLayerZOrder.overlay + slot1.posZ:get()):xy(slot5)
		slot4.buffTextNode:addTo(slot0.layer, battle.GameLayerZOrder.text + slot1.posZ:get()):xy(cc.pAdd(cc.p(slot1:getPosition()), slot1.unitCfg.everyPos.headPos))

		slot6 = nil
		slot6 = slot4.shadowNode:onNodeEvent("exit", function ()
			uv0 = "remove"
			slot1 = slot0
			slot0 = slot0.remove

			slot0(slot1)

			uv0 = "units"
			uv1 = "pairs"
			slot0.units[slot1] = nil
			uv1 = "buffEffectsMap"

			for slot3, slot4 in pairs(slot1.buffEffectsMap) do
				removeCSprite(slot4)
				slot4:hide()
			end

			uv1 = "units"

			performWithDelay(slot1.layer, function ()
				uv0 = "buffGroupNode"
				slot0 = slot0.buffGroupNode
				slot0 = slot0.removeSelf

				slot0(slot0)

				uv0 = "buffGroupNode"
				slot0 = slot0.buffOverlayNode
				slot0 = slot0.removeSelf

				slot0(slot0)

				uv0 = "buffGroupNode"

				slot0.buffTextNode:removeSelf()
			end, 0)
		end)
		slot7 = cc.p(0, 0)

		slot4.shadowNode:scheduleUpdate(function ()
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
		end)
	end

	return slot4
end

function slot3(slot0, slot1)
	slot2 = slot0.firstIdx
	slot3 = slot0:getBoundingBox()

	slot0:setPosition(cc.p((slot2 - 1) % slot1 * (slot3.width + 5), math.floor((slot2 - 1) / slot1) * slot3.height))

	if slot0.overlayCountLabel and not slot0.overlayOnSprite then
		slot0.overlayCountLabel:setPosition(cc.pAdd(slot6, cc.p(slot3.width, -5)))
	end
end

function slot4(slot0)
	slot1 = nil

	if slot0:find("battle/txt") then
		if cc.SpriteFrameCache:getInstance():getSpriteFrameByName(slot0:sub(12)) then
			cc.Sprite:createWithSpriteFrame(slot3):setScale(2.5)
		elseif APP_CHANNEL == "bare" then
			errorInWindows("buff_txt not in batch " .. slot2)
		end
	end

	return CSprite.new(slot0, slot1)
end

function slot0.onShowBuffText(slot0, slot1, slot2)
	if not slot2 or slot2 == "" then
		return
	end

	slot3 = slot0:getRecord(slot1, true)
	slot0.buffTexts[slot1.id] = slot0.buffTexts[slot1.id] or {}

	if slot0.buffTexts[slot1.id][slot2] then
		return
	end

	slot7 = 0

	for slot11, slot12 in pairs(slot4) do
		slot5 = 0 + slot12
		slot6 = 0 + 1
	end

	if display.sizeInView.height < slot5 + slot3.buffTextNode:getPositionY() then
		return
	end

	uv16 = ""

	if not slot1.effectResManager:add(battle.EffectResType.BuffText, slot2, slot2, {
		scale = 1,
		spr = newCSpriteWithFunc(slot2, slot16)
	}) then
		return
	end

	slot9 = slot8:getBoundingBox()
	slot10 = slot6 == 0 and slot9.height or (slot5 + slot9.height) / (slot6 + 1)
	slot4[slot2] = slot10

	slot8:setPosition(cc.p(0, slot5 + slot10))
	slot3.buffTextNode:add(slot8)
	transition.executeSequence(slot8):delay(1):fadeOut(0.25):func(function ()
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
	end):done()
end

function slot0.onShowBuffIcon(slot0, slot1, slot2, slot3, slot4)
	if slot0:getRecord(slot1, true).buffEffectsMap[slot3] == nil then
		return
	end

	if slot6.overlayCountLabel and slot4 and slot4 <= 1 then
		slot7:setVisible(false)
	end

	if slot4 and slot4 > 1 then
		if slot7 == nil then
			slot8 = cc.Label:createWithTTF(slot4, "font/youmi1.ttf", 30)

			slot8:enableOutline(cc.c4b(0, 0, 0, 255), 1)
			slot8:setAnchorPoint(cc.p(1, 0))

			if slot6.overlayOnSprite then
				slot8:setPosition(cc.p(slot6:getBoundingBox().width, -5))
				slot6:addChild(slot8)
			else
				slot5.buffOverlayNode:addChild(slot8)
			end

			slot6.overlayCountLabel = slot8
			slot7 = slot8
		end

		slot7:setString(slot4)
		slot7:setVisible(true)
	end

	slot6:show()
	slot0:refreshBuffIcons(slot5)
end

function slot0.refreshBuffIcons(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot1.buffEffectsMap) do
		if slot7:isVisible() then
			table.insert(slot2, slot7)
		end
	end

	table.sort(slot2, function (slot0, slot1)
		return slot0.firstIdx < slot1.firstIdx
	end)

	for slot6, slot7 in ipairs(slot2) do
		slot7.firstIdx = slot6
	end

	slot1.buffLastIndex = table.length(slot2)

	for slot6, slot7 in pairs(slot1.buffEffectsMap) do
		uv8 = "pairs"

		slot8(slot7, slot1.lineLimit)
	end
end

function slot0.clearDelArray(slot0, slot1)
	for slot5, slot6 in ipairs(slot1.delArray) do
		if slot1.buffEffectsMap[slot6] and slot7.ref <= 0 then
			slot1.buffEffectsMap[slot6] = nil

			if slot7.overlayCountLabel then
				slot7.overlayCountLabel:removeSelf()

				slot7.overlayCountLabel = nil
			end

			slot7:removeChildByName("boxRes")
			removeCSprite(slot7)
		end
	end

	slot1.delArray = {}
end

function slot0.onDelBuffIcon(slot0, slot1, slot2)
	if slot0:getRecord(slot1) == nil then
		return
	end

	if slot3.buffEffectsMap[slot2] == nil then
		return
	end

	slot4.ref = slot4.ref - 1

	if slot4.ref > 0 then
		return
	end

	slot4:hide()
	slot0:refreshBuffIcons(slot3)
	table.insert(slot3.delArray, slot2)

	slot5 = table.length(slot3.delArray)

	performWithDelay(slot3.shadowNode, function ()
		uv0 = "table"
		uv2 = "length"

		if slot0 ~= table.length(slot2.delArray) then
			return
		end

		uv0 = "delArray"
		uv2 = "length"

		slot0:clearDelArray(slot2)
	end, 1)
end

function slot5(slot0)
	slot1 = nil

	if slot0:find("battle/buff_icon") then
		if cc.SpriteFrameCache:getInstance():getSpriteFrameByName(slot0:sub(18)) then
			slot1 = cc.Sprite:createWithSpriteFrame(slot3)
		else
			errorInWindows("buff_icon not in batch %s", slot2)
		end
	end

	return CSprite.new(slot0, slot1)
end

function slot0.onDealBuffEffectsMap(slot0, slot1, slot2, slot3, slot4)
	if slot0:getRecord(slot1, true).buffEffectsMap[slot3] then
		if slot6.ref < 0 then
			slot6.ref = 0
		end

		slot6.ref = slot6.ref + 1

		return
	end

	if slot2 and slot2 ~= "" then
		slot5.buffLastIndex = slot5.buffLastIndex + 1
		uv10 = "getRecord"
		slot8 = newCSpriteWithFunc(slot2, slot10)
		slot8.ref = 1
		slot8.cfgId = slot3
		slot8.firstIdx = slot5.buffLastIndex
		slot8.overlayCountLabel = nil
		slot8.overlayOnSprite = tj.type(slot0.parent:getPlayModel()) == "ActivityWorldBossGate"

		if slot8.overlayOnSprite and battlePlay.Gate.ForceNumber < slot1.seat then
			slot8.overlayOnSprite = false
		end

		if slot4 then
			uv11 = "getRecord"
			slot9 = newCSpriteWithFunc(slot4, slot11)

			slot8:addChild(slot9, 99, "boxRes")
			slot9:setPosition(25, 25)
		end

		slot8:getAni():scale(1)
		slot8:getAni():setAnchorPoint(cc.p(0, 0))
		slot8:hide()
		slot5.buffGroupNode:add(slot8)

		slot5.buffEffectsMap[slot3] = slot8
	end
end

function slot0.onSetBuffIconVisible(slot0, slot1, slot2)
	if slot0:getRecord(slot1) == nil then
		return
	end

	slot3.visible = slot2
end

function slot0.onSetAllBuffIconVisible(slot0, slot1)
	slot0.allIconVisible = slot1
end

function slot0.onSetAllBuffTextVsisible(slot0, slot1)
	slot0.allTextVisible = slot1
end

return slot0
