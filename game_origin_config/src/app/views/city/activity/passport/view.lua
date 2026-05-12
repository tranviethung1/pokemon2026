slot0 = 5
slot1 = {
	TASK = 2,
	REWARD = 1,
	SHOP = 3
}
slot2 = {
	"rewardPanel",
	"taskPanel",
	"shopPanel"
}
slot3 = {
	{
		bgPath = "activity/passport/task/bg_day.png",
		cornerPath = "activity/passport/task/lab_day.png",
		name = gLanguageCsv.everyday
	},
	{
		bgPath = "activity/passport/task/bg_week.png",
		cornerpath = "activity/passport/task/lab_week.png",
		name = gLanguageCsv.everyweek
	},
	{
		bgPath = "activity/passport/task/panle_day.png",
		cornerpath = "activity/passport/task/logo_day.png",
		name = gLanguageCsv.everydayVip
	},
	{
		bgPath = "activity/passport/task/panle_week.png",
		cornerpath = "activity/passport/task/logo_week.png",
		name = gLanguageCsv.everyweekVip
	}
}

function slot4(slot0, slot1)
	slot0:setTouchEnabled(slot1)
	cache.setShader(slot0, false, slot1 and "normal" or "hsl_gray")

	if slot1 then
		text.addEffect(slot0:get("txtNode"), {
			glow = {
				color = ui.COLORS.GLOW.WHITE
			}
		})
	else
		text.deleteAllEffect(slot0:get("txtNode"))
		text.addEffect(slot0:get("txtNode"), {
			color = ui.COLORS.DISABLED.WHITE
		})
	end
end

