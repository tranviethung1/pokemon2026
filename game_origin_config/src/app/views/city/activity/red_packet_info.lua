function slot0(slot0, slot1, slot2, slot3)
	bind.extend(slot0, slot1.iconBg, {
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
end

slot1 = cc.load("mvc").ViewBase
slot2 = class("RedPacketInfoView", Dialog)
slot2.RESOURCE_FILENAME = "activity_get_particulars.json"
slot2.RESOURCE_BINDING = {
	name = "panelName",
	item = "item",
	anima = "anima",
	oneself = "oneself",
	benediction = "benediction",
	name1 = "name1",
	close = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["item.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = ui.COLORS.NORMAL.DULL_YELLOW
				}
			}
		}
	},
	["item.rmb"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = ui.COLORS.NORMAL.DULL_YELLOW
				}
			}
		}
	},
	list = {
		varname = "listview",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot5 = slot1
					slot4 = slot1.multiget(slot5, "bg", "name", "society", "gh", "luck", "rmb", "icon", "iconBg", "name1")
					uv5 = "multiget"

					slot5(slot0, slot4, slot2, slot3)
					slot4.name:text(slot3.name)

					if slot3.game_key then
						slot4.name1:text(string.format(gLanguageCsv.brackets, getServerArea(slot3.game_key, true)))
					else
						slot4.name1:hide()
					end

					adapt.oneLinePos(slot4.name, slot4.name1, cc.p(6, 0))

					if slot3.union and string.len(slot3.union) == 0 then
						slot3.union = gLanguageCsv.nonunion
					end

					slot4.gh:text(slot3.union)
					slot4.luck:visible(slot3.lickId == slot3.id)
					slot4.rmb:text(slot3.val)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBtnClick")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.cb = slot2
	slot0.tabDatas = idlers.newWithMap({})
	slot3 = {}

	slot0.tabDatas:update(clone(slot1.members))
	slot0.panelName:text(slot1.role_name)

	if slot1.game_key then
		slot0.name1:text(string.format(gLanguageCsv.brackets, getServerArea(slot1.game_key, true)))
	else
		slot0.name1:hide()
	end

	adapt.oneLinePos(slot0.panelName, slot0.name1, cc.p(6, 0))
	slot0.benediction:text(slot1.message)

	slot5 = slot0.oneself
	slot6 = slot5
	uv6 = "cb"

	slot6(slot0, slot5.multiget(slot6, "iconBg"), nil, {
		logo = slot1.role_logo,
		frame = slot1.role_frame
	})
	Dialog.onCreate(slot0)
end

function slot2.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot2
