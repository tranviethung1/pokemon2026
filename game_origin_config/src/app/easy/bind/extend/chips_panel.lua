slot0 = {
	nil,
	"effect_xian_lv",
	"effect_xian_lan",
	"effect_xian_zi",
	"effect_xian_huang",
	"effect_xian_hong"
}
slot1 = require("app.views.city.card.chip.tools")
slot2 = require("easy.bind.helper")
slot3 = class("chipsPanel", cc.load("mvc").ViewBase)
slot4 = {
	RESOURCE_FILENAME = "chips_panel.json",
	RESOURCE_BINDING = {
		panel2 = "panel2",
		panel = "panel",
		panel1 = "panel1"
	}
}
slot3.defaultProps = {
	showSuitEffect = false
}

function slot3.getValue(slot0, slot1)
	if not slot0.noIdlerListener then
		return slot1
	end

	if isIdler(slot1) then
		return slot1:read()
	end

	return slot1
end

function slot3.initExtend(slot0)
	uv3 = "gGameUI"

	gGameUI:createSimpleView(slot3, slot0):init():getResourceNode():alignCenter(slot0:size())

	slot0.panelIdx = slot0.panelIdx or ""

	for slot5, slot6 in ipairs({
		"panel",
		"panel1",
		"panel2"
	}) do
		if "panel" .. slot0.panelIdx == slot6 then
			slot0.nodePanel = slot1[slot6]
		else
			slot1[slot6]:removeFromParent()
		end
	end

	slot0.nodePanel:show()

	slot0.originShowSuitEffect = slot0.showSuitEffect
	slot0.data_ = {}
	slot2 = idlereasy.new({})
	slot0.cardChips = slot2
	uv2 = "createSimpleView"
	slot2 = slot2.callOrWhen

	slot2(slot0.data, function (slot0)
		uv1 = "resetData_"
		slot1.resetData_ = true

		if type(slot0) == "table" then
			uv1 = "resetData_"

			slot1.cardChips:set(slot0, true)
		else
			slot1 = gGameModel.cards
			slot2 = slot1
			slot1 = slot1.find(slot2, slot0)
			uv2 = "resetData_"
			slot5 = slot1
			uv5 = "resetData_"
			slot2.cardChips = idlereasy.assign(slot1.getIdler(slot5, "chip"), slot5.cardChips)
		end
	end)

	uv2 = "createSimpleView"
	slot2 = slot2.callOrWhen

	slot2(slot0:getValue(slot0.cardChips), function (slot0)
		uv2 = "pairs"

		for slot4, slot5 in pairs(slot2.data_) do
			slot5:destroy()
		end

		uv1 = "pairs"
		slot1.data_ = {}
		uv1 = "pairs"
		slot1.chipData_ = {}

		for slot4 = 1, 6 do
			if slot0[slot4] then
				slot6 = gGameModel.chips:find(slot5)
				slot8 = slot6
				slot7 = slot6.read(slot8, "chip_id")
				uv8 = "pairs"
				slot8 = slot8.chipData_
				slot8[slot4] = {
					dbId = slot5,
					chipId = slot7,
					cfg = csv.chip.chips[slot7]
				}
				uv8 = "pairs"

				if not slot8.noIdlerListener then
					uv8 = "pairs"

					function slot11()
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

					uv11 = "pairs"
					uv13 = "pairs"
					slot8.data_[slot5] = idlereasy.when(slot6:getIdler("level"), slot11, true):anonyOnly(slot11, tostring(slot13) .. stringz.bintohex(slot5))
				end
			end

			uv6 = "pairs"

			slot6:onItem_(slot4, slot5)
		end

		uv1 = "pairs"

		slot1:calcSuitAttr()
	end)

	uv2 = "createSimpleView"
	slot2 = slot2.callOrWhen

	slot2(slot0.selected, function (slot0)
		for slot4 = 1, 6 do
			uv5 = "getItem"

			if slot5:getItem(slot4):get("selected") then
				(slot5:get("selectedEffect") or widget.addAnimation(slot5, "chip/xzk.skel", "effect_loop", 100):scale(slot6:scale()):xy(slot6:xy()):rotate(60 * (slot4 - 1))):visible(slot4 == slot0)
				slot5:z(slot4 == slot0 and 9 or 5)
			end
		end
	end)

	uv2 = "createSimpleView"

	slot2.callOrWhen(slot0.slotFlags, function (slot0)
		for slot4 = 1, 6 do
			uv5 = "getItem"

			if slot5:getItem(slot4):get("selected") then
				slot6:visible(slot0[slot4] == true)
			end
		end
	end)

	if slot0.onNode then
		slot0:onNode(slot0.nodePanel)
	end

	return slot0
end

