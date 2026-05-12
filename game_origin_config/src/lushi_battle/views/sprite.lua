require("easy.sprite")

globals.AutoChessSprite = class("AutoChessSprite", cc.Node)
slot0 = {
	[lushi.ObjectReadyState.embattle] = "inembattle",
	[lushi.ObjectReadyState.shop] = "shop",
	[lushi.ObjectReadyState.hand] = "inhand",
	[lushi.ObjectReadyState.event] = "none",
	[lushi.ObjectReadyState.find] = "none",
	[lushi.ObjectReadyState.transform] = "none",
	[lushi.ObjectReadyState.none] = "none"
}

function AutoChessSprite.ctor(slot0, slot1, slot2, slot3)
	slot0.battleView = slot1
	slot0.sprite = nil
	slot0.dmgText = nil
	slot0.hpText = nil
	slot0.model = slot2
	slot0.key = slot3
	slot0.team = slot0.model.team
	slot0.id = slot0.model.id
	slot0.attrValue = {
		dmgText = 0,
		hpText = 0,
		shieldText = 0
	}
	slot0.drawOutState = false
	slot0.waitDraw = 0
	slot0.clickEnable = true
	slot0.equipBgVisible = AutoChessEasy.priorDataTable(false, "equipBgVisible")
	slot0.holdingHaloVisible = AutoChessEasy.priorDataTable(false, "holdingHaloVisible")
	slot0.baseScale = 1
	slot0.effectResMap = {}
	slot0.bb = {}
end

function AutoChessSprite.init(slot0)
	slot0.attrValue = {
		dmgText = -1,
		hpText = -1,
		shieldText = -1
	}

	slot0:makeCard()

	slot3 = slot0.model.seat
	slot0.spriteInfo = slot0:getSpriteInfo(slot3)

	slot0:resetSpriteState()

	uv3 = "attrValue"

	slot0:enableSpriteClick(slot3[slot0.model.readyState])
end

function AutoChessSprite.showHpChange(slot0, slot1)
	slot0:attrChangeEffect(slot1)
end

function AutoChessSprite.showShieldChange(slot0, slot1)
	slot0:attrChangeEffect(slot1)
end

function AutoChessSprite.showAttackChange(slot0, slot1)
	slot0:attrChangeEffect(slot1)
end

function AutoChessSprite.showAttrChange(slot0, slot1)
	slot0[slot1]:runAction(cc.Sequence:create(cc.ScaleTo:create(0.25, 1.5), cc.ScaleTo:create(0.15, 1)))
end

function AutoChessSprite.remakeCard(slot0)
	slot0.star:set(slot0.model:getStar())
	slot0.unitID:set(slot0.model.unitID)
end

function AutoChessSprite.makeCard(slot0)
	slot0.sprite = slot0.battleView.cardPanel:clone()

	slot0.sprite:addTo(slot0):align(cc.p(0.5, 0.5), 0, 0)

	slot0.cardPrefab = ccui.Layout:create()

	slot0.cardPrefab:addTo(slot0.sprite):align(cc.p(0.5, 0.5), slot0.sprite:width() / 2, slot0.sprite:height() / 2)

	slot0.star = idler.new(slot0.model:getStar())
	slot0.unitID = idler.new(slot0.model.unitID)

	bind.extend(slot0.battleView, slot0.cardPrefab, {
		class = "auto_chess_card1",
		props = {
			id = slot0.unitID,
			star = slot0.star,
			onNode = function (slot0)
				slot0:z(5)
				slot0:scale(0.5)
			end
		}
	})
	slot0:createShadowBg()
	slot0:setCardData()
end

function AutoChessSprite.setCardData(slot0)
	slot0:onUpdateAll()
	slot0:setEquipDatas()
end

function AutoChessSprite.setEquipDatas(slot0)
	slot0.equipBg1 = slot0.sprite:get("equipBg1")
	slot0.equipBg2 = slot0.sprite:get("equipBg2")
	slot3 = slot0.model.equipLimit

	if table.length(slot0.model:getEquipmentIDs()) == 0 then
		slot0.equipBg = slot0.equipBg1
	elseif slot2 == slot3 then
		slot0.equipBg = slot0.equipBg1
	else
		slot0.equipBg = slot0.equipBg2
	end

	slot0.cardPrefab:setData({
		equips = slot1
	})
end

function AutoChessSprite.createShadowBg(slot0)
	slot1 = cc.Sprite:create("lushi/img_ty.png")

	slot1:addTo(slot0, -3):scale(1):align(cc.p(0.5, 0.5), 3, -3):setRotation3D({
		x = -15
	}):hide()

	slot0.shadowBg = slot1
end

