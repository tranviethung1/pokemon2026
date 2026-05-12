slot0 = 50
slot2 = class("PersonalInfoView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "personal_info.json"
slot2.RESOURCE_BINDING = {
	["rightPanel.titleTxt"] = "titleTxt",
	["rightPanel.name"] = "rightPanelRoleName",
	["rightPanel.needExp"] = "needExp",
	["rightPanel.exp"] = "expNum",
	["rightPanel.name10"] = "txt",
	["rightPanel.union"] = "textUnionName",
	["leftPanel.medalBtn.img"] = "medalIcon",
	["rightPanel.input"] = "input",
	["rightPanel.btnShare"] = "btnShare",
	rightPanel = "headImg",
	["leftPanel.cardImg"] = {
		binds = {
			event = "extend",
			class = "role_figure",
			props = {
				spine = true,
				data = bindHelper.model("role", "figure"),
				onNode = function (slot0)
					slot0:z(7):y(580)
				end,
				onSpine = function (slot0)
					slot0:scale(2):y(150)
				end
			}
		}
	},
	["leftPanel.medalBtn"] = {
		varname = "medalBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("goMedal")
			}
		}
	},
	["rightPanel.title"] = {
		varname = "title",
		binds = {
			event = "extend",
			class = "role_title",
			props = {
				data = bindHelper.model("role", "title_id")
			}
		}
	},
	["rightPanel.btnLogo"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeIconClick")
			}
		}
	},
	["rightPanel.btnName"] = {
		varname = "rightPanelBtnName",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeNameClick")
			}
		}
	},
	["rightPanel.btnTitle"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeTitleClick")
			}
		}
	},
	["leftPanel.btnChange"] = {
		varname = "btnChange",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeFigureClick")
			}
		}
	},
	["leftPanel.btnChange.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightPanel.uid"] = {
		binds = {
			event = "text",
			idler = bindHelper.model("role", "uid")
		}
	},
	["rightPanel.level"] = {
		binds = {
			event = "text",
			idler = bindHelper.model("role", "level")
		}
	},
	["rightPanel.power"] = {
		binds = {
			event = "text",
			idler = bindHelper.model("role", "top6_fighting_point")
		}
	},
	["rightPanel.bar"] = {
		varname = "bar",
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				maskImg = "common/icon/mask_bar_red.png",
				data = bindHelper.self("expSlider")
			}
		}
	},
	["rightPanel.list"] = {
		varname = "battleArrayList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 15,
				data = bindHelper.self("battleData"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							unitId = slot3.unitId,
							advance = slot3.advance,
							dbid = slot3.dbid,
							rarity = slot3.rarity,
							star = slot3.star,
							levelProps = {
								data = slot3.level
							},
							onNode = function (slot0)
								slot0:xy(10, 0)
							end
						}
					})
				end
			}
		}
	},
	["rightPanel.unlock"] = {
		binds = {
			event = "text",
			idler = bindHelper.model("role", "pokedex"),
			method = function (slot0)
				return itertools.size(slot0)
			end
		}
	},
	["rightPanel.collect"] = {
		binds = {
			event = "text",
			idler = bindHelper.model("role", "pokedex"),
			method = function (slot0)
				return string.format("%.1f%%", itertools.size(slot0) * 100 / table.length(gHandbookArrayCsv) >= 100 and 100 or slot1)
			end
		}
	},
	["rightPanel.btnExp"] = {
		varname = "btnExp",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("overflowExpExchangeListen")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0.cb = slot1

	slot0:initModel()
	slot0.input:text(slot0.personalSign:read())
	slot0.input:setPlaceHolderColor(ui.COLORS.DISABLED.GRAY)
	slot0.input:setTextColor(ui.COLORS.NORMAL.DEFAULT)
	slot0.txt:getVirtualRenderer():setLineSpacing(-5)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "INFORMATION",
		title = gLanguageCsv.personalInfo
	})

	slot0.expSlider = idler.new(0)
	slot2 = table.length(gRoleLevelCsv)

	idlereasy.any({
		slot0.level,
		slot0.levelExp
	}, function (slot0, slot1, slot2)
		if dataEasy.isUnlock(gUnlockCsv.medalCollection) then
			uv3 = "dataEasy"

			slot3.medalBtn:show()
		end

		slot3 = 100
		uv4 = "isUnlock"

		if slot1 < slot4 then
			slot4 = cc.clampf(100 * slot2 / gRoleLevelCsv[slot1].levelExp, 0, 100)
			slot3 = slot4
			uv4 = "dataEasy"
			slot4 = slot4.expNum
			slot4 = slot4.text

			slot4(slot4, slot2)

			uv4 = "dataEasy"

			slot4.needExp:text("/" .. gRoleLevelCsv[slot1].levelExp)
		else
			slot3 = 0
			uv4 = "dataEasy"
			slot4 = slot4.expNum
			slot4 = slot4.text

			slot4(slot4, 0)

			uv4 = "dataEasy"

			slot4.needExp:text("/0")
		end

		slot4 = adapt.oneLinePos
		uv5 = "dataEasy"
		uv6 = "dataEasy"

		slot4(slot5.expNum, slot6.needExp, cc.p(0, 0), "left")

		uv4 = "dataEasy"

		slot4.expSlider:set(slot3)
	end)
	bind.extend(slot0, slot0.headImg, {
		class = "role_logo",
		props = {
			level = false,
			logoId = gGameModel.role:getIdler("logo"),
			frameId = gGameModel.role:getIdler("frame"),
			vip = not slot0.vipDisplay and gGameModel.role:read("vip_level") or 0,
			onNode = function (slot0)
				slot0:xy(157, 1030)
			end
		}
	})
	idlereasy.when(slot0.overflow_exp, function (slot0, slot1)
		uv2 = "btnExp"

		slot2.btnExp:visible(false)

		if dataEasy.isUnlock(gUnlockCsv.overflowExpExchange) then
			uv2 = "visible"
			uv3 = "btnExp"

			if slot2 == slot3.level:read() or slot1 > 0 then
				uv2 = "btnExp"

				slot2.btnExp:visible(true)
			end
		end
	end)

	slot0.item = ccui.Layout:create():size(200, 200)

	slot0.item:show()
	slot0.item:retain()
	slot0.battleArrayList:setScrollBarEnabled(false)
	idlereasy.any({
		slot0.battleCards,
		slot0.cards
	}, function (slot0, slot1, slot2)
		slot3 = {}

		for slot7, slot8 in pairs(slot1) do
			slot10 = gGameModel.cards:find(slot8):read("card_id", "skin_id", "fighting_point", "level", "star", "advance", "created_time")

			table.insert(slot3, {
				cardId = slot10.card_id,
				dbid = slot8,
				unitId = dataEasy.getUnitId(slot10.card_id, slot10.skin_id),
				advance = slot10.advance,
				star = slot10.star,
				level = slot10.level,
				rarity = csv.unit[csv.cards[slot10.card_id].unitID].rarity
			})
		end

		if #slot3 < 6 then
			for slot8 = #slot3 + 1, 6 do
				table.insert(slot3, {
					unitId = -1
				})
			end
		end

		uv4 = "pairs"
		slot4.battleData = idlertable.new(slot3)
	end)
	blacklist:addListener(slot0.input, "*", function (slot0)
		uv1 = "input"
		slot1 = slot1.input
		slot1 = slot1.text
		uv5 = "text"

		slot1(slot1, string.utf8limit(slot0, slot5, true))

		uv1 = "input"
		slot1 = slot1.input
		slot2 = slot1
		uv2 = "input"

		if slot1.text(slot2) ~= slot2.personalSign:read() and uiEasy.checkText(slot1) then
			gGameApp:requestServer("/game/role/personal/sign", function ()
				sdk.trackEvent("set_motto")
			end, slot1)
		end
	end)
	uiEasy.updateUnlockRes(gUnlockCsv.roleFigure, slot0.btnChange, {
		pos = cc.p(260, 90)
	})
	slot0:enableMessage():registerMessage("adapterNotchScreen", function (slot0)
		uv2 = "adaptUI"

		adaptUI(slot2:getResourceNode(), "personal_info.json", slot0)
	end)
	idlereasy.when(slot0.titleId, function (slot0, slot1)
		uv2 = "titleTxt"

		slot2.titleTxt:visible(slot1 == -1)
	end)
	idlereasy.any({
		slot0.unionId,
		slot0.unionName
	}, function (slot0, slot1, slot2)
		slot3 = gLanguageCsv.none

		if slot1 then
			slot3 = slot2
		end

		uv4 = "gLanguageCsv"

		slot4.textUnionName:text(slot3)
	end)

	slot4 = slot0.headImg:get("name10")

	adapt.setAutoText(slot4, slot4:text())
	idlereasy.when(slot0.medalShow, function (slot0, slot1)
		if slot1 and slot1 > 0 then
			uv2 = "medalIcon"

			slot2.medalIcon:texture(gMedalCollectionCsv[slot1][1].res):scale(1.3)
		end
	end)
