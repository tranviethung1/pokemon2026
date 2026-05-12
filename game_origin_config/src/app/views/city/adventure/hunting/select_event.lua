slot0 = {
	boxDropLibs = 1,
	supplyGroup = 2
}
slot1 = {
	{
		"city/adventure/hunting/box_orange.png",
		"city/adventure/hunting/img_ptxlj.png",
		gLanguageCsv.commonPk
	},
	{
		"city/adventure/hunting/box_purple.png",
		"city/adventure/hunting/img_jyxlj.png",
		gLanguageCsv.seniorPk
	},
	{
		"city/adventure/hunting/box_pink.png",
		"city/adventure/hunting/img_sqbbzx@.png",
		gLanguageCsv.huntingCure
	}
}
slot2 = {
	cc.c3b(161, 137, 113, 1),
	cc.c3b(159, 108, 172, 1),
	cc.c3b(222, 106, 130, 1)
}
slot3 = {
	eliteGate = 2,
	normalGate = 1,
	careCenter = 3
}
slot5 = class("HuntingSelectEventView", cc.load("mvc").ViewBase)
slot5.RESOURCE_FILENAME = "hunting_select_event.json"
slot5.RESOURCE_BINDING = {
	item = "item",
	title = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 6,
					color = cc.c3b(192, 91, 69, 1)
				}
			}
		}
	},
	list = {
		varname = "eventList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("eventDatas"),
				item = bindHelper.self("item"),
				margin = bindHelper.self("eventMargin"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = "bg"
					slot4 = slot1:multiget(slot6, "icon", "select", "name")
					uv6 = "multiget"

					if slot3.type == slot6.normalGate then
						uv7 = "bg"
						slot7 = slot7[1][1]

						slot4.bg:texture(slot7)

						uv7 = "bg"
						slot7 = 317
						slot8 = 483

						slot4.icon:texture(slot7[1][2]):xy(slot7, slot8)

						uv7 = "bg"

						slot4.name:text(slot7[1][3])

						uv8 = "icon"

						text.addEffect(slot4.name, {
							color = slot8[1]
						})
					else
						uv6 = "multiget"

						if slot3.type == slot6.eliteGate then
							uv7 = "bg"
							slot7 = slot7[2][1]

							slot4.bg:texture(slot7)

							uv7 = "bg"
							slot7 = 317
							slot8 = 483

							slot4.icon:texture(slot7[2][2]):xy(slot7, slot8)

							uv7 = "bg"

							slot4.name:text(slot7[2][3])

							uv8 = "icon"

							text.addEffect(slot4.name, {
								color = slot8[2]
							})
						else
							uv7 = "bg"
							slot7 = slot7[3][1]

							slot4.bg:texture(slot7)

							uv7 = "bg"
							slot7 = 317
							slot8 = 437

							slot4.icon:texture(slot7[3][2]):xy(slot7, slot8)

							uv7 = "bg"

							slot4.name:text(slot7[3][3])

							uv8 = "icon"

							text.addEffect(slot4.name, {
								color = slot8[3]
							})
						end
					end

					slot4.select:visible(slot3.select)
					bind.touch(slot0, slot1, {
						clicksafe = false,
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				clickCell = bindHelper.self("clickCell")
			}
		}
	},
	btnSure = {
		varname = "eventSure",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onEventSure")
			}
		}
	}
}

function slot5.onCreate(slot0, slot1, slot2)
	slot0.node = slot1
	slot0.cb = slot2
	slot0.selectNum = 1
	slot0.eventMargin = 100
	slot0.eventDatas = idlers.new()

	slot0:initModel()
end

function slot5.initModel(slot0)
	slot1 = {}
	slot2 = csv.cross.hunting.route[slot0.node]
	slot0.routeType = slot2.routeTag
	slot3 = {}

	for slot7, slot8 in pairs(slot2.gateIDs) do
		table.insert(slot3, {
			id = slot8,
			type = csv.cross.hunting.gate[slot8].type
		})
	end

	table.sort(slot3, function (slot0, slot1)
		return slot0.type < slot1.type
	end)

	if slot2.supplyGroup > 0 then
		table.insert(slot3, {
			id = -1,
			type = 3
		})
	end

	for slot7, slot8 in pairs(slot3) do
		if slot7 == 1 then
			slot8.select = true
		else
			slot8.select = false
		end
	end

	slot0.data = slot3
	slot0.eventMargin = itertools.size(slot3) == 2 and 400 or 100

	slot0.eventDatas:update(slot3)
	slot0.eventList:setTouchEnabled(false)
end

function slot5.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb, true)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)

	return slot0
end

function slot5.clickCell(slot0, slot1, slot2)
	for slot6 = 1, #slot0.data do
		if slot6 == slot2 then
			slot0.eventDatas:atproxy(slot6).select = true
		else
			slot0.eventDatas:atproxy(slot6).select = false
		end
	end

	slot0.selectNum = slot2
end

function slot5.onEventSure(slot0)
	slot1 = nil

	gGameApp:requestServer("/game/hunting/board/choose", function (slot0)
		uv1 = "onClose"

		slot1:onClose()
	end, slot0.routeType, slot0.node, slot0.data[slot0.selectNum].id == -1 and 2 or slot0.data[slot0.selectNum].id)
end

return slot5
