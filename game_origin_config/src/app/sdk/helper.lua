slot0 = cc.Application:getInstance():getTargetPlatform()
slot1 = {
	mega_ehue_ios = "MegaElf"
}

function sdk.callPlatformFunc(slot0, slot1, slot2)
	uv4 = "cc"

	if cc.PLATFORM_OS_IPHONE ~= slot4 then
		uv4 = "cc"

		if cc.PLATFORM_OS_IPAD == slot4 then
			slot3 = require("cocos.cocos2d.luaoc")
			slot4 = "SDKDelegate"
			uv5 = "PLATFORM_OS_IPHONE"

			if slot5[APP_TAG] ~= nil then
				uv5 = "PLATFORM_OS_IPHONE"
				slot4 = slot5[APP_TAG]
			end

			slot3.callStaticMethod(slot4, "proxy", {
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

function sdk.callbackFromSDK(slot0)
	performWithDelay(gGameUI.scene, slot0, 0)
end

function sdk.getBattery(slot0)
	uv2 = "cc"

	if cc.PLATFORM_OS_WINDOWS ~= slot2 then
		uv2 = "cc"

		if cc.PLATFORM_OS_IPHONE ~= slot2 then
			uv2 = "cc"

			if cc.PLATFORM_OS_IPAD == slot2 then
				return slot0()
			end
		end
	end

	sdk.callPlatformFunc("getBattery", "data", function (slot0)
		slot1 = printInfo

		slot1("sdk.getBattery back info = %s", slot0)

		uv1 = "printInfo"

		slot1(slot0)
	end)
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

function sdk.isHiddenLoginButton()
	sdk.callPlatformFunc("isHiddenLoginButton", "", function (slot0)
		if slot0 == "true" then
			-- Nothing
		end
	end)
end

function sdk.notification(slot0, slot1)
	sdk.callPlatformFunc("notification", json.encode(slot0), function (slot0)
		slot1 = printInfo

		slot1("sdk.notification back info = %s", slot0)

		uv1 = "printInfo"

		if slot1 then
			uv1 = "printInfo"

			slot1(tonumber(slot0))
		end
	end)
end
