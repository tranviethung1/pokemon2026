slot0 = require("app.views.city.activity.grid_walk.tools")
slot2 = class("GridWalkBagView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "grid_walk_bag.json"
slot2.RESOURCE_BINDING = {
	["bgPanel.empty"] = "empty",
	["bgPanel.bg"] = "bg",
	item = "item",
	closePanel = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["bgPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("itemDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("icon", "txt")

					slot4.txt:text(beauty.singleTextLimitWord(slot3.name, {
						fontSize = slot4.txt:getFontSize()
					}, {
						width = 240,
						onlyText = true
					}))
					bind.extend(slot0, slot4.icon, {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key,
								num = slot3.val
							}
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
					slot0.afterBuild()
				end
			},
			handlers = {
				afterBuild = bindHelper.self("onAfterBuild")
			}
		}
	}
}

function slot2.onCreate(slot0)
	slot0.itemDatas = idlers.new()
	slot2 = true
	uv4 = "itemDatas"

	for slot6, slot7 in pairs(slot4.CARDSBAG_ID) do
		if dataEasy.getNumByKey(slot7) > 0 then
			table.insert({}, {
				key = slot7,
				val = slot9,
				name = dataEasy.getCfgByKey(slot7).name
			})

			slot2 = false
		end
	end

	if slot2 then
		slot0.empty:show()
	else
		slot0.itemDatas:update(slot1)
	end
end

function slot2.onAfterBuild(slot0)
	if slot0.list:width() > 0 then
		slot0.bg:width(slot1 + 70)
	end
end

return slot2
