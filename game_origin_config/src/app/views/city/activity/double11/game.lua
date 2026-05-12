slot1 = class("Double11Game", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "double_11_game.json"
slot1.RESOURCE_BINDING = {
	redPacketItem = "redPacketItem",
	panelCountDown = "panelCountDown",
	panelGame = {
		varname = "panelGame",
		binds = {
			res = "shuang11/diaohongbao.skel",
			name = "effectDiaohongbao",
			action = "effect_loop",
			event = "animation",
			pos = {
				x = 1560,
				y = 720
			}
		}
	},
	["panelGame.textCountDown"] = {
		varname = "textCountDown",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 8,
					color = cc.c3b(148, 31, 36)
				}
			}
		}
	},
	["panelGame.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("count"),
			method = function (slot0)
				return "x" .. slot0
			end
		}
	}
}
slot1.RESOURCE_STYLES = {
	full = true,
	disableTimeSpeeder = true
}

function slot1.onCreate(slot0, slot1, slot2)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		title = gLanguageCsv.double11,
		subTitle = gLanguageCsv.double11Subtitle
	})
	slot0.panelCountDown:globalZ(1)

	slot0.activityId = slot1
	slot0.nowIndex = slot2

	slot0:startCount()

	slot0.count = idler.new(0)
	slot0.gaming = false

	slot0:initUI()
end

function slot1.initUI(slot0)
	slot1 = {
		[slot6.game] = slot6.itemID
	}

	for slot5, slot6 in orderCsvPairs(csv.yunying.double11_game) do
		if slot6.huodongID == csv.yunying.yyhuodong[slot0.activityId].huodongID then
			-- Nothing
		end
	end

	slot0.panelGame:get("imgRedPacket"):texture(dataEasy.getCfgByKey(slot1[slot0.nowIndex]).icon)
	slot0.redPacketItem:get("imgRedPacket"):texture(dataEasy.getCfgByKey(slot1[slot0.nowIndex]).icon)
end

function slot1.gameStart(slot0)
	gGameApp:requestServerCustom("/game/yy/double11/game/start"):params(slot0.activityId):onErrClose(function ()
		uv0 = "gaming"
		slot0.gaming = false
		uv0 = "gaming"

		slot0:onClose()
	end):doit(function (slot0)
		uv1 = "gaming"
		slot1.gaming = true
		uv1 = "gaming"
		slot1 = slot1.panelCountDown
		slot1 = slot1.hide

		slot1(slot1)

		uv1 = "gaming"
		slot1 = slot1.panelGame
		slot1 = slot1.show

		slot1(slot1)

		uv1 = "gaming"
		slot1 = slot1.initCountDown

		slot1(slot1)

		uv1 = "gaming"

		slot1:initRedPacketAction()
	end)
end

function slot1.startCount(slot0)
	slot0.panelCountDown:show()
	slot0.panelGame:hide()

	slot1 = 3

	slot0:enableSchedule():schedule(function (slot0)
		uv1 = "panelCountDown"

		if slot1 > 0 then
			uv1 = "get"
			slot3 = "textNum"
			uv3 = "panelCountDown"

			slot1.panelCountDown:get(slot3):text(slot3)

			slot1 = adapt.oneLineCenterPos
			uv3 = "get"
			slot3 = slot3.panelCountDown
			slot4 = slot3
			uv4 = "get"
			slot4 = slot4.panelCountDown:height() / 2
			uv4 = "get"
			slot4 = slot4.panelCountDown:get("textNote")
			uv4 = "get"

			slot1(cc.p(slot3.width(slot4) / 2, slot4), {
				slot4,
				slot4.panelCountDown:get("textNum")
			})

			uv1 = "panelCountDown"
			slot1 = slot1 - 1
			uv0 = 4503599627370498.0
		else
			uv1 = "get"
			slot1 = slot1.panelCountDown
			slot1 = slot1.hide

			slot1(slot1)

			uv1 = "get"

			slot1:gameStart()

			return false
		end
	end, 1, 0, 666)
end

function slot1.initCountDown(slot0)
	bind.extend(slot0, slot0.textCountDown, {
		class = "cutdown_label",
		props = {
			str_key = "short_clock_str",
			endTime = time.getTime() + csv.yunying.yyhuodong[slot0.activityId].paramMap.playTime,
			endFunc = function ()
				uv0 = "gaming"
				slot0.gaming = false
				slot2 = "/game/yy/double11/game/end"
				uv2 = "gaming"
				uv3 = "gaming"

				gGameApp:requestServerCustom(slot2):params(slot2.activityId, slot3.count:read()):onErrClose(function ()
					uv0 = "gaming"
					slot0.gaming = false
					uv0 = "gaming"

					slot0:onClose()
				end):doit(function (slot0)
					uv8 = "gGameUI"
					slot1 = gGameUI:stackUI("common.gain_display", nil, , slot0, {
						cb = slot8:createHandler("onClose")
					})
					slot2 = rich.createByStr(gLanguageCsv.double11GainDisplayTitle, 40):addTo(slot1:getResourceNode(), 10):xy(slot1:getResourceNode():width() / 2, 900):anchorPoint(cc.p(0.5, 0.5))
					slot2 = slot2.formatText

					slot2(slot2)

					uv2 = "gGameUI"

					slot2.panelGame:get("effectDiaohongbao"):hide()
				end)
			end
		}
	})
end

function slot1.initRedPacketAction(slot0)
	slot1 = csv.yunying.yyhuodong[slot0.activityId]

	for slot9 = 1, slot1.paramMap.redPacketMax do
		slot10 = math.random(slot1.paramMap.timeMin, slot1.paramMap.timeMax) / 1000
		slot11 = slot0.redPacketItem:clone():addTo(slot0.panelGame):hide():scale(1.7)
		slot13 = math.random(slot0.panelCountDown:width() / 2 - 800, slot0.panelCountDown:width() / 2 + 800)

		slot11:xy(slot13, 1000)
		slot11:runAction(cc.Sequence:create(cc.DelayTime:create(math.random(1, (slot1.paramMap.playTime - slot10) * 10) / 10), cc.Show:create(), cc.MoveTo:create(slot10, cc.p(slot13, -200)), cc.RemoveSelf:create()))
		slot11:addClickEventListener(function ()
			uv0 = "setTouchEnabled"
			slot0 = slot0.setTouchEnabled

			slot0(slot0, false)

			uv0 = "count"
			slot0 = slot0.count
			slot0 = slot0.modify

			slot0(slot0, function (slot0)
				return true, slot0 + 1
			end, true)

			uv0 = "setTouchEnabled"
			slot0 = slot0:get("imgRedPacket")
			slot1 = slot0

			slot0.hide(slot1)

			uv1 = "setTouchEnabled"
			slot2 = "shuang11/diaohongbao.skel"
			uv2 = "setTouchEnabled"
			slot3 = slot2
			uv3 = "setTouchEnabled"
			slot2 = 0.8
			slot0 = widget.addAnimationByKey(slot1, slot2, "effect1", "effect", 3):xy(slot2.size(slot3).width / 2, slot3:size().height / 2):scale(slot2)
			uv2 = "setTouchEnabled"

			performWithDelay(slot2, function ()
				uv0 = "stopAllActions"
				slot0 = slot0.stopAllActions

				slot0(slot0)

				uv0 = "stopAllActions"

				slot0:removeFromParent()
			end, 0.5)
		end)
	end
end

function slot1.onClose(slot0)
	if not slot0.gaming then
		uv1 = "gaming"

		slot1.onClose(slot0)
	end
end

return slot1
