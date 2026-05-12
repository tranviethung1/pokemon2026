slot0 = class("AutoChessBuffModel")
AutoChessBattle.AutoChessBuffModel = slot0

function slot1(slot0)
	table.sort(slot0, function (slot0, slot1)
		return slot1.tag < slot0.tag
	end)

	for slot5 = 1, table.length(slot0) do
		slot7 = slot0[slot5].buff

		for slot11 = slot5 + 1, slot1 do
			slot12 = slot0[slot11]
			slot13 = slot12.buff

			if slot6.tag == slot12.tag then
				slot7.bondToOtherBuffsTb[slot13.id] = true
				slot13.bondToOtherBuffsTb[slot7.id] = true
			end

			if math.floor(slot6.tag) - math.floor(slot12.tag) == 1 then
				slot7.bondChildBuffsTb[slot13.id] = true
			end
		end
	end
end

function slot0.BuffCmp(slot0, slot1)
	if slot0.triggerPriority ~= slot1.triggerPriority then
		return slot0.triggerPriority < slot1.triggerPriority
	end

	slot2 = 999
	slot4 = slot1.caster and slot1.caster.seat or slot2

	if ((slot0.caster and slot0.caster.seat or slot2) ~= slot2 or slot4 ~= slot2) and slot3 ~= slot4 then
		return slot3 < slot4
	end

	if (slot0.holder and slot0.holder.seat or slot2) ~= (slot1.holder and slot1.holder.seat or slot2) then
		return slot5 < slot6
	end

	return slot0.id < slot1.id
end

function slot0.ctor(slot0, slot1, slot2, slot3, slot4)
	if slot2 and slot2.scene then
		slot2.scene.buffIDCounter = slot2.scene.buffIDCounter + 1
		slot0.id = slot2.scene.buffIDCounter
	else
		slot0.id = -1
	end

	slot0.cfgId = slot1
	slot0.csvCfg = csvClone(csv.auto_chess.buff[slot1])
	slot0.triggerPriority = slot0.csvCfg and slot0.csvCfg.triggerPriority or 10
	slot0.caster = slot3
	slot0.holder = slot2
	slot0.args = slot4
	slot0.isInited = false
	slot0.isOver = false
	slot0.isEffect = false
	slot0.buffValue = nil
	slot0.value = nil
	slot0.doEffectValue = nil
	slot0.isNumberType = true
	slot0.lifeRounds = {}
	slot0.objThatTriggeringMeNow = nil
	slot0.objTriggerVec = CVector.new()
	slot0.triggerEnv = {}
	slot0.triggerAddAttrTb = {}
	slot0.bondChildBuffsTb = {}
	slot0.bondToOtherBuffsTb = {}
	slot0.castBuffGroupStack = CList.new()
	slot0.exRecordNameTb = {}
	slot0.castBuffEnvAdded = false
	slot0.castBuffGroup = CList.new()
	slot0.extraRecord = BattleExRecord.new()
	slot0.effectBuffData = nil
end

function slot0.getTobeDispeledBuffs(slot0, slot1, slot2)
	if table.length(slot2) > 0 then
		table.sort(slot2, function (slot0, slot1)
			return slot0.id < slot1.id
		end)

		for slot8, slot9 in ipairs(slot2) do
			slot9:BeDispel((slot0.csvCfg.dispelType[3] or 0) == 0, slot0.csvCfg.dispelType[4] or lushi.BuffOverType.dispel)
		end

		slot0:triggerByMoment(lushi.BuffTriggerPoint.onBuffTrigger)

		slot1 = true
		slot2 = {}
	end

	return slot1, slot2
end

function slot0.getDipelBuffsByCfg(slot0)
	slot1 = {}
	slot2 = slot0.csvCfg.dispelBuff
	slot3 = slot0.csvCfg.dispelType[2] or 0
	slot4 = nil
	slot4 = (slot0.csvCfg.dispelType[1] ~= 1 or function (slot0)
		uv2 = "id"

		if slot0.id ~= slot2.id then
			uv2 = "itertools"
			slot1 = itertools.include(slot2, slot0.cfgId)
		else
			slot1 = false
		end

		return slot1
	end) and function (slot0)
		uv2 = "id"

		if slot0.id == slot2.id then
			return false
		end

		for slot4, slot5 in ipairs(slot0:group()) do
			uv7 = "ipairs"

			if itertools.include(slot7, slot5) then
				return true
			end
		end

		return false
	end

	for slot9, slot10 in slot0.holder:iterBuffs() do
		if slot3 > 0 and slot3 < 0 then
			break
		end

		if slot4(slot10) then
			table.insert(slot1, slot10)

			slot5 = slot5 + 1
		end
	end

	return slot1
