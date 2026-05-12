globals.EffectResManager = class("EffectResManager")
slot0 = {
	[battle.EffectResType.BuffText] = false,
	[battle.EffectResType.OnceEffect] = false,
	[battle.EffectResType.FollowSprite] = false,
	[battle.EffectResType.BuffEffectInHolder] = false,
	[battle.EffectResType.BuffEffectInNormal] = true,
	[battle.EffectResType.BuffEffectInForceSelf] = true,
	[battle.EffectResType.BuffEffectInForceEnemy] = true,
	[battle.EffectResType.FollowToScale] = false
}
slot1 = {
	normal = {
		addSprite = function (slot0, slot1)
			slot1.spr:visible(true)
		end,
		objToHideEff = function (slot0, slot1, slot2)
			return slot1.showEffect or not slot2
		end
	},
	lockEffect = {
		addSprite = function (slot0, slot1)
			if slot1.showEffect ~= nil then
				slot1.spr:visible(slot1.showEffect)
			end
		end,
		objToHideEff = function (slot0, slot1, slot2)
			return slot1.showEffect
		end
	}
}

function EffectResManager.ctor(slot0, slot1, slot2)
	slot0.resKeyMap = {}
	slot0.resKeyInfoMap = {}
	slot0.resKeyMapPower = {}
	slot0.envFuncMap = nil

	slot0:setEnv("normal")

	if slot1 then
		slot0.sprite = slot1
		slot0.battleView = slot1.battleView
	else
		slot0.sprite = slot2
		slot0.battleView = slot2
	end

	uv4 = "resKeyMap"

	for slot6, slot7 in pairs(slot4) do
		if slot1 ~= nil or slot7 then
			slot0.resKeyMap[slot6] = {}
			slot0.resKeyInfoMap[slot6] = {}
			slot0.resKeyMapPower[slot6] = {}
		end

		if slot1 and slot7 then
			slot0:bind(slot6, slot0.battleView.effectResManager)
		end
	end
end

function EffectResManager.bind(slot0, slot1, slot2)
	slot0.resKeyMap[slot1] = slot2.resKeyMap[slot1]
	slot0.resKeyInfoMap[slot1] = slot2.resKeyInfoMap[slot1]
	slot0.resKeyMapPower[slot1] = slot2.resKeyMapPower[slot1]
end

function EffectResManager.setEnv(slot0, slot1)
	uv2 = "envFuncMap"
	slot0.envFuncMap = slot2[slot1]
end

function EffectResManager.excuteProcess(slot0, slot1, ...)
	if slot0.envFuncMap and slot0.envFuncMap[slot1] then
		return slot0.envFuncMap[slot1](slot0, ...)
	end
end

function EffectResManager.pairs(slot0, slot1)
	if not slot1 then
		return pairs(slot0.resKeyMap)
	end

	return pairs(slot0.resKeyMap[slot1])
end

function EffectResManager.pairsInfo(slot0, slot1, slot2)
	return pairs(slot0.resKeyInfoMap[slot1][slot2])
end

function EffectResManager.getEffectInfo(slot0, slot1, slot2)
	return slot0.resKeyMap[slot1][slot2]
end

function EffectResManager.getEffectRefInfo(slot0, slot1, slot2)
	return slot0.resKeyInfoMap[slot1][slot2]
end

function EffectResManager.isEmpty(slot0, slot1)
	return not next(slot0.resKeyMap[slot1])
end

function EffectResManager.setPower(slot0, slot1, slot2, slot3)
	if type(slot3) ~= "table" then
		if slot0.resKeyMapPower[slot1][slot2] and slot4.id == slot3 then
			slot0.resKeyMapPower[slot1][slot2] = nil
		end
	else
		slot0.resKeyMapPower[slot1][slot2] = slot3
	end
end

function EffectResManager.addResInfo(slot0, slot1, slot2, slot3)
	if not slot0.resKeyInfoMap[slot1][slot2] then
		slot0.resKeyInfoMap[slot1][slot2] = {}
	end

	table.insert(slot0.resKeyInfoMap[slot1][slot2], slot3)

	if slot3.visible ~= nil then
		slot0:getEffectInfo(slot1, slot2).spr:setVisible(slot3.visible)
	end
end

function EffectResManager.removeResInfo(slot0, slot1, slot2, slot3)
	if not slot0.resKeyInfoMap[slot1][slot2] then
		return
	end

	slot4 = nil

	for slot8, slot9 in ipairs(slot0.resKeyInfoMap[slot1][slot2]) do
		if slot9.id == slot3 then
			table.remove(slot0.resKeyInfoMap[slot1][slot2], slot8)

			slot4 = slot9

			break
		end
	end

	if slot4 then
		if not slot0:getEffectInfo(slot1, slot2) or not slot5.spr then
			return
		end

		slot5.spr:setVisible(slot0:getKeyInResInfoBy(slot1, slot2, "visible", "last"))
	end
