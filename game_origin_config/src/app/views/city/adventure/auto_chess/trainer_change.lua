slot1 = class("AutoChessTrainerChangeView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.adventure.auto_chess.tools")
slot1.RESOURCE_FILENAME = "auto_chess_change_trainer.json"
slot1.RESOURCE_BINDING = {
	infoPanel = "infoPanel",
	["trainerPanel.subList"] = "subList",
	["infoPanel.icon"] = "attrIcon",
	["trainerPanel.item"] = "item",
	achievementTips = "achievementTips",
	["skillPanel.skillSubList"] = "skillSubList",
	skillPanel = "skillPanel",
	["skillPanel.skillItem"] = "skillItem",
	["trainerPanel.costPanel"] = "costPanel",
	["trainerPanel.trainer"] = "trainerNode",
	bg = "bg",
	trainerPanel = "trainerPanel",
	["trainerPanel.costPanel.num"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	["trainerPanel.trainerList"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				asyncPreload = 10,
				padding = 20,
				data = bindHelper.self("trainerData"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					if not slot3.id then
						itertools.invoke(slot1:getChildren(), "hide")

						return
					end

					slot4 = slot0:getIdx(slot2)
					slot5 = slot1:multiget("bg", "trainer", "select", "lock", "isUsing", "isRecommend")
					slot6 = slot3.unlock and cc.c3b(255, 255, 255) or cc.c3b(150, 150, 150)

					slot5.bg:color(slot6)
					slot5.trainer:color(slot6)
					slot5.lock:visible(not slot3.unlock)
					slot5.trainer:texture(slot3.cfg.headIcon)
					slot5.isUsing:visible(slot3.isUsing)
					text.addEffect(slot5.isUsing:get("txt"), {
						outline = {
							size = 3,
							color = ui.COLORS.OUTLINE.DEFAULT
						}
					})
					slot5.isRecommend:visible(slot3.isRecommend)
					idlereasy.when(slot0.selectID(), function (slot0, slot1)
						uv2 = "select"
						uv4 = "visible"

						slot2.select:visible(slot4.id == slot1)
					end):anonyOnly(slot0, slot3.id)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick"),
				selectID = bindHelper.self("selectID", true)
			}
		}
	},
	["trainerPanel.btnChange"] = {
		varname = "btnChange",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeClick")
			}
		}
	},
	["trainerPanel.btnChange.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	["skillPanel.skillList"] = {
		varname = "skillList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 4,
				asyncPreload = 16,
				data = bindHelper.self("skillData"),
				item = bindHelper.self("skillSubList"),
				cell = bindHelper.self("skillItem"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot0:getIdx(slot2)
					slot5 = slot1:multiget("bg", "skillIcon", "lock")

					slot5.skillIcon:texture((csv.auto_chess.trainer_skills[slot3.skillID] or {}).skillIcon)

					slot7 = slot3.unlock and cc.c3b(255, 255, 255) or cc.c3b(200, 200, 200)

					slot5.bg:color(slot7)
					slot5.skillIcon:color(slot7)
					slot5.lock:visible(not slot3.unlock)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onSkillItemClick")
			}
		}
	},
	btnBag = {
		varname = "btnBag",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBagClick")
			}
		}
	},
	["btnBag.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	["infoPanel.name"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(90, 94, 89, 255)
				}
			}
		}
	},
	["infoPanel.lv"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(90, 94, 89, 255)
				}
			}
		}
	},
	["infoPanel.lvNum"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(90, 94, 89, 255)
				}
			}
		}
	},
	["infoPanel.exp"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(90, 94, 89, 255)
				}
			}
		}
	},
	["infoPanel.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(90, 94, 89, 255)
				}
			}
		}
	},
	["infoPanel.attrList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 10,
				data = bindHelper.self("attrData"),
				item = bindHelper.self("attrIcon"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:texture(ui.ATTR_ICON[slot3])
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTopItemClick")
			}
		}
	},
	["achievementTips.num"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(201, 140, 60, 255)
				}
			}
		}
	},
	["achievementTips.txtTips"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(224, 106, 85, 255)
				}
			}
		}
	},
	["achievementTips.txtTitle"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(224, 106, 85, 255)
				}
			}
		}
	}
}

