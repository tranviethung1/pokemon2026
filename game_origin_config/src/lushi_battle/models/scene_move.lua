slot0 = AutoChessBattle.SceneModel

function slot0.refreshCardInEmbattle(slot0)
	for slot4, slot5 in slot0.heros:order_pairs() do
		if slot5.isFakeCard then
			slot6 = slot0:getPosBySeat(slot5.seat, lushi.ObjectReadyState.embattle)

			gRootViewProxy:proxy():setFakeCardPos(cc.p(slot6.x, slot6.y))
		else
			slot5.view:proxy():resetSpriteState()
		end
	end
end

function slot0.setFakeCardInEmbattle(slot0, slot1)
	slot2 = {
		isFakeCard = true,
		seat = slot1,
		id = lushi.FakeObjId
	}

	for slot6, slot7 in slot0.heros:order_pairs() do
		if slot7.isFakeCard then
			slot0:removeObjInEmbattle(slot7)

			break
		end
	end

	if slot0:setObjInEmbattle(slot2, slot1) then
		gRootViewProxy:proxy():addFakeCard()
	end
end

function slot0.removeFakeCardInEmbattle(slot0)
	for slot4, slot5 in slot0.heros:order_pairs() do
		if slot5.isFakeCard then
			slot0:removeObjInEmbattle(slot5)
			gRootViewProxy:proxy():removeFakeCard()

			break
		end
	end
end

function slot0.removeObjInEmbattle(slot0, slot1)
	slot0.heros:erase(slot1.id)

	slot2 = 1

	for slot6, slot7 in slot0.heros:order_pairs() do
		slot7.seat = slot2
		slot2 = slot2 + 1
	end
end

function slot0.canSetInEmbattle(slot0)
	slot1 = 0

	if slot0.heros:find(lushi.FakeObjId) then
		slot1 = 1
	end

	if slot0.heros:size() >= lushi.TeamNumber + slot1 then
		return false
	end

	return true
end

function slot0.setObjInEmbattle(slot0, slot1, slot2, slot3)
	if not slot0:canSetInEmbattle() then
		return false
	end

	slot4 = 1
	slot5 = nil

	function slot6()
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
	end

	for slot10, slot11 in slot0.heros:order_pairs() do
		slot6()

		slot11.seat = slot4
		slot4 = slot4 + 1
		slot2 = slot2 - 1
	end

	slot6()
	slot0:removeHandCard(slot1)
	slot0:addObj(1, slot1, lushi.ObjectReadyState.embattle)

	slot1.seat = slot5
	slot1.readyState = lushi.ObjectReadyState.embattle

	if slot3 then
		slot1.view:proxy():playSetAction(function ()
			uv0 = "refreshCardInEmbattle"

			slot0:refreshCardInEmbattle()
		end)
	else
		slot0:refreshCardInEmbattle()
	end

	return true
end

function slot0.removeHandCard(slot0, slot1)
	if slot1.readyState == lushi.ObjectReadyState.hand then
		for slot5, slot6 in ipairs(slot0.handCards) do
			if slot6.id == slot1.id then
				table.remove(slot0.handCards, slot5)

				break
			end
		end

		for slot5, slot6 in ipairs(slot0.handCards) do
			slot6.seat = slot5
		end
	end
end

function slot0.removeEventCard(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.trainer[1].takeEffectEvents) do
		if slot6.id == slot1 then
			table.remove(slot0.trainer[1].takeEffectEvents, slot5)

			break
		end
	end

	slot0:updateEventPanelView()
end

function slot0.canBuyCard(slot0)
	if lushi.HandCardBuyLimit <= table.length(slot0.handCards) then
		return false
	end

	return true
end

function slot0.canSetInHand(slot0)
	if lushi.HandCardLimit <= table.length(slot0.handCards) then
		return false
	end

	return true
end

function slot0.setObjInHand(slot0, slot1)
	if not slot0:canSetInHand() then
		printWarn("ilegal hand card unitID:%d", slot1.unitID)
		slot0:deleteObj(slot1)

		return false
	end

	slot0:addObj(nil, slot1, lushi.ObjectReadyState.hand)

	slot1.readyState = lushi.ObjectReadyState.hand

	slot0:refreshCardsInHand()
	AutoChessEasy.queueEffect(function ()
		uv3 = "gRootViewProxy"

		gRootViewProxy:notify("addToGameLayer", slot3.id)
		gRootViewProxy:proxy():refreshPostion(nil, lushi.ObjectReadyState.hand)
	end)

	return true
end

function slot0.refreshCardsInHand(slot0)
	for slot4, slot5 in ipairs(slot0.handCards) do
		slot5.seat = slot4

		AutoChessEasy.queueEffect(function ()
			uv0 = "view"

			slot0.view:proxy():resetSpriteState()
		end)
	end
