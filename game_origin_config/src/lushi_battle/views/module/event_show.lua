slot0 = class("EventShow", battleModule.CBase)
slot1 = 580
slot2 = 350

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.takeEffectList = {
		{},
		{}
	}
	slot0.isPlaying = {
		false,
		false
	}
	slot0.curSpr = {}
end

function slot0.onEventTakeEffect(slot0, slot1, slot2)
	table.insert(slot0.takeEffectList[slot2], slot1)
	slot0:playEffect(slot2)
end

function slot0.playEffect(slot0, slot1)
	if slot0.isPlaying[slot1] then
		return
	end

	if not table.remove(slot0.takeEffectList[slot1], 1) then
		return
	end

	slot3 = slot0.parent:get("Panel")
	slot7 = slot3:height() / 2

	if slot1 == 2 then
		slot6 = slot3:width() - slot3:convertToNodeSpace(slot0.parent.panelEvent:parent():convertToWorldSpace(cc.p(slot0.parent.panelEvent:getPosition()))).x
	end

	slot8 = slot0.parent.cardPanel:clone()

	slot8:addTo(slot3, 999):xy(slot6, slot7):scale(0)

	slot9 = slot8:width() / 2
	slot11 = ccui.Layout:create()

	slot11:addTo(slot8):align(cc.p(0.5, 0.5), slot9, slot8:height() / 2)
	bind.extend(slot0.parent, slot11, {
		class = "auto_chess_card1",
		props = {
			star = 1,
			id = slot2,
			onNode = function (slot0)
				slot0:z(5)
				slot0:scale(0.5)
			end
		}
	})

	slot12 = slot8:height() + 35
	slot13 = cc.Sprite:create("lushi/pop/img_zzq_jnbg.png"):xy(slot9, slot12):addTo(slot8, 0)
	slot14 = rich.createWithWidth(gLanguageCsv.autoChessSkillTrigger, 44, nil, 200):anchorPoint(0.5, 0.5):xy(slot9, slot12):addTo(slot8, 1)
	slot15 = newCSprite("lushi/zizouqi_sj.skel")

	function slot16(slot0, slot1, slot2)
		uv5 = "addTo"
		slot6 = 0.5
		slot5 = 1
		uv5 = "anchorPoint"
		uv6 = "scale"

		slot0:addTo(slot5, slot1):anchorPoint(0.5, slot6):scale(slot5):xy(slot5, slot6)
		slot0:setTimeScale(1)
		slot0:play(slot2)
	end

	slot0.isPlaying[slot1] = true
	slot0.curSpr[slot1] = slot8

	slot8:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.5, cc.p(slot6, slot7 + 100)), cc.ScaleTo:create(0.5, 1)), cc.CallFunc:create(function ()
		uv0 = "event_trigger"
		uv1 = "event_trigger"

		slot0(slot1, 1, "event_trigger")
	end), cc.DelayTime:create(1.5), cc.CallFunc:create(function ()
		uv0 = "runAction"
		slot0 = slot0.runAction

		slot0(slot0, cc.FadeOut:create(0.3))

		uv0 = "cc"

		slot0:runAction(cc.FadeOut:create(0.3))
	end), cc.ScaleTo:create(0.1, 0.85), cc.DelayTime:create(0.5), cc.FadeOut:create(0.5), cc.CallFunc:create(function ()
		uv0 = "isPlaying"
		slot0 = slot0.isPlaying
		uv1 = "removeFromParent"
		slot2 = false
		slot0[slot1] = slot2
		uv0 = "playEffect"
		slot0 = slot0.removeFromParent

		slot0(slot0)

		uv0 = "isPlaying"
		slot1 = slot0
		slot0 = slot0.playEffect
		uv2 = "removeFromParent"

		slot0(slot1, slot2)

		uv0 = "isPlaying"
		uv1 = "removeFromParent"
		slot0.curSpr[slot1] = nil
	end)))
end

function slot0.onClose(slot0)
	for slot4 = 1, 2 do
		if slot0.curSpr[slot4] then
			slot0.curSpr[slot4]:stopAllAction()
		end
	end
end

return slot0
