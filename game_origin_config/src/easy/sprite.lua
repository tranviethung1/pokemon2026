globals.CSprite = class("CSprite", cc.Node)
CSprite.Types = {
	ARMATURE = 1,
	PLIST = 5,
	SPINE = 3,
	SPINEBIN = 4,
	SPRITE = 2
}
slot0 = tolua and tolua.type or type
slot1 = string.findlastof

function slot2()
end

globals.SpineSpritesMap = setmetatable({}, {
	__mode = "kv"
})

function globals.isPng(slot0)
	if slot0:sub(-4) == ".png" then
		slot1 = slot0
	else
		slot1 = false
	end

	return slot1
end

function globals.isSpine(slot0)
	if slot0:sub(-5) == ".skel" then
		slot1 = slot0
	else
		slot1 = false
	end

	return slot1
end

function globals.pngPath(slot0)
	if slot0:find(".skel") then
		return slot0:sub(1, slot1) .. "png"
	end

	if not slot0:find(".png") then
		return string.format("font/digital_%s.png", slot0)
	end

	return slot0
end

slot3 = 0

function globals.isCSprite(slot0)
	if tj.type(slot0) ~= "CSprite" then
		slot1 = false
	else
		slot1 = true
	end

	return slot1
end

function globals.newCSprite(slot0, ...)
	slot2, slot3 = function (...)
		uv1 = "cache"

		if cache.popByKey(slot1) then
			return slot0, true
		end

		uv2 = "cache"

		return CSprite.new(slot2, ...), false
	end(...)

	slot2:show()

	return cache.addCSprite(slot2)
end

function globals.newCSpriteWithFunc(slot0, slot1, ...)
	slot3, slot4 = function (...)
		uv1 = "cache"

		if cache.popByKey(slot1) then
			return slot0, true
		end

		uv1 = "popByKey"
		uv2 = "cache"

		return slot1(slot2, ...), false
	end(...)

	slot3:show()

	return cache.addCSprite(slot3)
end

function globals.removeCSprite(slot0, slot1)
	if slot0 == nil then
		return
	end

	if tj.type(slot0) ~= "CSprite" then
		error(string.format("sprite %s was not CSprite", tostring(slot0)))
	end

	slot2 = nil

	if slot1 == nil then
		slot1 = true
	end

	if slot1 then
		function slot2()
			uv1 = "cache"
			uv2 = "cache"

			cache.addByKey(slot1.__aniRes, slot2)
		end
	end

	return cache.eraseCSprite(slot0, slot2)
end

function slot4(slot0)
	if slot0 == nil or slot0 == "" then
		return
	end

	if device.platform == "windows" then
		slot1 = assert

		if slot0 ~= string.trim(slot0) then
			slot2 = false
		else
			slot2 = true
		end

		slot1(slot2, slot0 .. " had space char")
	end

	slot1, slot2 = nil

	if string.find(slot0, "%[") ~= nil then
		slot2 = string.sub(slot0, 1, slot3 - 1)
		slot1 = string.sub(slot0, slot3 + 1, string.len(slot0) - 1)
	else
		slot2 = slot0
	end

	return string.gsub(string.gsub(slot2, "\\", function (slot0)
		return "/"
	end), "//", function (slot0)
		return "/"
	end), slot1
end

function slot5(slot0)
	uv1 = "string"
	slot1, slot2 = slot1(slot0)
	slot3, slot4 = nil

	if string.find(slot1, "%.skel") then
		slot3 = CSprite.Types.SPINEBIN
		slot4 = string.sub(slot1, 1, slot5 - 1) .. ".atlas"
	end

	if slot3 == nil and string.find(slot1, "%.json") then
		slot3 = CSprite.Types.SPINE
		slot4 = string.sub(slot1, 1, slot5 - 1) .. ".atlas"
	end

	if slot3 == nil then
		if not string.find(slot1, "%.png") then
			slot5 = string.find(slot1, "%.jpg")
		end

		if slot5 then
			slot3 = CSprite.Types.SPRITE
		end
	end

	if slot3 == nil and string.find(slot1, "%.ExportJson") then
		slot7 = CSprite.Types
		slot3 = slot7.ARMATURE
		uv7 = "find"
		slot4 = string.sub(slot1, slot7(slot1, "/") + 1, slot6 - 1)
	end

	if slot3 == nil and string.find(slot1, "%.plist") then
		slot3 = CSprite.Types.PLIST
	end

	return slot3, slot2, slot1, slot4
