slot0 = cc.load("mvc").ViewBase
slot1 = class("ShopAutoSellView", Dialog)
slot1.RESOURCE_FILENAME = "shop_sell.json"
slot1.RESOURCE_BINDING = {
	["cost.imgIcon"] = "imgIcon",
	item = "item",
	maskPanel = "maskPanel",
	["cost.textCost"] = "textCost",
	["cost.textNote"] = "textNote",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnSell = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onCell")
			}
		}
	},
	["btnSell.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("itemDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1:get("panel"), {
						class = "icon_key",
						props = {
							data = {
								key = slot3.id,
								num = slot3.num
							}
						}
					})
					text.addEffect(beauty.singleTextLimitWord(dataEasy.getCfgByKey(slot3.id).name, {
						fontSize = 40
					}, {
						width = 240
					}):xy(125, 26):addTo(slot1, 2), {
						color = ui.COLORS.NORMAL.DEFAULT
					})
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.itemDatas = slot1
	slot0.cb = slot2
	slot0.reward = {}

	for slot7, slot8 in ipairs(slot0.itemDatas) do
		slot3 = 0 + dataEasy.getCfgByKey(slot8.id).sellPrice * slot8.num
	end

	slot0.textCost:text(mathEasy.getShortNumber(slot3, 2))
	table.insert(slot0.reward, {
		"gold",
		slot3
	})
	adapt.oneLineCenterPos(cc.p(200, 30), {
		slot0.textNote,
		slot0.textCost,
		slot0.imgIcon
	}, cc.p(6, 0))

	if #slot0.itemDatas < 5 then
		slot5, slot6 = slot0.list:xy()
		slot7 = slot0.list:size()

		slot0.list:size(slot0.item:size().width * slot4 + (slot4 - 1) * slot0.list:getItemsMargin(), slot7.height)
		slot0.list:anchorPoint(0.5, 0.5)
		slot0.list:xy(display.sizeInView.width / 2, slot6 + slot7.height / 2)
	else
		uiEasy.setBottomMask(slot0.list, slot0.maskPanel, "x")
	end

	Dialog.onCreate(slot0)
end

function slot1.onCell(slot0)
	for slot5, slot6 in ipairs(slot0.itemDatas) do
		-- Nothing
	end

	slot2 = slot0.reward
	slot3 = slot0.addCallbackOnExit

	slot3(slot0, slot0.cb)

	uv3 = "ipairs"

	slot3.onClose(slot0)
	gGameApp:requestServer("/game/role/item/sell", function ()
		uv2 = "gGameUI"

		gGameUI:showGainDisplay(slot2, {
			raw = false
		})
	end, {
		[slot6.id] = slot6.num
	})
end

function slot1.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot1
