slot1 = class("PropertySwapChooseView", Dialog)
slot2 = require("app.views.city.card.property_swap.view").SWAP_TYPE
slot1.RESOURCE_FILENAME = "card_property_swap_choose_item.json"
slot1.RESOURCE_BINDING = {
	subList = "subList",
	item = "item",
	empty = "empty",
	list = {
		varname = "cardList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				asyncPreload = 24,
				columnSize = 6,
				data = bindHelper.self("itemDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				dataOrderCmpGen = bindHelper.self("onSortCardList", true),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("icon", "name")

					bind.extend(slot0, slot4.icon, {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.key,
								num = slot3.num
							},
							onNode = function (slot0)
								slot0:setTouchEnabled(false)
							end
						}
					})
					slot4.name:text(slot3.name)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot1, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemChoose")
			}
		}
	},
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3)
	slot0.cb = slot3
	slot0.itemDatas = idlers.new()
	slot0.showTab = slot1
	slot4 = {}
	uv5 = "cb"
	slot5 = slot1 == slot5.NATURE
	uv6 = "cb"
	slot6 = slot1 == slot6.NVALUE
	uv7 = "cb"
	slot7 = slot1 == slot7.EFFORTVALUE

	for slot11, slot12 in csvPairs(csv.items) do
		if slot12.specialArgsMap.character and dataEasy.getNumByKey(slot11) > 0 then
			table.insert(slot4, {
				key = slot11,
				num = slot13,
				name = slot12.name
			})
		end
	end

	slot0.empty:setVisible(#slot4 <= 0)
	slot0.itemDatas:update(slot4)
	Dialog.onCreate(slot0)
end

function slot1.onItemChoose(slot0, slot1, slot2, slot3, slot4)
	slot0.cb(nil, slot4.key)
	slot0:onClose()
end

function slot1.onSortCardList(slot0, slot1)
	return function (slot0, slot1)
		return tonumber(slot0.key) < tonumber(slot1.key)
	end
end

return slot1
