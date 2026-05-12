slot0 = require("easy.bind.helper")
slot1 = class("cardLevel", cc.load("mvc").ViewBase)
slot1.defaultProps = {}

function slot1.initExtend(slot0)
	slot3 = matchLanguage({
		"cn"
	})

	if not ccui.Layout:create():size(150, 60):align(cc.p(0, 1)):addTo(slot0):get("txtLv") then
		text.addEffect(cc.Label:createWithTTF(gLanguageCsv.textLv1, ui.FONT_PATH, slot3 and 30 or 24):align(cc.p(1, 0), slot3 and 90 or 75, 55):addTo(slot1, 2, "txtLv"), {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
	end

	if not slot1:get("txtLvNum") then
		text.addEffect(cc.Label:createWithTTF("", ui.FONT_PATH, 30):align(cc.p(1, 0), slot3 and 75 or 90, 55):addTo(slot1, 2, "txtLvNum"), {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
	end

	uv5 = "ccui"

	slot5.callOrWhen(slot0.data, function (slot0)
		if not slot0 then
			uv1 = "hide"

			slot1:hide()

			return
		end

		uv1 = "hide"
		slot1 = slot1.show

		slot1(slot1)

		uv1 = "hide"
		slot1 = slot1:get("txtLvNum"):show()
		slot1 = slot1.text

		slot1(slot1, slot0)

		uv1 = "show"

		if slot1 then
			uv2 = "get"
			uv3 = "txtLvNum"
			uv6 = "get"
			slot7 = slot6
			uv7 = "txtLvNum"

			adapt.oneLinePos(slot2, slot3, cc.p(5, slot6.y(slot7) - slot7:y()), "right")
		else
			uv2 = "txtLvNum"
			uv3 = "get"

			adapt.oneLinePos(slot2, slot3, cc.p(5, 0), "right")
		end
	end)

	if slot0.onNode then
		slot0.onNode(slot1)
	end

	return slot0
end

return slot1
