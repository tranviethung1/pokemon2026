slot0 = {
	noReach = 2,
	received = 3,
	canReceive = 1
}
slot1 = class("NewNewWorldTaskView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "new_new_world_tasks.json"
slot1.RESOURCE_BINDING = {
	["panel.topPanel.cutDownPanel"] = "cutDownPanel",
	["panel.topPanel"] = "topPanel",
	["panel.topPanel.topItem"] = "topItem",
	panel = "panel",
	["panel.item"] = "item",
	["panel.topPanel.cutDownPanel.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(230, 100, 80, 255)
				}
			}
		}
	},
	["panel.topPanel.cutDownPanel.time"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(230, 100, 80, 255)
				}
			}
		}
	},
	["panel.topPanel.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("topData"),
				item = bindHelper.self("topItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("selected", "lock", "txt", "bg")

					slot4.selected:visible(slot3.selected)
					slot4.lock:visible(slot3.isLock)
					slot1:setTouchEnabled(not slot3.selected)
					slot4.txt:text(slot3[1].cfg.themeName)
					text.addEffect(slot4.txt, {
						color = cc.c4b(246, 90, 36, 255)
					})
					slot4.bg:texture("activity/new_new_world/btn_hxdzl_2.png")

					if slot3.isNowDay then
						slot4.bg:texture("activity/new_new_world/btn_hxdzl_1.png")
						text.addEffect(slot4.txt, {
							color = ui.COLORS.NORMAL.WHITE
						})
					end

					if slot3.isLock then
						slot4.bg:texture("activity/new_new_world/btn_hxdzl_3.png")
						text.addEffect(slot4.txt, {
							color = ui.COLORS.NORMAL.DEFAULT
						})
						slot1:setCascadeOpacityEnabled(true)
						slot1:setOpacity(102)
					end

					if not slot3.isLock then
						slot0.state = slot3.selected ~= true and slot3.canGet or false

						bind.extend(slot0, slot1, {
							class = "red_hint",
							props = {
								state = bindHelper.self("state"),
								onNode = function (slot0)
									slot0:xy(320, 100)
								end
							}
						})
					end

					adapt.setTextScaleWithWidth(slot4.txt, nil, 150)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabClick")
			}
		}
	},
	["panel.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("datas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("list", "desc", "num", "btnReceive", "imgReceived").desc:text(slot3.cfg.desc)

					if slot3.progress then
						slot4.num:text(string.format("%d/%d", slot3.progress[1], slot3.progress[2]))
					end

					uv8 = "multiget"

					slot4.imgReceived:visible(slot3.state == slot8.received)

					uv8 = "multiget"

					slot4.btnReceive:visible(slot3.state ~= slot8.received)

					uv8 = "multiget"

					slot4.btnReceive:get("label"):text(slot3.state == slot8.canReceive and gLanguageCsv.spaceReceive or gLanguageCsv.notReach)
					adapt.setTextScaleWithWidth(slot4.desc, nil, 330)

					slot9 = "label"
					uv9 = "multiget"

					uiEasy.setBtnShader(slot4.btnReceive, slot4.btnReceive:get(slot9), slot3.state == slot9.canReceive and 1 or 3)
					uiEasy.createItemsToList(slot0, slot4.list, slot3.cfg.award, {
						scale = 0.8
					})
					bind.touch(slot0, slot4.btnReceive, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onReceiveClick")
			}
		}
	},
	["panel.btnOneKey"] = {
		varname = "btnOneKey",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOneKeyClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.activityId = slot1

	slot0:initModel()
	slot0:enableSchedule()

	slot0.datas = idlers.new()
	slot0.showTab = idler.new(0)
	slot0.topData = idlers.new()

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "updateData"

		slot2:updateData()
	end)
	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "topData"
		slot2 = slot2.topData:atproxy(slot1)
		slot2.selected = false
		uv2 = "topData"
		slot2 = slot2.topData:atproxy(slot0)
		slot2.selected = true
		uv2 = "topData"

		slot2:updateData()
	end)
	slot0.showTab:set(slot0.nowDay <= slot0.topData:size() - 1 and slot0.nowDay - 1 or slot0.topData:size() - 1)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot1.updateData(slot0)
	slot7 = ((slot0.yyhuodongs:read()[slot0.activityId] or {}).info or {}).activeday or time.getDate(time.getTime())
	slot0.nowDay = math.ceil((time.getTime() - time.getNumTimestamp(slot7, time.getRefreshHour())) / 86400)

	slot0:initCutDown(time.getNumTimestamp(slot7, time.getRefreshHour()) + slot2.paramMap.showDay * 86400)

	slot11 = {}

	for slot15, slot16 in orderCsvPairs(csv.yunying.serveropen) do
		if slot16.huodongID == csv.yunying.yyhuodong[slot0.activityId].huodongID then
			slot11[slot16.themeType] = slot11[slot16.themeType] or {}

			table.insert(slot11[slot16.themeType], {
				selected = false,
				cfg = slot16,
				isNowDay = slot0.nowDay - 1 == slot16.themeType
			})

			slot17 = false

			if slot4.stamps[slot15] == 1 then
				slot11[slot16.themeType].canGet = true
			end
		end
	end

	slot11[slot0.showTab:read()].selected = true

	for slot15 = 0, itertools.size(slot11) - 1 do
		if slot15 <= slot0.nowDay - 1 then
			slot11[slot15].isLock = false
		else
			slot11[slot15].isLock = true
		end
	end

	slot0.topData:update(slot11)

	slot13 = {}
	slot14 = false

	for slot18, slot19 in pairs(slot4.stamps or {}) do
		if slot19 == 1 then
			slot14 = true
		end
	end

	for slot18, slot19 in orderCsvPairs(csv.yunying.serveropen) do
		if slot19.huodongID == slot3 and slot0.showTab:read() == slot19.themeType then
			uv20 = "yyhuodongs"
			slot20 = slot20.noReach

			if slot12[slot18] == 1 then
				uv21 = "yyhuodongs"
				slot20 = slot21.canReceive
			elseif slot12[slot18] == 0 then
				uv21 = "yyhuodongs"
				slot20 = slot21.received
			end

			table.insert(slot13, {
				csvId = slot18,
				cfg = slot19,
				state = slot20,
				progress = (gGameModel.role:getYYHuoDongTasksProgress(slot0.activityId) or {})[slot18]
			})
		end
	end

	slot0.datas:update(slot13)
	uiEasy.setBtnShader(slot0.btnOneKey, slot0.btnOneKey:get("txt"), slot14 and 1 or 2)
