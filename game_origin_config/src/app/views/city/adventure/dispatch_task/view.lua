slot0 = require("app.views.city.adventure.dispatch_task.tools")
slot1 = {
	"city/adventure/dispatchtask/icon_rarity1.png",
	"city/adventure/dispatchtask/icon_rarity2.png",
	"city/adventure/dispatchtask/icon_rarity3.png",
	"city/adventure/dispatchtask/icon_rarity4.png",
	"city/adventure/dispatchtask/icon_rarity5.png"
}
slot2 = gCommonConfigCsv.dispatchTaskRefreshCostRMB
slot3 = gCommonConfigCsv.dispatchTaskDoneAtOnceCostRMB
slot4 = gCommonConfigCsv.dispatchTaskDoneAtOnceSecond

function slot5(slot0)
	if time.getCutDown(slot0 * 60).day > 0 then
		slot1 = "" .. string.format(gLanguageCsv.day, slot2.day)
	end

	if slot2.hour > 0 then
		slot1 = slot1 .. string.format(gLanguageCsv.hour, slot2.hour)
	end

	if slot2.min > 0 then
		slot1 = slot1 .. string.format(gLanguageCsv.minute, slot2.min)
	end

	return slot1
end

function slot6(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0:get("cost")

	if slot3 then
		slot6 = dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.DispatchTaskFreeRefreshTimes)
		slot2 = string.format("%s(%s/%s)", gLanguageCsv.free, slot6 - slot4, slot6)
	end

	slot5:text(slot2)

	slot6 = ui.COLORS.NORMAL.WHITE

	if slot3 then
		slot6 = ui.COLORS.NORMAL.FRIEND_GREEN
	elseif slot1 < slot2 then
		slot6 = ui.COLORS.NORMAL.RED
	end

	text.addEffect(slot5, {
		color = slot6
	})
	adapt.oneLinePos(slot0:get("costIcon"), {
		slot5,
		slot0:get("costNote")
	}, cc.p(20, 0), "right")
	adapt.oneLinePos(slot0:get("costNote"), {
		slot0:get("taskNum"),
		slot0:get("taskNumNote")
	}, {
		cc.p(80, 0),
		cc.p(5, 0)
	}, "right")
end

function slot7(slot0, slot1, slot2, slot3)
	slot4 = slot2.subTime

	adapt.oneLinePos(slot1.countDownPanel:get("timeNote"), slot1.countDownPanel:get("icon"), cc.p(5, 0))
	adapt.oneLinePos(slot1.countDownPanel:get("icon"), slot1.countDownPanel:get("text"), cc.p(10, 0))
	slot0:enableSchedule():schedule(function ()
		uv0 = "time"

		if slot0 <= time.getTime() then
			uv0 = "getTime"

			if slot0.status == 3 then
				slot0 = gGameApp
				slot0 = slot0.requestServer

				slot0(slot0, "/game/dispatch/task/refresh", nil, false)

				uv0 = "status"
				slot0 = slot0.btnReward
				slot0 = slot0.show

				slot0(slot0)

				uv0 = "status"
				slot0 = slot0.canRecievePanel
				slot0 = slot0.show

				slot0(slot0)

				uv0 = "status"
				slot0 = slot0.btnComplete
				slot0 = slot0.hide

				slot0(slot0)

				uv0 = "status"

				slot0.countDownPanel:hide()
			end

			uv0 = "gGameApp"
			uv2 = "requestServer"

			slot0:unSchedule(slot2)
		else
			uv0 = "status"
			uv5 = "time"

			slot0.countDownPanel:get("text"):text(gLanguageCsv.exclusiveIconTime .. " " .. time.getCutDown(slot5 - time.getTime()).str)
		end
	end, 1, 0, "item" .. slot3)
end

function slot8(slot0, slot1)
	slot3 = slot0:size()

	if not slot0:get("effect") then
		slot2 = widget.addAnimationByKey(slot0, "diban/diban.skel", "effect", slot1 == 1 and "effect" or "effect" .. slot1 - 1, -1):xy(slot3.width / 2 + 5, slot3.height / 2 + 20):scale(2)
	else
		slot2:play(slot4)
	end
end

