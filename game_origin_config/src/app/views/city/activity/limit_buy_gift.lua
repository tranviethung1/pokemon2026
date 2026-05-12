slot0 = {
	BOUGHT = 2,
	CANBUY = 1,
	TIMEOUT = 3
}
slot1 = require("app.views.city.activity.view")
slot2 = class("ActivityLimitBuyGiftView", Dialog)
slot2.RESOURCE_FILENAME = "activity_limit_buy_gift.json"
slot2.RESOURCE_BINDING = {
	["leftPanel.item"] = "item",
	["rightPanel.bg"] = "rightBg",
	["rightPanel.list"] = "rewardList",
	["rightPanel.countPanel.countTimeBg"] = "countTimeBg",
	["rightPanel.countPanel"] = "countPanel",
	["rightPanel.lv"] = "lv",
	["rightPanel.listBg"] = "rewardListBg",
	["rightPanel.countPanel.countTime"] = "countTime",
	["rightPanel.btnBuy.price"] = "price",
	["rightPanel.countPanel.countTimeNode"] = "countTimeNode",
	rightPanel = "rightPanel",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["leftPanel.list"] = {
		varname = "tabList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 8,
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:get("btn")

					slot4:get("selected"):visible(slot3.select)
					slot4:get("normal"):visible(not slot3.select)

					slot5 = adapt.setTextScaleWithWidth

					slot5(slot4:get("name"), slot3.cfg.name, 330)

					uv5 = "get"

					slot5.setCountdown(slot0, slot4:get("countTime"), {
						info = slot3,
						tag = slot3.csvId,
						cb = function ()
							uv0 = "state"
							uv1 = "BOUGHT"

							if slot0.state ~= slot1.BOUGHT then
								uv0 = "state"
								uv1 = "BOUGHT"
								slot0.state = slot1.TIMEOUT
							end
						end
					})
					slot4:setTouchEnabled(not slot3.select)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabClick"),
				afterBuild = bindHelper.self("onAfterBuild")
			}
		}
	},
	["rightPanel.btnBuy"] = {
		varname = "btnBuy",
		binds = {
			event = "touch",
			clicksafe = true,
			methods = {
				ended = bindHelper.self("onBtnBuy")
			}
		}
	}
}

