slot0 = class("AutoChessTrainerModel")
AutoChessBattle.Trainer = slot0

function slot0.ctor(slot0, slot1, slot2)
	slot0.scene = slot1
	slot0.hpTable = table.salttable({
		0
	})
	slot0.team = slot2
	slot0.skillCd = 0
	slot0.skillCost = 0
	slot0.shopFix = {}
	slot0.buffs = CMap.new(AutoChessBattle.AutoChessBuffModel.BuffCmp)
	slot0.buffOverlayCount = {}
	slot0.isTrainer = true
	slot0.takeEffectEvents = {}
	slot0.level = 1
	slot0.exRecordNameTb = {}
	slot0.totalLostHP = 0
	slot0.extraRecord = BattleExRecord.new()

	battleComponents.bind(slot0, "Event")
	slot0:setListenerComparer(AutoChessBattle.AutoChessBuffModel.BuffCmp)
	AutoChessEasy.registImmune(slot0)
end

function slot0.init(slot0, slot1)
	slot0:resetRole(slot1.trainer)

	slot0.skills = slot1.skills
end

function slot0.triggerBuffOnPoint(slot0, slot1, slot2)
	if slot0.components_.Event.listeners_[slot1] then
		slot3.array = nil
	end

	slot0:dispatchEvent(slot1, slot2)
end

function slot0.resetRole(slot0, slot1)
	slot0:reset()

	slot0.cfg = csvClone(csv.auto_chess.trainer[slot1])

	slot0:setHP(slot0.cfg.hp[slot0.level])

	if slot0.team == 1 then
		slot0.scene:setGold(slot0.cfg.gold)
	end

	slot0:updateHeadImg()
end

function slot0.updateHeadImg(slot0)
	slot1 = nil

	gRootViewProxy:notify("updateTrainerRole", slot0.cfg.name, (slot0.cfg.figureID == "0" or slot0.cfg.figureID == 0 or csv.role_figure[slot0.cfg.figureID].logo) and csv.unit[slot0.cfg.unitID].icon, slot0.team)
end

function slot0.resetSkill(slot0, slot1)
	slot0.toSelectSkills = nil
	slot0.skillCd = 0
	slot0.skillId = slot1
	slot0.skillCfg = csvClone(csv.auto_chess.trainer_skills[slot1])

	assert(slot0.skillCfg, string.format("no skillCfg id: %s", slot1))

	slot0.skillCost = slot0.skillCfg.cost
	slot0.skillType = slot0.skillCfg.type

	gRootViewProxy:notify("updateTrainerSkill", slot1, slot0.skillType, slot0.team, slot0.skillCost)

	if slot0.skillType == lushi.TrainerSKillType.passiveSkill then
		slot0:useSkill()
	end
end

function slot0.getSkillCD(slot0)
	return slot0.skillCd
end

function slot0.checkCd(slot0)
	if slot0.skillCd > 0 then
		return false
	end

	return true
end

function slot0.canUseBase(slot0, slot1)
	function slot2(...)
		uv0 = "gRootViewProxy"

		if slot0 then
			return
		end

		gRootViewProxy:proxy():showTip(...)
	end

	if not slot0.skillId then
		return false
	end

	if slot0.skillType == lushi.TrainerSKillType.passiveSkill then
		return false
	end

	if not slot0:checkCd() then
		slot2(gLanguageCsv.autoChessNoCD)

		return false, lushi.SkillCheck.CD, slot0:getSkillCD()
	end

	if slot0.scene:getGoldNum() < slot0.skillCost then
		slot2(gLanguageCsv.autoChessNoGold)

		return false, lushi.SkillCheck.gold
	end

	return true
end

function slot0.canUseSkill(slot0, slot1)
	if not slot0:canUseBase() then
		return false
	end

	if slot0.skillType == lushi.TrainerSKillType.buttonSkill then
		return true
	elseif slot0.skillType == lushi.TrainerSKillType.selectSkill then
		if not slot0.scene:getObject(slot1) or not slot2:isInEmbattle() then
			return false
		end

		return slot2:runFilterTarget(slot0.skillCfg.filterTarget, slot2)
	end

	return false
end

function slot0.useSkill(slot0, slot1)
	slot0.skillCd = slot0.skillCd + slot0.skillCfg.cd

	if slot0.skillCost > 0 then
		slot0.scene:useGold(slot0.skillCost)
	end

	if slot0.skillType == lushi.TrainerSKillType.selectSkill then
		slot0:addSkillBuff(slot0.skillCfg.findBuff, slot0.scene:getObject(slot1))
	end

	slot0:addSkillBuff(slot0.skillCfg.buff, slot0)
	gRootViewProxy:notify("updateSkillState")
end

function slot0.addSkillBuff(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot1) do
		slot9 = AutoChessBattle.addBuffToHero(slot7, slot2, slot0, {
			value = 0
		})
	end
end

function slot0.updateSkillCd(slot0, slot1)
	slot0.skillCd = math.max(slot0.skillCd + slot1, 0)

	gRootViewProxy:notify("updateSkillState")
end

function slot0.hp(slot0)
	return slot0.hpTable[1]
end

function slot0.setHP(slot0, slot1)
	slot0.hpTable[1] = math.max(slot1, 0)
	slot2 = slot0:hp()

	AutoChessEasy.queueEffect(function ()
		uv3 = "gRootViewProxy"
		uv4 = "notify"

		gRootViewProxy:notify("updateTrainerHp", slot3, slot4.team)
	end)
end

