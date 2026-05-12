slot0 = class("AutoChessSceneModel")
AutoChessBattle.SceneModel = slot0

function slot1(slot0, slot1)
	return slot0.seat < slot1.seat
end

function slot0.ctor(slot0)
	slot0.framesInScene = 0
	slot0.logicFrame = 0
	slot0.guideFrame = -1
	slot0.guideExtraOperate = 0
	slot0.updateResumeStack = {}
	slot0.herosOrder = nil
	uv2 = "framesInScene"
	slot0.heros = CMap.new(slot2)
	uv2 = "framesInScene"
	slot0.enemyHeros = CMap.new(slot2)
	slot0.allObjects = CMap.new(function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0.trainer = {}
	slot0.handCards = {}
	slot0.deadObjsToBeDeleted = {}
	slot0.findWaitList = {}
	slot0.findCards = {}
	slot0.riseStarObjs = CVector.new()
	slot0.gainCardObjIDs = CVector.new()
	slot0.needToDelBuffIDs = {}
	slot0.allBuffs = CMap.new(AutoChessBattle.AutoChessBuffModel.BuffCmp)
	slot0.auraBuffs = CMap.new(AutoChessBattle.AutoChessBuffModel.BuffCmp)
	slot0.extraRecord = BattleExRecord.new()
	slot0.fightBackUp = {
		[lushi.ObjectReadyState.hand] = {},
		[lushi.ObjectReadyState.embattle] = {}
	}
	slot0.fightGainCards = {}
	slot0.goldNum = 0
	slot0.buffIDCounter = 0
	slot0.objectIDCounter = 0
	slot0.operateMgr = AutoChessBattle.OperateManager.new(slot0)
	slot0.play = AutoChessBattle.Gate.new(slot0)
	slot0.isRunning = false
	slot0.sendArray = {}
	slot0.trackingData = {}
	slot0.guide = AutoChessGuideModel.new(slot0)
	slot0.isError = false
end

function slot0.init(slot0, slot1)
	slot0.data = slot1 or {}

	for slot5 = 1, 2 do
		slot0.trainer[slot5] = AutoChessBattle.Trainer.new(slot0, slot5)
	end

	slot0.trainer[1]:init(slot0.data)

	slot0.encounter = AutoChessBattle.EncounterModel.new(slot0)

	slot0:addFailOrNewbieCardsWeight()
	slot0.guide:init(slot0.play)
	slot0.play:init(slot0.data)
	slot0.encounter:init(csvClone(csv.auto_chess.trainer[slot0.data.trainer].chapters), slot0.data.cards)
	slot0:updateEventPanelView()
	slot0:waitInitAniDone()
end

function slot0.addFailOrNewbieCardsWeight(slot0)
	if not slot0.data.newbieProtect and not slot0.data.failProtect then
		return
	end

	slot2 = 2
	slot3 = slot0.trainer[1]:getEventByKey(lushi.ExRecordEvent.trainerWeight)
	slot5 = csv.auto_chess.base[slot0.data.baseID]

	if slot0.data.newbieProtect then
		function (slot0, slot1)
			for slot6, slot7 in ipairs(AutoChessCsv.doFormula(slot0, {})) do
				uv8 = "AutoChessCsv"
				uv9 = "doFormula"
				slot8 = slot8[slot9]
				uv9 = "AutoChessCsv"
				uv10 = "doFormula"
				slot9 = slot9[slot10][slot7] or 0
				slot8[slot7] = slot9
				uv8 = "AutoChessCsv"
				uv9 = "doFormula"
				uv9 = "AutoChessCsv"
				uv10 = "doFormula"
				slot8[slot9][slot7] = slot9[slot10][slot7] + slot1
			end
		end(slot5.newbieCards, slot5.newbieWeights)
	end

	if slot0.data.failProtect then
		slot4(slot5.failCards, slot5.failWeights)
	end

	slot1:addExRecord(lushi.ExRecordEvent.trainerWeight, slot3)
end

function slot0.waitInitAniDone(slot0, slot1)
	if not slot1 then
		return slot0:modelWait("scene_init", slot0.waitInitAniDone)
	end

	gRootViewProxy:notify("setShopVisible", true)
	slot0:start()
end

function slot0.start(slot0)
	slot0.play:start()
end

function slot0.waitNewBattleRoundAniDone(slot0, slot1)
	if not slot1 then
		return slot0:modelWait("new_battle_turn_play_ani", slot0.waitNewBattleRoundAniDone)
	end

	slot0.play:newBattleTurnGoon()
end

function slot0.waitEncounterConfirm(slot0, slot1)
	if not slot1 then
		return slot0:modelWait("encounter_confirm", slot0.waitEncounterConfirm)
	end

	slot0.encounter:afterConfirmView()
end

function slot0.waitGetAwardEnd(slot0, slot1)
	if not slot1 then
		return slot0:modelWait("battle_get_award", slot0.waitGetAwardEnd)
	end

	slot0.encounter:afterGetAward()
end

function slot0.modelWait(slot0, slot1, slot2)
	table.insert(slot0.updateResumeStack, {
		type = slot1,
		resume = slot2
	})
	gRootViewProxy:proxy():onModelWait(slot1)
end

function slot0.modelResume(slot0)
	if table.length(slot0.updateResumeStack) > 0 then
		slot3 = slot0.updateResumeStack[1].resume

		table.remove(slot0.updateResumeStack, 1)

		if slot1 > 1 then
			slot2 = slot0.updateResumeStack[1]
		end

		slot3(slot0, true)

		return true
	end

	return false
end

function slot0.update(slot0, slot1)
	if slot0.isError then
		return
	end

	slot0.framesInScene = slot0.framesInScene + 1

	slot0:preDelBuff()

	if slot0.guideFrame < slot0.logicFrame then
		slot0.guideFrame = slot0.logicFrame

		if slot0.guide:checkGuide(nil, slot0:getGuideFrame()) then
			return
		end
	end

	if slot0:modelResume() then
		slot0.logicFrame = slot0.logicFrame + 1

		return
	end

	slot0.operateMgr:runNextOpreate()
	slot0.encounter:update(slot1)

	if table.length(slot0.sendArray) > 0 and slot0:isUpdateOver() and not slot0.sendInputState then
		slot2 = slot0.sendArray[1]

		slot0[slot2.name](slot0, table.unpack(slot2.params))
		table.remove(slot0.sendArray, 1)
	end
end

function slot0.isUpdateOver(slot0)
	return table.length(slot0.updateResumeStack) + slot0.operateMgr.queue:size() <= 0
end

function slot0.addObj(slot0, slot1, slot2, slot3)
	if slot3 == lushi.ObjectReadyState.hand then
		table.insert(slot0.handCards, slot2)
	elseif slot3 == lushi.ObjectReadyState.embattle then
		slot0.herosOrder = nil

		slot0:getHerosMap(slot1):insert(slot2.id, slot2)
	end
end

function slot0.getHerosMap(slot0, slot1)
	return slot1 == 1 and slot0.heros or slot0.enemyHeros
end

function slot0.ipairsHeros(slot0)
	if slot0.herosOrder == nil then
		slot0.herosOrder = itertools.values(itertools.chain({
			itertools.iter(slot0:getHerosMap(1):pairs()),
			itertools.iter(slot0:getHerosMap(2):pairs())
		}))

		table.sort(slot0.herosOrder, function (slot0, slot1)
			return slot0.seat < slot1.seat
		end)
	end

	return ipairs(slot0.herosOrder)
end

function slot0.addObjToBeDeleted(slot0, slot1)
	slot0.deadObjsToBeDeleted[slot1.id] = slot1
end

function slot0.onFightStart(slot0, slot1)
	if not slot1 and slot0.play:isPlaying() then
		return slot0:modelWait("figth_start", slot0.onFightStart)
	end

	slot0.play:fightStartContinue()
end

function slot0.onNewBattleTurn(slot0, slot1)
	if not slot1 and slot0.play:isPlaying() then
		return slot0:modelWait("new_battle_turn", slot0.onNewBattleTurn)
	end

	slot0.deadObjsToBeDeleted = {}
	slot2 = slot0:getAllEmbattlePos()

	AutoChessEasy.queueEffect(function ()
		uv2 = "gRootViewProxy"

		gRootViewProxy:proxy():updateAllEmbattlePos(slot2)
	end)
	slot0.play:onNewBattleTurn()
end

function slot0.endBattleTurn(slot0)
	for slot4, slot5 in pairs(slot0.deadObjsToBeDeleted) do
		slot0:onObjDeath(slot5)
	end

	AutoChessEasy.queueEffect("wait", {
		lifetime = 500,
		zOrder = lushi.EffectZOrder.dead
	})

	slot0.deadObjsToBeDeleted = {}
end

function slot0.onObjDeath(slot0, slot1)
	if slot0:getHerosMap(slot1.team):erase(slot1.id) then
		slot0.herosOrder = nil

		AutoChessEasy.queueZOrderNotify("sceneDeadObj", lushi.EffectZOrder.dead, slot1.id, slot1)
	end
end

function slot0.over(slot0, slot1)
	if not slot1 then
		return slot0:modelWait("battle_over", slot0.over)
	end

	slot0.play:onOver()
end

function slot0.playEnd(slot0, slot1)
	if not slot1 then
		return slot0:modelWait("play_end", slot0.playEnd)
	end

	printInfo([[


		battle over, frame=%s, rndcnt=%s, result=%s

]], slot0.framesInScene, ymrand.randCount, slot0.play.result)
	gRootViewProxy:proxy():hideCardInfo()

	slot0.isRunning = false

	if slot0.isPvP then
		slot0:onPVPBattleEnd()
	else
		slot0:onOneBattleEnd()
	end

	if not slot0.isGameOver and not slot0.isPvP then
		AutoChessEasy.queueEffect(function ()
			gRootViewProxy:proxy():endFight()
		end)
	end
end

function slot0.createBuffCollection()
	slot0 = CCollection.new()

	slot0:add_index(CCollection.index.new("buff"):order(AutoChessBattle.AutoChessBuffModel.BuffCmp):default())
	slot0:add_index(CCollection.index.new("easyEffectFunc"):hash({
		"csvCfg",
		"easyEffectFunc"
	}))
	slot0:add_index(CCollection.index.new("cfgId"):hash("cfgId"))

	return slot0
end

function slot0.setCsvObject(slot0, slot1)
	slot0.csvObject = slot1
end

function slot0.checkObjsDeadState(slot0)
	slot1 = false

	for slot5, slot6 in slot0:ipairsHeros() do
		if slot6:isRealDeath() then
			slot1 = true

			slot0:onObjDeath(slot6)
		end
	end
end

function slot0.updateTeamAllBuffs(slot0, slot1, slot2, slot3)
	for slot8, slot9 in slot0:getHerosMap(slot1):order_pairs() do
		if not slot9:isRealDeath() then
			slot9:triggerBuffOnPoint(slot2, slot3)
		end
	end

	slot0.trainer[slot1]:triggerBuffOnPoint(slot2, slot3)
end

function slot0.updateAllObjsBuff(slot0, slot1, slot2)
	for slot6, slot7 in slot0:ipairsHeros() do
		if not slot7:isRealDeath() then
			slot7:triggerBuffOnPoint(slot1, slot2)
		end
	end

	for slot6, slot7 in ipairs(slot0.handCards) do
		slot7:triggerBuffOnPoint(slot1, slot2)
	end

	for slot6 = 1, 2 do
		slot0.trainer[slot6]:triggerBuffOnPoint(slot1, slot2)
	end
end

function slot0.deleteBuff(slot0, slot1)
	table.insert(slot0.needToDelBuffIDs, slot1)
end

function slot0.preDelBuff(slot0)
	for slot4, slot5 in ipairs(slot0.needToDelBuffIDs) do
		if slot0:eraseBuff(slot5) then
			slot6:overClean()
		end
	end

	slot0.needToDelBuffIDs = {}
end

function slot0.getConvertGroupCache(slot0)
	return nil
end

function slot0.getObject(slot0, slot1)
	if not (slot0.heros:find(slot1) or slot0.enemyHeros:find(slot1)) then
		for slot6, slot7 in ipairs(slot0.handCards) do
			if slot7.id == slot1 then
				slot2 = slot7

				break
			end
		end
	end

	return slot2
end

function slot0.getOperateObject(slot0, slot1)
	return slot0.allObjects:find(slot1)
end

function slot0.abandonGame(slot0)
	slot0.trainer[1]:beAttack(slot0.trainer[1]:hp())
end

function slot0.startFight(slot0, slot1)
	gRootViewProxy:proxy():clearDeleteObjLayer()

	if not slot0.pvpTeamBackup then
		slot0:updateAllObjsBuff(lushi.BuffTriggerPoint.onReadStateOver)
	end

	if slot0.isPvP and not slot0.pvpTeamBackup then
		slot0.pvpTeamBackup = lushiPack.battlePack(slot0)
	end

	slot0.fightBackUp = {
		[lushi.ObjectReadyState.hand] = {},
		[lushi.ObjectReadyState.embattle] = {}
	}

	for slot5, slot6 in slot0.heros:order_pairs() do
		table.insert(slot0.fightBackUp[lushi.ObjectReadyState.embattle], slot6.id)
	end

	for slot5, slot6 in ipairs(slot0.handCards) do
		table.insert(slot0.fightBackUp[lushi.ObjectReadyState.hand], slot6.id)
	end

	slot0.isRunning = true

	slot0.play:startFight(slot1)
end

function slot0.updateAllBuffLifeRound(slot0)
	for slot4, slot5 in slot0.allBuffs:order_pairs() do
		slot5:updateLifeRound(-1)
	end
end

function slot0.updateTrainerSkill(slot0)
	slot0.trainer[1]:updateSkillCd(-1)
end

function slot0.onOneBattleEnd(slot0)
	slot0:updateAllBuffLifeRound()

	uv3 = "updateAllBuffLifeRound"

	slot0.heros:clear(slot3)

	uv3 = "updateAllBuffLifeRound"

	slot0.enemyHeros:clear(slot3)

	slot0.handCards = {}

	function slot2(slot0)
		uv2 = "ipairs"

		for slot4, slot5 in ipairs(slot2.fightBackUp[slot0]) do
			uv6 = "fightBackUp"
			slot6[slot5] = true
			uv6 = "ipairs"

			if slot6.allObjects:find(slot5).transformBase then
				uv7 = "fightBackUp"
				slot7[transformBase.id] = true
			end

			if slot6.transformInfo and next(slot6.transformInfo) then
				slot7 = slot6.transformInfo
				uv7 = "fightBackUp"
				slot7[slot7.obj.id] = true
			end

			uv7 = "ipairs"

			slot7:addObj(1, slot6, slot0)

			slot6.readyState = slot0
			slot6.seat = slot4
			slot6.state = lushi.ObjectState.none

			if slot6.type == lushi.ObjectType.normal then
				slot6:delAuras()
				slot6:battleDataInit()
				slot6:fixAttr()
				slot6.view:proxy():onBallteEndReset()

				for slot10, slot11 in ipairs(slot6.equipMents) do
					uv12 = "fightBackUp"
					slot12[slot11.id] = true
				end
			end
		end
	end

	slot0:updateTrainerSkill()
	slot2(lushi.ObjectReadyState.hand)
	slot2(lushi.ObjectReadyState.embattle)

	for slot6, slot7 in slot0.allObjects:order_pairs() do
		if not ({})[slot6] and slot7.readyState ~= lushi.ObjectReadyState.shop and slot7.readyState ~= lushi.ObjectReadyState.event then
			slot0:deleteObj(slot7)
		end
	end

	for slot6, slot7 in slot0:ipairsHeros() do
		slot7:addAuras(true)
	end

	slot0.encounter:onConfirm(slot0.play.result)
	slot0.operateMgr:setWaitMark(true)
	gRootViewProxy:proxy():refreshPostion(3, lushi.ObjectReadyState.embattle)
	gRootViewProxy:proxy():refreshPostion(nil, lushi.ObjectReadyState.hand)
	gRootViewProxy:notify("setEnemyTrainerVisible", false)
	slot0:modelWait("normal_battle_end_trigger", function ()
		uv0 = "play"

		if slot0.play.result == "fail" then
			uv0 = "play"
			slot0 = slot0.updateAllObjsBuff

			slot0(slot0, lushi.BuffTriggerPoint.onHolderFightFailKey)

			uv0 = "play"

			slot0:updateAllObjsBuff(lushi.BuffTriggerPoint.onHolderFightFail)
		else
			uv0 = "play"

			if slot0.play.result == "win" then
				uv0 = "play"
				slot0 = slot0.updateAllObjsBuff

				slot0(slot0, lushi.BuffTriggerPoint.onHolderFightWinKey)

				uv0 = "play"

				slot0:updateAllObjsBuff(lushi.BuffTriggerPoint.onHolderFightWin)
			end
		end

		uv0 = "play"
		slot0 = slot0.updateAllObjsBuff

		slot0(slot0, lushi.BuffTriggerPoint.onHolderBattleEnd)

		uv0 = "play"
		slot0 = slot0.updateAllObjsBuff

		slot0(slot0, lushi.BuffTriggerPoint.onBattleOverReset)

		uv0 = "play"

		slot0:dealFightGainCards()
	end)
end

function slot0.dealFightGainCards(slot0)
	for slot4, slot5 in ipairs(slot0.fightGainCards) do
		if slot0:getOperateObject(slot5) then
			slot0:afterGainCard(slot6)
		end
	end

	slot0.fightGainCards = {}
end

function slot0.onPVPBattleEnd(slot0)
	uv3 = "heros"

	slot0.heros:clear(slot3)

	uv3 = "heros"

	slot0.enemyHeros:clear(slot3)

	slot0.handCards = {}

	for slot4, slot5 in slot0.allObjects:order_pairs() do
		slot0:deleteObj(slot5)
	end

	slot1 = slot0.trainer[1]:hp()

	for slot5 = 1, 2 do
		slot0.trainer[slot5]:reset()
	end

	lushiPack.pvpUnpack(slot0.pvpTeamBackup, slot0)
	slot0.trainer[1]:setHP(slot1)
	gRootViewProxy:proxy():refreshPostion(3, lushi.ObjectReadyState.embattle)
	gRootViewProxy:proxy():refreshPostion(nil, lushi.ObjectReadyState.hand)
	gRootViewProxy:notify("setEnemyTrainerVisible", false)
	slot0.encounter:onConfirm(slot0.play.result)
	slot0.operateMgr:setWaitMark(true)
end

function slot0.clearEnemy(slot0)
	for slot4, slot5 in slot0.enemyHeros:order_pairs() do
		slot0:deleteObj(slot5)
	end

	uv3 = "enemyHeros"

	slot0.enemyHeros:clear(slot3)
end

function slot0.deleteObj(slot0, slot1)
	slot1.isDeleted = true

	slot1:clearBuff()

	if slot0.isRunning then
		slot0.play:removeHero(slot1.team, slot1.id)
	end

	slot0:removeObjInEmbattle(slot1)
	slot0:removeHandCard(slot1)
	slot0.allObjects:erase(slot1.id)
	battleComponents.unbindAll(slot1)

	for slot5, slot6 in slot0.allBuffs:order_pairs() do
		if slot6.caster and slot6.caster.id == slot1.id then
			slot6.caster = nil
		end
	end

	gRootViewProxy:notify("sceneDelObj", slot1.id)
end

function slot0.gameOver(slot0, slot1)
	slot0.isGameOver = true
	slot0.gameResult = slot1

	slot0:waitGameOverAllEnd()
	gRootViewProxy:proxy():onGameOver(slot1)
end

function slot0.waitGameOverAllEnd(slot0, slot1)
	if not slot1 then
		return slot0:modelWait("game_over", slot0.waitGameOverAllEnd)
	end

	slot0:getGameOverAchievement()
	slot0:addToSendArray("sendInput", true)
	slot0:addToSendArray("sendGameOver")
end

function slot0.sendGameOver(slot0)
	slot0.sendInputState = true

	gGameApp:requestServer("/game/auto_chess/end", function (slot0)
		uv1 = "isError"

		if slot1.isError then
			return
		end

		gGameUI:stackUI("city.adventure.auto_chess.end_detail", nil, {
			full = true,
			clickClose = true
		}, slot0.view)
	end)
end

function slot0.guideOver(slot0)
	slot0.isGameOver = true
	slot0.gameResult = "win"

	gRootViewProxy:proxy():onGameOver(result)
	gGameApp:requestServer("/game/auto_chess/guide/newbie", function ()
		gRootViewProxy:proxy():onGuideOver()
	end, 1)
end

function slot0.getMd5Code(slot0)
	return lushiPack.getMd5Code(slot0)
end

function slot0.getPackedState(slot0)
	return lushiPack.msgpack(lushiPack.pack(slot0))
end

function slot0.getBattleState(slot0)
	return lushiPack.msgpack(lushiPack.battlePack(slot0))
end

function slot0.setPvPBattle(slot0, slot1)
	lushiPack.battleUnPack(lushiPack.msgunpack(slot1), slot0)
	gRootViewProxy:proxy():refreshPostion(2, lushi.ObjectReadyState.embattle)
end

function slot0.getOperateHistory(slot0)
	return lushiPack.msgpack(slot0.operateMgr:getHistory())
end

function slot0.sendInput(slot0, slot1)
	if slot0.isGameOver and not slot1 then
		return
	end

	slot2 = ymrand.randCount
	slot3 = slot0.logicFrame
	slot4 = nil

	if APP_CHANNEL == "none" or APP_CHANNEL == "bare" then
		slot4 = slot0:getPackedState()
	end

	slot0.sendInputState = true

	gGameApp:requestServerCustom("/game/auto_chess/input"):params(lushiPack.msgpack(slot0.operateMgr:getHistory()), slot0:getMd5Code(), slot2, slot0.logicFrame, slot0.operateMgr.isAbandon, slot4):slient():onErrCall(function (slot0)
		uv1 = "isError"
		slot1.isError = true

		ViewProxy.allModelOnly()

		if gLanguageCsv[slot0.err] then
			if device.platform == "windows" then
				slot1 = gLanguageCsv[slot1] .. "\n" .. slot0.err
			end
		end

		function slot2()
			if device.platform == "windows" then
				return
			end

			audio.stopAllSounds()
			display.director:resume()
			display.director:getScheduler():setTimeScale(1)
			gGameUI:cleanStash()
			gGameUI:switchUI("city.view")
		end

		gGameUI:showDialog({
			btnType = 1,
			clearFast = true,
			content = slot1,
			cb = slot2,
			closeCb = slot2
		})
	end):doit(function ()
		uv0 = "sendInputState"
		slot0.sendInputState = false
		uv0 = "sendInputState"
		uv2 = "operateMgr"

		slot0.operateMgr:clearHistory(slot2)
	end)
end

function slot0.getTargetsByBuff(slot0, slot1, slot2, slot3)
	slot4 = {}

	for slot8, slot9 in ipairs(slot3) do
		if slot2 == "hasBuff" then
			for slot13, slot14 in ipairs(slot1) do
				if slot9:hasBuff(slot14) then
					table.insert(slot4, slot9)
				end
			end
		elseif slot2 == "hasBuffGroup" then
			for slot13, slot14 in ipairs(slot1) do
				if slot9:hasBuffGroup(slot14) then
					table.insert(slot4, slot9)
				end
			end
		end
	end

	return slot4
end

slot2 = nil
slot0.transferBuffFuncs = {
	buffReset = function (slot0, slot1, slot2)
		slot0.holder = slot2

		if slot0.caster and slot0.caster.id == slot1.id then
			slot0.caster = slot2
		end

		slot1.buffs:erase(slot0.id)
		slot2.buffs:insert(slot0.id, slot0)
		battleComponents.unbindAll(slot0)
		battleComponents.bind(slot0, "Event")
		slot0:initTriggerEvents()

		slot0.protectedEnv = AutoChessCsv.makeProtectedEnv(slot0.caster, nil, slot0)

		if slot0.csvCfg.isShow then
			slot0.holder.view:proxy():playBuffAniEffect(slot0:getBuffEffectAniArgs())
		end

		if slot0.csvCfg.combineArgs then
			slot0:triggerByMoment(lushi.BuffTriggerPoint.onBuffCreate)
		end
	end,
	[lushi.BuffOverlayType.Normal] = function (slot0, slot1, slot2)
	end,
	[lushi.BuffOverlayType.Cover] = function (slot0, slot1, slot2)
		if slot2:getBuff(slot0.cfgId) then
			slot3:overClean()
		end

		uv4 = "getBuff"

		slot4.buffReset(slot0, slot1, slot2)
	end,
	[lushi.BuffOverlayType.Coexist] = function (slot0, slot1, slot2)
		if not slot2.buffOverlayCount[slot0.cfgId] then
			slot2.buffOverlayCount[slot3] = 0
		end

		if slot0.csvCfg.overlayLimit <= slot2.buffOverlayCount[slot3] then
			return
		end

		slot4 = slot2.buffOverlayCount
		slot4[slot3] = slot2.buffOverlayCount[slot3] + 1
		uv4 = "cfgId"

		slot4.buffReset(slot0, slot1, slot2)
	end
}

function slot0.transferBuff(slot0, slot1, slot2)
	for slot6, slot7 in slot1:iterBuffs() do
		uv8 = "iterBuffs"

		slot8[slot7.overlayType](slot7, slot1, slot2)
	end
end

function slot0.transferAttr(slot0, slot1, slot2)
	for slot6, slot7 in pairs(AutoChessAttrs.AttrsTable) do
		slot2.attrs:addBuffAttr(slot6, slot1.attrs.buff[slot6])
	end
end

function slot0.tirggerAuraBuffs(slot0, slot1, slot2)
	slot3 = lushi.BuffTriggerPoint.onBuffTrigger

	function slot4(slot0, slot1)
		uv5 = "id"

		if slot0:isTrigger(slot5, {
			buffId = slot0.id,
			obj = slot1
		}) then
			uv5 = "id"

			slot0:updateWithTrigger(slot5, slot2)
		end
	end

	if slot1 then
		for slot8, slot9 in slot0.auraBuffs:order_pairs() do
			if not slot9.holder:isDeath() and slot9.holder:isInEmbattle() then
				slot4(slot9, slot1)
			end
		end
	end

	if slot2 then
		for slot8, slot9 in slot0:ipairsHeros() do
			if slot9.id ~= slot2.holder.id and not slot9:isDeath() then
				slot4(slot2, slot9)
			end
		end
	end
end

function slot0.cleanSubArua(slot0, slot1)
	for slot5, slot6 in slot0.allBuffs:order_pairs() do
		if slot6.subAuraId == slot1 then
			slot6:overClean()
		end
	end
end

function slot0.insertBuff(slot0, slot1, slot2)
	slot0.allBuffs:insert(slot1, slot2)

	if slot2.isAura then
		slot0:insertAuraBuff(slot1, slot2)
	end
end

function slot0.insertAuraBuff(slot0, slot1, slot2)
	slot0.auraBuffs:insert(slot1, slot2)
end

function slot0.eraseBuff(slot0, slot1)
	slot0.auraBuffs:erase(slot1)

	return slot0.allBuffs:erase(slot1)
end

function slot0.addToSendArray(slot0, slot1, ...)
	if ANTI_AGENT then
		return
	end

	if not lushi.InitFromRecord or slot0:isGuide() then
		return
	end

	table.insert(slot0.sendArray, {
		name = slot1,
		params = {
			...
		}
	})
end

function slot0.addGuideOperate(slot0)
	slot0.guideExtraOperate = slot0.guideExtraOperate + 1
end

function slot0.getGuideFrame(slot0)
	return slot0.guideExtraOperate + slot0.operateMgr.operateCount
end

function slot0.battleReport(slot0, slot1, slot2)
	if ANTI_AGENT then
		return
	end

	if device.platform == "windows" then
		return
	end
end

function slot0.isGuide(slot0)
	return slot0.data.isGuide
end

require("lushi_battle.models.scene_move")
require("lushi_battle.models.scene_gold")
require("lushi_battle.models.scene_summon")
require("lushi_battle.models.scene_pack")
require("lushi_battle.models.scene_data")