end

function slot0.dispelGroupBuff(slot0)
	if not slot0.isInited then
		return
	end

	slot0.dispelCount = 0
	slot1 = slot0.csvCfg.dispelBuff
	slot4, slot3 = slot0:getTobeDispeledBuffs(false, slot0:getDipelBuffsByCfg())

	return slot4
end

function slot0.init(slot0)
	if slot0.isOver then
		return
	end

	if slot0.isInited then
		return
	end

	slot0.scene = slot0.holder.scene
	slot0.nodeManager = AutoChessBattle.BuffNodeManager.new(slot0)
	slot0.protectedEnv = AutoChessCsv.makeProtectedEnv(slot0.caster, nil, slot0)
	slot0.source = slot0.args.source
	slot0.overlayCount = slot0.args.overlayCount or 1
	slot0.overlayType = slot0.csvCfg.overlayType
	slot0.time = slot0.csvCfg.time
	slot0.isAura = slot0.csvCfg.easyEffectFunc == "auraEffect"
	slot0.subAuraId = slot0.args.subAuraId
	slot0.isInited = true

	log.chess.buff_c.init_c({
		buff = slot0,
		caster = slot0.caster,
		holder = slot0.holder
	})

	slot0.buffValue = clone(slot0:cfg2Value(slot0.args.value))

	slot0:setValue(slot0.buffValue)
	battleComponents.bind(slot0, "Event")
	slot0.nodeManager:init(slot0.csvCfg.triggerBehaviors)
	slot0:initTriggerEvents()

	if slot0.overlayType == lushi.BuffOverlayType.Coexist then
		if not slot0.holder.buffOverlayCount[slot0.cfgId] then
			slot0.holder.buffOverlayCount[slot0.cfgId] = 0
		end

		slot0.holder.buffOverlayCount[slot0.cfgId] = slot0.holder.buffOverlayCount[slot0.cfgId] > 0 and slot0.holder.buffOverlayCount[slot0.cfgId] or 1
	end

	if slot0.isAura then
		slot0.scene:insertAuraBuff(slot0.id, slot0)

		if slot0.holder.isTrainer or slot0.holder:isInEmbattle() then
			slot0.scene:tirggerAuraBuffs(nil, slot0)
		end
	end

	slot0.holder:onBuffImmuneChange(slot0)
	slot0:dispelGroupBuff()
	slot0:triggerByMoment(lushi.BuffTriggerPoint.onBuffCreate)

	if slot0.csvCfg.isShow then
		slot1 = slot0.holder
		slot2 = slot0:getBuffEffectAniArgs()

		AutoChessEasy.queueEffect(function ()
			uv0 = "view"
			slot0 = slot0.view:proxy()
			slot0 = slot0.playBuffAniEffect
			uv2 = "proxy"

			slot0(slot0, slot2)

			uv0 = "view"
			uv2 = "proxy"

			slot0.view:proxy():playBuffOnceEffect(slot2)
		end)
	end
end

function slot0.BeDispel(slot0, slot1, slot2)
	if slot1 then
		return slot0:over({
			endType = slot2
		})
	end

	if slot0.overlayType == lushi.BuffOverlayType.Overlay then
		if slot0.overlayCount == 1 then
			return slot0:over({
				endType = slot2
			})
		end

		slot0:refresh(slot0.args, -1)
	end
end

function slot0.cfg2ValueWithTrigger(slot0, slot1)
	slot0.protectedEnv = AutoChessCsv.fillFuncEnv(slot0.protectedEnv, {
		trigger = slot0.triggerEnv
	})

	slot0.protectedEnv:resetEnv()

	return slot0:cfg2Value(slot1)
end

function slot0.cfg2Value(slot0, slot1)
	return slot0.cfg2ValueWithEnv(slot1, slot0.protectedEnv, slot0.castBuffEnvAdded)
end

function slot0.cfg2ValueWithEnv(slot0, slot1, slot2)
	if not slot0 then
		return
	end

	if type(slot0) == "table" then
		for slot7, slot8 in csvMapPairs(slot0) do
			if slot7 == "input" or slot7 == "process" then
				-- Nothing
			else
				uv9 = "type"
				slot3[slot7] = slot9.cfg2ValueWithEnv(slot8, slot1, slot2)
			end
		end

		return {
			[slot7] = slot8
		}
	end

	if ObjectAttrs.AttrsTable[slot0] then
		return slot0
	end

	if (string.find(slot0, "target2") or string.find(slot0, "self2")) and not slot2 then
		return slot0
	end

	return AutoChessCsv.doFormula(slot0, slot1)