function slot1.onCreate(slot0)
	gGameUI.topuiManager:createView("auto_chess", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "CARDADVENTURE",
		title = gLanguageCsv.autoChess
	})
	gGameModel.currday_dispatch:getIdlerOrigin("autoChessTrainerDailyClick"):set(true)
	slot0:initModel()

	slot0.selectID = idler.new()

	if gGameModel.auto_chess:read("trainer") then
		slot0.selectID:set(gGameModel.auto_chess:read("trainer"))
	end

	slot0.trainerData = idlers.new({})
	slot0.skillData = idlers.new({})
	slot0.attrData = idlers.new({})
	slot2 = getServerTag(userDefault.getForeverLocalKey("serverKey", nil, {
		rawKey = true
	}))

	function slot3(slot0)
		if slot0.unlockType == 3 then
			return false
		end

		if slot0.unlockType == 2 then
			uv1 = "unlockType"

			if slot1 == "dev" then
				return true
			end

			return false
		end

		return true
	end

	idlereasy.any({
		slot0.trainers,
		slot0.trainer,
		gGameModel.role:getIdler("gold"),
		gGameModel.role:getIdler("rmb")
	}, function (slot0, slot1, slot2, slot3, slot4)
		uv5 = "trainers"
		slot5 = slot5.trainers
		slot6 = slot5
		uv6 = "trainers"
		slot6 = slot6.trainer
		slot7 = slot6
		slot6 = slot6.read(slot7)
		uv7 = "read"
		slot8 = slot7.getBaseCfg().trainers
		slot9 = {}

		for slot13, slot14 in orderCsvPairs(csv.auto_chess.trainer) do
			slot16 = nil

			if not (slot5.read(slot6)[slot13] and true or false) then
				slot16 = slot14.unlockArg
			end

			slot17 = false

			for slot21, slot22 in pairs(slot8) do
				if slot22 == slot13 then
					slot17 = true
				end
			end

			uv18 = "trainer"

			if slot18(slot14) then
				table.insert(slot9, {
					id = slot13,
					cfg = slot14,
					unlock = slot15,
					isUsing = slot13 == slot6,
					isRecommend = slot17,
					unlockLv = slot16
				})
			end
		end

		table.sort(slot9, function (slot0, slot1)
			if slot0.unlock ~= slot1.unlock then
				return slot0.unlock == true
			end

			if slot0.isRecommend ~= slot1.isRecommend then
				return slot0.isRecommend == true
			end

			return slot0.id < slot1.id
		end)

		slot10 = {}

		for slot14 = 1, 4 do
			if slot9[slot14] then
				table.insert(slot10, slot9[slot14])
				table.insert(slot10, slot9[slot14 + 4] or {})
			end
		end

		for slot14 = 9, #slot9 do
			table.insert(slot10, slot9[slot14])
		end

		uv11 = "trainers"
		slot11 = slot11.trainerData
		slot11 = slot11.update

		slot11(slot11, slot10)

		uv11 = "trainers"

		if not slot11.selectID:read() then
			uv11 = "trainers"

			slot11.selectID:set(slot9[1].id, true)
		else
			uv11 = "trainers"

			slot11.selectID:notify()
		end

		uv11 = "read"
		uv12 = "trainers"

		slot11.showAchievementTips(slot12.achievementTips)
	end)
	idlereasy.when(slot0.selectID, function (slot0, slot1)
		uv2 = "btnBag"
		slot2 = slot2.btnBag
		slot2 = slot2.visible
		uv4 = "btnBag"

		slot2(slot2, slot4.trainers:read()[slot1] ~= nil)

		uv2 = "btnBag"

		slot2:initData()
	end)
	slot0.bg:hide()
	widget.addAnimationByKey(slot0:getResourceNode(), "lushi/zhujiemian/zizouqi_zb.skel", "spineBg", "effect_loop2", 0):alignCenter(display.sizeInView):scale(2)
	performWithDelay(slot0, function ()
		uv0 = "checkGuideStatus"

		slot0:checkGuideStatus()
	end, 0)
end

