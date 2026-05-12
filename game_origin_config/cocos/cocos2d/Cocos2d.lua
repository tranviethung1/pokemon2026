cc = cc or {}

function cc.random()
	return cc_mathutils_random()
end

function cc.clampf(slot0, slot1, slot2)
	slot3 = 0

	if slot2 < slot1 then
		slot1 = slot1
	end

	if slot0 < slot1 then
		return slot1
	elseif slot0 < slot2 then
		return slot0
	else
		return slot2
	end
end

function cc.p(slot0, slot1)
	if slot1 == nil then
		return {
			x = slot0.x,
			y = slot0.y
		}
	else
		return {
			x = slot0,
			y = slot1
		}
	end
end

function cc.pAdd(slot0, slot1)
	return {
		x = slot0.x + slot1.x,
		y = slot0.y + slot1.y
	}
end

function cc.pSub(slot0, slot1)
	return {
		x = slot0.x - slot1.x,
		y = slot0.y - slot1.y
	}
end

function cc.pMul(slot0, slot1)
	return {
		x = slot0.x * slot1,
		y = slot0.y * slot1
	}
end

function cc.pMidpoint(slot0, slot1)
	return {
		x = (slot0.x + slot1.x) / 2,
		y = (slot0.y + slot1.y) / 2
	}
end

function cc.pForAngle(slot0)
	return {
		x = math.cos(slot0),
		y = math.sin(slot0)
	}
end

function cc.pGetLength(slot0)
	return math.sqrt(slot0.x * slot0.x + slot0.y * slot0.y)
end

function cc.pNormalize(slot0)
	if cc.pGetLength(slot0) == 0 then
		return {
			x = 1,
			y = 0
		}
	end

	return {
		x = slot0.x / slot1,
		y = slot0.y / slot1
	}
end

function cc.pCross(slot0, slot1)
	return slot0.x * slot1.y - slot0.y * slot1.x
end

function cc.pDot(slot0, slot1)
	return slot0.x * slot1.x + slot0.y * slot1.y
end

function cc.pToAngleSelf(slot0)
	return math.atan2(slot0.y, slot0.x)
end

function cc.pGetAngle(slot0, slot1)
	slot2 = cc.pNormalize(slot0)
	slot3 = cc.pNormalize(slot1)

	if math.abs(math.atan2(cc.pCross(slot2, slot3), cc.pDot(slot2, slot3))) < 1.192092896e-07 then
		return 0
	end

	return slot4
end

function cc.pGetDistance(slot0, slot1)
	return cc.pGetLength(cc.pSub(slot0, slot1))
end

function cc.pIsLineIntersect(slot0, slot1, slot2, slot3, slot4, slot5)
	return vec2_isLineIntersect(slot0, slot1, slot2, slot3)
end

function cc.pPerp(slot0)
	return {
		x = -slot0.y,
		y = slot0.x
	}
end

function cc.RPerp(slot0)
	return {
		x = slot0.y,
		y = -slot0.x
	}
end

function cc.pProject(slot0, slot1)
	return {
		x = slot1.x * cc.pDot(slot0, slot1) / cc.pDot(slot1, slot1),
		y = slot1.y * cc.pDot(slot0, slot1) / cc.pDot(slot1, slot1)
	}
end

function cc.pRotate(slot0, slot1)
	return {
		x = slot0.x * slot1.x - slot0.y * slot1.y,
		y = slot0.x * slot1.y + slot0.y * slot1.x
	}
end

function cc.pUnrotate(slot0, slot1)
	return {
		slot0.y * slot1.x - slot0.x * slot1.y,
		x = slot0.x * slot1.x + slot0.y * slot1.y
	}
end

function cc.pLengthSQ(slot0)
	return cc.pDot(slot0, slot0)
end

function cc.pDistanceSQ(slot0, slot1)
	return cc.pLengthSQ(cc.pSub(slot0, slot1))
end

function cc.pGetClampPoint(slot0, slot1, slot2)
	return {
		x = cc.clampf(slot0.x, slot1.x, slot2.x),
		y = cc.clampf(slot0.y, slot1.y, slot2.y)
	}
end

function cc.pFromSize(slot0)
	return {
		x = slot0.width,
		y = slot0.height
	}