slot6 = class("ActivityPassportView", cc.load("mvc").ViewBase)
slot6.RESOURCE_FILENAME = "activity_passport.json"
slot6.RESOURCE_BINDING = {
	["rewardPanel.txtHigh"] = "rewardTxtHigh",
	["rewardPanel.icon"] = "rewardIcon",
	["taskPanel.txtNote"] = "taskNote",
	["rewardPanel.expBar"] = "rewardExpBar",
	pointItem = "pointItem",
	iconItem = "iconItem",
	["rewardPanel.exp"] = "rewardExp",
	["rewardPanel.highMask"] = "highMask",
	["rewardPanel.target.highPanel2"] = "targetHighPanel2",
	taskItem = "taskItem",
	["rewardPanel.scroll"] = "rewardScroll",
	["rewardPanel.endTime"] = "rewardEndTime",
	["rewardPanel.target"] = "target",
	["rewardPanel.target.highPanel1"] = "targetHighPanel1",
	["taskPanel.txtNode"] = "taskExpLess",
	rewardPanel = "rewardPanel",
	["rewardPanel.iconPointPanel"] = "iconPointPanel",
	shopPanel = "shopPanel",
	["shopPanel.item"] = "shopItem",
	["rewardPanel.highLock"] = "highLock",
	["taskPanel.iconTitle1"] = "taskIconTitle1",
	["rewardPanel.txtNormal"] = "rewardTxtNormal",
	["shopPanel.subList"] = "shopSubList",
	["taskPanel.iconTitlePanel"] = "iconTitlePanel",
	["taskPanel.iconTitlePanel.iconTitle2"] = "taskIconTitle2",
	["taskPanel.iconTitle3"] = "taskIconTitle3",
	["taskPanel.notMaxPanel.imgLock"] = "taskImgLock",
	rewardItem = "rewardItem",
	["rewardPanel.textNode2"] = "txtNode2",
	["taskPanel.expBar"] = "taskExpBar",
	["taskPanel.notMaxPanel"] = "taskNotMaxPanel",
	tabItem = "tabItem",
	["rewardPanel.target.noClick"] = "targetNoClick",
	["taskPanel.txtNote1"] = "taskNote1",
	["rewardPanel.imgLvMax"] = "imgLvMax",
	["taskPanel.icon"] = "taskIcon",
	["taskPanel.notMaxPanel.taskMask"] = "taskMask",
	["taskPanel.notMaxPanel.highList"] = "taskHighList",
	["taskPanel.notMaxPanel.txtHigh"] = "taskTxtHigh",
	taskPanel = "taskPanel",
	["taskPanel.notMaxPanel.txtNormal"] = "taskTxtNormal",
	["rewardPanel.target.normalPanel"] = "targetNormalPanel",
	["taskPanel.imgMax"] = "taskImgMax",
	["taskPanel.notMaxPanel.normalList"] = "taskNormalList",
	tabList = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("tabItem"),
				activityId = bindHelper.self("activityId"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("selected"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					slot9 = slot6:get("txtNode")

					adapt.setAutoText(slot9, slot3.name, slot6:getSize().height)

					slot8 = nil
					uv9 = "get"

					if slot2 == slot9.REWARD then
						slot8 = "passportReward"
					else
						uv9 = "get"

						if slot2 == slot9.TASK then
							slot8 = "passportTask"
						end
					end

					bind.extend(slot0, slot6, {
						class = "red_hint",
						props = {
							state = slot3.select ~= true and slot3.red,
							specialTag = slot8,
							listenData = {
								activityId = slot0.activityId
							}
						}
					})
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabClick")
			}
		}
	},
	["rewardPanel.lv"] = {
		varname = "rewardLv",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = cc.c4b(123, 115, 118, 255)
				}
			}
		}
	},
	["rewardPanel.name"] = {
		varname = "rewardName",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 6,
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["rewardPanel.btnRule"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnRule")
			}
		}
	},
	["rewardPanel.btnRule.txtNode"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["rewardPanel.btnBuy"] = {
		varname = "btnBuy",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnBuy")
			}
		}
	},
	["rewardPanel.btnBuyExp"] = {
		varname = "btnBuyExp",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnBuyExp")
			}
		}
	},
	["rewardPanel.btnOneKeyGet"] = {
		varname = "btnOneKeyGet",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnOneKeyGet")
			}
		}
	},
	["rewardPanel.iconList"] = {
		varname = "iconList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("iconDatas"),
				item = bindHelper.self("iconItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(slot3)
				end
			}
		}
	},
	["taskPanel.btnAllGet"] = {
		varname = "getBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onAllGetBtn()
				end)
			}
		}
	},
	["taskPanel.list"] = {
		varname = "taskList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				data = bindHelper.self("taskDatas"),
				dataOrderCmp = function (slot0, slot1)
					if slot0.sort ~= slot1.sort then
						return slot0.sort < slot1.sort
					elseif slot0.cfg.periodType ~= slot1.cfg.periodType then
						return slot0.cfg.periodType < slot1.cfg.periodType
					else
						return slot0.cfg.taskAttribute < slot1.cfg.taskAttribute
					end
				end,
				item = bindHelper.self("taskItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("bg", "cornerIcon", "cornerIcon1", "txtCorner", "txtCorner1", "txtTitle", "txtContent", "txtExp", "txtProgress", "btnGet", "btnGo", "imgGot")

					if slot3.buyHigh or slot3.cfg.taskAttribute == 3 then
						slot1:height(238)

						if slot3.cfg.taskAttribute == 3 then
							slot4.cornerIcon1:hide()
							slot4.txtCorner1:hide()

							uv7 = "multiget"
							slot7 = slot7[slot3.cfg.periodType].bgPath

							slot4.bg:texture(slot7)

							uv7 = "multiget"
							slot7 = slot7[slot3.cfg.periodType].cornerPath

							slot4.cornerIcon:texture(slot7)

							uv7 = "multiget"

							slot4.txtCorner:text(slot7[slot3.cfg.periodType].name)
						else
							slot4.cornerIcon:hide()
							slot4.txtCorner:hide()

							uv7 = "multiget"
							slot7 = slot7[slot3.cfg.periodType + 2].bgPath

							slot4.bg:texture(slot7)

							uv7 = "multiget"
							slot7 = slot7[slot3.cfg.periodType + 2].cornerPath

							slot4.cornerIcon1:texture(slot7)

							uv7 = "multiget"

							slot4.txtCorner1:text(slot7[slot3.cfg.periodType + 2].name)
						end

						adapt.setTextScaleWithWidth(slot4.txtCorner, nil, 95)
						slot4.txtTitle:text(slot3.cfg.title)
						slot4.txtContent:text(slot3.cfg.desc)
						slot4.txtExp:text(gLanguageCsv.passportExp .. "+" .. slot3.cfg.exp)
						text.addEffect(slot4.txtExp, {
							outline = {
								color = ui.COLORS.OUTLINE.WHITE
							}
						})
						slot4.txtProgress:text(slot3.progress .. "/" .. slot3.cfg.taskParam):visible(slot3.state == 0)
						slot4.imgGot:visible(slot3.state == 2)
						slot4.btnGet:visible(slot3.state == 1)
						slot4.btnGo:hide()

						if slot3.state == 0 then
							if slot3.cfg.goToPanel then
								slot4.btnGo:show()
							else
								slot4.btnGo:hide()
								slot4.txtProgress:y(slot1:height() / 2)
							end
						end

						bind.touch(slot0, slot4.btnGet, {
							methods = {
								ended = functools.partial(slot0.clickCell, slot1, slot3)
							}
						})
						bind.touch(slot0, slot4.btnGo, {
							methods = {
								ended = functools.partial(slot0.clickGoCell, slot3)
							}
						})
					else
						slot4.bg:hide()
						slot4.cornerIcon:hide()
						slot4.cornerIcon1:hide()
						slot4.txtCorner:hide()
						slot4.txtTitle:hide()
						slot4.txtContent:hide()
						slot4.txtExp:hide()
						slot4.txtProgress:hide()
						slot4.btnGet:hide()
						slot4.btnGo:hide()
						slot4.imgGot:hide()
						slot4.txtCorner1:hide()
						slot1:height(0)
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onGetClick"),
				clickGoCell = bindHelper.self("onGoClick")
			}
		}
	},
	["shopPanel.list"] = {
		varname = "shoplist",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 5,
				asyncPreload = 15,
				data = bindHelper.self("shopDatas"),
				dataOrderCmp = function (slot0, slot1)
					return slot0.position < slot1.position
				end,
				item = bindHelper.self("shopSubList"),
				cell = bindHelper.self("shopItem"),
				sliderBg = bindHelper.self("slider"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("name", "icon", "num", "btnBuy", "maskPanel", "textLimiteNote", "textLimiteNum")

					slot1:setTouchEnabled(true)
					slot4.maskPanel:hide()
					slot4.icon:hide()

					slot5 = uiEasy.setIconName(slot3.itemId, nil, {
						node = slot4.name
					})

					adapt.setTextScaleWithWidth(slot4.name, slot4.name:text(), slot1:width() - 150)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							simpleShow = true,
							data = {
								key = slot3.itemId
							},
							onNode = function (slot0)
								slot3 = false

								slot0:setTouchEnabled(slot3)

								uv3 = "setTouchEnabled"

								slot0:xy(slot3.icon:xy()):scale(1.5):z(3)
							end
						}
					})
					slot4.num:text("x" .. slot3.num)

					slot6, slot7 = csvNext(slot3.cfg.costMap)
					slot8 = dataEasy.getCfgByKey(slot6)

					slot4.btnBuy:get("icon"):texture(dataEasy.getIconResByKey(slot6))
					slot4.btnBuy:get("txt"):text(slot7)
					adapt.oneLineCenterPos(cc.p(180, 50), {
						slot4.btnBuy:get("icon"),
						slot4.btnBuy:get("txt")
					}, cc.p(5, 0))
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot0:getIdx(slot2), slot3)
						}
					})

					if slot3.itemNum == 0 then
						slot1:setTouchEnabled(false)
						slot4.maskPanel:show()
					end

					slot10 = slot3.itemNum

					if slot3.cfg.limitTimes > 0 then
						slot4.textLimiteNum:text(slot10 .. "/" .. slot9)

						slot11 = ui.COLORS.NORMAL.FRIEND_GREEN

						if slot10 == 0 then
							slot11 = ui.COLORS.NORMAL.ALERT_ORANGE
						end

						text.addEffect(slot1:get("textLimiteNum"), {
							color = slot11
						})
					end

					slot4.textLimiteNote:visible(slot9 > 0)
					slot4.textLimiteNum:visible(slot9 > 0)
					adapt.oneLineCenterPos(cc.p(210, 150), {
						slot4.textLimiteNote,
						slot4.textLimiteNum
					}, cc.p(5, 0))
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	["taskPanel.lv"] = {
		varname = "taskLv",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = cc.c4b(123, 115, 118, 255)
				}
			}
		}
	}
}

