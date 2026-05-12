slot0 = ccui.EditBox

function slot0.onEditHandler(slot0, slot1)
	slot0:registerScriptEditBoxHandler(function (slot0, slot1)
		uv3 = "name"

		slot3({
			name = slot0,
			target = slot1
		})
	end)

	return slot0
end

function slot0.removeEditHandler(slot0)
	slot0:unregisterScriptEditBoxHandler()

	return slot0
end