end

function slot0.setValue(slot0, slot1)
	slot0.buffValue = slot1
	slot0.value = slot0:getValue()
	slot0.isNumberType = type(slot0.buffValue) == "number"
end

function slot0.getValue(slot0)
	if not slot0.buffValue then
		return
	end

	return slot0.value or clone(slot0.buffValue)
end

function slot0.initTriggerEvents(slot0)
	for slot5, slot6 in pairs(table.deepcopy(slot0.nodeManager.points)) do
		slot0:subscribeEvent(slot0.holder, slot5, "onTriggerEvent")
	end
end

function slot0.triggerPrecheck(slot0)
	if table.get(slot0, "objThatTriggeringMeNow", "source") == slot0.id then
		return false
	end

	return true
end

function slot0.triggerByMoment(slot0, slot1, slot2)
	slot0.objTriggerVec:push_back({
		triggerPoint = slot1,
		trigger = slot2
	})
	slot0:setObjTrigger()
	slot0.nodeManager:visitNodeByPoint(slot1, function (slot0, slot1)
		uv2 = "triggerByNode"

		slot2:triggerByNode(slot0)
	end)
	slot0.objTriggerVec:pop_back()
	slot0:setObjTrigger()
end

function slot0.setObjTrigger(slot0)
	slot1, slot2 = nil

	if slot0.objTriggerVec:back() then
		slot1 = slot3.triggerPoint
		slot2 = slot3.trigger
	end

	slot0.objThatTriggeringMeNow = slot2

	slot0:fillTriggerEnv(slot1)
end

function slot0.triggerByNode(slot0, slot1)
	if slot0:triggerPrecheck() and slot0.nodeManager:check(slot1) then
		slot0:takeEffect(slot1)
	end
end

function slot0.onTriggerEvent(slot0, slot1)
	if slot0:isTrigger(slot1.name, slot1.args) then
		slot0:updateWithTrigger(slot2, slot3)

		if slot0.holder:getOverlaySpecBuffByIdx(lushi.OverlaySpecBuff.addTriggerTimes) and slot4:getG("pointTime")[slot2] ~= nil then
			for slot9 = 1, slot5[slot2] do
				slot0:updateWithTrigger(slot2, slot3)
			end
		end
	end
end

function slot0.isTrigger(slot0, slot1, slot2)
	if slot1 == lushi.BuffTriggerPoint.onBuffTrigger then
		return slot0.id == slot2.buffId
	end

	return slot0.nodeManager:isTriggerPointExist(slot1)
end

function slot0.updateWithTrigger(slot0, slot1, slot2)
	slot0:update(slot1, slot2)
end

function slot0.update(slot0, slot1, slot2)
	if slot0.isOver then
		return
	end

	if not slot0.holder then
		slot0:overClean()

		return
	end

	slot0:triggerByMoment(slot1, slot2)
end

function slot0.fillTriggerEnv(slot0, slot1)
	slot0.triggerEnv = {}

	if tj.type(slot0.objThatTriggeringMeNow) == "table" then
		for slot5, slot6 in pairs(slot0.objThatTriggeringMeNow) do
			if AutoChessCsv.Model2CsvCls[tj.type(slot6)] then
				slot0.triggerEnv[slot5] = slot7.new(slot6)
			else
				slot0.triggerEnv[slot5] = slot6
			end
		end
	elseif AutoChessCsv.Model2CsvCls[tj.type(slot0.objThatTriggeringMeNow)] then
		slot0.triggerEnv = slot2.new(slot0.objThatTriggeringMeNow)
	else
		slot0.triggerEnv = slot0.objThatTriggeringMeNow
	end
end

function slot0.overClean(slot0, slot1)
	slot1 = slot1 or {}
	slot1.endType = lushi.BuffOverType.clean

	slot0:over(slot1)
end

