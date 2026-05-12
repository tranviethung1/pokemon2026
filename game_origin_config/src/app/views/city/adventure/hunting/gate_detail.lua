slot0 = {
	elite = 2,
	normal = 1
}
slot1 = {
	"city/adventure/hunting/icon_pt.png",
	"city/adventure/hunting/icon_jy.png",
	"city/adventure/exp/icon_zj.png"
}
slot2 = {
	event = "effect",
	data = {
		outline = {
			size = 4,
			color = cc.c4b(91, 84, 91, 255)
		}
	}
}
slot3 = class("HuntingGateDetailView", Dialog)
slot3.RESOURCE_FILENAME = "hunting_gate_detail.json"
slot3.RESOURCE_BINDING = {
	["enemyPanel.item"] = "item",
	awardPanel = "awardPanel",
	["skipBtn.skipNote"] = "skipNote",
	["titleBg.title1"] = "title1",
	["awardPanel.awardList"] = "awardList",
	enemyPanel = "enemyPanel",
	["titleBg.title2"] = "title2",
	infoPanel = "infoPanel",
	["titleBg.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["battleBtn.title"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = cc.c4b(255, 255, 255, 255)
				}
			}
		}
	},
	battleBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBattleClick")
			}
		}
	},
	["passBtn.title"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = cc.c4b(255, 255, 255, 255)
				}
			}
		}
	},
	passBtn = {
		varname = "passBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPassClick")
			}
		}
	},
	["infoPanel.lvText"] = {
		binds = slot2
	},
	["infoPanel.level"] = {
		binds = slot2
	},
	["enemyPanel.enemyList"] = {
		varname = "enemyList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				padding = 10,
				data = bindHelper.self("enemyDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							showAttribute = false,
							unitId = slot3.unitId,
							advance = slot3.advance,
							levelProps = {
								data = slot3.level
							},
							star = slot3.star,
							rarity = slot3.rarity,
							onNode = function (slot0)
							end
						}
					})
				end
			}
		}
	},
	skipBtn = {
		varname = "selectSkip",
		binds = {
			event = "click",
			method = bindHelper.self("onSkipClick")
		}
	}
}

