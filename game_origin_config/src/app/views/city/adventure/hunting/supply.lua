slot0 = {
	gLanguageCsv.huntingCureTips,
	gLanguageCsv.huntingCureTips,
	gLanguageCsv.huntingReviveTips
}
slot1 = {
	{
		res = "city/adventure/hunting/box_green.png",
		color = cc.c4b(68, 185, 117, 255)
	},
	{
		res = "city/adventure/hunting/box_yellow.png",
		color = cc.c4b(202, 153, 35, 255)
	},
	{
		res = "city/adventure/hunting/box_blue.png",
		color = cc.c4b(65, 142, 177, 255)
	},
	{
		res = "city/adventure/hunting/box_orange.png",
		color = cc.c4b(227, 118, 84, 255)
	},
	{
		res = "city/adventure/hunting/box_pink.png",
		color = cc.c4b(217, 85, 118, 255)
	},
	{
		res = "city/adventure/hunting/box_purple.png",
		color = cc.c4b(165, 82, 193, 255)
	},
	{
		res = "city/adventure/hunting/box_red.png",
		color = cc.c4b(227, 98, 91, 255)
	}
}
slot2 = {
	all = 2,
	single = 1,
	resurrect = 3
}
slot4 = class("HuntingSupplyView", cc.load("mvc").ViewBase)
slot4.RESOURCE_FILENAME = "hunting_supply.json"
slot4.RESOURCE_BINDING = {
	item = "item",
	title = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(192, 91, 69, 255)
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
				padding = 10,
				data = bindHelper.self("eventDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot8 = "icon"
					slot4 = slot1:multiget("bg", "name", slot8, "select", "text")

					slot4.select:visible(slot3.isSel)
					slot4.name:text(slot3.name)

					uv8 = "multiget"

					text.addEffect(slot4.name, {
						color = slot8[slot3.quality].color
					})

					slot7 = nil

					adapt.setTextScaleWithWidth(slot4.name, slot7, 450)

					uv7 = "multiget"

					slot4.bg:texture(slot7[slot3.quality].res)
					slot4.icon:texture(slot3.icon)
					slot4.text:removeChildByName("richText")

					slot5 = rich.createByStr("#C0x5B545B#" .. slot3.desc, 40, nil):xy(slot4.text:width() / 2, slot4.text:y() / 2):anchorPoint(0.5, 0.5):addTo(slot4.text, 100, "richText"):formatText()

					slot4.text:text("")
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	},
	btnSure = {
		varname = "eventSure",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSure")
			}
		}
	}
}

function slot4.onCreate(slot0, slot1, slot2)
	slot0.params = slot1
	slot0.cb = slot2

	slot0:initModel()
	slot0.selectNum:addListener(function (slot0, slot1)
		uv2 = "eventDatas"

		if slot2.eventDatas:atproxy(slot1) then
			uv2 = "eventDatas"
			slot2.eventDatas:atproxy(slot1).isSel = false
		end

		uv2 = "eventDatas"

		if slot2.eventDatas:atproxy(slot0) then
			uv2 = "eventDatas"
			slot2.eventDatas:atproxy(slot0).isSel = true
		end
	end)
end

function slot4.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb, true)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)

	return slot0
end

function slot4.initModel(slot0)
	slot0.selectNum = idler.new(1)
	slot0.eventDatas = idlers.newWithMap({})
	slot1 = {}

	for slot5, slot6 in orderCsvPairs(csv.cross.hunting.supply) do
		if slot6.group == slot0.params.group then
			table.insert(slot1, {
				isSel = false,
				id = slot5,
				name = slot6.name,
				type = slot6.type,
				icon = slot6.icon,
				desc = slot6.desc,
				quality = slot6.quality
			})
		end
	end

	slot0.eventDatas:update(slot1)
end

function slot4.onItemClick(slot0, slot1, slot2, slot3)
	slot0.selectNum:set(slot2)
end

function slot4.onSure(slot0)
	slot1 = csv.cross.hunting.supply[slot0.selectNum:read()]
	slot3 = false
	slot4 = false

	for slot8, slot9 in pairs(gGameModel.hunting:read("hunting_route")[slot0.params.route].card_states or {}) do
		if slot9[1] < 1 and slot9[1] > 0 then
			slot4 = true
		elseif slot9[1] == 0 then
			slot3 = true
		end
	end

	slot6 = {
		isRich = false,
		btnType = 2,
		size = slot7,
		cb = function ()
			uv4 = "gGameApp"
			uv5 = "gGameApp"
			uv6 = "gGameApp"
			uv8 = "gGameApp"

			gGameApp:requestServer("/game/hunting/supply", function (slot0)
				uv1 = "onClose"

				slot1:onClose()
			end, slot4.params.route, slot5.params.node, slot6.eventDatas:atproxy(slot8.selectNum:read()).id)
		end,
		content = slot7[slot8],
		dialogParams = {
			clickClose = false
		}
	}
	slot7 = {
		width = 850,
		height = 460
	}
	uv7 = "csv"
	uv8 = "cross"

	if slot1.type == slot1.type.single then
		if slot4 then
			slot13 = slot0:createHandler("onClose")
			uv13 = "cross"

			gGameUI:stackUI("city.adventure.hunting.supply_detail", nil, , {
				route = slot0.params.route,
				node = slot0.params.node,
				cb = slot13,
				type = slot13.single,
				csvId = slot0.eventDatas:atproxy(slot0.selectNum:read()).id
			})
		else
			gGameUI:showDialog(slot6)
		end
	else
		uv8 = "cross"

		if slot1.type == slot8.all then
			if slot4 then
				gGameApp:requestServer("/game/hunting/supply", function (slot0)
					uv1 = "onClose"

					slot1:onClose()
				end, slot0.params.route, slot0.params.node, slot0.eventDatas:atproxy(slot0.selectNum:read()).id)
			else
				gGameUI:showDialog(slot6)
			end
		else
			uv8 = "cross"

			if slot1.type == slot8.resurrect then
				if slot3 then
					slot13 = slot0:createHandler("onClose")
					uv13 = "cross"

					gGameUI:stackUI("city.adventure.hunting.supply_detail", nil, , {
						route = slot0.params.route,
						node = slot0.params.node,
						cb = slot13,
						type = slot13.resurrect,
						csvId = slot0.eventDatas:atproxy(slot0.selectNum:read()).id
					})
				else
					gGameUI:showDialog(slot6)
				end
			end
		end
	end
end

return slot4
