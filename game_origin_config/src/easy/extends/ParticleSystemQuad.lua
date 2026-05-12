slot0 = cc.ParticleSystemQuad
slot1 = slot0.create
slot2 = table.insert
slot3 = 100
slot4 = 101
slot5 = 102
slot6 = 103
slot8 = itertools.map({
	"x",
	"y",
	"scale",
	"scaleX",
	"scaleY",
	"opacity"
}, function (slot0, slot1)
	return slot1, slot1
end)

arraytools.merge_inplace(itertools.map({
	"angle",
	"angleVar",
	"duration",
	"emissionRate",
	"endColor",
	"endColorVar",
	"endRadius",
	"endRadiusVar",
	"endSize",
	"endSizeVar",
	"endSpin",
	"endSpinVar",
	"gravity",
	"life",
	"lifeVar",
	"posVar",
	"positionType",
	"radialAccel",
	"radialAccelVar",
	"rotationIsDir",
	"rotatePerSecond",
	"rotatePerSecondVar",
	"sourcePostion",
	"speed",
	"speedVar",
	"startColor",
	"startColorVar",
	"startRadius",
	"startRadiusVar",
	"startSize",
	"startSizeVar",
	"startSpin",
	"startSpinVar",
	"tangentialAccel",
	"tangentialAccelVar"
}, function (slot0, slot1)
	return slot1, "set" .. string.caption(slot1)
end), {
	{
		rotatePerS = "setRotatePerSecond",
		rotatePerSVar = "setRotatePerSecondVar",
		sourcePos = "setSourcePosition"
	}
})

function slot12(slot0, slot1, slot2)
	slot2 = slot2 or {}
	slot3 = {}

	for slot7, slot8 in pairs(slot0) do
		if not slot1[slot7] then
			printWarn("!!!particleSystemEasy not define props [%s]", slot7)
		else
			for slot12, slot13 in ipairs(slot8) do
				uv14 = "pairs"

				slot14(slot3, {
					props = slot7,
					name = slot1[slot7],
					frame = slot13.frame,
					value = slot13.value
				})

				if slot2.type == "props" and #slot3 > 1 then
					slot3[#slot3 - 1].nextFrame = slot13.frame
					slot3[#slot3 - 1].nextValue = slot13.value
				end
			end
		end
	end

	return slot3
end

function slot13(slot0)
	if slot0 then
		if slot0.props then
			uv6 = "props"
			uv8 = "arraytools"

			arraytools.merge_inplace({}, {
				slot6(slot2, slot8, {
					type = "props"
				})
			})
		end

		if slot0.comps and slot0.comps["cc.ParticleSystem"] then
			uv7 = "props"
			uv9 = "merge_inplace"

			arraytools.merge_inplace(slot1, {
				slot7(slot3, slot9, {
					type = "comps"
				})
			})
		end
	end

	return slot1
end

function slot14(slot0, slot1, slot2, slot3, slot4)
	if slot1 == "x" or slot1 == "y" then
		if slot1 == "x" then
			slot2.x = slot4
		elseif slot1 == "y" then
			slot2.y = slot4
		end

		uv7 = "x"

		slot0:stopAllActionsByTag(slot7)

		slot7 = cc.MoveTo
		slot8 = slot7
		slot5 = cc.Sequence:create(slot7.create(slot8, slot3, cc.p(slot2.x, slot2.y)))
		uv8 = "x"

		slot5:setTag(slot8)
		slot0:runAction(slot5)
	elseif slot1 == "scale" or slot1 == "scaleX" or slot1 == "scaleY" then
		if slot1 == "scale" then
			slot2.scaleX = slot4
			slot2.scaleY = slot4
		elseif slot1 == "scaleX" then
			slot2.scaleX = slot4
		elseif slot1 == "scaleY" then
			slot2.scaleY = slot4
		end

		uv7 = "y"

		slot0:stopAllActionsByTag(slot7)

		slot7 = cc.ScaleTo
		slot8 = slot7
		slot5 = cc.Sequence:create(slot7.create(slot8, slot3, slot2.scaleX, slot2.scaleY))
		uv8 = "y"

		slot5:setTag(slot8)
		slot0:runAction(slot5)
	elseif slot1 == "opacity" then
		uv7 = "stopAllActionsByTag"

		slot0:stopAllActionsByTag(slot7)

		slot7 = cc.FadeTo
		slot8 = slot7
		slot5 = cc.Sequence:create(slot7.create(slot8, slot3, slot4))
		uv8 = "stopAllActionsByTag"

		slot5:setTag(slot8)
		slot0:runAction(slot5)

		return true
	end

	return false
end

function slot0.create(slot0, slot1, slot2)
	uv3 = "cc"
	slot3 = slot3(slot0, slot1)

	if slot2 then
		slot5 = json.decode(cc.FileUtils:getInstance():getStringFromFile(slot2))
		slot6 = {}
		uv10 = "FileUtils"

		arraytools.merge_inplace(slot6, {
			slot10(slot5.curveData)
		})

		uv10 = "FileUtils"

		arraytools.merge_inplace(slot6, {
			slot10(slot5.curveData.paths and slot5.curveData.paths.particlesystem)
		})
		table.sort(slot6, function (slot0, slot1)
			return slot0.frame < slot1.frame
		end)

		slot7 = 1

		while slot6[slot7] and slot6[slot7].frame == 0 do
			if slot3[slot6[slot7].name] then
				slot10(slot3, slot6[slot7].value)
			else
				printWarn("!!!particleSystemEasy not has node name [%s]", slot8)
			end

			slot7 = slot7 + 1
		end

		slot8 = {
			y = slot10,
			x = slot9,
			scaleY = slot3:scaleY(),
			scaleX = slot3:scaleX()
		}
		slot9, slot10 = slot3:xy()
		slot9 = 0
		slot7 = 1

		schedule(slot3, function ()
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
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
			--     return _build_numeric_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
			--     number = state.constants.numeric_constants[index]
			--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end, 0.016666666666666666)
	end

	return slot3
end