function slot3.calcSuitAttr(slot0)
	slot2 = slot0.cardChips:read()
	uv2 = "table"

	if slot0.resetData_ or not slot0.showSuitEffect then
		slot0.resetData_ = false
		slot0.suitAttr_ = slot2.getSuitAttrByCard(table.deepcopy(slot2, true))
		slot0.cardChips_ = slot1

		return
	end

	slot3 = {
		[slot7] = 1
	}

	for slot7 = 1, 6 do
		if slot1[slot7] and slot1[slot7] ~= slot0.cardChips_[slot7] then
			-- Nothing
		end
	end

	slot4 = false

	for slot8, slot9 in pairs(slot2) do
		for slot13 = #slot9, 1, -1 do
			if (slot0.suitAttr_[slot8] and slot0.suitAttr_[slot8][slot13] and slot0.suitAttr_[slot8][slot13][3]) == true then
				break
			end

			if slot9[slot13][3] == true then
				slot4 = true

				for slot19 = 1, 6 do
					if slot0.chipData_[slot19] and slot0.chipData_[slot19].cfg.suitID == slot8 and slot9[slot13][2] <= slot0.chipData_[slot19].cfg.quality then
						slot3[slot19] = slot9[slot13][1]

						if slot9[slot13][1] <= 0 + 1 then
							break
						end
					end
				end
			end
		end
	end

	for slot8, slot9 in pairs(slot3) do
		slot10 = "effect_chacao" .. (slot9 == 1 and "" or tostring(slot9))

		(slot0:getItem(slot8):get("effect_chacao") or widget.addAnimationByKey(slot11, "chip/fushi.skel", "effect_chacao", slot10, 100):scale(2):rotate(60 * slot8):xy(slot11:width() / 2, slot11:height() / 2)):play(slot10)
	end

	if slot4 then
		slot5 = slot0:get("suitImg_") or cc.Sprite:create("city/card/chip/txt_tzjh.png"):xy(400, 300):addTo(slot0, 100, "suitImg_")

		slot5:stopAllActions()
		slot5:scale(0)
		slot5:opacity(255)
		transition.executeSequence(slot5):easeBegin("ELASTICOUT", 0.7):scaleTo(0.5, 1):easeEnd():delay(0.5):fadeOut(0.5):done()
	end

	slot0.suitAttr_ = slot2
	slot0.cardChips_ = slot1
end

function slot3.getItem(slot0, slot1)
	return slot0.nodePanel:get("chip" .. slot1)
end

function slot3.onItem_(slot0, slot1, slot2)
	slot3 = slot0:getItem(slot1)

	if slot0.noListener then
		slot3:setTouchEnabled(false)
	end

	slot5 = slot3:get("effect_line") or widget.addAnimationByKey(slot3, "chip/fushi.skel", "effect_line", "effect_xian_di_loop", -2):scale(2 * slot3:get("bg"):scale()):rotate(60 * (slot1 - 2)):xy(slot3:convertToNodeSpace(slot3:get("bg"):convertToWorldSpace(cc.p(96, 55))))

	if slot3:get("defaultLv") then
		slot6:removeFromParent()
	end

	if slot2 then
		slot9 = gGameModel.chips:find(slot2):read("chip_id", "card_db_id", "level")

		slot3:get("bg"):show():texture(string.format("city/card/chip/img_d_%d.png", csv.chip.chips[slot9.chip_id].quality))
		bind.extend(slot0, slot3, {
			class = "icon_key",
			props = {
				noListener = true,
				simpleShow = true,
				data = {
					key = slot9.chip_id,
					dbId = slot9.card_db_id
				},
				onNode = function (slot0)
					uv1 = "icon"

					slot0:get("icon"):texture(string.gsub(slot1.icon, "/chip/icon_", "/chip/img/img_"))

					slot4 = "box"
					uv4 = "string"

					slot0:name(slot4):show():scale(slot4)
					slot0:setTouchEnabled(false)
				end
			}
		})

		slot13 = text.addEffect

		slot13(cc.Label:createWithTTF(gLanguageCsv.textLv2 .. slot9.level, ui.FONT_PATH, 30 - math.floor(10 * (1 - slot4))):align(cc.p(0.5, 0), slot3:width() / 2, slot3:height() / 10):addTo(slot3, 6, "defaultLv"), {
			color = ui.COLORS.NORMAL.WHITE,
			outline = {
				size = 3,
				color = ui.COLORS.NORMAL.DEFAULT
			}
		})

		uv13 = "getItem"

		slot5:show()

		if slot0.resetData_ or not slot0.showSuitEffect or slot0.cardChips:read()[slot1] == slot0.cardChips_[slot1] then
			slot5:play(slot13[slot0.chipData_[slot1].cfg.quality] .. "_loop")
		else
			slot5:play(slot13)
			slot5:addPlay(slot13 .. "_loop")
		end
	else
		slot3:get("bg"):hide()

		if slot3:get("box") then
			slot3:get("box"):hide()
		end

		slot5:play("effect_xian_di_loop")
	end

	if slot0.onItem then
		slot0:onItem(slot3, slot1, slot2)
	end
end

function slot3.pauseSuitEffect(slot0)
	slot0.showSuitEffect = false
end

function slot3.resumeSuitEffect(slot0)
	slot0.showSuitEffect = slot0.originShowSuitEffect
end

return slot3