end

function CSprite.init(slot0, slot1)
	if slot1 == nil or slot0.__ani == nil then
		return
	end

	slot3 = string.find(slot1, "rotate")
	slot4 = string.find(slot1, "alpha")
	slot5 = string.find(slot1, "hsl")
	slot6 = string.find(slot1, "hscc")

	if string.find(slot1, "bs") ~= nil then
		slot7 = {}

		for slot11 in slot1:sub(slot2):gmatch("[-.%d]+") do
			table.insert(slot7, tonumber(slot11))

			if #slot7 >= 2 then
				break
			end
		end

		if #slot7 ~= 2 then
			return
		end

		slot0.__ani:setScale(slot7[1], slot7[2])
	end

	if slot3 ~= nil then
		for slot10 in slot1:sub(slot3):gmatch("[-.%d]+") do
			slot0.__ani:setRotation(tonumber(slot10))

			break
		end
	end

	if slot4 ~= nil then
		for slot10 in slot1:sub(slot4):gmatch("[-.%d]+") do
			slot0.__ani:setOpacity(tonumber(slot10) * 255)

			break
		end
	end

	if slot5 ~= nil then
		slot7 = {}

		for slot11 in slot1:sub(slot5):gmatch("[-.%d]+") do
			table.insert(slot7, tonumber(slot11))

			if #slot7 >= 3 then
				break
			end
		end

		if #slot7 ~= 3 then
			return
		end

		slot0:setHSLShader(slot7[1], slot7[2], slot7[3], 1)
	end

	if slot6 ~= nil then
		slot7 = {}

		for slot11 in slot1:sub(slot6):gmatch("[-.%d]+") do
			table.insert(slot7, tonumber(slot11))

			if #slot7 >= 3 then
				break
			end
		end

		if #slot7 ~= 3 then
			return
		end

		slot0:setHSLShader(slot7[1], slot7[2], slot7[3], 2)
	end
end

function CSprite.ctor(slot0, slot1, slot2)
	slot0.__ani = nil
	slot0.__aniType = nil
	slot0.__shaderName = nil
	slot0.__rawShaderState = nil
	slot0.__aniRes = slot1

	if slot2 ~= nil then
		slot0.__ani = slot2
		slot0.__aniType = CSprite.Types.SPRITE

		slot0:addChild(slot0.__ani)

		return
	end

	if slot1 == nil then
		slot0.__ani = slot0
		slot0.__aniType = CSprite.Types.SPRITE

		return
	end

	uv3 = "__ani"
	slot3, slot4, slot5, slot6 = slot3(slot1)
	slot0.__aniType = slot3

	if slot3 == CSprite.Types.SPINE or slot3 == CSprite.Types.SPINEBIN then
		slot0.__ani = sp.SkeletonAnimation:create(slot5, slot6)
		slot8 = true

		if gGameUI.rootViewName == "battle.view" or gGameUI.rootViewName == "battle.loading" then
			slot8 = false
		end

		slot0.__ani:setTwoColorTint(slot8)

		SpineSpritesMap[slot0.__ani] = slot0
	elseif slot3 == CSprite.Types.SPRITE then
		slot0.__ani = cc.Sprite:create(slot5)
	elseif slot3 == CSprite.Types.ARMATURE then
		ccs.ArmatureDataManager:getInstance():addArmatureFileInfo(slot5)

		slot0.__ani = ccs.Armature:create(slot6)
	elseif slot3 == CSprite.Types.PLIST then
		slot0.__ani = cc.ParticleSystemQuad:create(slot5)
	end

	if slot0.__ani then
		slot0:addChild(slot0.__ani)
	end

	slot0:init(slot4)
end

