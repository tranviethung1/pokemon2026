globals.FindListItem = class("FindListItem", AutoChessSprite)

function FindListItem.init(slot0)
	AutoChessSprite.init(slot0)
	slot0:spriteApplyState("inlist")
	slot0.sprite:scale(2)

	if slot0.battleView:getSceneModel():checkRiseStar(slot0.model) then
		slot0:updateRiseState(true)
		slot0.riseState:scale(2)
	end
end

function FindListItem.getPosBySeat(slot0)
	return cc.p(0, 0)
end

function FindListItem.onStateChange(slot0)
	slot0.sprite:setRotation3D({
		x = 0
	})

	slot0.posZ = 999

	if slot0.shadowBg then
		slot0.shadowBg:hide()
	end

	slot0:z(slot0.posZ)
end

function FindListItem.onHoldingHalo(slot0)
end

function FindListItem.setCardData(slot0)
	if slot0.model.type == lushi.ObjectType.equip then
		EquipSprite.setCardData(slot0)
	elseif slot0.model.type == lushi.ObjectType.event then
		EventSprite.setCardData(slot0)
	else
		AutoChessSprite.setCardData(slot0)
	end
end

function FindListItem.onSelectHalo(slot0, slot1)
	if not slot0.selectHalo then
		slot2 = slot0.cardPrefab.node:getBoundingBox()
		slot3 = cc.rect(51, 49, 2, 2)
		slot5 = ccui.Scale9Sprite:create()

		slot5:initWithFile(slot3, "lushi/event/btn_zzq_box1.png")
		slot5:setScale9Enabled(true)
		slot5:size({
			width = slot2.width + 35,
			height = slot2.height + 35
		}):anchorPoint(0.5, 0.5):setCapInsets(slot3):addTo(slot0.sprite, -1):xy(slot0.sprite:width() / 2, slot0.sprite:height() / 2):hide()

		slot0.selectHalo = slot5
	end

	if slot1 == slot0.selectHalo:isVisible() then
		return
	end

	slot0.selectHalo:setVisible(slot1)
end

FindListItem.StateFuncMap = {
	none = {},
	inhand = {},
	inembattle = {},
	inlist = {
		onTouchEnded = function (slot0, slot1, slot2, slot3)
			if slot3 then
				slot1.battleView:findListItem(slot1)
				slot1:onSelectHalo(true)
			end
		end
	}
}