end

function slot2.overflowExpExchangeListen(slot0)
	gGameUI:stackUI("city.personal.overflow_exp", nil, {
		clickClose = true
	})
end

function slot2.initModel(slot0)
	slot0.level = gGameModel.role:getIdler("level")
	slot0.levelExp = gGameModel.role:getIdler("level_exp")
	slot0.cards = gGameModel.role:getIdler("cards")
	slot0.battleCards = gGameModel.role:getIdler("battle_cards")
	slot0.personalSign = gGameModel.role:getIdler("personal_sign")
	slot0.logo = gGameModel.role:getIdler("logo")
	slot0.frame = gGameModel.role:getIdler("frame")
	slot0.figure = gGameModel.role:getIdler("figure")
	slot0.roleName = gGameModel.role:getIdler("name")
	slot0.renameCount = gGameModel.role:getIdler("rename_count")
	slot0.titleId = gGameModel.role:getIdler("title_id")
	slot0.unionId = gGameModel.role:getIdler("union_db_id")
	slot0.unionName = gGameModel.union:getIdler("name")
	slot0.overflow_exp = gGameModel.role:getIdler("overflow_exp")
	slot0.medalShow = gGameModel.role:getIdler("medal_show")
	slot0.vipDisplay = gGameModel.role:read("vip_hide")

	idlereasy.when(slot0.roleName, function (slot0, slot1)
		uv2 = "rightPanelRoleName"
		slot2 = slot2.rightPanelRoleName
		slot3 = slot2

		slot2.text(slot3, slot1)

		uv3 = "rightPanelRoleName"
		slot3 = slot3.rightPanelRoleName
		slot4 = slot3
		uv4 = "rightPanelRoleName"
		slot3 = slot3.x(slot4) + slot4.rightPanelRoleName:width() + 40
		uv3 = "rightPanelRoleName"

		slot3.rightPanelBtnName:x(cc.clampf(slot3, 820, 990))
	end)
