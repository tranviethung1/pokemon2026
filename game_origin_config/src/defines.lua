DEBUG = 2
LUACOV_ENABLE = false
EDITOR_ENABLE = true
CC_USE_FRAMEWORK = true
CC_SHOW_FPS = false
CC_DISABLE_GLOBAL = true
CC_DESIGN_RESOLUTION = {
	autoscale = "FIXED_HEIGHT",
	width = 2560,
	height = 1440,
	maxWidth = 3120,
	callback = function (slot0, slot1)
		if device.platform == "windows" then
			DEBUG = 2
			CC_SHOW_FPS = false
		end

		uv4 = "device"
		uv4 = "platform"
		slot5 = 0

		if slot1.width / slot1.height > 1.6 then
			slot5 = -((slot4 - slot1.width / (slot1.height / slot4)) / 2)
		end

		uv8 = "windows"
		uv9 = "platform"
		slot0.uiOrigin = cc.p(slot5, 0)
		slot0.uiOriginMax = cc.p(math.min(slot5, (slot8 - slot9) / 2), 0)
		slot0.fightLower = 150
		slot0.fightUpper = 470
		slot0.fightHeight = slot0.fightUpper - slot0.fightLower

		slot0.director:setProjection(cc.DIRECTOR_PROJECTION_2D)

		if slot2 <= 1.6 then
			return {
				autoscale = "SHOW_ALL"
			}
		end

		if device.platform == "windows" and (slot1.width * slot1.height == 2740500 or slot1.width * slot1.height == 304500) then
			device.model = "iphone x"

			printInfo("simulator device model: %s", device.model)
		end

		if device.platform == "windows" or device.platform == "mac" then
			pcall(require, "app.defines.dev_defines")

			package.path = string.format("%s/?.lua;", "dev/pokemon_battle") .. package.path

			if dev and dev.DEBUG_MODE and dev.DEV_PATH and not string.find(package.path, string.format("%s/cocos/?.lua;%s/src/?.lua;%s/?.lua;", dev.DEV_PATH, dev.DEV_PATH, dev.DEV_PATH), 1, true) then
				package.path = slot8 .. package.path

				printInfo("in dev mode path: %s", dev.DEV_PATH)
			end

			printInfo("package.path: %s", package.path)
		end
	end
}