function AutoChessSprite.updateUnit(slot0)
	AutoChessEasy.updateCardPanel(slot0, slot0.model)
end

function AutoChessSprite.onAddToScene(slot0)
	slot0:setVisible(true)
	slot0:setScale(slot0.baseScale)
end

function AutoChessSprite.getPosBySeat(slot0)
	if not slot0.model.scene:getPosBySeat(slot0.model.seat, slot0.model.readyState) then
		return cc.p(-500, -500)
	end

	return cc.p(slot3.x, slot3.y)
end

function AutoChessSprite.onStateChange(slot0)
	slot0:runAction(cc.RotateTo:create(0, {
		z = 0,
		x = 0,
		y = 0
	}))

	if slot0.model.readyState == lushi.ObjectReadyState.embattle then
		if slot0.model.team == 2 then
			slot0.baseScale = 0.92
		end

		slot0.drawOutState = false

		slot0.sprite:setRotation3D({
			x = -15
		})

		slot0.posZ = slot0.model.seat

		if slot0.shadowBg then
			slot0.shadowBg:show():setPosition(3, -3):setRotation3D({
				x = -15
			})
		end

		slot0:setEffectsVisible(true)
	else
		slot0:onHandState()
		slot0:setEffectsVisible(false)
	end

	if slot0.model.readyState ~= lushi.ObjectReadyState.shop then
		slot0:updateRiseState(false)
	end

	slot0.holdingHaloVisible:set(false)
	slot0.holdingHaloVisible:set(nil, "move", true)
	slot0.holdingHaloVisible:set(nil, "shop", true)
	slot0:onHoldingHalo()
	slot0:z(slot0.posZ)
end

function AutoChessSprite.onHandState(slot0)
	slot0.sprite:setRotation3D({
		x = 0
	})

	slot0.posZ = slot0.drawOutState and 999 or slot0.model.seat

	if slot0.shadowBg then
		slot0.shadowBg:hide()
	end
end

function AutoChessSprite.onHolding(slot0)
	slot0.sprite:setRotation3D({
		x = 0
	})
	slot0.shadowBg:show():setPosition(-65, -80):setRotation3D({
		x = 0
	})
	slot0:setScale(1.2)
end

function AutoChessSprite.resetSpriteState(slot0)
	if slot0.isEnhancing then
		return
	end

	slot0:onStateChange()

	slot0.posXY = slot0:getPosBySeat()

	slot0:setPosition(slot0.posXY)
	slot0:setScale(slot0.baseScale)

	slot3 = 1

	slot0.sprite:setScale(slot3)

	uv3 = "isEnhancing"

	slot0:spriteApplyState(slot3[slot0.model.readyState])
end

function AutoChessSprite.getSpriteInfo(slot0, slot1)
	slot2 = cc.Node:create()

	slot2:addTo(slot0)

	return slot2
end

function AutoChessSprite.updatePos(slot0, slot1, slot2, slot3)
	if slot0.isEnhancing then
		return
	end

	slot3 = slot3 or 0.2
	slot0.posXY = cc.p(slot1, slot2)

	slot0:setPosition(slot0.posXY)
end

function AutoChessSprite.onUpdateHp(slot0, slot1)
	slot0.cardPrefab:setData({
		hp = slot1 or slot0.model:hp()
	})
end

function AutoChessSprite.onUpdateShield(slot0, slot1)
	slot0:updateShieldAndBroken(slot1)
end

function AutoChessSprite.onUpdateBroken(slot0, slot1)
	slot0:updateShieldAndBroken(nil, slot1)
end

function AutoChessSprite.updateShieldAndBroken(slot0, slot1, slot2)
	slot0.cardPrefab:setData({
		defence = slot1 or slot0.model:shieldHp(),
		broken = slot2 or slot0.model:brokenHp()
	})
end

function AutoChessSprite.onUpdateAll(slot0)
	slot0:onUpdateHp()
	slot0:updateShieldAndBroken()
	slot0:onRefreshCardAttr()
end

function AutoChessSprite.onAttackBefore(slot0, slot1)
	slot2 = slot0.battleView:onViewProxyCall("getSceneObj", slot1)
	slot4, slot5 = slot0:xy()
	slot0.curTarget = slot2
	slot0.bb = {
		pos = cc.p(slot2:getPosition()),
		oriX = slot4,
		oriY = slot5
	}

	slot0.sprite.autoAttackBefore(slot0.bb)
end

function AutoChessSprite.onAttackTarget(slot0)
	slot0.sprite.autoAttackTarget(slot0.bb)
end

function AutoChessSprite.onAttackEnd(slot0)
	slot0.sprite.autoAttackBack(slot0.bb)
