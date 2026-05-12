function ccui.Slider.onEvent(slot0, slot1)
	slot0:addEventListener(function (slot0, slot1)
		if slot1 == 0 then
			-- Nothing
		end

		uv3 = "name"

		slot3({
			name = "ON_PERCENTAGE_CHANGED",
			target = slot0
		})
	end)

	return slot0
end
