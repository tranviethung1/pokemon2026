slot1 = class("AutoChessHandbookAwardPreviewView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.adventure.auto_chess.tools")
slot1.RESOURCE_FILENAME = "auto_chess_handbook_award_preview.json"
slot1.RESOURCE_BINDING = {
	panel = "panel",
	["panel.item"] = "item",
	["panel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("awardData"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(dataEasy.getIconResByKey(slot2))
					slot1:get("num"):text(slot3)
				end
			}
		}
	},
	closePanel = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot2 = {}
	slot0.awardData = slot2
	uv2 = "awardData"
	slot2, slot3, slot4 = slot2.getCardType(slot1.cardID)
	slot6 = csv.auto_chess.handbook_award[slot4.rarity]
	slot7 = {}
	slot8 = slot1.star

	if slot1.cardType ~= 1 then
		slot8 = 4
	end

	slot12 = "_award"

	for slot12, slot13 in csvMapPairs(slot6["star" .. slot8 .. slot12]) do
		slot7[slot12] = slot13
	end

	slot0.awardData = slot7
	slot9 = 500

	if slot1.cardType == 1 then
		slot0.panel:x(slot0.panel:x() + (slot8 == 1 and 0 or slot8 == 2 and 700 or 1400))
	else
		slot0.panel:x(slot0.panel:x() + 910)
	end
end

function slot1.onClose(slot0)
	uv1 = "onClose"

	slot1.onClose(slot0)
end

return slot1
