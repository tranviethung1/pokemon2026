slot0 = class("scale9Sprite", cc.load("mvc").ViewBase)
slot0.defaultProps = {
	maskImg = "common/login_mask.png",
	tileImg = "common/login_bg_dw.png"
}

function slot0.initExtend(slot0)
	slot1 = slot0:getContentSize()
	slot3 = cc.Sprite:create(slot0.tileImg)

	slot3:getTexture():setTexParameters(gl.LINEAR, gl.LINEAR, gl.REPEAT, gl.REPEAT)
	slot3:setTextureRect(cc.rect(0, 0, slot1.width, slot1.height))
	slot3:alignCenter(slot1)

	slot4 = ccui.Scale9Sprite:create()

	slot4:initWithFile(slot0:getCapInsets(), slot0.maskImg)
	slot4:size(slot1):alignCenter(slot1)
	cc.ClippingNode:create(slot4):setAlphaThreshold(0.01):size(slot1):alignCenter(slot1):add(slot3):addTo(slot0)

	return slot0
end

return slot0
