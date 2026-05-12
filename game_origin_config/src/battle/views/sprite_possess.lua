globals.BattlePossessSprite = class("BattlePossessSprite", BattleSprite)

function BattlePossessSprite.loadSprite(slot0, slot1, slot2, slot3)
	if slot0.args.res then
		slot0.sprite = newCSpriteWithOption(slot0.args.res)

		slot0.sprite:setPosition(cc.p(0, 0))
		slot0.sprite:setSpriteEventHandler(handler(slot0, slot0.onSpriteEvent))
		slot0:add(slot0.sprite, slot2)
		slot0:setScale(1)
	end
end

function BattlePossessSprite.init(slot0)
	BattleSprite.init(slot0)

	slot0.holderView = gRootViewProxy:call("getSceneObj", slot0.args.targetKey)

	slot0.holderView:addFollowSpr(slot0)

	slot0.casterView = gRootViewProxy:call("getSceneObj", slot0.args.casterKey)

	slot0.casterView:addReplaceView(slot0)

	slot0.isDirty = false
	slot0._holderPos = cc.p(slot0.holderView:getPosition())
	slot0._holderVis = nil
	slot0._holderZOrder = slot0.holderView:getLocalZOrder()

	slot0:setActionState(battle.SpriteActionTable.standby)
end

function BattlePossessSprite.getHolderVisible(slot0)
	return slot0.holderView:isVisible() and slot0.holderView:getSpriteVisible()
end

function BattlePossessSprite.onFixedUpdate(slot0, slot1)
	if slot0.isDirty then
		return
	end

	if slot0._holderVis ~= slot0:getHolderVisible() then
		slot0._holderVis = slot0:getHolderVisible()
	end

	slot0:setVisible(slot0._holderVis)

	if slot0._holderPos.x ~= slot0.holderView:getPositionX() or slot0._holderPos.y == slot0.holderView:getPositionY() then
		slot0._holderPos.x, slot0._holderPos.y = slot0.holderView:getPosition()
		slot2 = slot0:getPosAdjust()

		slot0:setPosition(cc.p(slot0._holderPos.x + slot2.x, slot0._holderPos.y + slot2.y))
		slot0:setCurPos(cc.p(slot0._holderPos.x, slot0._holderPos.y))
	end

	if slot0:getScaleX() ~= slot0.holderView:getScaleX() or slot0:getScaleY() ~= slot0.holderView:getScaleY() then
		slot0:setScaleX(slot0.holderView:getScaleX())
		slot0:setScaleY(slot0.holderView:getScaleY())
	end

	if slot0._holderZOrder ~= slot0.holderView:getLocalZOrder() then
		slot0._holderZOrder = slot0.holderView:getLocalZOrder()

		slot0:setLocalZOrder(slot0._holderZOrder + 1)
	end
end

function BattlePossessSprite.onAddToScene(slot0)
	BattleSprite.onAddToScene(slot0)
	slot0:resetPosZ(slot0._holderPos.y - 1)
	slot0:setLocalZOrder(slot0.posZ:get())
end

function BattlePossessSprite.popEffectInfo(slot0, slot1)
	return slot0.casterView:popEffectInfo(slot1)
end

function BattlePossessSprite.getProcessArgs(slot0, slot1)
	return slot0.casterView:getProcessArgs(slot1)
end

function BattlePossessSprite.popIgnoreEffect(slot0, slot1, slot2)
	return slot0.casterView:popIgnoreEffect(slot1, slot2)
end

function BattlePossessSprite.getSeat(slot0)
	return slot0.args.targetSeat
end

function BattlePossessSprite.initLifeBar(slot0)
end

function BattlePossessSprite.initNatureQuan(slot0)
end

function BattlePossessSprite.initGroundRing(slot0)
end

function BattlePossessSprite.updHitPanel(slot0)
end

function BattlePossessSprite.setDirty(slot0, slot1)
	slot0.isDirty = slot1
end

function BattlePossessSprite.showHero(slot0, slot1, slot2)
	slot0:setVisible(slot1)
end

function BattlePossessSprite.checkSceneTag(slot0, slot1)
	if slot1 then
		return slot1.isPossessAttack
	end

	return false
end

function BattlePossessSprite.sceneDelObj(slot0, slot1)
	slot0.holderView:removeFollowSpr(slot0)
	slot0.casterView:removeReplaceView(slot0)
	slot0:removeSelf()
end

function BattlePossessSprite.objToHideEff(slot0, slot1, slot2)
	slot3 = slot1

	if slot0.casterView == slot2 then
		slot2:objToHideEff(slot1)

		if slot2.skillSceneTag:back() and slot5.isBigSkill then
			slot0.casterView:setVisible(not slot1)
		end

		slot0:setDirty(slot3)
		slot0:setVisible(slot1)
	elseif slot6 then
		slot0:setDirty(slot3)
		slot0:setVisible(slot4)
	end
end
