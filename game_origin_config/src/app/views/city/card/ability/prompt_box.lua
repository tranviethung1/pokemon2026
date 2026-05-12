slot0 = cc.load("mvc").ViewBase
slot1 = class("PromptBoxView", Dialog)
slot1.RESOURCE_FILENAME = "card_ability_prompt_box.json"
slot1.RESOURCE_BINDING = {
	title = "titleLabel",
	content1 = "contentLabel1",
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
	slot6 = "center"

	slot0.contentLabel:removeAllChildren()
	slot0.contentLabel1:removeAllChildren()

	slot7, slot8 = beauty.textScroll({
		fontSize = 40,
		margin = 20,
		size = slot5,
		effect = {
			color = ui.COLORS.NORMAL.DEFAULT
		},
		strs = slot1.strs1,
		verticalSpace = slot1.verticalSpace or 10,
		isRich = slot1.isRich,
		align = slot1.align or slot6
	})

	slot7:height(slot8)
	slot7:addTo(slot0.contentLabel, 10)
	slot7:y(slot0.contentLabel:height() / 2)

	slot9, slot10 = beauty.textScroll({
		fontSize = 40,
		margin = 20,
		size = slot5,
		effect = {
			color = ui.COLORS.NORMAL.DEFAULT
		},
		strs = slot1.strs2,
		verticalSpace = slot1.verticalSpace or 10,
		isRich = slot1.isRich,
		align = slot1.align or slot6
	})

	slot9:height(slot10)
	slot9:addTo(slot0.contentLabel1, 10)
	slot9:y(slot0.contentLabel1:height() / 2)

	slot11 = slot1.dialogParams or {}
	slot11.clearFast = slot11.clearFast or slot1.clearFast

	Dialog.onCreate(slot0, slot11)
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

return slot1
