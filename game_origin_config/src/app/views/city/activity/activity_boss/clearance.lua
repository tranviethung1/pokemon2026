slot0 = cc.load("mvc").ViewBase
slot1 = class("ActivityBossDetail", Dialog)
slot1.RESOURCE_FILENAME = "activity_boss_clearance.json"
slot1.RESOURCE_BINDING = {
	["centerPanel.item"] = "item",
	centerPanel = "centerPanel",
	emptyPanel = "emptyPanel",
	["centerPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("roleDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("icon", "name", "lv", "lvNum", "area", "fighting")

					bind.extend(slot0, slot4.icon, {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.logo,
							frameId = slot3.frame,
							onNode = function (slot0)
								slot0:scale(0.8)
							end
						}
					})
					slot4.name:text(slot3.name)
					slot4.lvNum:text(slot3.level)
					slot4.area:text(string.format(gLanguageCsv.brackets, getServerArea(slot3.game_key)))
					slot4.area:x(slot4.area:x() - 35)
					slot4.fighting:text(slot3.fight_point)
					adapt.oneLinePos(slot4.lv, slot4.lvNum, cc.p(5, 0))
				end
			}
		}
	},
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.item:hide()

	slot0.roleDatas = slot1

	slot0.emptyPanel:visible(#slot1 == 0)
	slot0.centerPanel:visible(#slot1 > 0)
	Dialog.onCreate(slot0)
end

return slot1
