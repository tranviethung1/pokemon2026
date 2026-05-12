slot0 = require("app.views.city.adventure.random_tower.tools")
slot1 = cc.load("mvc").ViewBase
slot2 = class("HellRandomTowerGateDetail", Dialog)
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
	myFightIcon = "myFightIcon",
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
	slot5 = csv.hell_random_tower.board[slot1]
	slot6 = string.utf8limit(slot5.name, 2, true)

	slot0.title1:text(slot6)
	slot0.title2:text(string.sub(slot5.name, #slot6 + 1))
	adapt.oneLinePos(slot0.title1, slot0.title2)

	slot0.enemyDatas = {}

	for slot14, slot15 in ipairs(slot9.monsters) do
		if csv.hell_random_tower.cards[slot15] then
			slot18 = csv.cards[slot16.cardID].unitID

			table.insert(slot0.enemyDatas, {
				unitId = slot18,
				level = slot8.level,
				advance = slot8.advance,
				star = slot8.star,
				rarity = csv.unit[slot18].rarity,
				isBoss = arraytools.hash(csv.hell_random_tower.monsters[(gGameModel.hell_random_tower:read("room_info").enemy[slot1] or {}).id].boss)[slot15] or false
			})
		end
	end

	table.sort(slot0.enemyDatas, function (slot0, slot1)
		if slot0.isBoss ~= slot1.isBoss then
			return slot0.isBoss
		end

		return slot1.advance < slot0.advance
	end)
	itertools.invoke({
		slot0.enemyFightIcon,
		slot0.enemyFightLabel,
		slot0.enemyFightPoint,
		slot0.myFightIcon,
		slot0.myFightLabel,
		slot0.myFightPoint
	}, "hide")
	slot0.pointLabel:text(""):removeAllChildren()

	slot14 = string.format(gLanguageCsv.randomTowerGateDetailPoint, csv.hell_random_tower.point[gGameModel.role:read("level")].initPoint * slot5.pointC * csv.hell_random_tower.tower[slot5.room].pointC[slot5.monsterType])
	slot16 = ""

	if gVipCsv[gGameModel.role:read("vip_level")].randomTowerPointRate > 1 then
		slot16 = string.format(gLanguageCsv.randomTowerVipPointAddTip, (gVipCsv[slot15].randomTowerPointRate - 1) * 100)
	end

	rich.createByStr(slot14 .. slot16, 50):anchorPoint(0, 0.5):addTo(slot0.pointLabel, 6)

	if not slot0:isCanPass() then
		slot0.passBtn:hide()
	end

	slot0.skipBtn:get("skipBtn"):setSelectedState(userDefault.getForeverLocalKey("hellRandomTowerSkipBattle", false))
	Dialog.onCreate(slot0)
end

function slot2.isCanPass(slot0)
	uv1 = "getCanPassMaxRoomHell"

	return gGameModel.hell_random_tower:read("room") <= slot1.getCanPassMaxRoomHell()
end

function slot2.onSkipClick(slot0)
	slot1 = userDefault.getForeverLocalKey("hellRandomTowerSkipBattle", false)

	slot0.skipBtn:get("skipBtn"):setSelectedState(not slot1)
	userDefault.setForeverLocalKey("hellRandomTowerSkipBattle", not slot1)
end

function slot2.onPassClick(slot0)
	slot0:passCb()
end

function slot2.showTip(slot0, slot1)
	if userDefault.getForeverLocalKey("hellRandomTowerSkipBattle", false) and itertools.isempty(table.deepcopy(gGameModel.hell_random_tower:read("battle_cards"), true)) then
		gGameUI:showTip(gLanguageCsv.noSpriteAvailable)
	end
end

function slot2.onBattleClick(slot0)
	if itertools.isempty(table.deepcopy(gGameModel.hell_random_tower:read("battle_cards"), true)) then
		slot0:goEmbattle()

		return
	end

	if userDefault.getForeverLocalKey("hellRandomTowerSkipBattle", false) then
		slot0:fightCb()

		return
	end

	slot0:goEmbattle()
end

function slot2.goEmbattle(slot0)
	gGameUI:stackUI("city.adventure.random_tower.hell_embattle", nil, , {
		from = game.EMBATTLE_FROM_TABLE.hellRandomTower,
		fightCb = function (...)
			uv0 = "fightCb"

			slot0.fightCb(...)
		end,
		startCb = slot0:createHandler("showTip")
	})
end

return slot2