function slot0.over(slot0, slot1)
	if slot0.isOver then
		return
	end

	slot0.isOver = true

	log.chess.buff_c.over_c({
		buff = slot0,
		holder = slot0.holder,
		params = slot1
	})

	slot1 = slot1 or {}
	slot1.endType = slot1.endType or lushi.BuffOverType.normal

	if slot0.csvCfg.easyEffectFunc and slot0.isEffect then
		slot0.overType = slot1.endType

		slot0:doEffect(slot0.csvCfg.easyEffectFunc, slot0.doEffectValue, true)
	end

	if slot1.endType ~= lushi.BuffOverType.clean then
		slot0:triggerByMoment(lushi.BuffTriggerPoint.onBuffOver)

		if slot0.args.bindEvent then
			slot0.scene:removeEventCard(slot0.args.bindEvent)
		end
	end

	slot0.triggerAddAttrTb = {}

	if slot0.overlayType == lushi.BuffOverlayType.Coexist then
		if not slot0.holder.buffOverlayCount[slot0.cfgId] then
			slot0.holder.buffOverlayCount[slot0.cfgId] = 0
		else
			slot0.holder.buffOverlayCount[slot0.cfgId] = slot0.holder.buffOverlayCount[slot0.cfgId] - 1
		end
	end

	slot0:overBuffsInTable(slot0.bondChildBuffsTb, slot1)
	slot0:overBuffsInTable(slot0.bondToOtherBuffsTb, slot1)

	if slot0.isAura then
		slot0.scene:cleanSubArua(slot0.id)
	end

	if slot0.csvCfg.isShow then
		slot2 = slot0.holder

		AutoChessEasy.queueEffect(function ()
			uv0 = "view"
			uv2 = "proxy"

			slot0.view:proxy():onDeleteBuffEffect(slot2:getBuffEffectAniArgs())
		end)
	end

	for slot5, slot6 in pairs(slot0.exRecordNameTb) do
		slot0:cleanEventByKey(slot5)
	end

	slot0.holder:onBuffImmuneChange(slot0, true)
	battleComponents.unbindAll(slot0)
	slot0.holder.buffs:erase(slot0.id)
	slot0.scene:eraseBuff(slot0.id)
end

function slot0.attach(slot0)
	battleComponents.bind(slot0, "Event")
	slot0.nodeManager:init(slot0.csvCfg.triggerBehaviors)
	slot0:initTriggerEvents()

	if slot0.overlayType == lushi.BuffOverlayType.Coexist then
		if not slot0.holder.buffOverlayCount[slot0.cfgId] then
			slot0.holder.buffOverlayCount[slot0.cfgId] = 0
		end

		slot0.holder.buffOverlayCount[slot0.cfgId] = slot0.holder.buffOverlayCount[slot0.cfgId] > 0 and slot0.holder.buffOverlayCount[slot0.cfgId] or 1
	end

	if slot0.isAura then
		slot0.scene:insertAuraBuff(slot0.id, slot0)

		if slot0.holder.isTrainer or slot0.holder:isInEmbattle() then
			slot0.scene:tirggerAuraBuffs(nil, slot0)
		end
	end

	slot0.holder:onBuffImmuneChange(slot0)
	slot0:triggerByMoment(lushi.BuffTriggerPoint.onBuffCreate)

	if slot0.csvCfg.isShow then
		slot1 = slot0.holder
		slot2 = slot0:getBuffEffectAniArgs()

		AutoChessEasy.queueEffect(function ()
			uv0 = "view"
			slot0 = slot0.view:proxy()
			slot0 = slot0.playBuffAniEffect
			uv2 = "proxy"

			slot0(slot0, slot2)

			uv0 = "view"
			uv2 = "proxy"

			slot0.view:proxy():playBuffOnceEffect(slot2)
		end)
	end
end

function slot0.detach(slot0)
	if slot0.csvCfg.easyEffectFunc and slot0.isEffect then
		slot0:doEffect(slot0.csvCfg.easyEffectFunc, slot0.doEffectValue, true)
	end

	if slot0.overlayType == lushi.BuffOverlayType.Coexist then
		if not slot0.holder.buffOverlayCount[slot0.cfgId] then
			slot0.holder.buffOverlayCount[slot0.cfgId] = 0
		else
			slot0.holder.buffOverlayCount[slot0.cfgId] = slot0.holder.buffOverlayCount[slot0.cfgId] - 1
		end
	end

	slot0:overBuffsInTable(slot0.bondChildBuffsTb, params)
	slot0:overBuffsInTable(slot0.bondToOtherBuffsTb, params)

	if slot0.isAura then
		slot0.scene:cleanSubArua(slot0.id)
	end

	if slot0.csvCfg.isShow then
		slot1 = slot0.holder

		AutoChessEasy.queueEffect(function ()
			uv0 = "view"
			uv2 = "proxy"

			slot0.view:proxy():onDeleteBuffEffect(slot2:getBuffEffectAniArgs())
		end)
	end

	for slot4, slot5 in pairs(slot0.exRecordNameTb) do
		slot0:cleanEventByKey(slot4)
	end

	slot0.holder:onBuffImmuneChange(slot0, true)
	battleComponents.unbindAll(slot0)
	slot0.holder.buffs:erase(slot0.id)
	slot0.scene:eraseBuff(slot0.id)
