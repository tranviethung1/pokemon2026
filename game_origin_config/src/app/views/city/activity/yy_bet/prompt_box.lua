slot0 = class("PromptBox", Dialog)
slot0.RESOURCE_FILENAME = "yybet_prompt_box.json"
slot0.RESOURCE_BINDING = {
	["rmbPanel.coinIcon1"] = "coinIcon1",
	["rmbPanel.rmbToCoin"] = "rmbToCoin",
	["goldPanel.goldLimit"] = "goldLimit",
	["rmbPanel.rmbLimit"] = "rmbLimit",
	["goldPanel.goldToCoin"] = "goldToCoin",
	["rmbPanel.rmb"] = "rmb",
	["goldPanel.gold"] = "gold",
	["goldPanel.coinIcon"] = "coinIcon",
	goldPanel = "goldPanel",
	rmbPanel = "rmbPanel",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["goldPanel.btnGoldCost"] = {
		varname = "btnGoldCost",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:onCostClick("gold")
				end)
			}
		}
	},
	["rmbPanel.btnRmbCost"] = {
		varname = "btnRmbCost",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:onCostClick("rmb")
				end)
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0:initTools()

	slot0.activityId = slot1

	slot0:initModel()
	slot0:initTipCsv()

	slot0.yyCfg = csv.yunying.yyhuodong[slot1]

	if not slot0.tools.getCsv("base")[slot0.yyCfg.paramMap.base].gold2coinLimit then
		slot0.goldPanel:hide()
		slot0.rmbPanel:y(slot0.rmbPanel:y() + 110)
	elseif not slot2.rmb2coinLimit then
		slot0.rmbPanel:hide()
		slot0.goldPanel:y(slot0.goldPanel:y() - 110)
	end

	slot0.gold:text(slot2.gold2coinRatio[1] .. gLanguageCsv.gold)
	slot0.goldToCoin:text(slot2.gold2coinRatio[2] .. gLanguageCsv.yyBetCoin)
	slot0.rmb:text(slot2.rmb2coinRatio[1] .. gLanguageCsv.diamond)
	slot0.rmbToCoin:text(slot2.rmb2coinRatio[2] .. gLanguageCsv.yyBetCoin)
	slot0.coinIcon:texture(dataEasy.getIconResByKey(slot0.yyCfg.clientParam.itemId))
	slot0.coinIcon1:texture(dataEasy.getIconResByKey(slot0.yyCfg.clientParam.itemId))
	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "gold2coinLimit"
		uv3 = "gold2coinLimit"
		uv4 = "rmb2coinLimit"
		slot5 = slot1[slot4.activityId].info or {
			gold = 0,
			rmb = 0
		}
		slot7 = (slot3.rmb2coinLimit or 0) - (slot5.rmb or 0)

		if (slot2.gold2coinLimit or 0) - (slot5.gold or 0) > 0 then
			uv8 = "rmb2coinLimit"
			slot8 = slot8.goldNum
			slot9 = slot8
			uv9 = "gold2coinLimit"

			if slot9.gold2coinRatio[1] <= slot8.read(slot9) then
				slot8 = 1
			end
		else
			slot8 = 3
		end

		if slot7 > 0 then
			uv9 = "rmb2coinLimit"
			slot9 = slot9.rmbNum
			slot10 = slot9
			uv10 = "gold2coinLimit"

			if slot10.rmb2coinRatio[1] <= slot9.read(slot10) then
				slot9 = 1
			end
		else
			slot9 = 3
		end

		uv11 = "rmb2coinLimit"
		slot11 = slot11.btnGoldCost
		uv12 = "rmb2coinLimit"
		slot12 = slot12.btnGoldCost:get("title")

		uiEasy.setBtnShader(slot11, slot12, slot8)

		slot10 = uiEasy.setBtnShader
		uv11 = "rmb2coinLimit"
		uv12 = "rmb2coinLimit"

		slot10(slot11.btnRmbCost, slot12.btnRmbCost:get("title"), slot9)

		uv10 = "rmb2coinLimit"
		slot10 = slot10.goldLimit
		slot10 = slot10.text

		slot10(slot10, string.format(gLanguageCsv.yyBetExchange, slot6, slot2))

		uv10 = "rmb2coinLimit"

		slot10.rmbLimit:text(string.format(gLanguageCsv.yyBetExchange, slot7, slot3))
	end)
	Dialog.onCreate(slot0, {
		clickClose = false
	})
end

function slot0.initTools(slot0)
	slot0.tools = require("app.views.city.activity.yy_bet.tools")
end

function slot0.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.rmbNum = gGameModel.role:getIdler("rmb")
	slot0.goldNum = gGameModel.role:getIdler("gold")
end

function slot0.initTipCsv(slot0)
	slot0.buyTips = gLanguageCsv.yyBetExchangeRmb
end

function slot0.onCostClick(slot0, slot1)
	slot4 = slot0.tools.getCsv("base")[slot0.yyCfg.paramMap.base]

	function slot5()
		uv2 = "gGameApp"
		uv4 = "gGameApp"
		uv5 = "requestServer"

		gGameApp:requestServer(slot2.tools.getProtocol("buy"), function (slot0)
			gGameUI:showTip(string.format(gLanguageCsv.yyBetGetCoin, slot0.view.yycoin))
		end, slot4.activityId, slot5, 1)
	end

	if slot1 == "rmb" then
		if slot4.rmb2coinLimit <= ((slot0.yyhuodongs:read()[slot0.activityId] or {}).info or {
			gold = 0,
			rmb = 0
		}).rmb then
			gGameUI:showTip(gLanguageCsv.yyBetExchangeRmbLimit)

			return
		end

		if slot0.rmbNum:read() < slot4.rmb2coinRatio[1] then
			gGameUI:showTip(gLanguageCsv.yyBetRmbNotEnough)

			return
		end

		gGameUI:showDialog({
			btnType = 2,
			isRich = true,
			title = gLanguageCsv.tips,
			content = "#C0x5B545B#" .. string.format(slot0.buyTips, slot4.rmb2coinRatio[1], slot4.rmb2coinRatio[2]),
			cb = function ()
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
		})
	else
		if slot4.gold2coinLimit <= slot3.gold then
			gGameUI:showTip(gLanguageCsv.yyBetExchangeGoldLimit)

			return
		end

		if slot0.goldNum:read() < slot4.gold2coinRatio[1] then
			gGameUI:showTip(gLanguageCsv.yyBetGoldNotEnough)

			return
		end

		slot6 = string.format(gLanguageCsv.yyBetExchangeGold, slot4.gold2coinRatio[1], slot4.gold2coinRatio[2])

		slot5()
	end
end

return slot0