function slot6.onCreate(slot0, slot1)
	slot0.shopPanel:hide()
	gGameModel.currday_dispatch:getIdlerOrigin("passport"):set(true)

	slot0.activityId = slot1

	slot0:initModel()
	slot0:initData()

	slot0.endDate = csv.yunying.yyhuodong[slot0.activityId].endDate
	slot0.topView = gGameUI.topuiManager:createView(slot0.exchangeShop == 1 and "passport" or "default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "ORNAMENTS",
		title = gLanguageCsv.passport
	})
	slot4 = {
		{
			red = true,
			name = gLanguageCsv.passport
		},
		{
			red = true,
			name = gLanguageCsv.task
		},
		slot0.exchangeShop == 1 and {
			red = false,
			name = gLanguageCsv.starSkillExchange
		} or nil
	}
	slot0.tabDatas = idlers.newWithMap(slot4)
	uv4 = "shopPanel"
	slot0.showTab = idler.new(slot4.REWARD)

	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "visible"
		uv3 = "tabDatas"
		slot2 = slot2[slot3[slot1]]
		slot3 = slot2
		slot2 = slot2.visible

		slot2(slot3, false)

		uv2 = "visible"
		uv3 = "tabDatas"
		slot2 = slot2[slot3[slot0]]
		slot2 = slot2.visible

		slot2(slot2, true)

		uv2 = "visible"
		slot2 = slot2.tabDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "visible"
		slot2.tabDatas:atproxy(slot0).select = true
	end)

	slot3, slot4 = slot0.taskHighList:xy()
	slot0.spineExp = widget.addAnimationByKey(slot0.taskPanel, "tongxingzheng/tongxingzheng.skel", "spineExp", "effect2", 999):xy(slot0.taskIcon:x(), slot0.taskIcon:y()):scale(2)

	slot0.spineExp:setTimeScale(0)

	slot0.clientBuyTimes = idler.new(true)

	idlereasy.any({
		slot0.passport,
		slot0.clientBuyTimes
	}, function (slot0, slot1)
		slot3 = {}
		uv4 = "currentPassportLv"
		slot4.currentPassportLv = slot1.level
		uv4 = "currentPassportLv"
		slot4 = slot4.max == slot1.level
		uv5 = "currentPassportLv"
		slot5.buyHigh = itertools.size(slot1.buy) > 0
		uv5 = "currentPassportLv"
		slot5.curRewardIdx = nil
		slot5 = 1
		uv7 = "currentPassportLv"

		for slot9, slot10 in ipairs(slot7.awardCfg) do
			slot12 = slot10.custom

			if slot10.cfg.level <= slot1.level then
				slot2 = 0 + slot11.needExp
			end

			if slot11.level == slot1.level + 1 then
				slot3 = slot10
			end

			if slot1.normal_award[slot12.csvId] and slot12.normalAwardState ~= slot13 then
				slot12.normalAwardState = slot13
				uv14 = "currentPassportLv"

				if not slot14.isReset then
					uv14 = "currentPassportLv"

					slot14:modifyItem(slot9)
				end
			end

			if slot1.elite_award[slot12.csvId] and slot12.eliteAwardState ~= slot14 then
				slot12.eliteAwardState = slot14
				uv15 = "currentPassportLv"

				if not slot15.isReset then
					uv15 = "currentPassportLv"

					slot15:modifyItem(slot9)
				end
			end

			uv15 = "currentPassportLv"

			if not slot15.curRewardIdx then
				uv15 = "currentPassportLv"

				if not slot15.buyHigh then
					if slot12.normalAwardState == 1 then
						uv15 = "currentPassportLv"
						slot15.curRewardIdx = slot9
					elseif slot12.normalAwardState == 0 then
						slot5 = slot9
					end
				elseif slot12.normalAwardState == 1 or slot12.eliteAwardState == 1 then
					uv15 = "currentPassportLv"
					slot15.curRewardIdx = slot9
				elseif slot12.normalAwardState == 0 and slot12.eliteAwardState == 0 then
					slot5 = slot9
				end
			end
		end

		uv6 = "currentPassportLv"
		uv7 = "currentPassportLv"
		slot6.curRewardIdx = slot7.curRewardIdx or slot5
		uv6 = "currentPassportLv"
		slot6 = slot6.rewardLv
		slot6 = slot6.text

		slot6(slot6, slot1.level)

		uv6 = "currentPassportLv"

		if slot6.buyHigh then
			uv6 = "currentPassportLv"

			if not slot6.recharge[2].name then
				uv6 = "currentPassportLv"
				slot6 = slot6.recharge[1].name
			end
		end

		uv7 = "currentPassportLv"
		slot7 = slot7.rewardName
		slot7 = slot7.text
		slot9 = slot6

		slot7(slot7, slot9)

		uv7 = "currentPassportLv"
		slot7 = slot7.rewardTxtNormal
		slot7 = slot7.text
		uv9 = "currentPassportLv"
		slot9 = slot9.recharge[1].name

		slot7(slot7, slot9)

		uv7 = "currentPassportLv"
		uv9 = "currentPassportLv"

		slot7.rewardTxtHigh:text(slot9.recharge[2].name)

		slot8 = time.getActivityOpenDate(slot1.yy_id)
		uv8 = "currentPassportLv"
		slot8 = slot8.rewardEndTime
		slot9 = slot8

		slot8.text(slot9, string.split(slot8, "-")[2])

		uv9 = "currentPassportLv"
		slot10 = slot1.level
		uv10 = "currentPassportLv"
		slot8 = slot1.exp - slot2 + slot9.awardCfg[slot10].cfg.needExp .. "/" .. slot10.awardCfg[slot1.level].cfg.needExp
		slot9 = string.format(gLanguageCsv.leveUpLessExp, slot2 - slot1.exp)

		if slot4 then
			slot9 = gLanguageCsv.levelMax
			slot8 = gLanguageCsv.levelMax
		else
			uv11 = "currentPassportLv"
			uv12 = "currentPassportLv"
			slot12 = slot12.taskNormalList

			uiEasy.createItemsToList(slot11, slot12, slot3.cfg.normalAward, {
				scale = 0.8
			})

			uv11 = "currentPassportLv"
			uv12 = "currentPassportLv"

			uiEasy.createItemsToList(slot11, slot12.taskHighList, slot3.cfg.eliteAward, {
				margin = 20,
				scale = 0.8,
				onAfterBuild = function ()
					uv0 = "taskHighList"

					slot0.taskHighList:setItemAlignCenter()
				end
			})
		end

		uv10 = "currentPassportLv"
		slot10 = slot10.rewardExp
		slot10 = slot10.text

		slot10(slot10, slot8)

		uv10 = "currentPassportLv"
		slot10 = slot10.taskExpLess
		slot10 = slot10.text

		slot10(slot10, slot9)

		uv10 = "currentPassportLv"
		slot10 = slot10.txtNode2
		slot10 = slot10.visible
		uv13 = "currentPassportLv"

		slot10(slot10, slot1.level ~= slot13.max)

		uv10 = "currentPassportLv"
		slot10 = slot10.rewardExpBar
		slot10 = slot10.setPercent
		uv13 = "currentPassportLv"
		slot13 = slot13.awardCfg[slot1.level].cfg.needExp
		uv13 = "currentPassportLv"

		slot10(slot10, (slot1.exp - slot2 + slot13) / slot13.awardCfg[slot1.level].cfg.needExp * 100)

		uv10 = "currentPassportLv"
		slot10 = slot10.imgLvMax
		slot10 = slot10.visible

		slot10(slot10, slot4)

		uv10 = "currentPassportLv"
		slot10 = slot10.updBuyTime
		slot12 = slot4

		slot10(slot10, slot12)

		uv10 = "currentPassportLv"
		slot10 = slot10.highMask
		slot10 = slot10.visible
		uv12 = "currentPassportLv"
		slot12 = not slot12.buyHigh

		slot10(slot10, slot12)

		uv10 = "currentPassportLv"
		slot10 = slot10.highLock
		slot10 = slot10.visible
		uv12 = "currentPassportLv"

		slot10(slot10, not slot12.buyHigh)

		uv10 = "level"

		if slot10.clientParam.version == 1 then
			uv11 = "currentPassportLv"
			slot11 = slot11.taskIconTitle1
			slot11 = slot11.x

			slot11(slot11, 213)

			uv11 = "currentPassportLv"

			slot11.taskIconTitle3:x(545)
		else
			uv11 = "currentPassportLv"

			slot11.taskIconTitle2:x(465 - 116 * (slot10 - 1))
		end

		uv11 = "currentPassportLv"
		slot11 = slot11.taskIcon
		slot11 = slot11.texture
		uv13 = "currentPassportLv"
		slot13 = slot13.buyHigh and "activity/passport/icon_better_2.png" or "activity/passport/icon_regular_2.png"

		slot11(slot11, slot13)

		uv11 = "currentPassportLv"
		slot11 = slot11.rewardIcon
		slot11 = slot11.texture
		uv13 = "currentPassportLv"
		slot13 = slot13.buyHigh and "activity/passport/icon_better_2.png" or "activity/passport/icon_regular_2.png"

		slot11(slot11, slot13)

		uv11 = "currentPassportLv"
		slot11 = slot11.taskIconTitle3
		slot11 = slot11.texture
		uv13 = "currentPassportLv"
		slot13 = slot13.buyHigh and "activity/passport/task/" .. "txt_ds.png" or "activity/passport/task/" .. "txt_mx.png"

		slot11(slot11, slot13)

		uv11 = "currentPassportLv"
		slot11 = slot11.taskImgLock
		slot11 = slot11.visible
		uv13 = "currentPassportLv"
		slot13 = not slot13.buyHigh

		slot11(slot11, slot13)

		uv11 = "currentPassportLv"
		slot11 = slot11.taskMask
		slot11 = slot11.visible
		uv13 = "currentPassportLv"

		slot11(slot11, not slot13.buyHigh)

		uv11 = "currentPassportLv"
		slot11 = slot11.taskLv
		slot11 = slot11.text

		slot11(slot11, slot1.level)

		uv11 = "currentPassportLv"
		slot11 = slot11.taskExpBar
		slot11 = slot11.setPercent
		uv14 = "currentPassportLv"
		slot14 = slot14.awardCfg[slot1.level].cfg.needExp
		uv14 = "currentPassportLv"

		slot11(slot11, (slot1.exp - slot2 + slot14) / slot14.awardCfg[slot1.level].cfg.needExp * 100)

		uv11 = "currentPassportLv"
		slot11 = slot11.taskImgMax
		slot11 = slot11.visible

		slot11(slot11, slot4)

		uv11 = "currentPassportLv"
		slot11 = slot11.taskNotMaxPanel
		slot11 = slot11.visible
		slot13 = not slot4

		slot11(slot11, slot13)

		uv11 = "currentPassportLv"
		slot11 = slot11.taskTxtNormal
		slot11 = slot11.text
		uv13 = "currentPassportLv"
		slot13 = slot13.recharge[1].name

		slot11(slot11, slot13)

		uv11 = "currentPassportLv"
		slot11 = slot11.taskTxtHigh
		slot11 = slot11.text
		uv13 = "currentPassportLv"

		slot11(slot11, slot13.recharge[2].name)

		uv11 = "currentPassportLv"
		slot11 = slot11.updTaskData

		slot11(slot11, slot1)

		uv11 = "currentPassportLv"
		slot11 = slot11.updataShopDatas

		slot11(slot11)

		uv11 = "currentPassportLv"

		slot11:updShowView()
	end)

	if slot0.isReset then
		slot0:resetScroll()
	end

	slot5 = string.split(slot2.clientParam.res, "|")
	slot0.iconDatas = idlers.newWithMap(slot5)

	slot0:enableSchedule()

	uv10 = "gGameModel"
	uv11 = "gGameModel"

	slot0:schedule(function ()
		uv0 = "index"
		slot0 = slot0.index
		slot1 = slot0
		uv1 = "read"
		slot0 = slot0.read(slot1) < slot1 - 1 and slot0 + 1 or 0
		uv1 = "index"
		slot1 = slot1.index
		slot1 = slot1.set

		slot1(slot1, slot0)

		uv1 = "index"

		slot1.iconList:jumpToItem(slot0, cc.p(0, 1), cc.p(0, 1))
	end, slot10, slot11, 1)
	slot0.iconList:onScroll(function (slot0)
		uv1 = "iconList"
		uv3 = "iconList"
		slot1 = slot1.iconList:getIndex(slot3.iconList:getCenterItemInCurrentView())

		if slot0.name == "SCROLLING_ENDED" then
			uv2 = "iconList"
			slot2 = slot2.iconList
			slot2 = slot2.jumpToItem

			slot2(slot2, slot1, cc.p(0, 1), cc.p(0, 1))

			uv2 = "iconList"

			slot2.index:set(slot1)
		end
	end)

	for slot10 = 1, itertools.size(slot5) do
		slot13 = slot0.pointItem:clone():xy(slot0.iconPointPanel:width() / 2 - (slot6 - 1) / 2 * (slot0.pointItem:width() + 16) + (slot10 - 1) * (slot0.pointItem:width() + 16), slot0.iconPointPanel:height() / 2):show():addTo(slot0.iconPointPanel, 10, "point" .. slot10)
	end

	idlereasy.when(slot0.index, function (slot0, slot1)
		uv3 = "iconPointPanel"

		for slot5 = 1, slot3 do
			uv6 = "get"

			slot6.iconPointPanel:get("point" .. slot5):setOpacity(102)
		end

		uv2 = "get"

		slot2.iconPointPanel:get("point" .. slot1 + 1):setOpacity(178.5)
	end)
	adapt.oneLineCenterPos(cc.p(450, 900), {
		slot0.taskIconTitle1,
		slot0.iconTitlePanel,
		slot0.taskIconTitle3
	}, {
		cc.p(2, -slot0.iconTitlePanel:size().height / 2),
		cc.p(2, slot0.iconTitlePanel:size().height / 2)
	})
