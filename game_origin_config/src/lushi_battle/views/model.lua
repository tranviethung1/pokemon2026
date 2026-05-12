require("lushi_battle.models.include")

slot0 = require("lushi_battle.ai")
slot1 = class("AutoChessBattleModel")

function slot1.ctor(slot0)
	slot0.scene = nil
	slot0.updateFrame = nil
	slot0.updateDelta = nil
	slot0.battleData = nil
	slot0.modelEnable = true
	slot0.modelPause = false
end

function slot1.init(slot0)
end

function slot1.cleanUp(slot0)
	slot0.scene = nil
	slot0.battleData = nil
	slot0.updateFrame = nil
	slot0.updateDelta = nil
	slot0.modelEnable = false
end

function slot1.reset(slot0, slot1)
	slot0:cleanUp()

	if lushi.InitFromRecord and not slot1.isGuide then
		slot0.scene = lushiPack.unpack(lushiPack.msgunpack(slot1.stateSet))
	else
		slot0.scene = AutoChessBattle.SceneModel.new()
	end

	uv2 = "cleanUp"
	slot0.ai = slot2.new(slot0.scene)
	slot0.updateDelta = 0
	slot0.updateFrame = 0
	slot0.modelPause = false
	slot0.modelEnable = true
	slot0.battleData = slot1
end

function slot1.onInitInUpdate(slot0)
	slot1 = slot0.battleData
	slot0.battleData = nil

	if not lushi.InitFromRecord or slot1.isGuide then
		ymrand.randomseed(slot1.randSeed)

		slot2 = string.format("\n\n\t\tbattle start - seed=%s", slot1.randSeed)
		ymrand.randCount = 0

		slot0.scene:init(slot1)
		slot0.ai:init()
	end
end

function slot1.update(slot0, slot1)
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
		slot0.ai:update(slot2)

		slot0.updateDelta = slot0.updateDelta - slot2
	end
end

function slot1.setModelEnable(slot0, slot1)
	slot0.modelEnable = slot1
end

function slot1.runUntilEnd(slot0)
	slot0.modelPause = false
	slot0.modelEnable = true

	ViewProxy.allModelOnly()
	slot0.scene:setAutoFight(true)

	while true do
		if slot0.scene.isBattleAllEnd then
			break
		end

		slot0:update(game.FRAME_TICK)
	end

	slot0.modelEnable = false
end

slot2 = {
	[lushi.OperateTable.pass] = function (slot0)
		slot0:runUntilEnd()
	end,
	[lushi.OperateTable.menuClick] = function (slot0, slot1)
		slot0.scene.operateMgr:addOperate(lushi.OperateTable.menuClick, slot1)
	end,
	[lushi.OperateTable.menuDelete] = function (slot0, slot1)
		slot0.scene.operateMgr:addOperate(lushi.OperateTable.menuDelete, slot1)
	end,
	[lushi.OperateTable.getEnhancePrice] = function (slot0, slot1)
		return slot0.scene.encounter:getCost(slot1)
	end
}

function slot1.handleOperation(slot0, slot1, ...)
	if slot0.scene == nil then
		return
	end

	uv2 = "scene"

	if slot2[slot1] then
		return slot2(slot0, ...)
	else
		return slot0.scene.operateMgr:addOperate(slot1, ...)
	end
end

return slot1
