slot1 = class("AutoChessHandbookFilterView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.adventure.auto_chess.tools")
slot1.RESOURCE_FILENAME = "auto_chess_handbook_filter.json"
slot1.RESOURCE_BINDING = {
	["panel.item3"] = "item3",
	panel = "panel",
	["panel.subList"] = "subList",
	["panel.item2"] = "item2",
	["panel.item1"] = "item1",
	["panel.list1"] = {
		varname = "list1",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("typeData"),
				item = bindHelper.self("item1"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("txt"):text(slot3.name)
					itertools.invoke({
						slot1:get("select"),
						slot1:get("selectBg")
					}, "visible", slot3.select == true)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTypeItemClick")
			}
		}
	},
	["panel.list2"] = {
		varname = "list2",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("priceData"),
				item = bindHelper.self("item2"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("txt"):text(slot3.price)
					text.addEffect(slot1:get("txt"), {
						outline = {
							size = 3,
							color = cc.c4b(94, 86, 93, 255)
						}
					})
					slot1:get("icon"):texture(slot3.icon)
					itertools.invoke({
						slot1:get("select"),
						slot1:get("selectBg")
					}, "visible", slot3.select == true)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onPriceItemClick")
			}
		}
	},
	["panel.list3"] = {
		varname = "attrList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 3,
				data = bindHelper.self("attrData"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item3"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(slot3.icon)
					itertools.invoke({
						slot1:get("select"),
						slot1:get("selectBg")
					}, "visible", slot3.select == true)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot1, slot0:getIdx(slot2), slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onAttrItemClick")
			}
		}
	},
	["panel.list4"] = {
		varname = "list4",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("stateData"),
				item = bindHelper.self("item1"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("txt"):text(slot3.name)
					itertools.invoke({
						slot1:get("select"),
						slot1:get("selectBg")
					}, "visible", slot3.select == true)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onStateItemClick")
			}
		}
	},
	closePanel = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.typeData = idlers.newWithMap({
		{
			name = gLanguageCsv.spriteCard
		},
		{
			name = gLanguageCsv.equipCard
		},
		{
			name = gLanguageCsv.eventCard
		}
	})
	slot0.priceData = idlers.newWithMap({
		{
			price = 2,
			icon = "city/adventure/auto_chess/icon_zzq_hui.png"
		},
		{
			price = 3,
			icon = "city/adventure/auto_chess/icon_zzq_lv.png"
		},
		{
			price = 4,
			icon = "city/adventure/auto_chess/icon_zzq_lan.png"
		},
		{
			price = 5,
			icon = "city/adventure/auto_chess/icon_zzq_zi.png"
		},
		{
			price = 6,
			icon = "city/adventure/auto_chess/icon_zzq_huang.png"
		}
	})
	slot0.attrData = idlers.newWithMap(arraytools.map(ui.ATTR_ICON, function (slot0, slot1)
		return {
			icon = slot1
		}
	end))
	slot0.stateData = idlers.newWithMap({
		{
			name = gLanguageCsv.allLight
		},
		{
			name = gLanguageCsv.partLight
		},
		{
			name = gLanguageCsv.notLight
		}
	})
	slot0.cb = slot1.cb
	slot0.typeSelData = slot1.typeSelData or idlertable.new({})
	slot0.priceSelData = slot1.priceSelData or idlertable.new({})
	slot0.attrSelData = slot1.attrSelData or idlertable.new({})
	slot0.stateSelData = slot1.stateSelData or idlertable.new({})

	slot0:resumeSelectState()
end

function slot1.resumeSelectState(slot0)
	for slot4, slot5 in pairs(slot0.typeSelData:read()) do
		slot0.typeData:atproxy(slot5).select = true
	end

	for slot4, slot5 in pairs(slot0.priceSelData:read()) do
		slot0.priceData:atproxy(slot5 - 1).select = true
	end

	for slot4, slot5 in pairs(slot0.attrSelData:read()) do
		slot0.attrData:atproxy(slot5).select = true
	end

	for slot4, slot5 in pairs(slot0.stateSelData:read()) do
		slot0.stateData:atproxy(slot5).select = true
	end
end

function slot1.onTypeItemClick(slot0, slot1, slot2, slot3, slot4)
	if not slot0.typeData:atproxy(slot3).select then
		slot0.typeData:atproxy(slot3).select = true
	else
		slot0.typeData:atproxy(slot3).select = nil
	end

	slot5 = {}

	for slot9, slot10 in slot0.typeData:pairs() do
		if slot10:read().select then
			table.insert(slot5, slot9)
		end
	end

	slot0.typeSelData:set(slot5)
end

function slot1.onPriceItemClick(slot0, slot1, slot2, slot3, slot4)
	if not slot0.priceData:atproxy(slot3).select then
		slot0.priceData:atproxy(slot3).select = true
	else
		slot0.priceData:atproxy(slot3).select = nil
	end

	slot5 = {}

	for slot9, slot10 in slot0.priceData:pairs() do
		if slot10:read().select then
			table.insert(slot5, slot10:read().price)
		end
	end

	slot0.priceSelData:set(slot5)
end

function slot1.onAttrItemClick(slot0, slot1, slot2, slot3, slot4)
	if not slot0.attrData:atproxy(slot3.k).select then
		slot0.attrData:atproxy(slot3.k).select = true
	else
		slot0.attrData:atproxy(slot3.k).select = nil
	end

	slot5 = {}

	for slot9, slot10 in slot0.attrData:pairs() do
		if slot10:read().select then
			table.insert(slot5, slot9)
		end
	end

	slot0.attrSelData:set(slot5)
end

function slot1.onStateItemClick(slot0, slot1, slot2, slot3, slot4)
	if not slot0.stateData:atproxy(slot3).select then
		slot0.stateData:atproxy(slot3).select = true
	else
		slot0.stateData:atproxy(slot3).select = nil
	end

	slot5 = {}

	for slot9, slot10 in slot0.stateData:pairs() do
		if slot10:read().select then
			table.insert(slot5, slot9)
		end
	end

	slot0.stateSelData:set(slot5)
end

function slot1.onClose(slot0)
	uv1 = "onClose"

	slot1.onClose(slot0)
end

return slot1
