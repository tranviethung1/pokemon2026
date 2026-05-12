slot0 = "connecting"
slot1 = cc.load("message")
slot2 = class("GameUI")
slot3 = 2105271208
slot4 = {
	modal = 99,
	connecting = 99,
	guide = 10,
	view = 1,
	tip = 11,
	achievementTip = 9,
	timeSpeeder = 100
}

function slot2.ctor(slot0, slot1)
	globals.gGameUI = slot0
	globals.gRootViewProxy = ViewProxy.new()
	slot0.app = slot1
	slot0.scene = nil
	slot0.uiStack = {}
	slot0.modalStack = {}
	slot0.tipQueue = {}
	slot0.achievementTipQueue = {}
	slot0.achievementTipWaitQueue = {}
	slot0.delayCalls = {}
	slot0.singletonViews = {}
	slot0.topuiManager = require("app.views.topui.manager").new()
	slot0.guideManager = require("app.views.guide.manager").new()
	slot0.guideManagerLocal = require("app.views.guide.manager_local").new()
	slot0.timeSpeederManager = require("app.views.common.time_speeder.manager").new()
	slot0.effectAllCount = 0
	slot0.modalLayer = cc.LayerColor:create(cc.c4b(120, 0, 0, 0), display.width, display.height)
	slot0.viewLayer = cc.LayerColor:create(cc.c4b(0, 120, 0, 0), display.width, display.height)
	slot0.guideLayer = cc.LayerColor:create(cc.c4b(0, 0, 120, 0), display.width, display.height)
	slot0.timeSpeederLayer = cc.LayerColor:create(cc.c4b(120, 0, 0, 200), 0, 0)
	slot0.connectingLayer = ccui.Layout:create()
	slot0.isMultiTouches = false
	slot0.outSceneNode = nil
	slot0.rootViewName = nil
	slot0.avoidClickCount = 0

	slot0:onCreate()
end

function slot2.tryCloseItemDetail(slot0, slot1)
	if slot0.itemDetailView then
		slot2 = false

		if (not slot0.itemDetailView.hitTestPanel or not slot0.itemDetailView:hitTestPanel(slot1)) and true then
			slot0.itemDetailView:onClose()

			slot0.itemDetailView = nil

			return true
		end
	end

	return false
end

function slot2.automationTryCloseItemDetail(slot0)
	if slot0.itemDetailView then
		slot0.itemDetailView:onClose()

		slot0.itemDetailView = nil
	end
end

