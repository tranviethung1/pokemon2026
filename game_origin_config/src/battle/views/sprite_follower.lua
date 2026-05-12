globals.BattleFollowerSprite = class("BattleFollowerSprite", BattleSprite)

function BattleFollowerSprite.initLifeBar(slot0)
	BattleSprite.initLifeBar(slot0)

	if slot0.model.dealArgs.hideLifebar == battle.hpShowState.hide then
		slot0.lifebar:onSetLifebarVisible(false, "lifeBarVisible")
	elseif slot0.model.dealArgs.hideLifebar == battle.hpShowState.always then
		slot0.lifebar:onSetLifebarVisible(true, "lifeBarVisible")
	end

	if slot0.model.dealArgs.hideLifebar ~= battle.hpShowState.normal then
		slot0.lifebar:setVisibleEnable(false)
	end
end

function BattleFollowerSprite.updHitPanel(slot0)
end

function BattleFollowerSprite.showHero(slot0, slot1, slot2)
	slot0.lifebar:setVisible(slot1 and not slot2.hideLife)
	slot0:setVisible(slot1)
end

function BattleFollowerSprite.getPosBySeat(slot0)
	slot2 = (battle.StandingPos[2].x + battle.StandingPos[5].x) / 2
	slot3 = slot0.posAdjust:get().x
	slot4 = slot0.posAdjust:get().y

	if slot0.args.posType == 1 then
		return BattleSprite.getPosBySeat(slot0, slot0:getSeat())
	elseif slot1 == 2 then
		return (slot0.force == 1 and slot2 or display.width - slot2) + slot3, battle.StandingPos[2].y + slot4
	elseif slot1 == 3 then
		if slot0.force == 1 then
			slot2 = display.width - slot2 or slot2
		end

		return slot2 + slot3, battle.StandingPos[2].y + slot4
	elseif slot1 == 4 then
		return battle.StandingPos[13].x + slot3, battle.StandingPos[2].y + slot4
	end
end

function BattleFollowerSprite.getBeAttackPosAdjust(slot0)
	slot1 = slot0.model.dealArgs.beAttackOffsetPos or cc.p(0, 0)

	return cc.p(slot0.forceFaceTo * slot1.x, slot1.y)
end

function BattleFollowerSprite.resetPosZ(slot0, slot1)
	if not slot0.model.dealArgs.posZ then
		slot2, slot3 = slot0:getSelfPos()

		slot0.posZ:set((2 - math.floor((slot0:getSeat() + 2) / 3) % 2 == 1 and 2 * slot4 or display.height - (slot1 or slot3) - 1) + (slot0.model.dealArgs.lerpZ or 0), "reset")

		slot0.battleMovePosZ = 2 * slot4

		return
	end

	slot2 = slot0.model.dealArgs.posZ

	slot0.posZ:set(slot2, "reset")

	slot0.battleMovePosZ = slot2
end