slot9 = class("DispatchTaskView", cc.load("mvc").ViewBase)
slot9.RESOURCE_FILENAME = "dispatch_task.json"
slot9.RESOURCE_BINDING = {
	item = "item",
	["bottomPanel.costIcon"] = "costIcon",
	bottomPanel = "bottomPanel",
	attrItem = "attrItem",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				padding = 38,
				data = bindHelper.self("taskDatas"),
				item = bindHelper.self("item"),
				attrItem = bindHelper.self("attrItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:stopAllActions()
					slot1:removeChildByName("effect")
					slot1:setName("item" .. slot0:getIdx(slot2))

					slot6 = slot1
					slot5 = slot1.multiget(slot6, "canRecievePanel", "countDownPanel", "iconCompleted", "textTitle", "imgQuality", "normalPanel", "conditionPanel", "rewardPanel", "btnReward", "btnComplete")
					uv6 = "stopAllActions"

					slot6(slot0, slot5, slot3, slot2)

					uv6 = "removeChildByName"
					slot6 = slot6.setRewardPanel

					slot6(slot0, slot5.rewardPanel, slot3.cfg.award, "icon", "main")

					uv6 = "removeChildByName"
					slot6 = slot6.setRewardPanel

					slot6(slot0, slot5.rewardPanel, slot3.cfg.extraAward, "extraIcon", "main")

					uv6 = "removeChildByName"

					slot6.setItemCondition(slot5.conditionPanel, slot3, slot0.attrItem, "main")

					slot8 = slot3.cfg.name

					slot5.textTitle:text(slot8)

					uv8 = "effect"

					slot5.imgQuality:texture(slot8[slot3.quality])

					slot8 = "time"
					uv8 = "setName"

					slot5.normalPanel:get(slot8):text(slot8(slot3.cfg.duration))
					adapt.oneLinePos(slot5.normalPanel:get("timeNote"), slot5.normalPanel:get("time"))
					adapt.oneLinePos(slot5.canRecievePanel:get("timeNote"), slot5.canRecievePanel:get("text"))
					text.addEffect(slot5.btnReward:get("textNote"), {
						glow = {
							color = ui.COLORS.GLOW.WHITE
						},
						color = ui.COLORS.NORMAL.WHITE
					})
					itertools.invoke(slot5, "hide")
					performWithDelay(slot1, function ()
						uv0 = "quality"
						uv1 = "get"
						uv2 = "effect"

						slot0(slot1, slot2.quality)

						uv0 = "get"

						slot0:get("effect"):setSpriteEventHandler(function (slot0, slot1)
							slot2 = itertools.invoke
							uv3 = "itertools"
							slot4 = "show"

							slot2(slot3, slot4)

							uv2 = "itertools"
							slot2 = slot2.normalPanel
							slot3 = slot2
							slot2 = slot2.visible
							uv4 = "invoke"

							if slot4.status ~= 1 then
								uv4 = "invoke"

								if slot4.status == 3 then
									slot4 = false
								else
									slot4 = true
								end
							end

							slot2(slot3, slot4)

							uv2 = "itertools"
							slot2 = slot2.canRecievePanel
							slot2 = slot2.visible
							uv4 = "invoke"
							slot4 = slot4.status == 1

							slot2(slot2, slot4)

							uv2 = "itertools"
							slot2 = slot2.iconCompleted
							slot2 = slot2.visible
							uv4 = "invoke"
							slot4 = slot4.status == 4

							slot2(slot2, slot4)

							uv2 = "itertools"
							slot2 = slot2.btnReward
							slot2 = slot2.visible
							uv4 = "invoke"
							slot4 = slot4.status == 1

							slot2(slot2, slot4)

							uv2 = "itertools"
							slot2 = slot2.btnComplete
							slot2 = slot2.visible
							uv4 = "invoke"
							slot4 = slot4.status == 3

							slot2(slot2, slot4)

							uv2 = "itertools"
							slot2 = slot2.countDownPanel
							slot2 = slot2.visible
							uv4 = "invoke"

							slot2(slot2, slot4.status == 3)

							uv2 = "show"

							slot2:setSpriteEventHandler()
						end, sp.EventType.ANIMATION_COMPLETE)
					end, 0.2)
					performWithDelay(slot1, function ()
						uv0 = "btnReward"
						slot0 = slot0.btnReward
						slot0 = slot0.visible
						uv2 = "visible"
						slot2 = slot2.status == 1

						slot0(slot0, slot2)

						uv0 = "btnReward"
						uv2 = "visible"

						slot0.btnComplete:visible(slot2.status == 3)
					end, 0.5)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
					bind.touch(slot0, slot5.btnReward, {
						methods = {
							ended = functools.partial(slot0.btnReward, slot2, slot3)
						}
					})
					bind.touch(slot0, slot5.btnComplete, {
						methods = {
							ended = functools.partial(slot0.btnComplete, slot2, slot3)
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end
			},
			handlers = {
				afterBuild = bindHelper.self("onAfterBuild"),
				clickCell = bindHelper.self("onItemClick"),
				btnReward = bindHelper.self("onBtnReward"),
				btnComplete = bindHelper.self("onBtnComplete")
			}
		}
	},
	["bottomPanel.btn"] = {
		varname = "bottomBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRefresh")
			}
		}
	},
	["bottomPanel.costNote"] = {
		varname = "costNote",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["bottomPanel.cost"] = {
		varname = "cost",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["bottomPanel.taskNumNote"] = {
		varname = "taskNumNote",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["bottomPanel.taskNum"] = {
		varname = "taskNum",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["bottomPanel.taskTimeNote"] = {
		varname = "taskTimeNote",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["bottomPanel.taskTime"] = {
		varname = "taskTime",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				},
				color = ui.COLORS.NORMAL.LIGHT_GREEN
			}
		}
	},
	["bottomPanel.oneKeyBtn"] = {
		varname = "oneKeyBtn",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onOneKeyBtnClick")
				}
			},
			{
				event = "visible",
				idler = bindHelper.self("oneKeyListen")
			}
		}
	}
}

