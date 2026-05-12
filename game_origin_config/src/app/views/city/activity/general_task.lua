slot0 = {
	received = 3,
	noReach = 2,
	canReceive = 1
}
slot1 = class("ActivityGeneralTaskView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "activity_general_task.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				data = bindHelper.self("datas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					if slot0.state ~= slot1.state then
						return slot0.state < slot1.state
					end

					return slot0.csvId < slot1.csvId
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.cfg
					slot5 = slot1:multiget("list", "num", "receivebtn", "received", "desc", "img")

					uiEasy.createItemsToList(slot0, slot5.list, slot4.award)
					slot5.desc:text(slot4.desc)
					slot5.num:text("")
					text.addEffect(slot5.num, {
						color = ui.COLORS.NORMAL.FRIEND_GREEN
					})

					if slot3.progress then
						slot5.num:text(string.format("%d/%d", slot3.progress[1], slot3.progress[2]))
					end

					if slot5.num:width() + slot5.desc:width() > 400 then
						slot5.desc:x(slot5.num:box().x - 20 - slot8)
						slot5.img:width(slot7 + slot8 + 70)
					else
						slot5.desc:x(1436)
						slot5.img:width(455)
					end

					uv12 = "cfg"

					slot5.receivebtn:visible(slot3.state ~= slot12.received)

					uv12 = "cfg"

					slot5.received:visible(slot3.state == slot12.received)
					slot5.receivebtn:setTouchEnabled(false)
					cache.setShader(slot5.receivebtn, false, "normal")

					slot11 = "label"
					uv11 = "cfg"

					if slot3.state == slot11.canReceive then
						slot5.receivebtn:setTouchEnabled(true)
						text.addEffect(slot5.receivebtn:get(slot11), {
							color = ui.COLORS.NORMAL.WHITE,
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
						bind.touch(slot0, slot5.receivebtn, {
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
					else
						uv11 = "cfg"

						if slot3.state == slot11.noReach then
							text.addEffect(slot5.num, {
								color = ui.COLORS.NORMAL.ALERT_ORANGE
							})
							cache.setShader(slot5.receivebtn, false, "hsl_gray")
							text.deleteAllEffect(slot9)
							text.addEffect(slot9, {
								color = ui.COLORS.DISABLED.WHITE
							})
						end
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onReceiveClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.activityId = slot1

	slot0:initModel()

	slot3 = csv.yunying.yyhuodong[slot1].huodongID
	slot0.datas = idlers.new()

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "stamps"
		uv6 = "stamps"
		slot4 = gGameModel.role:getYYHuoDongTasksProgress(slot6) or {}
		slot5 = {}

		for slot9, slot10 in csvPairs(csv.yunying.generaltask) do
			uv12 = "gGameModel"

			if slot10.huodongID == slot12 then
				uv11 = "role"
				slot11 = slot11.noReach

				if ((slot1[slot2] or {}).stamps or {})[slot9] == 1 then
					uv12 = "role"
					slot11 = slot12.canReceive
				elseif slot3[slot9] == 0 then
					uv12 = "role"
					slot11 = slot12.received
				end

				table.insert(slot5, {
					csvId = slot9,
					cfg = slot10,
					state = slot11,
					progress = slot4[slot9]
				})
			end
		end

		slot6 = dataEasy.tryCallFunc
		uv7 = "getYYHuoDongTasksProgress"

		slot6(slot7.list, "updatePreloadCenterIndex")

		uv6 = "getYYHuoDongTasksProgress"

		slot6.datas:update(slot5)
	end)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot1.onReceiveClick(slot0, slot1, slot2, slot3)
	uv5 = "state"

	if slot3.state == slot5.canReceive then
		gGameApp:requestServer("/game/yy/award/get", function (slot0)
			gGameUI:showGainDisplay(slot0)
		end, slot0.activityId, slot3.csvId)
	else
		uv5 = "state"

		if slot3.state == slot5.noReach then
			gGameUI:showTip(gLanguageCsv.notReachedCannotGet)
		end
	end
end

return slot1
