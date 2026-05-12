slot0 = class("HeadNum", battleModule.CBase)
slot1 = 1.2
slot2 = {
	shbj = {
		scale = 0.54,
		height = 183,
		changeText = "-",
		width = 155,
		rect = {
			["0"] = 155,
			["2"] = 155,
			["7"] = 155,
			["3"] = 155,
			["6"] = 155,
			["9"] = 155,
			["5"] = 155,
			["1"] = 155,
			["8"] = 155,
			["4"] = 155
		}
	},
	shxg = {
		scale = 0.73,
		height = 137,
		changeText = "-",
		width = 116,
		rect = {
			["0"] = 116,
			["2"] = 116,
			["7"] = 116,
			["3"] = 116,
			["6"] = 116,
			["9"] = 116,
			["5"] = 116,
			["1"] = 116,
			["8"] = 116,
			["4"] = 116
		}
	},
	zl = {
		scale = 0.73,
		height = 137,
		changeText = "+",
		width = 116,
		rect = {
			["0"] = 116,
			["2"] = 116,
			["7"] = 116,
			["3"] = 116,
			["6"] = 116,
			["9"] = 116,
			["5"] = 116,
			["1"] = 116,
			["8"] = 116,
			["4"] = 116
		}
	},
	zzq_bj = {
		scale = 1,
		height = 74,
		changeText = "-",
		width = 68,
		rect = {
			["0"] = 68,
			["2"] = 68,
			["7"] = 68,
			["3"] = 68,
			["6"] = 68,
			["9"] = 68,
			["5"] = 68,
			["1"] = 68,
			["8"] = 68,
			["4"] = 68
		}
	},
	zzq_pg = {
		scale = 1,
		height = 74,
		changeText = "-",
		width = 68,
		rect = {
			["0"] = 68,
			["2"] = 68,
			["7"] = 68,
			["3"] = 68,
			["6"] = 68,
			["9"] = 68,
			["5"] = 68,
			["1"] = 68,
			["8"] = 68,
			["4"] = 68
		}
	}
}

function slot3(slot0, slot1, slot2)
	slot3 = slot1.pathName

	if slot1.isStorm then
		slot3 = lushi.DamageTextName.storm
	end

	uv5 = "pathName"
	slot4 = clone(slot5[slot1.pathName])
	slot5 = slot4.width
	slot6 = slot4.height
	slot7 = slot4.rect or {}
	slot8 = slot4.scale
	slot9 = slot4.changeText or ""
	slot10 = string.format("lushi/txt_%s.png", slot1.pathName)

	if slot2 then
		ccui.Layout:create():setTouchEnabled(false):addTo(slot0:parent(), 2000, "_textAtlas_"):align(cc.p(0.5, 0.5), slot0:x(), slot0:y())
	else
		slot11:addTo(slot0, 2000, "_textAtlas_"):align(cc.p(0.5, 0.5), 0, 0)
	end

	slot12 = tostring(slot1.data)

	for slot16 = 1, string.len(slot9) do
		if string.byte(string.sub(slot9, slot16, slot16)) < 65 or slot18 > 90 and slot18 < 97 or slot18 > 122 then
			slot17 = "%" .. slot17
		end

		slot12 = string.gsub(slot12, slot17, string.char(57 + slot16))
	end

	slot13 = 0

	for slot17 = 1, string.len(slot12) do
		slot21 = slot7[slot18] or slot5
		slot23 = cc.Sprite:create(slot10):setTextureRect(cc.rect(((tonumber(string.sub(slot12, slot17, slot17)) and slot19 + 2 or 1) - 1) * slot5 + math.max(slot5 - slot21, 0) / 2, 0, slot21, slot6)):align(cc.p(0, 0.5)):xy(cc.p(slot13, slot6 / 2)):addTo(slot11)
		slot13 = slot13 + slot21
	end

	slot11:size(cc.size(slot13, slot6))
	slot11:setScale(slot8)
	slot11:setCascadeOpacityEnabled(true)

	if not slot2 and not slot1.isHeal and slot1.from ~= lushi.DamageFrom.magic and slot1.from ~= lushi.DamageFrom.buff then
		slot14 = nil
		slot14 = (not slot1.isStorm and not slot1.isThorn and not slot1.isStrike or cc.Sprite:create("lushi/img_zzq_bj.png")) and cc.Sprite:create("lushi/img_zzq_pg.png")

		slot14:addTo(slot11, -1):scale(math.max(slot13 / slot14:width(), slot6 / slot14:height()) * 1.4):align(cc.p(0.5, 0.5), slot13 / 2 * 1.1, slot6 / 2 * 0.8)
	end

	return slot11
end

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.delayMark = {}
end

function slot0.onShowHeadNumber(slot0, slot1, slot2)
	uv3 = "scale"
	slot4 = slot3(slot1, slot2):scale()
	slot5 = slot2.delay or 0
	slot0.delayMark[slot6] = slot0.delayMark[slot1.id] or 0
	slot0.delayMark[slot6] = slot0.delayMark[slot6] + 1

	slot3:z(2000 + slot0.delayMark[slot6])
	transition.executeSequence(slot3):delay(slot5 + (slot0.delayMark[slot6] - 1) * 0.25):scaleTo(0.15, 2 * slot4):scaleTo(0.5, 1 * slot4):func(function ()
		uv1 = "isCSprite"

		if isCSprite(slot1) then
			uv1 = "isCSprite"

			removeCSprite(slot1)
		else
			uv0 = "isCSprite"

			slot0:removeFromParent()
		end

		uv0 = "removeCSprite"
		uv1 = "removeFromParent"
		uv2 = "removeCSprite"
		uv3 = "removeFromParent"
		slot0.delayMark[slot1] = slot2.delayMark[slot3] - 1
	end):done()

	slot10 = slot5
	uv10 = "delay"

	transition.executeSequence(slot3):delay(slot10):fadeOut(slot10):done()
end

function slot0.onShowTrainerNumber(slot0, slot1, slot2)
	slot4 = slot1
	slot3 = slot1.getBoundingBox(slot4)
	uv4 = "getBoundingBox"
	slot4 = slot4(slot1, slot2, true):scale(1.3)
	slot5 = slot4:scale()
	slot9 = 0.5
	uv9 = "scale"

	transition.executeSequence(slot4):delay(0.15):scaleTo(0.15, 0.6 * slot5):scaleTo(slot9, 0.8 * slot5):fadeOut(slot9):func(function ()
		uv1 = "isCSprite"

		if isCSprite(slot1) then
			uv1 = "isCSprite"

			removeCSprite(slot1)
		else
			uv0 = "isCSprite"

			slot0:removeFromParent()
		end
	end):done()
end

return slot0
