function slot0(slot0, slot1, slot2, slot3)
	bind.extend(slot0, slot1, {
		class = "icon_key",
		props = {
			data = {
				key = slot2,
				num = slot3
			}
		}
	})
end

slot1 = {
	{
		txt = gLanguageCsv.change,
		spaceTxt = gLanguageCsv.spaceChange,
		success = gLanguageCsv.advanceSuccess
	},
	{
		txt = gLanguageCsv.comb,
		spaceTxt = gLanguageCsv.spaceComb,
		success = gLanguageCsv.combSuccess
	}
}

function slot2(slot0, slot1)
	slot2 = gCommonConfigCsv.universalFragGeneral
	slot3 = gCommonConfigCsv.universalFragSpecial

	if slot0 == 1 then
		slot2 = csv.fragments[csv.cards[slot1].fragID].universalFragID
	end

	return slot2, slot3
end

function slot3(slot0, slot1)
	slot2 = slot0:size()

	if not slot0:get("txt") then
		slot6 = dataEasy.getCfgByKey(gCommonConfigCsv.universalFragGeneral)
		slot7 = dataEasy.getCfgByKey(gCommonConfigCsv.universalFragSpecial)
		slot3 = rich.createByStr(string.format(gLanguageCsv.universalFragCombTip, "#C0x5B545B#" .. gCommonConfigCsv.universalFragSwitch, ui.QUALITY_OUTLINE_COLOR[slot6.quality] .. slot6.name .. "#C0x5B545B#", 1, ui.QUALITY_OUTLINE_COLOR[slot7.quality] .. slot7.name), 34):anchorPoint(0.5, 0.5):xy(slot2.width / 2, slot2.height / 2):addTo(slot0, 6, "txt")
	end

	slot3:visible(slot1)
end

slot4 = cc.load("mvc").ViewBase
slot5 = class("CardStarChangeFragsView", Dialog)
slot5.RESOURCE_FILENAME = "card_star_changefrags.json"
slot5.RESOURCE_BINDING = {
	combTipPos = "combTipPos",
	autoPanel = "autoPanel",
	["cardPanel.textName1"] = "textName1",
	cardPanel = "cardPanel",
	["cardPanel.textName2"] = "textName2",
	["barPanel.needFrags"] = "needFrags",
	["cardPanel.card1"] = "card1",
	titleTxt = "title",
	["cardPanel.card2"] = "card2",
	textNeedNum = "textNeedNum",
	item = "item",
	["barPanel.bar"] = "slider",
	barPanel = "barPanel",
	["barPanel.myFrags"] = "myFrags",
	note = "needNumNote",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnList = {
		varname = "btnList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("title"):text(slot3.name)
					slot1:get("btn"):setBright(not slot3.isSelected)
					slot1:onClick(functools.partial(slot0.itemClick, slot2))

					if slot3.isSelected then
						text.addEffect(slot5, {
							glow = {
								color = ui.COLORS.GLOW.WHITE
							},
							color = ui.COLORS.NORMAL.WHITE
						})
					else
						text.addEffect(slot5, {
							color = ui.COLORS.NORMAL.RED
						})
					end
				end
			},
			handlers = {
				itemClick = bindHelper.self("onChangePage")
			}
		}
	},
	["barPanel.subBtn"] = {
		varname = "subBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onReduceClick")
			}
		}
	},
	["barPanel.addBtn"] = {
		varname = "addBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAddClick")
			}
		}
	},
	changeBtn = {
		varname = "changeBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeClick")
			}
		}
	},
	["changeBtn.title"] = {
		varname = "btnTxt",
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	textTips = {
		varname = "textTips"
	},
	["autoPanel.btnPanel"] = {
		varname = "btnAuto",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAutoClick")
			}
		}
	}
}