end

slot2 = {
	last = function (slot0, slot1)
		if slot0[slot1] ~= nil then
			return slot0[slot1], false, false
		end

		return nil, true, false
	end
}

function EffectResManager.getKeyInResInfoBy(slot0, slot1, slot2, slot3, slot4)
	if not slot0.resKeyInfoMap[slot1][slot2] then
		return
	end

	uv6 = "resKeyInfoMap"

	assertInWindows(slot6[slot4] ~= nil, "EffectResManager way:%s in FilterFuncMap is not define", slot4)

	if slot0.resKeyMapPower[slot1][slot3] and slot7.addCheck(slot0.resKeyMap[slot1][slot2]) then
		return slot7.value
	end

	slot8, slot9, slot10, slot11 = nil

	for slot15, slot16 in ipairs(slot0.resKeyInfoMap[slot1][slot2]) do
		slot8, slot18, slot19 = slot6(slot16, slot3)

		if not slot18 then
			-- Nothing
		end

		if slot19 then
			break
		end
	end

	return slot8
end

function slot3(slot0, slot1, slot2, slot3)
	return {
		spr = slot0,
		count = slot1 or 0,
		showEffect = slot2
	}
end

function EffectResManager.add(slot0, slot1, slot2, slot3, slot4)
	if slot0.resKeyMapPower[slot1].add and not slot0.resKeyMapPower[slot1].add.switch then
		return
	end

	if slot0.resKeyMap[slot1][slot2] == nil then
		(slot4.spr or newCSpriteWithOption(slot3)):visible(true)

		if slot1 == battle.EffectResType.OnceEffect or slot1 == battle.EffectResType.BuffText then
			return slot6, true
		end

		uv7 = "resKeyMapPower"
		slot5 = slot7(slot6, 1, slot4.showEffect, slot1 == battle.EffectResType.BuffEffectInHolder)
		slot0.resKeyMap[slot1][slot2] = slot5

		slot0:addResInfo(slot1, slot2, {
			visible = true,
			id = slot4.id,
			cfgId = slot4.cfgId
		})
		slot0:excuteProcess("addSprite", slot5)

		if slot4.pos and (slot4.pos < 3 or slot4.pos > 6) then
			slot0:add(battle.EffectResType.FollowToScale, slot2, slot3, {
				id = slot4.id,
				cfgId = slot4.cfgId,
				spr = slot6
			})
			slot0.sprite:updateBuffeffectsScale()
		end

		return slot6, true
	end

	slot5.count = slot5.count + 1

	if slot5.count == 0 then
		slot0.resKeyMap[slot1][slot2] = nil

		return
	end

	return slot5.spr, false
end

function EffectResManager.remove(slot0, slot1, slot2, slot3)
	if not slot0.resKeyMap[slot1][slot2] then
		uv4 = "resKeyMap"
		slot4 = slot4(nil, 0)
	end

	slot0:removeResInfo(slot1, slot2, slot3)

	slot4.count = slot4.count - 1

	if slot4.spr == nil then
		slot0.resKeyMap[slot1][slot2] = slot4

		return
	end

	if slot4.count == 0 then
		slot0.resKeyMap[slot1][slot2] = nil

		if slot4.spr then
			if slot1 == battle.EffectResType.FollowToScale then
				return
			else
				slot0:remove(battle.EffectResType.FollowToScale, slot2, slot3)
			end

			return slot5
		end
	end
end

function EffectResManager.passOneWaveClean(slot0)
	for slot4, slot5 in pairs(slot0.resKeyMap) do
		if battle.EffectResType.FollowSprite ~= slot4 then
			for slot9, slot10 in pairs(slot5) do
				if slot10.spr then
					removeCSprite(slot11)
				end
			end

			slot0.resKeyMap[slot4] = {}
		end
	end

	slot1 = slot0.sprite ~= slot0.battleView and slot0.sprite or nil
	uv3 = "pairs"

	for slot5, slot6 in pairs(slot3) do
		if battle.EffectResType.FollowSprite ~= slot5 then
			if slot1 ~= nil or slot6 then
				slot0.resKeyMap[slot5] = {}
				slot0.resKeyInfoMap[slot5] = {}
				slot0.resKeyMapPower[slot5] = {}
			end

			if slot1 and slot6 then
				slot0:bind(slot5, slot0.battleView.effectResManager)
			end
		end
	end
end