end

function slot6.initModel(slot0)
	slot0.passport = gGameModel.role:getIdler("passport")
	slot0.shop = slot0.passport:read().shop or {}
end

function slot6.initData(slot0)
	slot1 = csv.yunying.yyhuodong[slot0.activityId]
	slot0.awardCfg = {}

	for slot5, slot6 in orderCsvPairs(csv.yunying.passport_award) do
		if slot6.huodongID == slot1.huodongID then
			table.insert(slot0.awardCfg, {
				cfg = slot6,
				custom = {
					csvId = slot5
				}
			})
		end
	end

	slot0.taskCfg = {}
	slot0.startHideLevel = slot1.paramMap.startHideLevel or 0
	slot0.exchangeShop = slot1.paramMap.exchangeShop

	for slot6, slot7 in orderCsvPairs(csv.yunying.passport_task) do
		if slot7.huodongID == slot1.paramMap.taskHuodongID then
			slot0.taskCfg[slot6] = slot7
		end
	end

	slot0.shopCfg = {}

	for slot6, slot7 in orderCsvPairs(csv.yunying.passport_shop) do
		if slot7.huodongID == slot1.huodongID then
			slot0.shopCfg[slot6] = slot7
		end
	end

	slot0.recharge = csv.yunying.passport_recharge
	slot0.max = #slot0.awardCfg
	slot0.taskDatas = idlers.newWithMap({})
	slot0.shopDatas = idlers.newWithMap({})
	slot0.currentPassportLv = slot0.passport:read().level
	slot0.buyHigh = itertools.size(slot0.passport:read().buy) > 0
	slot0.index = idler.new(0)
	slot0.isReset = true

	if not slot0.clock then
		slot0.clock = 1
	end

	slot0.items = gGameModel.role:getIdler("items")
