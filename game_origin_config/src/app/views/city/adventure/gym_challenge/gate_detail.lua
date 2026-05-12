function slot0(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0) do
		slot8 = csv.unit[slot7.unitId]

		table.insert(slot2, {
			unitId = slot7.unitId,
			level = slot7.level,
			advance = slot7.advance,
			rarity = slot8.rarity,
			attr1 = slot8.natureType,
			attr2 = slot8.natureType2,
			isBoss = slot1
		})
	end

	table.sort(slot2, function (slot0, slot1)
		return slot1.advance < slot0.advance
	end)

	return slot2
end

function slot1(slot0, slot1, slot2, slot3)
	return rich.createByStr(slot0, 40):anchorPoint(0, 0.5):xy(slot1, slot2):addTo(slot3, 6)
end

function slot2(slot0, slot1)
	slot2 = 0
	slot4 = false

	for slot8, slot9 in csvPairs(slot0.specialEff) do
		slot4 = true
		slot3 = 50 - 50

		for slot14, slot15 in csvPairs(slot9[1]) do
			slot10 = "#C0x5b545b#" .. (gLanguageCsv[game.NATURE_TABLE[slot15]] .. gLanguageCsv.xi)
		end

		slot10 = slot10 .. gLanguageCsv.card .. getLanguageAttr(slot9[2])
		slot13 = (slot9[3] == 0 and slot10 .. gLanguageCsv.improve .. "#C0xFF60C456#" or slot10 .. gLanguageCsv.reduce .. "#C0x5b545b#") .. dataEasy.getAttrValueString(slot11, slot9[4])
		uv13 = "csvPairs"

		slot13(slot13 .. (slot9[3] == 0 and "#Icommon/icon/logo_arrow_green.png-30-45#" or "#Icommon/icon/logo_arrow_red.png-30-45#"), slot2, slot3, slot1)
	end

	if slot0.specialEffDesc ~= "" then
		return slot3 + 25 - 50 - rich.createWithWidth("#C0x5b545b#" .. slot0.specialEffDesc or "", 40, nil, 960):anchorPoint(0, 1):xy(0, slot3 + 25 - 50):addTo(slot1):height()
	end

	if slot4 == false and slot0.specialEffDesc == "" then
		slot3 = slot3 - 50
	end

	return slot3 - 20
end

