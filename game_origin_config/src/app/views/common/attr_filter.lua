function slot0(slot0)
	if not slot0 then
		return clone(ui.ATTR_ICON)
	end

	return ui.ATTR_ICON[slot0]
end

slot1 = class("AttrFilterView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "common_attr_filter.json"
slot1.RESOURCE_BINDING = {
	subList = "subList",
	item = "item",
	btnReset = {
		varname = "btnReset",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShowAttrPanel")
			}
		}
	},
	btnOK = {
		varname = "btnOK",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSpecialClose")
			}
		}
	},
	list = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				asyncPreload = 24,
				columnSize = 6,
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:show()

					slot4 = slot0:getIdx(slot2)
					slot7 = "bg"
					uv7 = "show"

					slot1:get(slot7):texture(slot7(slot4.k))
					slot1:get("name"):text(gLanguageCsv[game.NATURE_TABLE[slot4.k]])
					slot1:get("select"):visible(slot3.state == true)
					slot1:onClick(functools.partial(slot0.itemClick, slot4, slot3))
				end
			},
			handlers = {
				itemClick = bindHelper.self("onAttrItemClick")
			}
		}
	},
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSpecialClose")
			}
		}
	},
	closeBtn = {
		varname = "closeBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSpecialClose")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.item:hide()

	slot2 = slot1.btnColse and true or false
	slot0.isMultiSelect = slot1.isMultiSelect

	slot0.btnOK:visible(not slot2)
	slot0.btnReset:visible(not slot2)
	slot0.closeBtn:visible(slot2)

	slot0.isShow = slot1.panelState()

	if slot0.isMultiSelect then
		slot0.selectData = slot1.selectDatas()
		slot0.attrDatas = slot0.selectData
	else
		slot0.selectData = slot1.selectDatas()
		uv4 = "item"
		slot0.attrDatas = arraytools.map(slot4(), function (slot0, slot1)
			return {
				icon = slot1
			}
		end)
	end
end

function slot1.onSpecialClose(slot0)
	slot0.isShow:set(false)
end

function slot1.onAttrItemClick(slot0, slot1, slot2, slot3)
	if slot0.isMultiSelect then
		slot0.attrDatas:atproxy(slot2.k).state = not slot0.attrDatas:atproxy(slot2.k).state
	else
		slot0.selectData:set(slot2.k, true)
		slot0:onSpecialClose()
	end
end

function slot1.onShowAttrPanel(slot0)
	if slot0.isMultiSelect then
		slot1 = {}

		for slot5 = 1, #ui.ATTR_ICON do
			table.insert(slot1, {
				state = false
			})
		end

		slot0.attrDatas:update(slot1)
	else
		slot0.selectData:set(#ui.ATTR_ICON + 1, true)
		slot0:onSpecialClose()
	end
end

return slot1