require("easy.sprite")
require("battle.views.lifebar")

globals.BattleSprite = class("BattleSprite", cc.Node)

function globals.newCSpriteWithOption(slot0, ...)
	slot2 = gEffectOptionCsv[slot0]

	if newCSprite(slot0, ...):isSpine() and slot2 ~= nil then
		slot1:getAni():setTwoColorTint(slot2)
	end

	return slot1
end

function BattleSprite.ctor(slot0, slot1, slot2, slot3, slot4)
	slot0.battleView = slot1
	slot0.model = slot2
	slot0.key = slot3
	slot0.args = slot4
	slot0.type = slot4.type
	slot0.spineEventMap = {}
	slot0.debug = {
		enabled = false
	}
	slot0.effectDebug = {
		enabled = false
	}
	slot0.relationshipStatus = "showRelationship"
	slot0.skillSceneTag = CVector.new()
	slot0.followSprite = {}
	slot0.aniEffectPlayIDMap = {}
	slot0.replaceView = nil
	slot0.canSetVisible = true
	slot0.refreshBuffIconOnce = false
	slot0.skillJumpSwitchOnce = false
	slot0.recordOrderDataTb = {}
	slot0.skins = CVector.new()
	slot0.actionTable = {}
	slot0.actionState = battle.SpriteActionTable.run

	slot0:resetActionTab()

	slot0.buffEffectTag = {}
end

function BattleSprite.init(slot0)
	slot0:initUnitData()

	slot0.monsterCfg = slot0.model.monsterCfg
	slot0.force = battleEasy.getForce(slot0.seat)
	slot0.forceFaceTo = slot0.force == 1 and 1 or -1
	slot0.faceTo = slot0.forceFaceTo
	slot0.posAdjust = battleEasy.priorDataTable(slot0:getPosAdjust(), "posAdjust")
	slot0.beHitTime = 200

	if slot0.monsterCfg and slot0.monsterCfg.posAdjust and slot0.monsterCfg.posAdjust[slot0.seat - 6] ~= 0 then
		slot0.posAdjust:set(cc.p(slot0.monsterCfg.posAdjust[slot0.seat - 6].x, slot0.monsterCfg.posAdjust[slot0.seat - 6].y), "init")
	end

	slot1, slot2 = slot0:getSelfPos()
	slot0.posXY = cc.p(slot1, slot2)
	slot0.posZ = battleEasy.priorDataTable(slot2, "posZ")
	slot0._scale = nil
	slot0._scaleX = nil
	slot0._scaleY = nil
	slot0.battleMovePosZ = 0
	slot0.effectManager = battleEffect.Manager.new("BattleSprite." .. slot0.model.id)
	slot0.effectProcessArgs = {}

	slot0:loadSprite(slot0.unitRes, battle.SpriteLayerZOrder.selfSpr)

	slot0.deathEffect = {
		action = "effect",
		res = "effect/death.skel"
	}
	slot0.spineActionScales = {}
	slot0.spinePrevAction = nil

	if slot0.unitCfg.scaleCMode == 2 then
		for slot6, slot7 in csvPairs(slot0.unitCfg.skillList) do
			if csv.skill[slot7] and slot8.spineAction then
				slot0.spineActionScales[slot8.spineAction] = slot0.unitCfg.scale
			end
		end
	end

	slot0:initLifeBar()
	slot0:initNatureQuan()
	slot0:initGroundRing()

	slot0.effectResManager = EffectResManager.new(slot0)

	slot0:setPosition(slot0.posXY)

	slot0.buffEffectsMap = {}
	slot0.buffEffectHolderMap = {}
	slot0.buffEffectsFollowObjToScale = {}
	slot0.specBindEffectCache = {}
	slot0.effectJumpCache = {}
	slot0.startYinyingPos = slot0.sprite:getBonePosition("yinying")

	slot0:updHitPanel()
end

function BattleSprite.initLifeBar(slot0)
	slot0.lifebar = CLifeBar.new(slot0.model, slot0.battleView)

	slot0:add(slot0.lifebar, battle.SpriteLayerZOrder.lifebar, "lifebar")
end

function BattleSprite.initQuan(slot0, slot1, slot2, slot3)
	slot4 = newCSpriteWithOption(slot1)
	slot5 = slot0.natureQuan:getContentSize()

	slot4:addTo(slot0.natureQuan, slot3):setScale(1):xy(slot5.width / 2, slot5.height / 2):hide():play(slot2)

	return slot4
end