end

function slot0.takeEffect(slot0, slot1)
	slot2 = slot0.nodeManager:trigger(slot1)
	slot3 = nil

	if slot1 == lushi.BuffTriggerPoint.onNodeCall then
		if slot0.csvCfg.easyEffectFunc then
			slot0.value = slot0:getValue()
			slot0.doEffectValue = clone(slot0.value)
			slot3 = slot0:doEffect(slot0.csvCfg.easyEffectFunc, slot0.value)
		end
	else
		slot0.castBuffGroupStack:push_back(cache.newTable())

		for slot7, slot8 in ipairs(slot2.effectFuncs or {}) do
			slot9 = slot0:cfg2ValueWithTrigger(slot2.funcArgs[slot7])
			slot9.originArgs = slot2.funcArgs[slot7]
			slot3 = slot0:doEffect(slot8, slot9)
		end

		for slot7, slot8 in pairs(slot0.castBuffGroupStack:back()) do
			uv9 = "nodeManager"

			slot9(slot8)
		end

		slot0.castBuffGroupStack:pop_back()
	end

	slot0.isEffect = true

	slot0.nodeManager:onTriggerEnd(slot1, slot3)
end

function slot0.setCsvObject(slot0, slot1)
	slot0.csvObject = slot1
end

function slot0.getCsvObject(slot0)
	return slot0.csvObject
end

function slot0.refresh(slot0, slot1, slot2)
	slot2 = slot1.overlayCount or slot2 or 0

	if slot0.overlayType == nil then
		return
	end
end

function slot0.updateLifeRound(slot0, slot1)
	if slot0.time == lushi.ImmotalBuffTime then
		return
	end

	slot0.time = slot0.time + slot1

	if slot0.time <= 0 then
		slot0:over()
	end
end

function slot0.getOverLayCount(slot0)
	if slot0.overlayType == lushi.BuffOverlayType.Coexist then
		return slot0.holder.buffOverlayCount[slot0.cfgId]
	end

	return slot0.overlayCount
end

function slot2(slot0)
	slot2 = {}

	for slot6, slot7 in slot0.scene:getHerosMap(slot0.team):order_pairs() do
		if slot7 and not slot7:isDeath() then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot3(slot0)
	slot2 = {}

	for slot6, slot7 in slot0.scene:getHerosMap(3 - slot0.team):order_pairs() do
		if slot7 and not slot7:isDeath() then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot4(slot0, slot1)
	slot2 = {}
	slot3, slot4 = nil

	for slot8, slot9 in ipairs(slot1) do
		if slot9.seat < slot0.seat then
			slot3 = slot9
		end

		if slot0.seat < slot9.seat then
			slot4 = slot9

			break
		end
	end

	if slot3 then
		table.insert(slot2, slot3)
	end

	if slot4 then
		table.insert(slot2, slot4)
	end

	return slot2
end

function slot5(slot0)
	if not slot0:isInEmbattle() then
		return {}
	end

	slot3 = 1

	for slot8, slot9 in slot0.scene:getHerosMap(slot0.team):order_pairs() do
		if slot9.id == slot0.id then
			selfseat = 0 + 1
		end
	end

	slot7 = slot4:getHerosMap(3 - slot0.team)

	for slot13, slot14 in slot7:order_pairs() do
		if math.abs(selfseat - (slot2 + 1) / 2 - (0 + 1 - (slot7:size() + 1) / 2)) < 100 then
			slot1 = {
				slot14
			}
			slot6 = slot16
		elseif slot16 == slot6 then
			table.insert(slot1, slot14)
		end
	end

	return slot1
end