function slot3.onCreate(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.data = slot1.defence_role_info or {}
	slot0.route = slot3
	slot0.enemyId = slot2
	slot0.node = slot4
	slot0.enemyDatas = {}
	slot0.cb = slot5

	slot0:initInfoPanel()
	slot0:initEnemyPanel()
	slot0:initAwardPanel()
	slot0:initSkipBtn()
	slot0:initPassBtn()
	adapt.oneLinePos(slot0.title1, slot0.title2, cc.p(4, 0))
	Dialog.onCreate(slot0)
end

function slot3.initInfoPanel(slot0)
	bind.extend(slot0, slot0.infoPanel:get("icon"), {
		event = "extend",
		class = "role_logo",
		props = {
			vip = false,
			level = false,
			logoId = slot0.data.logo,
			frameId = slot0.data.frame
		}
	})
	slot0.infoPanel:get("name"):text(slot0.data.name)
	slot0.infoPanel:get("area"):text(getServerArea(slot0.data.game_key))

	slot4 = "type"
	uv4 = "csv"

	slot0.infoPanel:get(slot4):texture(slot4[csv.cross.hunting.gate[slot0.enemyId].type])
	slot0.infoPanel:get("level"):text(slot0.data.level)
	adapt.oneLinePos(slot0.infoPanel:get("nameText"), slot0.infoPanel:get("name"), cc.p(2, 0))
	adapt.oneLinePos(slot0.infoPanel:get("areaText"), slot0.infoPanel:get("area"), cc.p(2, 0))
	adapt.oneLineCenterPos(cc.p(slot0.infoPanel:get("icon"):size().width / 2, slot0.infoPanel:get("level"):y()), {
		slot0.infoPanel:get("lvText"),
		slot0.infoPanel:get("level")
	}, cc.p(0, 0), "left")
end

function slot3.initEnemyPanel(slot0)
	for slot5, slot6 in pairs(slot0.data.defence_card_attrs) do
		slot7 = csv.cards[slot6.card_id].unitID

		table.insert(slot0.enemyDatas, {
			unitId = slot7,
			level = slot6.level,
			advance = slot6.advance,
			rarity = csv.unit[slot7].rarity,
			star = slot6.star
		})

		slot1 = 0 + slot6.fighting_point
	end

	table.sort(slot0.enemyDatas, function (slot0, slot1)
		return slot1.advance < slot0.advance
	end)
	slot0.infoPanel:get("fightPoint"):text(slot1)
	adapt.oneLinePos(slot0.infoPanel:get("fightPointText"), slot0.infoPanel:get("fightPoint"), cc.p(2, 0))
end

function slot3.initAwardPanel(slot0)
	uiEasy.createItemsToList(slot0, slot0.awardList, csv.cross.hunting.gate[slot0.enemyId].dropsView, {
		onNode = function (slot0, slot1)
			if slot1.key ~= "gold" then
				ccui.ImageView:create("city/adventure/endless_tower/icon_gl.png"):anchorPoint(1, 0.5):xy(slot0:width() - 5, slot0:height() - 25):addTo(slot0, 15)
			end
		end
	})
	slot0.awardList:setTouchEnabled(true)
end

function slot3.initSkipBtn(slot0)
	slot0.selectSkip:get("skipBtn"):setSelectedState(userDefault.getForeverLocalKey("huntingSkipBattle", false))
end

function slot3.initPassBtn(slot0)
	slot1 = slot0.route == 1 and "huntingPass" or "specialHuntingPass"
	slot3 = gGameModel.hunting:read("hunting_route")[slot0.route].history_max_node
	slot4 = 0
	slot5 = 0

	if csv.cross.hunting.route[gGameModel.hunting:read("hunting_route")[slot0.route].last_max_node] then
		slot4 = csv.cross.hunting.route[slot2].lastCanPass
	end

	if csv.cross.hunting.route[slot3] then
		slot5 = csv.cross.hunting.route[slot3].historyCanPass
	end

	slot6 = math.max(slot4, slot5)

	dataEasy.getListenUnlock(slot1, function (slot0)
		uv1 = "passBtn"
		slot1 = slot1.passBtn
		slot2 = slot1
		slot1 = slot1.visible

		if slot0 then
			uv3 = "passBtn"
			uv4 = "visible"
			slot3 = slot3.node % 100 <= slot4
		end

		slot1(slot2, slot3)
	end)
end

function slot3.onBattleClick(slot0)
	if userDefault.getForeverLocalKey("huntingSkipBattle", false) then
		if not itertools.isempty(gGameModel.hunting:read("hunting_route")[slot0.route].cards or {}) and slot0:checkEmbattle() then
			slot0:skipEmbattleToFight()
		else
			slot0:goEmbattle()
		end
	else
		if not slot0:checkEmbattle() then
			gGameUI:showTip(gLanguageCsv.randomTowerCheckEmbattleLevel)
		end

		slot0:goEmbattle()
	end
end

function slot3.onPassClick(slot0)
	slot1 = slot0.cb

	gGameApp:requestServer("/game/hunting/battle/pass", function (slot0)
		uv1 = "addCallbackOnExit"
		slot2 = slot1

		slot1.addCallbackOnExit(slot2, function ()
			uv2 = "gGameUI"
			uv4 = "showGainDisplay"

			gGameUI:showGainDisplay(slot2.view.drop, {
				cb = slot4
			})
		end)

		uv2 = "addCallbackOnExit"

		Dialog.onClose(slot2)
	end, slot0.route, slot0.node, slot0.enemyId)
end

function slot3.skipEmbattleToFight(slot0)
	slot2 = gGameModel.hunting:read("hunting_route")[slot0.route].card_states or {}
	slot3 = gGameModel.hunting:read("hunting_route")[slot0.route].extra or {}
	slot4 = {}
	slot5 = {}

	if itertools.isempty(gGameModel.hunting:read("hunting_route")[slot0.route].cards or {}) then
		gGameUI:showTip(gLanguageCsv.noSpriteAvailable)

		return
	end

	if itertools.size(slot2) == 0 then
		slot4 = table.shallowcopy(gGameModel.role:read("battle_cards"))
	else
		slot7 = {}

		for slot12, slot13 in pairs(slot1) do
			if itertools.map(gGameModel.role:read("cards"), function (slot0, slot1)
				return slot1, slot0
			end)[slot13] then
				if slot2[slot13] and slot2[slot13][1] and slot2[slot13][1] ~= 0 then
					slot5[slot12] = slot13
				end

				slot7[slot12] = slot13
			end
		end

		slot4 = slot7
	end

	battleEntrance.battleRequest("/game/hunting/battle/start", slot0.route, slot0.node, slot0.enemyId, slot4, {
		arms = table.deepcopy(slot3.arms),
		weather = dataEasy.getWeatherID(slot5, slot3.weahter)
	}):onStartOK(function (slot0)
		gGameUI:goBackInStackUI("city.adventure.hunting.route")
	end):show()
end

function slot3.goEmbattle(slot0)
	if userDefault.getForeverLocalKey("huntingSkipBattle", false) then
		slot0:skipEmbattleToFight()
	else
		gGameUI:stackUI("city.card.embattle.hunting", nil, {
			full = true
		}, {
			fightCb = function (slot0, slot1, slot2)
				uv5 = "battleEntrance"
				uv6 = "battleEntrance"
				uv7 = "battleEntrance"

				battleEntrance.battleRequest("/game/hunting/battle/start", slot5.route, slot6.node, slot7.enemyId, slot1, slot2):onStartOK(function (slot0)
					gGameUI:goBackInStackUI("city.adventure.hunting.route")
				end):show()
			end,
			route = slot0.route,
			from = game.EMBATTLE_FROM_TABLE.hunting
		})
	end
end

function slot3.checkEmbattle(slot0)
	for slot5, slot6 in pairs(gGameModel.hunting:read("hunting_route")[slot0.route].cards or gGameModel.role:read("battle_cards")) do
		if gGameModel.cards:find(slot6) and slot7:read("level") < 10 then
			return false
		end
	end

	return true
end

function slot3.onSkipClick(slot0)
	slot1 = userDefault.getForeverLocalKey("huntingSkipBattle", false)

	slot0.selectSkip:get("skipBtn"):setSelectedState(not slot1)
	userDefault.setForeverLocalKey("huntingSkipBattle", not slot1)
end

return slot3
