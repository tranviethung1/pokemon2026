slot0 = class("AwatdList", battleModule.CBase)
slot1 = 480
slot2 = 350

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.awardList = slot0.parent.awardList
	slot0.bg = slot0.awardList:get("bg")
	slot0.titleSpr = slot0.awardList:get("titleSpr")
	slot0.scrollView = slot0.awardList:get("scrollView")

	slot0.scrollView:setScrollBarEnabled(false)

	slot0.goldCard = slot0.scrollView:get("goldCard")
	slot0.goldNum = slot0.goldCard:get("num")

	slot0.awardList:addTouchEventListener(function (slot0, slot1)
		uv2 = "onShowAwardList"

		slot2:onShowAwardList(false)
	end)

	slot0.cards = {}
end

function slot0.onShowAwardList(slot0, slot1, slot2, slot3, slot4)
	if slot1 then
		slot0:initCards(slot2, slot3)

		slot5 = lushi.AwardListResName[slot4]

		slot0.bg:loadTexture(string.format("lushi/pop/bg_zzq_%s.png", slot5))
		slot0.bg:setScale9Enabled(true)
		slot0.bg:setCapInsets(cc.rect(502, 408, 2, 1))
		slot0.titleSpr:loadTexture(string.format("lushi/pop/img_zzq_%s.png", slot5))
	else
		slot0:clearAll()
		gRootViewProxy:notify("setShopVisible", true, "fight", true)
	end

	slot0.awardList:setVisible(slot1)
end

function slot0.createSpr(slot0, slot1)
	slot2 = ListSprite.new(slot0.parent, slot1, tostring(slot1) .. "list")

	slot2:init()
	slot2:addTo(slot0.scrollView)
	slot2:onAddToScene()
	slot2:setClickEnable(false)
	slot2:scale(1.4)

	return slot2
end

function slot0.initCards(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot1) do
		table.insert(slot0.cards, slot0:createSpr(slot7))
	end

	if slot2 then
		slot0.goldCard:show()
		slot0.goldNum:setText("x" .. slot2)
	end

	slot0:updatePos(slot2 and 1 or 0)
end

function slot0.updatePos(slot0, slot1)
	slot2 = slot0.scrollView:getBoundingBox()
	slot4 = slot0.cards
	slot3 = table.length(slot4) + slot1
	uv4 = "scrollView"
	uv5 = "getBoundingBox"
	slot5 = slot0.scrollView

	slot5:setInnerContainerSize(cc.size(math.max(slot2.width, slot3 * slot4 + slot5), slot2.height))

	uv5 = "getBoundingBox"
	slot6 = 260

	if slot3 <= 4 then
		uv9 = "scrollView"
		slot5 = slot2.width / 2 - (slot3 - 1) * slot9 / 2
	end

	for slot11, slot12 in ipairs(slot0.cards) do
		function ()
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
		end(slot12)
	end

	slot0.goldCard:x(slot5)
end

function slot0.clearAll(slot0)
	for slot4, slot5 in ipairs(slot0.cards) do
		slot5:sceneDelObj(slot0.parent.deleteObjLayer)
	end

	slot0.cards = {}

	slot0.goldCard:hide()
	slot0.parent:clearDeleteObjLayer()
end

return slot0
