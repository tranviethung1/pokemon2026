slot0 = cc.Application:getInstance():getTargetPlatform()
slot1 = {
	"EVENTS_START_LOADING",
	"EVENTS_FINISHED_LOADING",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"PULL_VERSION",
	"START_CDN",
	"CDN_30",
	"CDN_60",
	"CDN_FINISH",
	"NOTNETWORK_CLICK",
	"PULL_GAMESHOW",
	"CLICK_OK",
	"START_LOGIN",
	"START_GAME"
}

function sdk.trackEvent(slot0, slot1)
	if type(slot1) ~= "table" then
		slot1 = {
			data = slot1
		}
	end

	slot1.ctype = slot0
	uv2 = "type"
	slot1.event = slot2[slot0] or ""

	sdk.callPlatformFunc("trackEvent", json.encode(slot1), function (slot0)
		print("trackEvent ret = ", slot0)
	end)
end

function sdk.callPlatformFunc(slot0, slot1, slot2)
	uv4 = "cc"

	if cc.PLATFORM_OS_IPHONE ~= slot4 then
		uv4 = "cc"

		if cc.PLATFORM_OS_IPAD == slot4 then
			require("cocos.cocos2d.luaoc").callStaticMethod("SDKDelegate", "proxy", {
				funcName = slot0,
				bundle = slot1,
				callback = slot2
			})
		else
			require("cocos.cocos2d.luaj").callStaticMethod("www/tianji/finalsdk/MessageHandler", "msgFromLua", {
				slot0,
				slot1,
				slot2
			})
		end
	end
end

function sdk.isHasNotchScreen(slot0)
	if display.isNotchSceen ~= nil then
		slot0(display.isNotchSceen)

		return
	end

	sdk.callPlatformFunc("isHasNotchScreen", "data", function (slot0)
		printInfo("sdk.isHasNotchScreen back info = %s | %s", type(slot0), slot0)

		slot1 = display
		slot1.isNotchSceen = tonumber(slot0)
		uv1 = "printInfo"

		slot1(tonumber(slot0))
	end)
end

function ()
	if device.platform ~= "windows" then
		sdk.isHasNotchScreen(function (slot0)
			if slot0 == 1 then
				display.notchSceenSafeArea = display.fullScreenSafeArea
				display.notchSceenDiffX = display.fullScreenDiffX

				printInfo("# display.notchSceenSafeArea changed   = %d", display.notchSceenSafeArea)
				printInfo("# display.notchSceenDiffX changed      = %d", display.notchSceenDiffX)
			end
		end)
	end
end()
