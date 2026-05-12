slot0 = class("QixiCollectView", Dialog)
slot1 = {
	noReach = 2,
	received = 3,
	canReceive = 1
}
slot0.RESOURCE_FILENAME = "qixi_collect.json"
slot0.RESOURCE_BINDING = {
	scroll = "rewardScroll",
	["scroll.loadingBar"] = "loadingBar",
	item = "item",
	["scroll.barBg"] = "barBg"
}

function slot0.onCreate(slot0, slot1)
	slot0.activityId = slot1
	slot0.hasReach = 0

	slot0:initModel()

	slot0.isFirstUpdate = true
	slot2 = csv.yunying.yyhuodong[slot1].huodongID

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "collectData"
		slot2 = slot1[slot2] or {}
		uv3 = "info"
		slot3.collectData = {}
		slot4 = slot2.stamps or {}
		slot5 = (slot2.info or {}).score or 0

		for slot9, slot10 in orderCsvPairs(csv.yunying.qixi_collect) do
			uv11 = "stamps"

			if slot11 == slot10.huodongID then
				uv11 = "score"
				slot11 = slot11.noReach

				if slot4[slot9] then
					if slot4[slot9] == 1 then
						uv12 = "score"
						slot11 = slot12.canReceive
					else
						uv12 = "score"
						slot11 = slot12.received
					end
				end

				uv13 = "info"

				table.insert(slot13.collectData, {
					targetItemNum = slot10.targetItemNum,
					award = slot10.award,
					csvId = slot9,
					state = slot11
				})
			end
		end

		uv6 = "info"

		slot6:resetScroll()
	end)
	slot0.rewardScroll:setInertiaScrollEnabled(true)
	Dialog.onCreate(slot0, {
		noBlackLayer = true,
		clearFast = true,
		clickClose = true
	})
end

function slot0.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot0.resetScroll(slot0)
	for slot4 = 1, math.huge do
		if slot0.rewardScroll:get("item" .. slot4) then
			slot0.rewardScroll:removeChildByName("item" .. slot4)
		else
			break
		end
	end

	slot0:buildScroll()
end

function slot0.getScrollPercent(slot0)
	slot1 = 0

	if slot0.isFirstUpdate then
		slot2 = itertools.size(slot0.collectData)
		slot3 = 0
		slot4 = 1

		for slot8, slot9 in ipairs(slot0.collectData) do
			uv11 = "isFirstUpdate"

			if slot9.state == slot11.canReceive then
				slot3 = slot8

				break
			else
				uv11 = "isFirstUpdate"

				if slot9.state == slot11.received then
					slot4 = slot4 + 1
				end
			end
		end

		slot4 = cc.clampf(slot4, 1, slot2)

		if slot3 ~= 0 then
			slot1 = cc.clampf(slot0.rewardScroll:get("item" .. slot3):x() / (slot0.rewardScroll:getInnerContainer():size().width - slot0.rewardScroll:size().width) * 100, 0, 100)
		elseif slot4 == slot2 then
			slot1 = 100
		else
			slot1 = cc.clampf(slot0.rewardScroll:get("item" .. slot4):x() / (slot5.width - slot6) * 100, 0, 100)
		end
	else
		slot1 = slot0.rewardScroll:getScrolledPercentHorizontal()
	end

	slot0.isFirstUpdate = false

	return slot1
end

function slot0.buildScroll(slot0)
	slot0.rewardScroll:setScrollBarEnabled(false)

	slot4 = itertools.size(slot0.collectData)
	slot5 = slot0.item:width() * slot4 + (slot4 - 1) * 20
	slot9 = slot0.rewardScroll:size().height

	slot0.rewardScroll:getInnerContainer():size(slot5, slot9)
	slot0.loadingBar:width(slot5 - 250):x(slot5 / 2 - 125)

	for slot9, slot10 in ipairs(slot0.collectData) do
		slot11 = slot0.item:clone()

		slot11:addTo(slot0.rewardScroll):xy((slot1 + 20) * (slot9 - 1), 0):name("item" .. slot9):show()
		slot0:initItemScroll(slot11, slot10)
	end

	slot0.rewardScroll:scrollToPercentHorizontal(slot0:getScrollPercent(), 0.01, false)
	slot0.loadingBar:setPercent(100)
end

function slot0.initItemScroll(slot0, slot1, slot2)
	slot3 = slot1:multiget("list", "receiveBtn", "text", "received", "bg")

	slot3.list:adaptTouchEnabled()
	slot3.list:setScrollBarEnabled(false)
	slot3.text:text(slot2.targetItemNum)

	slot6 = itertools.size(slot2.award)
	slot7 = cc.clampf(2 * 10 + slot6 * 160 + (slot6 - 1) * 5, 200, slot1:width())

	slot3.bg:width(slot7)
	slot3.list:width(slot7 - 30):x(slot3.bg:x() - slot3.bg:width() / 2 + 15)

	slot11 = slot2.award

	uiEasy.createItemsToList(slot0, slot3.list, slot11, {
		scale = 0.8,
		onAfterBuild = function (slot0)
			slot0:setItemAlignCenter()
		end
	})

	uv11 = "multiget"

	slot3.receiveBtn:visible(slot2.state ~= slot11.received)

	uv11 = "multiget"

	slot3.received:visible(slot2.state == slot11.received)

	slot10 = "label"
	uv10 = "multiget"

	if slot2.state == slot10.canReceive then
		uiEasy.setBtnShader(slot3.receiveBtn, slot3.receiveBtn:get(slot10), 1)
		bind.touch(slot0, slot3.receiveBtn, {
			methods = {
				ended = function ()
					uv4 = "gGameApp"
					uv5 = "requestServer"

					gGameApp:requestServer("/game/yy/award/get", function (slot0)
						gGameUI:showGainDisplay(slot0)
					end, slot4.activityId, slot5.csvId)
				end
			}
		})
	else
		uv10 = "multiget"

		if slot2.state == slot10.noReach then
			uiEasy.setBtnShader(slot3.receiveBtn, slot8, 2)
			slot8:text(gLanguageCsv.notReach)
		end
	end
end

return slot0
