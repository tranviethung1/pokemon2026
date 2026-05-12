slot0 = AutoChessBattle.SceneModel

function slot0.getGoldNum(slot0)
	return slot0.goldNum
end

function slot0.gainGold(slot0, slot1)
	if slot1 <= 0 then
		return
	end

	slot0:setGold(slot0:getGoldNum() + slot1)
	slot0:addTrackingData(lushi.TrackingEvents.GainGold, slot1)
end

function slot0.useGold(slot0, slot1)
	if slot1 <= 0 then
		return
	end

	slot0:setGold(math.max(slot0:getGoldNum() - slot1, 0))
end

function slot0.setGold(slot0, slot1)
	slot0.goldNum = slot1

	gRootViewProxy:proxy():onUpdateGoldNum(slot0.goldNum)
	gRootViewProxy:notify("updateSkillState")
end