function slot0.beAttack(slot0, slot1, slot2)
	if not (slot2 or {}).ignoreReduce then
		slot1 = math.max(math.ceil(slot1) - (slot0:getEventByKey(lushi.ExRecordEvent.trainerReduceDamage) or 0), 0)
	end

	AutoChessEasy.queueEffect(function ()
		uv3 = "gRootViewProxy"
		uv6 = "notify"

		gRootViewProxy:notify("trainerHeadNum", slot3.team, {
			data = "-" .. slot6,
			pathName = lushi.DamageTextName.trainer
		})
	end)
	slot0:setHP(slot0:hp() - slot1)

	if not slot2.ingoreTrigger then
		slot0.scene:updateAllObjsBuff(lushi.BuffTriggerPoint.onTrainerTakeDamage, {
			trainer = slot0,
			lostHp = slot1
		})
	end

	slot0.totalLostHP = slot0.totalLostHP + slot1

	if slot0:hp() <= 0 then
		AutoChessEasy.queueEffect(function ()
			uv3 = "gRootViewProxy"

			gRootViewProxy:notify("trainerDead", slot3.team)
		end)

		if slot0.team == 1 then
			slot0.scene:gameOver("fail")
		end
	end

	return slot1
end

function slot0.resumeHp(slot0, slot1)
	slot0:setHP(slot0:hp() + math.ceil(slot1))
	AutoChessEasy.queueEffect(function ()
		uv3 = "gRootViewProxy"
		uv6 = "notify"

		gRootViewProxy:notify("trainerHeadNum", slot3.team, {
			isHeal = true,
			data = "+" .. slot6,
			pathName = lushi.HealTextName
		})
	end)
end

function slot0.setCsvObject(slot0, slot1)
	slot0.csvObject = slot1
end

function slot0.iterBuffs(slot0)
	return slot0.buffs:order_pairs()
end

function slot0.changeShopFix(slot0, slot1, slot2)
	if not slot0.shopFix[slot1] then
		slot0.shopFix[slot1] = {
			0,
			0,
			0
		}
	end

	for slot6, slot7 in ipairs(slot2) do
		slot0.shopFix[slot1][slot6] = slot0.shopFix[slot1][slot6] + slot7
	end
end

function slot0.getShopFix(slot0, slot1, slot2)
	if not slot0.shopFix[slot1] then
		return 0
	end

	return slot0.shopFix[slot1][slot2] or 0
end

function slot0.findSkill(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.skills) do
		if slot6 ~= slot0.skillId then
			table.insert(slot1, slot6)
		end
	end

	for slot5 = 0, table.length(slot1) - 3 - 1 do
		slot6 = table.length(slot1)
		slot1[ymrand.random(1, slot6)] = slot1[slot6]

		arraytools.pop(slot1)
	end

	if table.length(slot1) == 0 then
		return
	end

	slot0.toSelectSkills = slot1

	gRootViewProxy:proxy():showFindSkill(true, slot1)
end

function slot0.reset(slot0)
	for slot4, slot5 in slot0.buffs:order_pairs() do
		slot5:overClean()
	end

	slot0.hpTable = table.salttable({
		0
	})
	slot0.skillCd = 0
	slot0.shopFix = {}

	slot0.buffs:clear(AutoChessBattle.AutoChessBuffModel.BuffCmp)

	slot0.buffOverlayCount = {}
	slot0.isTrainer = true
	slot0.takeEffectEvents = {}
	slot0.extraRecord = BattleExRecord.new()
	slot0.totalLostHP = 0
	slot0.exRecordNameTb = {}

	slot0:addExRecord(lushi.ExRecordEvent.trainerWeight, {
		{},
		{}
	})

	slot0.skills = nil
	slot0.cfg = nil
	slot0.skillId = nil
	slot0.skillCfg = nil
	slot0.skillType = nil

	gRootViewProxy:notify("updateTrainerHp", slot0:hp(), slot0.team)
	gRootViewProxy:notify("updateTrainerSkill", nil, , slot0.team)
end

function slot0.getBuffIcon(slot0)
	return slot0.cfg.name
end

function slot0.baseDamage(slot0)
	return slot0.cfg and slot0.cfg.baseDamage or 0
end

function slot0.getBuff(slot0, slot1)
	for slot5, slot6 in slot0.buffs:order_pairs() do
		if slot6.cfgId == slot1 then
			return slot6
		end
	end
end

function slot0.hasBuff(slot0, slot1)
	return slot0:getBuff(slot1) ~= nil
end

function slot0.hasBuffGroup(slot0, slot1)
	for slot5, slot6 in slot0.buffs:order_pairs() do
		if itertools.include(slot6:group(), slot1) then
			return true
		end
	end
end

function slot0.getBuffOverlayCount(slot0, slot1)
	if not slot0:getBuff(slot1) then
		return 0
	end

	return slot2:getOverLayCount()
end

function slot0.checkOverlaySpecBuffExit(slot0)
	return false
end

function slot0.ipairsOverlaySpecBuff(slot0)
	return function ()
		return nil
	end
end

function slot0.onPenetrate(slot0)
end

function slot0.addExRecord(slot0, slot1, slot2, ...)
	slot0.extraRecord:addExRecord(slot1, slot2, slot0:getEventMainKey(), ...)

	slot0.exRecordNameTb[slot1] = true
end

function slot0.getEventByKey(slot0, slot1, ...)
	return slot0.extraRecord:getEventByKey(slot1, slot0:getEventMainKey(), ...)
end

function slot0.cleanEventByKey(slot0, slot1, ...)
	return slot0.extraRecord:cleanEventByKey(slot1, slot0:getEventMainKey(), ...)
end

function slot0.getEventMainKey(slot0)
	return "trainer" .. slot0.team
end

function slot0.isDeath(slot0)
	return slot0:hp() <= 0
end

function slot0.isInEmbattle(slot0)
	return true
end

require("lushi_battle.models.trainer_pack")
