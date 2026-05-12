slot0 = cc.load("mvc").ViewBase
slot1 = class("PromptBoxView", Dialog)
slot1.RESOURCE_FILENAME = "common_prompt_box.json"
slot1.RESOURCE_BINDING = {
	selectPanel = "selectPanel",
	title = "titleLabel",
	content = "contentLabel",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnOK = {
		varname = "btnOK",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickOK")
			}
		}
	},
	btnCancel = {
		varname = "btnCancel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onCancel")
			}
		}
	},
	btnOkCenter = {
		varname = "btnOkCenter",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickOK")
			}
		}
	},
	["btnOkCenter.title"] = {
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
	["selectPanel.btn"] = {
		varname = "selectTipBtn",
		binds = {
			event = "click",
			method = bindHelper.self("onSelectTipBtn")
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot1 = slot1 or {}
	slot0.params = slot1
	slot2 = slot1.btnType or 1
	slot0._okcb = slot1.cb
	slot0._closecb = slot1.closeCb
	slot0._cancelcb = slot1.cancelCb
	slot0.selectKey = slot1.selectKey
	slot3, slot4 = slot0.btnOK:getPosition()

	if slot1.title then
		slot0.titleLabel:text(slot1.title)
	end

	if slot1.delayTime then
		slot0.btnOK:setTouchEnabled(false)
		cache.setShader(slot0.btnOK, false, "hsl_gray")

		slot6 = ccui.Text:create(slot1.delayTime, "font/youmi1.ttf", 65):alignCenter(slot0.btnOK:size()):addTo(slot0.btnOK, 10, "delayTime")

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
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
			--     return _build_numeric_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
			--     number = state.constants.numeric_constants[index]
			--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end, 1, 0, "delayTime")
	end

	if slot1.closeTime then
		slot0:enableSchedule():schedule(function (slot0)
			uv2 = "time"

			if slot2.closeTime <= time.getTime() then
				uv1 = "getTime"
				slot1 = slot1:enableSchedule()
				slot2 = slot1

				slot1.unScheduleAll(slot2)

				uv2 = "getTime"

				performWithDelay(slot2, function ()
					uv0 = "onClose"

					slot0:onClose()
				end, 0.016666666666666666)

				return false
			end
		end, 1, 0, "closeTime")
	end

	slot5 = slot1.size or slot0.contentLabel:size()

	if slot2 == 1 then
		slot0.btnOK:hide()
		slot0.btnCancel:hide()
		slot0.btnOkCenter:show()

		slot5.height = slot5.height - 80

		slot0.contentLabel:size(slot5)

		if slot1.btnStr then
			slot0.btnOkCenter:get("title"):text(slot1.btnStr)
		end
	else
		slot0.btnOK:show()
		slot0.btnCancel:show()
		slot0.btnOkCenter:hide()
	end

	if slot0.selectKey then
		slot0.selectPanel:show()

		if slot0:getSelectKey() == "first" or slot6 == "false" then
			slot0.selectTipBtn:get("checkBox"):setSelectedState(true)
			slot0:setSelectKey("false")
		else
			slot0.selectTipBtn:get("checkBox"):setSelectedState(false)
		end

		if slot1.selectTip then
			slot0.selectPanel:get("textTip"):text(slot1.selectTip)
		end

		slot7 = slot0.selectPanel:get("btn.checkBox"):width()
		slot8 = slot0.selectPanel:get("textTip"):width()
		slot10 = (slot0.selectPanel:width() - (slot7 + slot8 + 20)) / 2

		slot0.selectPanel:get("btn"):x(slot10 + slot0.selectPanel:get("btn"):width() / 2 - slot7 / 2)
		slot0.selectPanel:get("textTip"):x(slot10 + slot7 + 20 + slot8 / 2)
	else
		slot0.selectPanel:hide()
	end

	slot7, slot8 = beauty.textScroll({
		margin = 20,
		size = slot5,
		fontSize = slot1.fontSize or 50,
		effect = {
			color = ui.COLORS.NORMAL.DEFAULT
		},
		strs = slot1.content or slot1.strs,
		verticalSpace = slot1.verticalSpace or 10,
		isRich = slot1.isRich,
		align = slot1.align or "center"
	})
	slot9 = 0

	if slot8 < slot5.height then
		slot9 = -(slot5.height - slot8) / 2
	end

	slot7:addTo(slot0.contentLabel, 10):y(slot9)

	slot10 = slot1.dialogParams or {}
	slot10.clearFast = slot10.clearFast or slot1.clearFast

	Dialog.onCreate(slot0, slot10)
end

function slot1.onClickOK(slot0)
	slot0:addCallbackOnExit(slot0._okcb)
	Dialog.onClose(slot0)

	return slot0
end

function slot1.onCancel(slot0)
	slot0:addCallbackOnExit(slot0._cancelcb)
	slot0:onClose()
end

function slot1.onClose(slot0)
	slot0:addCallbackOnExit(slot0._closecb, true)
	Dialog.onClose(slot0)

	return slot0
end

function slot1.getSelectKey(slot0)
	if slot0.params.selectType == 2 then
		return userDefault.getCurrDayKey(slot0.selectKey, "first")
	else
		return userDefault.getForeverLocalKey(slot0.selectKey, "first")
	end
end

function slot1.setSelectKey(slot0, slot1)
	if slot0.params.selectType == 2 then
		userDefault.setCurrDayKey(slot0.selectKey, slot1)
	else
		userDefault.setForeverLocalKey(slot0.selectKey, slot1)
	end
end

function slot1.onSelectTipBtn(slot0)
	if slot0:getSelectKey() == "first" or slot1 == "true" then
		slot0.selectTipBtn:get("checkBox"):setSelectedState(true)
		slot0:setSelectKey("false")
	else
		slot0.selectTipBtn:get("checkBox"):setSelectedState(false)
		slot0:setSelectKey("true")
	end
end

return slot1