function BattleSprite.initNatureQuan(slot0)
	slot0.natureQuan = cc.Node:create()

	slot0.natureQuan:hide():anchorPoint(0.5, 1):xy(slot0.unitCfg.everyPos.hitPos)
	slot0:add(slot0.natureQuan, battle.SpriteLayerZOrder.quan, "nature_quan")

	slot1 = slot0.natureQuan:getContentSize()
	slot2 = ccui.ImageView:create(battle.SpriteRes.natureQuanTxtDi)

	slot2:addTo(slot0.natureQuan, -5):xy(slot1.width / 2, slot1.height / 2)

	slot0.natureQuan.textDi = slot2
	slot0.natureQuan.canShowTextDi = true
	slot0.natureQuan.canSelect = slot0:initQuan(battle.SpriteRes.natureQuan, "xuanzhong_loop", 1)

	slot0.natureQuan.canSelect:show()

	slot0.natureQuan.cantSelect = slot0:initQuan(nil, , 2)
end

function BattleSprite.initGroundRing(slot0)
	slot0.groundRing = newCSpriteWithOption(battle.SpriteRes.groundRing)

	slot0.groundRing:addTo(slot0, battle.SpriteLayerZOrder.ground):hide():play("effect_loop")

	slot0.groundRingVisible = battleEasy.priorDataTable(false, "groundRingVisible")
end

function BattleSprite.initUnitData(slot0, slot1)
	slot0.id = slot0.model.id
	slot0.seat = slot0.seat or slot0.model.seat
	slot0.unitID = slot0.model.unitID
	slot0.unitCfg = csv.unit[slot0.unitID]
	slot0.unitSpecBind = slot0.unitCfg.specBind
	slot0.unitRes = slot1 or slot0.unitCfg.unitRes
	slot0.cardID = slot0.model.cardID
	slot0.cardCfg = csv.cards[slot0.unitCfg.cardID]
end

function BattleSprite.getSeat(slot0)
	return slot0.seat
end

function BattleSprite.setSeat(slot0, slot1)
	slot0.seat = slot1
end

function BattleSprite.loadSprite(slot0, slot1, slot2)
	if slot1 then
		slot0.sprite = newCSpriteWithOption(slot1)
		slot0.spriteVisible = battleEasy.priorDataTable(true, "spriteVisible")

		slot0.sprite:setPosition(cc.p(0, 0))
		slot0.sprite:setSpriteEventHandler(handler(slot0, slot0.onSpriteEvent))
		slot0:add(slot0.sprite, slot2)
		slot0:setScale(1)
		slot0:setSkin()
	end
end

function BattleSprite.reloadUnit(slot0, slot1)
	slot0.sprite:removeAnimation()
	slot0:initUnitData(slot1)

	slot0._scale = nil
	slot0._scaleX = nil
	slot0._scaleY = nil
	slot0.actionState = battle.SpriteActionTable.run

	slot0:loadSprite(slot0.unitRes, battle.SpriteLayerZOrder.selfSpr)
	slot0.sprite:setPosition(cc.p(slot0.sprite:getPositionX(), slot0.sprite:getPositionY()))
	slot0:onSetSpriteVisible()
	slot0:setActionState(battle.SpriteActionTable.standby)
end

function BattleSprite.addToLayer(slot0, slot1)
	if slot0.battleView[slot1] then
		slot0:retain()
		slot0:removeFromParent()
		slot2:add(slot0, 999)
		slot0:release()
	end
end

function BattleSprite.updateLifeBarState(slot0, slot1)
	slot0.lifebar:setVisible(slot1)

	slot0.lifebar.canSetVisible = slot1
end

function BattleSprite.pauseAnimation(slot0)
	slot0.isPausing = true

	if slot0.sprite then
		slot0.sprite:pause()
	end

	for slot4, slot5 in pairs(slot0.buffEffectsMap) do
		if slot5.sprite then
			slot5.sprite:pause()
		end
	end
end

function BattleSprite.resumeAnimation(slot0)
	slot0.isPausing = nil

	if slot0.sprite then
		slot0.sprite:resume()
	end

	for slot4, slot5 in pairs(slot0.buffEffectsMap) do
		if slot5.sprite then
			slot5.sprite:resume()
		end
	end
end

function BattleSprite.getFaceTo(slot0)
	return slot0.faceTo
end

function BattleSprite.pauseSprite(slot0)
	slot0.isPausing = true

	if slot0.sprite then
		slot0.sprite:pause()
	end
end

function BattleSprite.resumeSprite(slot0)
	slot0.isPausing = nil

	if slot0.sprite then
		slot0.sprite:resume()
	end
end

function BattleSprite.setPlaySpeed(slot0, slot1)
	if slot0.sprite then
		slot0.sprite:setAnimationSpeedScale(slot1)
	end
end