end

function AutoChessSprite.onDead(slot0, slot1, slot2)
	slot0.shadowBg:hide()

	slot3 = newCSprite(slot1)

	slot0:add(slot3)
	slot3:setRotation3D({
		x = -15
	})
	slot3:setLocalZOrder(999999)
	slot3:anchorPoint(0.5, 0.5):scale(1)
	slot3:play("card_die")
	slot3:setTimeScale(1)
	transition.executeSequence(slot0.sprite):delay(0.2):func(function ()
		uv0 = "sprite"

		slot0.sprite:hide()
	end):delay(1):func(slot2):func(function ()
		uv0 = "removeFromParent"

		slot0:removeFromParent()
	end):done()
end

function AutoChessSprite.sceneDelObj(slot0, slot1)
	slot0.sprite:getEventDispatcher():removeEventListener(slot0.listener)
	slot0:unscheduleUpdate()
	slot0:retain()
	slot0:removeSelf()
	slot1:addChild(slot0)
	slot0:release()
end

function AutoChessSprite.onShowHeadNumber(slot0, slot1)
	return gRootViewProxy:notify("showHeadNumber", slot0, slot1)
end

function AutoChessSprite.getCurPos(slot0)
	return slot0.posXY
end

function AutoChessSprite.updateStar(slot0)
	slot0.star:set(slot0.model:getStar())
	slot0:onUpdateAll()
end

function AutoChessSprite.onRefreshCardAttr(slot0, slot1)
	slot0.cardPrefab:setData({
		attack = (slot1 or {}).attack or slot0.model:attack()
	})
end

function AutoChessSprite.isDrawOut(slot0)
	return slot0:isInHand() and slot0.drawOutState
end

function AutoChessSprite.isInHand(slot0)
	return slot0.model:isInHand()
end

function AutoChessSprite.isInEmbattle(slot0)
	return slot0.model:isInEmbattle()
end

slot1 = string.caption

function AutoChessSprite.onViewProxyNotify(slot0, slot1, ...)
	uv3 = "on"

	if slot0["on" .. slot3(slot1)] then
		slot3(slot0, ...)
	else
		printWarn("AutoChessSprite no handler for msg, %s", slot2)
	end
end

function AutoChessSprite.onViewProxyCall(slot0, slot1, ...)
	if slot0[slot1] then
		return slot3(slot0, ...)
	else
		printWarn("AutoChessSprite no handler for msg %s", slot2)
	end
end

function AutoChessSprite.modelOnly(slot0)
	slot0:stopAllActions()
	slot0:unscheduleUpdate()
end

function AutoChessSprite.onAddEquipment(slot0, slot1, slot2)
	slot0:setEquipDatas()
end

function AutoChessSprite.onRemoveEquipment(slot0)
	slot0:setEquipDatas()
end

function AutoChessSprite.onAddProtector(slot0)
	cc.Sprite:create("lushi/img_cf.png"):addTo(slot0.sprite, -2):align(cc.p(0.5, 0.5), 0, 0)
end

function AutoChessSprite.onBallteEndReset(slot0)
	slot0.sprite:stopAllActions()
	slot0:show()
	slot0.sprite:show()
	slot0.sprite:setScale(1)
	slot0.sprite:setOpacity(255)

	if slot0.model:isInEmbattle() then
		slot0:setEffectsVisible(true)
	end
end

function AutoChessSprite.updateRiseState(slot0, slot1)
	if slot1 then
		if not slot0.riseState then
			slot0.riseState = function (slot0, slot1)
				slot2 = newCSprite("lushi/zizouqi_jl2.skel")
				uv5 = "newCSprite"

				slot2:addTo(slot5, slot0):anchorPoint(0.5, 0.5):scale(1):xy(0, 0)
				slot2:setTimeScale(1)
				slot2:play(slot1)

				return slot2
			end(1, "upgrade_tips_loop")
		end
	elseif slot0.riseState then
		slot0.riseState:removeFromParent()

		slot0.riseState = nil
	end
end

function AutoChessSprite.attrChangeEffect(slot0, slot1)
	if slot1 == 0 then
		return
	end

	slot2 = "attribute_promotion"

	if slot1 < 0 then
		slot2 = "attribute_reduction"
	end

	slot3 = newCSprite("lushi/zizouqi_jl1.skel")

	slot3:addTo(slot0, 1):anchorPoint(0.5, 0.5):scale(1):xy(0, 0)
	slot3:setTimeScale(1)
	slot3:play(slot2)
	AutoChessEasy.autoRemoveSpine(slot3)
end

require("lushi_battle.views.sprite_move")
require("lushi_battle.views.sprite_effect")