function slot2.onCreate(slot0)
	slot0.modalLayer:retain()
	slot0.modalLayer:setName("modalLayer")
	slot0.modalLayer:setVisible(false)
	slot0.modalLayer:setTouchMode(cc.TOUCHES_ONE_BY_ONE)
	slot0.modalLayer:setSwallowsTouches(true)

	slot3 = false

	slot0.modalLayer:setTouchEnabled(slot3)

	uv3 = "modalLayer"

	slot0.modalLayer:setLocalZOrder(slot3.modal)
	slot0.modalLayer:registerScriptTouchHandler(function (slot0, slot1, slot2)
		return true
	end)
	slot0.viewLayer:retain()
	slot0.viewLayer:setName("viewLayer")

	slot3 = false

	slot0.viewLayer:setTouchEnabled(slot3)

	uv3 = "modalLayer"

	slot0.viewLayer:setLocalZOrder(slot3.view)
	slot0.guideLayer:retain()
	slot0.guideLayer:setName("guideLayer")
	slot0.guideLayer:setVisible(false)

	slot3 = true

	slot0.guideLayer:setTouchEnabled(slot3)

	uv3 = "modalLayer"

	slot0.guideLayer:setLocalZOrder(slot3.guide)
	slot0.connectingLayer:retain()
	slot0.connectingLayer:setName("connectingLayer")
	slot0.connectingLayer:setVisible(false)
	slot0.connectingLayer:setContentSize(display.sizeInView)

	slot3 = true

	slot0.connectingLayer:setTouchEnabled(slot3)

	uv3 = "modalLayer"

	slot0.connectingLayer:setLocalZOrder(slot3.connecting)
	slot0.connectingLayer:setPosition(cc.p(display.board_left, 0))
	slot0.timeSpeederLayer:retain()
	slot0.timeSpeederLayer:setName("timeSpeederLayer")
	slot0.timeSpeederLayer:hide()

	slot3 = false

	slot0.timeSpeederLayer:setTouchEnabled(slot3)

	uv3 = "modalLayer"

	slot0.timeSpeederLayer:setLocalZOrder(slot3.timeSpeeder)

	slot1 = cc.EventListenerTouchOneByOne:create()

	slot1:setSwallowTouches(true)
	slot1:registerScriptHandler(function (slot0, slot1)
		uv2 = "tryCloseItemDetail"
		slot3 = slot2

		slot2.tryCloseItemDetail(slot3, slot0:getLocation())

		slot2 = false
		uv3 = "tryCloseItemDetail"

		if not slot3.isMultiTouches and cc.Device.setMultipleTouchEnabled == nil and #display.director:getOpenGLView():getAllTouches() > 1 then
			slot2 = true
		end

		return slot2
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	display.director:getEventDispatcher():addEventListenerWithFixedPriority(slot1, -999)

	slot0.outSceneNode = cc.Node:create()

	display.director:setNotificationNode(slot0.outSceneNode)

	if CC_DESIGN_RESOLUTION.autoscale == "SHOW_ALL" then
		slot4 = slot0.outSceneNode
		slot6 = display.sizeInPixels.height / display.sizeInView.height
		slot7 = math.min(display.sizeInPixels.width / display.sizeInView.width, slot6)
		slot8 = (display.sizeInPixels.height - slot7 * display.sizeInView.height) / 2
		slot9 = cc.Sprite:create("img/scene_board_bottom.png")

		slot9:setFlippedY(true)
		slot9:setAnchorPoint(0, 0)
		slot9:setContentSize(2560, 315)
		slot9:setPosition(0, (slot8 + slot7 * display.sizeInView.height) / slot6)
		slot4:addChild(slot9)

		slot10 = cc.Sprite:create("img/scene_board_bottom.png")

		slot10:setAnchorPoint(0, 1)
		slot10:setContentSize(2560, 315)
		slot10:setPosition(0, slot8 / slot6)
		slot4:addChild(slot10)
	end

	if display.uiOriginMax.x < display.uiOrigin.x then
		slot4 = slot0.outSceneNode
		slot5 = display.uiOrigin.x - display.uiOriginMax.x
		slot6 = cc.Sprite:create("img/scene_board_right.png")

		slot6:setFlippedX(true)
		slot6:setAnchorPoint(1, 0)
		slot6:setContentSize(600, 1440)
		slot6:setPosition(slot5, 0)
		slot4:addChild(slot6)

		slot7 = cc.Sprite:create("img/scene_board_right.png")

		slot7:setAnchorPoint(0, 0)
		slot7:setContentSize(600, 1440)
		slot7:setPosition(slot5 + display.maxWidth, 0)
		slot4:addChild(slot7)
	end

	cache.addTexturePreload(ui.ATTR_LOGO, "common_ui")
	cache.addTexturePreload(ui.ATTR_ICON, "common_ui")
	cache.addTexturePreload(ui.SKILL_ICON, "common_ui")
	cache.addTexturePreload(ui.SKILL_TEXT_ICON, "common_ui")
	cache.addTexturePreload(ui.RARITY_ICON, "common_ui")
	cache.addTexturePreload(ui.COMMON_ICON, "common_ui")
	cache.addTexturePreload(ui.QUALITY_BOX, "common_ui")
	cache.addTexturePreload(ui.QUALITY_FRAME, "common_ui")
	cache.addTexturePreload(ui.VIP_ICON, "common_ui")
	cache.addTexturePreload(battle.SpriteRes, "battle_module", pngPath)
	cache.addTexturePreload(battle.ShowHeadNumberRes, "battle_module", pngPath)
	cache.addTexturePreload(battle.MainAreaRes, "battle_module", pngPath)
	cache.addTexturePreload(battle.StageRes, "battle_module", pngPath)
	cache.addTexturePreload(battle.RestraintTypeIcon, "battle_module", pngPath)
	cache.texturePreload("common_ui")
	display.director:setFontAutoScaleDownEnabled(true)
	slot0:showTimeSpeederIcon()
end

function slot2.switchUI(slot0, slot1, ...)
	slot0:cleanTip()

	if slot1 == "battle.view" then
		slot0:cleanAchievementTip()
		slot0.timeSpeederManager.setTimeRate(0.2)
	else
		slot0.timeSpeederManager.setTimeRate(1)
	end

	slot0.guideManager:setIgnoreGuide(true)
	slot0.guideManagerLocal:setIgnoreGuide(true)

	if slot0.rootViewName == slot1 then
		slot0:goBackInStackUI(slot1)
		slot0.guideManager:setIgnoreGuide(false)
		slot0.guideManager:checkGuide({
			name = slot1
		})
		slot0.guideManagerLocal:setIgnoreGuide(false)
		slot0.guideManagerLocal:checkGuide({
			name = slot1
		})

		return slot0.uiRoot
	end

	if slot0.uiRoot then
		slot0.uiRoot:onClose()

		slot0.uiRoot = nil
	end

	slot3 = false
	slot0.rootViewName = slot1

	if slot0.stashUI and slot0.stashUIName == slot1 then
		slot0.uiRoot = slot0.stashUI

		slot0.uiRoot:beginRebuild()

		slot0.stashUIName = nil
		slot0.stashUI = nil
		slot3 = true
	else
		slot0.uiRoot = slot0:createView(slot1)
	end

	slot0:showWithScene(slot0.uiRoot)
	slot0.uiRoot:setContentSize(display.sizeInView)

	gRootViewProxy = ViewProxy.new(slot0.uiRoot)
	slot4 = slot1

	slot0:initStackWithUIRoot_()

	if slot3 then
		for slot8, slot9 in ipairs(slot0.stashUIStack) do
			slot0:stackUI_(slot9.name, nil, slot9.styles)

			slot4 = slot9.name
		end

		slot0.stashUIStack = nil

		slot0.uiRoot:endRebuild():autorelease()

		for slot8, slot9 in ipairs(slot0.uiStack) do
			print("--- ui stack", slot8, slot9.name, slot9.view)

			slot13 = slot9.view:z()
			slot14 = slot9.view:getResourceNode()

			print(slot9.view:getParent(), slot9.view:isVisible(), slot13, slot14, slot9.view:getResourceNode():isVisible())

			for slot13, slot14 in ipairs(slot9.view:getChildren()) do
				print(slot13, slot14, slot14:z(), slot14:name(), slot14:tag(), slot14:isVisible())
			end
		end
	else
		slot0.uiRoot:init(...)
	end

	slot0.guideManager:setIgnoreGuide(false)
	slot0.guideManager:checkGuide({
		name = slot4
	})
	slot0.guideManagerLocal:setIgnoreGuide(false)
	slot0.guideManagerLocal:checkGuide({
		name = slot4
	})
	printInfo("UI Switch %s %s %s %s", slot1, slot2 and "From " .. slot2 or "", slot3 and "By Stash" or "", slot4)
	slot0:onSwitchUI(slot2, slot1)

	return slot0.uiRoot
end

function slot2.switchUIAndStash(slot0, slot1, ...)
	slot0.guideManager:setIgnoreGuide(true)
	slot0.guideManagerLocal:setIgnoreGuide(true)

	if slot0.uiRoot then
		slot0.stashUI = slot0.uiRoot
		slot0.stashUIName = slot0.rootViewName
		slot0.stashUIStack = {}

		for slot5 = 2, #slot0.uiStack do
			table.insert(slot0.stashUIStack, slot0.uiStack[slot5])
		end

		slot0.stashUI:hide():retain():onClose()
		slot0.uiRoot:tearDown()

		slot0.uiRoot = nil
	end

	if #slot0.uiStack > 0 then
		print_r(slot0.uiStack)
		error("the ui stack should be empty when stash save")
	end

	printInfo("UI Stash %s", slot0.stashUIName)

	return slot0:switchUI(slot1, ...)
end

function slot2.cleanStash(slot0)
	if slot0.stashUI == nil then
		return
	end

	printInfo("UI CleanStash %s", slot0.stashUIName)
	slot0.stashUI:autorelease()

	slot0.stashUIName = nil
	slot0.stashUI = nil
	slot0.stashUIStack = nil
end

function slot2.findStackUI(slot0, slot1)
	if slot1 == slot0.rootViewName then
		return true
	else
		for slot5 = #slot0.uiStack, 1, -1 do
			if slot1 == slot0.uiStack[slot5].name then
				return true
			end
		end
	end

	return false
end

function slot2.goBackInStackUI(slot0, slot1)
	if slot0:findStackUI(slot1) then
		for slot6 = #slot0.uiStack, 2, -1 do
			if slot1 == slot0.uiStack[slot6].name then
				break
			end

			slot0.uiStack[slot6].view:removeSelf()
		end
	end

	return slot2
end

function slot2.getTopStackUI(slot0)
	if #slot0.uiStack > 0 then
		slot1 = slot0.uiStack[#slot0.uiStack]

		return slot1.view, slot1.name
	end

	return slot0.uiRoot, slot0.rootViewName
end

function slot2.addSingletonView(slot0, slot1, slot2, slot3)
	assert(slot1:parent(), "call addSingletonView after view addTo its parent")

	slot0.singletonViews[slot4] = slot0.singletonViews[slot1:name()] or {}

	for slot10, slot11 in pairs(slot6) do
		if slot11.show then
			if not slot3 then
				slot11.view:removeSelf()
			end

			slot11.show = false
		end
	end

	if slot6[slot2] then
		slot6[slot2].view:autorelease()

		slot6[slot2] = nil
	end

	slot1:retain()

	slot6[slot2] = {
		show = true,
		view = slot1,
		parent = slot5,
		notClear = slot3
	}
end

function slot2.removeSingletonView(slot0, slot1)
	for slot5, slot6 in pairs(slot0.singletonViews) do
		slot6[slot1] = nil

		if slot6[slot1] and slot7.show then
			slot8 = slot7.view

			function slot9()
				uv0 = "autorelease"
				slot0 = slot0.autorelease

				slot0(slot0)

				uv0 = "autorelease"

				slot0:removeSelf()
			end

			slot10 = {
				[slot0.uiStack[slot14].view] = slot14
			}

			for slot14 = #slot0.uiStack, 1, -1 do
			end

			slot11 = nil

			for slot16, slot17 in pairs(slot6) do
				assert(not slot17.show, "no other view be show, it singleton")

				slot18 = slot10[slot16] or -1

				assert(slot18 >= 0, "the ui not on the stack")

				if -1 < slot18 then
					slot12 = slot18
					slot11 = slot16
				end
			end

			if slot11 then
				slot13 = slot6[slot11]
				slot13.show = true

				if not slot13.notClear then
					slot14 = slot13.view
					slot15 = slot13.parent

					function slot9()
						uv0 = "removeSelf"
						uv2 = "addTo"

						slot0:removeSelf():addTo(slot2)
					end
				end
			end

			performWithDelay(slot0.scene, slot9, 0)
		end
	end
end

function slot2.stackUI(slot0, slot1, slot2, slot3, ...)
	if slot0.uiRoot:isRebuilding() then
		return
	end

	slot4, slot5 = slot0:getTopStackUI()
	slot6 = slot0:stackUI_(slot1, slot2, slot3)

	slot0:disableTouchDispatch(0.01)
	slot6:show():init(...)
	slot0.guideManager:checkGuide({
		name = slot1
	})
	slot0.guideManagerLocal:checkGuide({
		name = slot1
	})

	slot7 = nil
	slot7 = slot6:onNodeEvent("exit", function ()
		uv0 = "remove"
		slot0 = slot0.remove

		slot0(slot0)

		uv0 = "sendMessage"
		slot0 = slot0.sendMessage
		uv3 = "stackUIViewExit"
		uv4 = "dispatchNodes"

		slot0(slot0, "stackUIViewExit", slot3, slot4)

		uv0 = "disableTouchDispatch"

		if slot0 then
			uv0 = "disableTouchDispatch"

			if not slot0.dispatchNodes then
				uv0 = "sendMessage"

				slot0:disableTouchDispatch(0.01)
			end
		end

		uv0 = "sendMessage"
		slot0 = slot0.guideManager
		slot0 = slot0.checkGuide
		uv3 = "dispatchNodes"

		slot0(slot0, {
			name = slot3
		})

		uv0 = "sendMessage"
		uv3 = "dispatchNodes"

		slot0.guideManagerLocal:checkGuide({
			name = slot3
		})
	end)

	return slot6
end

function slot2.initStackWithUIRoot_(slot0)
	assert(#slot0.uiStack == 0, "the ui stack should be empty")

	slot0.uiStack = {}

	slot0:stackUI_(slot0.rootViewName)

	return slot0.uiRoot
end

function slot2.checkStyles_(slot0, slot1, slot2, slot3)
	if device.platform ~= "windows" then
		return
	end

	if slot1 == "battle.view" then
		return
	end

	slot5 = slot2:getResourceNode():getContentSize()

	printDebug("check full style %s %s %s %s %s %s", slot2, slot1, tj.type(slot2), dumps(slot5), dumps(slot3), isDialog(slot2))

	if slot5.width == display.sizeInView.width and slot5.height == display.sizeInView.height and slot1 ~= slot0.rootViewName and not isDialog(slot2) and not ({
		DrawCardPreviewView = true,
		CaptureHandbook = true,
		GainDisplayView = true,
		BattleEndPvpWinView = true,
		OnlineGiftGainView = true,
		BattleEndPvpFailView = true,
		BattleEndFailView = true,
		BattleEndWinView = true
	})[tj.type(slot2)] and slot3.full ~= nil and slot3.backGlass ~= nil then
		performWithDelay(slot2, function ()
			uv0 = "showDialog"
			uv3 = "可能没正确设置styles，比如full\n不改打你屁屁"

			slot0:showDialog({
				content = slot3 .. "可能没正确设置styles，比如full\n不改打你屁屁"
			})
		end, 1)
	end
end

function slot2.stackUI_(slot0, slot1, slot2, slot3)
	slot4 = slot0:getTopStackUI()
	slot5, slot6 = nil

	slot0:cleanTip()

	if slot1 == slot0.rootViewName then
		slot3 = {
			disableTimeSpeeder = (rawget(slot0.app:getViewClass(slot1), "RESOURCE_STYLES") or {}).disableTimeSpeeder
		}
		slot2 = nil
		slot5 = slot0.uiRoot
	else
		slot8 = rawget(slot0.app:getViewClass(slot1), "RESOURCE_STYLES") or {}

		if slot3 then
			for slot12, slot13 in pairs(slot8) do
				if slot3[slot12] == nil then
					slot3[slot12] = slot13
				end
			end
		else
			slot3 = slot8
		end
	end

	if slot3.backGlass then
		slot6 = effect.blurGlassScreen()
	end

	slot7 = nil

	if slot3.full or slot3.backGlass then
		slot7 = slot0:hideOtherUI(slot4)
	elseif slot3.dialog and isDialog(slot4) then
		slot4:onStackHide()
	end

	if slot3.disableTimeSpeeder then
		slot0.timeSpeederManager.yieldSpeeder()
	end

	if slot6 then
		slot6:xy(display.center):addTo(slot4, -99, "__back_glass__")
	end

	slot5 = slot5 or slot0:createView(slot1, slot4, slot2)

	table.insert(slot0.uiStack, {
		hideByStyles = 0,
		name = slot1,
		view = slot5,
		styles = slot3
	})
	slot0:checkStyles_(slot1, slot5, slot3)

	if slot6 then
		slot0:addSingletonView(slot6, slot5, true)

		if slot3.clickClose then
			performWithDelay(slot6, function ()
				uv0 = "getResourceNode"
				slot0 = slot0:getResourceNode()
				slot1 = slot0
				slot2 = false

				slot0.setTouchEnabled(slot1, slot2)

				uv1 = "getResourceNode"
				uv2 = "setTouchEnabled"

				bind.click(slot1, slot2, {
					method = function ()
						uv0 = "onClose"

						slot0:onClose()
					end
				})
			end, 0.1)
		end
	end

	if slot3.blackLayer or slot3.clickClose or slot3.dispatchNodes then
		slot8 = ccui.Layout:create():size(display.sizeInView):xy(display.board_left, 0):addTo(slot5, -99, "__black_layer__")

		slot8:setBackGroundColorType(1)
		slot8:setBackGroundColor(cc.c3b(91, 84, 91))
		slot8:setBackGroundColorOpacity(0)
		slot8:setTouchEnabled(true)

		if slot3.blackLayer then
			slot8:setBackGroundColorOpacity(204)
		end

		slot0:addSingletonView(slot8, slot5)
		slot0:setBlackLayerStyle(slot8, slot5, slot3)
	end

	slot8 = #slot0.uiStack
	slot9 = nil
	slot9 = slot5:onNodeEvent("exit", function ()
		uv0 = "remove"

		slot0:remove()

		slot0 = printInfo
		uv2 = "printInfo"
		uv3 = "UI Stack Pop [%d] %s %d %s"
		uv4 = "uiStack"
		uv6 = "uiStack"
		uv7 = "printInfo"

		slot0("UI Stack Pop [%d] %s %d %s", slot2, slot3, #slot4.uiStack, tostring(slot6.uiStack[slot7].view))

		uv0 = "uiStack"
		slot0 = slot0.removeSingletonView
		uv2 = "tostring"

		slot0(slot0, slot2)

		uv0 = "view"

		if slot0 then
			uv0 = "view"

			slot0:revert()
		end

		uv0 = "removeSingletonView"
		slot1 = slot0

		slot0.onStackShow(slot1)

		slot0 = assert
		uv1 = "printInfo"
		uv2 = "uiStack"

		if slot1 == #slot2.uiStack then
			uv1 = "uiStack"
			uv2 = "printInfo"
			uv2 = "tostring"

			if slot1.uiStack[slot2].view ~= slot2 then
				slot1 = false
			else
				slot1 = true
			end
		end

		slot2 = "must remove top uiStack first !!!"

		slot0(slot1, slot2)

		slot0 = table.remove
		uv1 = "uiStack"
		uv2 = "printInfo"

		slot0(slot1.uiStack, slot2)

		uv0 = "revert"

		if slot0.disableTimeSpeeder == true then
			uv0 = "uiStack"

			slot0.timeSpeederManager.resumeSpeeder()
		end
	end)

	printInfo("UI Stack Push %s %d %s", slot1, #slot0.uiStack, tostring(slot5))

	return slot5
end

function slot5(slot0, slot1, slot2)
	slot0.hideByStyles = slot0.hideByStyles + (slot1 and -1 or 1)
	slot0.hideByStyles = math.max(0, slot0.hideByStyles)

	if slot1 and slot0.hideByStyles == 0 then
		slot0.view:onStackShow()
	elseif not slot1 and slot0.hideByStyles == 1 then
		slot0.view:onStackHide(slot2)
	end
end

function slot2.hideOtherUI(slot0, slot1)
	slot2 = {}

	while slot1 do
		slot2[slot1] = true
		slot1 = slot1:getParent()
	end

	for slot7 = #slot0.uiStack, 1, -1 do
		slot8 = slot0.uiStack[slot7]
		uv9 = "getParent"

		slot9(slot8, false, slot2)
		table.insert({}, slot8)
	end

	return {
		revert = function ()
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
	}
end

function slot2.setBlackLayerStyle(slot0, slot1, slot2, slot3)
	if slot3.dispatchNodes then
		slot2:getResourceNode():setTouchEnabled(false)
		slot1:setTouchEnabled(false)

		slot4 = false

		uiEasy.addTouchOneByOne(slot1, {
			nodeVisible = true,
			beforeBegan = function (slot0)
				uv1 = "getResourceNode"

				if not slot1:getResourceNode():isVisibleInGlobal() then
					return
				end

				uv1 = "isVisibleInGlobal"

				if type(slot1.dispatchNodes) ~= "table" then
					slot1 = {
						slot1
					}
				end

				for slot5, slot6 in pairs(slot1) do
					slot7 = slot6:box()
					slot8 = slot6:parent():convertToWorldSpace(cc.p(slot7.x, slot7.y))
					slot7.x = slot8.x
					slot7.y = slot8.y

					if cc.rectContainsPoint(slot7, slot0) then
						uv9 = "getResourceNode"

						if slot9.onCloseFast then
							uv9 = "getResourceNode"

							slot9:onCloseFast()
						else
							uv9 = "getResourceNode"

							slot9:onClose()
						end

						uv2 = true

						return true
					end
				end

				return false
			end,
			ended = function ()
				uv0 = "getResourceNode"

				if not slot0:getResourceNode():isVisibleInGlobal() then
					return
				end

				uv0 = "isVisibleInGlobal"

				if not slot0 then
					uv0 = "clickClose"

					if slot0.clickClose then
						uv0 = "getResourceNode"

						slot0:onClose()

						return false
					end
				end
			end
		})
	end

	if not slot3.dispatchNodes and slot3.clickClose then
		performWithDelay(slot1, function ()
			uv0 = "getResourceNode"
			slot0 = slot0:getResourceNode()
			slot1 = slot0
			slot2 = false

			slot0.setTouchEnabled(slot1, slot2)

			uv1 = "getResourceNode"
			uv2 = "setTouchEnabled"

			bind.click(slot1, slot2, {
				method = function ()
					uv0 = "onClose"

					slot0:onClose()
				end
			})
		end, 0.1)
	end
end

function slot2.enterScene(slot0, slot1, slot2, slot3, slot4)
	slot0.uiRoot = slot0:createView(slot1)
	slot0.rootViewName = slot1
	slot0.scene = slot0:showWithScene(slot0.uiRoot, slot2, slot3, slot4)
	gRootViewProxy = ViewProxy.new(slot0.uiRoot)

	slot0.uiRoot:init()

	return slot0.uiRoot
end

function slot2.showWithScene(slot0, slot1, slot2, slot3, slot4)
	if slot0.scene == nil then
		slot5 = display.newScene(tostring(slot1))

		display.runScene(slot5, slot2, slot3, slot4)
		slot0.modalLayer:removeFromParent()
		slot5:addChild(slot0.modalLayer)
		slot0.viewLayer:removeFromParent()
		slot0.viewLayer:removeAllChildren()
		slot5:addChild(slot0.viewLayer)
		slot0.guideLayer:removeFromParent()
		slot0.guideLayer:removeAllChildren()
		slot5:addChild(slot0.guideLayer)
		slot0.timeSpeederLayer:removeFromParent()
		slot5:addChild(slot0.timeSpeederLayer)

		if CC_DESIGN_RESOLUTION.autoscale == "FIXED_HEIGHT" then
			slot0.modalLayer:setPosition(display.uiOrigin.x, 0)
			slot0.viewLayer:setPosition(display.uiOrigin.x, 0)
			slot0.guideLayer:setPosition(display.uiOrigin.x, 0)
			slot0.timeSpeederLayer:setPosition(display.uiOrigin.x, 0)
		end

		slot0:showIphoneXLayer()

		if EDITOR_ENABLE then
			printInfo("------ Editor init ------")
			require("editor.builder"):init(slot5)
			printInfo("------------")
		end

		if dev.DEBUG_MODE and dev.DEV_PATH then
			slot6, slot7, slot8 = os.rename(dev.DEV_PATH, "rb")

			if not slot6 and (slot7:find("File exists") or slot8 == 13 or slot8 == 17) or device.platform == "mac" then
				require("editor.builder"):addTipLabel("in dev mode " .. dev.DEV_PATH, "_dev_tip_")
			end
		end
	end

	if slot1:name() == "login.view" or slot1:name() == "new_character.view" then
		slot0.timeSpeederLayer:hide()
	end

	slot1:setVisible(true)
	slot0.viewLayer:addChild(slot1)

	return slot5
end

function slot2.showDebugLayer(slot0)
	if slot0.outSceneNode == nil and display.uiOrigin.x > 0 then
		slot0.outSceneNode = cc.Node:create()

		display.director:setNotificationNode(slot0.outSceneNode)

		slot1 = display.uiOrigin.x
		slot3 = cc.LayerColor:create(cc.c4b(255, 0, 0, 200), slot1, display.sizeInView.height)

		slot3:setPositionX(display.board_right)
		slot0.outSceneNode:addChild(cc.LayerColor:create(cc.c4b(0, 0, 255, 200), slot1, display.sizeInView.height))
		slot0.outSceneNode:addChild(slot3)
	end

	slot1 = 9999
	slot2 = cc.p(10, 10)

	cc.LayerColor:create(cc.c4b(255, 0, 255, 200), display.width - 2 * slot2.x, display.height - 2 * slot2.y):move(cc.pAdd(display.left_bottom, slot2)):addTo(slot0.viewLayer, slot1)
	cc.LayerColor:create(cc.c4b(255, 255, 0, 200), 2 * slot2.x, 2 * slot2.x):move(cc.pSub(display.center, slot2)):addTo(slot0.viewLayer, slot1 + 1)

	slot3 = cc.DrawNode:create(slot2.x * 2):addTo(slot0.viewLayer, slot1 + 2)

	slot3:drawLine(display.left_center, display.right_center, cc.c4b(255, 255, 0, 200))
	slot3:drawLine(display.top_center, display.bottom_center, cc.c4b(255, 255, 0, 200))
end

function slot2.showIphoneXLayer(slot0)
	if device.platform ~= "windows" or device.model ~= "iphone x" then
		return
	end

	slot1 = 9999
	slot2 = cc.size(0.054187192118226604 * 2.1653333333333333 * display.height, 0.6 * display.height)

	cc.LayerColor:create(cc.c4b(0, 0, 255, 200), slot2.width, slot2.height):xy(display.board_left, (display.height - slot2.height) / 2):addTo(slot0.viewLayer, slot1)
	cc.LayerColor:create(cc.c4b(255, 0, 0, 200), slot2.width, slot2.height):xy(display.board_right - slot2.width, (display.height - slot2.height) / 2):addTo(slot0.viewLayer, slot1)
end

function slot2.createView(slot0, slot1, slot2, slot3)
	if slot2 and slot2.onBeforeChildViewCreate and slot2:onBeforeChildViewCreate(slot1, slot3) then
		return slot4:show()
	end

	slot0.app:createView(slot1, slot2, slot3):setName(slot1)

	if slot2 then
		slot4:addTo(slot2, slot2 and slot2:getChildrenCount() or 0)
	end

	return slot4:show()
end

slot6 = class("simpleView", cc.load("mvc").ViewBase)

function slot2.createSimpleView(slot0, slot1, slot2, slot3)
	uv4 = "RESOURCE_FILENAME"
	slot4.RESOURCE_FILENAME = slot1.RESOURCE_FILENAME
	uv4 = "RESOURCE_FILENAME"
	slot4.RESOURCE_BINDING = slot1.RESOURCE_BINDING

	if slot2 and slot2.onBeforeChildViewCreate and slot2:onBeforeChildViewCreate(slot1.RESOURCE_FILENAME, slot3) then
		return slot4:show()
	end

	uv4 = "RESOURCE_FILENAME"
	slot4.RESOURCE_FILENAME = slot1.RESOURCE_FILENAME
	uv4 = "RESOURCE_FILENAME"
	slot4.RESOURCE_BINDING = slot1.RESOURCE_BINDING
	uv4 = "RESOURCE_FILENAME"

	slot4:create(slot0.app, slot2, slot3):setName(slot1.RESOURCE_FILENAME)

	if slot2 then
		slot4:addTo(slot2, slot2 and slot2:getChildrenCount() or 0)
	end

	return slot4:show()
end

function slot2.doModal(slot0, slot1, slot2)
	if slot2 and slot0.modalLayer:getChildByName(slot2) then
		error(string.format("the node already on modal stack `%s`", slot2))
	end

	if slot1:getParent() == slot0.modalLayer then
		error(string.format("the node already on modal stack %s", tostring(slot1)))
	end

	slot3 = slot1:getParent()
	slot4, slot5 = slot1:getPosition()

	table.insert(slot0.modalStack, {
		node = slot1,
		parent = slot3,
		pos = cc.p(slot4, slot5),
		z = slot1:getLocalZOrder(),
		name = slot2 or slot1:getName()
	})
	slot1:retain():show()
	slot1:removeSelf()

	if slot3 then
		slot1:setPosition(slot3:convertToWorldSpace(cc.p(slot4, slot5)))
	end

	slot0.modalLayer:setVisible(true)
	slot0.modalLayer:addChild(slot1, #slot0.modalStack, slot2)
	slot0.modalLayer:setTouchEnabled(true)
	slot1:autorelease()
	printDebug("UI Modal Push %s %d %s", slot2, #slot0.modalStack, tostring(slot1))
end

function slot2.unModal(slot0, slot1)
	if #slot0.modalStack == 0 then
		printWarn("modal stack is empty")

		return
	end

	slot2, slot3 = nil

	if type(slot1) == "string" then
		slot2 = slot1
	else
		slot3 = slot1 or slot0.modalStack[#slot0.modalStack].node
	end

	slot4 = nil

	for slot8 = #slot0.modalStack, 1, -1 do
		slot9 = slot0.modalStack[slot8]

		if slot2 and slot9.node:getName() == slot2 or slot9.node == slot3 then
			slot4 = slot8

			break
		end
	end

	if slot4 == nil then
		error(string.format("no such node on modal stack `%s`", tostring(slot1)))
	end

	slot5 = slot0.modalStack[slot4]

	table.remove(slot0.modalStack, slot4)
	slot5.node:retain()
	slot5.node:removeSelf():move(slot5.pos):autorelease()

	if slot5.parent then
		slot5.parent:addChild(slot5.node, slot5.z, slot5.name)
	end

	printDebug("UI Modal Pop [%d] %s %d %s", slot4, slot5.name, #slot0.modalStack, tostring(slot5.node))

	if #slot0.modalStack == 0 then
		slot0.modalLayer:setVisible(false)
		slot0.modalLayer:setTouchEnabled(false)
	end

	return slot5.node
end

function slot2.showDialog(slot0, slot1, slot2)
	slot0:stackUI("common.prompt_box", nil, slot2, slot1)
end

function slot2.showDialogModel(slot0, slot1)
	slot2 = slot0:createView("common.prompt_box")

	slot2:onNodeEvent("exit", functools.partial(slot0.unModal, slot0, slot2))
	slot2:init(slot1)
	slot0:doModal(slot2)
end

function slot2.showTimeSpeederIcon(slot0)
	slot1 = slot0:createView("common.time_speeder.icon")

	slot1:init()
	slot0.timeSpeederLayer:addChild(slot1)
	slot0.timeSpeederLayer:hide()

	slot0.timeSpeederIconView = slot1
end

function slot2.showTimeSpeeder(slot0)
	slot1 = slot0:createView("common.time_speeder.view")

	slot1:init()
	slot0.timeSpeederLayer:addChild(slot1)
end

function slot7(slot0, slot1)
	function slot5()
		uv1 = "table"

		table.remove(slot1, 1)
	end

	slot1:onNodeEvent("exit", slot5)

	for slot5 = #slot0, 1, -1 do
		if not slot0[slot5].onMoveUp then
			table.remove(slot0, slot5)
		end
	end

	if #slot0 == 3 then
		slot0[1]:onClose()
	end

	for slot5 = 1, #slot0 do
		slot0[slot5]:onMoveUp()
	end

	table.insert(slot0, slot1)
end

function slot2.showTip(slot0, slot1, ...)
	if #slot0.tipQueue > 0 and slot0.tipQueue[#slot0.tipQueue].content == string.format(slot1 or "", ...) then
		return
	end

	slot3 = slot0:createView("common.tip", slot0.scene)

	if CC_DESIGN_RESOLUTION.autoscale == "FIXED_HEIGHT" then
		slot3:setPosition(display.uiOrigin.x, 0)
	end

	uv6 = "string"

	slot3:setLocalZOrder(slot6.tip)

	slot4 = slot3.init

	slot4(slot3, slot2)

	uv4 = "format"

	slot4(slot0.tipQueue, slot3)
end

function slot2.pushAchievementTipQueue(slot0, slot1, slot2)
	function slot6()
		uv1 = "table"

		table.remove(slot1, 1)
	end

	slot2:onNodeEvent("exit", slot6)

	for slot6 = #slot1, 1, -1 do
		if not slot1[slot6].onMoveUp then
			table.remove(slot1, slot6)
		end
	end

	for slot6 = 1, #slot1 do
		slot1[slot6]:onMoveUp()
	end

	table.insert(slot1, slot2)
end

function slot2.showAchievement(slot0, slot1, slot2, slot3)
	slot4 = csv.achievement.achievement_task[slot1]

	if (slot2 or {}).type then
		slot4 = slot2.cfg
	end

	if not slot4 then
		return
	end

	if not slot3 and #slot0.achievementTipQueue >= 3 then
		table.insert(slot0.achievementTipWaitQueue, {
			csvId = slot1,
			params = slot2
		})

		if not slot0.achievementAction then
			slot0.achievementAction = schedule(slot0.scene, function ()
				uv0 = "achievementTipWaitQueue"

				if #slot0.achievementTipWaitQueue == 0 then
					uv0 = "achievementTipWaitQueue"
					slot0 = slot0.scene
					slot0 = slot0.stopAction
					uv2 = "achievementTipWaitQueue"

					slot0(slot0, slot2.achievementAction)

					uv0 = "achievementTipWaitQueue"
					slot0.achievementAction = nil

					return
				end

				uv0 = "achievementTipWaitQueue"
				slot0 = slot0.achievementTipWaitQueue[1]
				slot1 = table.remove
				uv2 = "achievementTipWaitQueue"

				slot1(slot2.achievementTipWaitQueue, 1)

				uv1 = "achievementTipWaitQueue"

				slot1:showAchievement(slot0.csvId, slot0.params, true)
			end, 1)
		end

		return
	end

	slot6 = slot0:createView(slot2.viewName or "common.achievement_tip", slot0.scene)

	if CC_DESIGN_RESOLUTION.autoscale == "FIXED_HEIGHT" then
		slot6:setPosition(display.uiOrigin.x, 0)
	end

	uv9 = "csv"

	slot6:setLocalZOrder(slot9.achievementTip)
	slot6:init(slot1, slot4)
	slot0:pushAchievementTipQueue(slot0.achievementTipQueue, slot6)
end

function slot2.showMedalCollection(slot0, slot1)
	slot0:showAchievement(slot1, {
		viewName = "common.medalcollection_tip",
		type = "medal",
		cfg = csv.medal[slot1]
	})
end

function slot2.cleanTip(slot0)
	while #slot0.tipQueue > 0 do
		slot0.tipQueue[1]:removeSelf()
	end
end

function slot2.cleanAchievementTip(slot0)
	while #slot0.achievementTipQueue > 0 do
		slot0.achievementTipQueue[1]:removeSelf()
	end

	slot0.achievementTipWaitQueue = {}
end

function slot2.showGainDisplay(slot0, slot1, slot2)
	slot0:stackUI("common.gain_display", nil, , slot1, slot2)
end

function slot2.showBoxDetail(slot0, slot1)
	slot0:stackUI("common.box_detail", nil, , slot1)
end

function slot2.showItemDetail(slot0, slot1, slot2)
	if slot0.itemDetailView then
		slot0.itemDetailView:onClose()
	end

	slot3 = "common.item_detail"
	slot4 = "vertical"
	slot5 = {
		"baseNode"
	}

	if slot2.key == "card" then
		slot3 = "common.card_detail"
		slot4 = "horizontal"
		slot5 = {
			"baseCardNode"
		}
	elseif slot2.key == "relicBuff" then
		slot3 = "common.relic_buff"
		slot4 = slot2.canvasDir

		function slot2.relicCb()
			uv0 = "automationTryCloseItemDetail"

			slot0:automationTryCloseItemDetail()
		end
	elseif dataEasy.getCfgByKey(slot2.key).type == game.ITEM_TYPE_ENUM_TABLE.chooseGift then
		slot0:stackUI("common.choose_detail", nil, , slot2)

		return
	elseif dataEasy.isHeldItem(slot2.key) then
		slot3 = "common.held_item_detail"
		slot4 = "horizontal"
	elseif dataEasy.isGemItem(slot2.key) then
		slot3 = "common.gem_details"
		slot4 = "horizontal"
	elseif dataEasy.isChipItem(slot2.key) then
		slot3 = "common.chip_details"
		slot4 = "horizontal"
	elseif dataEasy.isTotemItem(slot2.key) and dataEasy.isTotemUnlock() then
		slot3 = "common.totem_item_detail"
		slot4 = "horizontal"
	elseif dataEasy.isContractItem(slot2.key) then
		slot3 = "common.contract_details"
		slot4 = "horizontal"
	end

	slot6 = tip.create(slot3, nil, {
		relativeNode = slot1,
		canvasDir = slot4,
		childsName = slot5
	}, slot2)

	slot6:onNodeEvent("exit", functools.partial(slot0.unModal, slot0, slot6))
	slot0:doModal(slot6)

	slot0.itemDetailView = slot6
end

function slot2.showItemDetailCustom(slot0, slot1, slot2, slot3, slot4)
	slot4 = slot4 or {}

	if slot0.itemDetailView then
		slot0.itemDetailView:onClose()
	end

	slot7 = {
		relativeNode = slot1,
		canvasDir = slot4.canvasDir or "vertical",
		childsName = slot4.childsName or {
			"baseNode"
		}
	}

	if slot4.tipParams then
		for slot11, slot12 in pairs(slot4.tipParams) do
			slot7[slot11] = slot12
		end
	end

	slot8 = tip.create(slot3, nil, slot7, slot2)

	slot8:onNodeEvent("exit", functools.partial(slot0.unModal, slot0, slot8))
	slot0:doModal(slot8)

	slot0.itemDetailView = slot8
end

function slot2.onAuthError(slot0)
	function slot1()
		uv0 = "app"

		slot0.app:onBackLogin()
	end

	return slot0:showDialogModel({
		content = gLanguageCsv.auth_error,
		cb = slot1,
		closeCb = slot1,
		dialogParams = {
			clearFast = true,
			clickClose = false
		}
	})
end

function slot2.onBan(slot0)
	function slot1()
		uv0 = "app"

		slot0.app:onBackLogin()
	end

	performWithDelay(slot0.scene, function ()
		uv0 = "showDialogModel"
		slot3 = gLanguageCsv.auth_error
		uv3 = "gLanguageCsv"
		uv3 = "gLanguageCsv"

		slot0:showDialogModel({
			content = slot3,
			cb = slot3,
			closeCb = slot3,
			dialogParams = {
				clearFast = true,
				clickClose = false
			}
		})
	end, 1)
end

function slot2.onClose(slot0)
	if slot0.guideManager:isInGuiding() then
		slot0.guideManager:onClose()
	end

	if slot0.guideManagerLocal:isInGuiding() then
		slot0.guideManagerLocal:onClose()
	end

	slot0.timeSpeederManager:onClose()
	slot0:cleanStash()
	slot0.scene:removeAllChildren()
	slot0.modalLayer:autorelease()
	slot0.viewLayer:autorelease()
	slot0.guideLayer:autorelease()
	slot0.connectingLayer:autorelease()
	slot0.timeSpeederLayer:autorelease()
	slot0:removeAllDelayTouchDispatch()
	slot0.app:resumeRequest()

	slot0.isMultiTouches = false
end

function slot2.onRequestError(slot0, slot1, slot2)
	if slot1.err == "files_error" then
		return display.director:endToLua()
	end

	if gLanguageCsv[slot1.err] then
		if device.platform == "windows" then
			slot3 = gLanguageCsv[slot3] .. "\n" .. slot1.err
		end
	end

	slot4 = string.find(slot3, "#L00010100##LUL") or 0
	slot5 = string.find(slot3, "#", slot4 + 15) or 0
	slot6 = nil

	if slot4 > 0 and slot5 > 0 then
		slot6 = string.sub(slot3, slot4 + 15, slot5 - 1)
	end

	slot0:showDialogModel({
		isRich = true,
		content = "#C0x5B545B#" .. slot3,
		cb = function ()
			uv0 = "cc"

			slot0()

			uv0 = "Application"

			if slot0 then
				uv2 = "Application"

				cc.Application:getInstance():openURL(slot2)
			end
		end,
		closeCb = slot2,
		dialogParams = {
			clickClose = false
		}
	})
end

slot8 = {
	"effect/xuanzhongkuang.skel",
	"effect/xuanzhongkuang.skel"
}

function slot2.showConnecting(slot0)
	slot5 = 0.5 * slot0:getTimeScale(true)

	performWithDelay(slot0.connectingLayer, function ()
		uv0 = "connectingLayer"

		slot0.connectingLayer:removeChildByName("bg")

		slot2 = display.sizeInView
		uv2 = "connectingLayer"
		slot0 = ccui.Layout:create():size(slot2):addTo(slot2.connectingLayer, 0, "bg")

		slot0:setBackGroundColorType(1)

		slot5 = 0

		slot0:setBackGroundColor(cc.c3b(0, slot5, 0))

		slot2 = slot0
		slot3 = 50

		slot0.setBackGroundColorOpacity(slot2, slot3)

		uv2 = "connectingLayer"
		uv3 = "removeChildByName"
		uv5 = "removeChildByName"
		slot5 = "effect_loop"
		uv5 = "bg"

		performWithDelay(widget.addAnimationByKey(slot2.connectingLayer, slot3[math.random(#slot5)], "spine", slot5):xy(display.sizeInView.width / 2, display.sizeInView.height / 2):scale(2):z(1):hide(), function ()
			uv0 = "show"

			slot0:show()
		end, slot5)
	end, slot5)

	uv5 = "performWithDelay"

	slot0:doModal(slot0.connectingLayer, slot5)
end

function slot2.hideConnecting(slot0)
	uv3 = "unModal"

	slot0:unModal(slot3)
	performWithDelay(slot0.scene, function ()
		uv0 = "connectingLayer"

		if not slot0.connectingLayer:getParent() then
			uv0 = "connectingLayer"
			slot0 = slot0.connectingLayer
			slot0 = slot0.removeChildByName

			slot0(slot0, "bg")

			uv0 = "connectingLayer"

			slot0.connectingLayer:removeChildByName("spine")
		end
	end, 0.5 * slot0:getTimeScale(true))
end

function slot2.isConnecting(slot0)
	uv3 = "modalLayer"

	return slot0.modalLayer:getChildByName(slot3) and true or false
end

function slot2.registerMessageListener(slot0, ...)
	uv1 = "registerMessageListener"

	return slot1.registerMessageListener(...)
end

function slot2.unregisterMessageListenerByKey(slot0, ...)
	uv1 = "unregisterMessageListenerByKey"

	return slot1.unregisterMessageListenerByKey(...)
end

function slot2.sendMessage(slot0, ...)
	uv1 = "sendMessage"

	return slot1.sendMessage(...)
end

function slot2.addViewDelayCall(slot0, slot1, slot2)
	slot0.delayCalls[slot1] = slot2
end

function slot2.delViewDelayCall(slot0, slot1)
	slot0.delayCalls[slot1] = nil
end

function slot2.doViewDelayCall(slot0)
	if itertools.isempty(slot0.delayCalls) then
		return
	end

	slot0.delayCalls = {}

	for slot5, slot6 in pairs(slot0.delayCalls) do
		idlersystem.onViewBaseBegin(slot5)
		slot6()
		idlersystem.onViewBaseEnd(slot5)
	end
end

function slot2.onUpdate(slot0, slot1)
	slot0:doViewDelayCall()
end

slot9 = 0

function slot2.disableTouchDispatch()
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

function slot2.removeAllDelayTouchDispatch(slot0)
	uv3 = "scene"

	slot0.scene:stopAllActionsByTag(slot3)

	slot0.avoidClickCount = 0

	display.director:getEventDispatcher():setInputEnabled(true)
end

function slot2.getConvertPos(slot0, slot1, slot2)
	slot3, slot4 = slot1:xy()

	return (slot2 or slot0.viewLayer):convertToNodeSpace(slot1:parent():convertToWorldSpace(cc.p(slot3, slot4)))
end

function slot2.getConvertPosAR(slot0, slot1, slot2)
	slot3, slot4 = slot1:xy()

	return (slot2 or slot0.viewLayer):convertToNodeSpaceAR(slot1:parent():convertToWorldSpaceAR(cc.p(slot3, slot4)))
end

function slot2.playVideo(slot0, slot1, slot2)
	if FOR_SHENHE then
		if slot2 then
			slot2()
		end

		return
	end

	slot3 = cc.Application:getInstance():getTargetPlatform()

	if device.platform ~= "android" and device.platform ~= "ios" then
		printWarn("%s platform can't play video", device.platform)

		if slot2 then
			slot2()
		end

		return
	end

	slot4 = cc.FileUtils:getInstance():fullPathForFilename(slot1)

	printInfo("video start PLAY: %s", slot1)
	printInfo(slot4)

	if #slot4 == 0 then
		printWarn("video path not exit %s", slot1)

		if slot2 then
			slot2()
		end

		return
	end

	slot0.isPlayVideo = true
	slot5 = ccexp.VideoPlayer:create():size(display.sizeInView):anchorPoint(0.5, 0.5):xy(display.size.width / 2, display.size.height / 2):addTo(slot0.viewLayer, 999)
	slot6 = ccui.Layout:create():size(display.sizeInView):anchorPoint(0.5, 0.5):xy(display.size.width / 2, display.size.height / 2):addTo(slot0.viewLayer, 1000)

	slot6:setTouchEnabled(true)

	function slot7()
		uv0 = "isPlayVideo"

		if not slot0.isPlayVideo then
			return
		end

		uv0 = "isPlayVideo"
		slot0.isPlayVideo = false
		uv0 = "removeFromParent"
		slot0 = slot0.removeFromParent

		slot0(slot0)

		uv0 = "runAction"

		slot0:runAction(cc.CallFunc:create(function ()
			uv0 = "removeFromParent"

			slot0:removeFromParent()
		end))
		cc.Director:getInstance():resume()

		slot0 = audio.resumeMusic

		slot0()

		uv0 = "isPlayVideo"
		slot0 = slot0.uiRoot
		slot0 = slot0.show

		slot0(slot0)

		uv0 = "cc"

		if slot0 then
			uv0 = "cc"

			slot0()
		end
	end

	slot8 = 0

	slot6:addTouchEventListener(function ()
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
	slot0.uiRoot:hide()
	slot5:addEventListener(function (slot0, slot1)
		if slot1 == ccexp.VideoPlayerEvent.PLAYING then
			printInfo("video PLAYING")
			audio.pauseMusic()
		elseif slot1 == ccexp.VideoPlayerEvent.PAUSED then
			printInfo("video PAUSED")
		elseif slot1 == ccexp.VideoPlayerEvent.STOPPED then
			printInfo("video STOPPED")
		elseif slot1 == ccexp.VideoPlayerEvent.COMPLETED then
			slot2 = printInfo

			slot2("video COMPLETED")

			uv2 = "ccexp"

			slot2()
			printInfo("video COMPLETED over")
		end
	end)
	slot5:setFileName(slot4)
	slot5:play()
end

function slot2.onSwitchUI(slot0, slot1, slot2)
	slot0.app:onSwitchUI(slot1, slot2)
	slot0:sendMessage("switchUI", slot2)
	display.director:startAnimation()

	if ui.IGNORE_CLEAN_MAP[slot2] then
		return
	end

	slot3 = cc.FileUtils:getInstance()

	if slot1 == "login.view" then
		performWithDelay(slot0.scene, function ()
			uv1 = "ui"

			if ui.IGNORE_CLEAN_MAP[slot1.rootViewName] then
				return
			end

			printInfo("remove %d textures after close login.view in onSwitchUI", display.textureCache:removeLongTimeUnusedTexturesWithCallback(function (slot0, slot1)
				uv2 = "getRawPathInRepoCache"

				return slot2:getRawPathInRepoCache(slot1:getPath()):find("login") ~= nil
			end, 0, -1))
		end, 5)
	elseif slot1 == "battle.view" then
		performWithDelay(slot0.scene, function ()
			uv1 = "ui"

			if ui.IGNORE_CLEAN_MAP[slot1.rootViewName] then
				return
			end

			printInfo("remove %d textures after close battle.view in onSwitchUI", display.textureCache:removeLongTimeUnusedTexturesWithCallback(function (slot0, slot1)
				uv2 = "getRawPathInRepoCache"

				return slot2:getRawPathInRepoCache(slot1:getPath()):find("battle/") ~= nil or slot2:find("res/spine/koudai_") ~= nil
			end, 0, -1))
		end, 60)
	end
end

function slot2.getTimeScale(slot0, slot1)
	if slot1 then
		return display.director:getScheduler():getSpeedUp()
	end

	return display.director:getScheduler():getTimeScale()
end

function slot2.callUnessentialInIdle(slot0, slot1, slot2)
	slot2 = slot2 or 1

	if slot0.scene == nil or ui.IGNORE_CLEAN_MAP[slot0.rootViewName] then
		return
	end

	performWithDelay(slot0.scene, slot1, slot2)
end

function slot2.setMultiTouches(slot0, slot1)
	slot0.isMultiTouches = slot1

	if cc.Device.setMultipleTouchEnabled then
		cc.Device:setMultipleTouchEnabled(slot1)
	end
end

function slot2.resizeScreen(slot0, slot1, slot2)
	if not slot1 then
		slot1 = display.sizeInPixels.width
		slot2 = display.sizeInPixels.height
	end

	slot6 = slot2

	cc.Director:getInstance():getOpenGLView():setFrameSize(slot1, slot6)

	package.loaded.defines = nil
	package.preload.defines = nil
	package.loaded["cocos.framework.display"] = nil
	package.preload["cocos.framework.display"] = nil

	require("defines")

	display = require("cocos.framework.display")

	for slot6, slot7 in pairs(package.loaded) do
		if string.find(slot6, "^app.views.") then
			package.loaded[slot6] = nil
		end
	end

	if not slot0.outSceneNode then
		slot0.outSceneNode = cc.Node:create()

		display.director:setNotificationNode(slot0.outSceneNode)
	end

	slot0.outSceneNode:removeAllChildren()

	if CC_DESIGN_RESOLUTION.autoscale == "SHOW_ALL" then
		slot4 = display.sizeInPixels.height / display.sizeInView.height
		slot5 = math.min(display.sizeInPixels.width / display.sizeInView.width, slot4)
		slot6 = (display.sizeInPixels.height - slot5 * display.sizeInView.height) / 2
		slot8 = cc.LayerColor:create(cc.c4b(0, 0, 0, 255), display.sizeInView.width, slot6 / slot4)

		slot8:setPositionY((slot6 + slot5 * display.sizeInView.height) / slot4)
		slot0.outSceneNode:addChild(cc.LayerColor:create(cc.c4b(0, 0, 0, 255), display.sizeInView.width, slot6 / slot4))
		slot0.outSceneNode:addChild(slot8)
	end

	if display.uiOriginMax.x < display.uiOrigin.x then
		slot3 = display.uiOrigin.x - display.uiOriginMax.x
		slot5 = cc.LayerColor:create(cc.c4b(0, 0, 0, 255), slot3, display.sizeInView.height)

		slot5:setPositionX(slot3 + display.maxWidth)
		slot0.outSceneNode:addChild(cc.LayerColor:create(cc.c4b(0, 0, 0, 255), slot3, display.sizeInView.height))
		slot0.outSceneNode:addChild(slot5)
	end

	if CC_DESIGN_RESOLUTION.autoscale == "FIXED_HEIGHT" then
		slot0.modalLayer:setPosition(display.uiOrigin.x, 0)
		slot0.viewLayer:setPosition(display.uiOrigin.x, 0)
		slot0.guideLayer:setPosition(display.uiOrigin.x, 0)
		slot0.timeSpeederLayer:setPosition(display.uiOrigin.x, 0)
	else
		slot0.modalLayer:setPosition(0, 0)
		slot0.viewLayer:setPosition(0, 0)
		slot0.guideLayer:setPosition(0, 0)
		slot0.timeSpeederLayer:setPosition(0, 0)
	end

	if slot0.scene:getChildByName("_editor_") then
		slot0.scene:getChildByName("_editor_"):get("editBtn"):setPosition(cc.p(300 - display.board_left, display.height - 100))
		slot0.scene:getChildByName("_editor_"):get("btnPanel"):setPosition(cc.p(300 - display.board_left, display.height - 100))
	end

	slot0.connectingLayer:setPosition(cc.p(display.board_left, 0))

	if slot0.uiRoot then
		slot0.stashUI = slot0.uiRoot
		slot0.stashUIName = slot0.rootViewName
		slot0.stashUIStack = {}

		for slot6 = 2, #slot0.uiStack do
			table.insert(slot0.stashUIStack, slot0.uiStack[slot6])
		end

		slot0.stashUI:hide():retain():onClose()
		slot0.uiRoot:tearDown()

		slot0.uiRoot = nil
		slot0.rootViewName = nil

		slot0:switchUI(slot0.stashUIName)
	end
end

return slot2