slot3 = cc.load("mvc").ViewBase
slot4 = class("EndlessTowerGateDetail", Dialog)
slot4.RESOURCE_FILENAME = "gym_gate_detail.json"
slot4.RESOURCE_BINDING = {
	["title.textGym"] = "textGym",
	roleItem = "roleItem",
	["infoPanel.textNote4"] = "textNote4",
	["title.textGate"] = "textGate",
	["infoPanel.text1"] = "text1",
	["infoPanel.awardList"] = "awardList",
	iconItem = "iconItem",
	["infoPanel.textNote3"] = "textNote3",
	["infoPanel.text3"] = "text3",
	["title.textDiff"] = "textDiff",
	["infoPanel.text4"] = "text4",
	["infoPanel.text2"] = "text2",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["infoPanel.enemyList"] = {
		varname = "enemyList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				padding = 10,
				data = bindHelper.self("monsterDatas"),
				item = bindHelper.self("roleItem"),
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

								slot3:scale(slot5.isBoss and 1.1 or 1)
							end
						}
					})
				end
			}
		}
	},
	["infoPanel.btnChallenge"] = {
		varname = "btnChallenge",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnChallenge")
			}
		}
	},
	["battleBtn.title"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot4.initText(slot0)
	slot1 = csv.gym.gate[slot0.gateId]
	slot2 = csv.scene_conf[slot0.gateId]

	slot0.textGym:text(csv.gym.gym[slot1.gymID].name)
	slot0.textDiff:text(gLanguageCsv["gymDifficulty" .. slot0.k])
	adapt.oneLinePos(slot0.textGym, slot0.textDiff, cc.p(5, 0))

	if slot1.deployType == 1 then
		slot0.text1:text(gLanguageCsv["embattleType" .. slot1.deployType])
	else
		slot0.text1:text(string.format(gLanguageCsv["embattleType" .. slot1.deployType], slot1.deployCardNumLimit))
	end

	slot4 = slot0.gateId
	uv4 = "csv"
	slot4 = slot4(csv.gym.gate[slot4], slot0.text2)

	if slot1.weatherDesc ~= "" then
		slot0.textNote3:y(slot0.text2:y() + slot4 - 50)
		slot0.text3:text(""):y(slot0.text2:y() + slot4 - 50)

		slot4 = slot0.text2:y() + slot4 - rich.createWithWidth("#C0x5b545b#" .. slot1.weatherDesc, 40, nil, 960):anchorPoint(0, 1):xy(0, 20):addTo(slot0.text3):height() + 30 - 50
	else
		slot0.textNote3:hide()
		slot0.text3:hide()

		slot4 = slot0.text2:y() + slot4 + 40 - 50
	end

	if slot1.placeDesc ~= "" then
		slot0.textNote4:y(slot4 - 50)
		slot0.textNote4:text(slot3.palce)
		slot0.text4:text(""):y(slot4 - 50)

		slot6 = rich.createWithWidth("#C0x5b545b#" .. slot1.placeDesc, 40, nil, 1000):anchorPoint(0, 1):xy(0, 20):addTo(slot0.text4)
	else
		slot0.textNote4:hide()
		slot0.text4:hide()
	end
end

function slot4.onCreate(slot0, slot1, slot2, slot3, slot4)
	slot0.gateId = slot1
	slot0.id = slot3
	slot0.k = slot2

	slot0:initText()

	slot5 = csv.gym.gate[slot0.gateId]
	slot7 = slot0.gateId
	slot6 = csv.scene_conf[slot7]
	uv7 = "gateId"
	slot8 = slot6.boss
	uv8 = "gateId"
	slot0.monsterDatas = arraytools.merge({
		slot7(slot8, true),
		slot8(slot6.monsters, false)
	})

	slot0.btnChallenge:visible(slot4)
	uiEasy.createItemsToList(slot0, slot0.awardList, slot6.dropIds, {
		margin = 20,
		onNode = function (slot0, slot1)
			if slot1.key ~= "gold" then
				ccui.ImageView:create("city/adventure/endless_tower/icon_gl.png"):anchorPoint(1, 0.5):xy(slot0:width() - 5, slot0:height() - 25):addTo(slot0, 15)
			end
		end
	})
	Dialog.onCreate(slot0)
end

function slot4.onBtnChallenge(slot0)
	if slot0:getChallengeState() == false then
		gGameUI:showTip(gLanguageCsv.gymTimeOut)

		return
	end

	if gCommonConfigCsv.gymBattleTimes - gGameModel.daily_record:read("gym_battle_times") + gGameModel.daily_record:read("gym_battle_buy_times") <= 0 then
		gGameUI:showTip(gLanguageCsv.timesLimit2048)

		return
	end

	if #dataEasy.getNatureSprite(csv.gym.gate[slot0.gateId].deployNatureLimit or {}) == 0 then
		gGameUI:showTip(gLanguageCsv.gymNoSptire1)

		return
	end

	slot5 = slot0.id

	function slot6(slot0, slot1, slot2)
		slot4 = slot1
		slot3 = slot1.read(slot4)
		uv4 = "read"

		if slot4 == 2 then
			slot2 = nil
		end

		uv6 = "battleEntrance"
		uv7 = "battleRequest"

		battleEntrance.battleRequest("/game/gym/gate/start", slot6, slot7, slot3, slot2):onStartOK(function (slot0)
			uv1 = "onClose"

			slot1:onClose(false)
		end):show()
	end

	if csv.gym.gate[slot0.gateId].deployType == 1 then
		slot9 = game.EMBATTLE_FROM_TABLE.gymChallenge

		if itertools.size(csv.gym.gate[slot3].deployNatureLimit) ~= 0 or csv.gym.gate[slot3].deployCardNumLimit ~= 6 then
			slot9 = game.EMBATTLE_FROM_TABLE.onekey
		end

		gGameUI:stackUI("city.adventure.gym_challenge.embattle1", nil, {
			full = true
		}, {
			fightCb = slot6,
			gateId = slot3,
			gymId = slot5,
			from = slot9
		})
	elseif slot4 == 2 then
		gGameUI:stackUI("city.adventure.gym_challenge.embattle2", nil, {
			full = true
		}, {
			fightCb = slot6,
			gateId = slot3,
			gymId = slot5
		})
	else
		gGameUI:stackUI("city.adventure.gym_challenge.embattle3", nil, {
			full = true
		}, {
			fightCb = slot6,
			gateId = slot3,
			gymId = slot5
		})
	end

	slot0:onClose()
end

function slot4.getChallengeState(slot0)
	if gGameModel.gym:read("round") == "closed" then
		return false
	end

	return time.getTime() < time.getNumTimestamp(gGameModel.gym:read("date"), 21, 45) + 518400
end

return slot4
