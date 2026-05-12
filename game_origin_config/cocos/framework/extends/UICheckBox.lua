function ccui.CheckBox.onEvent(slot0, slot1)
	slot0:addEventListener(function (slot0, slot1)
		if slot1 == 0 then
			-- Nothing
		else
			slot2.name = "unselected"
		end

		uv3 = "name"

		slot3({
			name = "selected",
			target = slot0
		})
	end)

	return slot0
end
