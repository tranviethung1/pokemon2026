require("battle.models.include")

slot0 = class("BattleModel")

function slot0.ctor(slot0)
	slot0.scene = nil
	slot0.updateFrame = nil
	slot0.updateDelta = nil
	slot0.battleData = nil
	slot0.battleSceneID = nil
	slot0.modelEnable = true
	slot0.modelPause = false
end

function slot0.init(slot0)
	cow.battleModelInit()
end

function slot0.cleanUp(slot0)
	slot0.scene = nil
	slot0.battleData = nil
	slot0.battleSceneID = nil
	slot0.updateFrame = nil
	slot0.updateDelta = nil

	cow.battleModelDestroy()
	BattleAssert.clear()
end

function slot0.reset(slot0, slot1, slot2, slot3)
	slot0:cleanUp()
	cow.battleModelInit()

	slot0.scene = cow.proxyObject("scene", SceneModel.new())
	slot0.updateDelta = 0
	slot0.updateFrame = 0
	slot0.modelPause = false
	slot0.modelEnable = true
	slot0.battleData = slot1
	slot0.battleSceneID = slot2
	slot0.battleIsRecord = slot3
end

function slot0.onInitInUpdate(slot0)
	slot1 = slot0.battleData
	slot2 = slot0.battleSceneID
	slot0.battleData = nil
	slot0.battleSceneID = nil
	slot0.battleIsRecord = nil
	slot4 = string.format([[


		battle %s start - seed=%s, scene=%s

]], slot0.battleIsRecord and "record" or "", slot1.randSeed, slot2)

	printInfo(slot4)
	log.battle(slot4)
	ymrand.randomseed(slot1.randSeed)

	ymrand.randCount = 0

	slot0.scene:init(slot2, slot1, slot3)
end

function slot0.update(slot0, slot1)
	if not slot0.modelEnable or slot0.modelPause then
		return
	end

	if slot0.scene.isBattleAllEnd then
		return
	end

	slot0.updateDelta = slot0.updateDelta + slot1
	slot0.updateFrame = slot0.updateFrame + 1

	if slot0.updateFrame == 1 then
		slot0:onInitInUpdate()
	end

	if slot0.updateFrame <= 5 then
		return
	end

	if slot0.updateDelta < game.FRAME_TICK then
		return
	end

	for slot7 = 1, math.floor(slot0.updateDelta / slot2) do
		if not slot0.modelEnable or slot0.modelPause then
			break
		end

		slot0.scene:update(slot2)

		slot0.updateDelta = slot0.updateDelta - slot2
	end
end

function slot0.setModelEnable(slot0, slot1)
	slot0.modelEnable = slot1
end

function slot0.runUntilEnd(slot0)
	slot0.modelPause = false
	slot0.modelEnable = true

	ViewProxy.allModelOnly()
	gRootViewProxy:raw():enableQuickPass(slot0.scene)
	slot0.scene:setAutoFight(true)

	while true do
		if slot0.scene.isBattleAllEnd then
			break
		end

		slot0:update(game.FRAME_TICK)
	end

	slot0.modelEnable = false
end

function slot0.runUnitlNextWave(slot0)
	slot0.modelPause = false
	slot0.modelEnable = true
	slot0.updateDelta = 0

	ViewProxy.allModelOnly()

	slot1 = slot0.scene.autoFight

	slot0.scene:setAutoFight(true)
	gRootViewProxy:raw():enableQuickPassOneWave(slot0.scene)

	while true do
		if slot0.scene.isBattleAllEnd then
			slot0.modelEnable = false

			break
		end

		if slot0.scene.play.isWaveEnd then
			slot0.scene:setAutoFight(slot1)
			ViewProxy.allModelResum()

			break
		end

		slot0:update(game.FRAME_TICK)
	end
end

slot1 = {
	[battle.OperateTable.skill] = function (slot0, slot1)
		if slot0.scene.gateType == game.GATE_TYPE.arena then
			return
		end

		if slot0.scene.heros:find(slot1) and slot2:isCanHandSkill() and not slot0.scene.inMainSkill then
			slot2:handSkill()
		end
	end,
	[battle.OperateTable.attack] = function (slot0, slot1, slot2)
		slot0.scene.play:setAttack(slot1, slot2)
	end,
	[battle.OperateTable.noAttack] = function (slot0)
		slot0.scene:setNoAttackFlag()
	end,
	[battle.OperateTable.autoFight] = function (slot0, slot1)
		slot0.scene:setAutoFight(slot1)
	end,
	[battle.OperateTable.pass] = function (slot0, slot1)
		slot0:runUntilEnd()
	end,
	[battle.OperateTable.passOneWave] = function (slot0)
		slot0.scene.play:onPassOneWave(function ()
			uv0 = "runUnitlNextWave"

			slot0:runUnitlNextWave()
		end)
	end,
	[battle.OperateTable.fullManual] = function (slot0)
		slot0.scene:setFullManual(slot0.battleData.moduleType == 2)
	end
}

function slot0.handleOperation(slot0, slot1, ...)
	if slot0.scene == nil then
		return
	end

	uv2 = "scene"

	if slot2[slot1] then
		return slot2(slot0, ...)
	end
end

return slot0
