slot0 = class("AutoChessEncounterPVP")
AutoChessBattle.AutoChessEncounterPVP = slot0
slot1 = table.length(lushi.PVPRobots)

function slot0.ctor(slot0, slot1, slot2)
	slot0.id = slot1
	slot0.scene = slot2
	slot0.result = {
		"unkown",
		"unkown",
		"unkown"
	}
	slot0.curIndex = 1
end

function slot0.init(slot0)
	slot0.trainerSkillTb = {}
	uv2 = "trainerSkillTb"

	for slot4 = 1, slot2 do
		slot8 = 1

		if csvSize(csv.auto_chess.monster[lushi.PVPRobots[slot4]].trainerSkill) > 1 then
			slot8 = ymrand.random(1, slot7)
		end

		table.insert(slot0.trainerSkillTb, slot6.trainerSkill[slot8])
	end

	slot0.scene.isPVEEnd = true

	slot0.scene:addTrackingData(lushi.TrackingEvents.PVEEndHP, slot0.scene.trainer[1]:hp())
	slot0.scene:addTrackingData(lushi.TrackingEvents.PVEEndGold, slot0.scene:getGoldNum())
	slot0.scene:getPVEEndAchievement()
end

function slot0.viewData(slot0)
	return AutoChessEasy.getEncounterViewData(slot0, csv.auto_chess.encounter[slot0.id], {
		type = lushi.EncounterType.pvp
	})
end

function slot2(slot0, slot1)
	if slot0:isTrigger(lushi.BuffTriggerPoint.onBuffTrigger, {
		buffId = slot0.id,
		obj = slot1
	}) then
		slot0:updateWithTrigger(lushi.BuffTriggerPoint.onBuffTrigger, slot2)
	end
end

function slot0.triggerPvPTeamAura(slot0, slot1)
	slot3 = slot0.scene:getHerosMap(3 - slot1)

	for slot7, slot8 in slot0.scene:getHerosMap(slot1):order_pairs() do
		for slot12, slot13 in slot8:iterBuffs() do
			if slot13.isAura then
				for slot17, slot18 in slot3:order_pairs() do
					uv19 = "scene"

					slot19(slot13, slot18)
				end
			end
		end
	end
end

function slot0.gotoBattle(slot0)
	gRootViewProxy:proxy():startFight()

	slot0.scene.isPvP = true

	if slot0.scene.data.pvpFights and slot1[slot0.curIndex] then
		slot0.scene:setPvPBattle(slot0.scene.data.pvpFights[slot0.curIndex])
		slot0:triggerPvPTeamAura(1)
		slot0:triggerPvPTeamAura(2)
	else
		slot0:addFromConfig()
	end

	slot0.scene.trainer[2]:setHP(1)
	gRootViewProxy:notify("setEnemyTrainerVisible", true)
	gRootViewProxy:proxy():refreshPostion(2, lushi.ObjectReadyState.embattle)
	slot0.scene:startFight(slot0.curIndex)
end

function slot0.addFromConfig(slot0)
	slot0.scene.trainer[2]:resetRole(csv.auto_chess.monster[lushi.PVPRobots[slot0.curIndex]].trainerId)

	if slot0.trainerSkillTb[slot0.curIndex] then
		slot3:resetSkill(slot0.trainerSkillTb[slot0.curIndex])
	end

	for slot7, slot8 in ipairs(slot2.monsters) do
		slot9, slot10 = AutoChessEasy.getRoleDataFromMonsterFix(slot8)
		slot9.readyState = lushi.ObjectReadyState.none
		slot11 = slot0.scene.play:createObjectModel(slot7 + lushi.TeamNumber, slot9.type)
		slot15 = slot11
		slot16 = lushi.ObjectReadyState.embattle

		slot0.scene:addObj(2, slot15, slot16)
		slot11:init(slot9)

		for slot15, slot16 in ipairs(slot10) do
			slot17 = AutoChessEasy.getRoleDataFromCards(slot16)
			slot17.readyState = lushi.ObjectReadyState.embattle
			slot18 = slot0.scene.play:createObjectModel(1, slot17.type)

			slot18:init(slot17)
			slot18:setEquipedData()

			slot18.team = slot11.team

			slot11:addEquipment(slot18)
		end

		slot11.readyState = lushi.ObjectReadyState.embattle

		slot11.view:proxy():resetSpriteState()
	end

	for slot7, slot8 in slot0.scene.enemyHeros:order_pairs() do
		slot8:addAuras(true)
	end
end

function slot0.canConfirm(slot0, slot1)
	return true
end

function slot0.confirm(slot0, slot1)
	slot0.result[slot0.curIndex] = slot1
	slot0.curIndex = slot0.curIndex + 1

	if slot1 == "win" then
		slot0.scene:addTrackingData(lushi.TrackingEvents.PVPWin, 1)
	else
		slot0.scene:addTrackingData(lushi.TrackingEvents.PVPLose, 1)
	end

	if slot0.scene.isGameOver or slot0:isOver() then
		return
	end

	slot0:gotoBattle()
end

function slot0.confirmView(slot0)
end

function slot0.isOver(slot0)
	uv2 = "curIndex"

	return slot2 < slot0.curIndex
end

function slot0.complete(slot0)
	if not slot0.scene.isGameOver then
		slot0.scene:gameOver("win")

		return
	end

	slot0.scene.isPvP = false
	slot0.scene = nil
	slot0.curIndex = nil
end

return slot0
