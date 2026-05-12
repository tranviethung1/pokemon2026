slot0 = require("app.views.city.setting.view")
slot1 = slot0.BTN_TYPE
slot2 = slot0.BTN_DATA
slot3 = {
	OPEN = 1,
	CLOSE = 2
}
slot4 = {
	{
		name = gLanguageCsv.settingFPS,
		select1 = gLanguageCsv.settingFPSSelect1,
		select2 = gLanguageCsv.settingFPSSelect2,
		btnType = slot1.RADIO,
		initFunc = function ()
			if userDefault.getForeverLocalKey("fps", 60, {
				rawKey = true
			}) <= 30 then
				uv1 = "userDefault"

				if not slot1.OPEN then
					uv1 = "userDefault"
					slot1 = slot1.CLOSE
				end
			end

			return slot1
		end,
		func = function (slot0)
			slot1 = slot0 and 30 or 60

			cc.Director:getInstance():setAnimationInterval(1 / slot1)
			userDefault.setForeverLocalKey("fps", slot1, {
				rawKey = true
			})
		end
	},
	{
		name = gLanguageCsv.settingScreen,
		select1 = gLanguageCsv.settingScreenSelect1,
		select2 = gLanguageCsv.settingScreenSelect2,
		btnType = slot1.RADIO,
		initFunc = function ()
			if cc.UserDefault:getInstance():getBoolForKey("isNotchScreen", false) then
				uv1 = "cc"

				if not slot1.CLOSE then
					uv1 = "cc"
					slot1 = slot1.OPEN
				end
			end

			return slot1
		end,
		func = function (slot0)
			if cc.UserDefault:getInstance():getBoolForKey("isNotchScreen", false) ~= slot0 then
				return
			end

			gGameUI:sendMessage("adapterNotchScreen", true)

			slot1 = not slot0

			cc.UserDefault:getInstance():setBoolForKey("isNotchScreen", slot1)

			if slot1 then
				display.notchSceenSafeArea = display.fullScreenSafeArea
				display.notchSceenDiffX = display.fullScreenDiffX
			else
				display.notchSceenSafeArea = 0
				display.notchSceenDiffX = 0
			end

			gGameUI:sendMessage("adapterNotchScreen", false)
		end
	},
	{
		name = gLanguageCsv.settingVip,
		select1 = gLanguageCsv.settingHide,
		select2 = gLanguageCsv.settingShow,
		btnType = slot1.RADIO,
		initFunc = function ()
			if not gGameModel.role:read("vip_hide") then
				uv1 = "gGameModel"

				if not slot1.CLOSE then
					uv1 = "gGameModel"
					slot1 = slot1.OPEN
				end
			end

			return slot1
		end,
		func = function (slot0)
			if gGameModel.role:read("vip_hide") ~= slot0 then
				gGameApp:requestServer("/game/role/vip/display/switch", function (slot0)
				end, slot0)
			end
		end
	}
}

