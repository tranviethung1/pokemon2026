slot0 = {
	UNSHOW = 0,
	SHOW_SENIRO = 2,
	SHOW_REUNION = 1
}
slot1 = cc.load("mvc").ViewBase
slot2 = class("CloneBattleInviteView", Dialog)
slot2.RESOURCE_FILENAME = "clone_battle_friend_invite.json"
slot2.RESOURCE_BINDING = {
	empty = "empty",
	item = "item",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("roles"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("icon", "name", "text1", "text2", "lv", "lvNumber", "btn", "reunionPanel")

					bind.extend(slot0, slot4.icon, {
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.logo,
							frameId = slot3.frame
						}
					})
					slot4.name:text(slot3.name)
					slot4.text2:text(slot3.battle_fighting_point)
					slot4.lvNumber:text(slot3.level)
					adapt.oneLinePos(slot4.name, {
						slot4.lv,
						slot4.lvNumber
					}, cc.p(15, 0), "left")
					adapt.oneLinePos(slot4.text1, slot4.text2, cc.p(15, 0), "left")
					slot4.btn:tag(slot2)
					bind.click(slot0, slot4.btn, {
						method = functools.partial(slot0.clickCell, slot4.btn, slot2, slot3)
					})
					text.addEffect(slot4.btn:get("text"), {
						glow = {
							color = ui.COLORS.GLOW.WHITE
						}
					})

					slot5 = slot4.reunionPanel
					slot6 = slot5
					slot5 = slot5.visible

					if slot3.reunionType then
						uv8 = "multiget"

						if slot3.reunionType == slot8.UNSHOW then
							slot7 = false

							if false then
								slot7 = false
							end
						else
							slot7 = true
						end
					end

					slot5(slot6, slot7)

					if slot3.reunionType then
						uv6 = "multiget"

						if slot3.reunionType ~= slot6.UNSHOW then
							slot4.reunionPanel:get("label"):text(gLanguageCsv["reunionType" .. slot3.reunionType])
						end
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
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

function slot2.getReunionType(slot0, slot1)
	uv2 = "UNSHOW"
	slot2 = slot2.UNSHOW

	if slot0.reunion and slot0.reunion.role_type == 1 and slot0.reunion.info and slot0.reunion.info.end_time - time.getTime() > 0 and slot0.reunionBindRoleId and slot0.reunionBindRoleId == slot1 then
		uv3 = "UNSHOW"
		slot2 = slot3.SHOW_SENIRO
	elseif slot0.reunion and slot0.reunion.role_type == 2 and slot0.reunion.info and slot0.reunion.info.end_time - time.getTime() > 0 and slot0.reunion.info.role_id == slot1 then
		uv3 = "UNSHOW"
		slot2 = slot3.SHOW_REUNION
	end

	return slot2
end

function slot2.onCreate(slot0, slot1, slot2)
	slot0.reunion = gGameModel.role:read("reunion")
	slot0.reunionBindRoleId = gGameModel.reunion_record:read("bind_role_db_id")
	slot0.roles = idlers.newWithMap({})
	slot3 = slot1.roles or {}

	for slot7, slot8 in ipairs(slot3) do
		slot3[slot7].reunionType = slot0:getReunionType(slot8.id)
	end

	slot0.roles:update(slot3)

	slot0.func = slot2

	if slot1.size == 0 then
		slot0.empty:show()
		slot0.list:hide()
	end

	Dialog.onCreate(slot0, {
		clickClose = true
	})
end

function slot2.onItemClick(slot0, slot1, slot2, slot3, slot4)
	slot0.func(slot4, slot0, slot2)
end

return slot2
