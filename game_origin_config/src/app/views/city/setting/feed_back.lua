slot0 = class("SettingFeedBackView", Dialog)
slot0.RESOURCE_FILENAME = "setting_feed_back.json"
slot0.RESOURCE_BINDING = {
	btnBug = "btnBug",
	btnBattle = "btnBattle",
	textField = "textField",
	btnRecharge = "btnRecharge",
	btnRecommend = "btnRecommend",
	btnClose = {
		varname = "btnClose",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnCancel = {
		varname = "btnCancel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnComfirm = {
		varname = "btnComfirm",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onConfirmBtn")
			}
		}
	}
}

function slot0.onCreate(slot0)
	slot0.checkState = idler.new("RechargeIssue")
	slot0.btnData = {
		RechargeIssue = slot0.btnRecharge,
		BattleIssue = slot0.btnBattle,
		BugIssue = slot0.btnBug,
		Recommand = slot0.btnRecommend
	}

	slot0.checkState:addListener(function (slot0, slot1)
		uv3 = "pairs"

		for slot5, slot6 in pairs(slot3.btnData) do
			slot6:get("btn"):get("btnImg"):visible(slot5 == slot0)
		end
	end)

	for slot4, slot5 in pairs(slot0.btnData) do
		bind.click(slot0, slot5, {
			method = function ()
				uv0 = "checkState"
				uv2 = "set"

				slot0.checkState:set(slot2)
			end
		})
	end

	slot0.textField:setPlaceHolderColor(ui.COLORS.DISABLED.GRAY)
	slot0.textField:setTextColor(ui.COLORS.NORMAL.DEFAULT)
	Dialog.onCreate(slot0, {
		clickClose = false
	})
end

function slot0.onConfirmBtn(slot0)
	if APP_CHANNEL == "none" or APP_CHANNEL == "luo" then
		slot0:onClose()

		return
	end

	if string.trim(slot0.textField:getStringValue()) == "" then
		gGameUI:showTip(gLanguageCsv.canNotEmpty)

		return
	end

	if string.find(FEED_BACK_URL, "dingtalk") then
		slot0:sendToDingDing(slot1)
	else
		slot0:sendToCrashPlatform(slot1, matchLanguage({
			"kr"
		}))
	end

	slot0:onClose()

	if matchLanguage({
		"kr"
	}) then
		sdk.commitRoleInfo(54, function ()
			print("sdk commitRoleInfo customerService")
		end)
	end
end

function slot0.sendToCrashPlatform(slot0, slot1, slot2)
	gGameApp.net:sendHttpRequest("POST", FEED_BACK_URL, json.encode({
		account_id = stringz.bintohex(gGameModel.account:read("id")),
		uid = gGameModel.role:read("uid"),
		game_server = gGameApp.net.gameSession.serverKey,
		role_name = gGameModel.role:read("name"),
		role_id = stringz.bintohex(gGameModel.role:read("id")),
		grade = gGameModel.role:read("level"),
		vip = gGameModel.role:read("vip_level"),
		classify = slot0.checkState:read(),
		issue = slot1
	}), cc.XMLHTTPREQUEST_RESPONSE_STRING, function (slot0)
		uv1 = "status"

		if not slot1 then
			if slot0.status == 200 then
				userDefault.setCurrDayKey("feedBackDayCount", userDefault.getCurrDayKey("feedBackDayCount", 0) + 1)
				gGameUI:showTip(gLanguageCsv.feedBackSuccess)
			else
				gGameUI:showTip(gLanguageCsv.feedBackFail)
			end
		end
	end)
end

function slot1(slot0)
	slot1 = cc.XMLHttpRequest:new()
	slot1.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

	slot1:open("POST", FEED_BACK_URL)
	slot1:setRequestHeader("Content-Type", "application/json")
	slot1:registerScriptHandler(function (...)
		uv0 = "status"

		if slot0.status == 200 then
			userDefault.setCurrDayKey("feedBackDayCount", userDefault.getCurrDayKey("feedBackDayCount", 0) + 1)
		end
	end)
	slot1:send(slot0)
end

function slot0.sendToDingDing(slot0, slot1)
	slot4 = {
		title = "[口袋KR]" .. slot0.checkState:read(),
		text = string.format([[
反馈时间: %s

问题类型: %s

区服: %s

角色名: %s

角色ID: %s

等级: %s

vip: %s

问题描述: %s

]], os.date(), slot0.checkState:read(), gGameApp.net.gameSession.serverKey, gGameModel.role:read("name"), stringz.bintohex(gGameModel.role:read("id")), gGameModel.role:read("level"), gGameModel.role:read("vip_level"), slot1)
	}
	uv4 = "string"

	slot4(json.encode({
		msgtype = "markdown",
		markdown = slot4
	}))
end

return slot0
