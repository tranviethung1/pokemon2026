slot0 = require("easy.bind.helper")
slot1 = class("loadingbar", cc.load("mvc").ViewBase)
slot1.defaultProps = {
	alphaThreshold = 0.15
}

function slot1.initExtend(slot0)
	if not slot0.getPercentOrigin then
		slot0.getPercentOrigin = slot0.getPercent
		slot0.setPercentOrigin = slot0.setPercent
		slot0.getPercent = slot0.getPercent_
		slot0.setPercent = slot0.setPercent_
	end

	slot0:removeChildByName("_clip_")

	slot3 = slot0:isScale9Enabled()
	slot4 = slot0:getVirtualRenderer():getTexture()
	slot0._width = slot0:size().width

	slot0:opacity(0)

	if slot0.barImg then
		ccui.Scale9Sprite:create():initWithFile(slot0:getCapInsets(), slot0.barImg)
	else
		slot5:initWithTexture(slot4)
	end

	slot5:setScale9Enabled(slot3)
	slot5:size(slot1):anchorPoint(0, 0):setCapInsets(slot2)

	slot0.img = slot5

	if slot0.maskImg then
		ccui.Scale9Sprite:create():initWithFile(slot2, slot0.maskImg)
	elseif slot0.bar then
		slot6:initWithFile(slot2, slot0.barImg)
	else
		slot6:initWithTexture(slot4)
	end

	slot6:setScale9Enabled(slot3)
	slot6:size(slot1):anchorPoint(0, 0):setCapInsets(slot2)

	slot0.mask = slot6

	cc.ClippingNode:create(slot6):setAlphaThreshold(slot0.alphaThreshold):anchorPoint(0, 0):size(slot1):add(slot5):name("_clip_"):addTo(slot0)

	if not slot0.data then
		if slot0.getPercentOrigin then
			slot0.data = slot0:getPercentOrigin()
		else
			slot0.data = 100
		end
	end

	uv7 = "getPercentOrigin"

	slot7.callOrWhen(slot0.data, function (slot0)
		uv1 = "setPercentShow_"

		slot1:setPercentShow_(slot0)
	end)

	return slot0
end

function slot1.getPercent_(slot0)
	return isIdler(slot0.data) and slot0.data:get_() or slot0.data
end

function slot1.setPercent_(slot0, slot1)
	if isIdler(slot0.data) then
		slot0.data:set(slot1)
	else
		slot0.data = slot1

		slot0:setPercentShow_(slot1)
	end
end

function slot1.setPercentShow_(slot0, slot1)
	slot0.img:x(slot0._width * (slot1 / 100 - 1))
end

function slot1.setContentSize(slot0, slot1, slot2)
	if slot2 then
		cc.Node.setContentSize(slot0, slot1, slot2)
		slot0.img:setContentSize(slot1, slot2)
		slot0.mask:setContentSize(slot1, slot2)

		slot0._width = slot1
	else
		cc.Node.setContentSize(slot0, slot1)
		slot0.img:setContentSize(slot1)
		slot0.mask:setContentSize(slot1)

		slot0._width = slot1.width
	end

	slot0:setPercentShow_(slot0:getPercent_())

	return slot0
end

return slot1
