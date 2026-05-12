slot0 = require("easy.bind.helper")
slot1 = require("app.easy.bind.helper.text_atlas")
slot2 = class("textAtlas", cc.load("mvc").ViewBase)
slot2.defaultProps = {
	isEqualDist = false,
	align = "left"
}

function slot2.initExtend(slot0)
	if not tolua.isnull(slot0.panel) then
		slot0.panel:removeFromParent()
	end

	slot0.panel = ccui.Layout:create():setTouchEnabled(false):addTo(slot0, 1, "_textAtlas_")

	if slot0.align == "left" then
		cc.p(0.5, 0.5).x = 0
	elseif slot0.align == "right" then
		slot2.x = 1
	end

	slot3 = slot1.align

	slot3(slot1, slot2)

	uv3 = "tolua"

	if not slot3.findFileInfoByPathName(slot0.pathName) then
		return
	end

	slot4 = slot3.width
	slot5 = slot3.interval or 0
	slot6 = slot3.height
	slot7 = slot3.rect or {}
	slot8 = slot3.changeText or ""
	slot9 = string.format("font/digital_%s.png", slot0.pathName)
	slot10 = {
		[string.sub(slot8, slot14, slot14)] = string.char(57 + slot14)
	}

	for slot14 = 1, string.len(slot8) do
	end

	uv11 = "isnull"

	slot11.callOrWhen(slot0.data, function (slot0)
		uv1 = "panel"
		slot1 = slot1.panel
		slot1 = slot1.removeAllChildren

		slot1(slot1)

		uv1 = "panel"
		slot1 = slot1.panel
		slot2 = tostring(slot0)
		slot0 = slot2
		uv2 = "panel"

		if slot2.isEqualDist then
			slot2 = {}

			for slot6 = 1, string.len(slot0) do
				slot10 = slot6
				uv10 = "removeAllChildren"

				table.insert(slot2, slot10[string.sub(slot0, slot6, slot10)] or slot7)
			end

			uv6 = "tostring"
			uv7 = "isEqualDist"
			uv8 = "string"

			slot1:size(cc.LabelAtlas:_create(table.concat(slot2, ""), slot6, slot7, slot8, string.byte("0")):addTo(slot1):size())
		else
			slot2 = 0

			for slot6 = 1, string.len(slot0) do
				slot8 = slot0
				uv8 = "removeAllChildren"
				slot10 = tonumber(slot7) and slot9 + 1 or string.byte(slot8[string.sub(slot8, slot6, slot6)] or slot7) - string.byte(9) + 10
				uv11 = "len"

				if not slot11[slot7] then
					uv11 = "isEqualDist"
				end

				uv13 = "isEqualDist"
				uv15 = "tostring"
				slot13 = cc.Sprite:create(slot15)
				uv17 = "isEqualDist"
				uv19 = "string"
				slot16 = 0
				slot17 = 0.5
				uv16 = "sub"
				uv17 = "string"
				slot15 = -slot2
				slot13 = slot13:setTextureRect(cc.rect((slot10 - 1) * slot17 + math.max(slot13 - slot11, 0) / 2, 0, slot11, slot19)):align(cc.p(slot16, slot17)):xy(cc.p(slot2 + slot16 / 2, slot17 / 2)):addTo(slot1):z(slot15)
				uv15 = "sub"
				slot2 = slot2 + slot11 + slot15 / 2
			end

			uv7 = "string"

			slot1:size(cc.size(slot2, slot7))
		end

		uv2 = "panel"

		if slot2.onNode then
			uv2 = "panel"

			slot2.onNode(slot1)
		end
	end)

	return slot0
end

return slot2
