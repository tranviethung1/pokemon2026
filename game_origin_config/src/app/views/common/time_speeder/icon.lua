slot0 = class("TimeSpeederIcon", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "common_time_speeder_icon.json"
slot0.RESOURCE_BINDING = {
	icon = "icon"
}

function slot0.onCreate(slot0)
	slot0:enableSchedule()
	slot0.icon:onTouch(functools.partial(slot0.iconTouch, slot0))
	performWithDelay(slot0, function ()
		slot2 = "timeSpeederPos"
		uv2 = "display"
		slot3 = slot2
		uv3 = "display"

		slot3.icon:xy(slot2.getEdgePos(slot3, userDefault.getForeverLocalKey(slot2, {
			x = display.sizeInViewRect.width * 2 / 5,
			y = display.sizeInViewRect.height * 3 / 5
		}, {
			rawKey = true
		})))
	end, 0)
end

function slot0.iconTouch(slot0, slot1)
	if slot1.name == "began" then
		slot0.touchBeganPos = slot1
		slot0.isMoved = false

		slot0.icon:scale(1.2)
		slot0.icon:xy(slot1)
		slot0:stopAllActions()
		slot0.icon:stopAllActions()
		slot0.icon:unscheduleUpdate()
	elseif slot1.name == "moved" then
		slot0.icon:scale(1.2)

		if slot1.x < display.sizeInViewRect.x then
			slot1.x = display.sizeInViewRect.x
		elseif slot1.x > display.sizeInViewRect.x + display.sizeInViewRect.width then
			slot1.x = display.sizeInViewRect.x + display.sizeInViewRect.width
		end

		if slot1.y < display.sizeInViewRect.y then
			slot1.y = display.sizeInViewRect.y
		elseif slot1.y > display.sizeInViewRect.y + display.sizeInViewRect.height then
			slot1.y = display.sizeInViewRect.y + display.sizeInViewRect.height
		end

		if ui.TOUCH_MOVED_THRESHOLD < math.abs(slot1.x - slot0.touchBeganPos.x) or ui.TOUCH_MOVED_THRESHOLD < math.abs(slot1.y - slot0.touchBeganPos.y) then
			slot0.isMoved = true
		end

		slot0.icon:xy(slot1)
	elseif slot1.name == "ended" or slot1.name == "cancelled" then
		slot0.touchEndTime = socket.gettime()

		slot0.icon:scheduleUpdate(function (slot0)
			uv2 = "socket"

			if socket.gettime() - slot2.touchEndTime >= 2 then
				uv1 = "socket"
				uv3 = "gettime"

				slot1:iconMoveToEdge(slot3)

				return false
			end
		end)

		if slot1.name == "ended" and not slot0.isMoved then
			slot0:showTimeSpeeder()
		end
	end
end

function slot0.getEdgePos(slot0, slot1)
	for slot7, slot8 in ipairs({
		{
			l = slot1.x - display.sizeInViewRect.x,
			pos = {
				x = display.sizeInViewRect.x,
				y = slot1.y
			},
			prePos = {
				x = display.sizeInViewRect.x + 300,
				y = slot1.y
			}
		},
		{
			l = display.sizeInViewRect.x + display.sizeInViewRect.width - slot1.x,
			pos = {
				x = display.sizeInViewRect.x + display.sizeInViewRect.width,
				y = slot1.y
			},
			prePos = {
				x = display.sizeInViewRect.x + display.sizeInViewRect.width - 300,
				y = slot1.y
			}
		},
		{
			l = slot1.y - display.sizeInViewRect.y,
			pos = {
				x = slot1.x,
				y = display.sizeInViewRect.y
			},
			prePos = {
				x = slot1.x,
				y = display.sizeInViewRect.y + 200
			}
		},
		{
			l = display.sizeInViewRect.y + display.sizeInViewRect.height - slot1.y,
			pos = {
				x = slot1.x,
				y = display.sizeInViewRect.y + display.sizeInViewRect.height
			},
			prePos = {
				x = slot1.x,
				y = display.sizeInViewRect.y + display.sizeInViewRect.height - 200
			}
		}
	}) do
		if slot8.l < slot2[1].l then
			slot3 = slot7
		end
	end

	return slot2[slot3].pos, slot2[slot3].prePos
end

function slot0.iconMoveToEdge(slot0, slot1)
	slot0:stopAllActions()
	slot0.icon:stopAllActions()
	slot0.icon:unscheduleUpdate()

	slot2 = slot0:getEdgePos(slot1)

	slot0.icon:runAction(cc.EaseSineInOut:create(cc.MoveTo:create(0.3 * gGameUI:getTimeScale(true), slot2)))
	slot0.icon:scale(1)
	userDefault.setForeverLocalKey("timeSpeederPos", {
		x = slot2.x,
		y = slot2.y
	}, {
		rawKey = true
	})
end

function slot0.showAni(slot0)
	slot0:stopAllActions()
	slot0.icon:stopAllActions()
	slot0.icon:unscheduleUpdate()

	slot1, slot2 = slot0:getEdgePos(cc.p(slot0.icon:xy()))

	slot0.icon:xy(slot2):show()
	performWithDelay(slot0, function ()
		uv0 = "iconMoveToEdge"
		uv2 = "iconMoveToEdge"

		slot0:iconMoveToEdge(slot2)
	end, 1 * gGameUI:getTimeScale(true))
end

function slot0.showTimeSpeeder(slot0)
	if gGameUI.timeSpeederManager.isYield() then
		gGameUI:showTip(gLanguageCsv.speedUpForbidden)

		return
	end

	gGameUI:showTimeSpeeder()
end

return slot0
