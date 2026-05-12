print("Updater UI working...")
require("exception_handler")

function __G__TRACKBACK__(slot0)
	print("----------------------------------------")
	print("LUA ERROR: " .. tostring(slot0) .. "\n")
	print(debug.traceback())
	print("----------------------------------------")
	handleLuaException(slot0)
end

function __G__GCCOUNT__()
	return collectgarbage("count")
end

sdk = {}

require("3rd.stringzutils")
require("defines")
require("cocos_init")
require("net")
require("l10n")
require("json")
require("ui_defines")
require("util.maptools")
require("util.nodetools")
require("util.language")
require("util.config")
require("util.csv")
require("easy.text")
require("easy.label")
require("easy.richtext")
require("easy.beauty")
require("easy.ui_adapter")
require("easy.user_default")
require("config.csv")
require("sdk.init")

if LOCAL_LANGUAGE ~= "cn" then
	setL10nConfig(csv)
end

slot0 = {
	[slot5] = slot4
}

for slot4, slot5 in pairs(cc.EventAssetsManagerEx.EventCode) do
	-- Nothing
end

slot1 = require("views.prompt_box")
slot2 = require("views.placard")
slot4 = require("3rd.zlib2").uncompress
slot5 = nil
slot6 = 0
slot7 = 1
slot8, slot9, slot10, slot11 = nil
slot12 = false
slot13 = false
slot14 = false
slot15 = false
slot17 = cc.FileUtils:getInstance():getValueMapFromFile("res/version.plist").noticeUrl

print("APP_CHANNEL", cc.FileUtils:getInstance():getValueMapFromFile("res/channel.plist").channel)

slot21 = cc.FileUtils:getInstance():getValueMapFromFile("res/Megamon.plist").MegamonVersion or "0"
slot22 = true

function slot23(slot0)
	if CC_DESIGN_RESOLUTION.autoscale == "SHOW_ALL" then
		slot1 = cc.Node:create()

		display.director:setNotificationNode(slot1)

		slot3 = display.sizeInPixels.height / display.sizeInView.height
		slot4 = math.min(display.sizeInPixels.width / display.sizeInView.width, slot3)
		slot5 = (display.sizeInPixels.height - slot4 * display.sizeInView.height) / 2
		slot6 = cc.Sprite:create("img/scene_board_bottom.png")

		slot6:setFlippedY(true)
		slot6:setAnchorPoint(0, 0)
		slot6:setContentSize(2560, 315)
		slot6:setPosition(0, (slot5 + slot4 * display.sizeInView.height) / slot3)
		slot1:addChild(slot6)

		slot7 = cc.Sprite:create("img/scene_board_bottom.png")

		slot7:setAnchorPoint(0, 1)
		slot7:setContentSize(2560, 315)
		slot7:setPosition(0, slot5 / slot3)
		slot1:addChild(slot7)
	end

	if display.uiOriginMax.x < display.uiOrigin.x then
		slot1 = cc.Node:create()

		display.director:setNotificationNode(slot1)

		slot2 = display.uiOrigin.x - display.uiOriginMax.x
		slot3 = cc.Sprite:create("img/scene_board_right.png")

		slot3:setFlippedX(true)
		slot3:setAnchorPoint(1, 0)
		slot3:setContentSize(600, 1440)
		slot3:setPosition(slot2, 0)
		slot1:addChild(slot3)

		slot4 = cc.Sprite:create("img/scene_board_right.png")

		slot4:setAnchorPoint(0, 0)
		slot4:setContentSize(600, 1440)
		slot4:setPosition(slot2 + display.maxWidth, 0)
		slot1:addChild(slot4)
	end

	return slot0
end

function slot24(slot0)
	slot1 = slot0:getEventCode()

	print("onEvent ------------------")
	print("getAssetId", slot0:getAssetId())
	print("getCURLECode", slot0:getCURLECode())
	print("getCURLMCode", slot0:getCURLMCode())

	slot5 = slot0

	print("getMessage", slot0.getMessage(slot5))

	uv5 = "getEventCode"

	print("getEventCode", slot1, slot5[slot1] or "???")
	print("getPercent", slot0:getPercent(), slot0:getTotalBytes())
	print("getPercentByFile", slot0:getPercentByFile(), slot0:getTotalFiles())
