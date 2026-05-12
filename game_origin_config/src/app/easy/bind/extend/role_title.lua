slot0 = require("easy.bind.helper")
slot1 = class("roleTitle", cc.load("mvc").ViewBase)
slot1.defaultProps = {
	isGray = false,
	data = 1
}

function slot1.showData(slot0, slot1)
	slot3 = slot0:get("_roleTitle_")

	if not slot1 or slot1 <= 0 then
		if slot3 then
			slot3:hide()
		end

		return
	end

	if not slot3 then
		slot3 = ccui.Layout:create():addTo(slot0, 1, slot2)

		ccui.ImageView:create():addTo(slot3, 2, "titleImgBg")
		ccui.ImageView:create():addTo(slot3, 3, "titleImg")
		label.create("", {
			fontPath = "font/youmi1.ttf",
			fontSize = 33,
			anchorPoint = cc.p(0.5, 0.5),
			effect = {
				outline = {
					color = cc.c4b(202, 126, 25, 255)
				}
			}
		}):addTo(slot3, 3, "titleTxt")
	end

	slot3:show()

	slot4 = gTitleCsv[slot1]
	slot5 = slot4.res
	slot6 = slot4.resBg
	slot7 = slot4.title
	slot8 = slot4.showType

	slot3:get("titleTxt"):hide()
	slot3:get("titleImg"):hide()
	slot3:get("titleImgBg"):hide()

	if slot3:get("spine") then
		slot3:get("spine"):removeFromParent()
	end

	if slot8 == "pic" then
		slot9:texture(slot5):show()

		slot12 = nil

		if slot6 then
			slot10:texture(slot6):show()

			slot12 = slot10:size()
		else
			slot12 = slot9:size()
		end

		slot3:size(slot12)
		slot10:alignCenter(slot12)
		slot9:alignCenter(slot12)
		slot9:y(slot10:y() - 10)
		cache.setShader(slot9, false, slot0.isGray and "hsl_gray" or "normal")
		cache.setShader(slot10, false, slot0.isGray and "hsl_gray" or "normal")
	elseif slot8 == "txt" then
		slot11:text(slot7):show()
		slot10:texture(slot6):show()
		text.deleteAllEffect(slot11)

		slot12 = slot10:size()

		slot3:size(slot12)
		slot10:alignCenter(slot12)
		slot11:alignCenter(slot12)
		slot11:y(slot10:y() - 11)
		cache.setShader(slot10, false, slot0.isGray and "hsl_gray" or "normal")

		if slot0.isGray then
			text.addEffect(slot11, {
				outline = {
					size = 4,
					color = cc.c4b(99, 97, 97, 255)
				},
				color = cc.c4b(235, 235, 235, 255)
			})
		else
			text.addEffect(slot11, {
				outline = {
					size = 4,
					color = cc.c4b(slot4.color[1], slot4.color[2], slot4.color[3], 255)
				}
			})
		end
	elseif slot8 == "spine" then
		slot12 = widget.addAnimationByKey(slot3, slot4.res, "spine", "effect_loop", 1)
		slot13 = cc.size(slot4.spineSize[1], slot4.spineSize[2])

		slot12:alignCenter(slot13)
		slot3:size(slot13)
		cache.setShader(slot12, false, slot0.isGray and "hsl_gray" or "normal")

		if slot0.isGray then
			slot12:setTimeScale(0)
		end
	end

	slot3:alignCenter(slot0:size())

	if slot0.onNode then
		slot0.onNode(slot3)
	end
end

function slot1.initExtend(slot0)
	uv1 = "callOrWhen"

	slot1.callOrWhen(slot0.data, functools.partial(slot0.showData, slot0))

	return slot0
end

return slot1
