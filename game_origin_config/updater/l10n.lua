globals.LOCAL_LANGUAGE = cc.FileUtils:getInstance():getValueMapFromFile("res/language.plist").localization or "cn"

if cc.PLATFORM_OS_WINDOWS == cc.Application:getInstance():getTargetPlatform() then
	require("src.app.defines.dev_defines")

	if dev.ONLINE_VERSION_LANGUAGE and string.sub(dev.ONLINE_VERSION_LANGUAGE, 1, 1) == "_" then
		LOCAL_LANGUAGE = string.sub(slot2, 2)
	end
end

print("LOCAL_LANGUAGE", LOCAL_LANGUAGE)

globals.LanguageTexts = {
	cn = {
		placardUpdate = "更新内容",
		ok = "我知道了",
		notice = "公告",
		sure = "确 定",
		unzipFailed = "解压失败",
		placardActivity = "活动公告",
		notRemindMe = "今日不再提醒",
		checkUpdate = "检查更新中...",
		oldApp = "版本过旧\n需要重新下载最新的客户端",
		downloading = "正在下载安装中... 文件数量: %d / %d  文件大小: %dK / %dK",
		reConnect = "剩余%d个文件未更新，是否重试？",
		umcompress = "正在解压中，请稍等",
		downloadingM = "正在下载安装中... 文件数量: %d / %d  文件大小: %.2fM / %.2fM",
		boxTextTip = "下次不再弹出提示",
		tips = "提 示",
		wifiTip = "当前处于非WIFI环境，本次更新文件大小为 %0.2fM，确定消耗流量进行更新？",
		loginUpdating = "登录服务器正在更新中，请稍等",
		noConnected = "无法更新, 请检查你的网络"
	},
	tw = {
		tips = "提 示",
		ok = "我知道了",
		notice = "公告",
		sure = "確 定",
		unzipFailed = "解压失败",
		loginUpdating = "登录服务器正在更新中，请稍等",
		wifiTip = "資源較大，請在wifi環境下下載資源 土豪請隨意",
		checkUpdate = "检查更新中...",
		oldApp = "版本过旧\n需要重新下载最新的客户端",
		downloading = "正在下载安装中... 文件数量:%6d / %6d  文件大小:%7dK / %7dK",
		reConnect = "請重新連接",
		notRemindMe = "今日不再提醒",
		downloadingM = "正在下载安装中... 文件数量: %d / %d  文件大小: %.2fM / %.2fM",
		boxTextTip = "下次不再彈出提示",
		noConnected = "无法连接",
		umcompress = "正在解壓中，請稍等"
	},
	en = {
		downloadingM = "Downloading... file:%d / %d  size:%.2fM / %.2fM",
		ok = "Okey",
		notice = "Notice",
		sure = "Sure",
		unzipFailed = "Uncompress failed",
		tips = "Tips",
		notRemindMe = "Don't remind me again today",
		checkUpdate = "Checking update...",
		oldApp = "Old client version\nPlease download new client",
		downloading = "Downloading... file:%6d / %6d  size:%7dK / %7dK",
		reConnect = "Please retry connect",
		umcompress = "Extracting, please wait a moment",
		placardUpdate = "Reminder",
		boxTextTip = "Don't prompt again",
		placardActivity = "Event",
		wifiTip = "Your network not in WIFI, are you confirm to update?",
		loginUpdating = "Server updateing, please wait a moment",
		noConnected = "No network"
	},
	vn = {
		tips = "Tips",
		ok = "Okey",
		notice = "Notice",
		sure = "Sure",
		unzipFailed = "Uncompress failed",
		loginUpdating = "Server updateing, please wait a moment",
		wifiTip = "Your network not in WIFI, are you confirm to update?",
		checkUpdate = "Checking update...",
		oldApp = "Old client version\nPlease download new client",
		downloading = "Downloading... file:%6d / %6d  size:%7dK / %7dK",
		reConnect = "Please retry connect",
		notRemindMe = "Don't remind me again today",
		downloadingM = "Downloading... file:%d / %d  size:%.2fM / %.2fM",
		boxTextTip = "Don't prompt again",
		noConnected = "No network",
		umcompress = "Extracting, please wait a moment"
	},
	kr = {
		placardUpdate = "업데이트 내용",
		ok = "확인",
		notice = "공지",
		sure = "확 인",
		unzipFailed = "압축 풀기 실패",
		placardActivity = "이벤트 공지",
		notRemindMe = "오늘은 그만 보기",
		checkUpdate = "업데이트 점검 중...",
		oldApp = "최신의 버전 설치하세요",
		downloading = "다운로드하는 중... 파일 수량: %d / %d  파일 크기: %dK / %dK",
		reConnect = "나머지 %d개 파일 업데이트되지 않았습니다，다시 시도하시겠습니까？",
		umcompress = "압축을 푸는 중 잠시 기다려 주세요",
		downloadingM = "다운로드하는 중... 파일 수량: %d / %d  파일 크기: %.2fM / %.2fM",
		boxTextTip = "오늘 그만 보기",
		tips = "알 림",
		wifiTip = "현재 Wi-Fi가 아닌 환경에서이 업데이트의 파일 크기는 %0.2fM입니다. 업데이트를위한 데이터 사용하시겠습니까.？",
		loginUpdating = "서버 업데이트 점검 중,잠시 기다려 주세요",
		noConnected = "업데이트 불가, 네트워크를 확인하세요"
	}
}
globals.Language = LanguageTexts[LOCAL_LANGUAGE]

if Language == nil then
	globals.Language = LanguageTexts.cn
end

globals.Language = setmetatable(Language, {
	__index = function ()
		return "text_placeholder"
	end
})
globals.UNIVERSAL_TIMEDELTA = 28800

if LOCAL_LANGUAGE == "en" then
	UNIVERSAL_TIMEDELTA = 28800
elseif LOCAL_LANGUAGE == "vn" then
	UNIVERSAL_TIMEDELTA = 25200
elseif LOCAL_LANGUAGE == "kr" then
	UNIVERSAL_TIMEDELTA = 32400
end
