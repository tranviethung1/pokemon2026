slot0 = require("app.views.city.activity.view")
slot1 = class("ActivityGoldLuckyCat", Dialog)
slot2 = 8
slot3 = 5
slot1.RESOURCE_FILENAME = "activity_gold_lucky_cat.json"
slot1.RESOURCE_BINDING = {
	have = "have",
	numItem = "numItem",
	txt3 = "txt3",
	cost = "cost",
	dialogPanel = "dialogPanel",
	txt2 = "txt2",
	icon3 = "icon3",
	leftList = "leftList",
	skelPanel = "skelPanel",
	item = "item",
	mask = "mask",
	iconVipTips = "iconVipTips",
	["dialogPanel.vip5"] = "vipIcon",
	txtVipTips = "txtVipTips",
	icon2 = "icon2",
	icon1 = "icon1",
	["dialogPanel.list"] = "vipList",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnSure = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:onSure(1)
				end)
			}
		}
	},
	txt4 = {
		varname = "txt4",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(241, 114, 37, 255)
				}
			}
		}
	},
	txt = {
		varname = "txt",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(241, 114, 37, 255)
				}
			}
		}
	},
	max = {
		varname = "max",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(241, 114, 37, 255)
				}
			}
		}
	},
	times = {
		varname = "times",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(241, 114, 37, 255)
				}
			}
		}
	},
	timeLabel = {
		varname = "timeLabel",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(241, 114, 37, 255)
				}
			}
		}
	},
	time = {
		varname = "time",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(241, 114, 37, 255)
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot3 = slot2.view.luckycat_message_gold

	gGameModel.currday_dispatch:getIdlerOrigin("goldLuckyCat"):set(true)

	slot0.activityId = slot1

	slot0:initModel()
	slot0:initSkel()

	slot0.originData = {}
	slot4 = {}

	for slot8, slot9 in orderCsvPairs(csv.yunying.luckycat) do
		if csv.yunying.yyhuodong[slot0.activityId].huodongID == slot9.huodongID then
			table.insert(slot0.originData, slot9)
			table.insert(slot4, slot9.vip)
		end
	end

	uv7 = "view"
	slot0.data1 = arraytools.first(slot3, slot7)

	for slot8, slot9 in ipairs(slot4) do
		if slot9 ~= 0 then
			slot10 = slot0.vipIcon:clone()

			slot10:texture("common/icon/vip/icon_vip" .. slot9 .. ".png")
			slot0.vipList:addChild(slot10)
			slot10:show()
		end
	end

	slot0.vipList:setItemAlignCenter()
	slot0.vipList:setScrollBarEnabled(false)

	slot0.showItemIdx = 1
	slot0.maxIdx = 0

	slot0.leftList:setTouchEnabled(false)
	slot0.leftList:setScrollBarEnabled(false)

	slot0.leftDatas = idlertable.new(#slot3 > 0 and slot3 or {})

	idlereasy.when(slot0.leftDatas, function (slot0, slot1)
		uv2 = "leftList"

		slot2.leftList:removeAllItems()

		for slot7, slot8 in pairs(slot1) do
			function slot9(slot0)
				uv1 = "item"
				slot1 = slot1.item:clone()

				slot1:show()

				slot2 = slot1:get("label")

				if slot1:size().height < rich.createWithWidth(string.format(gLanguageCsv.congratulationGetGold, slot0[1], mathEasy.getShortNumber(slot0[2], 2)), slot2:getFontSize(), nil, slot1:size().width - 10):anchorPoint(0, 1):addTo(slot2):size().height then
					slot1:size(cc.size(slot1:size().width, slot3:size().height + 10))
				end

				slot4 = slot2.y

				slot4(slot2, slot1:size().height - 5)

				uv4 = "item"

				slot4.leftList:pushBackCustomItem(slot1)
			end

			slot9(slot8)

			uv9 = "leftList"
			slot9 = slot9.leftList
			slot9 = slot9.refreshView

			slot9(slot9)

			uv9 = "leftList"

			if 0 == 0 then
				uv10 = "leftList"

				if slot10.leftList:size().height < slot9.leftList:getInnerContainer():size().height then
					slot3 = slot7
				end
			end
		end

		uv4 = "leftList"
		slot4.maxIdx = #slot1

		if slot3 > 0 then
			for slot7 = 1, slot3 do
				slot2(slot1[slot7])
			end
		end
	end)

	slot0.node = slot0:getResourceNode()
	uv6 = "luckycat_message_gold"

	for slot8 = 1, slot6 do
		slot0.node:get("list" .. slot8):setScrollBarEnabled(false)
	end

	slot0.currId = idler.new(slot0.originData[1].drawID)

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityId"
		uv3 = "activityId"

		slot3.currId:set((slot1[slot2.activityId] or {}).info.count)
	end)

	slot0.curState = idler.new(false)
	slot5 = idlereasy.any

	slot5({
		slot0.curState,
		slot0.gold,
		slot0.vip
	}, function (slot0, slot1, slot2, slot3)
		if slot1 == true then
			uv4 = "rollCb"

			slot4:rollCb()
		end
	end)

	uv5 = "gGameModel"

	slot5.setCountdown(slot0, slot0.activityId, slot0.timeLabel, slot0.time, {
		labelChangeCb = function ()
			uv1 = "adapt"
			uv2 = "adapt"

			adapt.oneLinePos(slot1.timeLabel, slot2.time, cc.p(15, 0))
		end
	})
	slot0:rollCb()
	slot0:originRoll()

	slot5 = 0
	slot6 = 0

	slot0:enableSchedule()
	slot0:schedule(function ()
		uv0 = "maxIdx"

		if slot0.maxIdx > 0 then
			uv0 = "maxIdx"
			slot0 = slot0.leftList
			slot1 = slot0
			slot0 = slot0.scrollToItem
			uv2 = "maxIdx"

			slot0(slot1, slot2.showItemIdx, cc.p(1, 1), cc.p(1, 1))

			uv0 = "maxIdx"
			uv1 = "maxIdx"

			if slot1.maxIdx <= slot0.showItemIdx then
				uv0 = "maxIdx"
				slot1 = 0
				slot0.showItemIdx = slot1
				uv1 = "maxIdx"

				performWithDelay(slot1, function ()
					uv0 = "leftList"

					slot0.leftList:jumpToItem(0, cc.p(1, 1), cc.p(1, 1))
				end, 0.9)
			end

			uv0 = "maxIdx"
			uv1 = "maxIdx"
			slot0.showItemIdx = slot1.showItemIdx + 1
		end
	end, 1, 1, 4)
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.vip = gGameModel.role:getIdler("vip_level")
end

function slot1.initSkel(slot0)
	slot0.wheelSkel = widget.addAnimationByKey(slot0.skelPanel, "xingyuntuibi/xingyuntuibi.skel", "tuiBi", "effect_loop", 2)

	slot0.wheelSkel:anchorPoint(cc.p(0.5, 0.5)):xy(slot0.skelPanel:size().width / 2 - 265, slot0.skelPanel:size().height / 2 - 9):scale(2):play("effect_loop")
end

function slot1.rollCb(slot0)
	slot0.have:text(mathEasy.getShortNumber(slot0.gold:read(), 2))

	slot5 = {
		cc.p(0, 0),
		cc.p(0, 0)
	}
	slot6 = "left"

	adapt.oneLinePos(slot0.txt3, {
		slot0.have,
		slot0.icon3
	}, slot5, slot6)

	slot0.totalTimes = 0

	for slot5, slot6 in ipairs(slot0.originData) do
		if slot6.vip <= slot0.vip:read() then
			slot0.totalTimes = slot0.totalTimes + 1
		end
	end

	slot2 = slot0.currId:read()
	slot3 = slot0.originData[math.min(slot2 + 1, #slot0.originData)]

	slot0.max:text(mathEasy.getShortNumber(slot3.rmbRndMax, 2))
	adapt.oneLinePos(slot0.max, slot0.icon1, cc.p(10, 0), "left")

	slot0.needCost = slot3.goldCost

	slot0.cost:text(mathEasy.getShortNumber(slot3.goldCost, 2))
	adapt.oneLinePos(slot0.txt2, {
		slot0.cost,
		slot0.icon2
	}, {
		cc.p(0, 0),
		cc.p(0, 0)
	}, "left")

	slot0.remainTime = slot0.totalTimes - slot2

	slot0.times:text(gLanguageCsv.residueTims .. slot0.totalTimes - slot2 .. "/" .. slot0.totalTimes)
	slot0.txtVipTips:visible(slot3.vip > 0)
	slot0.iconVipTips:visible(slot3.vip > 0)
	slot0.iconVipTips:texture(ui.VIP_ICON[slot3.vip])
	adapt.oneLinePos(slot0.txtVipTips, slot0.iconVipTips, cc.p(0, 0), "right")

	if slot2 >= #slot0.originData then
		slot0.txt:visible(false)
		slot0.txt2:visible(false)
		slot0.txt3:visible(false)
		slot0.max:visible(false)
		slot0.txt4:visible(true)
		slot0.cost:visible(false)
		slot0.have:visible(false)
		slot0.icon2:visible(false)
		slot0.icon3:visible(false)
		slot0.icon1:visible(false)
		slot0.txtVipTips:visible(false)
		slot0.iconVipTips:visible(false)
	end
end

function slot1.originRoll(slot0)
	slot3 = 0
	uv3 = "getNumbers"

	for slot5 = 1, slot3 do
		slot0:setNumber(false, true, slot5, slot0:getNumbers(slot3))
	end

	uv4 = "getNumbers"

	slot0:numberRoll(slot4, 0, 0.1)
end

function slot1.getNumbers(slot0, slot1)
	slot2 = {}
	uv3 = "table"

	for slot6 = slot3, 1, -1 do
		table.insert(slot2, math.floor(slot1 / 10^(slot6 - 1)))

		if slot6 - 1 > 1 then
			slot1 = slot1 % 10^(slot6 - 1)
		else
			table.insert(slot2, slot1 % 10)

			break
		end
	end

	return slot2
end

function slot1.setNumber(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot2 then
		slot0.node:get("list" .. slot3):removeAllChildren()
	end

	if slot1 then
		for slot11 = 1, 12 do
			slot0:addList(slot0.node:get("list" .. slot3), (math.random(0, 9) + slot11) % 10, slot11)
		end

		slot0:addList(slot0.node:get("list" .. slot3), slot4[slot3], slot7 + 1)
		slot0.node:get("list" .. slot3):scrollToPercentVertical(100, slot5, false)
	else
		slot0:addList(slot0.node:get("list" .. slot3), slot4[slot3], 0)
	end
end

function slot1.addList(slot0, slot1, slot2, slot3)
	slot4 = slot0.numItem:clone()

	slot4:setVisible(true)
	slot1:insertCustomItem(slot4, slot3)
	slot4:get("num"):text(slot2)
end

function slot1.numberRoll(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0:getNumbers(slot2)

	if slot3 == 0.1 then
		performWithDelay(slot0, function ()
			uv1 = "setNumber"

			for slot3 = 1, slot1 do
				uv4 = "mask"
				uv9 = "hide"

				slot4:setNumber(true, false, slot3, slot9, 1)
			end

			uv0 = "mask"

			slot0.mask:hide()
		end, 0.016666666666666666)
	else
		slot6 = slot0.mask
		slot7 = slot6

		slot6.show(slot7)

		uv7 = "getNumbers"

		for slot9 = 1, slot7 do
			slot0:setNumber(true, false, slot9, slot5, slot3)
		end

		performWithDelay(slot0, function ()
			uv0 = "leftDatas"

			if slot0 then
				uv0 = "set"
				slot0 = slot0.leftDatas
				slot0 = slot0.set
				uv2 = "leftDatas"
				slot2 = slot2.view.luckycat_message_gold

				slot0(slot0, slot2, true)

				uv0 = "set"
				slot0 = slot0.originRoll

				slot0(slot0)

				uv0 = "set"

				slot0:rollCb()

				uv2 = "leftDatas"

				gGameUI:showGainDisplay(slot2)
			end
		end, slot3 + 0.6)
	end
end

function slot1.onSure(slot0, slot1)
	if slot0.gold:read() < slot0.needCost and slot0.remainTime > 0 then
		slot0.curState:set(true)
		uiEasy.showDialog("gold")

		return
	end

	if slot0.totalTimes < #slot0.originData and slot0.remainTime == 0 then
		slot0.curState:set(true)
		uiEasy.showDialog("vip", {
			titleName = gLanguageCsv.luckGoldTip,
			content = {
				gLanguageCsv.luckGoldMax,
				string.format(gLanguageCsv.commonVipIncrease, gLanguageCsv.luckGoldTip)
			}
		})

		return
	end

	if slot0.currId:read() >= #slot0.originData then
		gGameUI:showTip(gLanguageCsv.luckGoldMax)

		return
	end

	slot0.curState:set(false)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		slot1, slot2 = next(slot0.view.result)
		uv3 = "next"
		slot3 = slot3.numberRoll
		uv5 = "view"
		uv7 = "result"

		slot3(slot3, slot5, slot2, slot7, slot0)

		uv3 = "next"

		slot3.wheelSkel:play("effect")

		slot3 = cc.DelayTime
		slot4 = slot3
		uv4 = "next"

		slot4:runAction(cc.Sequence:create(slot3.create(slot4, 2), cc.CallFunc:create(function ()
			uv0 = "wheelSkel"

			slot0.wheelSkel:play("effect_loop")
		end)))
	end, slot0.activityId)
end

return slot1
