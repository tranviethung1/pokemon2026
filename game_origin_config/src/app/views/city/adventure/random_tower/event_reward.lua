slot1 = class("RandomTowerEventRewardView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "random_tower_event_reward.json"
slot1.RESOURCE_BINDING = {
	pos = "pos",
	item = "item",
	textTitle = "textTitle",
	list = {
		varname = "listview",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("eventDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("itemPanel", "textName").textName:text(csv.items[dataEasy.stringMapingID(slot3.key)].name)

					slot6 = false

					if slot3.key == "gold" then
						slot6 = dataEasy.isDoubleHuodong("randomGold")
					end

					bind.extend(slot0, slot4.itemPanel, {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key,
								num = slot3.num
							},
							isDouble = slot6
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.cb = slot1.cb
	slot2 = csv.random_tower.event[slot1.eventId]
	slot3 = dataEasy.mergeRawDate(slot1.tb.view.items or {})

	if slot1.tb.view.points then
		table.insert(slot3, {
			key = 417,
			num = slot1.tb.view.points
		})
	end

	slot4 = #slot3 > 0 and 180 or 0
	slot7 = rich.createByStr(slot2["resultDesc" .. (slot1.choiceID or 1)], 50)

	slot7:formatText()

	if slot7:size().width > 1400 then
		slot7 = rich.createWithWidth(slot6, 50, nil, 1400)
	end

	slot7:anchorPoint(cc.p(0.5, 0.5)):addTo(slot0.pos):xy(0, slot4)
	slot0.textTitle:text(slot2.name)

	slot0.eventDatas = slot3
end

function slot1.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot1
