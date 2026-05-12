slot0 = class("EventCardModel", AutoChessBattle.ObjectModel)
AutoChessBattle.EventCardModel = slot0
slot0.IgnoreKeys = {
	csvObject = true,
	__cid = true,
	isDeleted = true,
	__class = true,
	view = true,
	IgnoreKeys = true,
	unitCfg = true
}

function slot0.ctor(slot0, slot1, slot2)
	slot0.scene = slot1
	slot0.view = nil

	if slot0.scene then
		slot0.scene.objectIDCounter = slot0.scene.objectIDCounter + 1
		slot0.id = slot0.scene.objectIDCounter
	else
		slot0.id = -1
	end

	slot0.seat = slot2
	slot0.state = lushi.ObjectState.none
	slot0.readyState = lushi.ObjectReadyState.none
	slot0.isUsed = false
end

function slot0.init(slot0, slot1)
	slot0.data = csvClone(slot1)
	slot0.dbID = slot1.cardId
	slot0.unitID = slot1.roleId
	slot0.unitCfg = csvClone(csv.auto_chess.event[slot0.unitID])
	slot0.star = slot1.star
	slot0.rarity = slot1.rarity
	slot0.eventType = slot0.unitCfg.type
	slot0.readyState = slot1.readyState
	slot0.team = 1
	slot0.type = slot1.type or lushi.ObjectType.event
	slot0.equipMents = {}

	slot0:addObjViewToScene()
end

function slot0.addObjViewToScene(slot0)
	slot0.view = gRootViewProxy:getProxy("onSceneAddObj", slot0.id, slot0)
end

function slot0.clearBuff(slot0, slot1, slot2)
end

function slot0.triggerBuffOnPoint(slot0)
end

function slot0.doEvent(slot0, slot1)
	slot0.isUsed = true
	slot0.readyState = lushi.ObjectReadyState.event

	gRootViewProxy:notify("sceneDelObj", slot0.id)

	slot0.view = ViewProxy.new()

	if slot0:isSelectTarget() then
		slot0:addBuff(slot0.unitCfg.findBuff, slot1)
	end

	slot0:addBuff(slot0.unitCfg.buff, slot0.scene.trainer[slot0.team])
	gRootViewProxy:notify("eventTakeEffect", slot0.unitID, slot0.team)
end

function slot0.addBuff(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot1) do
		slot9 = AutoChessBattle.addBuffToHero(slot7, slot2, slot0, {
			value = 0,
			bindEvent = slot0.id
		})
	end
end

function slot0.packInit(slot0)
	slot0.unitCfg = csvClone(csv.auto_chess.event[slot0.unitID])

	if slot0.isUsed then
		slot0.view = ViewProxy.new()
	else
		slot0:addObjViewToScene()
	end
end

function slot0.getBuffIcon(slot0)
	return slot0.unitCfg.name
end
