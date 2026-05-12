require("ymdump")
require("net")

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
	return require("net.manager").sendHttpRequest(gGameApp.net, "POST", string.format("%s/exception?app=%s&patch=%d&min_patch=%d&lang=%s&channel=%s&tag=%s&account=&server=&role=&", REPORT_CONF_URL, APP_VERSION, PATCH_VERSION, PATCH_MIN_VERSION, LOCAL_LANGUAGE, APP_CHANNEL, APP_TAG), json.encode({
		msg = slot0,
		traceback = slot1
	}), cc.XMLHTTPREQUEST_RESPONSE_BLOB, function (slot0)
		if slot0.status == 200 then
			-- Nothing
		end
	end)
end

function handleLuaException(slot0)
	if slot0 == nil then
		return
	end

	uv3 = "print"
	uv4 = "handleLuaException begin"

	print("handleLuaException begin", slot3(), slot4())
	print("--------- ymdump.sendException")
	ymdump.sendException(tostring(slot0) .. "\n" .. debug.traceback())
	print("handleLuaException end")
end
