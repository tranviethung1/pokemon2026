slot0 = require("easy.bind.helper")
slot1 = class("fishToolsIcon", cc.load("mvc").ViewBase)
slot1.defaultProps = {}

function slot1.initExtend(slot0)
	slot0:initModel()

	if slot0.panel then
		slot0.panel:removeFromParent()
	end

	slot1 = ccui.Layout:create():size(145, 145):addTo(slot0, 1, "_equip_")
	slot0.panel = slot1
	slot2 = slot1:size()
	slot3 = ccui.ImageView:create():align(cc.p(0.5, 0.5), 100, 100):addTo(slot1, 1)
	slot4 = ccui.ImageView:create():align(cc.p(0.5, 0.5), 100, 100):scale(2):addTo(slot1, 2, "icon")

	if not slot1:get("num") then
		text.addEffect(cc.Label:createWithTTF("", ui.FONT_PATH, 40):align(cc.p(1, 0), 170, 20):addTo(slot1, 2, "num"), {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
	end

	uv6 = "initModel"

	slot6.callOrWhen(slot0.data, function (slot0)
		if slot0.typ == 1 then
			slot2 = slot0.key
			slot1 = csv.items[slot2]
			uv2 = "typ"
			slot2 = slot2.texture

			slot2(slot2, ui.QUALITY_BOX[slot1.quality])

			uv2 = "csv"

			slot2:texture(slot1.icon)
		elseif slot0.typ == 2 then
			slot2 = slot0.key
			slot1 = csv.items[slot2]
			uv2 = "typ"
			slot2 = slot2.texture

			slot2(slot2, ui.QUALITY_BOX[slot1.quality])

			uv2 = "csv"

			slot2:texture(slot1.icon)
		elseif slot0.typ == 3 then
			slot3 = 1.2
			uv3 = "items"
			slot1 = ccui.ImageView:create("common/box/box_portrait.png"):align(cc.p(0.5, 0.5), 100, 100):scale(slot3):addTo(slot3, 1)
			slot5 = 1.8
			uv5 = "items"
			slot3 = ccui.ImageView:create(csv.unit[slot0.key].icon):align(cc.p(0.5, 0.5), 100, 100):scale(slot5):addTo(slot5, 2, "icon")
		end

		uv1 = "key"

		if slot1.lock then
			if slot0.typ == 1 or slot0.typ == 2 then
				uv2 = "key"

				function slot3(slot0, slot1)
					uv2 = "needLv"

					if slot1 < slot2.needLv then
						uv2 = "setLock"
						uv4 = "typ"
						uv5 = "needLv"

						slot2:setLock(slot4, slot5.typ)
					end
				end

				uv3 = "key"

				idlereasy.when(slot2.fishLevel, slot3):anonyOnly(slot3, "lock")
			elseif slot0.typ == 3 and slot0.lock == nil then
				uv1 = "key"
				uv3 = "items"

				slot1:setLock(slot3, slot0.typ)
			end
		end

		uv1 = "items"

		if not slot1:get("num") then
			slot4 = cc.p(1, 0)
			uv4 = "items"
			slot1 = cc.Label:createWithTTF("", ui.FONT_PATH, 40):align(slot4, 170, 10):addTo(slot4, 2, "num")
		end

		uv2 = "key"

		if slot2.num and slot0.typ == 2 then
			if slot0.lock ~= nil then
				slot1:text(slot0.lock)
			else
				slot1:text(0)
			end

			text.addEffect(slot1, {
				outline = {
					color = ui.COLORS.QUALITY_OUTLINE[csv.items[slot0.key].quality]
				}
			})
		end

		uv2 = "key"

		if not slot2.noListener then
			uv3 = "key"
			uv4 = "items"

			bind.click(slot3, slot4, {
				method = function ()
				end
			})
		end
	end)

	if slot0.onNode then
		slot0.onNode(slot1)
	end

	return slot0
end

function slot1.setLock(slot0, slot1, slot2)
	slot3 = slot1:size()
	slot4 = "common/box/box_mask2.png"
	slot5 = 1

	if slot2 == 3 then
		slot4 = "common/box/mask_portrait.png"
		slot5 = 1.2
	end

	ccui.ImageView:create(slot4):align(cc.p(0.5, 0.5), 100, 100):scale(slot5):addTo(slot1, 4, "lock")

	slot6 = ccui.ImageView:create("common/btn/btn_bs.png"):align(cc.p(0.5, 0.5), 100, 100)
	slot6 = slot6.addTo

	slot6(slot6, slot1, 5, "lock")

	uv6 = "size"

	slot6.callOrWhen(slot0.lock, function (slot0)
		uv1 = "panel"

		slot1.panel:get("lock"):visible(slot0)
	end)
end

function slot1.initModel(slot0)
	slot0.fishLevel = gGameModel.fishing:getIdler("level")
end

return slot1
