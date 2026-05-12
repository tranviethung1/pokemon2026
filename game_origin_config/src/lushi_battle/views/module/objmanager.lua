slot0 = class("ObjectManager", battleModule.CBase)

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.gameLayer = slot0.parent.gameLayer
	slot0.deleteObjLayer = slot0.parent.deleteObjLayer
	slot0.units = {}
	slot0.updateUnits = {}
	slot0.updateDirty = true
end

function slot0.onSceneAddObj(slot0, slot1, slot2)
	slot3, slot4 = nil

	if slot2.type == lushi.ObjectType.normal then
		slot3 = AutoChessSprite.new(slot0.parent, slot2, slot1)
	elseif slot2.type == lushi.ObjectType.equip then
		slot3 = EquipSprite.new(slot0.parent, slot2, slot1)
	elseif slot2.type == lushi.ObjectType.event then
		slot3 = EventSprite.new(slot0.parent, slot2, slot1)
	end

	slot5 = slot0.gameLayer

	if slot2.readyState == lushi.ObjectReadyState.shop then
		slot5 = slot0:getPanelInfo(slot2.shopIndex)
	end

	slot5:addChild(slot3, 0, "obj" .. slot2.id)
	slot3:init()
	slot3:onAddToScene()

	slot0.units[slot1] = slot3

	if slot3.onFixedUpdate then
		slot0.updateUnits[slot1] = slot3
	end

	slot0.updateDirty = true

	return slot3
end

function slot0.spriteMgrUpdate(slot0)
	for slot4, slot5 in pairs(slot0.updateUnits) do
		slot5:onFixedUpdate(delta)
	end

	if not slot0.updateDirty then
		return
	end

	for slot5, slot6 in pairs(slot0.units) do
		if slot6 and slot6:onUpdate(delta) then
			slot1 = 0 + 1
		end
	end

	slot0.updateDirty = slot1 > 0
end

function slot0.onSceneDeadObj(slot0, slot1, slot2)
	if slot0.units[slot1] then
		slot3:setEffectsVisible(false)
		slot3:onDead("lushi/zizouqi_jl2.skel", function ()
			uv0 = "hide"

			slot0:hide()
		end)
	end
end

function slot0.onViewBeProxy(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.units) do
		if slot7 == slot1 then
			slot1.__vmproxy = slot2

			return
		end
	end
end

function slot0.onSceneDelObj(slot0, slot1)
	if slot0.units[slot1] then
		slot0.units[slot1] = nil
		slot0.updateUnits[slot1] = nil
		slot0.updateDirty = true

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

function slot0.getSceneObj(slot0, slot1)
	return slot0.units[slot1]
end

function slot0.getSceneAllObjs(slot0)
	return slot0.units
end

function slot0.getSceneObjsByTeam(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.units) do
		if slot7.team == slot1 then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getSceneObjById(slot0, slot1)
	return slot0.units[slot1]
end

function slot0.rebindSprite(slot0, slot1, slot2)
	if slot0.units[slot1] then
		slot0.units[slot1].model = slot2

		return slot0.units[slot1]
	end
end

function slot0.onAddToGameLayer(slot0, slot1)
	if slot0.units[slot1] then
		slot2:retain()

		slot3 = slot2:removeSelf()

		slot0.gameLayer:addChild(slot3)
		slot3:autorelease()
	end
end

function slot0.getPanelInfo(slot0, slot1)
	if slot1 == 1 then
		return slot0.parent.panelInfo
	else
		return slot0.parent.panelShop:get("panelInfo" .. slot1)
	end
end

function slot0.onShopEncounterChange(slot0, slot1)
	if slot0.units[slot1] then
		slot2:retain()

		slot3 = slot2:removeSelf()

		slot0:getPanelInfo(slot3.model.shopIndex):addChild(slot3)
		slot3:resetSpriteState()
		slot3:autorelease()
	end
end

function slot0.onClearAll(slot0)
	for slot4, slot5 in pairs(slot0.units) do
		slot0:onSceneDelObj(slot4)
	end

	slot0.parent:clearDeleteObjLayer()
end

return slot0