end

function slot0.checkHandCardMoveEnd(slot0, slot1, slot2)
	if slot0:canSetInEmbattle() and slot0:getOperateObject(slot1):isSelectTarget() then
		for slot8, slot9 in slot0.heros:order_pairs() do
			if not slot9.isFakeCard and slot3:runFilterTarget(slot3.unitCfg.filterTarget, slot9) then
				gRootViewProxy:notify("showHandSelect", slot3, slot2)

				return false
			end
		end
	end

	slot0:removeFakeCardInEmbattle()

	if not slot4 then
		slot3.view:proxy():resetSpriteState()
	end

	return slot4
end

function slot0.handCardMoveEnd(slot0, slot1, slot2)
	slot3 = slot0:getOperateObject(slot1)

	slot0:setObjInEmbattle(slot3, slot2, true)
	slot0:refreshCardsInHand()
	slot3:onEnterField()
	slot3:triggerBuffOnPoint(lushi.BuffTriggerPoint.onHolderFromHandIntoEmbattle)
	slot0:updateTeamAllBuffs(slot3.team, lushi.BuffTriggerPoint.onObjFromHandIntoEmbattle, {
		obj = slot3
	})
	gRootViewProxy:proxy():refreshPostion(nil, lushi.ObjectReadyState.hand)
end

function slot0.checkHandSelect(slot0, slot1, slot2)
	slot3 = slot0:getOperateObject(slot1)

	return slot3:runFilterTarget(slot3.unitCfg.filterTarget, slot0:getOperateObject(slot2))
end

function slot0.setHandSelect(slot0, slot1, slot2, slot3)
	gRootViewProxy:notify("handSelectConfirm")
	slot0:removeFakeCardInEmbattle()

	slot4 = slot0:getOperateObject(slot1)
	slot9 = true

	slot0:setObjInEmbattle(slot4, slot2, slot9)
	slot0:refreshCardsInHand()

	slot5 = slot0:getOperateObject(slot3)

	for slot9, slot10 in ipairs(slot4.unitCfg.findBuff) do
		slot12 = AutoChessBattle.addBuffToHero(slot10, slot5, slot4, {
			value = 10
		})
	end

	slot4:onEnterField()
	slot4:triggerBuffOnPoint(lushi.BuffTriggerPoint.onHolderFromHandIntoEmbattle, {
		target = slot5
	})
	slot0:updateTeamAllBuffs(slot4.team, lushi.BuffTriggerPoint.onObjFromHandIntoEmbattle, {
		obj = slot4
	})
	gRootViewProxy:proxy():refreshPostion(nil, lushi.ObjectReadyState.hand)
end

function slot0.checkAddEquip(slot0, slot1, slot2)
	slot4 = slot0:getOperateObject(slot2)

	if not slot0:getOperateObject(slot1) or not slot4 then
		return false
	end

	return slot3:canAddEquipment(slot4.unitCfg.filterTarget)
end

function slot0.handEquipMoveEnd(slot0, slot1, slot2)
	slot3 = slot0:getOperateObject(slot1)
	slot4 = slot0:getOperateObject(slot2)

	slot3:addEquipment(slot4)
	slot4:onEquiped()
	slot0:updateTeamAllBuffs(slot3.team, lushi.BuffTriggerPoint.onObjFromHandIntoEmbattle, {
		obj = slot4
	})
	gRootViewProxy:proxy():refreshPostion(nil, lushi.ObjectReadyState.hand)
end

function slot0.embattleCardMoveBegin(slot0, slot1)
	slot0:getOperateObject(slot1):removeSelfInEmbattle()
end

function slot0.embattleCardMoveEnd(slot0, slot1, slot2)
	slot0:removeFakeCardInEmbattle()
	slot0:setObjInEmbattle(slot0:getOperateObject(slot1), slot2)
end

function slot0.saleCard(slot0, slot1, slot2)
	slot0:removeFakeCardInEmbattle()

	slot3 = slot0:getOperateObject(slot1)

	slot0:addTrackingData(lushi.TrackingEvents.SellCardByID, 1, slot3.unitID)

	if slot3.readyState == lushi.ObjectReadyState.hand then
		slot0:removeHandCard(slot3)
	elseif slot3.readyState == lushi.ObjectReadyState.embattle then
		slot0:removeObjInEmbattle(slot3)

		for slot7, slot8 in ipairs(slot3.equipMents) do
			slot8:returnToHand()
		end

		slot3.equipMents = {}

		gRootViewProxy:proxy():refreshPostion(slot3.team, lushi.ObjectReadyState.embattle)
	elseif slot3.readyState == lushi.ObjectReadyState.event then
		slot0:removeEventCard(slot3.id)

		for slot7, slot8 in slot0.allBuffs:order_pairs() do
			if slot8.args.bindEvent == slot3.id then
				slot8:overClean()
			end
		end

		gRootViewProxy:proxy():updateEventList()
	end

	slot0:gainGold(slot2 or slot3:sellingPrice())
	slot0:updateTeamAllBuffs(slot3.team, lushi.BuffTriggerPoint.onObjSell, {
		obj = slot3
	})

	if slot3.transformBase then
		slot0:deleteObj(slot3.transformBase)
	end

	slot0:deleteObj(slot3)
	slot0:refreshCardsInHand()
	gRootViewProxy:proxy():refreshPostion(nil, lushi.ObjectReadyState.hand)
	slot0:afterLostCard()