function slot2.onCreate(slot0)
	slot0:enableSchedule()
	slot0:initModel()

	slot0.datas = {}
	slot5 = "yy_open"

	for slot5, slot6 in ipairs(gGameModel.role:read(slot5)) do
		if csv.yunying.yyhuodong[slot6].type == game.YYHUODONG_TYPE_ENUM_TABLE.limitBuyGift then
			for slot11, slot12 in orderCsvPairs(csv.yunying.limitbuygift) do
				if slot12.huodongID == slot7.huodongID then
					if slot1[slot11] then
						printWarn("yyId(%s) yunying.limitbuygift k(%d) is already in yyId(%s)", slot6, slot11, slot1[slot11].yyId)
					else
						slot1[slot11] = {
							cfg = slot12,
							csvId = slot11,
							yyId = slot6
						}
					end
				end
			end
		end
	end

	slot0.tabDatas = idlers.newWithMap({})
	slot0.clientBuyTimes = idler.new(true)
	slot0.showTab = idler.new(1)
	slot2 = table.deepcopy(slot0.yyhuodongs:read(), true)

	idlereasy.any({
		slot0.yyhuodongs,
		slot0.clientBuyTimes
	}, function (slot0, slot1)
		uv1 = "unSchedule"
		uv2 = "pairs"
		slot4 = 9999999

		slot2:unSchedule(slot4)

		slot2 = {}
		uv4 = "yyId"

		for slot6, slot7 in pairs(slot4) do
			if slot7.state then
				slot7.startTime = slot8.valinfo[slot7.csvId].time

				if dataEasy.getPayClientBuyTimes("directBuyData", slot7.yyId, slot7.csvId, 1 - (slot1[slot7.yyId].stamps[slot7.csvId] or 1)) > 0 then
					uv11 = "stamps"
					slot7.state = slot11.BOUGHT
				end

				table.insert(slot2, slot7)
			elseif slot8.valinfo[slot7.csvId] and time.getTime() - slot8.valinfo[slot7.csvId].time < slot7.cfg.duration * 60 and slot10 == 0 then
				uv11 = "stamps"
				slot7.state = slot11.CANBUY
				slot7.startTime = slot8.valinfo[slot7.csvId].time

				table.insert(slot2, slot7)
			end
		end

		slot3 = table.sort

		slot3(slot2, function (slot0, slot1)
			if slot0.cfg.sort == slot1.cfg.sort then
				return slot0.csvId < slot1.csvId
			end

			return slot0.cfg.sort < slot1.cfg.sort
		end)

		uv3 = "pairs"
		slot3 = slot3.tabDatas
		slot3 = slot3.update

		slot3(slot3, slot2)

		uv3 = "pairs"

		slot3.showTab:notify()
	end)

	slot3, slot4 = slot0.rewardList:xy()

	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "tabDatas"

		if slot2.tabDatas:size() <= 0 then
			uv2 = "tabDatas"

			slot2.rightPanel:hide()

			return
		end

		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot0)
		slot2.select = true
		uv2 = "tabDatas"

		if slot2.tabDatas:atproxy(slot0) then
			uv2 = "tabDatas"
			uv3 = "tabDatas"
			slot2.currentInfo = slot3.tabDatas:atproxy(slot0)
		end

		slot3 = uiEasy.createItemsToList
		uv4 = "tabDatas"
		uv5 = "tabDatas"
		slot5 = slot5.rewardList
		uv6 = "tabDatas"
		slot6 = slot6.currentInfo.cfg.item

		slot3(slot4, slot5, slot6, {
			margin = 11,
			onAfterBuild = function ()
				uv0 = "rewardList"

				slot0.rewardList:setItemAlignCenter()
			end,
			onNode = function (slot0)
				uv2 = "itertools"
				slot2 = slot2.currentInfo.cfg.item
				slot1 = itertools.size(slot2)
				uv2 = "size"
				slot3 = slot0:width() * slot1
				uv3 = "itertools"
				slot3 = slot3.rewardListBg
				slot4 = slot3
				uv4 = "itertools"

				slot4.rewardListBg:size(slot2 * (slot1 + 1) + slot3, slot3.height(slot4))
			end
		})

		uv3 = "tabDatas"
		slot3 = slot3.rightBg
		slot3 = slot3.texture
		uv5 = "tabDatas"
		slot5 = slot5.currentInfo.cfg.bgPath

		slot3(slot3, slot5)

		uv3 = "tabDatas"
		slot3 = slot3.countTimeBg
		slot3 = slot3.texture
		uv5 = "tabDatas"
		slot5 = slot5.currentInfo.cfg.countPath

		slot3(slot3, slot5)

		uv3 = "tabDatas"
		slot3 = slot3.countPanel
		slot3 = slot3.visible
		uv5 = "tabDatas"
		uv6 = "size"
		slot5 = slot5.currentInfo.state ~= slot6.BOUGHT

		slot3(slot3, slot5)

		uv3 = "tabDatas"
		slot3 = slot3.setCountdown
		uv5 = "tabDatas"
		uv7 = "tabDatas"

		slot3(slot3, slot5.countTime, {
			tag = 9999999,
			info = slot7.currentInfo
		})

		uv3 = "tabDatas"

		if slot3.currentInfo.cfg.targetType1 == 1 then
			uv3 = "tabDatas"
			slot3 = slot3.lv
			slot3 = slot3.show

			slot3(slot3)

			uv3 = "tabDatas"
			slot3 = slot3.lv
			slot3 = slot3.text
			uv5 = "tabDatas"
			slot5 = slot5.currentInfo.cfg.targetArg1_1

			slot3(slot3, slot5)

			uv3 = "tabDatas"
			uv5 = "tabDatas"

			slot3.lv:scale(slot5.currentInfo.cfg.targetArg1_1 >= 100 and 0.65 or 1)
		else
			uv3 = "tabDatas"

			slot3.lv:hide()
		end

		uv3 = "tabDatas"
		slot3 = slot3.btnBuy
		slot3 = slot3.setTouchEnabled
		uv5 = "tabDatas"
		uv6 = "size"

		slot3(slot3, slot5.currentInfo.state ~= slot6.BOUGHT)

		uv3 = "tabDatas"
		slot5 = "bgMask"
		slot3 = slot3.btnBuy:get(slot5)
		slot3 = slot3.visible
		uv5 = "tabDatas"
		uv6 = "size"

		slot3(slot3, slot5.currentInfo.state == slot6.BOUGHT)

		uv3 = "tabDatas"
		slot5 = "imgTips"
		uv5 = "tabDatas"
		uv6 = "size"

		slot3.btnBuy:get(slot5):texture(slot5.currentInfo.state == slot6.BOUGHT and "activity/limit_buy_gift/txt_ysq.png" or "activity/limit_buy_gift/txt_ljqg.png")

		for slot7, slot8 in orderCsvPairs(csv.recharges) do
			uv9 = "tabDatas"

			if slot7 == slot9.currentInfo.cfg.rechargeID then
				uv9 = "tabDatas"

				slot9.price:text(string.format(gLanguageCsv.symbolMoney, slot8.rmbDisplay))

				break
			end
		end
	end)
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot2.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot2.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot2.checkCountTime(slot0, slot1, slot2)
	slot3 = time.getTime()

	if not slot1 then
		return false
	end

	if slot3 < slot1 then
		return false
	end

	if slot2 * 60 + slot1 - slot3 <= 0 then
		return false
	end

	return slot4
