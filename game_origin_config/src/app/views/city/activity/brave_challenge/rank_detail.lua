slot0 = 40
slot1 = 50
slot2 = class("BraveChallengeRankDetailView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "activity_brave_challenge_rank_detail.json"
slot2.RESOURCE_BINDING = {
	baseNode = "baseNode",
	["baseNode.title1.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = cc.c4b(212, 86, 95, 255)
				}
			}
		}
	},
	["baseNode.title2.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = cc.c4b(212, 86, 95, 255)
				}
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0.baseNode:get("list1"):setScrollBarEnabled(false)
	slot0.baseNode:get("list2"):setScrollBarEnabled(false)

	slot2 = slot0.baseNode:get("item")

	function slot3(slot0, slot1, slot2)
		slot0:removeAllChildren()

		for slot6 = slot1, slot2 do
			uv7 = "removeAllChildren"
			slot8 = slot0.pushBackCustomItem

			slot8(slot0, slot7:clone())

			uv8 = "clone"

			if slot8.brave_challenge_rank_info.deployments[slot6] ~= 0 then
				slot7:get("icon"):texture(csv.unit[csv.cards[csv.brave_challenge.cards[slot8].cardID].unitID].iconSimple)
				slot7:show()
			else
				slot7:get("icon"):hide()
			end
		end
	end

	slot3(slot0.baseNode:get("list1"), 1, 3)
	slot3(slot0.baseNode:get("list2"), 4, 6)
end

return slot2
