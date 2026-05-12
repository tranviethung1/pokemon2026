if dev.LOGIN_ACCOUNT then
	userDefault.setForeverLocalKey("account", dev.LOGIN_ACCOUNT, {
		rawKey = true
	})
end

if dev.LOGIN_SERVER_KEY then
	userDefault.setForeverLocalKey("serverKey", dev.LOGIN_SERVER_KEY, {
		rawKey = true
	})
end

if EDITOR_ENABLE then
	-- Nothing
end

require("battle.app_views.battle.battle_entrance.include")

slot0 = class("LoginView", cc.load("mvc").ViewBase)
slot1 = require("app.views.city.halloween_messages"):getInstance()
slot0.RESOURCE_FILENAME = "login.json"
slot0.RESOURCE_BINDING = {
	["leftPanel.btnProtocol"] = "btnProtocol",
	["midPanel.server.bg"] = "serverBg",
	["leftPanel.btnUser"] = "btnUser",
	["midPanel.logo"] = "logo",
	leftPanel = "leftPanel",
	["midPanel.server.currServer"] = "currentServer",
	["leftPanel.btnNotice"] = {
		varname = "btnNotice",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlacardClick")
			}
		}
	},
	["leftPanel.btnNotice.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["midPanel.btnLogin"] = {
		varname = "btnLogin",
		binds = {
			event = "touch",
			clicksafe = true,
			methods = {
				ended = bindHelper.self("onLoginClick")
			}
		}
	},
	["midPanel.server"] = {
		varname = "loginServer",
		binds = {
			event = "click",
			method = bindHelper.self("onChooseServer")
		}
	},
	["midPanel.server.chooseServer"] = {
		varname = "chooseServer",
		binds = {
			event = "click",
			method = bindHelper.self("onChooseServer")
		}
	},
	["midPanel.server.status"] = {
		varname = "statusColor",
		binds = {
			event = "text",
			idler = bindHelper.self("serverStatus")
		}
	},
	version = {
		binds = {
			{
				event = "text",
				data = APP_VERSION
			},
			{
				event = "effect",
				data = {
					outline = {
						color = ui.COLORS.OUTLINE.DEFAULT
					}
				}
			}
		}
	}
}
slot2 = {
	RESOURCE_FILENAME = "login_input.json",
	RESOURCE_BINDING = {
		account = "account",
		txtAccount = "txtAccount"
	}
}
slot3 = {
	gLanguageCsv.hot,
	gLanguageCsv.fluency,
	gLanguageCsv.preserve
}
slot4 = {
	ui.COLORS.NORMAL.RED,
	cc.c4b(107, 201, 145, 255),
	cc.c4b(187, 187, 187, 255)
}