end

function slot6.updBuyTime(slot0, slot1)
	slot0.btnBuy:visible(not slot0.buyHigh)

	for slot5, slot6 in orderCsvPairs(csv.yunying.passport_recharge) do
		if slot6.type == 1 and dataEasy.getPayClientBuyTimes("directBuyData", slot0.activityId, slot5, 0) > 0 then
			slot0.btnBuy:hide()
		end
	end

	slot0.btnBuyExp:hide()

	slot2 = csv.yunying.yyhuodong[slot0.activityId]

	if slot0.buyHigh and not slot1 then
		if slot2.paramMap.canBuyExp == 1 or slot2.clientParam.buyExpShowDay and slot2.clientParam.buyExpShowDay > 0 and (gGameModel.role:read("yy_endtime")[slot0.activityId] or 0) - time.getTime() <= slot2.clientParam.buyExpShowDay * 24 * 3600 then
			slot0.btnBuyExp:show()
		end
	end
end

function slot6.updTaskData(slot0, slot1)
	slot2 = {}
	slot3 = false
	slot0.playDatas = 0

	for slot7, slot8 in pairs(slot0.taskCfg) do
		if (slot8.periodType == 1 or slot8.periodType == 2 and slot8.weekParam == slot1.week_num) and (slot8.taskAttribute == 3 or slot0.buyHigh) then
			if slot1.task[slot7] then
				if slot11[2] ~= 0 then
					if slot11[2] == 1 then
						slot3 = true

						if slot0.playDatas < 5 then
							slot0.playDatas = slot0.playDatas + 1
						end
					end
				end
			end

			table.insert(slot2, {
				progress = 0,
				sort = 2,
				state = 0,
				cfg = slot8,
				csvId = slot7,
				buyHigh = slot0.buyHigh,
				progress = slot11[1],
				state = slot11[2],
				sort = slot11[2] == 1 and 1 or 3
			})
		end
	end

	uv4 = "playDatas"

	slot4(slot0.getBtn, slot3)
	slot0.taskDatas:update(slot2)
