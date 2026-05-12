globals = globals or _G
globals.dev = {}

if cc.PLATFORM_OS_WINDOWS == cc.Application:getInstance():getTargetPlatform() or cc.PLATFORM_OS_MAC == slot1 then
	slot0.GUIDE_CLOSED = true
	slot0.IGNORE_POPUP_BOX = true
	slot0.REQUEST_LOG_IGNORE = {
		["/login/check"] = true,
		["/game/login"] = true
	}
	slot0.DEBUG_MODE = true
	slot0.CLOSE_PVP_PRECHECK = false
	slot0.SHOW_GAIN_ITEMS = false
else
	slot0.GUIDE_CLOSED = false
	slot0.IGNORE_POPUP_BOX = false
	slot0.ONLINE_VERSION_LANGUAGE = nil
	slot0.REQUEST_LOG_IGNORE = {
		["/login/check"] = true,
		["/game/login"] = true
	}
	slot0.DEBUG_MODE = false
end
