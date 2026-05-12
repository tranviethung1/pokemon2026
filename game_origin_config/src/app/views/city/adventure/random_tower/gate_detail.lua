slot0 = require("app.views.city.adventure.random_tower.tools")
slot1 = cc.load("mvc").ViewBase
slot2 = class("RandomTowerGateDetail", Dialog)
slot2.RESOURCE_FILENAME = "random_tower_gate_detail.json"
slot2.RESOURCE_BINDING = {
	item = "item",
	enemyFightLabel = "enemyFightLabel",
	title1 = "title1",
	myFightLabel = "myFightLabel",
	myFightPoint = "myFightPoint",
	enemyFightPoint = "enemyFightPoint",
	enemyFightIcon = "enemyFightIcon",
	title2 = "title2",
	passInfo = "passInfo",
	pointLabel = "pointLabel",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	enemyList = {
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
							showAttribute = true,
							unitId = slot3.unitId,
							advance = slot3.advance,
							levelProps = {
								data = slot3.level
							},
							isBoss = slot3.isBoss,
							rarity = slot3.rarity,
							onNode = function (slot0)
								slot1, slot2 = slot0:xy()
								uv3 = "xy"
								uv5 = "scale"

								slot3:scale(slot5.isBoss and 1.1 or 0.99)
							end
						}
					})
				end
			}
		}
	},
	skipBtn = {
		varname = "skipBtn",
		binds = {
			event = "click",
			method = bindHelper.self("onSkipClick")
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
	battleBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBattleClick")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2, slot3)
	slot0.fightCb = slot2
	slot0.passCb = slot3
	slot5 = csv.random_tower.board[slot1]
	slot6 = string.utf8limit(slot5.name, 2, true)

	slot0.title1:text(slot6)
	slot0.title2:text(string.sub(slot5.name, #slot6 + 1))
	adapt.oneLinePos(slot0.title1, slot0.title2)

	slot0.enemyDatas = {}

	for slot14, slot15 in ipairs(slot8.monsters) do
		if slot15.unit_id then
			table.insert(slot0.enemyDatas, {
				unitId = slot15.unit_id,
				level = slot15.level,
				advance = slot15.advance,
				star = slot15.star,
				rarity = csv.unit[slot15.unit_id].rarity,
				isBoss = arraytools.hash(csv.random_tower.monsters[(gGameModel.random_tower:read("room_info").enemy[slot1] or {}).id].boss)[slot15.unit_id] or false
			})
		end
	end

	table.sort(slot0.enemyDatas, function (slot0, slot1)
		if slot0.isBoss ~= slot1.isBoss then
			return slot0.isBoss
		end

		return slot1.advance < slot0.advance
	end)
	slot0.enemyFightPoint:text(tostring(slot8.fighting_point))
	adapt.oneLinePos(slot0.enemyFightLabel, slot0.enemyFightPoint, cc.p(15, 0))

	slot11 = adapt.oneLinePos

	slot11(slot0.myFightLabel, slot0.myFightPoint, cc.p(15, 0))

	uv11 = "fightCb"
	slot11 = slot11.calcFightingPointFunc()

	idlereasy.when(gGameModel.role:getIdler("huodong_cards"), function (slot0, slot1)
		for slot7, slot8 in pairs(slot1[game.EMBATTLE_HOUDONG_ID.randomTower] or gGameModel.role:read("battle_cards")) do
			uv9 = "game"
			slot3 = 0 + slot9(slot8)
		end

		uv4 = "EMBATTLE_HOUDONG_ID"

		slot4.myFightPoint:text(slot3)
	end)
	slot0.pointLabel:text(""):removeAllChildren()

	slot15 = string.format(gLanguageCsv.randomTowerGateDetailPoint, csv.random_tower.point[gGameModel.role:read("level")].initPoint * slot5.pointC * csv.random_tower.tower[slot5.room].pointC[slot5.monsterType])
	slot17 = ""

	if gVipCsv[gGameModel.role:read("vip_level")].randomTowerPointRate > 1 then
		slot17 = string.format(gLanguageCsv.randomTowerVipPointAddTip, (gVipCsv[slot16].randomTowerPointRate - 1) * 100)
	end

	rich.createByStr(slot15 .. slot17, 50):anchorPoint(0, 0.5):addTo(slot0.pointLabel, 6)

	if not slot0:isCanPass() then
		slot0.passBtn:hide()
	end

	slot0.skipBtn:get("skipBtn"):setSelectedState(userDefault.getForeverLocalKey("randomTowerSkipBattle", false))
	Dialog.onCreate(slot0)
end

function slot2.isCanPass(slot0)
	uv1 = "getCanPassMaxRoom"

	return gGameModel.random_tower:read("room") <= slot1.getCanPassMaxRoom()
end

function slot2.onSkipClick(slot0)
	slot1 = userDefault.getForeverLocalKey("randomTowerSkipBattle", false)

	slot0.skipBtn:get("skipBtn"):setSelectedState(not slot1)
	userDefault.setForeverLocalKey("randomTowerSkipBattle", not slot1)
end

function slot2.onPassClick(slot0)
	slot0:passCb()
end

function slot2.showTip(slot0, slot1)
	if userDefault.getForeverLocalKey("randomTowerSkipBattle", false) and itertools.isempty(gGameModel.role:read("huodong_cards")[game.EMBATTLE_HOUDONG_ID.randomTower]) then
		gGameUI:showTip(gLanguageCsv.noSpriteAvailable)
	end
end

function slot2.onBattleClick(slot0)
	if itertools.isempty(gGameModel.role:read("huodong_cards")[game.EMBATTLE_HOUDONG_ID.randomTower]) then
		slot0:goEmbattle()

		return
	end

	if slot0:chechEmbattle() then
		return
	end

	if userDefault.getForeverLocalKey("randomTowerSkipBattle", false) then
		slot0:fightCb()

		return
	end

	slot0:goEmbattle()
end

function slot2.goEmbattle(slot0)
	gGameUI:stackUI("city.card.embattle.random", nil, {
		full = true
	}, {
		from = "huodong",
		fightCb = function (...)
			uv0 = "fightCb"

			slot0.fightCb(...)
		end,
		fromId = game.EMBATTLE_HOUDONG_ID.randomTower,
		startCb = slot0:createHandler("showTip")
	})
end

function slot2.chechEmbattle(slot0)
	for slot5, slot6 in pairs(gGameModel.role:read("huodong_cards")[game.EMBATTLE_HOUDONG_ID.randomTower] or gGameModel.role:read("battle_cards")) do
		if gGameModel.cards:find(slot6) and slot7:read("level") < 10 then
			slot0:goEmbattle()
			gGameUI:showTip(gLanguageCsv.randomTowerCheckEmbattleLevel)

			return true
		end
	end
end

return slot2
