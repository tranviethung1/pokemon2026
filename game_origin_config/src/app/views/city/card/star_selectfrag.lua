slot0 = require("app.views.city.zawake.tools")
slot1 = cc.load("mvc").ViewBase
slot2 = class("CardStarSelectFragView", Dialog)
slot2.RESOURCE_FILENAME = "zawake_choose_frag.json"
slot2.RESOURCE_BINDING = {
	item = "item",
	["tipPanel.textTip"] = "textTip",
	title = "title",
	innerList = "innerList",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 6,
				data = bindHelper.self("showData"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					uiEasy.setIconName(slot3.id, nil, {
						node = slot1:get("name"),
						width = slot1:width()
					})
					bind.extend(slot0, slot1:get("icon"), {
						class = "icon_key",
						props = {
							data = {
								key = slot3.id,
								num = slot3.num
							},
							onNode = function (slot0)
								slot1 = slot0.setTouchEnabled

								slot1(slot0, false)

								uv1 = "setTouchEnabled"

								if slot1.num == 0 then
									slot0:get("num"):text(0)
								end
							end
						}
					})
					bind.touch(slot0, slot1:get("icon"), {
						methods = {
							ended = functools.partial(slot0.itemClick, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	tipPanel = {
		binds = {
			event = "visible",
			idler = bindHelper.self("showTip")
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0.selectedFragId = slot1.selectedFragId
	slot0.showData = idlers.new({})
	slot0.showTip = idler.new(false)
	slot5 = {
		[slot4] = {
			itemNum = 1,
			id = slot4,
			num = slot6,
			cardType = slot3.cardType
		}
	}

	if dataEasy.getNumByKey(csv.cards[slot1.cardId].fragID) > 0 then
		-- Nothing
	end

	if dataEasy.isUnlock(gUnlockCsv.zawake) and slot3.zawakeFragID > 0 and dataEasy.getNumByKey(slot3.zawakeFragID) > 0 then
		slot5[slot3.zawakeFragID] = {
			itemNum = 1,
			id = slot3.zawakeFragID,
			num = slot7,
			cardType = slot3.cardType
		}
	end

	table.sort(slot5, function (slot0, slot1)
		if slot0.cardType ~= slot1.cardType then
			return slot1.cardType < slot0.cardType
		end

		if slot0.num ~= slot1.num then
			return slot1.num < slot0.num
		end

		return slot0.id < slot1.id
	end)
	slot0.showData:update(slot5)

	slot7 = csv.zawake.exchange[fragID]

	slot0.textTip:text(gLanguageCsv.fragMentNotNum)
	slot0.showTip:set(itertools.size(slot5) == 0)
	Dialog.onCreate(slot0)
end

function slot2.onItemClick(slot0, slot1, slot2, slot3)
	slot4 = slot0.selectedFragId
	slot4 = slot4.set

	slot4(slot4, slot3.id)

	uv4 = "selectedFragId"

	slot4.onClose(slot0)
end

return slot2
