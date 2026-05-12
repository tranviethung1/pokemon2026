slot0 = isIdler
slot1 = 1200
slot2 = 300
slot3 = class("GameApp", cc.load("mvc").AppBase)
slot4 = require("net.tcpacket")

function slot5(slot0)
	if LOCAL_LANGUAGE ~= "cn" and (device.platform == "windows" or device.platform == "mac") then
		slot1, slot2 = getL10nField(slot0)

		cc.FileUtils:getInstance():addSearchResolutionsOrder(slot2 or slot1)
	end

	cc.FileUtils:getInstance():addSearchResolutionsOrder(slot0)
end

function slot3.initSearchPath()
	if dev.DEBUG_MODE and dev.DEV_PATH then
		cc.FileUtils:getInstance():addSearchResolutionsOrder(dev.DEV_PATH .. "/res")

		slot0 = cc.FileUtils:getInstance()
		slot0 = slot0.addSearchResolutionsOrder

		slot0(slot0, dev.DEV_PATH .. "/res/uijson")

		uv0 = "dev"

		slot0(dev.DEV_PATH .. "/res/resources")

		uv0 = "dev"

		slot0(dev.DEV_PATH .. "res/spine_dev")

		uv0 = "dev"

		slot0(dev.DEV_PATH .. "/res/spine")

		uv0 = "dev"

		slot0(dev.DEV_PATH .. "/res/sound")

		uv0 = "dev"

		slot0(dev.DEV_PATH .. "/res/video")
	end

	cc.FileUtils:getInstance():addSearchResolutionsOrder("res")

	slot0 = cc.FileUtils:getInstance()
	slot0 = slot0.addSearchResolutionsOrder

	slot0(slot0, "res/uijson")

	uv0 = "dev"

	slot0("res/resources")

	uv0 = "dev"

	slot0("res/spine_dev")

	uv0 = "dev"

	slot0("res/spine")

	uv0 = "dev"

	slot0("res/sound")

	uv0 = "dev"

	slot0("res/video")

	for slot4, slot5 in ipairs(cc.FileUtils:getInstance():getSearchPaths()) do
		printInfo("SearchPaths %d %s", slot4, slot5)
	end

	for slot5, slot6 in ipairs(cc.FileUtils:getInstance():getSearchResolutionsOrder()) do
		printInfo("SearchResolutionsOrder %d %s", slot5, slot6)
	end

	printInfo("WritablePath %s", cc.FileUtils:getInstance():getWritablePath())
end

slot7 = nil
slot8 = 2
slot9 = 0

function slot10()
	uv0 = "ui"
	uv0 = 1
	uv0 = "ui"

	if slot0 - 1 > 0 then
		return
	end

	uv0 = slot1
	uv0 = "PRELOAD_EFFECT_LIST"

	if slot0 < #ui.PRELOAD_EFFECT_LIST then
		uv0 = "PRELOAD_EFFECT_LIST"
		slot0 = slot0 + 1
		uv1 = 1
		uv2 = "PRELOAD_EFFECT_LIST"

		audio.preloadSound(ui.PRELOAD_EFFECT_LIST[slot2])
	else
		uv2 = "audio"

		display.director:getScheduler():unscheduleScriptEntry(slot2)
	end
end

slot11 = debug.sethook

function slot12()
	if CC_SHOW_FPS then
		display.director:setDisplayStats(true)
	end

	display.director:setDirtyDrawEnable(false)
	cc.Image:setPVRImagesHavePremultipliedAlpha(true)
	cache.init()
end

function slot3.onCreate()
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

function slot3.enterScene(slot0, slot1, slot2, slot3, slot4)
	slot0.scene = slot0.ui.scene

	slot0.scene:scheduleUpdate(handler(slot0, slot0.onUpdate))

	return slot0.ui:enterScene(slot1, slot2, slot3, slot4)
end

function slot3.setGameServerAddr(slot0, slot1)
	slot0.serverInfo = slot1

	return slot0.net:setGameAddr(slot1)
end

