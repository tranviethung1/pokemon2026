function AutoChessSprite.onDealBuffEffectsMap(slot0, slot1, slot2, slot3)
	return gRootViewProxy:notify("dealBuffEffectsMap", slot0, slot1, slot2, slot3)
end

function AutoChessSprite.onShowBuffIcon(slot0, slot1, slot2, slot3)
end

function AutoChessSprite.onDelBuffIcon(slot0, slot1)
end

function AutoChessSprite.playBuffAniEffect(slot0, slot1)
	if slot1.csvCfg.effectResPath and slot2.effectResPath ~= "" then
		slot0:addBuffEffect(slot2.effectResPath, slot2.effectAssignLayer, slot2.effectDeepCorrect, slot2.effectOffset, slot2.effectAniName[slot1.aniSelectId], slot1)
	end
end

function AutoChessSprite.playBuffOnceEffect(slot0, slot1)
	if not slot1.csvCfg then
		return
	end

	if slot2.onceEffectResPath and slot2.onceEffectResPath ~= "" then
		slot0:onBuffPlayOnceEffect(slot2.onceEffectResPath, slot2.onceEffectAniName or "effect", slot2.onceEffectOffset or {
			x = 0,
			y = 0
		}, slot2.onceEffectAssignLayer or 1, slot2.onceEffectDeepCorrect)
	end
end

function AutoChessSprite.onBuffPlayOnceEffect(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = nil
	slot7 = cc.p(0, 0)

	if slot4 == 2 then
		slot7 = cc.p(140, 190)
		slot6 = slot0.sprite
	elseif slot4 == 1 then
		slot6 = slot0
	end

	AutoChessEasy.playOnceEffect(slot1, slot2, cc.p(slot7.x + slot3.x, slot7.y + slot3.y), slot6, slot5, 1)
end

function AutoChessSprite.onDeleteBuffEffect(slot0, slot1)
	slot0:onDelBuffIcon(slot1.cfgId)

	if slot1.csvCfg.effectResPath and slot2.effectResPath ~= "" then
		slot0:deleteBuffEffect(slot2.effectResPath, slot2.effectAssignLayer, slot2.effectAniName[slot1.aniSelectId], slot1)
	end
end

function AutoChessSprite.addBuffEffect(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if not slot1 or slot1 == "" then
		return
	end

	slot7 = slot0:getEffectMapKey(slot2)

	if not slot0.effectResMap[slot0:getBuffEffectKey(slot1, slot5, slot2)] then
		slot9 = newCSprite(slot1)
		slot10, slot11 = nil
		slot12 = cc.p(0, 0)

		if slot2 == 1 then
			slot10 = slot0
		elseif slot2 == 2 then
			slot12 = cc.p(265, 350)
			slot13 = slot0.cardPrefab.node
			slot10 = slot13:get("Panel")
			slot11 = 1 / slot13:scale()
		elseif slot2 == 3 then
			slot12 = cc.p(140, 190)
			slot10 = slot0.sprite
		elseif slot2 == 4 then
			slot14 = slot0.cardPrefab.node:get("Panel"):get("panelDef"):getBoundingBox()
			slot12 = cc.p(slot14.width / 2, slot14.height / 2)
			slot11 = 1 / slot0.cardPrefab.node:scale()
		end

		slot9:addTo(slot10, slot3):anchorPoint(0.5, 0.5):setVisible(slot0.model:isInEmbattle()):scale(slot11 or 1):xy(slot12.x + slot4.x, slot12.y + slot4.y)
		slot9:play(slot5)

		slot9.count = 0
		slot0.effectResMap[slot8] = slot9
	end

	slot9.count = slot9.count + 1
end

function AutoChessSprite.deleteBuffEffect(slot0, slot1, slot2, slot3, slot4)
	if not slot1 or slot1 == "" then
		return
	end

	slot5 = slot0:getEffectMapKey(slot2)

	if slot0.effectResMap[slot0:getBuffEffectKey(slot1, slot3, slot2)] then
		slot7.count = slot7.count - 1

		if slot7.count <= 0 then
			slot0.effectResMap[slot6] = nil

			removeCSprite(slot7)
		end
	end
end

function AutoChessSprite.getEffectMapKey(slot0, slot1)
	if slot1 == 1 then
		return "cardSprite"
	elseif slot1 == 2 then
		return "baseSprite"
	end
end

function AutoChessSprite.getBuffEffectKey(slot0, slot1, slot2, slot3)
	return string.format("%s|%s|%s", slot1, slot3, slot2 or "effect_loop")
end

function AutoChessSprite.setEffectsVisible(slot0, slot1)
	for slot5, slot6 in pairs(slot0.effectResMap) do
		slot6:setVisible(slot1)
	end
end

function AutoChessSprite.onSummon(slot0)
	slot0:setVisible(true)
	AutoChessEasy.bfsSetNode(slot0)
	slot0:runAction(cc.FadeIn:create(1))
end

function AutoChessSprite.onControl(slot0)
	for slot4, slot5 in ipairs(slot0.model.equipMents) do
		slot0.battleView:onViewProxyCall("getSceneObj", slot5.id).team = slot5.model.team
	end

	slot0.team = slot0.model.team

	AutoChessEasy.bfsSetNode(slot0)
	slot0:runAction(cc.FadeIn:create(1))
end