slot6 = {
	[lushi.BuffExtraTargetType.holder] = function (slot0)
		return {
			slot0.holder
		}
	end,
	[lushi.BuffExtraTargetType.caster] = function (slot0)
		return {
			slot0.caster
		}
	end,
	[lushi.BuffExtraTargetType.trainer] = function (slot0)
		return {
			slot0.scene.trainer[slot0.holder.team]
		}
	end,
	[lushi.BuffExtraTargetType.holderForce] = function (slot0)
		uv1 = "holder"

		return slot1(slot0.holder)
	end,
	[lushi.BuffExtraTargetType.casterForce] = function (slot0)
		uv1 = "caster"

		return slot1(slot0.caster)
	end,
	[lushi.BuffExtraTargetType.holderEnemyForce] = function (slot0)
		uv1 = "holder"

		return slot1(slot0.holder)
	end,
	[lushi.BuffExtraTargetType.casterEnemyForce] = function (slot0)
		uv1 = "caster"

		return slot1(slot0.caster)
	end,
	[lushi.BuffExtraTargetType.attacker] = function (slot0)
		return {
			slot0.scene.play.curHero
		}
	end,
	[lushi.BuffExtraTargetType.target] = function (slot0)
		return {
			slot0.scene.play.curHero and slot1.curTarget
		}
	end,
	[lushi.BuffExtraTargetType.killHolder] = function (slot0)
		return {
			slot0.holder.attackMeDeadObj
		}
	end,
	[lushi.BuffExtraTargetType.killTargetNear] = function (slot0)
		slot1 = slot0.objThatTriggeringMeNow.target
		uv2 = "objThatTriggeringMeNow"
		uv4 = "target"

		return slot2(slot1, slot4(slot1))
	end,
	[lushi.BuffExtraTargetType.damageOrHealSource] = function (slot0)
		return {
			slot0.holder.objThatTriggeringMeNow
		}
	end,
	[lushi.BuffExtraTargetType.nearHolder] = function (slot0)
		uv1 = "holder"
		uv3 = "holder"

		return slot1(slot0.holder, slot3(slot0.holder))
	end,
	[lushi.BuffExtraTargetType.nearHolderEnemy] = function (slot0)
		uv1 = "holder"

		return slot1(slot0.holder)
	end,
	[lushi.BuffExtraTargetType.nearCaster] = function (slot0)
		uv1 = "holder"
		uv3 = "caster"

		return slot1(slot0.holder, slot3(slot0.caster))
	end,
	[lushi.BuffExtraTargetType.nearCasterEnemy] = function (slot0)
		uv1 = "caster"

		return slot1(slot0.caster)
	end,
	[lushi.BuffExtraTargetType.enemytrainer] = function (slot0)
		return {
			slot0.scene.trainer[3 - slot0.holder.team]
		}
	end,
	[lushi.BuffExtraTargetType.triggerObject] = function (slot0)
		return {
			slot0.objThatTriggeringMeNow.obj
		}
	end
}

function slot0.getObjectsByCfg(slot0, slot1)
	if type(slot1) == "number" then
		uv3 = "type"

		if slot3[slot1] then
			return slot3(slot0)
		else
			return {}
		end
	elseif slot2 == "table" then
		if slot1.input and slot1.process then
			return AutoChessBattle.newTargetFinder(slot0.caster, slot0.holder, nil, {
				trigger = slot0.triggerEnv
			}, slot1)
		end
	else
		return slot0:cfg2ValueWithTrigger(slot1)
	end
end

function slot0.onSomeFlag(slot0, slot1)
	for slot6, slot7 in ipairs(slot1) do
		slot2 = true and slot0:cfg2ValueWithTrigger(slot7)
	end

	return slot2
end

function slot0.group(slot0)
	return slot0.csvCfg.group
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
	if not slot0.extraRecordKey then
		slot0.extraRecordKey = "b" .. slot0.id .. "o" .. slot0.holder.id
	end

	return slot0.extraRecordKey
end

function slot0.getBuffEffectAniArgs(slot0)
	return {
		id = slot0.id,
		cfgId = slot0.cfgId,
		overlayCount = slot0:getOverLayCount(),
		csvCfg = csv.auto_chess.special_effect[slot0.csvCfg.specialEffect[slot0.holder.unitID] or slot0.csvCfg.specialEffect[0]],
		aniSelectId = slot0:getEffectAniSelectId()
	}
end

function slot0.getEffectAniSelectId(slot0)
	return 1
end

function slot0.overBuffsInTable(slot0, slot1, slot2)
	if itertools.isempty(slot1) then
		return
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot1) do
		table.insert(slot3, slot7)
	end

	table.sort(slot3)

	for slot7, slot8 in ipairs(slot3) do
		if slot0.scene:eraseBuff(slot8) then
			slot9:overClean()
		end
	end
end
