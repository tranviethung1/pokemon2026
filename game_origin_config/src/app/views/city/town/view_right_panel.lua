slot0 = cc.load("mvc").ViewBase
slot1 = class("TownRightPanelView", Dialog)
slot1.RESOURCE_FILENAME = "town_map_right_panel.json"
slot1.RESOURCE_BINDING = {
	rightPanel = "rightPanel",
	["rightPanel.btnEnter"] = {
		varname = "btnEnter",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onEnterClick")
			}
		}
	},
	["rightPanel.btnEnter.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = cc.c4b(255, 255, 255, 255)
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.idx = slot1.idx
	slot0.closeCb = slot1.closeCb
	slot0.enterCb = slot1.enterCb

	slot0.rightPanel:stopAllActions()
	slot0.rightPanel:runAction(cc.Sequence:create(cc.MoveTo:create(0.3, cc.p(slot0.rightPanel:x() - slot0.rightPanel:width(), slot0.rightPanel:y())), cc.CallFunc:create(function ()
	end)))
	slot0:updateRightPanel()
end

function slot1.updateRightPanel(slot0)
	slot1 = slot0.idx

	slot0.rightPanel:get("title"):text(gTownBuildingCsv[slot1][1].name)
	slot0.rightPanel:get("desc"):text(gTownBuildingCsv[slot1][1].descPreview)
	slot0.rightPanel:get("icon"):texture("city/town/map/img_xwslt.png")

	slot3 = false

	slot0.rightPanel:get("updatingText"):visible(false)
	slot0.rightPanel:get("updatingNum"):visible(false)

	if (gGameModel.town:read("buildings") or {})[slot1] and slot2[slot1].finish_time ~= 0 then
		slot0.rightPanel:get("updatingText"):visible(true)
		slot0.rightPanel:get("updatingNum"):visible(true)
		bind.extend(slot0, slot0.rightPanel:get("updatingNum"), {
			class = "cutdown_label",
			props = {
				time = cc.clampf(slot2[slot1].finish_time - time.getTime(), 1, gTownBuildingCsv[slot1][slot2[slot1].level + 1].levelUpCostTime),
				endFunc = function ()
					uv0 = "gGameApp"

					if not slot0 then
						uv0 = true
						uv4 = "/town/building/refresh"

						gGameApp:requestServer("/town/building/refresh", function (slot0)
							uv1 = "updateRightPanel"
							uv3 = "updateRightPanel"

							slot1:updateRightPanel(slot3)
						end, slot4)
					end
				end
			}
		})
	end
end

function slot1.onEnterClick(slot0)
	slot1 = slot0.idx
	slot2 = slot0.enterCb
	slot3 = slot0.closeCb
	slot4 = slot0.addCallbackOnExit

	slot4(slot0, function ()
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
	end)

	uv4 = "idx"

	slot4.onClose(slot0)
end

function slot1.onClose(slot0)
	slot0.rightPanel:stopAllActions()
	slot0.rightPanel:runAction(cc.Sequence:create(cc.MoveTo:create(0.3, cc.p(slot0.rightPanel:x() + slot0.rightPanel:width(), slot0.rightPanel:y())), cc.CallFunc:create(function ()
		uv0 = "closeCb"

		if slot0.closeCb then
			uv0 = "closeCb"

			slot0.closeCb()
		end
	end), cc.DelayTime:create(0.05), cc.CallFunc:create(function ()
		uv0 = "onClose"
		uv1 = "onClose"

		slot0.onClose(slot1)
	end)))
end

return slot1