function slot5(slot0, slot1, slot2)
	slot1.text:text(slot2.name)
	slot1.btnPanel1:get("text"):text(slot2.select1)
	slot1.btnPanel2:get("text"):text(slot2.select2)

	function slot3(slot0, slot1)
		uv2 = "btnType"
		uv3 = "get"
		slot2 = slot2[slot3.btnType]
		slot3 = slot0:get("btn")
		slot4 = slot3:get("btnImg")

		slot3:texture(slot2.resNormal)
		slot4:texture(slot2.resBtnImg)
		slot4:xy(30, 30)

		slot5 = idler.new()
		slot6 = slot5.addListener

		slot6(slot5, function (slot0, slot1)
			uv2 = "OPEN"
			uv3 = "texture"
			slot4 = slot3
			slot3 = slot3.texture

			if slot0 == slot2.OPEN then
				uv5 = "resSelected"

				if not slot5.resSelected then
					uv5 = "resSelected"
					slot5 = slot5.resNormal
				end
			end

			slot3(slot4, slot5)

			if slot2 then
				uv3 = "resNormal"

				slot3:xy(100, 30)
			else
				uv3 = "resNormal"

				slot3:xy(30, 30)
			end

			uv3 = "xy"
			uv5 = "func"

			slot3.func(slot2, slot5)
		end, true)

		uv6 = "get"

		if slot6.needCallBack(slot1) then
			uv6 = "get"

			slot6.initFunc(slot1, function (slot0)
				uv1 = "set"

				slot1:set(slot0)
			end)
		else
			uv6 = "get"

			slot5:set(slot6.initFunc())
		end

		uv7 = "btnImg"

		bind.click(slot7, slot0, {
			method = function ()
				uv0 = "read"
				slot1 = slot0
				uv1 = "OPEN"

				if slot0.read(slot1) == slot1.OPEN then
					uv0 = "OPEN"

					if not slot0.CLOSE then
						uv0 = "OPEN"
						slot0 = slot0.OPEN
					end
				end

				uv1 = "read"

				slot1:set(slot0)
			end
		})
	end

	uv6 = "btnPanel1"

	if slot2.btnType == slot6.RADIO then
		function (slot0, slot1)
			uv2 = "btnType"
			uv3 = "get"
			slot2 = slot2[slot3.btnType]
			slot3 = slot0:get("btn")
			slot4 = slot1:get("btn")

			slot3:texture(slot2.resNormal)
			slot3:get("btnImg"):texture(slot2.resBtnImg)
			slot4:texture(slot2.resNormal)
			slot4:get("btnImg"):texture(slot2.resBtnImg)

			slot5 = idler.new()

			function slot8(slot0, slot1)
				uv2 = "OPEN"
				slot2 = slot0 == slot2.OPEN
				uv3 = "get"
				slot3 = slot3:get("btnImg")
				slot3 = slot3.visible

				slot3(slot3, slot2)

				uv3 = "btnImg"
				slot3 = slot3:get("btnImg")
				slot3 = slot3.visible

				slot3(slot3, not slot2)

				uv3 = "visible"

				slot3.func(slot2)
			end

			slot9 = true

			slot5:addListener(slot8, slot9)

			uv8 = "get"

			slot5:set(slot8.initFunc())

			function slot6()
				uv0 = "set"
				uv2 = "OPEN"

				slot0:set(slot2.OPEN)
			end

			function slot7()
				uv0 = "set"
				uv2 = "CLOSE"

				slot0:set(slot2.CLOSE)
			end

			uv9 = "texture"

			bind.click(slot9, slot0, {
				method = function ()
					uv0 = "set"
					uv2 = "OPEN"

					slot0:set(slot2.OPEN)
				end
			})

			uv9 = "texture"

			bind.click(slot9, slot1, {
				method = function ()
					uv0 = "set"
					uv2 = "CLOSE"

					slot0:set(slot2.CLOSE)
				end
			})
		end(slot1.btnPanel1, slot1.btnPanel2)
	else
		slot3(slot1.btnPanel1, 1)
		slot3(slot1.btnPanel2, 2)
	end
end

slot6 = class("SettingNormalView", cc.load("mvc").ViewBase)
slot6.RESOURCE_FILENAME = "setting_normal.json"
slot6.RESOURCE_BINDING = {
	["centerPanel.item"] = "listItem",
	centerPanel = "centerPanel",
	versionPanel = "versionPanel",
	["centerPanel.bottomPanel"] = "bottomPanel",
	serverTimePanel = "serverTimePanel",
	["centerPanel.btnList"] = {
		varname = "btnList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				padding = 0,
				data = bindHelper.self("listData"),
				item = bindHelper.self("listItem"),
				margin = bindHelper.self("margin"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot5 = slot1
					uv5 = "multiget"

					slot5(slot0, slot1.multiget(slot5, "text", "btnPanel1", "btnPanel2"), slot3)
				end,
				onAfterBuild = function (slot0)
					if itertools.size(slot0.data) == 1 then
						slot0:setItemAlignCenter()
					end
				end
			}
		}
	},
	["centerPanel.bottomPanel.btnService"] = {
		varname = "btnService",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onService")
			}
		}
	},
	["centerPanel.bottomPanel.btnLogOut"] = {
		varname = "btnLogOut",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onLogOut")
			}
		}
	},
	["centerPanel.bottomPanel.btnRedeemCode"] = {
		varname = "btnRedeemCode",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRedeemCode")
			}
		}
	},
	["centerPanel.bottomPanel.btnNotice"] = {
		varname = "btnNotice",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onNotice")
			}
		}
	},
	["centerPanel.bottomPanel.btnFeedback"] = {
		varname = "btnFeedback",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onFeedback")
			}
		}
	},
	["centerPanel.bottomPanel.btnTcPrivacy"] = {
		varname = "btnTcPrivacy",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onTcPrivacy")
			}
		}
	},
	["centerPanel.bottomPanel.btnLan"] = {
		varname = "btnLan",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onLan")
			}
		}
	},
	["centerPanel.bottomPanel.btnTcPermission"] = {
		varname = "btnTcPermission",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onTcPermission")
			}
		}
	}
}