end

function slot0.checkEventSelect(slot0, slot1, slot2)
	slot4 = slot0:getOperateObject(slot2)

	if not slot0:getOperateObject(slot1):isSelectTarget() then
		return true
	end

	return slot4:runFilterTarget(slot3.unitCfg.filterTarget, slot4)
end

function slot0.eventCardMoveEnd(slot0, slot1, slot2)
	slot3 = slot0:getOperateObject(slot1)

	slot0:removeHandCard(slot3)
	slot0:refreshCardsInHand()
	table.insert(slot0.trainer[1].takeEffectEvents, slot3)
	slot3:doEvent(slot0:getOperateObject(slot2))
	slot0:updateTeamAllBuffs(slot3.team, lushi.BuffTriggerPoint.onObjFromHandIntoEmbattle, {
		obj = slot3
	})
	gRootViewProxy:proxy():refreshPostion(nil, lushi.ObjectReadyState.hand)
	slot0:updateEventPanelView()
end

function slot0.afterGainCard(slot0, slot1)
	slot0.gainCardObjIDs:push_back(slot1.id)
	slot0:tryCardRiseStar()
end

function slot0.tryCardRiseStar(slot0)
	if slot0.gainCardObjIDs:size() == 0 then
		gRootViewProxy:proxy():setDisableState(false, "riseStar")

		return
	end

	if slot0.riseStarObjs:size() > 0 then
		return
	end

	if slot0.gainCardObjIDs:pop_front() then
		if not slot0:getOperateObject(slot1) then
			slot0:tryCardRiseStar()

			return
		end

		slot0:gainCardRiseStar(slot2)
	end
end

function slot0.afterLostCard(slot0)
	slot0:refreshShopCardRiseState()
end

function slot0.refreshShopCardRiseState(slot0)
	for slot4, slot5 in slot0.allObjects:order_pairs() do
		if slot5.readyState == lushi.ObjectReadyState.shop then
			slot5.view:proxy():updateRiseState(slot0:checkRiseStar(slot5) and true or false)
		end
	end
end

function slot0.checkRiseStar(slot0, slot1)
	if slot1.type ~= lushi.ObjectType.normal or slot1.transformBase then
		return
	end

	slot3 = slot1.unitID

	if slot1.star > 2 then
		return
	end

	slot4 = nil

	for slot8, slot9 in slot0.heros:order_pairs() do
		if slot9.id ~= slot1.id and slot9.star == slot2 and slot9.unitID == slot3 and not slot9.transformBase then
			slot4 = slot9

			break
		end
	end

	if not slot4 then
		for slot8, slot9 in ipairs(slot0.handCards) do
			if slot9.id ~= slot1.id and slot9.star == slot2 and slot9.unitID == slot3 and not slot9.transformBase then
				slot4 = slot9
			end
		end
	end

	return slot4
end

function slot0.gainCardRiseStar(slot0, slot1)
	if not slot0:checkRiseStar(slot1) then
		slot0:tryCardRiseStar()
		slot0:refreshShopCardRiseState()

		return
	end

	gRootViewProxy:proxy():setDisableState(true, "riseStar")
	slot2:returnEquipsToHand()
	slot1:returnEquipsToHand()
	slot2:riseStar(slot1.star, false)
	slot0:transferBuff(slot1, slot2)
	slot0:transferAttr(slot1, slot2)
	AutoChessEasy.queueEffect("riseStar", {
		baseObjId = slot2.id,
		newObjId = slot1.id
	})
	slot0.riseStarObjs:push_back({
		slot2,
		slot1
	})
	slot0:waitRiseStarAniDone()
end

function slot0.waitRiseStarAniDone(slot0, slot1)
	if not slot1 then
		return slot0:modelWait("rise_star", slot0.waitRiseStarAniDone)
	end

	slot0:afterRiseStar()
end