function slot5.onCreate(slot0, slot1)
	slot0.selectDbId = slot1

	slot0:initModel()

	slot2 = {}
	slot3 = nil
	slot4 = 2

	if slot1 then
		slot2 = {
			{
				isSelected = false,
				name = gLanguageCsv.fragmentTransformation
			},
			{
				isSelected = false,
				name = gLanguageCsv.universalSynthesis
			}
		}
		slot3 = slot0.cardId:read()
		slot4 = 1
	else
		slot0.cardPanel:y(slot0.cardPanel:y() + 50)
		slot0.barPanel:y(slot0.barPanel:y() + 25)
	end

	slot0.selectNum = idler.new(0)
	slot0.tabIdx = idler.new(slot4)
	slot0.isAutoSelect = idler.new(false)
	slot0.lastSelectNum = 0
	slot5 = nil

	idlereasy.any({
		slot0.selectNum,
		slot0.tabIdx
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
	idlereasy.when(slot0.isAutoSelect, function (slot0, slot1)
		if not slot1 then
			uv2 = "btnAuto"
			slot2 = slot2.btnAuto:get("img")
			slot2 = slot2.texture
			slot4 = "common/icon/radio_normal.png"

			slot2(slot2, slot4)

			uv2 = "btnAuto"
			uv4 = "btnAuto"

			slot2.selectNum:set(slot4.lastSelectNum)
		else
			uv2 = "btnAuto"
			slot2 = slot2.btnAuto:get("img")
			slot3 = slot2
			slot2 = slot2.texture

			slot2(slot3, "common/icon/radio_selected.png")

			uv2 = "btnAuto"
			uv3 = "btnAuto"
			slot2.lastSelectNum = slot3.selectNum:read()
			uv2 = "btnAuto"
			slot2 = slot2.textNeedNum
			slot3 = slot2
			uv3 = "btnAuto"
			uv8 = "btnAuto"

			slot3.selectNum:set(math.min(slot2.text(slot3), dataEasy.getNumByKey(slot8.changeId)))
		end
	end)
	slot0.slider:setPercent(0)
	slot0.slider:addEventListener(function (slot0, slot1)
		if slot1 == ccui.SliderEventType.percentChanged then
			slot4 = fragsId
			slot3 = csv.fragments[slot4]
			uv4 = "ccui"
			slot4 = slot4.selectNum:read()
			uv6 = "SliderEventType"
			slot6 = slot6 / 100 * slot0:getPercent()
			uv6 = "ccui"
			uv10 = "SliderEventType"

			slot6.selectNum:set(math.min(math.ceil(slot6), slot10))
		end
	end)

	slot0.tabDatas = idlers.newWithMap(slot2)

	slot0.tabIdx:addListener(function (slot0, slot1, slot2)
		uv3 = "title"
		slot3 = slot3.title
		slot3 = slot3.text
		uv5 = "text"
		slot5 = slot5[slot0].txt

		slot3(slot3, slot5)

		uv3 = "title"
		slot3 = slot3.btnTxt
		slot3 = slot3.text
		uv5 = "text"

		slot3(slot3, slot5[slot0].spaceTxt)

		uv3 = "title"
		slot3 = slot3.needNumNote
		slot3 = slot3.visible

		slot3(slot3, slot0 == 1)

		uv3 = "title"
		slot3 = slot3.textNeedNum
		slot3 = slot3.visible

		slot3(slot3, slot0 == 1)

		uv3 = "title"
		slot3 = slot3.autoPanel
		slot4 = slot3
		slot3 = slot3.visible

		if slot0 == 1 then
			uv5 = "title"
			slot5 = not slot5.isStarMax
		else
			slot5 = false
		end

		slot3(slot4, slot5)

		uv3 = "txt"
		uv4 = "title"

		slot3(slot4.combTipPos, slot0 == 2)

		uv3 = "title"

		if slot3.tabDatas:atproxy(slot1) then
			uv3 = "title"
			slot3.tabDatas:atproxy(slot1).isSelected = false
		end

		uv3 = "title"

		if slot3.tabDatas:atproxy(slot0) then
			uv3 = "title"
			slot3.tabDatas:atproxy(slot0).isSelected = true
		end
	end)

	slot6 = false

	if slot0.cardId and csv.card_mega[csv.cards[slot0.cardId:read()].megaIndex] and csv.card_mega[slot7].type == 1 then
		slot6 = true

		slot0.textTips:text(gLanguageCsv.fetterFragmentTips)
	end

	slot0.textTips:visible(slot6)
	slot0.autoPanel:get("txt"):text(gLanguageCsv.autoFill)
	adapt.oneLineCenterPos(cc.p(230, slot0.btnAuto:y()), {
		slot0.btnAuto,
		slot0.autoPanel:get("txt")
	}, cc.p(12, 0))
	Dialog.onCreate(slot0)
end

function slot5.initModel(slot0)
	if gGameModel.cards:find(slot0.selectDbId) then
		slot0.cardId = slot1:getIdler("card_id")
		slot0.isStarMax = slot1:getIdler("star"):read() == 12
	end
end

function slot5.onAddClick(slot0)
	slot0.selectNum:set(slot0.selectNum:read() + 1)
end

function slot5.onAutoClick(slot0)
	slot0.isAutoSelect:set(not slot0.isAutoSelect:read())
end

function slot5.onReduceClick(slot0)
	slot0.selectNum:set(slot0.selectNum:read() - 1)
end

function slot5.onChangePage(slot0, slot1, slot2)
	slot0.selectNum:set(0)
	slot0.tabIdx:set(slot2)
end

function slot5.onChangeClick(slot0)
	if slot0.selectNum:read() == 0 then
		uv5 = "selectNum"

		gGameUI:showTip(string.format(gLanguageCsv.pleaseSelectNumber, slot5[slot0.tabIdx:read()].txt))

		return
	end

	slot1 = nil

	if slot0.tabIdx:read() == 1 then
		slot1 = slot0.fragsId
	end

	gGameApp:requestServer("/game/role/acitem/switch", function (slot0)
		slot1 = gGameUI
		slot2 = slot1
		slot1 = slot1.showTip
		uv3 = "gGameUI"
		uv4 = "showTip"

		slot1(slot2, slot3[slot4.tabIdx:read()].success)

		uv1 = "tabIdx"
		uv2 = "showTip"

		slot1.onClose(slot2)
	end, slot0.selectNum, slot1)
end

return slot5
