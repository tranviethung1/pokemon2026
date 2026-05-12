slot0 = class("ContestBetDetailView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "contest_bet_detail.json"
slot0.RESOURCE_BINDING = {
	["baseNode.item"] = "item",
	baseNode = "baseNode",
	["baseNode.name"] = "teamName",
	["baseNode.list1"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("teamData1"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = csv.cross.contestbet.cards[slot3]
					slot6 = csv.unit[csv.cards[slot4.cardID].unitID]

					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							cardId = slot4.cardID,
							star = slot4.star,
							rarity = slot4.rarity,
							onNode = function (slot0)
								slot0:scale(0.9)
								slot0:x(0)
							end
						}
					})
				end
			}
		}
	},
	["baseNode.list2"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("teamData2"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = csv.cross.contestbet.cards[slot3]
					slot6 = csv.unit[csv.cards[slot4.cardID].unitID]

					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							cardId = slot4.cardID,
							star = slot4.star,
							rarity = slot4.rarity,
							onNode = function (slot0)
								slot0:scale(0.9)
							end
						}
					})
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot2 = csv.cross.contestbet.teams[slot1.csv_id]

	slot0.teamName:text(slot2.name)

	slot3 = {}
	slot4 = {}

	for slot8, slot9 in ipairs(slot2.team) do
		if slot8 <= 3 then
			table.insert(slot4, slot9)
		else
			table.insert(slot3, slot9)
		end
	end

	slot0.teamData1 = idlers.newWithMap(slot3)
	slot0.teamData2 = idlers.newWithMap(slot4)
end

return slot0
