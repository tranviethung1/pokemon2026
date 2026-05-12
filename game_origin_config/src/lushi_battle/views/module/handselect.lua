slot0 = class("AutoChessCardSelect", battleModule.CBase)

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.selectLayer = cc.LayerColor:create(cc.c4b(0, 0, 0, 0), display.width, display.height)

	slot0.selectLayer:retain()
	slot0.selectLayer:setName("selectLayer")
	slot0.selectLayer:setVisible(true)
	slot0.selectLayer:setTouchMode(cc.TOUCHES_ONE_BY_ONE)
	slot0.selectLayer:setSwallowsTouches(true)
	slot0.selectLayer:setTouchEnabled(false)
	slot0.selectLayer:setLocalZOrder(9999)
	slot0.selectLayer:addTo(slot0.parent.handSelect):xy(0, 0)
	slot0.selectLayer:registerScriptTouchHandler(functools.partial(slot0.onTouchEvent, slot0))

	slot2 = slot0.parent.handSelect:get("cancel")

	slot2:removeFromParent()
	slot2:addTo(slot0.selectLayer, 1)
	slot2:setTitleFontSize(50)

	slot0.btn = slot2

	bind.touch(slot0, slot2, {
		clicksafe = true,
		methods = {
			ended = function ()
				uv0 = "onCancel"

				slot0:onCancel()
			end
		}
	})

	slot0.shadows = {}
end

function slot0.onTouchEvent(slot0, slot1, slot2, slot3)
	if slot1 == "ended" and AutoChessEasy.getEmbaltteSprByPos(slot0.parent.gameLayer:convertToNodeSpace(cc.p(slot2, slot3)), slot0.parent) then
		slot0.parent:handleOperation(lushi.OperateTable.handCardSelect, slot0.obj.id, slot0.insertIndex, slot5.id)
	end

	return true
end

function slot0.onShowHandSelect(slot0, slot1, slot2)
	slot0.parent.handSelect:setVisible(true)
	slot0.selectLayer:setTouchEnabled(true)

	slot3 = slot0.parent:onViewProxyCall("getSceneObj", slot1.id)
	slot4 = ListSprite.new(slot0.parent, slot1, tostring(slot1) .. "list")

	slot4:addTo(slot0.selectLayer)
	slot4:init()
	slot4:onAddToScene()
	slot4:setClickEnable(false)
	slot4:setPosition(slot0.btn:x(), display.height / 2 + 160)

	slot0.listSpr = slot4
	slot0.spr = slot3
	slot0.obj = slot1
	slot0.insertIndex = slot2

	slot3:hide()
	slot0:createText()
	slot0:addShadow()
end

function slot0.createText(slot0)
	slot1 = slot0.parent.handSelectPanel
	slot2 = slot0.parent.handSelectBg
	slot5 = rich.createByStr(uiEasy.autoChessDesc(slot0.obj.unitCfg.findDesc, {}, {
		defaultColor = "#C0x5B545B#",
		noOutLine = true,
		env = {
			self = {
				star = function ()
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
			},
			star = slot0.obj:getStar()
		}
	}), 44):anchorPoint(0.5, 0.5):xy(slot1:width() / 2, slot1:height() / 2):addTo(slot1, 2000)

	slot5:formatText()
	slot2:size(math.min(slot5:size().width + 100, 1024), slot2:size().height)

	slot0.richText = slot5
end

function slot0.addShadow(slot0)
	slot2 = slot0.parent.handSelect

	for slot6, slot7 in slot0.parent:getSceneModel().heros:order_pairs() do
		if not slot7.isFakeCard and not slot0.parent._model.scene:checkHandSelect(slot0.obj.id, slot7.id) then
			slot8 = slot0.parent:onViewProxyCall("getSceneObjById", slot7.id)
			slot9 = slot2:convertToNodeSpace(slot8:parent():convertToWorldSpace(cc.p(slot8:x(), slot8:y())))
			slot10 = cc.Sprite:create("lushi/img_ty.png")

			slot10:addTo(slot2, 1):scale(1):align(cc.p(0.5, 0.5), slot9.x, slot9.y):setRotation3D({
				x = -15
			}):show()
			table.insert(slot0.shadows, slot10)
		end
	end
end

function slot0.onCancel(slot0)
	slot0.spr:resetSpriteState()
	slot0.parent:handleOperation(lushi.OperateTable.handCardCancel)
	slot0:quit()
end

function slot0.onHandSelectConfirm(slot0)
	slot0:quit()
end

function slot0.quit(slot0)
	slot0.parent.handSelect:setVisible(false)
	slot0.selectLayer:setTouchEnabled(false)

	if slot0.richText then
		slot0.richText:removeFromParent()

		slot0.richText = nil
	end

	if slot0.spr then
		slot0.spr:show()
	end

	if slot0.listSpr then
		slot0.listSpr:removeFromParent()
	end

	for slot4, slot5 in ipairs(slot0.shadows) do
		slot5:removeFromParent()
	end

	slot0.shadows = {}
	slot0.spr = nil
	slot0.obj = nil
	slot0.listSpr = nil
end

return slot0
