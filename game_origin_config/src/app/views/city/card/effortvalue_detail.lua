slot0 = class("CardEffortValueDetailView", Dialog)
slot0.RESOURCE_FILENAME = "card_effortvalue_detail.json"
slot0.RESOURCE_BINDING = {
	item = "item",
	["panel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				padding = 5,
				data = bindHelper.self("advanceDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("pos")

					if slot3.effortAdvance == slot3.advance then
						slot7 = (slot3.advance <= slot3.effortAdvance and "#C0x5b545b#" or "#C0xb8af9d#") .. gLanguageCsv.effortAdvanceAttrTip .. gLanguageCsv.effortCurrentAdvance
					end

					if not string.find(slot3.addStr, "%%") then
						slot8 = slot8 .. "%"
					end

					if matchLanguage({
						"cn",
						"tw"
					}) then
						rich.createByStr(string.format(slot7, dataEasy.getRomanNumeral(slot3.advance), slot8), 40):anchorPoint(0, 0.5):addTo(slot4.pos, 6)
					else
						rich.createByStr(string.format(slot7, dataEasy.getRomanNumeral(slot3.advance), slot8), 36):anchorPoint(0, 0.5):addTo(slot4.pos, 6)
					end
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.item:hide()
	slot0.list:size(918, 770)

	slot4 = {}

	for slot8, slot9 in orderCsvPairs(gCardEffortAdvance[csv.cards[slot2].effortSeqID]) do
		if slot8 <= slot9.advanceLimit then
			table.insert(slot4, {
				advance = slot8,
				addStr = slot9.attrEffect,
				effortAdvance = slot1
			})
		end
	end

	slot0.advanceDatas = slot4

	Dialog.onCreate(slot0, {
		clickClose = true,
		noBlackLayer = true
	})
end

return slot0
