require("ymdump")

EXCEPTION_TAG = "cocos-lua"

function LuaJavaSendReport(slot0, slot1)
	print("Android begin")

	slot8, slot9 = require("cocos.cocos2d.luaj").callStaticMethod("com/netease/nis/bugrpt/CrashHandler", "sendReportsBridge", {
		slot0 .. "\r\n" .. slot1,
		EXCEPTION_TAG
	}, "(Ljava/lang/String;Ljava/lang/String;)Z")

	if not slot8 then
		print("luaj error:", slot9)
	else
		print("The ret is:", slot9)
	end

	print("Android end")
end

function LuaObjectCSendReport(slot0, slot1)
	print("IOS begin")

	slot5, slot6 = require("cocos.cocos2d.luaoc").callStaticMethod("NTESBugrptInternalInterface", "sendLuaReportsToServer", {
		name = slot0,
		stack = slot1
	})

	if not slot5 then
		print("luaj error:", slot6)
	else
		print("The ret is:", slot6)
	end

	print("IOS end")
end

function slot2()
	slot0 = false

	if cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or cc.PLATFORM_OS_IPAD == slot1 or cc.PLATFORM_OS_MAC == slot1 then
		slot0 = true
	end

	return slot0
end

function slot3()
	slot0 = false

	if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then
		slot0 = true
	end

	return slot0
end

function slot4(slot0, slot1)
	slot4 = json.encode({
		msg = slot0,
		trace = slot1
	})
	slot5 = cc.XMLHttpRequest:new()
	slot5.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
	slot5.timeout = 20

	slot5:open("POST", string.format("%s/exception?app=%s&patch=%d&min_patch=%d&lang=%s&channel=%s&tag=%s&account=%s&server=%s&role=%s&exception=%s", REPORT_CONF_URL, APP_VERSION, PATCH_VERSION, PATCH_MIN_VERSION, LOCAL_LANGUAGE, APP_CHANNEL, APP_TAG, stringz.bintohex(gGameModel.role:read("account_id")), gGameApp.serverInfo.key, stringz.bintohex(gGameModel.role:read("id")), string.urlencode(tostring(slot0) .. "\n" .. slot1)))
	slot5:setRequestHeader("Content-Type", "application/x-json")
	slot5:registerScriptHandler(function (...)
		uv2 = "print"
		uv3 = "print"

		print("handleLuaException response", slot2.status, slot3.response)
	end)
	slot5:send()
end

handleLuaExceptionIdx = 1

function handleLuaException(slot0)
	if slot0 == nil then
		return
	end

	uv3 = "print"
	uv4 = "handleLuaException begin"

	print("handleLuaException begin", slot3(), slot4())

	handleLuaExceptionIdx = handleLuaExceptionIdx + 1

	if handleLuaExceptionIdx == 1 then
		if LOCAL_LANGUAGE ~= "kr" then
			print("--------- ymdump.sendException")
			ymdump.sendException(tostring(slot0) .. "\n" .. debug.traceback())
		else
			slot2 = print

			slot2("--------- post2TJCrashCollector")

			uv2 = "handleLuaExceptionIdx"

			slot2(tostring(slot0), debug.traceback())
		end
	end

	print("handleLuaException end")
end

function errorInWindows(slot0, ...)
	slot1 = string.format(tostring(slot0), ...)

	if device.platform == "windows" then
		error(slot1)

		return
	end

	triggerBattleReport("error:" .. slot1, debug.traceback())

	slot1 = string.format("[%d] ", handleLuaExceptionIdx) .. slot1
	slot3 = printWarnStack

	slot3(slot1)

	uv3 = "string"

	slot3(slot1)
end

function errorInWindowsNoReport(slot0, ...)
	if device.platform == "windows" then
		error(string.format(tostring(slot0), ...))

		return
	end
end

function assertInWindows(slot0, slot1, ...)
	if device.platform == "windows" then
		assert(slot0, string.format(tostring(slot1), ...))
	elseif not slot0 then
		slot3 = string.format("[%d] ", handleLuaExceptionIdx) .. string.format(tostring(slot1), ...)
		slot4 = printWarnStack

		slot4(slot3)

		uv4 = "device"

		slot4(slot3)

		return true
	end
end

function assertInWindowsNoReport(slot0, slot1, ...)
	if device.platform == "windows" then
		assert(slot0, string.format(tostring(slot1), ...))
	end
end

function sendExceptionInMobile(slot0)
	if device.platform == "windows" then
		print(slot0)
	else
		ymdump.sendException(slot0)
	end
end