function slot0.onCreate(slot0)
	slot0.userName = nil

	slot0.btnUser:hide()
	slot0.btnProtocol:hide()

	slot1 = "login/login.skel"
	slot2, slot1 = dataEasy.isDisplayReplaceHuodong("loginSpine")

	if slot2 then
		-- Nothing
	end

	if APP_TAG:find("_qq") then
		slot4 = cc.Sprite:create("login/qq_bg.png")

		slot4:setScale(2)
		slot4:setPosition(cc.p(display.sizeInView.width / 2, display.sizeInView.height / 2))
		slot0:getResourceNode():addChild(slot4, 0)
	else
		widget.addAnimation(slot0:getResourceNode(), slot1, "effect_loop", 0):scale(2):xy(display.sizeInView.width / 2, display.sizeInView.height / 2):name("loginSpine")
	end

	slot0.serverStatus = idler.new("serverStatus")

	slot0.currentServer:text("currentServer")

	if TEST_CHANNELS[APP_CHANNEL] then
		slot4 = gGameUI:getConvertPos(slot0.loginServer)
		uv7 = "userName"
		slot0.inputWidget = gGameUI:createSimpleView(slot7, slot0):init()
		slot5 = slot0.inputWidget:getResourceNode():size()

		slot0.inputWidget:xy(slot4.x - slot5.width / 2, slot4.y - slot5.height / 2)
		slot0.inputWidget.txtAccount:setText(userDefault.getForeverLocalKey("account", "", {
			rawKey = true
		}))
		slot0.inputWidget.txtAccount:setPlaceHolderColor(ui.COLORS.DISABLED.GRAY)

		if dev.ONLINE_USER_NAME then
			slot0.inputWidget.txtAccount:setString(dev.ONLINE_USER_NAME)
		end

		adapt.oneLinePos(slot0.inputWidget.account, slot0.inputWidget.txtAccount, cc.p(15, 0))
	end

	if not dev.IGNORE_POPUP_BOX then
		slot6 = {
			{
				key = userDefault.getForeverLocalKey("placardStatusDay", {}, {
					rawData = true,
					rawKey = true
				})[os.date("%Y%m%d", os.time())],
				cb = function (slot0)
					uv1 = "showPlacard"

					slot1:showPlacard()
				end
			}
		}

		if APP_TAG:find("_qq") then
			table.insert(slot6, 1, {
				key = userDefault.getForeverLocalKey("protocalStatusSign", false, {
					rawData = true,
					rawKey = true
				}),
				cb = function (slot0)
					gGameUI:stackUI("login.protocol", {
						cb = slot0
					})
				end
			})
		end

		slot0:managerOpenView(slot6, 1)
	end

	audio.playMusic("login.mp3")
	userDefault.setForeverLocalKey("posterLoginShow", false, {
		rawKey = true
	})
	sdk.trackEvent("FINISHED_LOADING")
	slot0:additionForCN()
	slot0:additionForKR()
	slot0:additionForEN()
	slot0:additionForTW()

	slot4 = slot0.additionForEN_US

	slot4(slot0)

	uv4 = "btnUser"

	slot4:clear()
	slot0:testInLogin()

	gGameApp.loginCreateOK = true

	slot0:showNewPacketPoster()

	if function (slot0)
		return slot0 == nil or slot0 == ""
	end(userDefault.getForeverLocalKey("OkamiLan", "", {
		rawKey = true
	})) then
		gGameUI:stackUI("login.language")
	end

	if APP_CHANNEL == "xy51" then
		label.create("出版单位：成都盈众九州网络科技有限公司  著作权人：新疆楚汉互娱网络科技有限公司  国新出审【2019】1009号   ISBN 978-7-498-06262-8\n抵制不良游戏，拒绝盗版游戏，注意自我保护，谨防受骗上当，适度游戏益脑，沉迷游戏伤身，合理安排时间，享受健康生活。", {
			fontSize = 30,
			anchorPoint = cc.p(0.5, 0),
			effect = {
				color = ui.COLORS.NORMAL.WHITE,
				outline = {
					size = 4,
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}):addTo(slot0:getResourceNode(), 10):xy(display.sizeInView.width / 2, 10):setHorizontalAlignment(1)
	end
end

slot5 = {
	tc = true,
	tc_qd = true
}

function slot0.showNewPacketPoster(slot0)
	uv1 = "APP_CHANNEL"

	if not slot1[APP_CHANNEL] or APP_VERSION:sub(1, 2) == "3." then
		return
	end

	performWithDelay(slot0, function ()
		gGameUI:stackUI("city.activity.poster", nil, , {
			clickClose = false,
			cfg = {
				clientParam = {
					id = 390,
					res = "config/poster/img_hb_hxyl.png",
					newPackageJump = true,
					jumpTo = "huodongId-392"
				}
			},
			jumpCb = function ()
				cc.Application:getInstance():openURL(dataEasy.getPacketUrl())
			end
		})
	end, 0)
end

function slot0.createSupportLabel(slot0, slot1, slot2, slot3, slot4)
	slot5 = label.create(slot2, {
		fontPath = "font/youmi1.ttf",
		fontSize = slot3,
		color = ui.COLORS.NORMAL.WHITE,
		pos = cc.p(slot1:getContentSize().width / 2, -20),
		effect = {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		}
	}):addTo(slot1)

	adapt.setTextScaleWithWidth(slot5, slot2, 220)
	bind.touch(slot0, slot1, {
		methods = {
			ended = slot4
		}
	})

	return slot5
end

function slot0.additionForCN(slot0)
	if not checkLanguage("cn") then
		return
	end

	slot1 = cc.p(slot0.btnNotice:getPosition())
	slot1.x = slot1.x + 130
	slot1.y = slot1.y - 20
	slot2 = cc.Sprite:create("login/icon_cadpa.png"):setPosition(slot1):addTo(slot0.leftPanel)
end

function slot0.additionForKR(slot0)
	if not matchLanguage({
		"kr"
	}) then
		return
	end

	slot1 = {
		{
			resPath = "login/icon_grqb.png",
			name = "개인정보"
		},
		{
			resPath = "login/icon_yyzc.png",
			name = "운영정책"
		},
		{
			resPath = "login/icon_yhxy.png",
			name = "이용약관"
		},
		{
			resPath = "login/icon_kfzx.png",
			name = "고객센터"
		},
		{
			resPath = "login/icon_krqa.png",
			name = "카페"
		},
		{
			resPath = "login/icon_switch.png",
			name = "계정 전환"
		}
	}

	adapt.dockWithScreen(ccui.Layout:create():setAnchorPoint(cc.p(1, 1)):setPosition(cc.p(display.sizeInView.width, display.sizeInView.height)):size(cc.size(200, 600)):addTo(slot0:getResourceNode()), "left", "up")

	slot3 = nil
	slot4 = cc.p(slot0.btnProtocol:getPosition())

	for slot8 = 4, 5 do
		slot0:createSupportLabel(ccui.Button:create(slot1[slot8].resPath):setPosition(slot4):addTo(slot0.leftPanel):scale(0.9), slot1[slot8].name, 32, functools.partial(slot0.onAdditionBtnClick, slot0, slot8))

		slot4.y = slot4.y - 170
	end

	for slot8 = 1, 3 do
		slot0:createSupportLabel(ccui.Button:create(slot1[slot8].resPath):setPosition(cc.p(100, slot8 * 170)):addTo(slot2):scale(0.9), slot1[slot8].name, 32, functools.partial(slot0.onAdditionBtnClick, slot0, slot8))
	end

	if string.find(APP_TAG, "_yidun") then
		slot0:createSupportLabel(ccui.Button:create("login/icon_switch.png"):setPosition(slot4):addTo(slot0.leftPanel, 1, "Switch"):scale(0.83), "계정 전환", 38, functools.partial(slot0.onAdditionBtnClick, slot0, 6))
		slot0.leftPanel:getChildByName("Switch"):hide()
	end
end

function slot0.additionForEN(slot0)
	if not matchLanguage({
		"en"
	}) then
		return
	end

	slot1 = nil
	slot2 = cc.p(slot0.btnProtocol:getPosition())

	slot0:createSupportLabel(ccui.Button:create("login/icon_kfzx.png"):setPosition(slot2):addTo(slot0.leftPanel):scale(0.83), "Support", 38, functools.partial(slot0.onAdditionBtnClick, slot0, 4))

	slot2.y = slot2.y - 160

	slot0:createSupportLabel(ccui.Button:create("login/icon_discord.png"):setPosition(slot2):addTo(slot0.leftPanel):scale(0.83), "Discord", 38, functools.partial(slot0.onAdditionBtnClick, slot0, 5))

	slot2.y = slot2.y - 160

	slot0:createSupportLabel(ccui.Button:create("login/icon_OkamiLan.png"):setPosition(slot2):addTo(slot0.leftPanel, 1, "Language"):scale(0.83), "Language", 38, functools.partial(slot0.onAdditionBtnClick, slot0, 7))

	slot2.y = slot2.y - 160

	slot0:createSupportLabel(ccui.Button:create("login/icon_OkamiUser.png"):setPosition(slot2):addTo(slot0.leftPanel, 1, "Switch"):scale(0.83), "Switch", 38, functools.partial(slot0.onAdditionBtnClick, slot0, 6))
	slot0.leftPanel:getChildByName("Switch"):hide()
end

function slot0.additionForTW(slot0)
	if not matchLanguageForce({
		"tw"
	}) then
		return
	end

	slot1 = nil

	slot0:createSupportLabel(ccui.Button:create("login/icon_fb.png"):setPosition(cc.p(slot0.btnProtocol:getPosition())):addTo(slot0.leftPanel):scale(0.83), gLanguageCsv.battleFeedback, 44, functools.partial(slot0.onAdditionBtnClick, slot0, 4))
end

function slot0.additionForEN_US(slot0)
	if not matchLanguageForce({
		"en_us"
	}) then
		return
	end

	slot0:createSupportLabel(ccui.Button:create("login/icon_discord_us.png"):setPosition(cc.p(slot0.btnProtocol:getPosition())):addTo(slot0.leftPanel):scale(0.83), "Support", 38, functools.partial(slot0.onAdditionBtnClick, slot0, 4))
	slot0.logo:texture("login/icon_logo_en_us.png")
end

function slot0.onAdditionBtnClick(slot0, slot1)
	if matchLanguage({
		"kr"
	}) then
		if slot1 == 1 then
			sdk.commitRoleInfo(51, function ()
				print("sdk commitRoleInfo self infomation")
			end)
		elseif slot1 == 2 then
			sdk.commitRoleInfo(52, function ()
				print("sdk commitRoleInfo policy")
			end)
		elseif slot1 == 3 then
			sdk.commitRoleInfo(53, function ()
				print("sdk commitRoleInfo user protocol")
			end)
		elseif slot1 == 4 then
			sdk.commitRoleInfo(54, function ()
				print("sdk commitRoleInfo customerService")
			end)
		end
	elseif matchLanguage({
		"en"
	}) then
		if slot1 == 4 then
			cc.Application:getInstance():openURL(SUPPORT_URL)
		elseif slot1 == 5 then
			cc.Application:getInstance():openURL(DISCORD_URL)
		elseif slot1 == 6 then
			slot0.leftPanel:getChildByName("Switch"):hide()
			sdk.logout(function (slot0)
				print("sdk logout callback", slot0)
			end)
			gGameApp:onBackLogin()
		elseif slot1 == 7 then
			gGameUI:showTip("Language")
			gGameUI:stackUI("login.language")
		end
	end
end

function slot0.testInLogin(slot0)
	if device.platform == "windows" or device.platform == "mac" then
		uv3 = "device"

		require("app.views.login.test")(slot3)
		slot0:createTestScene()
	end

	if APP_CHANNEL == "none" and false then
		uv3 = "device"

		require("app.views.login.test")(slot3)
		performWithDelay(slot0, handler(slot0, "showBenchmark"), 4)
	end
end

function slot0.onPlacardClick(slot0)
	slot0:showPlacard()
end

function slot0.onChooseServer(slot0)
	gGameUI:stackUI("login.server", {
		setServerInfo = slot0:createHandler("setServerInfo")
	}, nil, slot0.servers)
end

function slot0.onLoginClick(slot0, slot1, slot2)
	if slot0.serverSelected and slot0.servers then
		sdk.trackEvent("START_GAME")
		print("selected server", slot0.serverSelected, dumps(slot0.servers[slot0.serverSelected]))

		slot4 = gGameModel.account:read("name")
		slot6 = md5(777654645654.0 .. slot4)

		if string.match(slot4, "zd_fb_") or string.match(slot4, "zd_gg_") or string.match(slot4, "zd_device_") or string.match(slot4, "zd_apple_") then
			gGameApp.net:doGET(string.format("https://id.megamon.asia/api/checkusername2.php?accountId=%s", slot4), function (slot0)
				if slot0 then
					if json.decode(slot0).code == 1 then
						print(slot1.code)
						print("LINK ACCOUNT FB XXXXXXX")
						gGameUI:showDialog({
							clearFast = true,
							btnType = 1,
							title = "RedFox Info",
							content = "Please link your account at website.\nClick the button [OK] below to link now",
							cb = function ()
								uv5 = "cc"
								uv6 = "Application"

								cc.Application:getInstance():openURL(string.format("%s/quicklogin.php?data=%s&username=%s", APILINK, slot5, slot6))
							end,
							dialogParams = {
								clickClose = false
							}
						}, styles)
					else
						slot4 = "/login/enter_server"
						uv4 = "code"

						gGameApp:requestServerCustom(slot4):params(slot4):onErrCall(function (slot0)
							sdk.trackEvent("ENTER_SEVER_ERR")

							if slot0.servers and #slot0.servers > 0 then
								uv1 = "sdk"

								slot1:setServers(slot0.servers)
							end

							if slot0.err == "register_disable" then
								function slot1()
									uv0 = "servers"
									uv1 = "servers"
									slot1 = slot1:selectServerIdx()
									slot0 = slot0.servers[slot1]
									uv1 = "servers"

									slot1:setServerInfo(slot0)
									gGameUI:showTip(gLanguageCsv.serverAutoChooseNew .. getServerName(slot0.key, true))
								end

								gGameUI:showDialog({
									title = gLanguageCsv.tips,
									content = gLanguageCsv.serverRegisterDisable,
									dialogParams = {
										clickClose = false
									},
									cb = slot1,
									closeCb = slot1
								})
							else
								gGameUI:showDialog({
									title = gLanguageCsv.tips,
									content = gLanguageCsv[slot0.err] or slot0.err,
									dialogParams = {
										clickClose = false
									}
								})
							end
						end):doit(function (slot0)
							sdk.trackEvent("ENTER_SEVER_SUCCESS")

							uv3 = "sdk"

							gGameApp:setGameServerAddr(slot3)
							gGameApp:requestServer("/game/login", function (slot0)
								sdk.trackEvent("GAME_LOGIN_SUC")

								uv3 = "sdk"
								uv4 = "sdk"

								userDefault.setForeverLocalKey("serverKey", slot3.servers[slot4.serverSelected].key, {
									rawKey = true
								})

								game.SKIN_GIVE = false

								for slot5, slot6 in ipairs({
									{
										maxLevel = 18,
										open = gUnlockCsv.vipLevel18
									},
									{
										maxLevel = 20,
										open = gUnlockCsv.vipLevel20
									}
								}) do
									if dataEasy.isUnlock(slot6.open) then
										game.VIP_LIMIT = slot6.maxLevel
									end
								end

								cc.Director:getInstance():setAnimationInterval(1 / userDefault.getForeverLocalKey("fps", 60, {
									rawKey = true
								}))

								if gGameUI.guideManager:checkFinished(1) and gGameUI.guideManager:checkFinished(2) then
									sdk.commitRoleInfo(1, function ()
										print("sdk commitRoleInfo and go to city")
									end)
									gGameUI:switchUI("city.view")
									sdk.trackEvent("PLAY_IN_CITY")
								else
									dataEasy.isSkipNewbieBattle(function ()
										if not gGameUI.guideManager:checkFinished(-1) then
											gGameApp:requestServer("/game/role/guide/newbie", nil, -1)
										end

										gGameUI:switchUI("new_character.view")
									end, function ()
										uv0 = "newbieBattle"

										slot0:newbieBattle()
										sdk.trackEvent("battle_demo")
									end)
								end
							end)
						end)
					end
				end
			end)
		else
			gGameApp:requestServerCustom("/login/enter_server"):params(slot3):onErrCall(function (slot0)
				sdk.trackEvent("ENTER_SEVER_ERR")

				if slot0.servers and #slot0.servers > 0 then
					uv1 = "sdk"

					slot1:setServers(slot0.servers)
				end

				if slot0.err == "register_disable" then
					function slot1()
						uv0 = "servers"
						uv1 = "servers"
						slot1 = slot1:selectServerIdx()
						slot0 = slot0.servers[slot1]
						uv1 = "servers"

						slot1:setServerInfo(slot0)
						gGameUI:showTip(gLanguageCsv.serverAutoChooseNew .. getServerName(slot0.key, true))
					end

					gGameUI:showDialog({
						title = gLanguageCsv.tips,
						content = gLanguageCsv.serverRegisterDisable,
						dialogParams = {
							clickClose = false
						},
						cb = slot1,
						closeCb = slot1
					})
				else
					gGameUI:showDialog({
						title = gLanguageCsv.tips,
						content = gLanguageCsv[slot0.err] or slot0.err,
						dialogParams = {
							clickClose = false
						}
					})
				end
			end):doit(function (slot0)
				sdk.trackEvent("ENTER_SEVER_SUCCESS")

				uv3 = "sdk"

				gGameApp:setGameServerAddr(slot3)
				gGameApp:requestServer("/game/login", function (slot0)
					sdk.trackEvent("GAME_LOGIN_SUC")

					uv3 = "sdk"
					uv4 = "sdk"

					userDefault.setForeverLocalKey("serverKey", slot3.servers[slot4.serverSelected].key, {
						rawKey = true
					})

					game.SKIN_GIVE = false

					for slot5, slot6 in ipairs({
						{
							maxLevel = 18,
							open = gUnlockCsv.vipLevel18
						},
						{
							maxLevel = 20,
							open = gUnlockCsv.vipLevel20
						}
					}) do
						if dataEasy.isUnlock(slot6.open) then
							game.VIP_LIMIT = slot6.maxLevel
						end
					end

					cc.Director:getInstance():setAnimationInterval(1 / userDefault.getForeverLocalKey("fps", 60, {
						rawKey = true
					}))

					if gGameUI.guideManager:checkFinished(1) and gGameUI.guideManager:checkFinished(2) then
						sdk.commitRoleInfo(1, function ()
							print("sdk commitRoleInfo and go to city")
						end)
						gGameUI:switchUI("city.view")
						sdk.trackEvent("PLAY_IN_CITY")
					else
						dataEasy.isSkipNewbieBattle(function ()
							if not gGameUI.guideManager:checkFinished(-1) then
								gGameApp:requestServer("/game/role/guide/newbie", nil, -1)
							end

							gGameUI:switchUI("new_character.view")
						end, function ()
							uv0 = "newbieBattle"

							slot0:newbieBattle()
							sdk.trackEvent("battle_demo")
						end)
					end
				end)
			end)
		end
	else
		sdk.trackEvent("START_LOGIN")

		slot3 = ""

		if TEST_CHANNELS[APP_CHANNEL] then
			if slot0.inputWidget.txtAccount:getString() == "" then
				gGameUI:showDialog({
					content = "name_can_not_empty"
				})

				return
			end

			if not dev.ONLINE_VERSION_LANGUAGE then
				userDefault.setForeverLocalKey("account", slot3, {
					rawKey = true
				})
			end

			slot0:onServerLogin(slot3)
		elseif device.platform == "windows" or device.platform == "mac" then
			slot0:onServerLogin("{\"passport\":\"8000163806978114141\",\"site_code\":\"FKDJXENANDROID\",\"t\":\"1704183711227\",\"ck\":\"b8514a945cc4a9be43d4db4eb69ab58b\"}")
		else
			sdk.login(function (slot0, slot1)
				printInfo("LoginView:sdkLogin %s %s", slot0, slot1)

				if slot0 == 0 then
					slot2 = sdk.trackEvent

					slot2("SDK_LOGIN_SUC")

					uv2 = "printInfo"

					slot2:onServerLogin(slot1)
				else
					sdk.trackEvent("SDK_LOGIN_ERR")
				end
			end)
		end
	end

	ymdump.setUserInfo("patch", tostring(cc.FileUtils:getInstance():getValueMapFromFile("res/version.plist").patch))
end

function slot6(slot0)
	slot1 = slot0.key

	if APP_CHANNEL == "none" or APP_CHANNEL == "bare" then
		return true
	end

	slot2 = slot1:find("game.shenhe.") ~= nil

	if FOR_SHENHE then
		return slot2
	end

	return not slot2
end

function slot0.showServerTip(slot0)
	slot1 = gLanguageCsv.serverOpenTime

	if APP_CHANNEL == "tc_beta" then
		slot1 = gLanguageCsv.serverCloseTime
	end

	gGameUI:showDialog({
		title = gLanguageCsv.tips,
		content = slot1,
		dialogParams = {
			clickClose = false
		}
	})
end

function slot0.setServers(slot0, slot1)
	collectgarbage()
	collectgarbage()

	slot0.servers = {}
	SERVERS_INFO = {}

	for slot6, slot7 in ipairs(json.decode(slot1)) do
		slot8 = SERVERS_INFO
		slot8[slot7.key] = slot7
		uv8 = "collectgarbage"

		if slot8(slot7) then
			table.insert(slot0.servers, slot7)
		else
			printDebug("the server %s be ignore", dumps(slot7))
		end
	end

	table.sort(slot0.servers, function (slot0, slot1)
		slot3 = string.split(slot1.key, ".")[2]

		if (SERVER_MAP[string.split(slot0.key, ".")[2]] and SERVER_MAP[slot2].order or math.huge) ~= (SERVER_MAP[slot3] and SERVER_MAP[slot3].order or math.huge) then
			return slot4 < slot5
		end

		return slot0.id < slot1.id
	end)
end

function slot0.selectServerIdx(slot0)
	for slot5, slot6 in ipairs(slot0.servers) do
		if slot6.status == 2 then
			table.insert({}, slot5)
		end
	end

	if APP_CHANNEL == "lp_en" and GEO_COUNTRT ~= "" then
		-- Nothing
	end

	if #slot1 > 0 then
		return slot1[math.random(1, #slot1)]
	end

	return #slot0.servers
end

function slot0.onServerLogin(slot0, slot1)
	if slot1 == slot0.userName then
		printWarn("onServerLogin %s too much", slot1)

		return
	end

	slot0.userName = slot1

	gGameApp:requestServerCustom("login"):onErrClose(function ()
		uv0 = "userName"
		slot0.userName = nil

		sdk.trackEvent("REQ_LOGIN_ERR")
	end):params(slot1):doit(function (slot0)
		uv1 = "setServers"
		slot1 = slot1.setServers

		slot1(slot1, slot0.servers)

		uv1 = "setServers"

		if #slot1.servers == 0 then
			uv1 = "setServers"
			slot1 = slot1.showServerTip

			slot1(slot1)

			uv1 = "setServers"
			slot1.userName = nil

			return
		end

		if userDefault.getForeverLocalKey("serverKey", nil, {
			rawKey = true
		}) then
			uv2 = "setServers"
			uv4 = "setServers"
			slot2.serverSelected = itertools.first(slot4.servers, function (slot0)
				uv2 = "key"

				return slot0.key == slot2
			end)
		else
			uv2 = "setServers"
			slot2.serverSelected = userDefault.getForeverLocalKey("serverId", nil, {
				rawKey = true
			})
		end

		uv2 = "setServers"
		uv3 = "setServers"

		if not slot2.servers[slot3.serverSelected] then
			uv2 = "setServers"
			uv3 = "setServers"
			slot2.serverSelected = slot3:selectServerIdx()
		end

		if dev.ONLINE_VERSION_LANGUAGE then
			slot2 = gGameModel.account:read("role_infos")
			uv5 = "setServers"

			for slot7, slot8 in ipairs(slot5.servers) do
				if slot2[slot8.key] and 0 < slot2[slot8.key].level then
					slot9 = slot2[slot8.key]
					slot3 = slot9.level
					uv9 = "setServers"
					slot9.serverSelected = slot7
				end
			end
		end

		uv2 = "setServers"
		uv3 = "setServers"
		slot3 = slot3.serverSelected
		slot2 = slot2.servers[slot3]
		uv3 = "setServers"
		uv5 = "setServers"
		uv6 = "setServers"

		slot3:setServerInfo(slot5.servers[slot6.serverSelected])

		slot3 = sdk.trackEvent

		slot3("SHOW_SERVER")

		uv3 = "setServers"

		slot3:showLoginServer()
	end)
end

function slot0.showPlacard(slot0)
	sdk.trackEvent("PULL_GAMESHOW")
	gGameApp:getNotice(function (slot0)
		gGameUI:stackUI("login.placard", nil, , slot0.notice)
	end)
end

function slot0.showLoginServer(slot0)
	slot0.leftPanel:getChildByName("Switch"):show()

	if APP_CHANNEL == "none" or APP_CHANNEL == "luo" then
		slot0.inputWidget:onClose()
	end

	slot0.loginServer:show()
end

function slot0.setServerInfo(slot0, slot1)
	uv4 = "serverStatus"

	slot0.serverStatus:set(slot4[slot1.status])

	slot5 = "%s %s"

	slot0.currentServer:text(string.format(slot5, getServerArea(slot1.key, nil, true), getServerName(slot1.key, true)))

	uv5 = "set"

	text.addEffect(slot0.statusColor, {
		color = slot5[slot1.status]
	})

	slot0.serverSelected = itertools.first(slot0.servers, function (slot0)
		uv2 = "key"

		return slot0.key == slot2.key
	end)

	slot0.serverBg:width(math.max(slot0.currentServer:width() + slot0.statusColor:width() + slot0.chooseServer:width() + 150, 823))
	adapt.oneLineCenterPos(cc.p(slot0.serverBg:xy()), {
		slot0.statusColor,
		slot0.currentServer,
		slot0.chooseServer
	}, cc.p(50, 0))
end

function slot0.newbieBattle(slot0)
	slot1 = {
		moduleType = 1,
		sceneID = 1,
		randSeed = 123456,
		roleLevel = 1,
		roleOut = csvClone(csv.role_out_init),
		names = {
			gLanguageCsv.newbieName1,
			gLanguageCsv.newbieName2
		},
		levels = {
			99,
			99
		},
		logos = {
			1,
			31
		},
		preData = {}
	}

	printInfo("in newbieBattle")

	slot2 = gGameUI:switchUIAndStash("battle.loading", slot1, slot1.sceneID, {
		baseMusic = "battle4.mp3"
	}, {})

	performWithDelay(slot2, function ()
		if gGameUI.isPlayVideo then
			uv0 = "gGameUI"

			slot0:onPlayMusic("battle4_pre.mp3")
		end
	end, 53)
	performWithDelay(slot2, function ()
		if gGameUI.isPlayVideo then
			uv0 = "gGameUI"

			slot0:onPlayMusic()
		end
	end, 61)
	gGameUI:playVideo("new.mp4", function ()
		uv0 = "onLoadOver"

		slot0:onLoadOver()
	end)
end

function slot0.managerOpenView(slot0, slot1, slot2)
	if not slot1[slot2] then
		return
	end

	if not slot3.key then
		slot3.cb(slot0:createHandler("managerOpenView", slot1, slot2 + 1))
	else
		slot0:managerOpenView(slot1, slot2 + 1)
	end
end

return slot0
