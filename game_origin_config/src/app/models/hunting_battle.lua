slot1 = class("HuntingBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.hunting

function slot1.getData(slot0)
	slot1 = slot0.DefaultGateID

	slot0:fixRoleOut(slot0:getRoleOut())
	slot0:fixRoleOut(slot0:getRoleOut2())

	slot6 = slot0.defence_role_db_id or slot0.defence_role_key and slot0.defence_role_key[2]
	slot7 = slot0:sceneConf(slot1)
	slot8 = {
		battleID = slot0.id,
		sceneID = slot1,
		gateID = slot0.gate_id,
		roleOut = slot2,
		roleOut2 = slot3,
		randSeed = slot0.rand_seed,
		gateType = slot7.gateType,
		sceneTag = slot7.tag,
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
			slot0.role_db_id or slot0.role_key and slot0.role_key[2],
			slot6
		},
		preData = slot0:getPreDataForEnd(slot2),
		multipGroup = slot0.MultipGroup,
		operateForce = gGameModel.role:read("id") == slot6 and 2 or 1,
		result = slot0.result,
		play_record_id = slot0.play_record_id,
		cross_key = slot0.cross_key,
		record_url = slot0.record_url,
		route = slot0.route,
		extraOut = slot0:getExtraOut(),
		operateForce = 1
	}

	if not slot0.operateForceSwitch then
		-- Nothing
	end

	if slot8.operateForce == 2 then
		for slot12, slot13 in ipairs(swapKeysTb) do
			table.swapvalue(slot8[slot13], 1, 2)
		end
	end

	if device.platform == "windows" then
		slot0:display(slot2, slot3)
	end

	if not slot8.gamemodel_data then
		uv9 = "DefaultGateID"
		slot9 = slot9.getGameModelData(slot0, slot8.route)
	end

	slot8.gamemodel_data = slot9

	return slot8
end

function slot1.getGameModelData(slot0, slot1)
	slot3 = nil

	if gGameModel.hunting then
		-- Nothing
	else
		slot2.route_info = slot0.route_info
	end

	return {
		route_info = table.getraw(gGameModel.hunting:read("hunting_route")[slot1])
	}
end

function slot1.fixRoleOut(slot0, slot1)
	for slot6, slot7 in maptools.order_pairs(slot1) do
		if slot7.roleForce == 2 and csv.cross.hunting.battle_fix[slot7.cardCsvId] then
			for slot12, slot13 in pairs(slot7) do
				for slot17 = 1, math.huge do
					if slot2[slot8]["attrType" .. slot17] then
						if game.ATTRDEF_ENUM_TABLE[slot12] == slot18 then
							slot7[slot12] = slot13 * slot2[slot8]["attrFix" .. slot17]
						end
					else
						break
					end
				end
			end
		end
	end

	return slot1
end

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

return slot1