function slot3.getNotice(slot0, slot1)
	if slot0.notice then
		return slot1(slot0.notice)
	end

	slot0.net:doGET(slot0.net.noticeUrl, function (slot0, slot1)
		if slot0 then
			slot3 = slot0
			uv3 = "json"
			slot3.notice = json.decode(slot3)
			uv3 = "decode"
			uv4 = "json"

			return slot3(slot4.notice)
		end
	end)
end

function slot13(slot0, slot1)
	return unpack(table.flatArray(slot0, slot1), 1, slot1)
end

slot14 = {
	__index = slot14,
	params = function (slot0, ...)
		slot0._nargs = select("#", ...)
		slot0._args = {
			...
		}

		return slot0
	end,
	slient = function (slot0)
		slot0._slient = true

		return slot0
	end,
	onErrClose = function (slot0, slot1)
		slot0._onErrClose = slot1

		return slot0
	end,
	onErrCall = function (slot0, slot1)
		slot0._onErrCall = slot1

		return slot0
	end,
	delay = function (slot0, slot1)
		slot0._delay = slot1

		return slot0
	end,
	wait = function (slot0, slot1)
		assert(type(slot1) == "table" or type(slot1) == "function", "wait need table or function, like {true}")

		if type(slot1) == "table" then
			function slot0._wait()
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
		else
			slot0._wait = slot1
		end

		return slot0
	end,
	onResponse = function (slot0, slot1)
		slot0._onResponse = slot1

		return slot0
	end,
	onBeforeSync = function (slot0, slot1)
		slot0:wait({
			true
		}):onResponse(function ()
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

		return slot0
	end,
	doit = function (slot0, slot1)
		slot0._cb = slot1

		return slot0._app:_queueRequest(slot0)
	end
}

function slot3.requestServerCustom(slot0, slot1)
	if slot0.protocol[slot1] == nil then
		error(string.format("no such request protocol %s, see GameProtocol", slot1))
	end

	uv5 = "protocol"

	return setmetatable({
		_app = slot0,
		_req = slot2,
		_url = slot1
	}, slot5)
end

function slot3._queueRequest(slot0, slot1, slot2)
	slot3 = slot1._id

	if slot2 then
		slot0.reqHead = slot0.reqHead - 1
		slot1._id = slot0.reqHead + 1
	else
		slot0.reqTail = slot0.reqTail + 1
		slot1._id = slot0.reqTail
	end

	slot1._schedulingView = slot0.schedulingView

	if slot1._schedulingView then
		slot1._schedulingViewName = tostring(slot1._schedulingView)
	end

	slot1._topView, slot1._topViewName = slot0.ui:getTopStackUI()
	slot0.reqQueue[slot1._id] = slot1

	if slot3 then
		printInfo("re-queueRequest %s %s -> %s", slot2 and "front" or "back", slot3, slot1._id)
	end

	if not slot1._slient then
		if slot0.noSlientReqCount == 0 then
			slot0.ui:showConnecting()
		end

		slot0.noSlientReqCount = slot0.noSlientReqCount + 1
	end

	slot0:_checkRequest()
	slot0.ui:disableTouchDispatch(0, false)

	return slot1._id
end

function slot3._checkRequest(slot0)
	if slot0.reqing or slot0.reqDelay then
		return
	end

	while slot0.reqHead < slot0.reqTail do
		slot0.reqHead = slot0.reqHead + 1

		if slot0.reqQueue[slot0.reqHead] then
			if slot0:_doRequest(slot1) then
				slot0.reqQueue[slot1._id] = nil
			else
				slot0.reqHead = math.min(slot1._id - 1, slot0.reqHead)
			end

			return
		end
	end
end

function slot3._clearRequest(slot0)
	while slot0.reqHead < slot0.reqTail do
		slot0.reqHead = slot0.reqHead + 1
		slot0.reqQueue[slot0.reqHead] = nil
	end

	slot0.reqing = false
	slot0.reqDelay = false
end

function slot3._doRequest(slot0, slot1)
	printInfo("doRequest %s %s %s", slot1._id, slot1._url, slot1._slient and "slient" or "")

	slot0.reqing = true

	assert(not slot1._delay or not slot1._wait, "could not req with both delay and wait")
	assert(slot1._onResponse == nil or slot1._onResponse and (slot1._delay or slot1._wait), "pls set delay or wait for request")

	slot2 = nil

	if slot1._delay or slot1._wait then
		slot3 = slot0.model:delaySyncOnce()

		slot0.ui:disableTouchDispatch(nil, false)

		function slot2()
			uv0 = "ui"

			slot0()

			uv0 = "disableTouchDispatch"

			slot0.ui:disableTouchDispatch(nil, true)

			if dev.SHOW_GAIN_ITEMS then
				gGameUI.scene.clientEditor:showItems(true)
			end
		end
	else
		function slot2()
			if dev.SHOW_GAIN_ITEMS then
				gGameUI.scene.clientEditor:showItems(true)
			end
		end
	end

	slot3 = slot1._slient
	slot4 = os.clock()
	uv9 = "_id"

	slot1._req(slot0.protocol, slot1._url, function (slot0, slot1)
		slot2 = printInfo
		uv4 = "printInfo"
		uv5 = "printInfo"
		uv9 = "doRequest %s %s, ret=%s err=%s, rtt time cost %s s"

		slot2("doRequest %s %s, ret=%s err=%s, rtt time cost %s s", slot4._id, slot5._url, type(slot0) == "table" and slot0.ret or tostring(slot0), dumps(slot1), os.clock() - slot9)

		uv2 = "_id"
		slot2.reqing = false
		uv2 = "_id"

		if slot2.keepAliveCountdown then
			uv2 = "_id"
			uv3 = "_url"
			slot2.keepAliveCountdown = slot3
		end

		uv2 = "type"

		if not slot2 then
			uv2 = "_id"
			uv4 = "_id"
			slot2.noSlientReqCount = math.max(slot4.noSlientReqCount - 1, 0)
			uv2 = "_id"

			if slot2.noSlientReqCount == 0 then
				if not slot1 then
					uv3 = "_id"
					uv5 = "printInfo"

					if assertInWindows(slot3.ui:isConnecting(), "request recv %s be rejected, check isConnecting", slot5._url) then
						return
					end
				end

				uv2 = "_id"

				slot2.ui:hideConnecting()
			end
		end

		if slot1 then
			slot2 = printWarn
			uv4 = "printInfo"
			uv5 = "printInfo"

			slot2("doRequest %s %s %s_err=%s", slot4._id, slot5._url, slot1.system and "system" or "server", slot1.err)

			uv2 = "table"

			if slot2 then
				uv2 = "table"

				slot2()
			end

			if slot1.err == "auth_error" then
				uv2 = "_id"

				return slot2.ui:onAuthError()
			end

			if slot1.system then
				if slot1.err == "network_lost" then
					uv2 = "_id"

					slot2.ui:onRequestError(slot1, function ()
						uv0 = "noSlientReqCount"

						if not slot0 then
							uv0 = "ui"

							if slot0.noSlientReqCount == 0 then
								uv0 = "ui"

								slot0.ui:showConnecting()
							end

							uv0 = "ui"
							uv1 = "ui"
							slot0.noSlientReqCount = slot1.noSlientReqCount + 1
						end

						uv0 = "ui"

						if slot0.net.gameSession:isShutdown() then
							uv0 = "ui"

							slot0.net.gameSession:reconnectManual()
						end

						uv0 = "ui"

						return slot0:_checkRequest()
					end)
				else
					uv2 = "_id"

					slot2.ui:onRequestError(slot1, function ()
						uv0 = "setNextSynID"
						slot0 = slot0.setNextSynID
						uv1 = "_url"
						uv2 = "synID"
						slot2 = slot2.synID

						slot0(slot1._url, slot2)

						uv0 = "_queueRequest"
						slot0 = slot0._queueRequest
						uv2 = "_url"

						slot0(slot0, slot2, true)

						uv0 = "_queueRequest"

						return slot0:_checkRequest()
					end)
				end

				return
			end

			uv2 = "printInfo"

			if slot2._onErrCall then
				uv2 = "printInfo"
				slot2 = slot2._onErrCall

				slot2(slot1)

				uv2 = "_id"

				slot2:_checkRequest()

				return
			end

			uv2 = "_id"

			slot2.ui:onRequestError(slot1, function ()
				uv0 = "_onErrClose"

				if slot0._onErrClose then
					uv0 = "_onErrClose"
					uv1 = "_checkRequest"

					slot0._onErrClose(slot1)
				end

				uv0 = "_onErrClose"

				return slot0:_checkRequest()
			end)

			return
		end

		slot2 = nil

		function slot3()
			uv0 = "_cb"

			if slot0 then
				return
			end

			uv0 = true
			uv0 = "_schedulingView"

			if slot0 then
				uv0 = "_schedulingView"

				slot0()
			end

			uv0 = "tolua"

			if slot0._cb then
				uv0 = "isnull"

				if slot0 then
					uv0 = "tolua"
					uv1 = "_topView"

					slot0._cb(slot1)
				else
					uv0 = "tolua"

					if slot0._schedulingView then
						uv1 = "tolua"

						if not tolua.isnull(slot1._schedulingView) then
							uv0 = "tolua"
							uv1 = "_topView"

							slot0._cb(slot1)
						end
					else
						uv0 = "tolua"

						if slot0._topView then
							uv1 = "tolua"

							if tolua.isnull(slot1._topView) then
								slot0 = errorInWindows
								slot1 = "%s resp topView %s closed"
								uv2 = "tolua"
								uv3 = "tolua"

								slot0(slot1, slot2._url, slot3._topViewName)

								uv0 = "tolua"
								uv1 = "_topView"

								slot0._cb(slot1)
							else
								uv0 = "tolua"
								uv1 = "_topView"

								slot0._cb(slot1)
							end
						end
					end
				end
			end

			uv0 = "errorInWindows"

			return slot0:_checkRequest()
		end

		uv4 = "table"

		if slot4 then
			uv4 = "printInfo"

			if slot4._onResponse then
				uv4 = "printInfo"

				slot4._onResponse(slot0)
			end

			uv4 = "printInfo"

			if slot4._delay then
				uv5 = "_id"
				uv7 = "printInfo"

				performWithDelay(slot5.scene, slot3, slot7._delay)
			else
				uv4 = "printInfo"

				if slot4._wait then
					uv4 = "printInfo"

					if slot4._wait() then
						slot3()
					else
						slot4 = nil
						uv6 = "_id"
						slot4 = schedule(slot6.scene, function ()
							uv0 = "_wait"

							if slot0._wait() then
								uv0 = "scene"
								slot0 = slot0.scene
								slot0 = slot0.stopAction
								uv2 = "stopAction"

								slot0(slot0, slot2)

								uv0 = "_wait"

								return slot0()
							end
						end, 0)
					end
				else
					slot3()
				end
			end
		else
			slot3()
		end
	end, slot9(slot1._args, slot1._nargs))

	return true
end

function slot3.requestServer(slot0, slot1, slot2, ...)
	return slot0:requestServerCustom(slot1):params(...):doit(slot2)
end

function slot3.slientRequestServer(slot0, slot1, slot2, ...)
	return slot0:requestServerCustom(slot1):params(...):slient():doit(slot2)
end

function slot3.pauseRequest(slot0)
	slot0.reqDelay = true
end

function slot3.resumeRequest(slot0)
	slot0.reqDelay = false

	slot0:_checkRequest()
end

function slot3.requestPacket(slot0, slot1, slot2, slot3)
	slot4 = os.clock()

	slot0.net:sendPacket(slot1, slot3, function (slot0, slot1)
		uv4 = "printInfo"
		uv8 = "requestPacket %s, ret=%s err=%s, rtt time cost %s s"

		printInfo("requestPacket %s, ret=%s err=%s, rtt time cost %s s", slot4, type(slot0) == "table" and slot0.ret or tostring(slot0), dumps(slot1), os.clock() - slot8)

		if slot1 and slot1.system then
			uv2 = "type"

			slot2.ui:onRequestError(slot1, function ()
				uv0 = "net"

				if slot0.net.onlinefightSession:isShutdown() then
					uv0 = "net"

					slot0.net.onlinefightSession:reconnectManual()
				end
			end)

			return
		end

		uv2 = "table"

		if slot2 then
			uv2 = "table"

			slot2(slot0, slot1)
		end
	end)
end

function slot3.onSwitchUI(slot0, slot1, slot2)
	if slot1 == "login.view" and slot2 == "city.view" and LUACOV_ENABLE then
		print("------ LuaCov init ------")
		require("luacov.runner").init()
		print("------------")
	end

	if slot0.reqHead < slot0.reqTail and (slot0.reqHead + 1 ~= slot0.reqTail or not slot0.reqQueue[slot0.reqTail]._slient) then
		slot6 = slot0.reqTail

		printWarn("onSwitchUI but requests not all completed, %d %d", slot0.reqHead, slot6)

		for slot6 = slot0.reqHead + 1, slot0.reqTail do
			if slot0.reqQueue[slot6] then
				printWarn("request %d %s %s %s", slot6, slot7._id, slot7._url, slot7._slient and "slient" or "")
			end
		end

		errorInWindows("request left onSwitchUI from %s to %s, %d %d", slot1, slot2, slot0.reqHead, slot0.reqTail)
		slot0:_clearRequest()
	end

	if slot0.reqing then
		printWarn("onSwitchUI but requesting from %s to %s", slot1, slot2)
	end

	assertInWindows(not slot0.reqDelay, "reqDelay left onSwitchUI from %s to %s", slot1, slot2)
	slot0:resumeRequest()
	slot0:onViewSchedule(nil)
end

function slot3.onViewSchedule(slot0, slot1)
	slot2 = slot0.schedulingView
	slot0.schedulingView = slot1

	if slot1 then
		idlersystem.onViewBaseScheduleBegin(slot1)
	elseif slot2 then
		idlersystem.onViewBaseScheduleEnd(slot2)
	end
end

function slot3.checkGuarder(slot0)
	if not pcall(function ()
		slot0, slot1 = require("util.guarder").get_file_md5("src/app.guarder.init")

		if slot0 ~= "f62057d6474ba137c84ce00d1f286659" or slot1 ~= 1215 then
			display.director:endToLua()
		end

		require("app.guarder.init")()
	end) then
		display.director:endToLua()
	end
end

function slot3.onLoginOK(slot0)
	slot1 = printInfo

	slot1("onLoginOK")

	uv1 = "printInfo"
	slot0.keepAliveCountdown = slot1
end

function slot3.onBackLogin(slot0)
	printInfo("onBackLogin %s", tostring(slot0.ui))
	slot0.ui:sendMessage("onBackLogin")
	slot0.ui:onClose()
	slot0.model:destroy()
	idlersystem.destroyAll()

	slot0.ui = require("app.game_ui").new(slot0)
	slot0.model = require("app.models.game").new(slot0)

	slot0.net:doGameEnd()

	slot0.serverInfo = {}
	slot0.keepAliveCountdown = nil
	slot0.reqQueue = {}
	slot0.reqHead = 0
	slot0.reqTail = 0

	slot0:run("login.view")
	collectgarbage()
	printAllIdlers()
	printInfo("gc count %s KB onBackLogin", collectgarbage("count"))
	cache.onBackLogin()
end

function slot3.onKeepAlive(slot0, slot1)
	if slot0.keepAliveCountdown == nil then
		return
	end

	slot0.keepAliveCountdown = slot0.keepAliveCountdown - slot1

	if slot0.keepAliveCountdown < 0 and not slot0.ui:isConnecting() then
		slot0.keepAliveCountdown = 60

		slot0:slientRequestServer("/game/sync")
	end

	if true then
		-- Nothing
	end
end

function slot3.onUpdate(slot0, slot1)
	slot0.net:onUpdate(slot1)
	slot0.ui:onUpdate(slot1)
	slot0:onKeepAlive(slot1)
end

function slot3.onUpdateWhenPaused(slot0, slot1)
end

function slot3.onCleanCache(slot0)
	log.flush()
	display.director:startAnimation()

	if ui.IGNORE_CLEAN_MAP[slot0.ui.rootViewName] then
		return
	end

	uv4 = "log"

	if display.textureCache:removeLongTimeUnusedTextures(0, slot4) > 0 then
		printInfo("remove %d textures in onCleanCache", slot1)
	end

	if (tonumber(display.textureCache:getDescription():sub(10)) or 0) > 800 then
		slot3 = {}

		display.textureCache:removeLongTimeUnusedTexturesWithCallback(function (slot0, slot1)
			uv3 = "table"

			table.insert(slot3, {
				slot0,
				slot1
			})

			return false
		end, 0, -1)
		table.sort(slot3, function (slot0, slot1)
			return slot1[1] < slot0[1]
		end)

		slot5 = {
			[slot3[slot9][2]] = true
		}

		for slot9 = 1, math.min(100, #slot3) do
		end

		if display.textureCache:removeLongTimeUnusedTexturesWithCallback(function ()
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
		end, 0, -1) > 0 then
			printInfo("remove %d textures in onCleanCache when %s", slot6, slot2)
		end
	end

	if collectgarbage("count") - collectgarbage("count") > 0 then
		printInfo("gc count %.2f KB in onCleanCache%s", slot5, collectgarbage("step", 10000) and ", cycle finished" or "")
	end
end

function globals.onPausedUpdate()
	gGameApp:onUpdateWhenPaused(0.25)
end

function globals.memoryWarning()
	print("---- memoryWarning ----")
end

function globals.getYDConfig(slot0)
	print("---- getYDConfig ----")

	slot1 = ""
end

function globals.applicationScreenSizeChange(slot0, slot1)
	print("---- applicationScreenSizeChange ----")
	print(slot0, slot1)
end

function globals.exitApp(slot0)
	performWithDelay(gGameUI.uiRoot, function ()
		display.director:endToLua()
	end, 1)

	if slot0 then
		error(slot0)
	end
end

function slot3.startCountTimeInGame(slot0)
	slot1 = display.director:getScheduler()

	if slot0.countTimeId then
		slot1:unscheduleScriptEntry(slot0.countTimeId)
	end

	slot0.timeInGame = time.getTime()
	slot2 = socket.gettime()
	slot0.countTimeId = slot1:scheduleScriptFunc(function ()
		uv0 = "timeInGame"
		uv1 = "timeInGame"
		slot0.timeInGame = slot1.timeInGame + 1
		uv4 = "socket"

		printInfo("当前倍速:" .. math.floor(1 / (socket.gettime() - slot4) * 100) / 100)

		uv1 = 1
	end, 1, false)
end

function slot3.getStampInGame(slot0)
	if slot0.countTimeId then
		display.director:getScheduler():unscheduleScriptEntry(slot0.countTimeId)
	end

	slot0.countTimeId = nil
	slot0.timeInGame = nil

	return slot0.timeInGame
end

slot15 = 2106111912
slot16 = 2106111913
slot17 = {
	__index = slot17,
	params = function (slot0, slot1)
		slot0._params = slot1

		return slot0
	end,
	wait = function (slot0, slot1)
		slot0._wait = slot1

		return slot0
	end,
	checkCanbuy = function (slot0)
		slot0._checkCanbuy = true

		return slot0
	end,
	sdkOkCb = function (slot0, slot1)
		slot0._sdkOkCb = slot1

		return slot0
	end,
	sdkLongTimeCb = function (slot0, slot1)
		slot0._sdkLongTimeCb = slot1

		return slot0
	end,
	serverCb = function (slot0, slot1)
		slot0._serverCb = slot1

		return slot0
	end,
	doit = function (slot0, slot1)
		slot0._cb = slot1

		return slot0._app:_tryPay(slot0)
	end
}

function slot3.payCustom(slot0, slot1)
	uv4 = "setmetatable"

	return setmetatable({
		_app = slot0,
		_view = slot1
	}, slot4)
end

function slot3.payDirect(slot0, slot1, slot2, slot3)
	return slot0:payCustom(slot1):params(slot2):checkCanbuy():sdkOkCb(function ()
		uv0 = "_params"

		if slot0._params then
			slot0 = dataEasy.setPayClientBuyTimes
			uv2 = "dataEasy"
			uv3 = "dataEasy"
			uv4 = "dataEasy"

			slot0("directBuyData", slot2.yyID, slot3.csvID, slot4.buyTimes)

			uv0 = "setPayClientBuyTimes"

			if slot0 then
				uv0 = "setPayClientBuyTimes"

				slot0:notify()
			end
		end
	end):sdkLongTimeCb(function ()
		uv0 = "ui"

		slot0.ui:showTip(gLanguageCsv.directBuyLongTime)
	end)
end

function slot3._tryPay(slot0, slot1)
	if slot1._checkCanbuy then
		slot0:requestServer("/game/yy/award/canbuy", function (slot0)
			if slot0.view then
				uv1 = "view"
				uv3 = "_doPay"

				slot1:_doPay(slot3)
			end
		end, slot1._params.yyID, slot1._params.csvID)
	else
		slot0:_doPay(slot1)
	end
end

function slot3._doPay(slot0, slot1)
	uv4 = "scene"

	slot0.scene:stopActionByTag(slot4)

	uv4 = "stopActionByTag"

	slot0.scene:stopActionByTag(slot4)
	idlereasy.when(slot0.model.role:getIdler("buy_recharge"), function (slot0, slot1)
		uv2 = "_params"

		if slot2._params then
			for slot6 = slot2.size + 1, #slot1 do
				if slot2.rechargeId == slot1[slot6][1] and (not slot2.yyID or slot2.yyID == slot7[2]) and (not slot2.csvID or slot2.csvID == slot7[3]) then
					uv8 = "_params"
					slot8._buyRechargeData = slot7
					uv8 = "size"
					uv10 = "_params"

					slot8:_clearPayData(slot10)

					return
				end
			end
		end
	end, true):anonyOnly(slot1._view)

	slot1._params.size = itertools.size(slot0.model.role:read("buy_recharge"))
	slot1._params.rmb = slot0.model.role:read("rmb")

	sdk.pay(slot1._params, function (slot0)
		if slot0 == 0 then
			uv1 = "_paySync"
			slot1 = slot1._paySync
			uv3 = "_sdkOkCb"

			slot1(slot1, slot3)

			uv1 = "_sdkOkCb"

			if slot1._sdkOkCb then
				uv1 = "_sdkOkCb"
				slot1 = slot1._sdkOkCb

				slot1()

				uv1 = "_sdkOkCb"
				slot1._sdkOkCb = nil
			end
		else
			uv1 = "_paySync"
			uv3 = "_sdkOkCb"

			slot1:_clearPayData(slot3)
		end
	end)

	function slot7()
		uv0 = "_params"

		if slot0._params then
			uv0 = "_params"

			if slot0._sdkLongTimeCb then
				uv0 = "_params"

				slot0._sdkLongTimeCb()
			end
		end

		uv0 = "_sdkLongTimeCb"
		uv2 = "_params"

		slot0:_clearPayData(slot2)
	end

	uv7 = "stopActionByTag"

	performWithDelay(slot0.scene, slot7, slot1._wait or 25):setTag(slot7)

	if slot1._cb then
		slot1._cb()
	end
end

function slot3._paySync(slot0, slot1)
	if slot1._params then
		uv4 = "_params"

		slot0.scene:stopActionByTag(slot4)
		slot0:slientRequestServer("/game/sync")

		slot2 = slot1._params.rmb
		slot3 = 0

		function slot7()
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

		uv7 = "_params"

		schedule(slot0.scene, slot7, 5):setTag(slot7)
	end
end

function slot3._clearPayData(slot0, slot1)
	if slot1._params then
		slot4 = slot1

		slot0:_paySync(slot4)
		slot0.ui:hideConnecting()

		uv4 = "_params"

		slot0.scene:stopActionByTag(slot4)

		if slot1._sdkOkCb then
			slot1._sdkOkCb()

			slot1._sdkOkCb = nil
		end

		if slot1._buyRechargeData then
			if slot1._serverCb then
				slot1._serverCb(slot2)
			end

			if slot2[4] then
				if slot2[4].cards then
					slot2[4].items = slot2[4].items or {}

					for slot6, slot7 in ipairs(slot2[4].cards) do
						table.insert(slot2[4].items, {
							"card",
							slot7.id
						})
					end
				end

				for slot6, slot7 in pairs(game.SERVER_RAW_MODEL_KEY) do
					slot2[4][slot7] = nil
				end

				if not slot1._params.yyID then
					slot2[4].rmb = nil
				end

				if itertools.size(slot2[4]) > 0 then
					slot0.ui:showGainDisplay(slot2[4])
				end
			end
		end

		slot1._params = nil

		return true
	end
end

return slot3
