return {
	pause = function (slot0, slot1, slot2)
		if display.director:isPaused() then
			display.director:resume()
		else
			display.director:pause()
		end

		return true
	end
}