function BattleSprite.setSpriteOpacity(slot0, slot1)
	slot0:curShowSprite():setCascadeOpacityEnabled(true)
	slot0:curShowSprite():setOpacity(slot1)

	slot0:curShowSprite()._opacity = slot1
end

function BattleSprite.objToBlank(slot0, slot1)
	transition.executeSequence(slot0):scaleTo(slot1.startLast / 1000, slot1.scale):delay(slot1.delayLast / 1000):scaleTo(slot1.endLast / 1000, 1):done()
end

function BattleSprite.objToHideEff(slot0, slot1)
	for slot5, slot6 in slot0.effectResManager:pairs(battle.EffectResType.BuffEffectInHolder) do
		if slot6.spr then
			if not slot1 then
				if slot0.effectResManager:getKeyInResInfoBy(battle.EffectResType.BuffEffectInHolder, slot5, "objToHideEffVisible", "last") == nil then
					slot8 = slot0.effectResManager:excuteProcess("objToHideEff", slot6, slot1)
				end

				slot7:setVisible(slot8)
			else
				slot7:setVisible(slot0.effectResManager:excuteProcess("objToHideEff", slot6, slot1) and slot0.effectResManager:getKeyInResInfoBy(battle.EffectResType.BuffEffectInHolder, slot5, "visible", "last"))
			end
		end
	end

	for slot5, slot6 in slot0.effectResManager:pairs(battle.EffectResType.FollowSprite) do
		slot6.spr:objToHideEff(slot1, slot0)
	end

	gRootViewProxy:notify("setBuffIconVisible", slot0, true)
end

function BattleSprite.setGLProgram(slot0, slot1)
	slot0.sprite:setGLProgram(slot1)

	for slot5, slot6 in pairs(slot0.buffEffectsMap) do
		if slot6.sprite then
			slot6.sprite:setGLProgram(slot1)
		end
	end
end

function BattleSprite.setScale(slot0, slot1, slot2)
	slot0.scaleX = nil
	slot0.scaleY = nil

	cc.Node.setScale(slot0, 1)

	if slot1 ~= slot0._scale or slot2 then
		slot0._scale = slot1

		slot0:setScaleX(slot0.faceTo * slot1, slot2)
		slot0:setScaleY(slot1, slot2)
	end
end

function BattleSprite.setShowFaceTo(slot0, slot1)
	if slot1 > 0 and slot0._scaleX > 0 then
		return
	end

	if slot1 < 0 and slot0._scaleX < 0 then
		return
	end

	if slot0._scaleX or slot0._scaleX == 0 then
		slot0._scaleX = slot1 > 0 and 1 or -1
	else
		slot0._scaleX = -slot0._scaleX
	end

	slot0.sprite:setScaleX(-slot0.sprite:getScaleX())
end

function BattleSprite.setScaleX(slot0, slot1, slot2)
	cc.Node.setScaleX(table.getraw(slot0), 1)

	if slot1 ~= slot0._scaleX or slot2 then
		slot0._scaleX = slot1

		slot0:curShowSprite():setScaleX(slot1 * slot0.unitCfg.scaleX * slot0.unitCfg.scale * slot0.unitCfg.scaleC)
	end
end

function BattleSprite.setScaleY(slot0, slot1, slot2)
	cc.Node.setScaleY(table.getraw(slot0), 1)

	if slot1 ~= slot0._scaleY or slot2 then
		slot0._scaleY = slot1

		slot0:curShowSprite():setScaleY(slot1 * slot0.unitCfg.scale * slot0.unitCfg.scaleC)
	end
end

function BattleSprite.getScale(slot0)
	return slot0._scale or 1
end

function BattleSprite.getScaleX(slot0)
	return slot0._scaleX or 1
end

function BattleSprite.getScaleY(slot0)
	return slot0._scaleY or 1
end

function BattleSprite.getMovePosZ(slot0)
	return slot0.battleMovePosZ
end

function BattleSprite.getPosBySeat(slot0, slot1)
	slot2, slot3 = nil

	if slot1 < 0 then
		slot3 = battle.StandingPos[99].y
		slot2 = battle.StandingPos[99].x
	elseif slot1 <= 6 or slot1 > 12 then
		slot3 = battle.StandingPos[slot1].y
		slot2 = battle.StandingPos[slot1].x
	else
		slot3 = battle.StandingPos[slot1 - 6].y
		slot2 = display.width - battle.StandingPos[slot1 - 6].x
	end

	return slot2 + slot0.posAdjust:get().x, slot3 + slot0.posAdjust:get().y
end

function BattleSprite.getSelfPos(slot0)
	return slot0:getPosBySeat(slot0:getSeat())
end

