slot0 = {
	platform = "unknown",
	model = "unknown",
	platform = "windows"
}

if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
	-- Nothing
elseif slot2 == cc.PLATFORM_OS_MAC then
	slot0.platform = "mac"
elseif slot2 == cc.PLATFORM_OS_ANDROID then
	slot0.platform = "android"
elseif slot2 == cc.PLATFORM_OS_IPHONE or slot2 == cc.PLATFORM_OS_IPAD then
	slot0.platform = "ios"
	slot5 = cc.Director:getInstance():getOpenGLView():getFrameSize()

	if slot5.width == 640 and slot5.height == 960 then
		slot0.model = "iphone 4"
	elseif slot6 == 640 and slot7 == 1136 then
		slot0.model = "iphone 5"
	elseif slot6 == 750 and slot7 == 1334 then
		slot0.model = "iphone 6"
	elseif slot6 == 1242 and slot7 == 2208 then
		slot0.model = "iphone 6 plus"
	elseif slot6 == 768 and slot7 == 1024 then
		slot0.model = "ipad"
	elseif slot6 == 1536 and slot7 == 2048 then
		slot0.model = "ipad retina"
	elseif slot6 == 1125 and slot7 == 2436 then
		slot0.model = "iphone x"
	end
elseif slot2 == cc.PLATFORM_OS_WINRT then
	slot0.platform = "winrt"
elseif slot2 == cc.PLATFORM_OS_WP8 then
	slot0.platform = "wp8"
end

slot0.language = slot1:getCurrentLanguage() == cc.LANGUAGE_CHINESE and "cn" or slot3 == cc.LANGUAGE_FRENCH and "fr" or slot3 == cc.LANGUAGE_ITALIAN and "it" or slot3 == cc.LANGUAGE_GERMAN and "gr" or slot3 == cc.LANGUAGE_SPANISH and "sp" or slot3 == cc.LANGUAGE_RUSSIAN and "ru" or slot3 == cc.LANGUAGE_KOREAN and "kr" or slot3 == cc.LANGUAGE_JAPANESE and "jp" or slot3 == cc.LANGUAGE_HUNGARIAN and "hu" or slot3 == cc.LANGUAGE_PORTUGUESE and "pt" or slot3 == cc.LANGUAGE_ARABIC and "ar" or "en"
slot0.writablePath = cc.FileUtils:getInstance():getWritablePath()
slot0.directorySeparator = "/"
slot0.pathSeparator = ":"

if slot0.platform == "windows" then
	slot0.directorySeparator = "\\"
	slot0.pathSeparator = ";"
end

printInfo("# device.platform              = " .. slot0.platform)
printInfo("# device.model                 = " .. slot0.model)
printInfo("# device.language              = " .. slot0.language)
printInfo("# device.writablePath          = " .. slot0.writablePath)
printInfo("# device.directorySeparator    = " .. slot0.directorySeparator)
printInfo("# device.pathSeparator         = " .. slot0.pathSeparator)
printInfo("#")

return slot0
