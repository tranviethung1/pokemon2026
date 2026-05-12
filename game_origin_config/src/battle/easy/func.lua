function battleEasy.randomGetByArray(slot0, slot1, slot2, slot3)
	slot4 = {}

	for slot9 = 1, table.length(slot0) do
		if table.length(slot0) <= slot1 or slot2 or function ()
			return ymrand.random() > 0.5
		end(slot0[slot9]) then
			slot1 = slot1 - 1

			table.insert(slot4, slot3 or function (slot0)
				return slot0
			end(slot0[slot9], table.length(slot4) + 1))
		end
	end

	return slot4
end

function battleEasy.groupRelationInclude(slot0, slot1)
	for slot5, slot6 in ipairs(slot0) do
		if slot6[slot1] then
			return true
		end
	end

	return false
end

function battleEasy.intersection(slot0, slot1, slot2)
	if not slot0 or not slot1 then
		return false
	end

	if type(slot0) ~= "table" or type(slot1) ~= "table" then
		errorInWindows("please check afferent set s1:%s, s2:%s", type(slot0), type(slot1))

		return false
	end

	slot3 = slot0

	if not slot2 then
		slot3 = arraytools.hash(slot0)
	end

	for slot7, slot8 in ipairs(slot1) do
		if slot3[slot8] then
			return true
		end
	end

	return false
end

function battleEasy.numEqual(slot0, slot1)
	return math.abs(slot0 - slot1) < 1e-05
end

function battleEasy.ifElse(slot0, slot1, slot2)
	if slot0 then
		return slot1
	end

	return slot2
end

function battleEasy.getSkillTab(slot0)
	slot2 = csv.skill
	slot3 = {}

	if not csv.unit[slot0] then
		errorInWindows("getSkillTab %d unitCfg exit nil", slot0)
	end

	if slot1 then
		for slot7, slot8 in ipairs(slot1.skillList) do
			slot3[slot8] = slot2[slot8].skillType2
		end

		for slot7, slot8 in ipairs(slot1.passiveSkillList) do
			slot3[slot8] = battle.MainSkillType.PassiveSkill
		end

		for slot7, slot8 in ipairs(slot1.fakePassiveSkillList) do
			slot3[slot8] = battle.MainSkillType.PassiveSkill
		end
	end

	return slot3
end

function battleEasy.checkSkillMatch(slot0, slot1)
	if not csv.unit[slot0] then
		errorInWindows("checkSkillMatch %d unitCfg exit nil", slot0)
	end

	if slot2 then
		for slot6, slot7 in ipairs(slot2.skillList) do
			if slot1 == slot7 then
				return true
			end
		end

		for slot6, slot7 in ipairs(slot2.extraSkillList) do
			if slot1 == slot7 then
				return true
			end
		end
	end

	return false
end

function battleEasy.getItemInPowerMap(slot0, slot1)
	for slot6, slot7 in pairs(slot1) do
		if slot7 and slot0[slot6] then
			slot2 = 0 + slot7
		end
	end

	slot4 = 0

	for slot8 = 1, table.length(slot1) do
		if slot0[slot8] then
			if ymrand.random() <= slot1[slot8] / slot2 then
				return slot0[slot8]
			else
				slot3 = slot3 - slot9
			end
		end
	end
end

function battleEasy.isSameSkillType(slot0, slot1)
	if slot0 == battle.SkillFormulaType.fix then
		return true
	end

	if slot1 == battle.SkillFormulaType.fix then
		return true
	end

	return slot0 == slot1
end

function battleEasy.isCompleteLeave(slot0)
	for slot4, slot5 in slot0:ipairsOverlaySpecBuff("leave") do
		return true
	end

	for slot4, slot5 in slot0:ipairsOverlaySpecBuff("depart") do
		if slot5.leaveSwitch then
			return true
		end
	end

	return false
end

function battleEasy.getUnifyBuffArgs(slot0, slot1, slot2, slot3)
	if slot0 == "skill_process" then
		-- Nothing
	elseif slot0 == "buff" then
		slot4.value = slot1.value
		slot4.buffValueFormula = slot1.buffValueFormula
		slot4.skillCfg = slot1.skillCfg
	end

	for slot8, slot9 in pairs(slot2) do
		slot4[slot8] = slot9
	end

	return {
		buffValueFormulaEnv = slot3,
		buffValueFormula = slot1.buffValue1[slot2.index]
	}
end

function battleEasy.getRoundTriggerId(slot0)
	for slot4, slot5 in pairs(gExtraRoundTrigger) do
		if slot5.cfgIds[slot0] then
			return slot4
		end
	end
end

function battleEasy.getOverlayLimit(slot0, slot1, slot2)
	slot5 = slot2.extraOverlayLimit.trigger == 1 and slot0 or slot1

	if not csvNext(slot4) or not slot5 then
		return slot2.overlayLimit
	end

	if slot4.star and slot6[1] <= slot5.star then
		slot3 = slot3 + slot6[2]
	end

	if slot4.zawake then
		for slot11 = 79000 + slot7[1], 79004 do
			if slot5.tagSkills[slot11] then
				slot3 = slot3 + slot7[2]

				break
			end
		end
	end

	return slot3
end