function slot9.onCreate(slot0, slot1)
	slot0:initModel()
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "SEND",
		title = gLanguageCsv.dispatch
	})

	slot0.oneKeyListen = dataEasy.getListenShow(gUnlockCsv.dispatchTaskAwardOneKey)

	if slot0.oneKeyListen:read() == false then
		for slot6, slot7 in ipairs({
			slot0.bottomBtn,
			slot0.costIcon,
			slot0.cost,
			slot0.costNote,
			slot0.taskNum,
			slot0.taskNumNote
		}) do
			slot7:x(slot7:x() + slot0.oneKeyBtn:x() - slot0.bottomBtn:x())
		end
	end

	adapt.centerWithScreen({
		"left",
		nil,
		false
	}, {
		"right",
		nil,
		false
	}, nil, {
		{
			slot0.taskTimeNote,
			"pos",
			"left"
		},
		{
			slot0.taskTime,
			"pos",
			"left"
		},
		{
			slot0.taskNum,
			"pos",
			"right"
		},
		{
			slot0.taskNumNote,
			"pos",
			"right"
		},
		{
			slot0.cost,
			"pos",
			"right"
		},
		{
			slot0.costNote,
			"pos",
			"right"
		},
		{
			slot0.costIcon,
			"pos",
			"right"
		},
		{
			slot0.bottomBtn,
			"pos",
			"right"
		},
		{
			slot0.oneKeyBtn,
			"pos",
			"right"
		},
		{
			slot0.list,
			"width"
		},
		{
			slot0.list,
			"pos",
			"left"
		}
	})
	slot0.item:get("conditionPanel.attrList"):setScrollBarEnabled(false)
	adapt.oneLinePos(slot0.item:get("conditionPanel.extraCondition2"), slot0.item:get("conditionPanel.attrList"))

	slot0.taskDatas = idlertable.new({})
	slot0.accessibleNum = idler.new(0)

	idlereasy.any({
		slot0.dispatchTasks,
		slot0.vipLevel
	}, function (slot0, slot1, slot2)
		slot5 = nil
		slot7 = gGameModel.forever_dispatch:getIdlerOrigin("dispatchTasksNextAutoTime")
		slot7 = slot7.set

		slot7(slot7, time.getTime() + (time.getTimeTable().hour < 5 and 4 - slot4.hour or slot4.hour >= 18 and 28 - slot4.hour or 17 - slot4.hour) * 3600 + (59 - slot4.min) * 60 + 59 - slot4.sec + 1)

		uv7 = "time"
		slot7.canGetNum = 0
		uv7 = "time"
		slot7.selectIdx = 1
		slot7 = {}
		slot8 = 0
		slot9 = 0

		for slot13, slot14 in ipairs(slot1) do
			slot15 = csv.dispatch_task.tasks[slot14.csvID]
			slot17 = slot14.ending_time or 0

			if slot14.status == 1 then
				slot16 = 4
			end

			if slot16 == 3 and slot17 <= time.getTime() then
				slot16 = 1
			end

			if slot16 == 2 then
				slot8 = slot8 + 1
			end

			if slot16 == 1 then
				slot9 = slot9 + 1
			end

			table.insert(slot7, {
				dbid = slot13,
				csvID = slot14.csvID,
				fightingPoint = slot14.fighting_point,
				status = slot16,
				cardIDs = slot14.cardIDs or {},
				endingTime = slot14.ending_time,
				subTime = slot17,
				extraAwardPoint = slot14.extra_award_point or 0,
				cfg = slot15,
				quality = slot15.quality,
				taskData = slot14
			})
		end

		uv10 = "time"
		slot10 = slot10.accessibleNum
		slot10 = slot10.set

		slot10(slot10, slot8)

		uv10 = "time"
		slot10.canGetNum = slot9
		uv10 = "time"

		slot10.bottomPanel:get("taskNum"):text(slot8 .. "/" .. gVipCsv[slot2].dispatchTaskCount)

		uv12 = "time"

		text.addEffect(slot12.bottomPanel:get("taskNum"), {
			color = slot8 == 0 and ui.COLORS.NORMAL.WHITE or ui.COLORS.NORMAL.LIGHT_GREEN
		})

		slot11 = table.sort

		slot11(slot7, function (slot0, slot1)
			if slot0.status ~= slot1.status then
				return slot0.status < slot1.status
			end

			return slot1.quality < slot0.quality
		end)

		uv11 = "time"

		if slot11.showAcceptPos then
			for slot14, slot15 in ipairs(slot7) do
				if slot15.status == 2 then
					uv16 = "time"
					slot16.selectIdx = slot14 + 1

					break
				end
			end
		end

		if slot9 > 0 then
			uv12 = "time"
			slot12 = slot12.oneKeyBtn:get("textNote")

			text.addEffect(slot12, {
				glow = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			})

			uv12 = "time"

			uiEasy.setBtnShader(slot12.oneKeyBtn, nil, 1)
		else
			uv12 = "time"
			slot12 = slot12.oneKeyBtn
			slot12 = slot12.get

			text.deleteAllEffect(slot12(slot12, "textNote"))

			uv12 = "time"

			uiEasy.setBtnShader(slot12.oneKeyBtn, nil, 2)
		end

		slot11 = uiEasy.setBtnShader
		uv12 = "time"

		slot11(slot12.oneKeyBtn, nil, slot9 > 0 and 1 or 2)

		uv11 = "time"

		slot11.taskDatas:set(slot7)
	end)

	slot2 = idlereasy.any

	slot2({
		slot0.rmb,
		slot0.accessibleNum,
		slot0.freeRefreshTimes
	}, function (slot0, slot1, slot2, slot3)
		slot5 = slot3 < dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.DispatchTaskFreeRefreshTimes)
		uv6 = "dataEasy"
		slot6 = slot6.costIcon
		slot7 = slot6
		slot6 = slot6.visible

		slot6(slot7, not slot5)

		uv6 = "getPrivilegeVal"
		uv7 = "dataEasy"
		uv9 = "game"

		slot6(slot7.bottomPanel, slot1, slot2 * slot9, slot5, slot3)
	end)

	uv2 = "topuiManager"

	slot2.setRefreshTime(slot0, slot0.taskTime, {
		tag = "DispatchTaskView",
		sendGameProtocol = true,
		cb = function ()
			uv0 = "showAcceptPos"
			slot0.showAcceptPos = true
		end
	})

	if slot0.relicBuff then
		slot2 = slot0:getResourceNode()

		idlereasy.when(slot0.relicBuff, function (slot0, slot1)
			uv3 = "uiEasy"
			uv7 = "addRelicIcon"

			uiEasy.addRelicIcon(slot3, slot1, game.RELIC_BUFF.DISPATCH, {
				scale = 0.8,
				y = 90,
				x = slot7.taskNumNote:x() - 130
			})
		end)
	end
