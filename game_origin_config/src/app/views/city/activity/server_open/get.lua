slot0 = {
	received = 3,
	noReach = 2,
	canReceive = 1
}
slot1 = {
	vacation = {
		iconBg = "activity/server_open/summer_vacation/btn_sqqtl_1.png"
	}
}

function slot2(slot0)
	if slot0.num:size().width + slot0.desc:size().width > 400 then
		slot0.desc:x(slot0.num:x() - slot2 - 10)
		slot0.img:size(slot2 + 54, 45)
	else
		slot0.img:size(520, 45)
	end
end

slot3 = class("ServerOpenGetView", cc.load("mvc").ViewBase)
slot3.RESOURCE_FILENAME = "activity_server_open_get.json"
slot3.RESOURCE_BINDING = {
	item = "item",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 4,
				data = bindHelper.self("datas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				dataOrderCmp = function (slot0, slot1)
					if slot0.state ~= slot1.state then
						return slot0.state < slot1.state
					end

					return slot0.id < slot1.id
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

					uv6 = "cfg"

					slot6(slot5)

					if slot3.clientType then
						uv7 = "multiget"

						for slot9, slot10 in pairs(slot7) do
							if slot9 == slot3.clientType then
								slot5.receivebtn:loadTextureNormal(slot10.iconBg)
								slot5.receivebtn:scale(2)
								slot5.receivebtn:size(135, 55)
								slot5.receivebtn:get("label"):scale(0.5)
								slot5.receivebtn:get("label"):xy(67, 27)
							end
						end
					end

					uv9 = "list"

					slot5.receivebtn:visible(slot3.state ~= slot9.received)

					uv9 = "list"

					slot5.received:visible(slot3.state == slot9.received)
					slot5.receivebtn:setTouchEnabled(false)
					cache.setShader(slot5.receivebtn, false, "normal")

					slot8 = "label"
					uv8 = "list"

					if slot3.state == slot8.canReceive then
						slot5.receivebtn:setTouchEnabled(true)
						text.addEffect(slot5.receivebtn:get(slot8), {
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
						uv8 = "list"

						if slot3.state == slot8.noReach then
							text.addEffect(slot5.num, {
								color = ui.COLORS.NORMAL.ALERT_ORANGE
							})
							cache.setShader(slot5.receivebtn, false, "hsl_gray")
							text.deleteAllEffect(slot6)
							text.addEffect(slot6, {
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

function slot3.onCreate(slot0, slot1, slot2, slot3)
	slot0:initModel()

	slot0.data = slot2
	slot0.currDay, slot0.showTab, slot0.tabIndex = slot3()
	slot5 = csv.yunying.yyhuodong[slot1].huodongID

	if not slot0.datas then
		slot0.datas = idlers.new()
	end

	slot0.activityId = slot1
	slot0.clientType = csv.yunying.yyhuodong[slot1].clientParam.type

	idlereasy.any({
		slot0.yyhuodongs,
		slot0.currDay,
		slot0.showTab,
		slot0.tabIndex
	}, function (slot0, slot1, slot2, slot3, slot4)
		if slot4 == -1 then
			return
		end

		uv5 = "activityId"
		slot6 = (slot1[slot5.activityId] or {}).stamps or {}
		uv8 = "activityId"

		if clone(slot8.data[slot3][slot4]) then
			uv10 = "activityId"
			slot8 = gGameModel.role:getYYHuoDongTasksProgress(slot10.activityId) or {}

			for slot12 = 1, #slot7 do
				uv13 = "stamps"
				slot13 = slot13.noReach

				if slot7[slot12].cfg.taskType == game.TARGET_TYPE.CompleteImmediate then
					if slot2 < slot3 then
						slot7[slot12].progress = {
							0,
							1
						}
					else
						slot7[slot12].progress = {
							1,
							1
						}
					end
				elseif slot8[slot7[slot12].id] then
					slot7[slot12].progress = slot8[slot7[slot12].id]
				end

				if not slot6[slot7[slot12].id] then
					uv15 = "stamps"
					slot7[slot12].state = slot15.noReach
				elseif slot6[slot7[slot12].id] == 1 then
					uv15 = "stamps"
					slot7[slot12].state = slot15.canReceive
				elseif slot6[slot7[slot12].id] == 0 then
					uv15 = "stamps"
					slot7[slot12].state = slot15.received
				end

				uv15 = "activityId"
				slot7[slot12].clientType = slot15.clientType
			end

			uv9 = "activityId"

			slot9.datas:update(slot7)
		end
	end)
end

function slot3.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot3.onReceiveClick(slot0, slot1, slot2, slot3)
	uv5 = "state"

	if slot3.state == slot5.canReceive then
		dataEasy.tryCallFunc(slot0.list, "setItemAction", {
			isAction = false
		})
		gGameApp:requestServer("/game/yy/award/get", function (slot0)
			gGameUI:showGainDisplay(slot0, {
				cb = function ()
					uv1 = "performWithDelay"

					performWithDelay(slot1, function ()
						uv1 = "dataEasy"

						dataEasy.tryCallFunc(slot1.list, "setItemAction", {
							isAction = true,
							alwaysShow = true
						})
					end, 0.1)
				end
			})
		end, slot0.activityId, slot3.id)
	else
		uv5 = "state"

		if slot3.state == slot5.noReach then
			gGameUI:showTip(gLanguageCsv.notReachedCannotGet)
		end
	end
end

return slot3