end

function slot2.onChangeIconClick(slot0)
	gGameUI:stackUI("city.personal.role_logo", nil, {
		clickClose = true
	})
end

function slot2.onCleanup(slot0)
	if slot0.item then
		slot0.item:release()

		slot0.item = nil
	end

	uv1 = "item"

	slot1.onCleanup(slot0)
end

function slot2.onChangeFigureClick(slot0)
	if not dataEasy.isUnlock(gUnlockCsv.roleFigure) then
		gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.roleFigure))

		return
	end

	gGameUI:stackUI("city.personal.figure", nil, {
		clickClose = true
	}, slot0:createHandler("setInfo"))
end

function slot2.setInfo(slot0)
	if slot0.cb then
		slot0.cb()
	end
end

function slot2.onChangeNameClick(slot0)
	gGameUI:stackUI("city.card.changename", nil, , {
		typ = "role",
		name = slot0.roleName:read(),
		cost = gCostCsv.rename_cost[math.min(slot0.renameCount:read() + 1, table.length(gCostCsv.rename_cost))],
		titleTxt = gLanguageCsv.roleRename
	})
end

function slot2.onChangeTitleClick(slot0)
	if not dataEasy.isUnlock(gUnlockCsv.title) then
		gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.title))
	else
		gGameUI:stackUI("city.develop.title_book.view")
	end
end

function slot2.goMedal(slot0)
	gGameUI:stackUI("city.medal_collection.view")
end

return slot2