end

function slot9.initModel(slot0)
	slot0.dispatchTasks = gGameModel.role:getIdler("dispatch_tasks")
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.last_time = gGameModel.role:getIdler("dispatch_task_last_time")
	slot0.freeRefreshTimes = gGameModel.daily_record:getIdler("dispatch_refresh_free_times")

	if dataEasy.isTownRelicBuffUnlock() then
		slot0.relicBuff = gGameModel.town:getIdler("relic_buff")
	end
end

function slot9.onItemClick(slot0, slot1, slot2, slot3)
	slot0.showAcceptPos = true

	if slot3.status == 3 and time.getTime() < (slot3.endingTime or 0) then
		gGameUI:showTip(gLanguageCsv.currentTaskDispatched)

		return
	end

	if slot3.status == 4 then
		gGameUI:showTip(gLanguageCsv.currentTaskCompleted)

		return
	end

	if slot3.status ~= 2 then
		return
	end

	if slot0.canGetNum >= 24 then
		gGameUI:showTip(gLanguageCsv.pleaseCollectCompletedReward)

		return
	end

	gGameUI:stackUI("city.adventure.dispatch_task.sprite_select", nil, {
		full = true
	}, slot3)
end

function slot9.onBtnReward(slot0, slot1, slot2, slot3)
	slot0.showAcceptPos = false

	gGameApp:requestServer("/game/dispatch/task/award", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot3.dbid, false)