end

function slot6.updataShopDatas(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.shopCfg) do
		slot8, slot9 = csvNext(slot6.items)
		slot10, slot11 = csvNext(slot6.costMap)

		table.insert(slot1, {
			position = slot6.position,
			costType = slot10,
			costNum = slot11,
			cfg = slot6,
			csvId = slot5,
			itemId = slot8,
			num = slot9,
			itemNum = slot0:getItemNum(slot5, slot6) or slot6.limitTimes
		})
	end

	slot0.shopDatas:update(slot1)
end

function slot6.updShowView(slot0)
	if slot0.startHideLevel < slot0.currentPassportLv and slot0.clock == 1 then
		slot0:resetScroll()

		slot0.clock = 0
	end

	if not slot0.buyHigh then
		slot1 = rich.createWithWidth(gLanguageCsv.passwordActivateNote, 38, nil, 1250):addTo(slot0.taskNote, 10):anchorPoint(cc.p(0, 0.5)):xy(-410, 10):formatText()
	else
		slot0.taskNote:hide()

		slot1 = rich.createWithWidth(gLanguageCsv.passwordTaskNote, 38, nil, 1250):addTo(slot0.taskNote1, 10):anchorPoint(cc.p(0, 0.5)):xy(-410, 5):formatText()
	end
end

function slot6.onTabClick(slot0, slot1, slot2)
	slot0.rewardScroll:stopAutoScroll()
	slot0.taskList:stopAutoScroll()
	slot0.showTab:set(slot2)
end

function slot6.onBtnRule(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1000
	})
end

function slot6.onBtnBuy(slot0)
	slot0.rewardScroll:stopAutoScroll()
	gGameUI:stackUI("city.activity.passport.buy", nil, , slot0.activityId, slot0:createHandler("onBtnBuyCb"))
end

function slot6.onBtnBuyCb(slot0)
	slot0.clientBuyTimes:notify()
end

function slot6.onBtnBuyExp(slot0)
	slot0.rewardScroll:stopAutoScroll()
	gGameUI:stackUI("city.activity.passport.buy_exp", nil, , slot0.activityId)
end

function slot6.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(116),
		slot2.noteText(63001, 63006)
	}
end

function slot6.onBtnGetClick(slot0, slot1)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, slot1.custom.csvId)
end

function slot6.onBtnOneKeyGet(slot0)
	slot1 = false

	for slot6, slot7 in pairs(slot0.passport:read().normal_award) do
		if slot7 == 1 then
			slot1 = true

			break
		end
	end

	for slot6, slot7 in pairs(slot2.elite_award) do
		if slot7 == 1 then
			slot1 = true

			break
		end
	end

	if not slot1 then
		gGameUI:showTip(gLanguageCsv.noRewardGet)

		return
	end

	gGameApp:requestServer("/game/yy/passport/award/get_onekey", function (slot0)
		slot1 = gGameUI
		slot1 = slot1.showGainDisplay

		slot1(slot1, slot0)

		uv1 = "gGameUI"

		slot1:resetScroll()
	end, slot0.activityId)
end

function slot6.onGetClick(slot0, slot1, slot2, slot3)
	gGameApp:requestServerCustom("/game/yy/passport/task/get_exp"):params(slot0.activityId, slot3.csvId):onResponse(function ()
		uv1 = "widget"
		slot2 = "tongxingzheng/tongxingzheng.skel"
		uv2 = "widget"
		slot3 = slot2
		uv3 = "widget"
		slot0 = widget.addAnimationByKey(slot1, slot2, "lingqu", "effect1", 999):xy(slot2.width(slot3) / 2, slot3:height() / 2):scale(2)
		slot0 = slot0.play

		slot0(slot0, "effect1")

		uv0 = "addAnimationByKey"
		slot0 = slot0.spineExp
		slot0 = slot0.setTimeScale

		slot0(slot0, 1)

		uv0 = "addAnimationByKey"
		slot0 = slot0.spineExp
		slot1 = slot0

		slot0.play(slot1, "effect2")

		uv1 = "addAnimationByKey"

		performWithDelay(slot1, function ()
			error("Decompilation failed")
			-- Exception in function building!
			-- Traceback (most recent call last):
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
			--     return _build_function_definition(prototype, state.header)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
			--     node.statements.contents = _build_function_blocks(state, instructions)
			--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
			--     statement, line_marked_elements = _build_statement(state, addr, instruction)
			--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
			--     return _build_var_assignment(state, addr, instruction)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
			--     assn = func(*args, **kwargs)
			--            ^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
			--     expression = _build_const_expression(state, addr, instruction)
			--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
			--     return _build_string_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
			--     node.value = state.constants.complex_constants[index]
			--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end, 0.8666666666666667)
	end):wait({
		false
	}):doit()
end

function slot6.onAllGetBtn(slot0)
	gGameApp:requestServerCustom("/game/yy/passport/task/get_exp"):params(slot0.activityId, -1):onResponse(function ()
		uv0 = "taskList"
		slot0 = slot0.taskList:getItems()
		uv2 = "taskList"

		for slot4 = 1, slot2.playDatas do
			widget.addAnimationByKey(slot0[slot4], "tongxingzheng/tongxingzheng.skel", "lingqu", "effect1", 999):xy(slot0[slot4]:width() / 2, slot0[slot4]:height() / 2):scale(2):play("effect1")
		end

		uv1 = "taskList"
		slot1 = slot1.spineExp
		slot1 = slot1.setTimeScale

		slot1(slot1, 1)

		uv1 = "taskList"
		slot1 = slot1.spineExp
		slot2 = slot1

		slot1.play(slot2, "effect2")

		uv2 = "taskList"

		performWithDelay(slot2, function ()
			error("Decompilation failed")
			-- Exception in function building!
			-- Traceback (most recent call last):
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
			--     return _build_function_definition(prototype, state.header)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
			--     node.statements.contents = _build_function_blocks(state, instructions)
			--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
			--     statement, line_marked_elements = _build_statement(state, addr, instruction)
			--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
			--     return _build_var_assignment(state, addr, instruction)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
			--     assn = func(*args, **kwargs)
			--            ^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
			--     expression = _build_const_expression(state, addr, instruction)
			--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
			--     return _build_string_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
			--     node.value = state.constants.complex_constants[index]
			--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end, 0.8666666666666667)
	end):wait({
		false
	}):doit()
