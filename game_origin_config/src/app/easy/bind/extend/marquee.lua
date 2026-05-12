slot0 = require("easy.bind.helper")
class("marquee", cc.load("mvc").ViewBase).defaultProps = {}
slot2 = {}
slot3 = {
	[slot9.key] = slot9.sortValue
}
slot4 = {
	[slot9.key] = slot9.waitTime
}

for slot8, slot9 in csvPairs(csv.marquee) do
	-- Nothing
end

function slot1.initExtend(slot0)
	slot0:initMode()
	slot0:removeAllChildren()

	slot1 = ccui.ImageView:create("city/marquee/bg_1.png"):alignCenter(slot0:size()):addTo(slot0, 1, "bg")
	slot2 = ccui.ImageView:create("city/marquee/icon_lb.png"):anchorPoint(0, 0.5):xy((slot0:width() - slot1:width()) / 2 + 40, slot0:height() / 2):addTo(slot0, 2, "voice")
	slot3 = ccui.ListView:create():size(1100, 50):anchorPoint(0, 0.5):xy((slot0:width() - slot1:width()) / 2 + 110, slot0:height() / 2):addTo(slot0, 3, "list")

	slot3:setScrollBarEnabled(false)
	slot3:setOpacity(0)

	slot0.item = ccui.Layout:create():size(slot3:size()):anchorPoint(0, 1):addTo(slot3, 1)
	slot5 = false
	slot0.isPlay = slot5
	uv5 = "initMode"

	slot5.callOrWhen(slot0.marquee, function (slot0)
		uv1 = "marqueeMessages"
		slot1.marqueeMessages = {}
		uv1 = "marqueeMessages"
		slot1.index = 0

		table.sort(slot0, function (slot0, slot1)
			uv2 = "args"
			slot3 = slot0.args.key
			uv3 = "args"

			if slot2[slot3] ~= slot3[slot1.args.key] then
				uv2 = "args"
				slot3 = slot0.args.key
				uv3 = "args"

				return slot3[slot1.args.key] < slot2[slot3]
			end

			if slot0.time == slot1.time then
				return false
			end

			return slot1.time < slot0.time
		end)

		for slot4, slot5 in ipairs(slot0) do
			slot6 = false
			uv8 = "table"

			for slot10, slot11 in ipairs(slot8) do
				if slot11.id == slot5.id then
					slot6 = true
				end
			end

			uv7 = "marqueeMessages"

			if slot7.curMessage then
				uv8 = "marqueeMessages"

				if slot5.id ~= slot8.curMessage.id then
					slot7 = false

					if false then
						slot7 = false
					end
				else
					slot7 = true
				end
			end

			if not slot6 and not slot7 then
				slot9 = slot5.time
				uv9 = "sort"
				uv10 = "marqueeMessages"

				if itertools.size(slot10.marqueeMessages) <= gCommonConfigCsv.marqueeMax and time.getTime() - slot9 < slot9[slot5.args.key] * 60 then
					uv10 = "marqueeMessages"

					table.insert(slot10.marqueeMessages, slot5)
				else
					uv10 = "table"

					table.insert(slot10, slot5)
				end
			end
		end

		uv1 = "marqueeMessages"

		if not slot1.isPlay then
			uv1 = "marqueeMessages"

			slot1:play()
		end
	end)

	return slot0
end

function slot1.initMode(slot0)
	slot0.marquee = gGameModel.messages:getIdler("marquee")
end

function slot1.play(slot0)
	if slot0:getNextMessage() then
		slot3 = slot1.time
		uv3 = "getNextMessage"

		if time.getTime() - slot3 < slot3[slot1.args.key] * 60 then
			slot0:show()
			slot0.item:removeAllChildren()

			slot3 = rich.createByStr(slot1.msg, 40)

			slot3:anchorPoint(0, 0):xy(1100, 0):addTo(slot0.item, 999)
			slot3:formatText()

			slot0.curMessage = slot1
			slot0.isPlay = true
			slot4 = 160
			slot5 = math.min(slot0.item:width() - slot3:width(), 0)
			slot6 = -slot3:width()

			transition.executeSequence(slot3, true):moveTo((slot3:x() - slot5) / slot4, slot5):delay(3):moveTo((slot5 - slot6) / slot4, slot6):func(function ()
				uv0 = "addToAlready"
				slot0 = slot0.addToAlready
				uv2 = "curMessage"

				slot0(slot0, slot2)

				uv0 = "addToAlready"
				slot0.curMessage = nil
				uv0 = "addToAlready"

				slot0:play()
			end):done()
		else
			slot0:addToAlready(slot1)
			slot0:play()
		end
	else
		slot0.isPlay = false

		slot0:hide()
	end
end

function slot1.getNextMessage(slot0)
	slot0.index = slot0.index + 1

	if slot0.marqueeMessages[slot0.index] then
		return slot1
	end

	return false
end

function slot1.addToAlready(slot0, slot1)
	slot2 = false
	uv4 = "pairs"

	for slot6, slot7 in pairs(slot4) do
		if slot7.id == slot1.id then
			slot2 = true
		end
	end

	if not slot2 then
		uv4 = "pairs"

		table.insert(slot4, slot1)
	end
end

return slot1
