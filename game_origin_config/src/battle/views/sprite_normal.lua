function BattleSprite.moveToPosIdx(slot0, slot1)
	slot2, slot3 = slot0:getPosBySeat(slot1)

	if slot2 and slot3 then
		slot0:setPosition(cc.p(slot2, slot3))
		slot0:setCurPos(cc.p(slot2, slot3))
	end
end

function BattleSprite.onDoShiftPos(slot0, slot1, slot2)
	slot3, slot4 = slot0:getPosBySeat(slot1)

	slot0:onAddEventEffect("moveTo", {
		speed = 1500,
		a = 1000,
		changeFaceTo = false,
		x = slot3,
		y = slot4
	}, false)

	slot0.seat = slot0.model.seat
	slot8 = slot3

	slot0:setCurPos(cc.p(slot8, slot4))
	slot0:updHitPanel()
	slot0:onAddToScene()

	for slot8 = 1, 1 do
		if not slot2 then
			break
		end

		if not slot2.onceEffectResPath or slot9 == "" then
			break
		end

		slot10 = newCSpriteWithOption(slot9)

		slot0:add(slot10, 12)
		slot10:play(slot2.onceEffectAniName or "effect")
		slot10:setSpriteEventHandler(function (slot0, slot1)
			if slot0 == sp.EventType.ANIMATION_COMPLETE then
				uv3 = "sp"

				removeCSprite(slot3)
			end
		end)

		slot13 = cc.p(0, 0)

		if slot2.onceEffectOffsetPos then
			slot13 = cc.pAdd(cc.p(0, 0), slot11)
		end

		slot10:setPosition(slot13):scale(2)
	end
end

function BattleSprite.getMoveToTargetPosition(slot0, slot1, slot2)
	slot3, slot4 = slot0:getAttackPos(slot1, slot2.posC, slot2.attackFriend)

	if slot1 ~= slot0:getSeat() and (slot2.cameraNear == 1 or slot2.cameraNear == 2) then
		slot0.skillNeedCameraFix = true
		slot3, slot4 = slot0:getAttackPos(slot1, cc.p(slot2.cameraNear_posC and slot2.cameraNear_posC.x or 0, slot2.cameraNear_posC and slot2.cameraNear_posC.y or 0), slot2.attackFriend)
	end

	return slot3, slot4
end

function BattleSprite.getMoveToTargetFrontPosition(slot0, slot1, slot2)
	slot3, slot4 = slot0:getProtectPos(slot1, cc.p(0, 0))

	if slot1 ~= slot0:getSeat() and (slot2.cameraNear == 1 or slot2.cameraNear == 2) then
		slot0.skillNeedCameraFix = true
		slot3, slot4 = slot0:getProtectPos(slot1, cc.p(slot2.cameraNear_posC and slot2.cameraNear_posC.x or 0, slot2.cameraNear_posC and slot2.cameraNear_posC.y or 0))
	end

	return slot3, slot4
end

function BattleSprite.getMoveTime(slot0, slot1, slot2, slot3, slot4)
	slot5, slot6 = slot0:getMoveToTargetPosition(slot1, slot2)
	slot7 = slot3 or 1000
	slot9, slot10 = slot0:getCurPos()
	slot11 = cc.pGetLength(cc.p(slot5 - slot9, slot6 - slot10))
	slot12 = 0

	return slot4 and (math.sqrt(math.max(slot7 * slot7 + 2 * slot8 * slot11, 0)) - slot7) / slot8 or slot11 / slot7
end

function BattleSprite.onAddToScene(slot0)
	slot0:setVisible(false)
	slot0:resetPosZ()
	slot0:setLocalZOrder(slot0.posZ:get())
	slot0:setName("object" .. slot0.seat)
end

function BattleSprite.resetPosZ(slot0, slot1)
	slot2, slot3 = slot0:getSelfPos()

	slot0.posZ:set(2 - math.floor((slot0:getSeat() + 2) / 3) % 2 == 1 and 2 * slot4 or display.height - (slot1 or slot3) - 1, "reset")

	slot0.battleMovePosZ = 2 * slot4
end

