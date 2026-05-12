slot0 = class("FishDetailView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "common_fish_detail.json"
slot0.RESOURCE_BINDING = {
	["baseNode.lockPanel.lock1"] = "lock1",
	["baseNode.lockPanel.lock2"] = "lock2",
	["baseNode.lockPanel"] = "lockPanel",
	baseNode = "baseNode",
	["baseNode.list"] = "list",
	["baseNode.lockPanel.numlock"] = "numlock",
	["baseNode.content"] = "contentLabel",
	["baseNode.name"] = "nodeName",
	["baseNode.icon"] = {
		binds = {
			event = "extend",
			class = "fish_icon",
			props = {
				data = bindHelper.self("data"),
				onNode = function (slot0)
					slot0:alignCenter(slot0:size())
					slot0:scale(1.2)
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0:initModel()

	slot2 = slot1.key
	slot0.data = {
		key = slot2
	}
	slot3 = csv.fishing.fish[slot2]

	slot0.nodeName:text(slot3.name)
	text.addEffect(slot0.nodeName, {
		color = ui.COLORS.QUALITY[slot3.rare + 2]
	}, {
		outline = {
			color = ui.COLORS.QUALITY_OUTLINE[slot3.rare + 2]
		}
	})

	if slot0.fishLevel:read() < slot3.needLv then
		slot0.lockPanel:show()
		slot0.numlock:text(slot3.needLv)
		adapt.oneLinePos(slot0.lock1, {
			slot0.numlock,
			slot0.lock2
		}, cc.p(0, 0), "left")
	end

	beauty.textScroll({
		isRich = true,
		list = slot0.list,
		strs = "#C0x5B545B#" .. slot3.desc,
		fontSize = matchLanguage({
			"tw"
		}) and 38 or 40
	})
end

function slot0.initModel(slot0)
	slot0.fishLevel = gGameModel.fishing:getIdler("level")
end

return slot0
