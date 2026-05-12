slot0 = {
	getSameBuffCount = 0,
	isSelfInCharging = 0,
	hasTypeBuff = 0,
	isSelfChargeOK = 0,
	getBuffOverlayCount = 0
}
slot1 = battleCsv.newCsvCls("CsvObject")
slot1.ignoreModelCheck = {
	selectCsvTarget = true,
	getBuff = true,
	attackerSkill = true,
	curSkill = true
}
battleCsv.CsvObject = slot1

function slot1.skillLv(slot0, ...)
	for slot4, slot5 in ipairs({
		...
	}) do
		if slot0.model.skills[slot5] or slot0.model.passiveSkills[slot5] then
			return slot6:getLevel()
		end
	end

	return 1
end

function slot1.selectCsvTarget(slot0)
	if slot0.model and slot0.model:getCurTarget() then
		return battleCsv.CsvObject.newWithCache(slot1)
	end

	return battleCsv.NilObject
end

function slot1.checkIsSkillTarget(slot0)
	return slot0.model.scene.play.curHero and slot0.model.id == slot1.curTargetId
end

function slot1.getPossessTarget(slot0)
	if slot0.model and slot0.model:getEventByKey(battle.ExRecordEvent.possessTarget) then
		return battleCsv.CsvObject.newWithCache(slot1)
	end

	return battleCsv.NilObject
end

function slot1.getSummoner(slot0)
	if slot0.model and slot0.model:getEventByKey(battle.ExRecordEvent.summoner) then
		return battleCsv.CsvObject.newWithCache(slot1)
	end

	return battleCsv.NilObject
end

function slot1.isBeControlled(slot0)
	return slot0.model:isSelfControled() or slot0.model:isSelfForceConfusionAndNoTarget()
end

function slot1.skillCanUse(slot0, slot1)
	for slot7, slot8 in pairs(slot1 and {
		[slot1] = true
	} or {
		[battle.MainSkillType.SmallSkill] = true,
		[battle.MainSkillType.BigSkill] = true,
		[battle.MainSkillType.NormalSkill] = true
	}) do
		if slot8 then
			slot3 = true and not slot0.model:isLogicStateExit(battle.ObjectLogicState.cantUseSkill, {
				skillType2 = slot7
			})
		end
	end

	return slot3
end

function slot1.isSameObj(slot0, slot1)
	if not slot1 then
		return false
	end

	return slot0.model.id == (slot1.id or slot1.model.id)
end

function slot1.nature(slot0, slot1)
	return slot0.model:getNatureType(slot1 or 1)
end

function slot1.id(slot0)
	return slot0.model.seat
end

function slot1.cardID(slot0)
	return slot0.model.cardID
end

function slot1.unitID(slot0)
	return slot0.model.unitID
end

function slot1.originUnitId(slot0)
	return slot0.model.originUnitID
end

function slot1.markID(slot0)
	return slot0.model.markID
end

function slot1.star(slot0, slot1)
	return slot0.model:getStar(slot1 == 1)
end

function slot1.rarity(slot0)
	return slot0.model.rarity
end

function slot1.flag(slot0, slot1)
	return slot0.model.battleFlag[slot1] or false
end

function slot1.level(slot0)
	return slot0.model.level
end

function slot1.force(slot0)
	return slot0.model.force
end

function slot1.followMark(slot0)
	return slot0.model.followMark or -1
end

function slot1.isRealDeath(slot0)
	return slot0.model:isRealDeath()
end

function slot1.isAlreadyDead(slot0)
	return slot0.model:isAlreadyDead()
end

function slot1.hp(slot0)
	return slot0.model:hp()
end

function slot1.lostHp(slot0)
	return math.max(0, slot0.model:hpMax() - slot0.model:hp())
end

function slot1.mp1(slot0)
	return slot0.model:mp1()
end

function slot1.mp1PointOrValue(slot0)
	if slot0.model:getFrontOverlaySpecBuff("mp1OverFlow") then
		if slot1.mode == 1 then
			return math.floor(slot0.model:mpOverflow() / slot1.rate)
		else
			return slot2
		end
	end

	return 0
end

function slot1.curSkill(slot0)
	if slot0.model and slot0.model.curSkill then
		return battleCsv.CsvSkill.newWithCache(slot0.model.curSkill)
	end

	return battleCsv.NilSkill
end

function slot1.attackerSkill(slot0)
	if slot0.model and slot0.model.attackerCurSkill and slot0.model.attackerCurSkill[table.length(slot0.model.attackerCurSkill)] then
		return battleCsv.CsvSkill.newWithCache(slot2)
	end

	return battleCsv.NilSkill