end

function slot1.onTabClick(slot0, slot1, slot2, slot3, slot4)
	if slot4.isLock then
		gGameUI:showTip(gLanguageCsv.notUnlock)

		return
	end

	slot0.showTab:set(slot3)
end

function slot1.initCutDown(slot0, slot1)
	slot0:schedule(function ()
		uv0 = "time"
		slot1 = time.getTime()
		slot0 = slot0 - slot1
		uv1 = "getTime"
		slot1 = slot1.cutDownPanel:get("time")
		slot2 = slot1

		slot1.text(slot2, time.getCutDown(slot0).str)

		uv2 = "getTime"
		slot2 = slot2.cutDownPanel
		slot3 = slot2
		uv3 = "getTime"

		adapt.oneLinePos(slot2.get(slot3, "txt"), slot3.cutDownPanel:get("time"), nil, "left")

		if slot0 <= 0 then
			uv1 = "getTime"
			slot1 = slot1.cutDownPanel:get("time")
			slot1 = slot1.hide

			slot1(slot1)

			uv1 = "getTime"

			slot1.cutDownPanel:get("txt"):text(gLanguageCsv.activityOver)

			return false
		end
	end, 1, 0, "activityCutDown")
end

function slot1.onReceiveClick(slot0, slot1, slot2, slot3, slot4)
	uv6 = "state"

	if slot4.state == slot6.canReceive then
		gGameApp:requestServer("/game/yy/award/get", function (slot0)
			gGameUI:showGainDisplay(slot0)
		end, slot0.activityId, slot4.csvId)
	else
		uv6 = "state"

		if slot4.state == slot6.noReach then
			gGameUI:showTip(gLanguageCsv.notReachedCannotGet)
		end
	end
end

function slot1.onOneKeyClick(slot0)
	gGameApp:requestServer("/game/yy/award/get/onekey", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId)
end

return slot1
