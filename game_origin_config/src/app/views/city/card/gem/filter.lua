slot1 = class("GemFilterView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "gem_filter.json"
slot1.RESOURCE_BINDING = {
	window = "window",
	subList = "subList",
	item = "item",
	["window.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 4,
				data = bindHelper.self("showData"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(slot3.icon)

					if slot3.selected then
						ccui.ImageView:create("common/box/box_selected.png"):alignCenter(slot1:size()):addTo(slot1, -1):scale(0.6):y(94)
					end

					slot1:get("name"):text(gLanguageCsv["gemSuit" .. slot3.typeIdx])
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot2, slot3)
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
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("clickAll")
			}
		}
	}
}

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

function slot1.onItemClick(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.addCallbackOnExit

	slot5(slot0, functools.partial(slot0.cb, slot4.typeIdx))

	uv5 = "addCallbackOnExit"

	slot5.onClose(slot0)
end

function slot1.onCreate(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.window:size()
	slot6 = {
		left = slot5.width / 2,
		right = -slot5.width / 2
	}
	slot7 = {
		top = -slot5.height / 2,
		bottom = slot5.height / 2
	}
	slot8 = 0
	slot9 = 0

	for slot13, slot14 in pairs(slot2 or {}) do
		if slot6[slot14] then
			slot8 = slot6[slot14]
		end

		if slot7[slot14] then
			slot9 = slot7[slot14]
		end
	end

	slot0.window:xy(slot1.x + slot8, slot1.y + slot9)

	slot0.showData = idlers.new()
	slot10 = {}

	for slot14 = 1, 9 do
		table.insert(slot10, {
			icon = ui.GEM_SUIT_ICON[slot14],
			typeIdx = slot14,
			selected = slot14 == slot4
		})
	end

	slot0.cb = slot3

	slot0.list:setClippingEnabled(false)
	slot0.showData:update(slot10)
end

return slot1