end

function slot25()
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

function slot26()
	uv0 = "getChildByName"

	slot0(nil, true)

	uv0 = "updateDesc"

	slot0:getChildByName("updateDesc"):setString(Language.umcompress)

	slot0 = print

	slot0("success")

	uv0 = "updateDesc"
	uv6 = "setString"

	slot0:runAction(cc.Sequence:create(cc.DelayTime:create(slot6), cc.CallFunc:create(function ()
		cc.AssetsManagerEx:getInstance():onLuaSuccess()
	end)))
end

function slot27(slot0)
	slot1 = ccui.Layout:create()

	slot1:setContentSize(display.sizeInView)
	slot1:setBackGroundColorType(1)
	slot1:setBackGroundColor(cc.c3b(91, 84, 91))
	slot1:setOpacity(204)
	slot1:setTouchEnabled(true)
	slot1:setPosition(cc.p(display.board_left, 0))
	slot0:addChild(slot1, -1)

	return slot1
end

function slot28()
	slot0 = sdk.trackEvent
	slot1 = "PULL_GAMESHOW"

	slot0(slot1)

	uv0 = "sdk"
	uv1 = "trackEvent"
	slot0 = slot0(slot1)
	slot1 = slot0.node
	slot1 = slot1.setTouchEnabled

	slot1(slot1, false)

	uv1 = "PULL_GAMESHOW"
	slot1 = slot1(slot0.node)
	slot1 = slot1.onClick

	slot1(slot1, function ()
		slot0 = sdk.trackEvent

		slot0("CLICK_OK")

		uv0 = "sdk"

		slot0:onClose()
	end)

	uv1 = "node"

	slot1:getChildByName("layer"):addChild(slot0.node, 999, "placard")
end

function slot29(slot0)
	uv1 = "node"
	slot2 = slot0
	slot1 = slot1(slot2)
	uv2 = "getChildByName"

	slot2(slot1.node)

	uv2 = "layer"

	slot2:getChildByName("layer"):addChild(slot1.node, 999)

	return slot1
end

function slot30(slot0)
	if LOCAL_LANGUAGE ~= "cn" and device.platform == "windows" then
		cc.FileUtils:getInstance():addSearchResolutionsOrder(string.format("%s_%s", slot0, LOCAL_LANGUAGE))
	end

	cc.FileUtils:getInstance():addSearchResolutionsOrder(slot0)
end

function slot31(slot0)
	function slot1(slot0, slot1)
		slot4 = os.time()

		return os.time({
			sec = 0,
			year = math.floor(slot0 / 10000),
			month = math.floor(slot0 % 10000 / 100),
			day = math.floor(slot0 % 100),
			hour = math.floor(slot1 / 100) or 0,
			min = slot1 % 100 or 0,
			isdst = false
		}) - UNIVERSAL_TIMEDELTA + os.difftime(slot4, os.time(os.date("!*t", slot4)))
	end

	if not slot0 then
		return false
	end

	slot2 = os.time()

	for slot6, slot7 in csvPairs(csv.huodong_display_replace) do
		if slot7.clientParam[slot0] and slot1(slot7.beginDate, slot7.beginTime) < slot2 and slot2 < slot1(slot7.endDate, slot7.endTime) then
			return true, slot7.clientParam[slot0]
		end
	end

	return false
end

function slot32()
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

function slot33(slot0, slot1)
	slot2 = nil

	doGET(LOCAL_LANGUAGE == "en" and "http://rtfkdjxengj.dzvjo.com/folibd/odc/chekIsp.do?gameCode=FKDJXEN&calltype=client&os=" .. device.platform or "http://mmgame.kkzipo.com/okbsee/odc/chekIsp.do?gameCode=FKDJXKR&calltype=client&os=" .. device.platform, function (slot0, slot1)
		if slot0 and json.decode(slot0).tag ~= 0 then
			uv3 = "json"

			return slot3()
		end

		uv2 = "decode"

		slot2()
	end)
end

slot35, slot36 = xpcall(function ()
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
end, __G__TRACKBACK__)

if not slot35 then
	print("xpcall updater main error", slot35, slot36)

	if cc.AssetsManagerEx:getInstance().onLuaError then
		slot37:onLuaError()
	end

	slot12 = true
end
