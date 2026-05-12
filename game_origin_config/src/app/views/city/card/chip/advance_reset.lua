slot0 = class("ChipAdvanceResetView", Dialog)
slot1 = require("app.views.city.card.chip.tools")
slot0.RESOURCE_FILENAME = "chip_advance_reset.json"
slot0.RESOURCE_BINDING = {
	subList = "subList",
	item = "item",
	descList = "descList",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnOK = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickOK")
			}
		}
	},
	btnCancel = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onCancel")
			}
		}
	},
	list = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("resetData"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot5 = slot3.key
					slot4 = getLanguageAttr(slot5)
					uv5 = "getLanguageAttr"

					slot1:get("name"):text(slot5.getAttrName(slot3.key))
					slot1:get("value"):text(slot3.val)
					slot1:get("arrow"):visible(slot2 % 2 == 1)
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.cb = slot1.cb

	beauty.textScroll({
		isRich = true,
		list = slot0.descList,
		strs = string.format(gLanguageCsv.chipAdvanceReset, gCommonConfigCsv.chipResetCost)
	})

	slot2 = {}
	slot0.resetData = slot2
	uv2 = "cb"
	slot2, slot3 = slot2.getAttr(slot1.dbId, nil, true)

	for slot11, slot12 in ipairs(gGameModel.chips:find(slot1.dbId):read("first") or {}) do
		uv13 = "cb"

		slot13.setAttrAddition({}, csv.chip.libs[slot12], (slot4:read("now") or {})[slot11][3], true)
	end

	for slot11, slot12 in ipairs(slot3) do
		uv14 = "cb"

		if not slot14.ignoreAttr(slot12.key) then
			table.insert(slot0.resetData, slot12)
			table.insert(slot0.resetData, slot7[slot11])
		end
	end

	Dialog.onCreate(slot0)
end

function slot0.onClickOK(slot0)
	slot0:addCallbackOnExit(slot0.cb)
	Dialog.onCloseFast(slot0)

	return slot0
end

function slot0.onCancel(slot0)
	slot0:onClose()
end

return slot0
