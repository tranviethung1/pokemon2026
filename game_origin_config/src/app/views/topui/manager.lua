slot0 = class("TopuiManager")

function slot0.ctor(slot0)
	slot0.map = {}
	slot0.mapIDCounter = 0
	slot0.topView = 0
end

function slot0.createView(slot0, slot1, slot2, slot3)
	slot1 = slot1 or "default"
	slot5 = gGameUI:createView(string.format("topui.views.%s", slot1), slot2, slot3)
	slot0.mapIDCounter = slot0.mapIDCounter + 1
	slot0.topView = slot5
	slot0.map[slot5] = {
		parent = slot2,
		name = slot1,
		view = slot5,
		id = slot0.mapIDCounter
	}

	slot5:onNodeEvent("exit", functools.partial(slot0.removeView, slot0, slot5))

	return slot5
end

function slot0.removeView(slot0, slot1)
	if slot0.map[slot1] then
		if slot1 == slot0.topView then
			slot0.topView = nil
		end

		slot0.map[slot1] = nil

		slot1:removeSelf()

		return true
	end
end

function slot0.updateTitle(slot0, slot1, slot2)
	if slot0.topView == nil then
		for slot7, slot8 in pairs(slot0.map) do
			if 0 < slot8.id then
				slot3 = slot8.id
				slot0.topView = slot8.view
			end
		end
	end

	if slot0.map[slot0.topView] then
		slot3.view:updateTitle(slot1, slot2)
	end
end

return slot0