end

function slot9.onBtnComplete(slot0, slot1, slot2, slot3)
	slot0.showAcceptPos = false
	slot7 = time.getTime()
	uv7 = "showAcceptPos"
	slot5 = math.ceil((slot3.subTime - slot7) / slot7) - 1
	uv5 = "math"

	gGameUI:stackUI("city.develop.talent.reset", nil, {
		clickClose = true
	}, {
		typ = "end",
		from = "dispatch_task",
		cost = math.max(slot5, 0) * slot5,
		title = gLanguageCsv.tips,
		txt1 = gLanguageCsv.consumptionOrNot,
		txt2 = gLanguageCsv.completeTheTaskImmediately,
		requestParams = {
			slot3.dbid,
			true
		},
		cb = slot0:createHandler("onBtnCompleteCb")
	})
end

function slot9.onBtnCompleteCb(slot0, slot1)
	gGameUI:showGainDisplay(slot1)
end

function slot9.onRefresh(slot0)
	slot1 = dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.DispatchTaskFreeRefreshTimes)

	if slot0.accessibleNum:read() <= 0 then
		gGameUI:showTip(gLanguageCsv.currentlyNoTasksRefresh)

		return
	end

	if slot0.freeRefreshTimes:read() < slot1 then
		slot0.showAcceptPos = true

		gGameApp:requestServer("/game/dispatch/task/refresh", nil, true)

		return
	end

	slot2 = slot0.accessibleNum
	slot3 = slot2
	uv3 = "dataEasy"

	if slot0.rmb:read() < slot2.read(slot3) * slot3 then
		gGameUI:showTip(gLanguageCsv.yuanzhengShopRefreshRMBNotEnough)

		return
	end

	slot0.showAcceptPos = true
	slot8 = slot0.accessibleNum
	slot9 = slot8
	uv9 = "dataEasy"

	gGameUI:stackUI("city.develop.talent.reset", nil, {
		clickClose = true
	}, {
		from = "dispatch_task",
		cost = slot8.read(slot9) * slot9,
		title = gLanguageCsv.tips,
		txt1 = gLanguageCsv.consumptionOrNot,
		txt2 = gLanguageCsv.refreshTaskQuality
	})
end

function slot9.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if slot0.status ~= slot1.status then
			return slot0.status < slot1.status
		end

		return slot1.quality < slot0.quality
	end
end

function slot9.onAfterBuild(slot0)
	if slot0.selectIdx ~= nil then
		slot0.list:jumpToItem(slot0.selectIdx, cc.p(1, 0), cc.p(1, 0))
	end
end

function slot9.setRefreshTime(slot0, slot1, slot2)
	slot0:enableSchedule():schedule(function ()
		slot1 = nil
		slot1 = time.getTimeTable().hour < 5 and 4 - slot0.hour or slot0.hour >= 18 and 28 - slot0.hour or 17 - slot0.hour

		if (slot0.hour == 5 or slot0.hour == 18) and slot0.min == 0 and slot0.sec == 0 then
			uv2 = "time"

			if slot2.cb then
				uv2 = "time"

				slot2.cb()
			end

			uv2 = "time"

			if slot2.sendGameProtocol then
				gGameApp:requestServer("/game/dispatch/task/refresh", nil, false)
			end
		end

		uv2 = "getTimeTable"

		if slot2 then
			slot3 = "%02d:%02d:%02d"
			uv3 = "getTimeTable"

			slot3:text(string.format(slot3, slot1, 59 - slot0.min, 59 - slot0.sec))
		end
	end, 1, 0, slot2.tag)
end

function slot9.onOneKeyBtnClick(slot0)
	gGameUI:showDialog({
		isRich = true,
		clearFast = true,
		btnType = 2,
		content = string.format(gLanguageCsv.dispatchTaskTip, slot0.canGetNum),
		cb = function ()
			gGameApp:requestServer("/game/dispatch/task/award/onekey", function (slot0)
				gGameUI:stackUI("city.adventure.dispatch_task.one_key_detail", nil, , slot0.view.result)
			end)
		end
	})
end

return slot9