function CSprite.preLoad(slot0)
	if slot0 == nil or slot0 == "" then
		return
	end

	uv1 = ""
	slot1, slot2, slot3, slot4 = slot1(slot0)
	slot5 = nil

	if slot1 == CSprite.Types.SPINE or slot1 == CSprite.Types.SPINEBIN then
		cache.addByKey(slot0, CSprite.new(slot0))
	elseif slot1 == CSprite.Types.ARMATURE then
		ccs.ArmatureDataManager:getInstance():addArmatureFileInfo(slot3)
	elseif slot1 == CSprite.Types.SPRITE then
		uv9 = "CSprite"

		display.textureCache:addImageAsync(slot3, slot9)
	elseif slot1 == CSprite.Types.PLIST then
		cc.ParticleSystemQuad:create(slot3)
	end

	return slot5
end

function CSprite.isArmature(slot0)
	if slot0.__aniType ~= slot0.Types.ARMATURE then
		slot1 = false
	else
		slot1 = true
	end

	return slot1
end

function CSprite.isSpine(slot0)
	if slot0.__aniType ~= slot0.Types.SPINE and slot0.__aniType ~= slot0.Types.SPINEBIN then
		slot1 = false
	else
		slot1 = true
	end

	return slot1
end

function CSprite.isSprite(slot0)
	if slot0.__aniType ~= slot0.Types.SPRITE then
		slot1 = false
	else
		slot1 = true
	end

	return slot1
end

function CSprite._initRTForSpineAnimation(slot0, slot1, slot2, slot3)
	slot0.__isTwoColorTint = true

	if slot0.__twoColorSprites then
		for slot7, slot8 in ipairs(slot0.__twoColorSprites) do
			slot8:removeSelf()
		end

		slot0.__twoColorSprites = nil
	end

	performWithDelay(gGameUI.scene, function ()
		uv1 = "tolua"

		if not tolua.isnull(slot1) then
			uv1 = "tolua"

			if tolua.isnull(slot1.__ani) then
				return
			end
		end

		uv0 = "tolua"

		if slot0.__ani == nil then
			return
		end

		uv0 = "tolua"
		uv1 = "isnull"

		if slot0.__shaderName ~= slot1 then
			return
		end

		slot0 = 1
		uv1 = "__ani"

		if slot1 then
			uv2 = "tolua"
			slot0 = math.abs(slot2:getScaleX())
		end

		uv1 = "tolua"
		slot1 = slot1.__ani
		slot2 = slot1
		slot1 = slot1.getScale(slot2)
		uv2 = "tolua"
		slot2 = slot2.__ani
		slot3 = slot2
		slot2 = slot2.getContentSize(slot3)
		uv3 = "tolua"
		slot3 = slot3.__ani
		slot4 = slot3
		slot3 = slot3.getBoundingBox(slot4)
		uv4 = "__ani"

		if slot4 then
			if slot3.width * slot0 > 1024 or slot3.height * slot0 > 1024 then
				slot0 = math.max(1, math.floor(1024 / math.max(slot3.width, slot3.height)))
			end

			uv4 = "tolua"
			slot4 = slot4.__ani
			slot4 = slot4.setScale

			slot4(slot4, slot1 * slot0)

			uv4 = "tolua"
			slot4 = slot4.__ani:getContentSize()
			slot2 = slot4
			uv4 = "tolua"
			slot3 = slot4.__ani:getBoundingBox()
		end

		slot3.x = slot3.x - 60
		slot3.y = slot3.y - 60
		slot3.width = slot3.width + 120
		slot4 = slot3.height + 120
		slot3.height = slot4
		uv4 = "tolua"
		slot4 = slot4.__ani:retain()
		slot4 = slot4.autorelease

		slot4(slot4)

		uv4 = "tolua"
		slot4 = slot4.__ani
		slot4 = slot4.removeSelf

		slot4(slot4)

		uv4 = "tolua"
		slot4 = slot4.__ani
		slot4 = slot4.setPosition

		slot4(slot4, -slot3.x, -slot3.y)

		uv4 = "__ani"

		if slot4 then
			uv4 = "tolua"
			slot4 = slot4.setScaleX
			uv6 = "tolua"
			slot6 = slot6:getScaleX() / slot0

			slot4(slot4, slot6)

			uv4 = "tolua"
			uv6 = "tolua"

			slot4:setScaleY(slot6:getScaleY() / slot0)
		end

		uv7 = "tolua"

		cc.Node:create():add(slot7.__ani):name("sprite_spine_rt")

		if slot3.height < 1 or slot3.width < 1 then
			slot4:setContentSize(1, 1)
		else
			slot4:setContentSize(slot3)
		end

		slot5 = cc.RenderTexture:createWithNode(slot4, 1, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444)

		slot5:setAutoDraw(true)

		slot8 = gl.COLOR_BUFFER_BIT

		slot5:setClearFlags(slot8)

		uv8 = "tolua"

		slot5:addTo(slot8)
		slot5:setPosition(slot3.x, slot3.y)

		slot6 = slot5.setContentSize

		slot6(slot5, slot3)

		uv6 = "tolua"
		slot6.__twoColorSprites = {
			slot4,
			slot5
		}
		uv6 = "__shaderName"

		slot6(slot5)
	end, 0.1)