end

function slot1.getDamageStateByTarget(slot0, slot1, slot2)
	return slot0:curSkill():getDamageStateByTarget(slot1, slot2)
end

function slot1.getDamageState(slot0, slot1)
	for slot5, slot6 in pairs(slot0.model.curSkill.targetsFinalResult) do
		if table.get(slot6, "args", slot1) then
			return slot7
		end
	end
end

function slot1.getDamageStateToMe(slot0, slot1)
	return table.get(slot0.model.attackerCurSkill, table.length(slot0.model.attackerCurSkill), "targetsFinalResult", slot0.model.id, "args", slot1)
end

function slot1.getDispelSuccessCount(slot0)
	return slot0.model:getEventByKey(battle.ExRecordEvent.dispelSuccessCount) or 0
end

function slot1.hasSkill(slot0, ...)
	for slot4, slot5 in ipairs({
		...
	}) do
		if slot0.model.skills[slot5] or slot0.model.passiveSkills[slot5] then
			return true
		end
	end

	return false
end

function slot1.hasBuff(slot0, ...)
	for slot4, slot5 in ipairs({
		...
	}) do
		if slot0.model:hasBuff(slot5) then
			return true
		end
	end

	return false
end

function slot1.countBuff(slot0, ...)
	for slot5, slot6 in ipairs({
		...
	}) do
		if slot0.model:hasBuff(slot6) then
			slot1 = 0 + 1
		end
	end

	return slot1
end

function slot1.hasBuffGroup(slot0, ...)
	for slot4, slot5 in ipairs({
		...
	}) do
		if slot0.model:hasBuffGroup(slot5) then
			return true
		end
	end

	return false
end

function slot1.hasBuffFlag(slot0, ...)
	for slot4, slot5 in ipairs({
		...
	}) do
		if slot0.model:hasBuffFlag(slot5) then
			return true
		end
	end

	return false
end

function slot1.getBuff(slot0, slot1)
	if slot0.model then
		if slot0.model:getBuff(slot1) == nil then
			return battleCsv.NilBuff
		end

		return battleCsv.CsvBuff.newWithCache(slot2)
	end

	return battleCsv.NilBuff
end

function slot1.getSkill(slot0, slot1)
	if slot0.model then
		if (slot0.model.skills and slot0.model.skills[slot1]) == nil then
			return battleCsv.NilSkill
		end

		return battleCsv.CsvSkill.newWithCache(slot2)
	end

	return battleCsv.NilSkill
end

function slot1.sumBuffOverlayByGroup(slot0, ...)
	for slot5, slot6 in ipairs({
		...
	}) do
		slot1 = 0 + slot0.model:getBuffGroupArgSum("overlayCount", slot6)
	end

	return slot1
end

function slot1.sumBuffLifeRoundByGroup(slot0, ...)
	for slot5, slot6 in ipairs({
		...
	}) do
		slot1 = 0 + slot0.model:getBuffGroupFuncSum("getLifeRound", slot6)
	end

	return slot1
end

function slot1.frontOrBack(slot0)
	return slot0.model:frontOrBack()
end

function slot1.getFullShieldCaster(slot0)
	if slot0.model.caster then
		return battleCsv.CsvObject.newWithCache(slot0.model.caster)
	end

	return battleCsv.NilObject
end

function slot1.shieldHp(slot0, ...)
	if ... then
		slot1 = {
			[slot7] = true
		}
		slot2 = 0

		for slot6, slot7 in ipairs({
			...
		}) do
			-- Nothing
		end

		for slot6, slot7 in slot0.model:ipairsOverlaySpecBuff("shield") do
			if slot1[slot7.cfgId] then
				slot2 = slot2 + math.max(slot7.shieldHp, 0)
			end
		end

		return slot2
	else
		return slot0.model:shieldHp()
	end
end

function slot1.shieldHpByGroup(slot0, ...)
	if next({
		...
	}) then
		slot2 = {
			[slot8] = true
		}
		slot3 = 0

		for slot7, slot8 in ipairs(slot1) do
			-- Nothing
		end

		for slot7, slot8 in slot0.model:ipairsOverlaySpecBuff("shield") do
			if slot2[slot8.group] then
				slot3 = slot3 + math.max(slot8.shieldHp, 0)
			end
		end

		return slot3
	else
		return slot0.model:shieldHp()
	end
end

