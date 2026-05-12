function slot0(slot0, slot1, slot2, slot3)
	return widget.addAnimationByKey(slot0, "effect/jiesuanjiemian.skel", slot1, slot2, slot3):xy(slot0:width() / 2, slot0:height() / 2)
end

slot1 = class("OnlineGiftGainView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "online_gift_gain.json"
slot1.RESOURCE_BINDING = {
	["rewardPanel.list"] = "list",
	bg = "bg",
	item = "item",
	rewardPanel = "rewardPanel",
	label = "label"
}

function slot1.onCreate(slot0, slot1)
	audio.playEffectWithWeekBGM("zaixianlibao.mp3")

	slot2 = slot0:getResourceNode()

	widget.addAnimationByKey(slot2, "hupazaixianlibao/hupazaixianlibao.skel", "hupazaixianlibao", "effect", 1):anchorPoint(cc.p(0.5, 0.5)):scale(2):xy(slot2:width() / 2, slot2:height() / 2)
	performWithDelay(slot0, function ()
		uv0 = "rewardPanel"
		slot0 = slot0.rewardPanel
		slot0 = slot0.setVisible

		slot0(slot0, true)

		uv0 = "rewardPanel"
		slot0 = slot0.label
		slot0 = slot0.setVisible
		slot2 = true

		slot0(slot0, slot2)

		uv0 = "rewardPanel"
		uv2 = "setVisible"
		slot0.data = dataEasy.mergeRawDate(slot2)
		uv0 = "rewardPanel"
		slot0.intervalTime = 0.25
		uv0 = "rewardPanel"
		slot0 = slot0.list
		slot0 = slot0.setScrollBarEnabled

		slot0(slot0, false)

		uv0 = "rewardPanel"
		slot0 = slot0.list
		slot1 = slot0
		uv1 = "rewardPanel"
		slot1 = slot1.item
		slot2 = slot1
		uv2 = "rewardPanel"
		slot2 = #slot2.data
		uv3 = "rewardPanel"
		slot3 = slot3.list
		slot4 = slot3
		uv4 = "rewardPanel"
		slot5 = (slot0.size(slot1).width - slot1.size(slot2).width * slot2 - (slot2 - 1) * slot3.getItemsMargin(slot4)) / 2
		uv5 = "rewardPanel"
		slot5 = slot5.list
		slot6 = slot5
		uv6 = "rewardPanel"
		slot6 = slot6.list
		slot6 = slot6.xy

		slot6(slot6, slot4.list:x() + slot5, slot5.y(slot6))

		uv6 = "rewardPanel"

		slot6:showItem(1)
	end, 1)
	performWithDelay(slot0, function ()
		uv0 = "bg"
		uv3 = "bg"
		uv4 = "bg"

		slot0.bg:onClick(functools.partial(slot3.onClose, slot4))
	end, 2)
end

function slot1.showItem(slot0, slot1)
	if slot1 > #slot0.data then
		return
	end

	slot2 = slot0.item:clone()

	slot2:show()

	slot3 = slot0.data[slot1]
	slot4 = slot3.key
	slot6 = {
		class = "icon_key",
		props = {
			data = {
				key = slot4,
				num = slot3.num
			},
			specialKey = {
				maxLimit = true
			},
			onNode = function (slot0)
				slot0:hide():z(3)
				transition.executeSequence(slot0, true):delay(0.5):func(function ()
					uv0 = "show"

					slot0:show()
				end):done()
			end
		}
	}
	slot7 = 1

	if slot4 ~= "card" then
		slot7 = dataEasy.getCfgByKey(slot4).quality
	end

	uv8 = "data"

	slot8(slot2, "djhd", "djhd" .. slot7, 4)

	uv8 = "data"

	slot8(slot2, "djhd_hou", "djhd_hou" .. slot7, 2)
	bind.extend(slot0, slot2, slot6)
	slot0.list:pushBackCustomItem(slot2)
	transition.executeSequence(slot0.list, true):delay(slot0.intervalTime):func(function ()
		uv0 = "showItem"
		uv2 = "showItem"

		slot0:showItem(slot2 + 1)
	end):done()
end

return slot1
