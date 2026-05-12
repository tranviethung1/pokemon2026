slot0 = require("lushi.views.model")
slot1 = class("LuShiBattleView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "character.json"
slot1.RESOURCE_BINDING = {}
slot2 = {
	"card_11.png",
	"card_1253.png",
	"card_1423.png",
	"card_1981.png",
	"card_333.png",
	"card_493.png",
	"card_741.png",
	"card_1221.png",
	"card_1261.png",
	"card_1893.png",
	"card_2233.png",
	"card_3543.png",
	"card_631.png",
	"card_761.png",
	"card_1231.png",
	"card_1271.png",
	"card_1903.png",
	"card_2242.png",
	"card_3592.png",
	"card_712.png",
	"card_771.png",
	"card_1241.png",
	"card_1393.png",
	"card_1971.png",
	"card_2351.png",
	"card_3631.png",
	"card_731.png"
}
slot3 = {
	attack = true,
	defence = true
}
slot4 = 0.6
slot5 = 300

function slot6(slot0)
	slot1 = 6

	if slot0 < 580 then
		slot1 = 1
	else
		for slot5 = 1, 5 do
			uv7 = "display"
			uv8 = "display"
			slot7 = (slot5 - 2) * slot8 - 100 + display.cx

			if (slot5 - 3) * slot7 - 100 + display.cx < slot0 and slot0 < slot7 then
				slot1 = slot5 + 1
			end
		end
	end

	return slot1
end

function slot7(slot0, slot1)
	return slot0 > 400 and slot0 < 2100 and slot1 > 250 and slot1 < 600
end

function slot8(slot0, slot1)
	return slot0 > 1000 and slot0 < 2000 and slot1 < 200
end

function slot9(slot0)
	uv2 = "cc"

	return cc.p((slot0 - 3) * slot2 - 100 + display.cx, 500)
end

function slot1.onCreate(slot0)
	slot0:getResourceNode():hide()
	display.director:setProjection(cc.DIRECTOR_PROJECTION_3D)
	slot0:initBattle({}, 1234, false)

	slot0.myCardsAttr = {
		{
			2,
			3
		},
		{
			10,
			3
		},
		{
			2,
			5
		},
		{
			3,
			1
		},
		{
			4,
			6
		},
		{
			8,
			1
		}
	}
	slot0.line = cc.DrawNode:create()

	slot0.line:drawLine(cc.p(0, 0), cc.p(0, 0), cc.c4f(1, 0, 0, 1))
	slot0.line:addTo(slot0, 9999)
	slot0:testManwei()

	slot1 = ccui.Text:create("返 回", "", 60)

	slot1:setTouchEnabled(true)
	slot1:addTo(slot0, 9999):xy(130, display.height - 100):addClickEventListener(function ()
		print("!!!! click back", package.loaded["app.views.lushi.view"])

		package.loaded["app.views.lushi.view"] = nil
		package.loaded["lushi.views.view"] = nil

		gGameUI:switchUI("login.view")
	end)

	slot2 = ccui.Text:create("开始战斗", "", 60)

	slot2:setTouchEnabled(true)
	slot2:addTo(slot0, 9999):xy(130, display.height - 200):addClickEventListener(function ()
		uv0 = "startFight"

		slot0:startFight()
	end)
end

function slot1.initBattle(slot0, slot1, slot2, slot3)
	uv4 = "model"
	slot0.model = slot4.new()

	slot0.model:init(slot1, slot2, slot3)
end

function slot1.onUpdate(slot0, slot1)
	slot0.model:update(slot1)
end

function slot1.enableSpriteClick(slot0, slot1, slot2)
	function slot5(slot0, slot1)
		slot3 = slot0
		uv3 = "getLocation"

		if slot3.onTouchEnded then
			uv3 = "getLocation"
			slot3 = slot3:parent()
			slot4 = slot3
			uv4 = "getLocation"

			slot4.onTouchEnded(slot3.convertToNodeSpace(slot4, slot0.getLocation(slot3)))
		end

		return true
	end

	slot6 = cc.EventListenerTouchOneByOne:create()

	slot6:setSwallowTouches(true)
	slot6:registerScriptHandler(function (slot0, slot1)
		slot3 = slot0
		uv3 = "getLocation"
		slot4 = slot3
		slot3 = slot3.box(slot4)
		uv4 = "getLocation"
		slot4 = slot4:parent():convertToWorldSpace(cc.p(slot3.x, slot3.y))
		slot3.x = slot4.x
		slot3.y = slot4.y

		if cc.rectContainsPoint(slot3, slot0.getLocation(slot3)) then
			uv5 = "getLocation"
			slot5 = slot5.z

			slot5(slot5, 999)

			uv5 = "getLocation"

			if slot5.onTouchBegan then
				uv5 = "getLocation"
				slot5 = slot5:parent()
				slot6 = slot5
				uv6 = "getLocation"

				slot6.onTouchBegan(slot5.convertToNodeSpace(slot6, slot2))
			end

			return true
		else
			uv5 = "box"

			slot5:refreshCardsInHand()
		end

		return false
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot6:registerScriptHandler(function (slot0, slot1)
		slot3 = slot0
		uv3 = "getLocation"

		if slot3.onTouchMoved then
			uv3 = "getLocation"
			slot3 = slot3:parent()
			slot4 = slot3
			uv4 = "getLocation"

			slot4.onTouchMoved(slot3.convertToNodeSpace(slot4, slot0.getLocation(slot3)))
		end

		return true
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot6:registerScriptHandler(slot5, cc.Handler.EVENT_TOUCH_ENDED)
	slot6:registerScriptHandler(slot5, cc.Handler.EVENT_TOUCH_CANCELLED)
	slot1:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot6, slot1)
	slot0:spriteApplyState(slot1, slot2 or "idle")
end

function slot1.enableSpriteLongPress(slot0, slot1)
	function (slot0)
		slot1 = cc.Sprite:create("lushi/card_bg.png")
		uv5 = "cc"
		slot2 = cc.Sprite:create("lushi/" .. slot5[slot0])
		slot3 = nil

		if csv.lushi.equip[slot0] then
			slot3 = cc.Sprite:create("lushi/" .. slot4.res)
		end

		slot2.id = 1000 + slot0
		uv10 = "Sprite"
		uv10 = "create"

		slot2:addTo(slot10, slot2.id):scale(3 * slot10):align(cc.p(0.5, 0.5), slot2:size().width / 2 + cc.p(200, 100).x, display.height - slot2:size().height):hide()
		slot1:addTo(slot2, -99):scale(1.8, 1.5):align(cc.p(0, 0), 0, 0):hide()

		if slot3 then
			slot11 = 100
			slot12 = -80

			slot3:addTo(slot2, 999):scale(2):align(cc.p(0.5, 0.5), slot11, slot12)

			for slot11, slot12 in pairs(slot4.effect) do
				uv13 = "lushi/card_bg.png"

				if slot13[slot11] then
					ccui.Text:create(slot11 .. "+" .. slot12, "font/youmi1.ttf", 50):addTo(slot2, 999):xy(300, -80)
				end
			end
		end

		uv8 = "Sprite"
		slot8 = slot8.addAttr
		uv11 = "Sprite"

		slot8(slot8, slot2, slot11.myCardsAttr[slot0] or {
			3,
			2
		})

		uv8 = "Sprite"

		if not slot8.mapSpr then
			uv8 = "Sprite"
			slot8.mapSpr = {}
		end

		uv8 = "Sprite"
		slot8.mapSpr[slot0] = slot2
	end(slot1.id)

	function slot5(slot0, slot1)
		uv2 = "mapSpr"
		uv3 = "id"

		slot2.mapSpr[slot3.id]:hide()

		return true
	end

	slot6 = cc.EventListenerTouchOneByOne:create()

	slot6:registerScriptHandler(function (slot0, slot1)
		slot3 = slot0
		uv3 = "getLocation"
		slot4 = slot3
		slot3 = slot3.box(slot4)
		uv4 = "getLocation"
		slot4 = slot4:parent():convertToWorldSpace(cc.p(slot3.x, slot3.y))
		slot3.x = slot4.x
		slot3.y = slot4.y

		if cc.rectContainsPoint(slot3, slot0.getLocation(slot3)) then
			uv5 = "box"
			uv6 = "getLocation"

			slot5.mapSpr[slot6.id]:show()

			return true
		end

		return false
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot6:registerScriptHandler(function (slot0, slot1)
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot6:registerScriptHandler(slot5, cc.Handler.EVENT_TOUCH_ENDED)
	slot6:registerScriptHandler(slot5, cc.Handler.EVENT_TOUCH_CANCELLED)
	slot1:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot6, slot1)
	slot0:spriteApplyState(slot1, "idle")
end

slot10 = 0
slot11, slot12 = nil

function slot13()
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
end

function slot1.setInHand(slot0, slot1)
	if not slot1.idInHand then
		slot1:getChildByTag(1):hide()

		if slot0.choose[slot1.idInChoose] == slot1 then
			slot0.choose[slot1.idInChoose] = nil
			slot1.idInChoose = nil

			table.insert(slot0.inHand, slot1)
		end

		slot1.idInHand = #slot0.inHand
	end

	uv3 = "idInHand"
	slot5 = {
		x = -15
	}
	uv5 = "getChildByTag"

	slot1:align(cc.p(0.5, 0.5), (slot1.idInHand - 1) * slot3 * 2 / 3 + display.cx, 120):setRotation3D(slot5):scale(slot5 * 1.2)
end

function slot1.refreshCardsInHand(slot0)
	for slot4, slot5 in ipairs(slot0.inHand) do
		slot5.idInHand = slot4
		slot5.isDrawOut = false
		slot6 = slot0.mapSpr[slot5.id]
		slot7 = slot6

		slot6.hide(slot7)

		uv7 = "ipairs"
		slot9 = cc.p(0.5, 0.5)
		uv9 = "inHand"

		slot5:align(slot9, (slot5.idInHand - 1) * slot7 * 2 / 3 + display.cx, 120):scale(slot9 * 1.2):z(slot4)
	end
end

function slot1.refreshCardsInEmbattle(slot0)
	for slot4, slot5 in ipairs(slot0.inEmbattle) do
		if not slot5.isFakeCard then
			slot5.idInEmbattle = slot4
			uv6 = "ipairs"
			slot6 = slot6(slot5.idInEmbattle)
			slot9 = cc.p(0.5, 0.5)
			uv9 = "inEmbattle"

			slot5:align(slot9, slot6.x, slot6.y):scale(slot9):setRotation3D({
				x = -15
			})
		end
	end
end

function slot1.drawOutCard(slot0, slot1)
	slot0:refreshCardsInHand()

	if slot1.isDrawOut then
		return
	end

	for slot6, slot7 in ipairs(slot0.inHand) do
		if slot6 == slot1.idInHand then
			slot1:z(9999)

			slot8, slot9 = slot1:getPosition()

			slot1:setPosition(slot8, slot9 + 100)

			slot1.isDrawOut = true

			slot0.mapSpr[slot1.id]:show()
		end
	end
end

function slot1.cleanFakeCardInEmbattle(slot0)
	for slot4, slot5 in ipairs(slot0.inEmbattle) do
		if slot5.isFakeCard then
			table.remove(slot0.inEmbattle, slot4)
		end
	end
end

function slot1.setFakeCardInEmbattle(slot0, slot1)
	if #slot0.inEmbattle >= 6 then
		return
	end

	if slot1 > #slot0.inEmbattle + 1 then
		slot1 = #slot0.inEmbattle + 1 or slot1
	end

	if slot1 > 6 then
		return
	end

	table.insert(slot0.inEmbattle, slot1, {
		isFakeCard = true
	})
	slot0:refreshCardsInEmbattle()
end

function slot1.setInEmbattle(slot0, slot1, slot2, slot3)
	if #slot0.inEmbattle >= 6 then
		return false
	end

	slot3 = slot3 or slot1.idInEmbattle or 1

	if slot1.idInHand then
		table.remove(slot0.inHand, slot1.idInHand)

		slot1.idInHand = nil

		slot0:refreshCardsInHand()
		slot1:getChildByTag(1):hide()
	end

	if slot3 > #slot0.inEmbattle + 1 then
		slot3 = #slot0.inEmbattle + 1 or slot3
	end

	table.insert(slot0.inEmbattle, slot3, slot1)

	slot1.idInEmbattle = slot3

	if slot2 then
		slot5 = slot0
		slot4 = slot0.spriteAcquireState(slot5, slot1, "inEmbattle")
		uv5 = "inEmbattle"
		slot5 = slot5(slot3)

		slot1:runAction(cc.Sequence:create(transition.newEasing(cc.MoveTo:create(0.2, cc.p(slot5.x, slot5.y + 120)), "EXPONENTIALOUT"), cc.DelayTime:create(0.1), transition.newEasing(cc.MoveTo:create(0.3, slot5), "BOUNCEOUT"), cc.CallFunc:create(function ()
			uv0 = "refreshCardsInEmbattle"

			slot0()

			uv0 = "refreshCardsInEmbattle"

			slot0:refreshCardsInEmbattle()
		end)))
	else
		slot0:spriteApplyState(slot1, "inEmbattle")
		slot0:refreshCardsInEmbattle()
	end

	return true
end

slot14 = {
	idle = {
		onTouchMoved = function ()
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
		end,
		onTouchEnded = function (slot0, slot1, slot2)
			if slot1.idInChoose then
				uv3 = "idInChoose"

				if slot3(slot2.x, slot2.y) then
					slot0:setInHand(slot1)
					slot0:spriteApplyState(slot1, "inhand")
				end
			end
		end,
		autoMove = function (slot0, slot1, slot2)
			slot4, slot5 = slot1:xy()
			slot8 = (slot1.id - 2) * 150 + display.cx
			slot10 = 2
			slot11 = 0.2
			slot12 = 1
			slot13 = (slot4 - slot8) / 400 * 30

			print(slot13)

			slot21 = cc.RotateTo
			slot22 = slot21
			slot24 = {
				x = 0,
				y = 0
			}

			slot1:runAction(transition.newEasing(cc.Sequence:create(cc.RotateBy:create(slot10, {
				x = 20,
				y = slot13
			}), cc.DelayTime:create(slot11), slot21.create(slot22, slot12, slot24)), "BACKOUT"))

			uv22 = "spriteAcquireState"
			uv24 = "spriteAcquireState"

			slot1:runAction(transition.newEasing(cc.Sequence:create(cc.ScaleTo:create(slot10, 2 * slot22), cc.DelayTime:create(slot11), cc.ScaleTo:create(slot12, slot24)), "BACKOUT"))
			slot1:runAction(transition.newEasing(cc.Sequence:create(cc.RotateBy:create(slot10, {
				x = 20,
				y = slot13
			}), cc.DelayTime:create(slot11), cc.RotateTo:create(slot12, {
				x = 0,
				y = 0
			})), "BACKOUT"))
			slot1:runAction(cc.Sequence:create(transition.newEasing(cc.MoveTo:create(slot10, cc.p((slot1.id - 2) * 500 + display.cx, display.cy)), "BACKOUT"), cc.DelayTime:create(slot11), transition.newEasing(cc.MoveTo:create(slot12, cc.p(slot8, 120)), "BACKOUT"), cc.DelayTime:create(slot11), transition.newEasing(cc.MoveTo:create(slot10 + 1, cc.p(slot4, slot5)), "BACKOUT"), cc.CallFunc:create(slot0:spriteAcquireState(slot1, "inhand"))))
		end
	},
	inhand = {
		onTouchBegan = function (slot0, slot1, slot2)
		end,
		onTouchMoved = function (slot0, slot1, slot2)
			if slot1.isDrawOut then
				slot3, slot4 = slot1:getPosition()

				for slot8, slot9 in pairs(slot0.inEmbattle) do
					slot10, slot11 = slot9:getPosition()
					slot12 = 0.6 * slot9:size().width
					slot13 = 0.6 * slot9:size().height

					if slot10 - slot12 / 2 <= slot2.x and slot2.x <= slot10 + slot12 / 2 and slot11 - slot13 / 2 <= slot2.y and slot2.y <= slot11 + slot13 / 2 then
						slot0.line:clear()

						for slot21 = -5, 5 do
							slot0.line:drawLine(cc.p(slot3 + slot21, slot4 + slot21), cc.p(slot2.x + slot21, slot2.y + slot21), cc.c4f(1, 0, 0, 1))
							slot0.line:drawLine(cc.p(slot3 + slot21, slot4 - slot21), cc.p(slot2.x + slot21, slot2.y - slot21), cc.c4f(1, 0, 0, 1))
						end

						slot9.eqiupSlot:show()
					else
						slot9.eqiupSlot:hide()
					end

					if slot2.x >= slot15 - 100 and slot2.x <= slot15 and slot2.y >= slot17 - 100 and slot2.y <= slot17 then
						slot0:addEquip(slot9, slot1)
					end
				end

				return
			end

			slot1:setPosition(slot2.x, slot2.y)

			slot3 = display.director
			slot4 = slot3
			uv4 = "isDrawOut"

			if slot4 ~= nil then
				uv4 = "isDrawOut"

				if slot3.getTotalFrames(slot4) == slot4 then
					uv0 = 1.2
					uv1 = 100
				else
					uv4 = "pairs"
					uv6 = "getPosition"

					slot4(slot1, slot6, slot2)

					uv0 = 1.2
					uv1 = 100
				end
			end

			slot4 = slot0.cleanFakeCardInEmbattle

			slot4(slot0)

			uv4 = "inEmbattle"

			if slot4(slot2.x, slot2.y) then
				slot4 = slot1.setScale
				uv6 = "size"

				slot4(slot1, 1.2 * slot6)

				uv4 = "width"

				slot0:setFakeCardInEmbattle(slot4(slot2.x))
			else
				slot0:refreshCardsInEmbattle()
			end
		end,
		onTouchEnded = function (slot0, slot1, slot2)
			uv3 = "x"

			if slot3(slot2.x, slot2.y) and not slot1.isDrawOut then
				slot3 = slot0.cleanFakeCardInEmbattle

				slot3(slot0)

				uv3 = "y"

				if not slot0:setInEmbattle(slot1, true, slot3(slot2.x)) then
					slot0:setInHand(slot1)

					return
				end
			else
				slot0:setInHand(slot1)
				slot0:drawOutCard(slot1)
			end

			slot0.line:clear()
		end
	},
	inEmbattle = {
		onTouchBegan = function (slot0, slot1, slot2)
			for slot6, slot7 in ipairs(slot0.inEmbattle) do
				if slot1 == slot7 then
					table.remove(slot0.inEmbattle, slot6)

					break
				end
			end

			uv5 = "ipairs"

			slot1:setScale(1.2 * slot5)
		end,
		onTouchMoved = function ()
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
		end,
		onTouchEnded = function (slot0, slot1, slot2)
			uv3 = "x"

			if slot3(slot2.x, slot2.y) then
				slot3 = slot0.cleanFakeCardInEmbattle

				slot3(slot0, slot1)

				uv3 = "y"

				slot0:setInEmbattle(slot1, true, slot3(slot2.x))
			else
				slot0:setInEmbattle(slot1)
			end
		end,
		autoAttack = function (slot0, slot1, slot2)
			slot4, slot5 = slot1:xy()

			slot1:runAction(cc.Sequence:create(transition.newEasing(cc.MoveTo:create(0.3, cc.p(slot4 - 30, slot5 + 90)), "BOUNCEOUT"), cc.DelayTime:create(0.2), transition.newEasing(cc.MoveTo:create(0.8, cc.p(slot2.x, slot2.y)), "EXPONENTIALIN"), transition.newEasing(cc.MoveTo:create(0.8, cc.p(slot4, slot5)), "EXPONENTIALOUT"), cc.CallFunc:create(slot0:spriteAcquireState(slot1, "inEmbattle"))))

			slot8 = slot1.curTarget
			slot9 = cc.p(slot8:getPosition())

			slot8:runAction(cc.Sequence:create(cc.DelayTime:create(1.3), cc.MoveTo:create(0.05, cc.p(slot9.x + 35, slot9.y)), cc.MoveTo:create(0.05, cc.p(slot9.x - 35, slot9.y)), cc.MoveTo:create(0.05, cc.p(slot9.x, slot9.y + 35)), cc.MoveTo:create(0.05, cc.p(slot9.x, slot9.y - 35)), cc.MoveTo:create(0.05, cc.p(slot9.x + 35, slot9.y + 35)), cc.MoveTo:create(0.05, cc.p(slot9.x - 35, slot9.y - 35)), cc.MoveTo:create(0.05, cc.p(slot9.x, slot9.y))))
		end
	}
}

function slot15(slot0, slot1, slot2)
	if slot2 == nil then
		return
	end

	return function ()
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
end

function slot1.spriteAcquireState(slot0, slot1, slot2)
	slot4 = not slot1.stateLock

	assert(slot4, slot1.state .. " state lock")

	uv4 = "assert"

	assert(slot4[slot2], slot2 .. " state undefined")

	if slot1.stateLock then
		return
	end

	slot1.state = slot2
	slot1.stateLock = true
	slot1.onTouchBegan = nil
	slot1.onTouchMoved = nil
	slot1.onTouchEnded = nil

	return function ()
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
end

function slot1.spriteApplyState(slot0, slot1, slot2)
	slot1.state = slot2
	slot3 = false
	slot1.stateLock = slot3
	uv3 = "state"
	uv6 = "stateLock"
	slot6 = slot6[slot2].onTouchBegan
	slot3 = slot3(slot0, slot1, slot6)
	slot1.onTouchBegan = slot3
	uv3 = "state"
	uv6 = "stateLock"
	slot6 = slot6[slot2].onTouchMoved
	slot3 = slot3(slot0, slot1, slot6)
	slot1.onTouchMoved = slot3
	uv3 = "state"
	uv6 = "stateLock"
	slot6 = slot6[slot2].onTouchEnded
	slot3 = slot3(slot0, slot1, slot6)
	slot1.onTouchEnded = slot3
	uv3 = "state"
	uv6 = "stateLock"
	slot6 = slot6[slot2].autoAttack
	slot3 = slot3(slot0, slot1, slot6)
	slot1.autoAttack = slot3
	uv3 = "state"
	uv6 = "stateLock"
	slot1.autoMove = slot3(slot0, slot1, slot6[slot2].autoMove)
end

function slot1.addAttr(slot0, slot1, slot2)
	slot3 = ccui.Text:create(slot2[1], "font/youmi1.ttf", 100)
	slot4 = ccui.Text:create(slot2[2], "font/youmi1.ttf", 100)
	slot5 = cc.Sprite:create("lushi/equip_box.png")
	slot6 = slot1:size().width
	slot8 = cc.c3b(0, 0, 0)

	slot3:color(slot8)
	slot4:color(slot8)
	slot3:addTo(slot1, 9999):xy(60, 80)
	slot4:addTo(slot1, 9999):xy(slot6 - 50, 80)

	slot1.eqiupSlot = slot5

	slot5:addTo(slot1, 9999):scale(0.8):align(cc.p(0, 0), 0.6 * slot6 - 10, 0.6 * slot1:size().height):hide()
end

function slot1.addEquip(slot0, slot1, slot2)
	uv6 = "cc"

	slot1.eqiupSlot:hide()
	slot0.mapSpr[slot2.id]:removeSelf()
	slot2:removeSelf()
	slot0.line:clear()
	cc.Sprite:create("lushi/" .. slot6[slot2.id]):addTo(slot1, 9999):scale(0.4):xy(0.8 * slot1:size().width - 5, 0.8 * slot1:size().height - 5)
end

function slot1.startFight(slot0)
	for slot4, slot5 in pairs(slot0.enermy) do
		slot5:show()
	end

	for slot4, slot5 in pairs(slot0.choose) do
		slot5:hide()
	end

	slot2, slot3 = slot0.enermy[math.random(1, #slot0.enermy)]:getPosition()

	performWithDelay(slot0, function ()
		uv0 = "inEmbattle"

		if slot0.inEmbattle[1].autoAttack then
			slot1 = slot0:parent()
			slot2 = slot1
			uv4 = "autoAttack"
			uv5 = "parent"
			uv2 = "convertToNodeSpace"
			slot0.curTarget = slot2

			slot0.autoAttack(slot1.convertToNodeSpace(slot2, cc.p(slot4, slot5)))
		end
	end, 0.2)
end

function slot1.testManwei(slot0)
	slot5 = display.cx

	cc.Sprite:create("lushi/bg_manwei.png"):addTo(slot0, -99, "bg"):scale(1.3):align(cc.p(0.5, 0.5), slot5, display.cy)

	slot0.inEmbattle = {}

	for slot5 = 1, 4 do
		slot7 = cc.Sprite
		slot8 = slot7
		uv10 = "cc"
		slot7 = slot7.create(slot8, "lushi/" .. slot10[slot5])
		uv8 = "Sprite"
		slot8 = slot8(slot5)
		slot11 = slot0
		uv11 = "create"

		slot7:addTo(slot11, slot5):scale(slot11):align(cc.p(0.5, 0.5), slot8.x, slot8.y):setRotation3D({
			x = -15
		})
		cc.Sprite:create("lushi/card_bg.png"):addTo(slot7, -99):scale(1.8, 1.5):align(cc.p(0, 0), 0, 0):hide()

		slot7.id = slot5
		slot7.layer = layer
		slot0.inEmbattle[slot5] = slot7
		slot7.idInEmbattle = slot5

		slot0:addAttr(slot7, slot0.myCardsAttr[slot7.id] or {
			3,
			2
		})
		slot0:enableSpriteLongPress(slot7)
		slot0:enableSpriteClick(slot7, "inEmbattle")
	end

	slot0.choose = {}

	for slot5 = 1, 3 do
		uv10 = "cc"
		uv11 = "cc"
		slot9 = "lushi/" .. slot10[#slot11 - slot5]
		slot7 = cc.Sprite:create(slot9)
		uv9 = "lushi/bg_manwei.png"
		slot11 = slot0

		slot7:addTo(slot11, slot5)

		uv11 = "create"

		slot7:scale(slot11 * 1.2):align(cc.p(0.5, 0.5), (slot5 - 2) * slot9 * 1.2 - 100 + display.cx, display.height - 400)

		slot9 = cc.Sprite:create("lushi/card_bg.png"):addTo(slot7, -99, 1):scale(1.8, 1.5)
		slot9 = slot9.align

		slot9(slot9, cc.p(0, 0), 0, 0)

		slot7.idInChoose = slot5
		uv9 = "cc"
		slot7.id = #slot9 - slot5
		slot7.layer = layer
		slot0.choose[slot5] = slot7

		slot0:addAttr(slot7, slot0.myCardsAttr[slot7.id] or {
			3,
			2
		})
		slot0:enableSpriteLongPress(slot7)
		slot0:enableSpriteClick(slot7)
	end

	slot0.inHand = {}
	slot0.enermy = {}

	for slot5 = 1, 6 do
		uv10 = "cc"
		slot9 = "lushi/" .. slot10[slot5]
		slot7 = cc.Sprite:create(slot9)
		uv9 = "lushi/bg_manwei.png"
		slot11 = slot0
		uv11 = "create"

		slot7:addTo(slot11, -slot5):scale(slot11):align(cc.p(0.5, 0.5), (slot5 - 3) * slot9 - 100 + display.cx, 1000):setRotation3D({
			x = -15
		}):hide()
		cc.Sprite:create("lushi/card_bg.png"):addTo(slot7, -99):scale(1.8, 1.5):align(cc.p(0, 0), 0, 0):hide()

		slot7.idInEnermy = slot5
		slot7.layer = layer
		slot0.enermy[slot5] = slot7
	end

	if false then
		slot0:hide()
		performWithDelay(slot0, function ()
			uv0 = "show"
			slot0 = slot0.show

			slot0(slot0)

			uv0 = "show"
			slot1 = cc.NodeGrid:create()
			slot3 = slot1.addTo

			slot3(slot1, slot0:parent(), i)

			uv3 = "show"

			slot3:retain():autorelease():removeSelf():addTo(slot1)
			slot1:runAction(cc.Sequence:create(cc.FadeOutTRTiles:create(1, cc.size(50, 50)):reverse(), cc.CallFunc:create(function ()
				uv0 = "retain"
				slot0 = slot0:retain():autorelease():removeSelf()
				slot0 = slot0.addTo
				uv2 = "autorelease"

				slot0(slot0, slot2)

				uv0 = "removeSelf"

				slot0:removeSelf()
			end)))
		end, 0.2)
	end
end

return slot1
