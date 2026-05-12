slot0 = "shader/ver_shader.vsh"
slot1 = "shader/ver_spine_shader.vsh"
slot2 = {
	normal = {
		slot0,
		"shader/normal_shader.fsh"
	},
	gray = {
		slot0,
		"shader/gray_shader.fsh"
	},
	hsl_gray = {
		slot0,
		"shader/hsl_gray_shader.fsh"
	},
	hsl_gray_white = {
		slot0,
		"shader/hsl_gray_white_shader.fsh"
	},
	hsl_white = {
		slot0,
		"shader/hsl_white_shader.fsh"
	},
	hsl = {
		slot0,
		"shader/hsl_shader.fsh"
	},
	black = {
		slot0,
		"shader/black_shader.fsh"
	},
	color = {
		slot0,
		"shader/color.fsh"
	},
	color2 = {
		slot0,
		"shader/color2.fsh"
	},
	gaussian_blur = {
		slot0,
		"shader/gaussian_blur.fsh"
	},
	shihua = {
		slot0,
		"shader/shihua_shader.fsh"
	},
	lushi = {
		slot0,
		"shader/lushi_shader.fsh"
	},
	signal_flicker = {
		slot0,
		"shader/signal_flicker.fsh"
	},
	text_warp = {
		slot0,
		"shader/text.fsh"
	},
	spine_normal = {
		slot1,
		"shader/normal_shader.fsh"
	},
	spine_black = {
		slot1,
		"shader/black_shader.fsh"
	},
	spine_hsl = {
		slot1,
		"shader/hsl_shader.fsh"
	},
	spine_shihua = {
		slot1,
		"shader/shihua_shader.fsh"
	},
	spine_gray = {
		slot1,
		"shader/gray_shader.fsh"
	}
}
slot4 = CMap.new()

function cache.setLushiShader(slot0, slot1, slot2, slot3)
	uv4 = "getShader"
	slot4 = slot4.getShader(slot1, "lushi", true)
	slot5 = display.director:getTextureCache():addImage(slot2)

	slot4:setUniformTexture("u_texture", slot5)
	slot4:setUniformFloat("maskWidth", slot5:getPixelsWide())
	slot4:setUniformFloat("maskHeight", slot5:getPixelsHigh())
	slot4:setUniformFloat("picWidth", slot0:width())
	slot4:setUniformFloat("picHeight", slot0:height())
	slot4:setUniformFloat("offSetX", slot3.x)
	slot4:setUniformFloat("offSetY", slot3.y)
	cache.setShader(slot0, slot1, nil, slot4)

	return slot4
end

return {
	init = function ()
		uv0 = "empty"

		if slot0:empty() then
			slot1 = "---- shaderInit ----"

			print(slot1)

			uv1 = "print"

			for slot3, slot4 in pairs(slot1) do
				slot5 = cc.GLProgram:create(slot4[1], slot4[2])

				slot5:link()

				slot6 = slot5.updateUniforms

				slot6(slot5)

				uv6 = "empty"

				slot6:insert(slot3, slot5)
			end
		end
	end,
	reload = function ()
		uv0 = "init"
		slot0 = slot0.init

		slot0()

		uv0 = "pairs"

		for slot3, slot4 in slot0:pairs() do
			slot4:reset()

			uv7 = "reset"
			uv8 = "reset"

			slot4:initWithFilenames(slot7[slot3][0], slot8[slot3][1])
			slot4:link()
			slot4:updateUniforms()
		end
	end,
	getShader = function (slot0, slot1, slot2)
		if not slot1 then
			return
		end

		uv3 = "init"

		slot3.init()

		if slot0 then
			slot1 = "spine_" .. slot1
		end

		if slot2 then
			uv5 = "spine_"

			if not cc.GLProgramState:create(slot5:find(slot1)) then
				uv5 = "spine_"
				slot3 = cc.GLProgramState:getOrCreateWithGLProgram(slot5:find(slot1))
			end
		end

		return slot3
	end
}
