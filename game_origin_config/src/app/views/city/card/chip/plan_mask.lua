slot1 = class("ChipPlanMaskView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "chip_plan_mask.json"
slot1.RESOURCE_BINDING = {
	panel = "panel",
	maskPanel = "maskPanel"
}

function slot1.onCreate(slot0, slot1)
	slot0.params = slot1

	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onMaskClose")
	}):init()
	adapt.dockWithScreen(slot0.panel, "left")
	text.addEffect(slot0.panel:get("tip1"), {
		outline = {
			size = 8,
			color = cc.c4b(250, 93, 107, 255)
		}
	})
	text.addEffect(slot0.panel:get("tip2"), {
		outline = {
			size = 8,
			color = cc.c4b(250, 93, 107, 255)
		}
	})

	slot2 = slot0.panel:get("bg"):box()
	slot3 = slot0.panel:convertToWorldSpace(cc.p(slot2.x, slot2.y))
	slot4 = cc.rect(slot3.x, slot3.y, slot2.width, slot2.height)
	slot5 = 20
	slot6 = 20
	slot7 = cc.RenderTexture:create(display.sizeInView.width, display.sizeInView.height):addTo(slot0:getResourceNode(), 0, "bgRender")
	slot9 = ccui.Scale9Sprite:create()

	slot9:initWithFile(cc.rect(80, 80, 1, 1), "other/guide/icon_mask.png")
	slot9:anchorPoint(0, 0):size(slot4.width - slot5 * 2, slot4.height - slot6 * 2):xy(slot0.panel:box().x + slot2.x + slot5, slot0.panel:box().y + slot2.y + slot6)
	slot9:setBlendFunc({
		dst = 0,
		src = GL_DST_ALPHA
	})
	slot7:begin()
	cc.LayerColor:create(cc.c4b(0, 0, 0, 178), display.sizeInView.width, display.sizeInView.height):visit()
	slot9:visit()
	slot7:endToLua()

	slot10 = slot0.panel:get("img")
	slot11, slot12 = slot10:xy()
	slot13 = cc.DelayTime:create(1)

	slot10:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.CallFunc:create(function ()
		uv0 = "xy"
		uv2 = "rotate"
		uv3 = "opacity"

		slot0:xy(slot2 + 100, slot3 + 50):rotate(-30):opacity(0):show()
	end), cc.Spawn:create(cc.FadeIn:create(0.5), cc.RotateTo:create(0.5, 0), cc.MoveTo:create(0.5, cc.p(slot11, slot12))), cc.DelayTime:create(0.3), cc.CallFunc:create(function ()
		uv0 = "hide"

		slot0:hide()
	end), cc.DelayTime:create(0.5))))

	slot16 = slot0.panel:get("bg")

	slot16:clone():addTo(slot0.panel):xy(slot16:xy()):z(slot16:z() - 1)
	slot16:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeTo:create(1, 50), cc.FadeTo:create(1, 255))))
	slot0.maskPanel:setTouchEnabled(false)
	uiEasy.addTouchOneByOne(slot0.maskPanel, {
		beforeBegan = function (slot0, slot1, slot2)
			uv4 = "cc"

			if cc.rectContainsPoint(slot4, slot0) then
				return true
			end

			return false
		end
	})
end

function slot1.onMaskClose(slot0)
	if slot0.params.onClose then
		slot0.params.onClose()
	else
		slot0:onClose()
	end
end

return slot1