function BattleSprite.setCurPos(slot0, slot1)
	slot0.posXY = slot1
end

function BattleSprite.getCurPos(slot0)
	return slot0.posXY.x, slot0.posXY.y
end

function BattleSprite.curPosEqual(slot0, slot1, slot2)
	return slot0.posXY.x == slot1 and slot0.posXY.y == slot2
end

function BattleSprite.getAttackPos(slot0, slot1, slot2, slot3)
	slot4, slot5 = nil
	slot6 = slot3 and -1 or 1

	if slot1 == battle.AttackPosIndex.selfPos then
		return slot0:getSelfPos()
	elseif slot1 <= 6 or slot1 == battle.AttackPosIndex.center then
		slot5 = battle.AttackPos[slot1].y
		slot4 = battle.AttackPos[slot1].x
	else
		slot5 = battle.AttackPos[slot1 - 6].y
		slot4 = display.width - battle.AttackPos[slot1 - 6].x
	end

	slot7 = 1

	if slot0.unitCfg.scaleCMode == 1 then
		slot7 = slot0.unitCfg.scaleC
	end

	return slot4 + slot0.faceTo * slot2.x * slot7 * slot6, slot5 + slot2.y - 1
end

function BattleSprite.getProtectPos(slot0, slot1, slot2)
	slot3, slot4 = nil

	if slot1 <= 6 or slot1 >= 13 then
		slot4 = battle.ProtectPos[slot1].y
		slot3 = battle.ProtectPos[slot1].x
	else
		slot4 = battle.ProtectPos[slot1 - 6].y
		slot3 = display.width - battle.ProtectPos[slot1 - 6].x
	end

	slot5 = 1

	if slot0.unitCfg.scaleCMode == 1 then
		slot5 = slot0.unitCfg.scaleC
	end

	return slot3 + slot0.faceTo * slot2.x * slot5, slot4 + slot2.y - 1
end

function BattleSprite.updHitPanel(slot0)
	if slot0.battleView:onViewProxyCall("getObjHitPanel", slot0.seat) then
		slot1:setVisible(true)
		slot1:setEnabled(true)
		slot1:setTouchEnabled(true)

		slot2, slot3 = slot0:getSelfPos()
		slot4 = slot0.model.unitCfg.everyPos.hitPos

		slot1:setAnchorPoint(0.5, 0)
		slot1:setPosition(slot2 + slot4.x, slot3 + slot4.y)

		slot7 = slot0.model.unitCfg.rectSize

		slot1:setContentSize(cc.size(slot7.x, slot7.y))
	end
end

function BattleSprite.onUpdate(slot0, slot1)
	return slot0.effectManager:update(slot1)
end

function BattleSprite.onChangeDeathEffect(slot0, slot1)
	slot0.deathEffect = slot1
end

function BattleSprite.getActionName(slot0, slot1)
	slot2 = nil

	if not slot0.actionTable[slot1] then
		return slot1
	end

	for slot6, slot7 in slot0.actionTable[slot1]:pairs() do
		if not slot7.linkSpine then
			slot2 = slot7

			break
		end

		if slot0.unitRes and slot7.linkSpine[slot0.unitRes] == true then
			slot2 = slot7

			break
		end
	end

	return slot2 and slot2.action or slot1
end