function battleEasy.getSummonAttr(slot0, slot1, slot2)
	if slot2 >= 0 then
		slot3 = slot1 * slot2
	else
		slot3 = 0

		for slot7, slot8 in slot0.scene:getHerosMap(slot0.force):order_pairs() do
			for slot12, slot13 in slot8:iterBuffsWithEasyEffectFunc("buffRecord") do
				if (slot13:getEventByKey(battle.ExRecordEvent.buffRecord) or {})[slot2 .. slot0.id] then
					slot3 = slot3 + slot14[slot2 .. slot0.id]
				end
			end
		end
	end

	return slot3
end

function battleEasy.getSummonRoleOut(slot0, slot1)
	slot2 = slot0[1]
	slot3 = battleEasy.ifElse(slot0[3] > 0, slot0[3], slot1:getSummonerLevel())
	slot5 = {
		skills = {},
		passiveSkills = {},
		cardId = csv.unit[slot2].cardID,
		roleId = slot2,
		level = slot3,
		skillLevel = slot3,
		fightPoint = slot1.fightPoint,
		star = slot1.star,
		starEffect = slot1.starEffect,
		type = battle.ObjectType.Summon,
		isFollowMode = slot0[7] == 1,
		followArgs = slot0[8] or {},
		waveGoonDel = slot0[9] == 1
	}
	slot5.followMark = slot5.followArgs.followMark or 1
	slot7 = slot0[4]
	slot8 = slot0[6] or {}

	for slot12, slot13 in pairs(slot1.attrs:cloneFinalAttr()) do
		slot5[slot12] = slot13

		if slot8[slot12] then
			slot5[slot12] = battleEasy.getSummonAttr(slot1, slot13, slot8[slot12])
		elseif ObjectAttrs.SixDimensionAttrs[slot12] then
			slot5[slot12] = slot5[slot12] * slot7
		elseif slot8.specialDefault then
			slot5[slot12] = slot5[slot12] * slot8.specialDefault
		end
	end

	slot5.hp = slot5.hpMax
	slot5.mp1 = slot5.mp1Max
	slot5.hpScale = slot1.hpScale
	slot5.mp1Scale = slot1.mp1Scale

	for slot13, slot14 in ipairs(slot4.skillList) do
		slot5.skills[slot14] = slot3

		function (slot0)
			if csv.skill[slot0].zawakeEffect[1] then
				uv2 = "csv"

				if slot2.tagSkills[slot1] then
					uv2 = "skill"
					uv3 = "zawakeEffect"
					slot2.skills[slot1] = slot3
				end
			end
		end(slot14)
	end

	for slot13, slot14 in ipairs(slot4.passiveSkillList) do
		slot5.passiveSkills[slot14] = slot3

		slot9(slot14)
	end

	for slot13, slot14 in pairs(slot1.passiveSkills) do
		if csv.skill[slot13] and slot15.summonInherit then
			slot5.skills[slot13] = slot3

			slot9(slot13)
		end
	end

	return slot5
end

function battleEasy.loseImmuneEfficacyCheck(slot0, slot1, slot2)
	if not slot0:getFrontOverlaySpecBuff("loseImmuneEfficacy") then
		return false
	end

	if itertools.include(slot3.buffCfgId, slot1.cfgId) or itertools.include(slot3.buffType, slot1.type) or itertools.include(slot3.buffGroups[slot1.indexGroup] or {}, slot1.group) then
		return true
	end

	if slot2 then
		for slot8, slot9 in pairs(slot2) do
			if itertools.include(slot3.attr, slot9) then
				return true
			end
		end
	end

	return false
end

function battleEasy.attackRangeExtension(slot0, slot1)
	if not slot0.addAttackRangeObjs then
		return slot1
	end

	itertools.each(slot0.addAttackRangeObjs, function (slot0, slot1)
		uv6 = "obj"

		if not slot1.obj:isLogicStateExit(battle.ObjectLogicState.cantBeSelect, {
			fromObj = slot6.self
		}) then
			uv3 = "isLogicStateExit"

			table.insert(slot3, slot1.obj)
		end
	end)
	itertools.each(slot1, function (slot0, slot1)
		uv2 = "addAttackRangeObjs"

		if not slot2.addAttackRangeObjs[slot1.id] then
			uv3 = "id"

			table.insert(slot3, slot1)
		end
	end)

	return {}
end

function battleEasy.deepcopy_args(slot0)
	slot1 = table.deepcopy(slot0, true)
	slot1.specialFrom = nil

	return slot1
end

function battleEasy.addBuffToFunc(slot0, slot1, slot2, slot3, slot4)
	return slot0 and addBuffToScene or addBuffToHero(slot1, slot2, slot3, slot4)
end

function battleEasy.keyToID(slot0, slot1)
	if slot0 == "id" then
		return slot1.id
	end

	return slot0
end

function battleEasy.logTraceInfo(slot0)
	if device.platform ~= "windows" then
		return nil
	end

	return function ()
		uv0 = ""
		slot0 = slot0 or 5
		uv0 = 2
		uv2 = ""

		for slot4 = 1, slot2 do
			if debug.getinfo(slot4 + 2, "nSl") then
				slot0 = "" .. string.format("\n\t[%d]文件:%s:%s 函数:%s", slot4, slot5.short_src, slot5.currentline, slot5.name)
			end
		end

		return slot0
	end
end
