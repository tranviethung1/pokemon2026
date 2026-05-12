slot0 = {
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
slot2 = class("HuntingSelectBuffView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "hunting_select_buff.json"
slot2.RESOURCE_BINDING = {
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
					slot4 = slot1:multiget("bg", "name", slot8, "select", "desc")

					slot4.select:visible(slot3.isSel)
					slot4.name:text(slot3.name)

					slot7 = {
						color = slot8[slot3.quality].color
					}
					uv8 = "multiget"

					text.addEffect(slot4.name, slot7)

					uv7 = "multiget"

					slot4.bg:texture(slot7[slot3.quality].res)
					slot4.icon:texture(slot3.icon)
					beauty.textScroll({
						isRich = true,
						align = "center",
						list = slot4.desc,
						strs = "#C0x5B545B#" .. slot3.desc,
						fontSize = ui.FONT_SIZE
					})
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

function slot2.onCreate(slot0, slot1)
	slot0.params = slot1

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

function slot2.initModel(slot0)
	slot0.selectNum = idler.new(1)
	slot0.eventDatas = idlers.newWithMap({})
	slot1 = {}

	for slot6, slot7 in ipairs(gGameModel.hunting:read("hunting_route")[slot0.params.route].board_buffs) do
		slot8 = csv.cross.hunting.buffs[slot7]

		table.insert(slot1, {
			isSel = false,
			id = slot7,
			name = slot8.name,
			type = slot8.type,
			icon = slot8.icon,
			quality = slot8.quality,
			desc = slot8.desc
		})
	end

	slot0.eventDatas:update(slot1)
end

function slot2.onItemClick(slot0, slot1, slot2, slot3)
	slot0.selectNum:set(slot2)
end

function slot2.onSure(slot0)
	gGameApp:requestServer("/game/hunting/battle/choose", function (slot0)
		uv1 = "params"

		if slot1.params.cb then
			uv1 = "params"
			uv3 = "params"

			slot1:addCallbackOnExit(slot3.params.cb)
		end

		uv1 = "params"

		slot1:onClose()
	end, slot0.params.route, slot0.params.node, slot0.selectNum:read())
end

return slot2
