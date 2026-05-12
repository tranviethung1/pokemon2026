slot1 = class("ExperienceBattle", require("app.models.battle"))

function slot1.init(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end

	slot0.name = gGameModel.role:read("name")
	slot0.logo = gGameModel.role:read("logo")
	slot0.figure = gGameModel.role:read("figure")
	slot0.role_db_id = gGameModel.role:read("id")
	slot0.level = gGameModel.role:read("level")

	assert(slot0.level ~= nil, "level is required")
	assert(slot0.cards ~= nil, "cards is required")

	slot0.trialData = csv.experience.list[csv.experience.cards[slot0.trialID].cardID]
	slot0.enemy_cards = slot0:makeEnemyCards()
	slot0.enemy_weather = slot0:makeEnemyWeather()

	slot0:makeWeatherData()
	slot0:recordCheat(slot1)

	return slot0
end

function slot1.makeWeatherData(slot0)
	if slot0.weahter then
		slot0.extra = {
			weather = slot0.weahter
		}
	end

	if slot0.enemy_weather then
		slot0.defence_extra = {
			weather = slot0.enemy_weather
		}
	end
end

function slot1.makeEnemyCards(slot0)
	for slot5, slot6 in ipairs(slot0.trialData.enemyRandomCards) do
		assert(csv.experience.cards[slot6] ~= nil, "enmey card not in cards csv")
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot1.enemydeployLock) do
		if slot7 == 0 then
			table.insert(slot2, 6 + slot6)
		end
	end

	for slot8, slot9 in ipairs(slot2) do
		-- Nothing
	end

	return {
		[slot9] = random.sample(slot1.enemyRandomCards, table.length(slot2))[slot8]
	}
end

function slot1.makeEnemyWeather(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.enemy_cards) do
		slot7 = csv.experience.cards[slot6]
		slot8 = csv.cards[slot7.cardID]
		slot9 = csv.unit[slot8.unitID]

		table.insert(slot1, {
			csvID = slot6,
			cardID = slot7.cardID,
			unitID = slot8.unitID,
			star = slot7.star,
			attr1 = slot9.natureType,
			attr2 = slot9.natureType2
		})
	end

	if table.length(dataEasy.getTeamWeather(nil, true, {
		isTestPlay = true,
		cardsData = slot1
	})) > 0 then
		return slot2[1].weatherID
	else
		return nil
	end
end

function slot1.makeNetData(slot0)
	slot1 = table.deepcopy(slot0.cards, true)

	maptools.union_with(slot1, slot0.enemy_cards)

	slot2 = {
		[csv.experience.cards[slot8].cardID] = 0
	}

	for slot7, slot8 in pairs(slot1) do
		-- Nothing
	end

	if slot0.weahter then
		table.insert({}, slot0.weahter)
	end

	if slot0.enemy_weather then
		table.insert(slot4, slot0.enemy_weather)
	end

	if table.length(slot4) == 0 then
		slot4 = nil
	end

	if table.length(slot0.trialData.passiveSkillList) == 0 then
		slot5 = nil
	end

	return slot2, slot4, slot5
end

function slot1.setActualData(slot0, slot1)
	slot0.skill_process = slot1.view.skill_process
end

slot2 = {
	[7630.0] = 1,
	[7634.0] = 10,
	[7635.0] = 99,
	[7632.0] = 2,
	[90000001.0] = 1,
	[7633.0] = 3
}

function slot1.card2RoleOut(slot0, slot1, slot2, slot3)
	slot4 = slot1
	slot5 = csv.experience.cards[slot1]
	slot6 = csv.cards[slot5.cardID].unitID
	slot8 = {
		[slot13] = slot5.level
	}

	for slot12, slot13 in ipairs(csv.cards[slot5.cardID].skillList) do
		-- Nothing
	end

	uv10 = "csv"
	slot9 = table.deepcopy(slot10)

	if slot3 == 1 then
		for slot13, slot14 in ipairs(slot0.trialData.passiveSkillList) do
			slot9[slot14] = slot5.level
		end
	end

	for slot14, slot15 in pairs(game.ATTRDEF_ENUM_TABLE) do
		if slot5[slot14] then
			-- Nothing
		end
	end

	return {
		fightPoint = 0,
		mp1Scale = 1,
		hpScale = 1,
		roleForce = slot3,
		roleId = slot6,
		cardId = slot4,
		cardCsvId = slot5.cardID,
		level = slot5.level,
		advance = slot5.advance,
		star = slot5.star,
		skills = slot8,
		passive_skills = slot9,
		[slot14] = slot5[slot14]
	}
end

function slot1.getRoleOut(slot0)
	slot1 = {
		[slot0.OmitEmpty and slot2 or slot6] = slot0:card2RoleOut(slot7, {}, 1)
	}
	slot2 = 1

	for slot6, slot7 in maptools.order_pairs(slot0.cards) do
		slot2 = slot2 + 1
	end

	slot2 = 1

	for slot6, slot7 in maptools.order_pairs(slot0.enemy_cards) do
		slot1[slot0.OmitEmpty and slot2 or slot6] = slot0:card2RoleOut(slot7, {}, 2)
		slot2 = slot2 + 1
	end

	return slot1
end

function slot1.getExtraOut(slot0)
	if slot0.MultipGroup then
		return slot0:getGroupExtraOut()
	end

	if slot0.extra then
		-- Nothing
	end

	if slot0.defence_extra then
		slot1[2] = slot0.defence_extra
	end

	return {
		slot0.extra
	}
end

function slot1.getData(slot0)
	slot2 = slot0.role_db_id or slot0.role_key and slot0.role_key[2]
	slot0.defence_role_db_id = 99999999
	slot3 = slot0.defence_role_db_id or slot0.defence_role_key and slot0.defence_role_key[2]
	slot4 = slot0:sceneConf(game.GATE_TYPE.experience)
	slot5 = slot0:getRoleOut()
	slot6 = slot0:getExtraOut()

	if slot0.result and slot7 == "" then
		slot7 = nil
	end

	slot8 = {
		operateForce = 1,
		sceneID = slot1,
		trialID = slot0.trialID,
		roleOut = slot5,
		randSeed = math.random(1, 99999999),
		gateType = slot4.gateType,
		sceneTag = slot4.tag,
		names = {
			slot0.name,
			slot0.defence_name
		},
		levels = {
			slot0.level,
			slot0.defence_level
		},
		logos = {
			slot0.logo,
			slot0.defence_logo
		},
		figures = {
			slot0.figure,
			slot0.defence_figure
		},
		passive_skills = {
			slot0.passive_skills,
			slot0.defence_passive_skills
		},
		skill_process = slot0.skill_process,
		role_db_ids = {
			slot2,
			slot3
		},
		preData = {},
		result = slot7,
		extraOut = slot6,
		backUIData = {
			cards = slot0.cards,
			trialID = slot0.trialID
		}
	}

	if device.platform == "windows" then
		slot0:display(slot5, {})
	end

	return slot8
end

return slot1
