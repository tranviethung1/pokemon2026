slot0 = require("easy.bind.helper")
slot1 = class("roleFigure", cc.load("mvc").ViewBase)
slot1.defaultProps = {}

function slot1.initExtend(slot0)
	slot1 = ccui.ImageView:create():alignCenter(slot0:size()):addTo(slot0, 10, "figure")
	slot2 = slot1
	uv2 = "ccui"

	slot2.callOrWhen(slot0.data, function (slot0)
		slot1 = gRoleFigureCsv[slot0]
		uv2 = "gRoleFigureCsv"
		slot2 = slot2.removeChildByName

		slot2(slot2, "spine")

		uv2 = "gRoleFigureCsv"

		if slot2.spine and slot1 and slot1.resSpine ~= "" then
			uv2 = "removeChildByName"
			slot3 = slot2

			slot2.visible(slot3, false)

			uv3 = "gRoleFigureCsv"
			slot4 = slot1.resSpine
			slot2 = widget.addAnimationByKey(slot3, slot4, "spine", "standby_loop1")
			slot3 = slot2
			uv4 = "gRoleFigureCsv"
			uv3 = "gRoleFigureCsv"

			if slot3.onSpine then
				uv3 = "gRoleFigureCsv"

				slot3.onSpine(slot2.xy(slot3, slot4:size().width / 2, 0))
			end
		else
			uv2 = "removeChildByName"
			slot2 = slot2.texture

			slot2(slot2, dataEasy.getRoleFigureIcon(slot0))

			uv2 = "removeChildByName"

			slot2:visible(true)
		end
	end)

	if slot0.onNode then
		slot0.onNode(slot1.visible(slot2, false))
	end

	return slot0
end

return slot1
