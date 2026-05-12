slot1 = class("GameBattleModel")

function slot1.card2RoleOut(slot0, slot1, slot2, slot3)
	slot4, slot5, slot6 = nil

	if type(slot0) == "table" then
		slot4, slot5, slot6 = unpack(slot0, 1, 3)
	else
		slot4 = slot0
	end

	if slot4 == nil or slot4 == 0 then
		return nil
	end

	slot7 = slot1[slot4]
	slot6 = slot7.skin_id
	slot5 = slot7.card_id
	slot8 = slot2[slot4]
	slot9 = 0

	if slot7.unit_id and slot7.unit_id ~= 0 then
		slot9 = slot7.unit_id
	else
		slot9 = csv.cards[slot5].unitID

		if slot6 and slot6 ~= 0 then
			slot9 = csv.card_skin[slot6].unitIDs[slot5]
		end
	end

	slot10 = {
		roleForce = slot3,
		roleId = slot9,
		cardId = slot4,
		cardCsvId = slot5,
		fightPoint = slot7.fighting_point,
		level = slot7.level,
		advance = slot7.advance,
		skills = slot7.skills,
		star = slot7.star,
		starEffect = slot7.star_effect,
		passive_skills = slot7.passive_skills or {},
		hpScale = slot8 and slot8[1] or 1,
		mp1Scale = slot8 and slot8[2] or 1,
		[slot14] = slot15
	}

	for slot14, slot15 in pairs(slot7.attrs) do
		-- Nothing
	end

	if slot7.attrs2 then
		for slot14, slot15 in pairs(slot7.attrs2) do
			slot10[slot14] = slot15
		end
	end

	return slot10
end

function slot1.ctor(slot0, slot1)
	slot0.game = slot1
	slot0.operateForceSwitch = false
end

