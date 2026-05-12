globals.Dialog = class("Dialog", cc.load("mvc").ViewBase)
Dialog.__dialog = true

function globals.isDialog(slot0)
	return slot0.__dialog == true
end

slot1 = 0.1

function Dialog.onCreate(slot0, slot1)
	slot1 = slot1 or {}
	slot0._clearFast = slot1.clearFast

	audio.playEffectWithWeekBGM("popupopen.mp3")

	slot2 = slot0:getResourceNode()
	slot3 = slot2:scaleY()

	slot2:setScaleY(0)

	if not slot1.noBlackLayer or slot1.clickClose == true then
		slot4 = cc.c3b(91, 84, 91)
		slot5 = 204

		if slot1.blackType == 1 then
			slot4 = cc.c3b(0, 0, 0)
			slot5 = 180
		end

		if slot1.blackOpacity then
			slot5 = slot1.blackOpacity
		end

		slot0:removeChildByName("__blackLayer__")

		slot6 = ccui.Layout:create()

		slot6:name("__blackLayer__")
		slot6:setContentSize(display.sizeInView)
		slot6:setBackGroundColorType(1)
		slot6:setBackGroundColor(slot4)
		slot6:setOpacity(0)
		slot6:setTouchEnabled(true)
		slot6:setPosition(cc.p(display.board_left, 0))
		slot0:addChild(slot6, -1)
		slot2:setTouchEnabled(false)

		if slot1.clickClose ~= false then
			bind.click(slot0, slot6, {
				method = function ()
					uv0 = "onClose"

					slot0:onClose()
				end
			})
		end

		if not slot1.noBlackLayer then
			slot6:setOpacity(slot5)
		end
	end

	gGameUI:disableTouchDispatch(nil, false)

	slot4 = nil
	slot4 = slot0:onNodeEvent("exit", function ()
		uv0 = "remove"

		if slot0 then
			uv0 = "remove"

			slot0:remove()

			uv0 = nil

			gGameUI:disableTouchDispatch(nil, true)
		end
	end)
	slot7 = "INOUT"
	uv7 = "_clearFast"

	transition.executeSequence(slot2):easeBegin(slot7):scaleYTo(slot7, slot3):easeEnd():func(function ()
		uv0 = "remove"

		if slot0 then
			uv0 = "remove"

			slot0:remove()

			uv0 = nil

			gGameUI:disableTouchDispatch(nil, true)
		end
	end):done()
end

function Dialog.onClose(slot0)
	if slot0:isScheduleEnabled() then
		slot0:unScheduleAll()
	end

	if slot0:isAsyncloadEnabled() then
		slot0:pauseFor()
	end

	if slot0:isMessageEnabled() then
		slot0:unregisterTarget()
	end

	audio.playEffectWithWeekBGM("popupclose.mp3")

	if slot0._clearFast then
		uv1 = "isScheduleEnabled"

		slot1.onClose(slot0)

		return
	end

	gGameApp:pauseRequest()
	gGameUI:disableTouchDispatch(nil, false)

	slot2 = nil
	slot2 = slot0:onNodeEvent("exit", function ()
		uv0 = "remove"

		slot0:remove()
		gGameApp:resumeRequest()
		gGameUI:disableTouchDispatch(nil, true)
	end)
	slot5 = "INOUT"
	uv5 = "unScheduleAll"
	slot5 = slot5 * 0.8
	uv5 = "unScheduleAll"

	transition.executeSequence(slot0:getResourceNode()):easeBegin(slot5):scaleYTo(slot5, 0.3):scaleTo(slot5 * 0.2, 0):easeEnd():delay(0.05):func(function ()
		uv0 = "onClose"
		uv1 = "onClose"

		slot0.onClose(slot1)
	end):done()
end

function Dialog.onCloseFast(slot0)
	slot0._clearFast = true

	slot0:onClose()
end