function BattleSprite.setActionState(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot0.actionState == "win_loop" then
		return
	end

	if slot0.actionState == slot1 then
		if not battle.LoopActionMap[slot1] then
			if not slot0.actionCompleteCallback then
				slot0.actionCompleteCallback = slot2
			end

			slot0:onPlayState(slot1)
		end

		return
	end

	if slot0.actionCompleteCallback then
		slot0.actionCompleteCallback()
	end

	slot0.actionState = slot1
	slot0.actionCompleteCallback = slot2

	slot0:onPlayState(slot1)
end

function BattleSprite.onPlayState(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.sprite:play(slot0:getActionName(slot1)) and slot0.actionCompleteCallback then
		errorInWindows(slot2 .. " no such animation in " .. slot0.sprite.__aniRes)

		slot0.actionCompleteCallback = nil

		slot0.actionCompleteCallback()
	end
end

function BattleSprite.addActionCompleteListener(slot0, slot1)
	slot0.actionCompleteCallback = slot0.actionCompleteCallback and callbacks.new(slot0.actionCompleteCallback, slot1) or slot1

	return slot0.actionCompleteCallback
end

function BattleSprite.showGuide(slot0, slot1, slot2, slot3)
	slot4 = 368
	slot5 = 162

	if not slot0.qipao then
		slot0.qipao = newCSpriteWithOption()

		slot0.qipao:setContentSize(cc.size(slot4, slot5))

		slot6 = slot0.unitCfg.everyPos.lifePos

		slot0.qipao:addTo(slot0.battleView.gameLayer, battle.SpriteLayerZOrder.qipao):xy(cc.p(slot0:getPositionX() + slot6.x, slot0:getPositionY() + slot6.y + 20)):anchorPoint(1, 0)

		slot7 = cc.Scale9Sprite:create("city/gate/bg_dialog.png")

		slot7:setCapInsets(CCRectMake(40, 60, 1, 1))
		slot7:size(cc.size(slot4, slot5))
		slot7:xy(cc.p(slot4 / 2, slot5 / 2))
		slot0.qipao:add(slot7)

		if slot0.force == 1 then
			slot7:setScaleX(-1)
			slot0.qipao:xy(cc.p(slot6.x + slot4, slot6.y + 20))
		end
	end

	slot0.qipao:show()
	slot0.qipao:removeChildByName("richText")

	slot6 = rich.createWithWidth("#C0x5b545b#" .. slot1, 30, deltaSize, slot4 - 35)

	slot6:setAnchorPoint(cc.p(0, 1))
	slot6:xy(25, slot5 - (slot5 - 17 - slot6:getContentSize().height) / 2)
	slot0.qipao:add(slot6, 3, "richText")
	transition.executeSequence(slot0.qipao):delay((slot2 or 1000) / 1000):func(function ()
		uv0 = "qipao"

		if slot0.qipao then
			uv0 = "qipao"

			slot0.qipao:hide()
		end

		uv0 = "hide"

		if slot0 then
			uv0 = "hide"

			slot0()
		end
	end):done()
end

function BattleSprite.resetPos(slot0)
	slot0:setVisible(true)
	slot0:setLocalZOrder(slot0.posZ:get())
	slot0:setRotation(0)
	slot0:stopAllActions()
	slot0:setActionState(battle.SpriteActionTable.standby)
	slot0:moveToPosIdx(slot0:getSeat())
	slot0:setScaleX(slot0.forceFaceTo)
	slot0:setScaleY(1)
end

function BattleSprite.resetActionTab(slot0)
	slot0.actionTable = {}

	for slot4, slot5 in pairs(battle.SpriteActionTable) do
		if slot5 ~= battle.SpriteActionTable.death then
			slot0:onPushAction(slot5, slot5)
		end
	end
end

function BattleSprite.isComeBacking(slot0, slot1)
	if slot1 ~= nil then
		slot0.comeBacking = slot1
	end

	return slot0.comeBacking
end

function BattleSprite.stopAllHolderAction(slot0)
	for slot4, slot5 in pairs(slot0.buffEffectHolderMap) do
		if slot5.isPlayId then
			for slot9, slot10 in slot5.datas:pairs() do
				if slot10.id == slot5.isPlayId then
					slot0:onPlayBuffHolderAction(slot4, slot10, true)

					slot5.isPlayId = nil

					break
				end
			end
		end
	end
end

function BattleSprite.onSetSpriteVisible(slot0, slot1, slot2, slot3)
	if slot0.changeImageSprite then
		slot0.sprite:setVisible(false)
	end

	if slot1 ~= nil and slot2 ~= nil then
		slot0.spriteVisible:set(slot1, slot2, slot3)
	end

	slot0:curShowSprite():setVisible(slot0.spriteVisible:get())
	slot0.battleView:onViewProxyNotify("updateSpriteLinkVisible", slot0.key)
end

function BattleSprite.getCurShowSpriteVisible(slot0)
	return slot0:curShowSprite():isVisible()
end

function BattleSprite.getSpriteVisible(slot0)
	return slot0.sprite:isVisible()
end

function BattleSprite.getPosAdjust(slot0)
	slot1 = slot0.args.offsetPos or cc.p(0, 0)

	return cc.p(slot0.forceFaceTo * slot1.x, slot1.y)
end

function BattleSprite.getBeAttackPosAdjust(slot0)
	return cc.p(0, 0)
end

function BattleSprite.updateFaceTo(slot0, slot1)
	slot0.force = slot1
	slot0.forceFaceTo = slot0.force == 1 and 1 or -1
	slot0.faceTo = slot0.forceFaceTo

	slot0:setScaleX(slot0.forceFaceTo)
end

function BattleSprite.setVisibleEnable(slot0, slot1)
	slot0.canSetVisible = slot1
end

function BattleSprite.setVisible(slot0, slot1)
	if not slot0.canSetVisible or slot0:isVisible() == slot1 then
		return
	end

	cc.Node.setVisible(table.getraw(slot0), slot1)
	slot0.battleView:onViewProxyNotify("updateSpriteLinkVisible", slot0.key)
end

function BattleSprite.addReplaceView(slot0, slot1, slot2)
	slot0.replaceView = slot1
end

function BattleSprite.removeReplaceView(slot0, slot1)
	slot0.replaceView = nil
end

function BattleSprite.checkSceneTag(slot0, slot1)
end

function BattleSprite.getRealUseView(slot0)
	slot1 = slot0

	if slot0.replaceView and slot0.replaceView:checkSceneTag(slot0.skillSceneTag:back()) then
		slot1 = slot0.replaceView
	end

	return slot1
end

function BattleSprite.pushApplySkillSceneTag(slot0, slot1)
	slot0.skillSceneTag:push_back(slot1)
end

function BattleSprite.popApplySkillSceneTag(slot0)
	slot0.skillSceneTag:pop_back()
end

function BattleSprite.showHero(slot0, slot1, slot2)
	if slot2.obj then
		slot0.groundRingVisible:set(slot1 and slot0.key == slot2.obj)
		slot0.groundRing:setVisible(slot0.groundRingVisible:get())
		slot0.natureQuan:setVisible(false)
	end

	slot0.lifebar:setVisible(slot1 and not slot2.hideLife)
	slot0:setVisible(slot1)
end

function BattleSprite.addFollowSpr(slot0, slot1, slot2)
	return slot0.effectResManager:add(battle.EffectResType.FollowSprite, slot1.key, nil, {
		id = slot1.key,
		spr = slot1
	})
end

function BattleSprite.removeFollowSpr(slot0, slot1)
	slot0.effectResManager:remove(battle.EffectResType.FollowSprite, slot1.key, slot1.key)
end

function BattleSprite.sceneDelFollowObj(slot0, slot1)
	for slot5, slot6 in slot0.effectResManager:pairs(battle.EffectResType.FollowSprite) do
		gRootViewProxy:notify("sceneDelObj", slot6.spr.key)
	end
end

function BattleSprite.sceneDelObj(slot0, slot1)
	slot0:unscheduleUpdate()
	slot0:retain()
	slot0:sceneDelFollowObj(slot1)
	slot0:removeSelf()
	slot1:addChild(slot0)
	slot0:release()
end

function BattleSprite.onShadeByShadow(slot0)
	slot0.natureQuan:show()
	slot0.natureQuan.canSelect:hide()
	slot0.natureQuan.textDi:hide()
	slot0.natureQuan.cantSelect:show()
end

function BattleSprite.onAddCantSelect(slot0, slot1, slot2)
	slot0.natureQuan.cantSelect:removeSelf()

	slot0.natureQuan.cantSelect = slot0:initQuan(slot1, slot2, 2)
end

function BattleSprite.curShowSprite(slot0)
	if slot0.changeImageSprite then
		return slot0.changeImageSprite
	end

	return slot0.sprite
end

slot4 = setmetatable({}, {
	__index = function ()
		return function ()
		end
	end
})

function BattleSprite.aniEffectProxy(slot0, slot1, slot2)
	if slot0.aniEffectPlayIDMap[slot1] and slot2 < slot0.aniEffectPlayIDMap[slot1] then
		uv3 = "aniEffectPlayIDMap"

		return slot3
	end

	slot0.aniEffectPlayIDMap[slot1] = slot2

	return slot0
end

function BattleSprite.aniEffectCall(slot0, slot1, slot2, slot3)
	if slot0.aniEffectPlayIDMap[slot1] and slot2 < slot0.aniEffectPlayIDMap[slot1] then
		uv4 = "aniEffectPlayIDMap"

		return slot4
	end

	slot0.aniEffectPlayIDMap[slot1] = slot2

	return slot3()
end

function BattleSprite.onPushAction(slot0, slot1, slot2, slot3, slot4)
	if slot0.actionTable[slot1] == nil then
		slot0.actionTable[slot1] = CList.new()
	end

	slot0.actionTable[slot1]:push_front({
		action = slot2,
		from = slot3,
		linkSpine = slot4
	})
end

function BattleSprite.onPopAction(slot0, slot1, slot2)
	for slot6, slot7 in slot0.actionTable[slot1]:pairs() do
		if slot7.from == slot2 then
			slot0.actionTable[slot1]:erase(slot6)

			break
		end
	end
end

function BattleSprite.setSkin(slot0, slot1)
	slot2 = slot0.sprite:getAni()

	slot2:setSkin(slot1 or slot0.unitCfg.skin or "default")
	slot2:setToSetupPose()
end

require("battle.views.sprite_normal")
require("battle.views.sprite_effect")
require("battle.views.sprite_proxy")
require("battle.views.sprite_debug")