function slot0.afterRiseStar(slot0)
	if not slot0.riseStarObjs:pop_front() then
		printWarn("afterRiseStar no data")
		slot0:tryCardRiseStar()

		return
	end

	slot3 = slot1[2]

	if slot1[1]:isInEmbattle() then
		slot2:returnToHand()
	end

	slot0:removeHandCard(slot3)
	slot0:deleteObj(slot3)
	slot0:refreshCardsInHand()
	gRootViewProxy:proxy():refreshPostion(slot2.team, lushi.ObjectReadyState.embattle)
	gRootViewProxy:proxy():refreshPostion(nil, lushi.ObjectReadyState.hand)
	slot0:refreshShopCardRiseState()
	slot0:afterGainCard(slot2)
end

function slot0.addFindCards(slot0, slot1)
	table.insert(slot0.findWaitList, slot1)
	slot0:doFindCards()
end

function slot0.doFindCards(slot0, slot1)
	if table.length(slot0.findCards) > 0 or table.length(slot0.findWaitList) <= 0 then
		return
	end

	if not slot0:canSetInHand() then
		slot0.findWaitList = {}

		return
	end

	for slot6, slot7 in ipairs(slot0.findWaitList[1]) do
		slot8 = AutoChessEasy.getRoleDataFromCards(slot7)
		slot8.readyState = lushi.ObjectReadyState.find
		slot9 = slot0.play:createObjectModel(slot6, slot8.type)

		slot9:init(slot8)
		table.insert(slot0.findCards, slot9)
	end

	gRootViewProxy:proxy():showFindList(true)
end

function slot0.getFindCards(slot0)
	return slot0.findCards
end

function slot0.onFindConfirm(slot0, slot1)
	slot2 = table.remove(slot0.findCards, slot1)

	slot0:setObjInHand(slot2)
	slot0:afterGainCard(slot2)

	for slot6, slot7 in ipairs(slot0.findCards) do
		slot0:deleteObj(slot7)
	end

	slot0.findCards = {}

	table.remove(slot0.findWaitList, 1)
	slot0:doFindCards()
end

slot2 = lushi.CardWidth + 50

function slot0.calcEmbattlePos(slot0, slot1)
	slot2 = slot0:getHerosMap(slot1)
	uv3 = "getHerosMap"
	uv4 = "gRootViewProxy"

	if slot1 == 2 then
		uv5 = "getHerosMap"
		slot3 = slot5 * 0.9
		uv5 = "gRootViewProxy"
		slot4 = slot5 * 0.9
	end

	if not gRootViewProxy:proxy():getPanelByState(lushi.ObjectReadyState.embattle, slot1).getPosition then
		return {}, {}
	end

	slot6, slot7 = slot5:getPosition()
	slot9 = nil
	slot11 = {}

	for slot16, slot17 in slot2:order_pairs() do
		table.insert(slot11, {
			x = (slot2:size() % 2 == 0 and slot6 - (slot8 / 2 * slot3 - slot4 / 2) + lushi.CardWidth / 2 or slot6 - (lushi.CardWidth / 2 + (slot8 - 1) / 2 * slot3) + lushi.CardWidth / 2) + (0 + 1 - 1) * slot3,
			y = slot7,
			id = slot17.id
		})
	end

	return slot11, {
		[slot17.seat] = slot10
	}
end

function slot0.getAllEmbattlePos(slot0)
	return arraytools.merge({
		slot0:calcEmbattlePos(1),
		slot0:calcEmbattlePos(2)
	})
end

function slot0.calcHandPos(slot0)
	slot1 = slot0.handCards
	slot3, slot4 = gRootViewProxy:proxy():getPanelByState(lushi.ObjectReadyState.hand):getPosition()
	slot8 = {}

	for slot12, slot13 in ipairs(slot1) do
		table.insert(slot8, {
			x = slot3 - (table.length(slot1) - 1) * 120 / 2 + (slot12 - 1) * slot6,
			y = slot4,
			id = slot13.id
		})
	end

	return slot8
end

function slot0.getPosBySeat(slot0, slot1, slot2)
	if slot2 == lushi.ObjectReadyState.embattle then
		slot4, slot5 = slot0:calcEmbattlePos(lushi.TeamNumber < slot1 and 2 or 1)

		return slot4[slot5[slot1]]
	elseif slot2 == lushi.ObjectReadyState.hand then
		return slot0:calcHandPos()[slot1]
	elseif slot2 == lushi.ObjectReadyState.shop then
		return nil
	end
end

function slot0.updateEventPanelView(slot0)
	gRootViewProxy:proxy():onUpdatePanelEvent(table.length(slot0.trainer[1].takeEffectEvents))
end

function slot0.getCardInfoEnv(slot0, slot1)
	if not slot0:getOperateObject(slot1) then
		return {}
	end

	return AutoChessCsv.makeCardInfoEnv(slot2), slot2.unitCfg.cardEffect, slot2.unitCfg.keyWords
end
