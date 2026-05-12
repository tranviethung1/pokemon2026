globals.ListSprite = class("ListSprite", AutoChessSprite)

function ListSprite.init(slot0)
	if slot0.model.type == lushi.ObjectType.normal then
		AutoChessSprite.init(slot0)
	elseif slot0.model.type == lushi.ObjectType.equip then
		EquipSprite.init(slot0)
	elseif slot0.model.type == lushi.ObjectType.event then
		slot0.setCardData = EventSprite.setCardData

		EventSprite.init(slot0)
	end

	slot1 = slot0.removeFromParent

	function slot0.removeFromParent(slot0)
		slot1 = gRootViewProxy:proxy()
		slot1 = slot1.onSetTraceLog

		slot1(slot1, slot0)

		uv1 = "gRootViewProxy"

		slot1(slot0)
	end

	slot0:spriteApplyState("inlist")
end

function ListSprite.enableSpriteClick(slot0)
	slot0.sprite:setTouchEnabled(true)
	slot0.sprite:addClickEventListener(function ()
		slot0 = gRootViewProxy:proxy()
		slot0 = slot0.selectListItem
		uv2 = "gRootViewProxy"

		slot0(slot0, slot2)

		uv0 = "gRootViewProxy"

		slot0:onSelectHalo(true)
	end)
end

function ListSprite.getPosBySeat(slot0)
	return cc.p(0, 0)
end

function ListSprite.onStateChange(slot0)
	slot0.sprite:setRotation3D({
		x = 0
	})

	slot0.posZ = 999

	if slot0.shadowBg then
		slot0.shadowBg:hide()
	end

	slot0:z(slot0.posZ)
end

function ListSprite.onSelectHalo(slot0, slot1)
	if not slot0.selectHalo then
		slot2 = slot0.sprite:box()
		slot3 = cc.rect(51, 49, 2, 2)
		slot5 = ccui.Scale9Sprite:create()

		slot5:initWithFile(slot3, "lushi/event/btn_zzq_box1.png")
		slot5:setScale9Enabled(true)
		slot5:size({
			width = slot2.width + 25,
			height = slot2.height + 10
		}):anchorPoint(0.5, 0.5):setCapInsets(slot3):addTo(slot0.sprite, -1):xy(slot0.sprite:width() / 2, slot0.sprite:height() / 2):hide()

		slot0.selectHalo = slot5
	end

	if slot1 == slot0.selectHalo:isVisible() then
		return
	end

	slot0.selectHalo:setVisible(slot1)
end

ListSprite.StateFuncMap = {
	none = {},
	inhand = {},
	inembattle = {},
	inlist = {}
}