function slot1.assimilateDamageHp(slot0, ...)
	if ... then
		slot1 = {
			[slot7] = true
		}
		slot2 = 0

		for slot6, slot7 in ipairs({
			...
		}) do
			-- Nothing
		end

		for slot6, slot7 in slot0.model:ipairsOverlaySpecBuff("assimilateDamage") do
			if slot1[slot7.cfgId] then
				slot2 = slot2 + math.max(slot7.assimilateDamage, 0)
			end
		end

		return slot2
	else
		return slot0.model:assimilateDamage()
	end
end

function slot1.assimilateDamageHpByGroup(slot0, ...)
	if next({
		...
	}) then
		slot2 = {
			[slot8] = true
		}
		slot3 = 0

		for slot7, slot8 in ipairs(slot1) do
			-- Nothing
		end

		for slot7, slot8 in slot0.model:ipairsOverlaySpecBuff("assimilateDamage") do
			if slot2[slot8.group] then
				slot3 = slot3 + math.max(slot8.assimilateDamage, 0)
			end
		end

		return slot3
	else
		return slot0.model:assimilateDamage()
	end
end

function slot2(slot0, slot1)
	slot2 = 0

	if next(slot0) then
		for slot6, slot7 in pairs(slot1) do
			for slot12, slot13 in ipairs(slot0) do
				if itertools.include(csv.buff[slot6].buffFlag, slot13) then
					slot2 = slot2 + slot7

					break
				end
			end
		end
	else
		for slot6, slot7 in pairs(slot1) do
			slot2 = slot2 + slot7
		end
	end

	return slot2
end

function slot1.shieldAbsorbedDamage(slot0, ...)
	if not slot0.model:getEventByKey(battle.ExRecordEvent.shieldAbsorbDamage) then
		return 0
	end

	uv3 = "model"

	return slot3({
		...
	}, slot1)
end

function slot1.assimilateDamageAbsorbedDamage(slot0, ...)
	if not slot0.model:getEventByKey(battle.ExRecordEvent.assimilateDamageAbsorbDamage) then
		return 0
	end

	uv3 = "model"

	return slot3({
		...
	}, slot1)
end

function slot1.getImmuneDamageVal(slot0, ...)
	if not slot0.model:getEventByKey(battle.ExRecordEvent.immuneDamageVal) then
		return 0
	end

	uv3 = "model"

	return slot3({
		...
	}, slot1)
end

function slot1.getDmgAllocateOverflow(slot0)
	return slot0.model:getEventByKey(battle.ExRecordEvent.allocateOverflow) or 0
end

function slot1.getCopyBuffCount(slot0)
	return slot0.model:getEventByKey(battle.ExRecordEvent.copySucessCount) or 0
end

function slot1.getTransferBuffCount(slot0)
	return slot0.model:getEventByKey(battle.ExRecordEvent.transferSucessCount) or 0
end

function slot1.chargeStateBeforeWave(slot0)
	return slot0.model:getEventByKey(battle.ExRecordEvent.chargeStateBeforeWave)
end

function slot1.getKillMeDamage(slot0, slot1)
	if slot0.model.killMeDamageValues then
		return slot0.model.killMeDamageValues:get(slot1)
	end

	return 0
end

function slot1.getRecordDamage(slot0, slot1, slot2)
	for slot7, slot8 in pairs(slot0.model.totalDamage) do
		if slot2 then
			if slot2 == slot8 then
				slot3 = 0 + slot8:get(slot1)
			end
		else
			slot3 = slot3 + slot8:get(slot1)
		end
	end

	return slot3
end

function slot1.getRecordResumeHp(slot0, slot1, slot2)
	for slot7, slot8 in pairs(slot0.model.totalResumeHp) do
		if slot2 then
			if slot2 == slot8 then
				slot3 = 0 + slot8:get(slot1)
			end
		else
			slot3 = slot3 + slot8:get(slot1)
		end
	end

	return slot3
end

function slot1.getRecordTakeDamage(slot0, slot1, slot2)
	return slot0.model:getTakeDamageRecord(slot1, slot2)
end

function slot1.getAllRecordTakeDamage(slot0, slot1, slot2, slot3)
	return slot0.model:getAllTakeDamageRecord(slot1, slot2, slot3)
end

function slot1.getMomentBuffDamage(slot0, slot1, slot2)
	return slot0.model:getEventByKey(battle.ExRecordEvent.momentBuffDamage, slot1) and slot3[slot2 or 1] or 0
end

function slot1.getRecordData(slot0, slot1)
	return slot0.model:getEventByKey(battle.ExRecordEvent[slot1]) or 0
