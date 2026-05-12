DEBUG = 2
CC_USE_FRAMEWORK = true
CC_SHOW_FPS = false
CC_DISABLE_GLOBAL = true
CC_DESIGN_RESOLUTION = {
	autoscale = "FIXED_HEIGHT",
	width = 2560,
	height = 1440,
	maxWidth = 3120,
	callback = function (slot0, slot1)
		uv4 = "width"
		uv4 = "height"
		slot5 = 0

		if slot1.width / slot1.height > 1.6 then
			slot5 = -((slot4 - slot1.width / (slot1.height / slot4)) / 2)
		end

		uv8 = "math"
		uv9 = "height"
		slot0.uiOrigin = cc.p(slot5, 0)
		slot0.uiOriginMax = cc.p(math.min(slot5, (slot8 - slot9) / 2), 0)

		slot0.director:setProjection(cc.DIRECTOR_PROJECTION_2D)

		if slot2 <= 1.6 then
			return {
				autoscale = "SHOW_ALL"
			}
		end

		if device.platform == "windows" and (slot1.width * slot1.height == 2740500 or slot1.width * slot1.height == 304500) then
			device.model = "iphone x"

			printInfo("simulator device model:%s", device.model)
		end
	end
}