end

function slot2.onBtnBuy(slot0)
	uv2 = "currentInfo"

	if slot0.currentInfo.state == slot2.BOUGHT then
		-- Nothing
	else
		uv2 = "currentInfo"

		if slot0.currentInfo.state == slot2.TIMEOUT then
			gGameUI:showTip(gLanguageCsv.giftOutOfDate)
		else
			gGameApp:payDirect(slot0, {
				buyTimes = 0,
				rechargeId = slot0.currentInfo.cfg.rechargeID,
				yyID = slot0.currentInfo.yyId,
				csvID = slot0.currentInfo.csvId,
				name = slot0.currentInfo.cfg.name
			}, slot0.clientBuyTimes):doit(function ()
				uv0 = "datas"
				uv1 = "datas"
				slot1 = slot1.currentInfo.csvId
				slot0 = slot0.datas[slot1]
				uv1 = "currentInfo"
				slot1 = slot1.BOUGHT
				slot0.state = slot1
				uv0 = "datas"
				slot0 = slot0.currentInfo
				uv1 = "currentInfo"
				slot0.state = slot1.BOUGHT
				uv0 = "datas"
				slot0 = slot0.unSchedule

				slot0(slot0, 9999999)

				uv0 = "datas"
				slot0 = slot0.countTime
				slot0 = slot0.text

				slot0(slot0, gLanguageCsv.sellout)

				uv0 = "datas"
				slot0 = slot0.countPanel
				slot0 = slot0.hide

				slot0(slot0)

				uv0 = "datas"
				slot0 = slot0.btnBuy
				slot0 = slot0.setTouchEnabled

				slot0(slot0, false)

				uv0 = "datas"
				slot0 = slot0.btnBuy:get("bgMask")
				slot0 = slot0.show

				slot0(slot0)

				uv0 = "datas"

				slot0.btnBuy:get("imgTips"):texture("activity/limit_buy_gift/txt_ysq.png")
			end)
		end
	end
end

function slot2.onAfterBuild(slot0)
	if slot0.tabDatas:size() <= 0 then
		return
	end

	slot0:setCountdown(slot0.countTime, {
		tag = 9999999,
		info = slot0.currentInfo
	})
end

function slot2.setCountdown(slot0, slot1, slot2)
	slot3 = slot0.enableSchedule

	slot3(slot0)

	uv3 = "enableSchedule"

	slot0:unSchedule(slot2.tag)

	if slot3:checkCountTime(slot2.info.startTime, slot2.info.cfg.duration) then
		uv5 = "checkCountTime"

		if slot2.info.state ~= slot5.CANBUY then
			slot5 = slot1

			slot1.text(slot5, time.getCutDown(0).str)

			uv5 = "checkCountTime"

			if slot2.info.state == slot5.BOUGHT then
				slot1:text(gLanguageCsv.sellout)
			end

			if slot2.cb then
				slot2.cb()
			end

			return
		end
	end

	slot0:schedule(function ()
		uv0 = "cfg"
		uv1 = "cfg"
		slot0 = slot0.info.cfg.duration * 60 + slot1.info.startTime - time.getTime()
		uv0 = 60
		uv0 = "duration"
		slot0 = slot0.text
		uv3 = "info"

		slot0(slot0, time.getCutDown(slot3).str)

		uv0 = "info"

		if slot0 <= 0 then
			uv0 = "startTime"
			uv1 = "time"
			uv2 = "duration"
			uv3 = "cfg"

			slot0.setCountdown(slot1, slot2, slot3)
		end
	end, 1, 0, slot2.tag)
end

return slot2