end

function slot1.getRealPos(slot0)
	return slot0.model:getRealPos()
end

function slot1.getPlaySmallSkillCount(slot0)
	return slot0.model:getEventByKey(battle.MainSkillType.SmallSkill) or 0
end

function slot1.getAttackState(slot0)
	return slot0.model:getEventByKey(battle.ExRecordEvent.attackState) or 0
end

function slot1.getSkillSpellCountByType(slot0, slot1)
	return slot0.model:getEventByKey(slot1) or 0
end

function slot1.getSpecBuffSubkeySize(slot0, slot1, slot2, slot3)
	for slot9, slot10 in slot0.model:ipairsOverlaySpecBuff(slot1) do
		if (not slot3 or arraytools.hash(slot3 or {})[slot10.cfgId]) and slot10[slot2] and type(slot10[slot2]) == "table" then
			slot4 = 0 + table.length(slot10[slot2])
		end
	end

	return slot4
end

function slot1.getSpecBuffFuncVal(slot0, slot1, slot2, ...)
	return slot0.model:doOverlaySpecBuffFunc(slot1, slot2, ...) or 0
end

function slot1.getExAttackMode(slot0)
	return slot0.model:getExtraRoundMode() or 0
end

function slot1.getRowNums(slot0)
	return slot0.model.scene:getRowRemain(slot0.model.force, slot0.model:frontOrBack())
end

function slot1.getColumnNums(slot0)
	if slot0.model.seat % 3 == 0 then
		slot1 = 3
	end

	return slot0.model.scene:getColumnRemain(slot0.model.force, slot1)
end

function slot1.getImmuneVal(slot0, slot1)
	for slot6, slot7 in slot0.model:ipairsOverlaySpecBuff("immuneControlVal") do
		slot2 = slot7.refreshProb(0, slot1)
	end

	return slot2
end

function slot1.getFightPoint(slot0)
	return slot0.model.fightPoint
end

function slot1.getDelayDamage(slot0)
	return slot0.model:delayDamage()
end

function slot1.getSummonGroup(slot0)
	return slot0.model.summonGroup or 0
end

function slot1.getType(slot0)
	return slot0.model.type or 0
end

function slot1.isBackHeros(slot0)
	return slot0.model.scene:isBackHeros(slot0.model) ~= nil
end

function slot1.getGroupShieldCfgId(slot0)
	return slot0.model.cfgId or 0
end

function slot1.getCommandeerDataNum(slot0, slot1, slot2)
	slot3 = {}

	if not slot2 then
		slot3 = slot0.model:getEventByKey(battle.ExRecordEvent[slot1]) or {}
	else
		for slot7, slot8 in pairs(slot2) do
			for slot13, slot14 in pairs(slot0.model:getEventByKey(battle.ExRecordEvent[slot1], slot8) or {}) do
				table.insert(slot3, slot14)
			end
		end
	end

	return table.length(slot3)
end

for slot7, slot8 in pairs({
	Z = {
		79001,
		79002,
		79003,
		79004
	}
}) do
	for slot12, slot13 in ipairs(slot8) do
		slot1["flag" .. slot7 .. slot12] = functools.partial(function (slot0, slot1, slot2)
			return slot1.model:findTagSkill(slot0, slot2 == 1)
		end, slot13)
	end
end

function slot1.getControlPerVal(slot0, slot1)
	for slot6, slot7 in slot0.model:ipairsOverlaySpecBuff("controlPerVal") do
		slot2 = slot7.refreshProb(0, slot1)
	end

	return slot2
end

function slot1.atkSkillNature(slot0)
	return slot0:attackerSkill():getNatureType()
end

function slot1.eqATKNature(slot0, slot1)
	return slot0:attackerSkill():getNatureType() == slot1
end

function slot1.sTDmg(slot0)
	return slot0:curSkill():getTotalDamage()
end

for slot7, slot8 in pairs(ObjectAttrs.AttrsTable) do
	slot1["B" .. slot7] = function (slot0)
		uv3 = "model"

		return slot0.model:getBaseAttr(slot3)
	end

	slot1["A" .. slot7] = function (slot0)
		uv2 = "model"

		return slot0.model.attrs.buff[slot2]
	end

	slot1["BA" .. slot7] = function (slot0)
		uv3 = "model"

		return slot0.model:getRealFinalAttr(slot3)
	end

	slot1[slot7] = function (slot0)
		uv2 = "model"

		return slot0.model[slot2](slot0.model)
	end
end

battleCsv.exportToCsvCls(slot1, slot0)
