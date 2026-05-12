slot0 = class("RandomTowerBuffDetailView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "random_tower_buff_detail.json"
slot0.RESOURCE_BINDING = {
	baseNode = "baseNode",
	["baseNode.bg"] = "bg",
	["baseNode.list"] = "list",
	touchPanel = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	beauty.textScroll({
		fontSize = 40,
		isRich = true,
		list = slot0.list,
		strs = "#C0x5B545B#" .. (slot1.cfg or csv.random_tower.buffs[slot1.buffId]).desc
	})

	slot3 = slot0.baseNode:size()
	slot4 = slot1.pos
	slot7 = slot0.bg:size()

	slot0.baseNode:xy(slot4.x + slot3.width / 2 + 200, math.min(math.max(slot7.height / 2, slot4.y - slot3.height / 2), display.height - slot7.height / 2))
end

return slot0