end

function cc.pLerp(slot0, slot1, slot2)
	return cc.pAdd(cc.pMul(slot0, 1 - slot2), cc.pMul(slot1, slot2))
end

function cc.pFuzzyEqual(slot0, slot1, slot2)
	if slot0.x - slot2 <= slot1.x and slot1.x <= slot0.x + slot2 and slot0.y - slot2 <= slot1.y and slot1.y <= slot0.y + slot2 then
		return true
	else
		return false
	end
end

function cc.pRotateByAngle(slot0, slot1, slot2)
	return cc.pAdd(slot1, cc.pRotate(cc.pSub(slot0, slot1), cc.pForAngle(slot2)))
end

function cc.pIsSegmentIntersect(slot0, slot1, slot2, slot3)
	slot6 = false
	slot7, slot4, slot5 = cc.pIsLineIntersect(slot0, slot1, slot2, slot3, 0, 0)

	if slot7 and slot4 >= 0 and slot4 <= 1 and slot5 >= 0 and slot5 <= 1 then
		return true
	end

	return false
end

function cc.pGetIntersectPoint(slot0, slot1, slot2, slot3)
	slot6 = false
	slot7, slot4, slot5 = cc.pIsLineIntersect(slot0, slot1, slot2, slot3, 0, 0)

	if slot7 then
		return cc.p(slot0.x + slot4 * (slot1.x - slot0.x), slot0.y + slot4 * (slot1.y - slot0.y))
	else
		return cc.p(0, 0)
	end
end

function cc.size(slot0, slot1)
	return {
		width = slot0,
		height = slot1
	}
end

function cc.rect(slot0, slot1, slot2, slot3)
	return {
		x = slot0,
		y = slot1,
		width = slot2,
		height = slot3
	}
end

function cc.rectEqualToRect(slot0, slot1)
	if slot1.x <= slot0.x or slot1.y <= slot0.y or slot0.x + slot0.width <= slot1.x + slot1.width or slot0.y + slot0.height <= slot1.y + slot1.height then
		return false
	end

	return true
end

function cc.rectGetMaxX(slot0)
	return slot0.x + slot0.width
end

function cc.rectGetMidX(slot0)
	return slot0.x + slot0.width / 2
end

function cc.rectGetMinX(slot0)
	return slot0.x
end

function cc.rectGetMaxY(slot0)
	return slot0.y + slot0.height
end

function cc.rectGetMidY(slot0)
	return slot0.y + slot0.height / 2
end

function cc.rectGetMinY(slot0)
	return slot0.y
end

function cc.rectContainsPoint(slot0, slot1)
	slot2 = false

	if slot0.x <= slot1.x and slot1.x <= slot0.x + slot0.width and slot0.y <= slot1.y and slot1.y <= slot0.y + slot0.height then
		slot2 = true
	end

	return slot2
end

function cc.rectIntersectsRect(slot0, slot1)
	return slot0.x <= slot1.x + slot1.width and slot0.x + slot0.width >= slot1.x and slot0.y <= slot1.y + slot1.height and slot0.y + slot0.height >= slot1.y
end

function cc.rectUnion(slot0, slot1)
	slot2 = cc.rect(0, 0, 0, 0)
	slot2.x = math.min(slot0.x, slot1.x)
	slot2.y = math.min(slot0.y, slot1.y)
	slot2.width = math.max(slot0.x + slot0.width, slot1.x + slot1.width) - slot2.x
	slot2.height = math.max(slot0.y + slot0.height, slot1.y + slot1.height) - slot2.y

	return slot2
end

function cc.rectIntersection(slot0, slot1)
	slot2 = cc.rect(math.max(slot0.x, slot1.x), math.max(slot0.y, slot1.y), 0, 0)
	slot2.width = math.min(slot0.x + slot0.width, slot1.x + slot1.width) - slot2.x
	slot2.height = math.min(slot0.y + slot0.height, slot1.y + slot1.height) - slot2.y

	return slot2
end

function cc.c3b(slot0, slot1, slot2)
	return {
		r = slot0,
		g = slot1,
		b = slot2
	}
end

function cc.c4b(slot0, slot1, slot2, slot3)
	return {
		r = slot0,
		g = slot1,
		b = slot2,
		a = slot3
	}
