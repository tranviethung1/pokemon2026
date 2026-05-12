slot0 = class("EquipMentModel", AutoChessBattle.ObjectModel)
AutoChessBattle.EquipMentModel = slot0

function slot0.init(slot0, slot1)
	slot0.protectedEnv = AutoChessCsv.makeProtectedEnv(slot0)
	slot0.data = csvClone(slot1)
	slot0.dbID = slot1.cardId
	slot0.unitID = slot1.roleId
	slot0.unitCfg = csvClone(csv.auto_chess.equip[slot0.unitID])
	slot0.star = slot1.star
	slot0.rarity = slot1.rarity
	slot0.isEquiped = false
	slot0.readyState = slot1.readyState

	if slot0:isInEmbattle() then
		slot0.team = slot0.seat <= lushi.TeamNumber and 1 or 2
	else
		slot0.team = 1
	end

	slot0.type = slot1.type or lushi.ObjectType.equip
	slot0.damageType = lushi.DamageFrom.physical

	slot0:onInitAttributes()
	slot0:addObjViewToScene()
	slot0:battleDataInit()
end

function slot0.onEquiped(slot0)
	slot0.scene:removeHandCard(slot0)
	slot0:setEquipedData()
end

function slot0.returnToHand(slot0)
	slot0.readyState = lushi.ObjectReadyState.hand
	slot0.isEquiped = false

	slot0:addObjViewToScene()
	slot0.scene:setObjInHand(slot0)
end

function slot0.setEquipedData(slot0)
	slot0.readyState = lushi.ObjectReadyState.embattle
	slot0.isEquiped = true

	gRootViewProxy:notify("sceneDelObj", slot0.id)

	slot0.view = ViewProxy.new()
end

function slot0.getBuffIcon(slot0)
	return slot0.unitCfg.name
end

function slot0.packInit(slot0)
	slot0.unitCfg = csvClone(csv.auto_chess.equip[slot0.unitID])
	slot0.protectedEnv = AutoChessCsv.makeProtectedEnv(slot0)

	if slot0.isEquiped then
		slot0.view = ViewProxy.new()
	else
		slot0:addObjViewToScene()
	end

	if not slot0.view then
		error("not have view")
	end
end