function BattleSprite.onMoveToTarget(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = true

	if slot1 == battle.AttackPosIndex.selfPos and not slot2.attackFriend then
		slot6 = false
	end

	slot7 = slot0.battleView:onViewProxyCall("getSceneObj", slot4)
	slot9, slot10 = slot0:getRealUseView():getMoveToTargetPosition(slot1, slot2)

	if slot1 ~= battle.AttackPosIndex.selfPos and slot1 ~= battle.AttackPosIndex.center and slot7 then
		slot11 = slot7.posAdjust:get()
		slot12 = slot7:getBeAttackPosAdjust()
		slot9 = slot9 + slot11.x + slot12.x
		slot10 = slot10 + slot11.y + slot12.y
	end

	slot11 = slot2.attackFriend and -1 * slot0.faceTo

	slot8:onAddEventEffect("callback", {
		func = function ()
			uv0 = "skillNeedCameraFix"

			if slot0.skillNeedCameraFix then
				uv0 = "skillNeedCameraFix"
				uv3 = "battleView"

				slot0.battleView:onViewProxyNotify("skillStartStageMove", slot3.cameraNear)
			end
		end
	}, slot3)

	if slot2.isCantMoveBigSkill then
		slot8:setCurPos(cc.p(slot9, slot10))
		slot8:setActionState(battle.SpriteActionTable.standby)
	elseif slot6 then
		slot8:onAddEventEffect("moveTo", {
			a = 1000,
			speed = 1500,
			timeScale = slot2.timeScale,
			delayMove = slot2.delayBeforeMove,
			costTime = slot2.moveCostTime,
			x = slot9,
			y = slot10,
			changeFaceTo = slot11
		}, slot3)
	end

	if slot5 then
		slot5.view:proxy():onMoveToTargetFront(slot5.targetID, slot2, slot7.posAdjust:get(), slot3)
		slot5.view:proxy():setLocalZOrder(math.max(slot7:getLocalZOrder(), slot0:getLocalZOrder()) + 1)
	end
end

function BattleSprite.onMoveToTargetFront(slot0, slot1, slot2, slot3, slot4)
	slot5, slot6 = slot0:getMoveToTargetFrontPosition(slot1, slot2)
	slot7 = slot5 + slot3.x
	slot8 = slot6 + slot3.y
	slot9 = nil

	if slot1 <= 6 and slot0:getSeat() > 6 or slot0:getSeat() <= 6 and slot1 > 6 then
		slot9 = -1 * slot0.faceTo
	end

	slot0:onAddEventEffect("moveTo", {
		speed = 1500,
		a = 1000,
		x = slot7,
		y = slot8,
		changeFaceTo = slot9
	}, slot4)
end

function BattleSprite.onSortReloadUnit(slot0, slot1, slot2, slot3)
	slot4 = csv.unit[slot1]

	if slot0.unitID == slot0.model.unitID then
		return
	end

	for slot8, slot9 in ipairs(slot0.specBindEffectCache) do
		removeCSprite(slot9.effect)
	end

	slot0:stopAllHolderAction()

	slot0.specBindEffectCache = {}

	slot0:reloadUnit()

	slot5 = slot0.model.unitCfg

	slot0.lifebar:setPosition(slot5.everyPos.lifePos)
	slot0.lifebar:setScale(slot5.lifeScale)

	slot0.refreshBuffIconOnce = true

	slot0:onPlayUnitSpecBind()
end

slot0 = {
	"shader"
}

function BattleSprite.onSkillBefore(slot0, slot1, slot2, slot3, slot4)
	slot0:onAddEventEffect("callback", {
		func = function ()
			uv0 = "battleView"

			if slot0 then
				uv0 = "runDefer"
				uv2 = "battleView"

				slot0.battleView:runDefer(slot2.skillStartAddBuffsPlayFuncs)
			end
		end
	}, slot3)
	slot0:onAddEventEffect("callback", {
		func = function ()
			uv0 = "battleView"

			if slot0 then
				uv0 = "runDefer"
				uv2 = "battleView"

				slot0.battleView:runDefer(slot2.skillStartTriggerBuffsPlayFuncs)
			end
		end
	}, slot3)
	slot0:pushApplySkillSceneTag(slot4)

	if slot2 == battle.MainSkillType.NormalSkill then
		uv6 = "onAddEventEffect"

		for slot8, slot9 in ipairs(slot6) do
			slot0:onCloseBuffHolderAction(slot9)
		end
	end

	if slot4 and slot4.isBigSkill and slot0 ~= slot0:getRealUseView() then
		slot0:setVisible(false)
	end
end

function BattleSprite.onPlayAction(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	if slot0.isPausing then
		return
	end

	if not slot0:getRealUseView():getCurShowSpriteVisible() then
		errorInWindows("Seat %s, origin unitID %s, is not visible but try to play action %s", slot0.model.seat, slot0.model.originUnitID, slot1)
	end

	if battle.LoopActionMap[slot1] then
		table.insert(slot0.battleView.effectJumpCache, slot5:onAddEventEffect("effect", {
			action = slot1,
			lifetime = slot2,
			isCantMoveBigSkill = slot4
		}, slot3))

		return
	end

	table.insert(slot0.battleView.effectJumpCache, slot5:onAddEventEffect("effect", {
		action = slot1,
		lifetime = slot2,
		onComplete = function ()
		end,
		isCantMoveBigSkill = slot4
	}, slot3))
end

function BattleSprite.onUltJumpShowNum(slot0, slot1)
	slot0:onAddEventEffect("callback", {
		func = function ()
			uv0 = "battleView"
			uv3 = "onViewProxyNotify"

			slot0.battleView:onViewProxyNotify("showNumber", slot3)
		end
	}, false)
end

function slot1(slot0, slot1)
	return slot0.id < slot1.id
end

function BattleSprite.onUltJumpEnd(slot0)
	slot0:onResetSkillEnd()
	slot0:onAddEventEffect("callback", {
		func = function ()
			uv0 = "setActionState"
			slot1 = slot0

			slot0.setActionState(slot1, battle.SpriteActionTable.standby)

			uv1 = "setActionState"

			performWithDelay(slot1.battleView, function ()
				uv0 = "battleView"

				slot0.battleView:resetEffectEventEnable()
			end, 0)
		end
	}, false)
end

function BattleSprite.onResetSkillEnd(slot0, slot1)
	slot0:onAddEventEffect("callback", {
		func = function ()
			uv0 = "skillNeedCameraFix"

			if slot0.skillNeedCameraFix then
				uv0 = "skillNeedCameraFix"
				slot0.skillNeedCameraFix = false
				uv0 = "skillNeedCameraFix"

				slot0.battleView:onViewProxyNotify("skillEndStageMoveBack")
			end

			uv0 = "skillNeedCameraFix"

			if slot0.battleView.bgmChanged then
				slot0 = audio.resumeMusic

				slot0()

				uv0 = "skillNeedCameraFix"
				slot0.battleView.bgmChanged = false
			end
		end
	}, false)

	if slot1 == battle.SkillType.NormalSkill or slot1 == battle.SkillType.PassiveCombine then
		slot0:onAddEventEffect("callback", {
			func = function ()
				uv0 = "battleView"
				uv3 = "onViewProxyCall"

				for slot4, slot5 in maptools.order_pairs(slot0.battleView:onViewProxyCall("getSceneAllObjs"), slot3) do
					if not slot5:isComeBacking() then
						uv7 = "battleView"

						if slot5.id ~= slot7.id then
							slot5:resetPos()
						end
					end
				end
			end
		}, false)
	end
end

function BattleSprite.onObjSkillEnd(slot0, slot1, slot2, slot3)
	slot0:onAddEventEffect("callback", {
		func = function ()
			uv0 = "battleView"

			if slot0 then
				uv0 = "runDefer"
				uv2 = "battleView"

				slot0.battleView:runDefer(slot2.skillEndAddBuffsPlayFuncs)
			end

			uv0 = "battleView"

			if slot0 then
				uv0 = "runDefer"
				uv2 = "battleView"

				slot0.battleView:runDefer(slot2.skillEndTriggerBuffsPlayFuncs)
			end

			uv0 = "battleView"

			if slot0 then
				uv0 = "battleView"

				if slot0.skillEndDrops then
					uv0 = "runDefer"
					uv3 = "battleView"

					slot0.battleView:onViewProxyNotify("dropShow", slot3.skillEndDrops)
				end
			end
		end
	}, slot3)

	if slot0.battleView:getEffectEventEnable() then
		slot0:onResetSkillEnd(slot2, slot3)
	end

	slot0:onAddEventEffect("callback", {
		func = function ()
			uv0 = "battleView"

			if slot0 then
				uv0 = "runDefer"
				uv2 = "battleView"

				slot0.battleView:runDefer(slot2.skillEndDeleteDeadObjs)
			end

			uv0 = "skillEndDeleteDeadObjs"

			if slot0 ~= battle.SkillType.NormalSkill then
				uv0 = "skillEndDeleteDeadObjs"

				if slot0 == battle.SkillType.PassiveCombine then
					uv0 = "runDefer"

					if slot0.model.force == 1 then
						uv0 = "runDefer"

						if not slot0.battleView:getSceneModel().autoFight then
							uv0 = "runDefer"

							slot0.battleView:onViewProxyNotify("showMain", true)
						end
					end
				end
			end
		end
	}, slot3)
end

function BattleSprite.onComeBack(slot0, slot1, slot2, slot3, slot4, slot5)
	function slot6(slot0)
		uv1 = "flashBack"

		if slot1.flashBack then
			slot0:onResetPos()
		else
			uv2 = "flashBack"
			slot2 = slot2.delayBeforeBack
			uv2 = "flashBack"
			slot2 = slot2.backCostTime
			uv2 = "flashBack"
			uv6 = "onResetPos"

			slot0:onAddEventEffect("comeBack", {
				delayMove = slot2,
				costTime = slot2,
				timeScale = slot2.timeScale
			}, slot6)
		end
	end

	if slot5 then
		for slot10, slot11 in ipairs(slot5) do
			slot6(slot11:proxy())
		end
	end

	if slot1 == battle.AttackPosIndex.selfPos and not slot3.attackFriend then
		return
	end

	slot6(slot0:getRealUseView())
end

function BattleSprite.onAfterComeBack(slot0, slot1, slot2)
	slot0:onAddEventEffect("callback", {
		func = function ()
			uv0 = "battleView"

			if slot0 then
				uv0 = "runDefer"
				uv2 = "battleView"

				slot0.battleView:runDefer(slot2.afterComeBackRecoverMp)
			end
		end
	}, slot2)
end

function BattleSprite.onResetPos(slot0)
	slot0:onAddEventEffect("callback", {
		func = function ()
			uv0 = "resetPos"

			slot0:resetPos()
		end
	})
end

function BattleSprite.onObjSkillOver(slot0, slot1)
	slot0:onAddEventEffect("callback", {
		func = function ()
			uv0 = "popApplySkillSceneTag"

			slot0:popApplySkillSceneTag()
		end
	}, slot1)
end

function BattleSprite.onNewBattleTurn(slot0)
	slot0:objToHideEff(false)
	slot0:onPlayBuffHolderAction()
	slot0:onPlayUnitSpecBind()

	for slot4, slot5 in pairs(slot0.buffEffectTag) do
		if slot5 == battle.buffEffectTag.delete then
			slot0.buffEffectTag[slot4] = nil
		end
	end
end

function BattleSprite.onPlayUnitSpecBind(slot0)
	slot1, slot2 = nil

	for slot6, slot7 in ipairs(slot0.unitSpecBind) do
		if not slot0.specBindEffectCache[slot6] then
			slot9 = newCSpriteWithOption(slot7.effect)

			nodetools.get(slot0, unpack(slot7.node)):addChild(slot9, slot7.pos[3])
			slot9:setPosition(cc.p(slot7.pos[1], slot7.pos[2]))
			slot9:setScale(slot7.scale or 1)
			slot9:setScaleX(slot0.faceTo * (slot7.scale or 1))

			slot0.specBindEffectCache[slot6] = {
				lastIndex = 0,
				effect = slot9
			}
		end

		if slot0.specBindEffectCache[slot6].lastIndex ~= battleCsv.doFormula(slot7.bind, {
			self = slot0.model
		}) + 1 then
			if slot7.action[slot9] then
				slot8.effect:play(slot10)

				slot8.lastIndex = slot9
			else
				errorInWindows("specBind(%s) action not has index(%s) ", slot0.unitID, slot9)
			end
		end
	end
end

function BattleSprite.onAttacting(slot0, slot1, slot2)
	slot0:onAddEventEffect("callback", {
		func = function ()
			uv0 = "battleView"

			if not slot0 then
				uv0 = "onViewProxyNotify"

				slot0.battleView:onViewProxyNotify("showLinkEffect", true)
			end

			uv0 = "onViewProxyNotify"
			slot0 = slot0.battleView
			slot0 = slot0.onViewProxyNotify
			uv3 = "battleView"
			uv4 = "onViewProxyNotify"
			slot4 = slot4.key

			slot0(slot0, "updateLinkEffect", slot3, slot4)

			uv0 = "onViewProxyNotify"
			slot0 = slot0:getRealUseView()
			slot1 = slot0.objToHideEff
			uv3 = "battleView"
			uv4 = "onViewProxyNotify"

			slot1(slot0, slot3, slot4)

			uv1 = "battleView"

			if slot1 then
				slot0.sprite._opacity = slot0.sprite:opacity()

				slot0.sprite:opacity(255)
			else
				slot0.sprite:opacity(slot0.sprite._opacity)
			end
		end
	}, slot2)
end

function BattleSprite.onDead(slot0, slot1)
	slot0:setDebugEnabled(false)
	slot0:setEffectDebugEnabled(false)

	if slot0.deathEffect.res == slot0.unitRes then
		slot0:onAddEventEffect("effect", {
			action = slot0.deathEffect.action,
			onComplete = slot1
		})

		return
	end

	slot5 = slot0.unitCfg.everyPos.hitPos

	slot0.lifebar:setVisible(false)
	transition.executeSequence(slot0.sprite):fadeOut(0.4):done()
	transition.executeSequence(slot0.sprite):delay(0.1):moveBy(1.2, slot5.x, slot5.y):done()
	transition.executeSequence(slot0.sprite):delay(0.1):scaleTo(1, 0.01):func(function ()
		uv0 = "battleView"

		if slot0.battleView.deathCache ~= nil then
			uv1 = "battleView"

			for slot3, slot4 in ipairs(slot1.battleView.deathCache) do
				slot4:removeSelf()
			end

			uv0 = "battleView"
			slot0.battleView.deathCache = {}
		end
	end):func(slot1 or function ()
	end):done()

	slot6 = newCSpriteWithOption(slot0.deathEffect.res)

	slot0:add(slot6)
	arraytools.push(slot0.battleView.deathCache, slot6)
	slot6:setLocalZOrder(999999)
	slot6:anchorPoint(0.5, 0.5):scale(2)
	slot6:play(slot0.deathEffect.action)
	slot6:setTimeScale(1.15)
end

function BattleSprite.onBeAttackPlayAni(slot0)
	slot0:play("beAttack")
	slot0:setSpriteEventHandler(function (slot0, slot1)
		if slot0 == sp.EventType.ANIMATION_COMPLETE then
			uv2 = "sp"

			slot2:play("standby_loop")
		end
	end)
end

function BattleSprite.onDealBuffEffectsMap(slot0, slot1, slot2, slot3)
	return gRootViewProxy:notify("dealBuffEffectsMap", slot0, slot1, slot2, slot3)
end

function BattleSprite.onShowBuffIcon(slot0, slot1, slot2, slot3)
	return gRootViewProxy:notify("showBuffIcon", slot0, slot1, slot2, slot3)
end

function BattleSprite.onShowBuffText(slot0, slot1)
	return gRootViewProxy:notify("showBuffText", slot0, slot1)
end

function BattleSprite.onShowBuffImmuneEffect(slot0, slot1)
	if gBuffGroupRelationCsv[slot1] and slot2.immuneEffect then
		gRootViewProxy:notify("showBuffText", slot0, string.format(battle.ShowHeadNumberRes.txtTypeImmune, slot2.immuneEffect))
	end
end

function BattleSprite.onAlterBattleScene(slot0, slot1)
	slot0.battleView:onEventEffect(nil, "callback", {
		func = function ()
			uv3 = "gRootViewProxy"

			gRootViewProxy:notify("alterBattleScene", slot3)
		end,
		delay = slot1.delay or 0
	})
end

function BattleSprite.onWeatherRefresh(slot0, slot1)
	return gRootViewProxy:notify("weatherRefresh", slot0, slot1)
end

function BattleSprite.onDelBuffIcon(slot0, slot1)
	return gRootViewProxy:notify("delBuffIcon", slot0, slot1)
end

function BattleSprite.onShowHeadNumber(slot0, slot1)
	return gRootViewProxy:notify("showHeadNumber", slot0, slot1)
end

function BattleSprite.onShowHeadText(slot0, slot1)
	if slot2.miss then
		slot4 = 0.15
		slot5 = -40 * slot0.faceTo
		slot6 = 0

		transition.executeSequence(slot0):delay(slot1.args.delay or 0):moveBy(slot4, slot5, slot6):delay(0.1):moveBy(slot4, -slot5, -slot6):done()
	end

	return gRootViewProxy:notify("showHeadText", slot0, slot1)
end

function BattleSprite.onShowBuffContent(slot0, slot1)
	if not slot1 or slot1 == "" then
		return
	end

	if not slot0 then
		return
	end

	if not newCSpriteWithOption(slot1) then
		return
	end

	slot0:add(slot2, 9999)
	slot2:setPosition(slot0.unitCfg.everyPos.hitPos)
	transition.executeSequence(slot2):delay(1):fadeOut(0.25):func(function ()
		uv1 = "removeCSprite"

		removeCSprite(slot1)
	end):done()
end

function BattleSprite.lockLifeBar(slot0, slot1)
	slot0.isLock = slot1
end

function BattleSprite.onUpdateLifebar(slot0, slot1)
	if slot1.skillType == battle.SkillType.NormalSkill and slot1.mainSkillType ~= battle.MainSkillType.BigSkill then
		slot0.lifebar:setVisible(true)
	end

	if slot0.isLock then
		return
	end

	slot0.lifebar:update(slot1)
end

function BattleSprite.onUpdateLifebarPoint(slot0, slot1)
	slot0.lifebar:updatePoint(slot1)
end

function BattleSprite.onUpdateComboPoint(slot0, slot1)
	slot0.lifebar:updateComboPoint(slot1)
end

function BattleSprite.showSkillSelectTextState(slot0, slot1, slot2, slot3)
	slot4 = nil

	if slot1 == 1 then
		-- Nothing
	elseif slot3 then
		slot4 = battle.RestraintTypeIcon[slot3]
	else
		slot4 = battle.RestraintTypeIcon[slot2]
	end

	slot0.natureQuan:show()
	slot0.natureQuan.canSelect:show()
	slot0.natureQuan.textDi:hide()

	if slot0.natureQuan.canShowTextDi and slot4 then
		slot0.natureQuan.textDi:show()
		slot0.natureQuan.textDi:loadTexture(slot4)
	end

	slot0.natureQuan.cantSelect:hide()
end

function BattleSprite.setShowTextDi(slot0, slot1)
	slot0.natureQuan.canShowTextDi = slot1
end

function BattleSprite.beHit(slot0, slot1, slot2)
	if slot2 then
		slot0.beHitTime = slot2

		if slot0.beHitTime > 0 then
			slot0:setActionState(battle.SpriteActionTable.hit)
		end
	else
		slot0.beHitTime = slot0.beHitTime - slot1

		if slot0.beHitTime <= 0 then
			slot0:setActionState(battle.SpriteActionTable.standby)
		end
	end
end

function BattleSprite.getLeftBeHitTime(slot0)
	return slot0.beHitTime or 0
end

function BattleSprite.onReloadUnit(slot0, slot1, slot2)
	slot0:reloadUnit(slot2)

	if slot1 then
		slot0:addToLayer(slot1)
	end
end

function BattleSprite.onShowHeldItemEffect(slot0, slot1)
	slot2 = csv.held_item.items[slot1]

	assert(slot2, "csv.held_item.items not has itemId: " .. slot1)

	slot3 = slot2.icon
	slot4 = slot2.quality
	slot5 = slot0.unitCfg.everyPos.hitPos
	slot8 = ccui.Layout:create():size(300, 300):anchorPoint(0.5, 0):xy(slot0:getPositionX() + slot5.x, slot0:getPositionY() + slot5.y + 150):z(battle.SpriteLayerZOrder.qipao + 10):addTo(slot0.battleView.gameLayer)

	if not newCSpriteWithOption("daojuchufa/daojuchufa.skel") then
		return
	end

	slot10:play("effect")
	slot10:setSpriteEventHandler(function (slot0, slot1)
		if slot0 == sp.EventType.ANIMATION_COMPLETE then
			uv3 = "sp"

			removeCSprite(slot3)
		end
	end)
	slot10:setPosition(cc.p(150, 150))
	slot8:addChild(slot10, 1)

	slot14 = ccui.ImageView:create(ui.QUALITY_BOX[slot4]):xy(150, 100):z(2):hide():addTo(slot8)
	slot15 = ccui.ImageView:create(slot3):xy(150, 100):z(3):scale(2):hide():addTo(slot8)
	slot16 = ccui.ImageView:create(string.format("common/icon/panel_icon_k%d.png", slot4)):xy(150, 100):z(4):hide():addTo(slot8)

	transition.executeSequence(slot8):delay(0.3):func(function ()
		error("Decompilation failed")
		-- Exception in function building!
		-- Traceback (most recent call last):
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
		--     return _build_function_definition(prototype, state.header)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
		--     node.statements.contents = _build_function_blocks(state, instructions)
		--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
		--     statement, line_marked_elements = _build_statement(state, addr, instruction)
		--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
		--     return _build_var_assignment(state, addr, instruction)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
		--     assn = func(*args, **kwargs)
		--            ^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
		--     expression = _build_const_expression(state, addr, instruction)
		--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
		--     return _build_string_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
		--     node.value = state.constants.complex_constants[index]
		--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end):moveBy(0.4, 0, 70):delay(1.3):func(function ()
		uv0 = "removeFromParent"

		slot0:removeFromParent()
	end):done()
end

function BattleSprite.onShowCounterAttackText(slot0, slot1, slot2)
	slot3 = slot2 == battle.ExtraAttackMode.prophet and battle.ShowHeadNumberRes.txtXfzr or battle.ShowHeadNumberRes.txtFj

	slot0.battleView:onEventEffect(nil, "callback", {
		delay = 0,
		func = function ()
			uv0 = "onShowBuffText"
			uv2 = "onShowBuffText"

			slot0:onShowBuffText(slot2)
		end
	})
end

function BattleSprite.onPlayCharge(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot2 then
		slot0:onPopAction(battle.SpriteActionTable.standby, "charge")

		if slot1.endCharing then
			table.insert(slot0.battleView.effectJumpCache, slot0:onAddEventEffect("effect", {
				action = slot1.endCharing.action,
				lifetime = slot1.endCharing.lifeTime,
				onComplete = function ()
					uv0 = "onPlayState"

					slot0:onPlayState(battle.SpriteActionTable.standby)
				end
			}))
		else
			slot0:onPlayState(battle.SpriteActionTable.standby)
		end
	else
		slot0:onPushAction(battle.SpriteActionTable.standby, slot1.charing.action, "charge")

		if slot1.startCharing then
			table.insert(slot0.battleView.effectJumpCache, slot0:onAddEventEffect("effect", {
				action = slot1.startCharing.action,
				lifetime = slot1.startCharing.lifeTime,
				onComplete = function ()
					uv0 = "charing"

					if slot0.charing then
						uv0 = "onPlayState"

						slot0:onPlayState(battle.SpriteActionTable.standby)
					end
				end
			}))
		else
			slot0:onPlayState(battle.SpriteActionTable.standby)
		end
	end
end

function BattleSprite.getMoveToTargetPos(slot0, slot1, slot2, slot3)
	if slot1 == 0 then
		return battle.AttackPosIndex.center
	end

	if slot1 == 5 then
		return battle.AttackPosIndex.selfPos
	end

	slot4 = battle.AttackPosIndex.selfPos

	if table.length(slot3) > 0 then
		slot6 = nil

		for slot10, slot11 in ipairs(slot3) do
			slot12 = slot0.battleView:onViewProxyCall("getSceneObjById", slot11.id) or slot11

			table.insert({}, {
				seat = slot12.seat,
				force = slot12.force
			})
		end

		if slot1 == 1 or slot1 == 4 then
			slot4 = slot5[1].seat
		elseif slot1 == 6 then
			slot7 = slot5[1].seat
			slot8 = (slot7 - 1) % 3 + 1
			slot4 = slot7 > 6 and slot8 + 6 or slot8
		elseif slot1 == 7 then
			slot4 = slot5[table.length(slot5)].seat
		elseif slot1 == 8 then
			slot7 = slot5[1].seat
			slot8 = 2 + ((math.floor((slot7 + 2) / 3) - 1) % 2 + 1 - 1) * 3
			slot4 = slot7 > 6 and slot8 + 6 or slot8
		else
			slot7 = 0
			slot8 = 0

			for slot12, slot13 in ipairs(slot5) do
				slot15 = nil

				if slot2 == 0 and slot13.force ~= slot0.force or slot13.force == slot0.force then
					if (slot13.seat - 1) % 3 + 1 == 2 then
						return slot13.seat
					end

					slot7 = slot7 + slot13.seat
					slot8 = slot8 + 1
				end
			end

			if slot8 > 0 then
				slot4 = math.floor(slot7 / slot8)
			else
				printWarn("no targets be choose in targets %d when posChoose %d", table.length(slot3), slot1)
			end
		end
	end

	return slot4
end

function BattleSprite.onStageChange(slot0, slot1)
	slot0.seat = slot1 and slot0.model.seat or -1

	slot0:resetPos()
	slot0:updHitPanel()
	slot0:onAddToScene()

	if slot1 then
		slot0:setVisibleEnable(slot1)
	end

	slot0:onSetSpriteVisible(slot1, "depart", slot1)
end

function BattleSprite.onRecordOrderData(slot0, slot1, slot2)
	if not slot0.recordOrderDataTb[slot1] then
		slot0.recordOrderDataTb[slot1] = CVector.new()
	end

	slot0.recordOrderDataTb[slot1]:push_back(slot2)
end

function BattleSprite.onEscape(slot0, slot1)
	slot2 = 0
	slot3 = 0

	if slot0.seat <= 6 then
		slot2 = -display.width / 2
		slot3 = battle.StandingPos[slot0.seat].y
	else
		slot2 = display.width * 1.5
		slot3 = battle.StandingPos[slot0.seat - 6].y
	end

	slot0:onAddEventEffect("moveTo", {
		a = 100,
		speed = 150,
		delayMove = slot1.delayMove or 0,
		costTime = slot1.costTime or 1000,
		x = slot2,
		y = slot3,
		changeFaceTo = -1 * slot0.faceTo
	}, false)
end

function BattleSprite.onPassOneWaveClean(slot0)
	slot0:setActionState(battle.SpriteActionTable.standby)

	for slot4, slot5 in ipairs(slot0.effectJumpCache) do
		slot0:onEventEffectCancel(slot5)
	end

	slot0.effectJumpCache = {}

	slot0.effectManager:passOneWaveClear()
	slot0.effectResManager:passOneWaveClean()

	for slot4, slot5 in pairs(slot0.buffEffectsMap) do
		if slot5.sprite then
			removeCSprite(slot5.sprite)
		end
	end

	slot0.buffEffectsMap = {}
end

function BattleSprite.canBuffNotify(slot0, slot1, slot2)
	if slot0.buffEffectTag[slot2] == battle.buffEffectTag.delete then
		return false
	end

	if slot1 == battle.buffEffectTag.delete and slot0.buffEffectTag[slot2] ~= battle.buffEffectTag.play then
		slot0.buffEffectTag[slot2] = slot1

		return false
	end

	slot0.buffEffectTag[slot2] = slot1

	return true
end
