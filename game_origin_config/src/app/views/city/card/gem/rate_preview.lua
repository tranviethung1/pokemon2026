slot0 = class("GemRatePreview", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "gem_rate_preview.json"
slot0.RESOURCE_BINDING = {
	listLine2 = "listLine2",
	subTitle = "subTitle",
	item = "item",
	bgLayer = "bg",
	listLine = "listLine",
	list = "list"
}
slot1 = {
	{
		key = "gold",
		type = 9
	},
	{
		key = "rmb",
		type = 10
	}
}
slot2 = {
	rarityGem5 = "city/card/gem/img_yellow.png",
	rarityGem4 = "city/card/gem/img_purple.png",
	rarityGem3 = "city/card/gem/img_blue.png",
	normalItem = "city/card/gem/img_hs.png",
	rarityGem2 = "city/card/gem/img_green.png",
	rarityGem6 = "city/card/gem/img_red.png"
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
	slot5 = "effect_loop"
	slot3 = slot0.bg
	slot4 = slot3

	widget.addAnimationByKey(slot0.bg, "fushichouqu/ryl.skel", "effectBg", slot5, -1):alignCenter(slot3.size(slot4))
	slot0.bg:scale(2)
	slot0.item:visible(false)
	slot0.subTitle:visible(false)

	slot1 = slot0.list
	slot2 = slot1

	slot1.setScrollBarEnabled(slot2, false)

	uv2 = "widget"

	for slot4, slot5 in pairs(slot2) do
		for slot9, slot10 in csvPairs(csv.draw_preview) do
			if slot10.type == slot5.type then
				slot0:addRateItems(slot10, slot5.key)

				break
			end
		end
	end
end

slot0.RESOURCE_STYLES = {
	full = true
}

function slot0.addRateItems(slot0, slot1, slot2)
	slot3 = slot0.subTitle:clone()

	slot3:visible(true)
	slot3:get("textTitle"):text(gLanguageCsv[slot2 .. "DrawRate"])
	slot0.list:pushBackCustomItem(slot3)

	slot4 = nil
	slot4 = (csvSize(slot1.desc) <= 5 or slot0.listLine2:clone()) and slot0.listLine:clone()

	slot4:visible(true):setScrollBarEnabled(false)
	slot0.list:pushBackCustomItem(slot4)

	for slot9, slot10 in orderCsvPairs(slot1.desc) do
		slot11 = slot0.item:clone()

		slot11:visible(true)
		slot4:pushBackCustomItem(slot11)

		slot14 = "icon"
		uv14 = "subTitle"

		slot11:get(slot14):texture(slot14[slot10[1]])
		slot11:get("name"):text(gLanguageCsv[slot10[1]])
		text.addEffect(slot11:get("name"), {
			outline = {
				size = 2,
				color = ui.COLORS.NORMAL.BLACK
			}
		})
		slot11:get("rate"):text(slot10[2] .. "%")

		slot15 = "name"
		uv15 = "clone"

		slot11:get(slot15):setTextColor(slot15[tonumber(string.sub(slot10[1], -1)) or 0])
	end

	slot4:setItemAlignCenter()
end

return slot0
