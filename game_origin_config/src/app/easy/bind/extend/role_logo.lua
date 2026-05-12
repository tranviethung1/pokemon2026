slot0 = require("easy.bind.helper")
slot1 = class("roleLogo", cc.load("mvc").ViewBase)
slot1.defaultProps = {
	isGray = false
}

function slot1.showLogo(slot0, slot1)
	slot2 = slot0.panel:size()

	if slot0.logoId == nil then
		errorInWindows("role_logo logoId is nil")

		slot0.logoId = gGameModel.role:getIdler("logo")
	end

	slot4 = cc.ClippingNode:create(cc.Sprite:create("common/box/box_head_d.png"):alignCenter(slot2)):setAlphaThreshold(0.1):size(slot2):alignCenter(slot2)
	slot5 = slot4
	slot4 = slot4.addTo(slot5, slot0.panel, 3, "logoClipping")
	uv5 = "panel"

	slot5.callOrWhen(slot0.logoId, function (slot0)
		uv1 = "removeAllChildren"

		slot1:removeAllChildren()

		if slot0 then
			slot4 = dataEasy.getRoleLogoIcon(slot0)
			uv4 = "dataEasy"
			slot4 = 2
			uv4 = "removeAllChildren"
			slot6 = "logo"
			uv6 = "getRoleLogoIcon"

			cache.setShader(ccui.ImageView:create(slot4):alignCenter(slot4):scale(slot4):addTo(slot4, 3, slot6), false, slot6.isGray and "hsl_gray" or "normal")
		end
	end)
end

function slot1.showFrame(slot0)
	slot2 = ccui.ImageView:create():alignCenter(slot0.panel:size()):addTo(slot0.panel, 4, "frame")

	if slot0.frameId == nil then
		errorInWindows("role_logo frameId is nil")

		slot0.frameId = gGameModel.role:getIdler("frame")
	end

	uv3 = "panel"

	slot3.callOrWhen(slot0.frameId, function (slot0)
		uv1 = "panel"

		slot1.panel:removeChildByName("frameSpine")

		uv2 = "removeChildByName"
		uv4 = "panel"

		cache.setShader(slot2, false, slot4.isGray and "hsl_gray" or "normal")

		if slot0 == false then
			uv1 = "removeChildByName"

			slot1:hide()
		elseif string.find(dataEasy.getRoleFrameIcon(slot0), ".skel") then
			uv3 = "removeChildByName"
			slot4 = slot3

			slot3.hide(slot4)

			uv4 = "panel"
			slot5 = slot1
			slot3 = widget.addAnimationByKey(slot4.panel, slot5, "frameSpine", "effect_loop", 4)
			slot4 = slot3
			uv5 = "frameSpine"
			slot3 = slot3.alignCenter(slot4, slot5)
			uv4 = "panel"

			if slot4.isGray then
				slot3:setTimeScale(0)
				cache.setShader(slot3, false, "hsl_gray")
			end
		else
			uv3 = "removeChildByName"

			slot3:texture(slot1):show()
		end
	end)

	return slot2
end

function slot1.showLevel(slot0)
	slot1 = slot0.panel:size()
	slot2 = ccui.Scale9Sprite:create()

	slot2:initWithFile(cc.rect(25, 23, 1, 1), "common/box/box_djd.png")
	slot2:size(cc.size(72, 46)):align(cc.p(0.5, 0.5), 15, slot1.height - 5):addTo(slot0.panel, 5, "levelImg")

	slot3 = label.create(0, {
		fontSize = 40,
		color = ui.COLORS.NORMAL.WHITE
	}):xy(15, slot1.height - 5):setHorizontalAlignment(cc.TEXT_ALIGNMENT_CENTER)
	slot4 = slot3
	slot3 = slot3.addTo(slot4, slot0.panel, 6, "level")
	uv4 = "panel"

	slot4.callOrWhen(slot0.level, function (slot0)
		if slot0 == false then
			uv1 = "hide"
			slot1 = slot1.hide

			slot1(slot1)

			uv1 = "show"

			slot1:hide()
		else
			uv1 = "hide"
			slot1 = slot1.show

			slot1(slot1)

			uv1 = "show"

			slot1:text(slot0):show()
		end
	end)

	return slot2
end

function slot1.showVip(slot0)
	slot1 = slot0.panel:size()
	slot2 = ccui.ImageView:create():align(cc.p(0.5, 0.5), slot1.width / 2, -slot1.height * 0.1):addTo(slot0.panel, 7, "vip")

	if slot0.vip == nil then
		if not gGameModel.role:read("vip_hide") then
			errorInWindows("role_logo vip is nil")
		end

		slot0.vip = slot3 and 0 or gGameModel.role:getIdler("vip_level")
	end

	slot3 = slot2.hide

	slot3(slot2)

	uv3 = "panel"

	slot3.callOrWhen(slot0.vip, function (slot0)
		if slot0 == false or slot0 <= 0 then
			uv1 = "hide"

			slot1:hide()
		else
			uv1 = "hide"

			slot1:texture(ui.VIP_ICON[slot0]):show()
		end
	end)

	return slot2
end

function slot1.initExtend(slot0)
	slot1 = ccui.ImageView:create(dataEasy.getRoleLogoIcon(1)):scale(2)
	slot3 = slot1:box()

	slot0:removeChildByName("_roleLogo_")

	slot4 = ccui.Layout:create():size(slot3):alignCenter(slot0:size()):addTo(slot0, 1, "_roleLogo_")

	ccui.ImageView:create("common/box/box_head_d.png"):alignCenter(slot3):addTo(slot4, 2, "bottom")

	slot0.panel = slot4

	slot0:showLogo(slot1)
	slot0:showFrame()
	slot0:showLevel()
	slot0:showVip()

	if slot0.onNode then
		slot0.onNode(slot4)
	end

	if slot0.onNodeClick then
		slot4:setTouchEnabled(true)
		bind.touch(slot0, slot4, {
			methods = {
				ended = function (slot0, slot1, slot2)
					uv3 = "onNodeClick"

					slot3.onNodeClick(slot2)
				end
			}
		})
	end

	return slot0
end

return slot1