function slot1.init(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end

	assert(slot0.level ~= nil, "level is required")
	assert(slot0.cards ~= nil, "cards is required")
	slot0:recordCheat(slot1)

	return slot0
end

function slot1.sceneConf(slot0, slot1)
	return csv.scene_conf[slot1]
end

function slot1.getRoleOut(slot0)
	if slot0.MultipGroup then
		return slot0:getGroupRoleOut()
	end

	slot1 = {
		[slot0.OmitEmpty and slot2 or slot6] = slot9(slot7, slot0.card_attrs, slot0.card_states or {}, 1)
	}
	slot2 = 1

	for slot6, slot7 in maptools.order_pairs(slot0.cards) do
		uv9 = "MultipGroup"
		slot2 = slot2 + 1
	end

	if slot0.defence_cards then
		slot3 = 1

		for slot7, slot8 in maptools.order_pairs(slot0.defence_cards) do
			uv11 = "MultipGroup"
			slot1[6 + (slot0.OmitEmpty and slot3 or slot7)] = slot11(slot8, slot0.defence_card_attrs, slot0.defence_card_states or {}, 2)
			slot3 = slot3 + 1
		end
	end

	return slot1
end

function slot1.getGroupRoleOut(slot0)
	slot1 = {
		{},
		{}
	}

	for slot5, slot6 in ipairs(slot0.cards) do
		slot1[1][slot5] = slot1[1][slot5] or {}
		slot7 = 1

		for slot11, slot12 in maptools.order_pairs(slot6) do
			uv15 = "ipairs"
			slot1[1][slot5][slot0.OmitEmpty and slot7 or slot11] = slot15(slot12, slot0.card_attrs, slot0.card_states or {}, 1)
			slot7 = slot7 + 1
		end
	end

	if slot0.defence_cards then
		for slot5, slot6 in ipairs(slot0.defence_cards) do
			slot1[2][slot5] = slot1[2][slot5] or {}
			slot7 = 1

			for slot11, slot12 in maptools.order_pairs(slot6) do
				uv16 = "ipairs"
				slot1[2][slot5][6 + (slot0.OmitEmpty and slot7 or slot11)] = slot16(slot12, slot0.defence_card_attrs, slot0.defence_card_states or {}, 2)
				slot7 = slot7 + 1
			end
		end
	end

	return slot1
end

function slot2(slot0)
	slot1 = slot0

	if type(slot0) == "table" then
		slot1 = slot0[1]
	end

	return slot0
end

function slot1.getRoleOut2(slot0)
	if slot0.MultipGroup then
		return slot0:getGroupRoleOut2()
	end

	slot1 = {}
	slot2 = 1

	if slot0.card_attrs2 then
		for slot6, slot7 in maptools.order_pairs(slot0.cards) do
			uv9 = "MultipGroup"

			if slot0.card_attrs2[slot9(slot7)] then
				uv9 = "getGroupRoleOut2"
				slot1[slot0.OmitEmpty and slot2 or slot6] = slot9(slot7, slot0.card_attrs2, slot0.card_states or {}, 1)
			end

			slot2 = slot2 + 1
		end
	end

	if slot0.defence_card_attrs2 and slot0.defence_cards then
		slot3 = 1

		for slot7, slot8 in maptools.order_pairs(slot0.defence_cards) do
			uv10 = "MultipGroup"

			if slot0.defence_card_attrs2[slot10(slot8)] then
				uv11 = "getGroupRoleOut2"
				slot1[6 + (slot0.OmitEmpty and slot3 or slot7)] = slot11(slot8, slot0.defence_card_attrs2, slot0.defence_card_states or {}, 2)
			end

			slot3 = slot3 + 1
		end
	end

	return slot1
end

function slot1.getGroupRoleOut2(slot0)
	slot1 = {
		{},
		{}
	}

	if slot0.card_attrs2 then
		for slot5, slot6 in ipairs(slot0.cards) do
			slot1[1][slot5] = slot1[1][slot5] or {}
			slot7 = 1

			for slot11, slot12 in maptools.order_pairs(slot6) do
				uv14 = "card_attrs2"

				if slot0.card_attrs2[slot14(slot12)] then
					uv15 = "ipairs"
					slot1[1][slot5][slot0.OmitEmpty and slot7 or slot11] = slot15(slot12, slot0.card_attrs2, slot0.card_states or {}, 1)
				end

				slot7 = slot7 + 1
			end
		end
	end

	if slot0.defence_card_attrs2 and slot0.defence_cards then
		for slot5, slot6 in ipairs(slot0.defence_cards) do
			slot1[2][slot5] = slot1[2][slot5] or {}
			slot7 = 1

			for slot11, slot12 in maptools.order_pairs(slot6) do
				uv14 = "card_attrs2"

				if slot0.defence_card_attrs2[slot14(slot12)] then
					uv16 = "ipairs"
					slot1[2][slot5][6 + (slot0.OmitEmpty and slot7 or slot11)] = slot16(slot12, slot0.defence_card_attrs2, slot0.defence_card_states or {}, 2)
				end

				slot7 = slot7 + 1
			end
		end
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

function slot1.getGroupExtraOut(slot0)
	if slot0.extra then
		slot1[1] = slot0.extra
	end

	if slot0.defence_extra then
		slot1[2] = slot0.defence_extra
	end

	return {
		{},
		{}
	}
end

slot3 = {
	"levels",
	"names",
	"figures",
	"logos"
}

function slot1.getData(slot0)
	slot2 = slot0:getRoleOut()
	slot3 = slot0:getRoleOut2()
	slot4 = slot0.role_db_id or slot0.role_key and slot0.role_key[2]
	slot5 = slot0.defence_role_db_id or slot0.defence_role_key and slot0.defence_role_key[2]
	slot6 = slot0:sceneConf(slot0.gate_id or slot0.DefaultGateID)
	slot7 = slot0:getExtraOut()

	if slot0.result and slot8 == "" then
		slot8 = nil
	end

	slot9 = {
		battleID = slot0.id,
		sceneID = slot1,
		roleOut = slot2,
		roleOut2 = slot3,
		randSeed = slot0.rand_seed,
		gateType = slot6.gateType,
		sceneTag = slot6.tag,
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
			slot4,
			slot5
		},
		preData = slot0:getPreDataForEnd(slot2),
		multipGroup = slot0.MultipGroup,
		operateForce = gGameModel.role:read("id") == slot5 and 2 or 1,
		result = slot8,
		play_record_id = slot0.play_record_id,
		cross_key = slot0.cross_key,
		record_url = slot0.record_url,
		extraOut = slot7,
		operateForce = 1
	}

	if not slot0.operateForceSwitch then
		-- Nothing
	end

	if slot9.operateForce == 2 then
		uv11 = "gate_id"

		for slot13, slot14 in ipairs(slot11) do
			table.swapvalue(slot9[slot14], 1, 2)
		end
	end

	if device.platform == "windows" then
		slot0:display(slot2, slot3)
	end

	slot9.top_cards_data = slot0:getTopCardsData()

	return slot9
