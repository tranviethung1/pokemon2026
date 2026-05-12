slot0 = class("ChipRatePreview", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "chip_rate_preview.json"
slot0.RESOURCE_BINDING = {
	bgLayer = "bg",
	item = "item",
	subTitle = "subTitle",
	listLine2 = "listLine2",
	listLine = "listLine",
	list = "list",
	txtTip = "txtTip"
}
slot0.RESOURCE_STYLES = {
	clickClose = true,
	blackLayer = true,
	backGlass = true
}
slot1 = {
	{
		type = 12,
		key = "item"
	},
	{
		type = 13,
		key = "rmb"
	}
}
slot2 = {
	rarityChip2 = "city/card/chip/img_d_2.png",
	rarityChip6 = "city/card/chip/img_d_6.png",
	rarityChip5 = "city/card/chip/img_d_5.png",
	rarityChip4 = "city/card/chip/img_d_4.png",
	normalItem = "city/card/chip/img_d_1.png",
	rarityChip3 = "city/card/chip/img_d_3.png"
}
slot3 = {
	[0] = cc.c4b(255, 255, 255, 255),
	[2] = cc.c4b(145, 224, 177, 255),
	[3] = cc.c4b(139, 175, 223, 255),
	[4] = cc.c4b(203, 141, 221, 255),
	[5] = cc.c4b(235, 183, 41, 255),
	[6] = cc.c4b(243, 137, 91, 255)
}

function slot0.onCreate(slot0)
	slot0.item:visible(false)
	slot0.subTitle:visible(false)

	slot1 = slot0.list
	slot2 = slot1

	slot1.setScrollBarEnabled(slot2, false)

	uv2 = "item"

	for slot4, slot5 in pairs(slot2) do
		for slot9, slot10 in csvPairs(csv.draw_preview) do
			if slot10.type == slot5.type then
				slot0:addRateItems(slot10, slot5.key)

				break
			end
		end
	end

	slot0.txtTip:text(gLanguageCsv.chipRatePreviewTip)
end

function slot0.addRateItems(slot0, slot1, slot2)
	slot3 = slot0.subTitle:clone()

	slot3:visible(true)
	slot3:get("textTitle"):text(gLanguageCsv[slot2 .. "DrawRate"])
	adapt.oneLineCenter(slot3:get("textTitle"), slot3:get("imgLeft"), slot3:get("imgRight"), cc.p(10, 0))
	slot0.list:pushBackCustomItem(slot3)

	slot4 = nil
	slot4 = (csvSize(slot1.desc) <= 5 or slot0.listLine2:clone()) and slot0.listLine:clone()

	slot4:visible(true):setScrollBarEnabled(false)
	slot0.list:pushBackCustomItem(slot4)

	for slot8, slot9 in orderCsvPairs(slot1.desc) do
		slot10 = slot0.item:clone()

		slot10:visible(true)
		slot4:pushBackCustomItem(slot10)

		slot13 = "icon"
		uv13 = "subTitle"

		slot10:get(slot13):texture(slot13[slot9[1]])
		slot10:get("name"):text(gLanguageCsv[slot9[1]])
		text.addEffect(slot10:get("name"), {
			outline = {
				size = 2,
				color = ui.COLORS.NORMAL.BLACK
			}
		})
		slot10:get("rate"):text(slot9[2] .. "%")

		slot14 = "name"
		uv14 = "clone"

		slot10:get(slot14):setTextColor(slot14[tonumber(string.sub(slot9[1], -1)) or 0])
	end

	slot4:setItemAlignCenter()
end

return slot0
