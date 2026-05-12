function ccui.TextField.onEvent(slot0, slot1)
	slot0:addEventListener(function (slot0, slot1)
		if slot1 == 0 then
			-- Nothing
		elseif slot1 == 1 then
			slot2.name = "DETACH_WITH_IME"
		elseif slot1 == 2 then
			slot2.name = "INSERT_TEXT"
		elseif slot1 == 3 then
			slot2.name = "DELETE_BACKWARD"
		end

		uv3 = "name"

		slot3({
			name = "ATTACH_WITH_IME",
			target = slot0
		})
	end)

	return slot0
end