end

function slot6.onGoClick(slot0, slot1, slot2)
	jumpEasy.jumpTo(slot2.cfg.goToPanel)
end

function slot6.buildScroll(slot0)
	slot0.rewardScroll:setScrollBarEnabled(false)

	slot3 = slot0.rewardScroll:getInnerContainer()
	slot4 = 0
	slot5 = 0

	if slot0.currentPassportLv < slot0.startHideLevel then
		slot5 = slot0.rewardScroll:size().height
		slot4 = slot0.rewardItem:width() * slot0.startHideLevel
	else
		slot5 = slot2.height
		slot4 = slot1 * slot0.max
	end

	slot3:size(slot4, slot5)

	slot0.itemCreateNum = math.ceil(slot2.width / slot1) + 5
	slot7 = slot1 * slot0.itemCreateNum

	if slot0.max < slot0.curRewardIdx - 1 + slot0.itemCreateNum then
		slot8 = slot0.curRewardIdx - (slot9 - slot0.max)
		slot9 = slot0.max
	end

	slot10 = slot8 % slot6 == 0 and slot6 or slot8 % slot6
	slot11 = slot10 - 1 == 0 and slot6 or slot10 - 1
	slot12, slot13 = nil
	slot0.percent = -1

	function ()
		error("Decompilation failed")
		-- Exception in function building!
		-- Traceback (most recent call last):
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
		--     return _build_function_definition(prototype, state.header)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
		--     node.statements.contents = _build_function_blocks(state, instructions)
		--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
		--     statement, line_marked_elements = _build_statement(state, addr, instruction)
		--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
		--     return _build_var_assignment(state, addr, instruction)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
		--     assn = func(*args, **kwargs)
		--            ^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
		--     expression = _build_const_expression(state, addr, instruction)
		--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
		--     return _build_numeric_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
		--     number = state.constants.numeric_constants[index]
		--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end()
	slot0.rewardScroll:onEvent(function (slot0)
		if slot0.name == "CONTAINER_MOVED" then
			uv1 = "name"

			slot1()
		elseif slot0.name == "SCROLLING_BEGAN" then
			uv1 = "CONTAINER_MOVED"

			slot1:refreshNoClick(true)
		elseif slot0.name == "AUTOSCROLL_ENDED" then
			uv1 = "CONTAINER_MOVED"

			slot1:refreshNoClick(false)
		elseif slot0.name == "SCROLLING_ENDED" then
			-- Nothing
		end
	end)
end

function slot6.buildItem(slot0)
	if slot0.max < slot0.curRewardIdx - 1 + slot0.itemCreateNum then
		slot1 = slot0.curRewardIdx - (slot2 - slot0.max)
		slot2 = slot0.max
	end

	for slot6 = slot1, slot2 do
		slot0:addItem(slot6)
	end
end

function slot6.addItem(slot0, slot1)
	slot2 = slot0.awardCfg[slot1]
	slot3 = slot0.rewardItem:clone()
	slot4 = slot1 % slot0.itemCreateNum == 0 and slot0.itemCreateNum or slot1 % slot0.itemCreateNum

	slot3:xy((slot1 - 1) * slot0.rewardItem:width(), 0)
	slot0:refreshRewardItem(slot3, slot1)
	slot0.rewardScroll:addChild(slot3, slot4, "reward" .. slot4)
	slot3:show()

	return slot3
end

function slot6.modifyItem(slot0, slot1)
	for slot5 = 1, slot0.itemCreateNum do
		if slot0.rewardScroll:getChildByName("reward" .. slot5):x() == (slot1 - 1) * slot0.rewardItem:width() then
			slot0:refreshRewardItem(slot6, slot1)
		end
	end
end

function slot6.refreshRewardItem(slot0, slot1, slot2)
	slot4 = slot0.awardCfg[slot2].cfg.specialAward == 1

	slot1:multiget("lv", "normalPanel", "highPanel1", "highPanel2", "topMask", "bottomMask", "btnGet", "noClick").lv:text(slot3.cfg.level)

	for slot10, slot11 in csvMapPairs(slot3.cfg.normalAward) do
		-- Nothing
	end

	slot11 = {
		key = slot10,
		num = slot11,
		state = slot3.custom.normalAwardState
	}
	slot12 = slot4

	slot0:onBindIcon(slot0.rewardScroll, slot5.normalPanel, slot11, slot12)

	slot7 = {}

	for slot11, slot12 in csvMapPairs(slot3.cfg.eliteAward) do
		table.insert(slot7, {
			key = slot11,
			num = slot12,
			state = slot3.custom.eliteAwardState
		})
	end

	slot0:onBindIcon(slot0.rewardScroll, slot5.highPanel1, slot7[1], slot4)

	if slot7[2] then
		slot0:onBindIcon(slot0.rewardScroll, slot5.highPanel2, slot7[2], slot4)
		slot5.highPanel2:show()
	else
		slot5.highPanel2:hide()
	end

	slot5.btnGet:visible(slot3.custom.normalAwardState == 1 or slot3.custom.eliteAwardState == 1)
	bind.touch(slot0, slot5.btnGet, {
		methods = {
			ended = function (slot0, slot1, slot2)
				uv3 = "onBtnGetClick"
				uv5 = "onBtnGetClick"

				slot3:onBtnGetClick(slot5)
			end
		}
	})
	slot5.topMask:visible(slot0.currentPassportLv < slot3.cfg.level)
	slot5.bottomMask:visible(slot0.currentPassportLv < slot3.cfg.level or not slot0.buyHigh)
	bind.click(slot0, slot5.noClick, {
		method = function ()
			uv0 = "onRewardNoClick"

			slot0:onRewardNoClick()
		end
	})