end

function slot1.getTopCardsData(slot0)
	slot1 = {
		top_cards = gGameModel.role:read("top_cards") or {},
		card_attrs = {}
	}

	for slot6, slot7 in ipairs(slot2) do
		slot1.card_attrs[slot7] = gGameModel.cards:find(slot7):read("attrs")
	end

	return slot1
end

function slot1.getPreDataForEnd(slot0, slot1)
	slot2 = {}
	slot3 = {}

	for slot7 = 1, 6 do
		if slot1[slot7] then
			table.insert(slot3, {
				id = slot7,
				unitId = slot8.roleId,
				level = slot8.level,
				advance = slot8.advance,
				star = slot8.star,
				rarity = csv.unit[slot8.roleId].rarity
			})
		end
	end

	slot2.cardsInfo = slot3
	slot2.drop = slot0.drop
	slot2.roleInfo = {
		level = gGameModel.role:read("level"),
		level_exp = gGameModel.role:read("level_exp"),
		sum_exp = gGameModel.role:read("sum_exp")
	}
	slot2.dungeonStar = gGameModel.role:read("gate_star")[slot0.gate_id] and slot4.star or 0

	return slot2
end

function slot1.recordCheat(slot0, slot1)
	if ANTI_AGENT then
		return
	end

	slot1 = clone(slot1)
	slot0.cheat = {
		tb = slot1,
		sum = csvNumSum(slot1)
	}
end

function slot1.checkCheat(slot0)
	if ANTI_AGENT then
		return
	end

	if math.abs(slot0.cheat.sum - csvNumSum(slot0.cheat.tb)) > 1e-05 then
		errorInWindows("checkCheat %s %s %s", tostring(slot0), slot1, slot2)
		exitApp("close your cheating software")
	end
end

function slot1.display(slot0, slot1, slot2)
	if slot0.MultipGroup == nil then
		slot3 = {
			{
				"hp",
				"生命"
			},
			{
				"speed",
				"速度"
			},
			{
				"damage",
				"物攻"
			},
			{
				"defence",
				"物防"
			},
			{
				"specialDamage",
				"特攻"
			},
			{
				"specialDefence",
				"特防"
			}
		}
		slot4 = {
			"名字"
		}

		for slot8 = 1, 12 do
			if slot1[slot8] ~= nil then
				table.insert(slot4, "" .. slot8 .. "-" .. csv.unit[slot9.roleId].name .. "-" .. slot9.roleId)
			else
				table.insert(slot4, "")
			end
		end

		slot8 = "\t"

		print(table.concat(slot4, slot8))
		print("第一套属性")

		for slot8, slot9 in ipairs(slot3) do
			slot10 = {
				slot9[2]
			}

			for slot14 = 1, 12 do
				if slot1[slot14] ~= nil then
					table.insert(slot10, slot15[slot9[1]])
				else
					table.insert(slot10, "")
				end
			end

			print(table.concat(slot10, "\t"))
		end

		print("第二套属性")

		for slot8, slot9 in ipairs(slot3) do
			slot10 = {
				slot9[2]
			}

			for slot14 = 1, 12 do
				if slot2[slot14] ~= nil then
					table.insert(slot10, slot15[slot9[1]])
				else
					table.insert(slot10, "")
				end
			end

			print(table.concat(slot10, "\t"))
		end
	end
end

return slot1
