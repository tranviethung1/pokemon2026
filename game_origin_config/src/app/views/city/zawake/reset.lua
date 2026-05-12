slot0 = require("app.views.city.zawake.tools")
slot1 = cc.load("mvc").ViewBase
slot2 = class("ZawakeResetView", Dialog)
slot2.RESOURCE_FILENAME = "zawake_reset.json"
slot2.RESOURCE_BINDING = {
	innerList = "innerList",
	["costPanel.cost"] = "cost",
	item = "item",
	costPanel = "costPanel",
	["costPanel.icon"] = "icon",
	["costPanel.txt1"] = "txt1",
	btnReset = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onResetClick")
			}
		}
	},
	titile = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 8,
					color = cc.c4b(251, 110, 70, 255)
				}
			}
		}
	},
	tip = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	list = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 8,
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key,
								num = slot3.val
							}
						}
					})
				end
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	Dialog.onCreate(slot0)

	slot0.zawakeID = slot1
	slot2 = gGameModel.role
	slot3 = slot2
	uv3 = "Dialog"
	slot3 = slot3.getResetCostItems(slot1, slot2.read(slot3, "zawake")[slot1])
	slot0.costDatas = slot3
	slot4 = {}

	for slot8, slot9 in pairs(slot3) do
		table.insert(slot4, {
			key = slot8,
			val = slot9
		})
	end

	slot0.attrDatas = idlers.newWithMap(slot4)

	slot0.cost:text(gCommonConfigCsv.zawakeResetOneKeyCost)

	slot5 = slot0.costPanel:size()

	adapt.oneLineCenterPos(cc.p(slot5.width / 2, slot5.height / 2), {
		slot0.txt1,
		slot0.cost,
		slot0.icon
	}, {
		cc.p(0, 0),
		cc.p(10, 0)
	})
end

function slot2.onResetClick(slot0)
	if gGameModel.role:read("rmb") < gCommonConfigCsv.zawakeResetOneKeyCost then
		uiEasy.showDialog("rmb")

		return
	end

	gGameUI:showDialog({
		isRich = true,
		btnType = 2,
		content = string.format(gLanguageCsv.zawakeResetDialagTips, gCommonConfigCsv.zawakeResetOneKeyCost),
		cb = function ()
			uv0 = "sendReset"

			slot0:sendReset()
		end,
		dialogParams = {
			clickClose = false
		}
	})
end

function slot2.sendReset(slot0)
	gGameApp:requestServer("/game/card/zawake/reset", function (slot0)
		uv3 = "gGameUI"

		gGameUI:showGainDisplay(slot3.costDatas, {
			cb = function ()
				uv0 = "onClose"

				slot0:onClose()
			end
		})
	end, slot0.zawakeID)
end

return slot2