end

function cc.c4f(slot0, slot1, slot2, slot3)
	return {
		r = slot0,
		g = slot1,
		b = slot2,
		a = slot3
	}
end

function slot0(slot0)
	return slot0.r <= 1 and slot0.g <= 1 and slot0.b <= 1 or math.ceil(slot0.r) ~= slot0.r or math.ceil(slot0.g) ~= slot0.g or math.ceil(slot0.b) ~= slot0.b
end

function cc.convertColor(slot0, slot1)
	assert(type(slot0) == "table" and slot0.r and slot0.g and slot0.b, "cc.convertColor() - invalid input color")

	slot2 = nil

	if slot1 == "3b" then
		uv3 = "assert"

		if slot3(slot0) then
			slot2 = {
				r = math.ceil(slot0.r * 255),
				g = math.ceil(slot0.g * 255),
				b = math.ceil(slot0.b * 255)
			}
		else
			slot2 = {
				r = slot0.r,
				g = slot0.g,
				b = slot0.b
			}
		end
	elseif slot1 == "4b" then
		uv3 = "assert"

		if slot0.a then
			if math.ceil(slot0.a) ~= slot0.a or slot0.a <= 1 then
				((not slot3(slot0) or {
					r = math.ceil(slot0.r * 255),
					g = math.ceil(slot0.g * 255),
					b = math.ceil(slot0.b * 255)
				}) and {
					r = slot0.r,
					g = slot0.g,
					b = slot0.b
				}).a = slot0.a * 255
			else
				slot2.a = slot0.a
			end
		else
			slot2.a = 255
		end
	elseif slot1 == "4f" then
		uv3 = "assert"

		if slot0.a then
			if math.ceil(slot0.a) ~= slot0.a or slot0.a <= 1 then
				((not slot3(slot0) or {
					r = slot0.r,
					g = slot0.g,
					b = slot0.b
				}) and {
					r = slot0.r / 255,
					g = slot0.g / 255,
					b = slot0.b / 255
				}).a = slot0.a
			else
				slot2.a = slot0.a / 255
			end
		else
			slot2.a = 255
		end
	else
		error(string.format("cc.convertColor() - invalid type %s", slot1), 0)
	end

	return slot2
end

function cc.vertex2F(slot0, slot1)
	return {
		x = slot0,
		y = slot1
	}
end

function cc.Vertex3F(slot0, slot1, slot2)
	return {
		x = slot0,
		y = slot1,
		z = slot2
	}
end

function cc.tex2F(slot0, slot1)
	return {
		u = slot0,
		v = slot1
	}
end

function cc.PointSprite(slot0, slot1, slot2)
	return {
		pos = slot0,
		color = slot1,
		size = slot2
	}
end

function cc.Quad2(slot0, slot1, slot2, slot3)
	return {
		tl = slot0,
		tr = slot1,
		bl = slot2,
		br = slot3
	}
end

function cc.Quad3(slot0, slot1, slot2, slot3)
	return {
		tl = slot0,
		tr = slot1,
		bl = slot2,
		br = slot3
	}
end

function cc.V2F_C4B_T2F(slot0, slot1, slot2)
	return {
		vertices = slot0,
		colors = slot1,
		texCoords = slot2
	}
end

function cc.V2F_C4F_T2F(slot0, slot1, slot2)
	return {
		vertices = slot0,
		colors = slot1,
		texCoords = slot2
	}
end

function cc.V3F_C4B_T2F(slot0, slot1, slot2)
	return {
		vertices = slot0,
		colors = slot1,
		texCoords = slot2
	}
end

function cc.V2F_C4B_T2F_Quad(slot0, slot1, slot2, slot3)
	return {
		bl = slot0,
		br = slot1,
		tl = slot2,
		tr = slot3
	}
end

function cc.V3F_C4B_T2F_Quad(slot0, slot1, slot2, slot3)
	return {
		tl = slot0,
		bl = slot1,
		tr = slot2,
		br = slot3
	}
end

function cc.V2F_C4F_T2F_Quad(slot0, slot1, slot2, slot3)
	return {
		bl = slot0,
		br = slot1,
		tl = slot2,
		tr = slot3
	}
