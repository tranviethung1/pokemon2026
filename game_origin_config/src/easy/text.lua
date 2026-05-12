slot0 = {}
globals.text = slot0
slot1 = {
	italic = function (slot0, slot1)
		slot0:setRotationSkewX(12)
	end,
	outline = function (slot0, slot1)
		slot0:enableOutline(slot1.color, slot1.size or ui.DEFAULT_OUTLINE_SIZE)
	end,
	glow = function (slot0, slot1)
		slot0:enableGlow(slot1.color)
	end,
	shadow = function (slot0, slot1)
		slot0:enableShadow(slot1.color, slot1.offset, slot1.size)
	end,
	bold = function (slot0)
		if tolua.type(slot0) == "ccui.Text" then
			slot0:getVirtualRenderer():enableBold()
		else
			slot0:enableBold()
		end
	end,
	color = function (slot0, slot1)
		slot0:setTextColor(slot1)
	end,
	size = function (slot0, slot1)
		if tolua.type(slot0) == "cc.Label" and slot1 then
			slot0:setSystemFontSize(slot1)
		elseif tolua.type(slot0) == "ccui.Text" and slot1 then
			slot0:setFontSize(slot1)
		else
			assert(false, "invalid node type, use ccui.Text or Label can set fontSize")
		end
	end
}

function slot0.addEffect(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		uv7 = "pairs"

		slot7[string.lower(slot5)](slot0, slot6)
	end
end

slot2 = {
	italic = cc.LabelEffect.NORMAL,
	outline = cc.LabelEffect.OUTLINE,
	shadow = cc.LabelEffect.SHADOW,
	glow = cc.LabelEffect.GLOW
}

function slot0.deleteEffect(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 == "all" then
		slot0:disableEffect()

		return
	end

	for slot5, slot6 in ipairs(slot1) do
		uv9 = "all"

		slot0:disableEffect(slot9[string.lower(slot6)])
	end
end

function slot0.deleteAllEffect(slot0)
	uv1 = "deleteEffect"

	return slot1.deleteEffect(slot0, "all")
end