function slot1.initModel(slot0)
	slot0.trainers = gGameModel.auto_chess:getIdler("trainers")
	slot0.trainer = gGameModel.auto_chess:getIdler("trainer")
	slot0.crossID = gGameModel.auto_chess:getIdler("csv_id")
end

function slot1.onBagClick(slot0)
	gGameUI:stackUI("city.adventure.auto_chess.card_bag", nil, , slot0.selectID:read())
end

function slot1.onItemClick(slot0, slot1, slot2, slot3)
	uv4 = "getAchievementLevel"

	if not slot3.unlock then
		if slot4.getAchievementLevel() < slot3.unlockLv then
			gGameUI:showTip(string.format(gLanguageCsv.autoChessTrainerUnlockTips, slot3.unlockLv))
		else
			gGameUI:showTip(gLanguageCsv.autoChessTrainerUnlock)
		end
	end

	slot0.selectID:set(slot3.id)
end

function slot1.onSkillItemClick(slot0, slot1, slot2, slot3, slot4)
	gGameUI:stackUI("city.adventure.auto_chess.trainer_skill_detail", nil, {
		clickClose = true,
		dispatchNodes = slot1:parent()
	}, slot4.skillID, {
		dx = (slot3 - 1) * slot2:width(),
		unlockLv = slot4.unlockLv
	})
end

function slot1.getData(slot0)
	for slot4, slot5 in slot0.trainerData:ipairs() do
		if slot5:proxy().id == slot0.selectID:read() then
			return slot6
		end
	end
end

function slot1.onChangeClick(slot0)
	if slot0:getData().unlock then
		gGameApp:requestServer("/game/auto_chess/trainer/switch", function (slot0)
			gGameUI:showTip(gLanguageCsv.autoChessTrainerChange)
		end, slot0.selectID:read())
	else
		uv2 = "getData"

		if slot2.getAchievementLevel() < slot1.unlockLv then
			gGameUI:showTip(string.format(gLanguageCsv.autoChessTrainerUnlockTips, slot1.unlockLv))

			return
		end

		slot3 = true

		for slot7, slot8 in csvMapPairs(slot1.cfg.unlockCost) do
			if dataEasy.getNumByKey(slot7) < slot8 then
				slot3 = false

				break
			end
		end

		slot4, slot5 = csvNext(slot1.cfg.unlockCost)

		if not slot3 then
			gGameUI:showTip(gLanguageCsv.autoChessUnlockNotEnough)

			return
		end

		if not slot4 then
			gGameApp:requestServer("/game/auto_chess/trainer/unlock", function (slot0)
				gGameUI:showTip(gLanguageCsv.autoChessTrainerUnlockSuccess)
			end, slot0.selectID:read())

			return
		else
			slot6 = {}

			for slot10, slot11 in csvMapPairs(slot1.cfg.unlockCost) do
				table.insert(slot6, string.format("#I%s-56-56#", dataEasy.getIconResByKey(slot10)) .. slot11)
			end

			gGameUI:showDialog({
				isRich = true,
				btnType = 2,
				clearFast = true,
				cb = function ()
					uv4 = "gGameApp"

					gGameApp:requestServer("/game/auto_chess/trainer/unlock", function (slot0)
						gGameUI:showTip(gLanguageCsv.autoChessTrainerUnlockSuccess)
					end, slot4.selectID:read())
				end,
				title = gLanguageCsv.spaceTips,
				content = string.format(gLanguageCsv.autoChessTrainerUnlockCostTip, table.concat(slot6, gLanguageCsv.signetAnd)),
				dialogParams = {
					clickClose = false
				}
			})
		end
	end
end

function slot1.initData(slot0)
	if not slot0.selectID:read() then
		return
	end

	slot2 = {}
	slot3 = slot0:getData()
	slot5 = 0

	if slot0.trainers:read()[slot1] then
		slot5 = slot4[slot1].level
	end

	for slot9, slot10 in orderCsvPairs(slot3.cfg.skills) do
		if csv.auto_chess.trainer_skills[slot9] then
			table.insert(slot2, {
				skillID = slot9,
				unlock = slot10 <= slot5,
				unlockLv = slot5 < slot10 and slot10 or nil
			})
		else
			printError("csv.auto_chess.trainer_skills[%s] not exist!", slot9)
		end
	end

	table.sort(slot2, function (slot0, slot1)
		if slot0.unlock ~= slot1.unlock then
			return slot0.unlock == true
		end

		return slot0.skillID < slot1.skillID
	end)
	slot0.skillData:update(slot2)

	slot6 = {}

	for slot10, slot11 in orderCsvPairs(slot3.cfg.style) do
		table.insert(slot6, slot10)
	end

	slot0.attrData:update(slot6)
	slot0:updatePanel()