end

function CSprite.setHSLShader(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot0.__ani == nil then
		return
	end

	if slot0.__shaderName == "hsl" then
		return
	end

	slot0.__shaderName = "hsl"

	if slot0:isSpine() then
		if slot0.__isTwoColorTint or slot0.__ani:isTwoColorTint() then
			slot0:_initRTForSpineAnimation("hsl", false, function (slot0)
				uv4 = "cache"
				uv5 = "setHSLShader"
				uv6 = "getSprite"
				uv7 = "cache"
				uv8 = "setHSLShader"
				uv9 = "getSprite"

				cache.setHSLShader(slot0:getSprite(), false, slot4, slot5, slot6, slot7, slot8, slot9)
			end)
		else
			cache.setHSLShader(slot0.__ani, true, slot1, slot2, slot3, slot4, slot5, slot6)
		end
	else
		cache.setHSLShader(slot0.__ani, slot0:isSpine(), slot1, slot2, slot3, slot4, slot5, slot6)
	end
end

function CSprite.setColor2Shader(slot0, slot1)
	if slot0.__ani == nil then
		return
	end

	if slot0.__shaderName == "color2" then
		if slot0.__twoColorSprites then
			cache.setColor2Shader(slot0.__twoColorSprites[2]:getSprite(), false, slot1)
		end

		return
	end

	slot0.__shaderName = "color2"

	if slot0:isSpine() then
		if slot0.__isTwoColorTint or slot0.__ani:isTwoColorTint() then
			slot0:_initRTForSpineAnimation("color2", true, function (slot0)
				uv4 = "cache"

				cache.setColor2Shader(slot0:getSprite(), false, slot4)
			end)
		else
			cache.setColor2Shader(slot0.__ani, true, slot1)
		end
	else
		cache.setColor2Shader(slot0.__ani, slot0:isSpine(), slot1)
	end
end

function CSprite.setShihuaShader(slot0, slot1)
	if slot0.__ani == nil then
		return
	end

	if slot0.__shaderName == "shihua" then
		return
	end

	slot0.__shaderName = "shihua"

	if slot0:isSpine() then
		if slot0.__isTwoColorTint or slot0.__ani:isTwoColorTint() then
			slot0.__isTwoColorTint = true

			performWithDelay(slot0, function ()
				uv0 = "__ani"

				if slot0.__ani == nil then
					return
				end

				uv0 = "__ani"

				if slot0.__shaderName ~= "shihua" then
					return
				end

				uv0 = "__ani"
				slot0 = slot0.__ani
				slot1 = slot0
				slot0 = slot0.getScale(slot1)
				uv1 = "__ani"
				slot1 = slot1.__ani
				slot2 = slot1
				slot1 = slot1.getContentSize(slot2)
				uv2 = "__ani"

				if slot2.__ani:getBoundingBox().height < 1 or slot2.width < 1 then
					uv3 = "__ani"

					slot3.__ani:setContentSize(1, 1)
				else
					uv3 = "__ani"

					slot3.__ani:setContentSize(slot2)
				end

				uv5 = "__ani"
				slot7 = 1
				slot3 = cc.utils:captureNodeSprite(slot5.__ani, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444, slot7, -slot2.x, -slot2.y)
				slot4 = slot3.xy

				slot4(slot3, slot2)

				uv4 = "__ani"
				slot4 = slot4.addChild

				slot4(slot4, slot3)

				uv4 = "__ani"
				slot4 = slot4.__ani
				slot4 = slot4.setScale

				slot4(slot4, slot0)

				uv4 = "__ani"
				slot4 = slot4.__ani
				slot4 = slot4.setContentSize

				slot4(slot4, slot1)

				uv4 = "__ani"
				slot4.__twoColorSprites = {
					slot3
				}
				slot4 = cache.setShihuaShader
				uv7 = "__shaderName"

				slot4(slot3, false, slot7)

				uv4 = "__ani"

				slot4.__ani:hide()
			end, 0.1)
		else
			cache.setShihuaShader(slot0.__ani, true, slot1)
		end
	else
		cache.setShihuaShader(slot0.__ani, false, slot1)
	end
end

function CSprite.setGLProgram(slot0, slot1, slot2)
	if slot0.__ani == nil then
		return
	end

	if slot0.__shaderName == slot1 then
		return
	end

	slot0.__shaderName = slot1

	if not slot0.__rawShaderState then
		slot0.__rawShaderState = slot0.__ani:getGLProgramState()
	end

	if not slot2 then
		slot2 = cache.getShader(slot0:isSpine(), slot1)
	end

	if slot2 == nil and slot1 then
		return
	end

	if slot0:isSprite() then
		slot0.__ani:setGLProgramState(slot2)

		for slot6, slot7 in pairs(slot0.__ani:getChildren()) do
			if iskindof(slot7, "cc.Sprite") then
				slot7:setGLProgramState(slot2)
			end
		end
	elseif slot0:isArmature() then
		slot0.__ani:setGLProgramState(slot2)

		for slot6, slot7 in pairs(slot0.__ani:getChildren()) do
			uv8 = "__ani"

			if slot8(slot7) == "ccs.Bone" then
				for slot12, slot13 in pairs(slot7:getDisplayNodeList()) do
					slot13:setGLProgramState(slot2)
				end
			end
		end
	elseif slot0:isSpine() then
		if slot2 and tolua.isnull(slot2) then
			slot2 = nil
		end

		if slot0.__isTwoColorTint then
			slot0.__ani:setTwoColorTint(true)
			slot0.__ani:retain():autorelease()
			slot0.__ani:removeSelf():addTo(slot0)
			slot0.__ani:setPosition(0, 0)
			slot0.__ani:show()

			if slot0.__twoColorSprites then
				for slot6, slot7 in ipairs(slot0.__twoColorSprites) do
					slot7:removeSelf()
				end

				slot0.__twoColorSprites = nil
			end

			return
		end

		if slot2 == nil then
			slot2 = cc.GLProgramState:getOrCreateWithGLProgramName("ShaderPositionTextureColor_noMVP")
		end

		slot0.__ani:setGLProgramState(slot2)
	end

	return slot2
end

function CSprite.setTextureRect(slot0, slot1, slot2)
	if slot0.__ani == nil then
		return
	end

	if slot0:isSprite() then
		for slot6, slot7 in pairs(slot0.__ani:getChildren()) do
			if iskindof(slot7, "cc.Sprite") then
				slot9 = {
					width = slot1.width
				}

				if slot1.width < slot7:getTextureRect().width then
					-- Nothing
				else
					slot9.width = slot8.width
				end

				if slot1.height < slot8.height then
					slot9.height = slot1.height
				else
					slot9.height = slot8.height
				end

				slot7:setTextureRect(cc.rect(slot8.x, slot8.y, slot9.width, slot9.height), slot2, slot9)
			end
		end
	elseif slot0:isArmature() then
		for slot6, slot7 in pairs(slot0.__ani:getChildren()) do
			if iskindof(slot7, "ccs.Bone") then
				for slot12, slot13 in pairs(slot7:getDisplayNodeList()) do
					slot15 = {
						width = slot1.width
					}

					if slot1.width < slot13:getTextureRect().width then
						-- Nothing
					else
						slot15.width = slot14.width
					end

					if slot1.height < slot14.height then
						slot15.height = slot1.height
					else
						slot15.height = slot14.height
					end

					slot13:setTextureRect(cc.rect(slot14.x, slot14.y, slot15.width, slot15.height), slot2, slot15)
				end
			end
		end
	end
end

function CSprite.setLifeTime(slot0, slot1)
	return cache.setCSpriteLifeTime(slot0, slot1)
end

function CSprite.pause(slot0)
	if slot0.__ani == nil then
		return
	end

	if slot0:isArmature() then
		slot0.__ani:getAnimation():pause()
	elseif slot0:isSpine() then
		slot0.__ani:pause()
	end
end

function CSprite.resume(slot0)
	if slot0.__ani == nil then
		return
	end

	if slot0:isArmature() then
		slot0.__ani:getAnimation():resume()
	elseif slot0:isSpine() then
		slot0.__ani:resume()
	end
end

function CSprite.play(slot0, slot1, slot2)
	slot3 = false

	if slot0:isArmature() then
		slot3 = true

		if slot1 then
			slot0.__ani:getAnimation():play(slot1)
		else
			slot0.__ani:getAnimation():playWithIndex(0)
		end
	elseif slot0:isSpine() then
		if slot2 or slot1:find("_loop") then
			slot3 = slot0.__ani:setAnimation(0, slot1, true)
		elseif not slot0.__ani:setAnimation(0, slot1, false) and slot1 == "effect" then
			slot3 = slot0.__ani:setAnimation(0, "effect_loop", true)
		end

		if gSoundCsv and gSoundCsv[slot0.__aniRes] then
			slot4 = gSoundCsv[slot0.__aniRes][slot1]
		end

		if slot4 then
			performWithDelay(slot0, function ()
				uv1 = "audio"

				audio.playEffectWithWeekBGM(slot1.res)
			end, slot4.delay)
		end
	end

	return slot3
end

function CSprite.addPlay(slot0, slot1)
	slot2 = false

	if slot0:isSpine() then
		if slot1:find("_loop") then
			slot2 = slot0.__ani:addAnimation(0, slot1, true)
		else
			slot2 = slot0.__ani:addAnimation(0, slot1, false)
		end
	end

	return slot2
end

function CSprite.findAnimation(slot0, slot1)
	if not slot1 or not slot0.__ani then
		return false
	end

	if slot0:isSpine() then
		return slot0.__ani:findAnimation(slot1)
	end
end

function CSprite.removeAnimation(slot0)
	if slot0.__ani then
		slot0.__ani:removeFromParent()

		slot0.__ani = nil
		slot0.__aniRes = nil
	end

	slot0.__shaderName = nil
	slot0.__rawShaderState = nil

	return slot0
end

function CSprite.removeSelf(slot0)
	if slot0:isSpine() then
		slot0:setSpriteEventHandler()
	end

	slot0:removeAnimation()
	slot0:removeFromParent()

	return slot0
end

function CSprite.removeSelfToCache(slot0)
	if slot0.__rawShaderState then
		slot0:setGLProgram(nil, slot0.__rawShaderState)

		slot0.__rawShaderState = nil
	end

	if slot0:isSpine() then
		slot0.__ani:setToSetupPose()
		slot0:setSpriteEventHandler()
	end

	slot0:removeFromParent()

	return slot0
end

function CSprite.setAnimationSpeedScale(slot0, slot1, slot2)
	if slot0:isArmature() then
		if not slot2 or not slot0.__ani:getAnimation():getSpeedScale() then
			slot3 = 1
		end

		slot0.__ani:getAnimation():setSpeedScale(slot1 * slot3)
	elseif slot0:isSpine() then
		if not slot2 or not slot0.__ani:getTimeScale() then
			slot3 = 1
		end

		slot0.__ani:setTimeScale(slot1 * slot3)
	end

	return slot0
end

function CSprite.setSpriteEventHandler(slot0, slot1, slot2)
	if slot0:isSpine() then
		if slot2 then
			slot0.__ani:unregisterSpineEventHandler(slot2)

			if slot1 then
				slot0.__ani:registerSpineEventHandler(function ()
					error("Decompilation failed")
					-- Exception in function building!
					-- Traceback (most recent call last):
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
					--     return _build_function_definition(prototype, state.header)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
					--     node.statements.contents = _build_function_blocks(state, instructions)
					--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
					--     statement, line_marked_elements = _build_statement(state, addr, instruction)
					--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
					--     return _build_var_assignment(state, addr, instruction)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
					--     assn = func(*args, **kwargs)
					--            ^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
					--     expression = _build_const_expression(state, addr, instruction)
					--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
					--     return _build_string_constant(state, instruction.CD)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
					--     node.value = state.constants.complex_constants[index]
					--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
					-- IndexError: list index out of range
				end, slot2)
			end
		else
			for slot6, slot7 in pairs(sp.EventType) do
				if slot7 ~= sp.EventType.ANIMATION_DISPOSE then
					slot0.__ani:unregisterSpineEventHandler(slot7)

					if slot1 then
						slot0.__ani:registerSpineEventHandler(function ()
							error("Decompilation failed")
							-- Exception in function building!
							-- Traceback (most recent call last):
							-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
							--     return _build_function_definition(prototype, state.header)
							--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
							-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
							--     node.statements.contents = _build_function_blocks(state, instructions)
							--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
							-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
							--     statement, line_marked_elements = _build_statement(state, addr, instruction)
							--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
							-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
							--     return _build_var_assignment(state, addr, instruction)
							--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
							-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
							--     assn = func(*args, **kwargs)
							--            ^^^^^^^^^^^^^^^^^^^^^
							-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
							--     expression = _build_const_expression(state, addr, instruction)
							--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
							-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
							--     return _build_string_constant(state, instruction.CD)
							--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
							-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
							--     node.value = state.constants.complex_constants[index]
							--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
							-- IndexError: list index out of range
						end, slot7)
					end
				end
			end
		end
	end

	return slot0
end

function CSprite.getAni(slot0)
	return slot0.__ani
end

function CSprite.getBoundingBox(slot0)
	return slot0.__ani:getBoundingBox()
end

function CSprite.getCascadeBoundingBox(slot0)
	return cc.utils:getCascadeBoundingBox(slot0)
end

function CSprite.setTimeScale(slot0, slot1)
	if slot0:isSpine() then
		return slot0.__ani:setTimeScale(slot1)
	end

	error("only spine had setTimeScale")
end

function CSprite.setSkin(slot0, slot1)
	if slot0:isSpine() then
		return slot0.__ani:setSkin(slot1)
	end

	error("only spine had setSkin")
end

function CSprite.getBonePosition(slot0, slot1)
	if slot0:isSpine() then
		return slot0.__ani:getBonePosition(slot1)
	end

	error("only spine had getBonePosition")
end

function CSprite.getBoneRotation(slot0, slot1)
	if slot0:isSpine() then
		return slot0.__ani:getBoneRotation(slot1)
	end

	error("only spine had getBoneRotation")
end

function CSprite.getBoneRotationX(slot0, slot1)
	if slot0:isSpine() then
		return slot0.__ani:getBoneRotationX(slot1)
	end

	error("only spine had getBoneRotationX")
end

function CSprite.getBoneRotationY(slot0, slot1)
	if slot0:isSpine() then
		return slot0.__ani:getBoneRotationY(slot1)
	end

	error("only spine had getBoneRotationY")
end

function CSprite.getBoneScaleX(slot0, slot1)
	if slot0:isSpine() then
		return slot0.__ani:getBoneScaleX(slot1)
	end

	error("only spine had getBoneScaleX")
end

function CSprite.getBoneScaleY(slot0, slot1)
	if slot0:isSpine() then
		return slot0.__ani:getBoneScaleY(slot1)
	end

	error("only spine had getBoneScaleY")
end

function CSprite.getBoneShearX(slot0, slot1)
	if slot0:isSpine() then
		return slot0.__ani:getBoneShearX(slot1)
	end

	error("only spine had getBoneShearX")
end

function CSprite.getBoneShearY(slot0, slot1)
	if slot0:isSpine() then
		return slot0.__ani:getBoneShearY(slot1)
	end

	error("only spine had getBoneShearY")
end

function CSprite.modelOnly(slot0)
	slot0:stopAllActions()

	if slot0:isSpine() then
		for slot4, slot5 in pairs(sp.EventType) do
			slot0.__ani:unregisterSpineEventHandler(slot5)
		end
	end
end
