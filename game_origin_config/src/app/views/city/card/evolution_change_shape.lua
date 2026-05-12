function slot0(slot0)
	slot1 = {}
	slot2 = {}

	for slot6, slot7 in ipairs(slot0) do
		if itertools.size(slot7.branch) > 1 then
			table.sort(slot7.branch, function (slot0, slot1)
				return slot0.develop < slot1.develop
			end)

			if slot0[slot6 + 1] then
				slot2 = slot0[slot6 + 1].branch

				for slot12, slot13 in pairs(slot1) do
					if not slot2[slot12] then
						slot2[slot12] = {}
					end

					slot2[slot12].develop = slot13.develop
				end

				table.sort(slot2, function (slot0, slot1)
					return slot0.develop < slot1.develop
				end)
			end

			break
		end
	end

	return slot1, slot2
end

slot1 = class("CardEvolutionChangeShapeView", Dialog)
slot1.RESOURCE_FILENAME = "card_change_shape.json"
slot1.RESOURCE_BINDING = {
	item = "item1",
	txtNum = "txtNum",
	title1 = "title1",
	txt = "txt",
	nowIcon = "nowIcon1",
	nowIcon1 = "nowIcon2",
	icon = "icon",
	item1 = "item2",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	changeBtn = {
		varname = "changeBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSwitchChange")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.params = slot1
	slot0.develop, slot3, slot4, slot0.selectDbId, slot0.oldCurrBranch = slot1()
	slot0.changeBranch = slot4 == 2 and 1 or 2
	slot0.cost = 0
	slot0.branch = slot4 == 0 and 1 or slot4
	slot0.nowBranch = 1

	slot0:initModel()

	slot10 = slot0.cardId:read()

	userDefault.setForeverLocalKey("evolutionBranch", {
		[slot10] = slot0.branch
	})
	slot0.params(slot0.branch)

	slot7 = csv.cards
	slot8 = slot7[slot0.cardId:read()].developType
	slot9 = {}
	uv10 = "params"
	slot10, slot11 = slot10(slot3)
	slot13 = slot7[slot10[slot0.changeBranch].id]
	slot0.nextDevelop = slot7[slot10[slot0.branch].id].develop

	if slot0.develop ~= slot0.nextDevelop then
		slot12 = slot7[slot10[1].id]
		slot13 = slot7[slot10[2].id]
		slot0.nowBranch = slot0.branch

		slot0.title1:text(gLanguageCsv.qualityExchangeFragmentTitle3)
	end

	slot0:switchSpriteSpine(slot12, 1)
	slot0:switchSpriteSpine(slot13, 2)

	slot14 = slot0.cardId:read()

	idlereasy.any({
		slot0.switchTimes,
		slot0.oldCurrBranch,
		slot0.cardId
	}, function ()
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
	idlereasy.when(slot0.rmb, function (slot0, slot1)
		uv2 = "cost"
		uv4 = "cost"

		text.addEffect(slot4.txtNum, {
			color = slot1 < slot2.cost and ui.COLORS.NORMAL.RED or ui.COLORS.NORMAL.DEFAULT
		})
	end)
	slot0:iconFloat(slot0.nowIcon1)
	slot0:iconFloat(slot0.nowIcon2)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot1 = gGameModel.cards:find(slot0.selectDbId)
	slot0.cardId = slot1:getIdler("card_id")
	slot0.switchTimes = slot1:getIdler("branch_switch_times")
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.items = gGameModel.role:getIdler("items")
end

function slot1.iconFloat(slot0, slot1)
	slot2, slot3 = slot1:xy()
	slot4 = slot3 + 10
	slot5 = slot3 - 10
	slot6 = 0.2

	slot0:enableSchedule():schedule(function ()
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
	end, 0.016666666666666666, 0, "controlIconFloat" .. slot2)
end

function slot1.setBottomSpine(slot0)
	slot1 = slot0.item:size()
	slot2 = CSprite.new("effect/jinhuajiemian.skel")

	slot2:xy(slot1.width / 2 - 40, slot1.height / 4 - 15)
	slot2:play("effect_down2_loop")
	slot2:addTo(slot0.item, 4, "effect1")

	slot3 = CSprite.new("effect/jinhuajiemian.skel")

	slot3:xy(slot1.width / 2 - 40, slot1.height / 4 - 15)
	slot3:play("effect_up_loop")
	slot3:addTo(slot0.item, 7, "effect2")
end

function slot1.switchSpriteSpine(slot0, slot1, slot2)
	slot0.markID = slot1.cardMarkID
	slot3 = csv.unit[slot1.unitID]
	slot4 = slot0["item" .. slot2]
	slot5 = slot4:size()
	slot6 = slot4:multiget("name", "attr2", "rarity", "attr1", "cardImg")

	slot6.cardImg:removeAllChildren()

	slot7 = widget.addAnimation(slot6.cardImg, slot3.unitRes, "standby_loop")
	slot8 = slot6.cardImg:size()

	slot7:xy(slot8.width / 2, slot8.height / 7):scale(slot3.scale)
	slot7:setSkin(slot3.skin)
	slot6.name:text(slot3.name)
	slot6.name:setTextColor(ui.COLORS.NORMAL.DEFAULT)
	slot6.attr2:visible(slot3.natureType2 ~= nil)

	if slot3.natureType2 then
		slot6.attr2:texture(ui.ATTR_ICON[slot3.natureType2])
	end

	slot6.rarity:texture(ui.RARITY_ICON[slot3.rarity])
	slot6.attr1:texture(ui.ATTR_ICON[slot3.natureType])

	if slot3.natureType2 then
		adapt.oneLineCenterPos(cc.p(290, 75), {
			slot6.rarity,
			slot6.name,
			slot6.attr1,
			slot6.attr2
		}, cc.p(8, 0))
	else
		adapt.oneLineCenterPos(cc.p(290, 75), {
			slot6.rarity,
			slot6.name,
			slot6.attr1
		}, cc.p(8, 0))
	end
end

function slot1.onSwitchChange(slot0)
	if slot0.rmb:read() < slot0.cost then
		uiEasy.showDialog("rmb", nil, {
			dialog = true
		})

		return
	end

	slot1 = "#C0x5b545b#" .. string.format(gLanguageCsv.onSwitchChangeShape, slot0.cost)

	if slot0.cost == 0 then
		slot1 = "#C0x5b545b#" .. gLanguageCsv.onSwitchChangeShape1
	end

	if slot0.develop == slot0.nextDevelop then
		gGameUI:showDialog({
			btnType = 2,
			isRich = true,
			content = slot1,
			cb = function ()
				uv4 = "gGameApp"
				uv5 = "gGameApp"

				gGameApp:requestServer("/game/card/switch/branch", function (slot0)
					if not itertools.isempty(slot0.view) then
						gGameUI:showGainDisplay(slot0.view)
					end
				end, slot4.selectDbId, slot5.changeBranch)
			end,
			dialogParams = {
				clickClose = false
			}
		})
	else
		userDefault.setForeverLocalKey("evolutionBranch", {
			[slot0.cardId:read()] = slot0.changeBranch
		})

		slot0.nowBranch = slot0.nowBranch == 1 and 2 or 1

		slot0.params(slot0.changeBranch)
		gGameUI:showTip(gLanguageCsv.succeedChanceChangeShape)

		slot0.changeBranch = slot0.changeBranch == 1 and 2 or 1
	end
end

return slot1