end

function slot1.updatePanel(slot0)
	slot5 = slot0:getData().id
	slot4 = csv.auto_chess.trainer[slot5]
	uv5 = "selectID"

	slot5.createNpcSpine(slot0.trainerNode, slot0.selectID:read(), nil, true)

	slot5 = slot0.infoPanel:multiget("name", "lv", "lvNum", "exp", "txt", "attrList")
	slot6 = 0
	slot7 = 0
	slot8 = csv.auto_chess.trainer_level[1].exp

	if slot0.trainers:read()[slot0.selectID:read()] then
		slot7 = slot3[slot1].exp
		slot8 = csv.auto_chess.trainer_level[slot3[slot1].level].exp
	end

	slot5.name:text(slot4.name)
	slot5.lvNum:text(slot6)
	slot5.exp:text(string.format("%s/%s", slot7, slot8))

	if csvSize(csv.auto_chess.trainer_level) <= slot6 then
		slot5.exp:text(gLanguageCsv.levelMax)
	end

	adapt.oneLinePos(slot5.name, {
		slot5.lv,
		slot5.lvNum,
		slot5.exp
	}, {
		cc.p(10, 0),
		cc.p(10, 0),
		cc.p(30, 0)
	})

	slot10 = slot0.costPanel:multiget("costIcon", "num")

	slot10.costIcon:hide()
	slot10.num:hide()
	slot0.costPanel:hide()

	if not slot2.unlock then
		slot11 = {}

		for slot15, slot16 in csvMapPairs(slot2.cfg.unlockCost) do
			table.insert(slot11, string.format("#I%s-56-56#", dataEasy.getIconResByKey(slot15)) .. (dataEasy.getNumByKey(slot15) < slot16 and "#C0xF13B54#" or "#C0xFFFCED#") .. "#L00100000##LOC0x5B545B##LOS4#" .. "#Pfont/youmi1.ttf#" .. slot16)
		end

		if #slot11 > 0 then
			slot0.costPanel:show()
		end

		slot0.costPanel:removeChildByName("costRich")

		slot13 = rich.createByStr(table.concat(slot11, "  "), 40):anchorPoint(0.5, 0):xy(slot0.costPanel:width() / 2, 10):addTo(slot0.costPanel, 3, "costRich"):formatText()
	end

	uiEasy.setBtnShader(slot0.btnChange, slot0.btnChange:get("txt"), 2)

	if slot1 == slot0.trainer:read() then
		slot0.btnChange:get("txt"):text(gLanguageCsv.autoChessUsing)
	elseif not slot2.unlock then
		slot11 = slot0.btnChange:get("txt")
		slot11 = slot11.text

		slot11(slot11, gLanguageCsv.autoChessUnlock)

		uv11 = "selectID"

		uiEasy.setBtnShader(slot0.btnChange, slot0.btnChange:get("txt"), slot11.getAchievementLevel() < slot2.cfg.unlockArg and 3 or 1)
	else
		slot0.btnChange:get("txt"):text(gLanguageCsv.autoChessSwitch)
		uiEasy.setBtnShader(slot0.btnChange, slot0.btnChange:get("txt"), 1)
	end
end

function slot1.checkGuideStatus(slot0)
	slot4 = "newbie_guide"

	for slot4, slot5 in pairs(gGameModel.auto_chess:read(slot4)) do
		if slot5 == 2 then
			return
		end
	end

	gGameUI.guideManagerLocal:checkGuide({
		specialName = "autoChessTrainerChange",
		endCb = function ()
			gGameApp:requestServer("/game/auto_chess/guide/newbie", nil, 2)
		end
	})
end

function slot1.onClose(slot0)
	uv1 = "onClose"

	slot1.onClose(slot0)
end

return slot1
