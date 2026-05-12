globals.LOCAL_LANGUAGE = cc.FileUtils:getInstance():getValueMapFromFile("res/language.plist").localization or "cn"
globals.OkamiLan = userDefault.getForeverLocalKey("OkamiLan", "en", {
	rawKey = true
})

printInfo("LOCAL_LANGUAGE %s", LOCAL_LANGUAGE)

slot3 = cc.FileUtils:getInstance():getValueMapFromFile("res/version.plist")

if dev.ONLINE_VERSION_LANGUAGE then
	if string.sub(dev.ONLINE_VERSION_LANGUAGE, 1, 1) == "_" then
		LOCAL_LANGUAGE = ({
			trial = "cn",
			test = "cn"
		})[string.sub(slot4, 2)] or slot4

		printInfo("LOCAL_LANGUAGE change %s", LOCAL_LANGUAGE)
	end

	slot1 = string.format("res/version_%s.plist", slot4)
end

globals.UNIVERSAL_TIMEDELTA = 28800

if userDefault.getForeverLocalKey("OkamiLan", "", {
	rawKey = true
}) == "en" then
	UNIVERSAL_TIMEDELTA = 28800
elseif slot4 == "br" or slot4 == "vn" then
	UNIVERSAL_TIMEDELTA = -10800
else
	UNIVERSAL_TIMEDELTA = 28800
end

printInfo("UNIVERSAL_TIMEDELTA %d hours", UNIVERSAL_TIMEDELTA / 3600)

slot5 = cc.FileUtils:getInstance():getValueMapFromFile(slot1)

if string.find(slot3.versionUrl, "megamon") or string.find(slot3.versionUrl, "http://logintest.megamon.asia:18080/servers") or string.find(slot3.versionUrl, "http://br.megamon.asia:18080/servers") then
	globals.APILINK = "https://id.megamon.asia/api/"
	globals.APIGetMoney = "https://id.megamon.asia/auth/getinfo.php"
	globals.VERSION_CONF_URL = slot3.versionUrl
	globals.SERVER_CONF_URL = slot3.serverUrl
	globals.NOTICE_CONF_URL = slot3.noticeUrl
	globals.REPORT_CONF_URL = slot3.reportUrl
	globals.FEED_BACK_URL = slot3.feedBackUrl
	globals.SUPPORT_URL = "https://www.facebook.com/megamonglb"
	globals.JUMP_SHOP_URL = "https://play.google.com/store/apps/details?id=OkamiAN"
	globals.DISCORD_URL = "https://discord.gg/6vP8jhRGgF"
	globals.PayUrl = "https://id.megamon.asia/auth/payment.php?"

	if slot3.OkamiVersion == "br" then
		globals.APILINK = "https://megamonglobal.gameshyped.com/api/"
		globals.PayUrl = "https://megamonglobal.gameshyped.com/auth/payment.php?"
		globals.APIGetMoney = "https://megamonglobal.gameshyped.com/auth/getinfo.php"
		globals.SUPPORT_URL = "https://www.facebook.com/megamonglobal"
		globals.JUMP_SHOP_URL = "https://play.google.com/store/apps/details?id=OkamiAN"
		globals.DISCORD_URL = "https://discord.gg/4fXNbXuK6e"
	end

	globals.DISABLE_WORD_CHECK_URL = slot3.disableWordCheckUrl
	globals.FOR_SHENHE = string.lower(slot3.forShenhe or "") == "true"
	globals.LOGIN_SERVRE_HOSTS_TABLE = {
		slot3.loginServer
	}
	globals.USE_MUTILLAN = string.lower(slot3.MutilLanguage or "") == "true"

	printInfo(USE_MUTILLAN)
end

globals.LOGIN_SERVRE_HOSTS_TABLE = {
	slot5.loginServer
}

for slot9 = 2, 10 do
	if slot5[string.format("loginServer%d", slot9)] then
		table.insert(LOGIN_SERVRE_HOSTS_TABLE, slot5[string.format("loginServer%d", slot9)])
	end
end

if next(LOGIN_SERVRE_HOSTS_TABLE) then
	globals.IPV6_TEST_HOST = string.gmatch(LOGIN_SERVRE_HOSTS_TABLE[1], "([-a-z0-9A-Z.]+):(%d+)")()
end

if ymdump then
	ymdump.setUserInfo("url", REPORT_CONF_URL)
	printInfo("REPORT_CONF_URL %s", REPORT_CONF_URL)
end

globals.APP_VERSION = slot5.app_version

printInfo("APP_VERSION %s", APP_VERSION)

slot6 = cc.FileUtils:getInstance():getValueMapFromFile("res/channel.plist")
globals.APP_CHANNEL = slot6.channel
globals.APP_TAG = slot6.tag
globals.XXVERSION = slot6.version or 2

printInfo("APP_CHANNEL %s", APP_CHANNEL)
printInfo("APP_TAG %s", APP_TAG)

globals.FAKE_APP = cc.FileUtils:getInstance():isFileExist("fake") or cc.FileUtils:getInstance():isFileExist(".fake")

printInfo("FAKE_APP %s", FAKE_APP)

globals.TEST_CHANNELS = {
	none = true,
	bare = true,
	luo = true
}

if TEST_CHANNELS[APP_CHANNEL] then
	dev.DEBUG_MODE = true
end

globals.SERVERS_INFO = {}

if slot4 == "br" or slot4 == "vn" then
	globals.SERVER_MAP = {
		en = {
			order = 100,
			name = "[UTC+8]"
		},
		vn = {
			order = 101,
			name = "[UTC-3]"
		}
	}
else
	globals.SERVER_MAP = {
		en = {
			order = 101,
			name = "[UTC+8]"
		},
		vn = {
			order = 100,
			name = "[UTC-3]"
		}
	}
end

globals.GEO_COUNTRY = ""