end

function slot6.onRewardNoClick(slot0)
	slot0:refreshNoClick(false)
end

function slot6.onBindIcon(slot0, slot1, slot2, slot3, slot4)
	bind.extend(slot0, slot2, {
		class = "icon_key",
		props = {
			data = slot3,
			onNode = function (slot0)
				slot1 = slot0.scale

				slot1(slot0, 0.9)

				uv1 = "scale"

				if slot1:get("img") then
					uv4 = "get"

					slot1:visible(slot4.state == 0)
				else
					slot4 = "common/icon/radio_selected.png"
					uv4 = "scale"
					slot4 = 130
					uv4 = "get"
					slot1 = ccui.ImageView:create(slot4):addTo(slot4, 1000, "img"):xy(slot4, 130):visible(slot4.state == 0)
				end
			end
		}
	})

	if slot2:getChildByName("wupinshanguang") then
		slot5:removeFromParent()
	end

	if slot4 then
		widget.addAnimationByKey(slot2, "wupinshanguang/saoguang.skel", "wupinshanguang", "effect_loop", 999):xy(slot2:size().width / 2, slot2:size().height / 2):scale(0.5)
	end
end

function slot6.jumpScroll(slot0)
	if not slot0.rewardScroll:getChildByName("reward" .. (slot0.curRewardIdx % slot0.itemCreateNum == 0 and slot1 or slot0.curRewardIdx % slot1)) then
		return
	end

	slot7 = cc.clampf(slot3:x() / (slot0.rewardScroll:getInnerContainer():size().width - slot0.rewardScroll:size().width) * 100, 0, 100)

	slot0.rewardScroll:scrollToPercentHorizontal(slot7, 0.01, false)

	slot0.percent = slot7
end

function slot6.resetScroll(slot0)
	slot0.rewardScroll:removeAllChildren()
	slot0:buildScroll()
	slot0:buildItem()
	slot0:refreshNoClick(false)
	slot0:jumpScroll()

	slot0.isReset = false
end

function slot6.refreshTarget(slot0)
	slot0.target:getChildByName("lv"):text(slot0.awardCfg[slot0.rigthRewardIndex].cfg.level .. gLanguageCsv.levelGet)

	if matchLanguage({
		"kr"
	}) then
		adapt.setTextAdaptWithSize(slot0.target:getChildByName("lv"), {
			size = cc.size(150, 100)
		})
	elseif matchLanguage({
		"en"
	}) then
		slot0.target:getChildByName("lv"):text(gLanguageCsv.levelGet .. slot1.cfg.level)
	end

	slot2 = {
		key = slot6,
		num = slot7,
		state = slot1.custom.normalAwardState
	}

	for slot6, slot7 in csvMapPairs(slot1.cfg.normalAward) do
		-- Nothing
	end

	slot3 = {}

	for slot7, slot8 in csvMapPairs(slot1.cfg.eliteAward) do
		table.insert(slot3, {
			key = slot7,
			num = slot8,
			state = slot1.custom.eliteAwardState
		})
	end

	slot0:onBindIcon(slot0.rewardScroll, slot0.targetNormalPanel, slot2, true)
	slot0:onBindIcon(slot0.rewardScroll, slot0.targetHighPanel1, slot3[1], true)

	if slot3[2] then
		slot0:onBindIcon(slot0.rewardScroll, slot0.targetHighPanel2, slot3[2], true)
		slot0.targetHighPanel2:show()
	else
		slot0.targetHighPanel2:hide()
	end
end

function slot6.refreshNoClick(slot0, slot1)
	for slot5 = 1, slot0.itemCreateNum do
		slot0.rewardScroll:getChildByName("reward" .. slot5):getChildByName("noClick"):visible(slot1)
	end

	slot0.targetNoClick:visible(slot1)
end

function slot6.getItemNum(slot0, slot1, slot2)
	slot3 = slot2.limitTimes

	for slot7, slot8 in pairs(slot0.shop) do
		if slot7 == slot1 then
			slot3 = slot2.limitTimes - slot8

			break
		end
	end

	return slot3
end

function slot6.onItemClick(slot0, slot1, slot2, slot3)
	if slot3.itemNum <= 0 then
		return
	end

	slot5, slot6 = math.modf((time.getNumTimestamp(slot0.endDate) - time.getTime()) / 86400)
	slot7 = gLanguageCsv.goTobuy
	slot8 = gLanguageCsv.passwordBuyVipNote
	slot9, slot10 = csvNext(slot3.cfg.costMap)
	slot11 = slot0.items:read()[slot9] or 0

	if slot0.buyHigh then
		gGameUI:stackUI("common.buy_info", nil, , slot3.cfg.costMap, {
			id = slot3.itemId,
			num = slot3.num
		}, {
			contentType = "num",
			maxNum = slot3.itemNum,
			discount = 1
		}, slot0:createHandler("buyItemCallBack", slot3))
	elseif slot9 == game.ITEM_TICKET.passportCoin then
		gGameUI:stackUI("common.buy_info", nil, , slot3.cfg.costMap, {
			id = slot3.itemId,
			num = slot3.num
		}, {
			contentType = "num",
			maxNum = slot3.itemNum,
			discount = slot12
		}, slot0:createHandler("buyItemCallBack", slot3))
	else
		gGameUI:showDialog({
			isRich = false,
			btnType = 2,
			title = slot7,
			cb = function ()
				uv5 = "gGameUI"

				gGameUI:stackUI("city.activity.passport.buy", nil, , slot5.activityId)
			end,
			content = slot8,
			dialogParams = {
				clickClose = false
			}
		})
	end
end

function slot6.buyItemCallBack(slot0, slot1, slot2)
	gGameApp:requestServer("/game/yy/passport/shop/buy", function (slot0)
		uv5 = "gGameUI"
		slot5 = slot5.itemId
		uv5 = "gGameUI"
		uv6 = "showGainDisplay"

		gGameUI:showGainDisplay({
			{
				slot5,
				slot5.num * slot6
			}
		}, {
			raw = false
		})
	end, slot0.activityId, slot1.csvId, slot2)
end

return slot6
