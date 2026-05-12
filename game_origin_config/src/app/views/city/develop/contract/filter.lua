slot1 = class("ContractFilterView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.develop.contract.tools")
slot1.RESOURCE_FILENAME = "contract_filter.json"
slot1.RESOURCE_BINDING = {
	["window.bg"] = "bg",
	subList = "subList",
	item = "item",
	window = "window",
	["window.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("datas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(string.format("city/develop/contract/log_type%s.png", slot3.idx))
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	},
	closePanel = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("closeWithoutSelect")
			}
		}
	},
	["window.btnAll"] = {
		varname = "btnAll",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("clickAll")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3)
	slot0.cb = slot3
	slot2 = slot2 or {
		"left",
		"top"
	}
	slot0.datas = {}
	uv5 = "cb"

	for slot7 = 1, slot5.TYPE_NUM do
		table.insert(slot0.datas, {
			idx = slot7
		})
	end

	slot4 = math.ceil(itertools.size(slot0.datas) / 2)
	slot5 = slot4 * slot0.item:height() + slot0.list:getItemsMargin() * (slot4 - 1) - slot0.list:height()

	setContentSizeOfAnchor(slot0.window, cc.size(slot0.window:width(), slot0.window:height() + slot5))
	slot0.bg:height(slot0.bg:height() + slot5)
	slot0.list:height(slot0.list:height() + slot5):y(slot0.list:y() - slot5 / 2)
	slot0.btnAll:y(slot0.btnAll:y() - slot5 / 2)

	slot6 = slot0.window:size()
	slot7 = {
		left = slot6.width / 2,
		right = -slot6.width / 2
	}
	slot8 = {
		top = -slot6.height / 2,
		bottom = slot6.height / 2
	}
	slot9 = 0
	slot10 = 0

	for slot14, slot15 in pairs(slot2) do
		if slot7[slot15] then
			slot9 = slot7[slot15]
		end

		if slot8[slot15] then
			slot10 = slot8[slot15]
		end
	end

	slot0.window:xy(slot1.x + slot9, slot1.y + slot10)
end

function slot1.closeWithoutSelect(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

function slot1.clickAll(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, functools.partial(slot0.cb, 0))

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

function slot1.onItemClick(slot0, slot1, slot2, slot3)
	slot4 = slot0.addCallbackOnExit

	slot4(slot0, functools.partial(slot0.cb, slot3.idx))

	uv4 = "addCallbackOnExit"

	slot4.onClose(slot0)
end

return slot1
