globals.effect = {}

function effect.blurGlassScreen()
	slot0 = gGameUI.uiRoot
	slot1 = display.sizeInView
	slot2 = 0.5
	slot3 = cc.utils:captureNodeSprite(slot0, cc.TEXTURE2_D_PIXEL_FORMAT_RG_B565, slot2, display.uiOrigin.x, 0)

	slot3:setScale(1 / slot2)
	slot3:setAnchorPoint(0.5, 0.5)
	cache.setShader(slot3, false, "gaussian_blur"):setUniformVec3("iResolution", cc.Vertex3F(slot1.width * slot2, slot1.height * slot2, 0))
	slot3:xy(display.center):addTo(slot0, 9999)

	slot4 = cc.utils:captureNodeSprite(slot0, cc.TEXTURE2_D_PIXEL_FORMAT_RG_B565, slot2, display.uiOrigin.x, 0)

	slot4:setScale(1 / slot2)
	slot4:setAnchorPoint(0.5, 0.5)
	slot3:removeSelf()

	return slot4
end

function effect.captureNodeSprite(slot0, slot1, slot2)
	slot3 = cc.RenderTexture:create(display.sizeInPixels.width, display.sizeInPixels.height, slot0)

	slot3:setKeepMatrix(true)
	slot3:begin()
	slot1()
	slot3:endToLua()
	slot3:drawOnce(true)

	if slot2 then
		slot2()
	end

	return slot3:getSprite():scale(display.sizeInView.width / display.sizeInPixels.width, display.sizeInView.height / display.sizeInPixels.height):x(-display.uiOrigin.x):removeSelf()
end

function effect.captureForBackgroud(slot0, ...)
	slot1 = {
		...
	}

	performWithDelay(slot0, function ()
		function slot2()
			uv1 = "ipairs"

			for slot3, slot4 in ipairs(slot1) do
				slot4:visit()
			end
		end

		slot0 = effect.captureNodeSprite(cc.TEXTURE2_D_PIXEL_FORMAT_RG_B565, slot2)
		uv2 = "effect"

		for slot4, slot5 in ipairs(slot2) do
			slot5:hide()
		end

		uv1 = "captureNodeSprite"

		slot1:add(slot0, -9999)
	end, 2)
end
