slot0 = class("QualityIndexView", Dialog)
slot0.RESOURCE_FILENAME = "gem_index.json"
slot0.RESOURCE_BINDING = {
	item = "item",
	index = "index",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("qualityDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("name"):text(slot3.name)
					slot1:get("name"):x(0)

					slot5 = rich.createWithWidth(slot3.txt, 40, nil, slot0:width() - slot1:get("name"):width()):anchorPoint(0, 1)

					slot5:xy(slot1:get("name"):x() + slot1:get("name"):width(), slot5:height()):addTo(slot1):z(2)
					slot1:height(slot5:height())
					slot1:get("name"):y(slot1:height())
					text.addEffect(slot1:get("name"), {
						color = slot3.selfct and cc.c4b(91, 84, 91, 255) or cc.c4b(183, 176, 158, 255)
					})
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.list:y(348):height(622):setItemsMargin(13)
	slot0.index:text(slot2 or 0)

	slot6 = {}
	slot0.qualityDatas = idlers.new({})
	slot7 = "#C0x5B545B#"
	slot8 = "#C0x60c456#"
	slot9 = true

	for slot13, slot14 in orderCsvPairs(csv.gem.quality_attrs) do
		if csv.cards[gGameModel.cards:find(slot1):read("card_id")].gemQualitySeqID == slot14.gemQualitySeqID then
			if slot3 < slot14.qualityNum then
				slot7 = "#C0xB7B09E#"
				slot8 = "#C0xB7B09E#"
				slot9 = false
			else
				slot9 = true
			end

			slot15 = string.format(gLanguageCsv.indexNumEffect, slot14.qualityNum)
			slot16 = ""
			slot17 = {}

			for slot21 = 1, math.huge do
				if slot14["attrType" .. slot21] and slot14["attrType" .. slot21] ~= 0 then
					slot23 = gLanguageCsv.card .. slot7 .. gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot14["attrType" .. slot21]])]

					if matchLanguage({
						"en"
					}) then
						slot23 = slot7 .. gLanguageCsv["attr" .. string.caption(slot22)]
					end

					slot16 = slot21 >= 2 and slot16 .. ", " .. slot23 .. slot8 .. "+" .. dataEasy.getAttrValueString(slot14["attrType" .. slot21], slot14["attrNum" .. slot21]) .. slot8 .. slot7 or slot16 .. ", " .. slot23 .. slot8 .. "+" .. dataEasy.getAttrValueString(slot14["attrType" .. slot21], slot14["attrNum" .. slot21]) .. slot8 .. slot7 .. slot23 .. slot8 .. "+" .. dataEasy.getAttrValueString(slot14["attrType" .. slot21], slot14["attrNum" .. slot21]) .. slot8 .. slot7
					slot17[slot21] = dataEasy.getAttrValueString(slot14["attrType" .. slot21], slot14["attrNum" .. slot21])
				else
					break
				end
			end

			slot18 = slot17[1]
			slot19 = true

			if #slot17 == 6 then
				for slot23, slot24 in pairs(slot17) do
					if slot24 ~= slot18 then
						slot19 = false
					end
				end

				if slot19 then
					slot16 = gLanguageCsv.card .. gLanguageCsv.basicAttribute .. slot8 .. "+" .. slot18

					if matchLanguage({
						"en"
					}) then
						slot16 = gLanguageCsv.basicAttribute .. slot8 .. "+" .. slot18
					end
				end
			end

			table.insert(slot6, {
				name = slot15,
				txt = slot7 .. slot16,
				selfct = slot9
			})
		end
	end

	slot0.qualityDatas:update(slot6)
	slot0.item:visible(false)
	Dialog.onCreate(slot0)
end

return slot0
