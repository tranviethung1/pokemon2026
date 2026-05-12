slot0 = class("MimicryAddView", cc.load("mvc").ViewBase)
slot1 = {
	cc.c4b(145, 225, 177, 255),
	cc.c4b(112, 161, 227, 255),
	cc.c4b(177, 135, 254, 255),
	cc.c4b(236, 183, 42, 255)
}
slot2 = {
	"lv",
	"lan",
	"zi",
	"cheng"
}
slot3 = {
	"#C0x91FFB1#",
	"#C0x70A1E3#",
	"#C0xB187FE#",
	"#C0xECB72A#"
}
slot4 = 4
slot0.RESOURCE_FILENAME = "mimicry_addition.json"
slot0.RESOURCE_BINDING = {
	suitItem = "suitItem",
	noItem = "noItem",
	item2 = "item2",
	harm = "harm",
	itemUnlock = "itemUnlock",
	list = "list",
	noBuffItem = "noBuffItem",
	imgBg = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	["item2.title"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2, slot3)
	slot2 = slot2[slot3] or {}

	slot0.suitItem:get("icon"):scale(0.44)
	slot0.list:setScrollBarEnabled(false)

	uv4 = "suitItem"

	for slot7 = slot4, 1, -1 do
		slot8 = slot7
		slot10 = slot0.item2:clone():show()

		slot10:get("title"):text(string.format(gLanguageCsv.mimicryQuality, slot8))

		slot13 = "title"
		uv13 = "get"

		slot10:get(slot13):setTextColor(slot13[slot8])
		slot0.list:pushBackCustomItem(slot10)

		if #(slot1 or {})[slot7] ~= 0 then
			for slot14, slot15 in ipairs(slot9) do
				slot16 = slot0.suitItem:clone():show()
				slot17 = csv.mimicry.buffs[slot15.id]
				uv20 = "icon"
				slot23 = slot17.desc

				slot16:get("icon"):texture(slot17.icon1)

				uv23 = "scale"

				slot16:get("bg"):texture(string.format("city/adventure/mimicry/icon_ntdz_%s.png", slot23[slot17.quality]))
				beauty.textScroll({
					isRich = true,
					list = slot16:get("descList"),
					strs = string.format("#F44#%s%s#C0xFFFCED#   %s%s", slot20[slot8], slot17.name, gLanguageCsv.buffEffect, slot23)
				})
				slot0.list:pushBackCustomItem(slot16)
			end
		else
			slot0.list:pushBackCustomItem(slot0.noBuffItem:clone():show())
		end

		if csv.mimicry.base[1][string.format("quality%sBuffFieldNum", slot8)] > (slot2[slot8] or 0) then
			slot13 = nil

			for slot17, slot18 in orderCsvPairs(csv.mimicry.buff_field) do
				if slot8 == slot18.quality and slot18.scoresCondition > (gGameModel.mimicry:read("total_scores")[slot3] or 0) then
					slot13 = slot13 and math.min(slot18.scoresCondition, slot13) or slot18.scoresCondition
				end
			end

			if slot13 then
				slot14 = slot0.itemUnlock:clone():show()

				beauty.textScroll({
					isRich = true,
					align = "center",
					list = slot14:get("unLockList"),
					strs = string.format(gLanguageCsv.mimicryBuffUnlock2, tostring(slot13))
				})
				slot14:get("unLockList"):setItemAlignCenter()
				slot0.list:pushBackCustomItem(slot14)
			end
		end
	end

	slot0.list:adaptTouchEnabled()
end

return slot0