function slot6.onCreate(slot0)
	uv2 = "listData"
	slot0.listData = clone(slot2)

	slot0.btnService:hide()
	slot0.btnLan:hide()

	if USE_MUTILLAN then
		slot0.btnLan:show()
	end

	slot0.btnList:show()
	slot0:judgeTc()
	slot0.versionPanel:get("version"):text(APP_VERSION)
	adapt.oneLinePos(slot0.versionPanel:get("version"), slot0.versionPanel:get("text"), nil, "right")
	slot0:enableSchedule():schedule(function ()
		slot0 = time.getNowDate()

		if APP_CHANNEL == "none" or APP_CHANNEL == "luo" then
			uv1 = "time"

			slot1.serverTimePanel:get("time"):text(string.format("%s/%s/%s %02d:%02d:%02d", slot0.year, slot0.month, slot0.day, slot0.hour, slot0.min, slot0.sec))
		else
			uv1 = "time"

			slot1.serverTimePanel:get("time"):text(string.format("%02d:%02d:%02d", slot0.hour, slot0.min, slot0.sec))
		end

		uv2 = "time"
		slot2 = slot2.serverTimePanel
		slot3 = slot2
		uv3 = "time"

		adapt.oneLinePos(slot2.get(slot3, "time"), slot3.serverTimePanel:get("text"), nil, "right")
	end, 1, 0, 1)

	if not dataEasy.isUnlock(gUnlockCsv.vipDisplaySwitch) then
		slot0.listData[3] = nil
	end

	if display.sizeInPixels.width < display.sizeInPixels.height * 2 then
		function ()
			uv0 = "listData"
			slot0.listData[2] = nil
		end()
	elseif device.platform == "windows" then
		if device.model == "iphone x" then
			slot1()
		end
	elseif display.isNotchSceen ~= 1 then
		slot1()
	end

	slot0.margin = ({
		0,
		70,
		30,
		8
	})[itertools.size(slot0.listData)]
	slot3 = 0

	slot0.versionPanel:onClick(function ()
		uv0 = "gGameUI"
		uv0 = 1
		uv0 = "gGameUI"

		if (slot0 + 1) % 10 == 0 then
			gGameUI:showTip("Copyright (c) 2020 HangZhou TianJi Information Technology Inc.")
		end
	end)
	slot0:setLoginProtocol()
end

function slot6.onService(slot0)
end

function slot6.setLoginProtocol(slot0)
	if not APP_TAG:find("_qq") then
		return
	end

	adapt.oneLinePos(slot0.btnNotice, rich.createWithWidth(string.format("#C0xB7B09E##L00010100##LUL%s#隐私政策和用户协议", "http://page.kuyangsh.cn/site/privacy?key=08a412053778cad3de9a8fcddb7e21582d3cfda0"), 36, nil, 1000):setAnchorPoint(cc.p(0, 0.5)):addTo(slot0.bottomPanel, 5, "richText"), cc.p(200, 40), "left")
end

function slot6.onLogOut(slot0)
	sdk.logout(function (slot0)
		print("sdk logout callback", slot0)
	end)
	sdk.commitRoleInfo(5, function ()
		print("sdk commitRoleInfo logout")
	end)
	gGameApp:onBackLogin()
end

function slot6.onNotice(slot0)
	gGameApp:getNotice(function (slot0)
		gGameUI:stackUI("login.placard", nil, , slot0.notice)
	end)
end

function slot6.onRedeemCode(slot0)
	gGameUI:stackUI("city.setting.redeem_code")
end

function slot6.onFeedback(slot0)
	if matchLanguage({
		"kr"
	}) then
		sdk.commitRoleInfo(54, function ()
			print("sdk commitRoleInfo customerService")
		end)

		return
	end

	if gCommonConfigCsv.feedBackDayCount <= userDefault.getCurrDayKey("feedBackDayCount", 0) then
		gGameUI:showTip(gLanguageCsv.feedBackTooMany)
	else
		gGameUI:stackUI("city.setting.feed_back")
	end
end

function slot6.judgeTc(slot0)
	slot1 = APP_TAG

	print("SettingNormalView:APP_TAG is ", slot1)

	slot3 = {}

	for slot7 in string.gmatch(string.gsub(slot1, "_", " "), "%w+") do
		slot3[#slot3 + 1] = slot7
	end

	if LOCAL_LANGUAGE == "cn" and slot3[1] and tonumber(slot3[3]) and slot3[1] == "a10054" and tonumber(slot3[3]) > 20210329 then
		slot0.btnTcPrivacy:show()
		slot0.btnTcPermission:show()
	else
		slot0.btnTcPrivacy:hide()
		slot0.btnTcPermission:hide()
	end
end

function slot6.onTcPrivacy(slot0)
	sdk.openPrivacyProtocols()
end

function slot6.onLan(slot0)
	gGameUI:showTip("Language")
	gGameUI:stackUI("city.setting.select_language")
end

function slot6.onTcPermission(slot0)
	sdk.openPermissionSetting()
end

return slot6