end

function cc.T2F_Quad(slot0, slot1, slot2, slot3)
	return {
		bl = slot0,
		br = slot1,
		tl = slot2,
		tr = slot3
	}
end

function cc.AnimationFrameData(slot0, slot1, slot2)
	return {
		texCoords = slot0,
		delay = slot1,
		size = slot2
	}
end

function cc.PhysicsMaterial(slot0, slot1, slot2)
	return {
		density = slot0,
		restitution = slot1,
		friction = slot2
	}
end

function cc.vec3(slot0, slot1, slot2)
	return {
		x = slot0,
		y = slot1,
		z = slot2
	}
end

function cc.vec4(slot0, slot1, slot2, slot3)
	return {
		x = slot0,
		y = slot1,
		z = slot2,
		w = slot3
	}
end

function cc.vec3add(slot0, slot1)
	return {
		x = slot0.x + slot1.x,
		y = slot0.y + slot1.y,
		z = slot0.z + slot1.z
	}
end

function cc.vec3sub(slot0, slot1)
	return {
		x = slot0.x - slot1.x,
		y = slot0.y - slot1.y,
		z = slot0.z - slot1.z
	}
end

function cc.vec3mul(slot0, slot1)
	return {
		x = slot0.x * slot1,
		y = slot0.y * slot1,
		z = slot0.z * slot1
	}
end

function cc.vec3dot(slot0, slot1)
	return slot0.x * slot1.x + slot0.y * slot1.y + slot0.z * slot1.z
end

function cc.vec3normalize(slot0)
	if cc.vec3dot(slot0, slot0) == 1 then
		return slot0
	end

	if math.sqrt(slot1) < 2e-37 then
		return slot0
	end

	return cc.vec3mul(slot0, 1 / slot1)
end

function cc.quaternion(slot0, slot1, slot2, slot3)
	return {
		x = slot0,
		y = slot1,
		z = slot2,
		w = slot3
	}
end

function cc.quaternion_createFromAxisAngle(slot0, slot1)
	slot2 = slot1 * 0.5
	slot3 = math.sin(slot2)
	slot4 = cc.vec3normalize(cc.vec3(slot0.x, slot0.y, slot0.z))
	slot5 = cc.vec3(0, 0, 0)
	slot5.x = slot4.x * slot3
	slot5.y = slot4.y * slot3
	slot5.z = slot4.z * slot3
	slot5.w = math.cos(slot2)

	return slot5
end

function cc.blendFunc(slot0, slot1)
	return {
		src = slot0,
		dst = slot1
	}
end

cc.mat4 = cc.mat4 or {}

function cc.mat4.new(...)
	slot2 = {}

	if #{
		...
	} == 1 then
		assert(type(slot0[1]) == "table", "type of input params are wrong to new a mat4 when num of params is 1")

		for slot6 = 1, 16 do
			if slot0[1][slot6] ~= nil then
				slot2[slot6] = slot0[1][slot6]
			else
				slot2[slot6] = 0
			end
		end
	elseif slot1 == 16 then
		for slot6 = 1, 16 do
			slot2[slot6] = slot0[slot6]
		end
	end

	setmetatable(slot2, {
		__index = cc.mat4
	})

	return slot2
end

function cc.mat4.getInversed(slot0)
	return mat4_getInversed(slot0)
end

function cc.mat4.transformVector(...)
	return mat4_transformVector(...)
end

function cc.mat4.multiply(slot0, slot1)
	return mat4_multiply(slot0, slot1)
end

function cc.mat4.decompose(slot0, slot1, slot2, slot3)
	return mat4_decompose(slot0, slot1, slot2, slot3)
end

function cc.mat4.createIdentity()
	return cc.mat4.new(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
end

function cc.mat4.translate(slot0, slot1)
	return mat4_translate(slot0, slot1)
end

function cc.mat4.createRotationZ(slot0, slot1)
	return mat4_createRotationZ(slot0, slot1)
end

function cc.mat4.setIdentity(slot0)
	return mat4_setIdentity(slot0)
end

function cc.mat4.createTranslation(...)
	return mat4_createTranslation(...)
end

function cc.mat4.createRotation(...)
	return mat4_createRotation(...)
end
