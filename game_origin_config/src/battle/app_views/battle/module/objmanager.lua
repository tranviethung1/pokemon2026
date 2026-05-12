slot0 = class("ObjectManager", battleModule.CBase)

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.gameLayer = slot0.parent.gameLayer
	slot0.deleteObjLayer = slot0.parent.deleteObjLayer
	slot0.units = {}
	slot0.unitIds = {}
	slot0.unitsInSeat = {}
	slot0.updateUnits = {}
	slot0.updateDirty = true
end

function slot0.onClose(slot0)
	slot0.units = {}
	slot0.unitIds = {}
	slot0.unitsInSeat = {}
	slot0.updateUnits = {}
	slot0.updateDirty = true
end

function slot0.onSceneAddObj(slot0, slot1, slot2, slot3)
	slot4, slot5 = nil

	if slot3.type == battle.SpriteType.Normal then
		slot4 = BattleSprite.new(slot0.parent, slot2, slot1, slot3)
		slot5 = slot2.seat < 13
	elseif slot3.type == battle.SpriteType.Possess then
		slot4 = BattlePossessSprite.new(slot0.parent, slot2, slot1, slot3)
		slot5 = false
	elseif slot3.type == battle.SpriteType.Follower then
		slot4 = BattleFollowerSprite.new(slot0.parent, slot2, slot1, slot3)
		slot5 = false
	end

	slot4:init()
	slot4:onAddToScene()
	slot0.gameLayer:addChild(slot4)

	slot0.units[slot1] = slot4

	if slot5 then
		slot0.unitIds[slot2.id] = slot4
		slot0.unitsInSeat[slot1] = slot4
	end

	if slot4.onFixedUpdate then
		slot0.updateUnits[slot1] = slot4
	end

	slot0.updateDirty = true

	return slot4
end

function slot0.onSceneDeadObj(slot0, slot1, slot2)
	if slot0.units[slot1] then
		slot3:onDead(function ()
			uv0 = "onSceneDelObj"
			uv2 = "onSceneDelObj"

			slot0:onSceneDelObj(slot2)
		end)
	end
end

function slot0.onSceneDelObj(slot0, slot1)
	if slot0.units[slot1] then
		slot0.units[slot1] = nil
		slot0.unitsInSeat[slot1] = nil
		slot0.updateUnits[slot1] = nil
		slot0.updateDirty = true

		if slot0.unitIds[slot2.id] and slot3.key == slot1 then
			slot0.unitIds[slot2.id] = nil
		end

		if slot2.__vmproxy then
			slot2.__vmproxy:modelOnly({
				getMovePosZ = function ()
					return 0
				end
			})

			slot2.__vmproxy = nil
		end

		slot2:sceneDelObj(slot0.deleteObjLayer)
	end
end

function slot0.onSceneEndPlayAni(slot0, slot1)
	for slot6, slot7 in pairs(slot0.units) do
		if slot0.unitsInSeat[slot6] then
			if slot7.force == (slot1 == "win" and 1 or 2) then
				slot7:setActionState("win_loop")
			else
				slot7:setActionState(battle.SpriteActionTable.standby)
			end
		else
			slot7:setVisible(false)
		end
	end
end

function slot0.onShowHero(slot0, slot1)
	if slot1 then
		for slot6, slot7 in pairs(slot0.units) do
			slot7:showHero(slot1.typ == "showAll", slot1)
		end
	end
end

function slot0.onUpdate(slot0, slot1)
	for slot5, slot6 in pairs(slot0.updateUnits) do
		slot6:onFixedUpdate(slot1)
	end

	if not slot0.updateDirty then
		return
	end

	for slot6, slot7 in pairs(slot0.units) do
		if slot7 and slot7:onUpdate(slot1) then
			slot2 = 0 + 1
		end
	end

	slot0.updateDirty = slot2 > 0
end

function slot0.onLockLifeBar(slot0, slot1)
	if slot1 then
		for slot5, slot6 in pairs(slot0.units) do
			slot6:lockLifeBar(slot1.isLock)
		end
	end
end

function slot0.onEffectUpdated(slot0)
	slot0.updateDirty = true
end

function slot0.getSceneObjs(slot0)
	return slot0.unitsInSeat
end

function slot0.getSceneAllObjs(slot0)
	return slot0.units
end

function slot0.getSceneObj(slot0, slot1)
	return slot0.units[slot1]
end

function slot0.getSceneObjBySeat(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.unitIds) do
		if slot7.seat == slot1 and slot7.type == (slot2 or battle.SpriteType.Normal) then
			return slot7
		end
	end
end

function slot0.getSceneObjById(slot0, slot1)
	return slot0.unitIds[slot1]
end

function slot0.isObjExisted(slot0, slot1)
	return slot0.units[slot1] ~= nil
end

function slot0.onViewBeProxy(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.units) do
		if slot7 == slot1 then
			slot1.__vmproxy = slot2

			return
		end
	end
end

function slot0.onAddUnitsInSeat(slot0, slot1)
	if slot0.unitsInSeat[slot1] then
		return
	end

	slot0.unitsInSeat[slot1] = slot0.units[slot1]
end

function slot0.onSceneClearAll(slot0)
	for slot4, slot5 in pairs(slot0.units) do
		slot0:onSceneDelObj(slot4)
	end

	slot0.units = {}
	slot0.unitIds = {}
	slot0.unitsInSeat = {}
	slot0.updateDirty = true
end

return slot0
