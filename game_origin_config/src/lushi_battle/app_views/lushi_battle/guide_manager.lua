slot0 = require("app.views.guide.manager")
slot1 = class("AutoChessGuideManager", slot0)
slot2 = slot0.GuideView
slot3 = slot0.BattleStoryPanelView

function slot1.ctor(slot0, slot1)
	slot0.battleView = slot1
	slot0.stroyDatas = {}
	slot0.totalTriggerTime = 0
	slot0.curGuideIdx = 0
	slot0.startGuideIdx = 0
	slot0.guidePanel = nil
	slot0.inGuiding = false
	slot0.guideLimits = {}
	slot0.guideLimitsWord = {}
	slot0.extraGuideAni = {}
	slot0.choicesFunc = nil
end

function slot1.initStoryDatas(slot0, slot1)
	slot0.stroyDatas = {}

	for slot5, slot6 in ipairs(slot1) do
		for slot10 = 0, 99 do
			if not csv.auto_chess.chess_guide[slot6 + slot10] then
				break
			end

			table.insert(slot0.stroyDatas, {
				cfg = slot12,
				id = slot11
			})
		end
	end

	slot0.curGuideIdx = 1
end

function slot1.setData(slot0, slot1)
	slot0:initStoryDatas(slot1)

	slot0.totalTriggerTime = 0
	slot0.inGuiding = true

	gGameUI.guideLayer:show()
	gGameUI:disableTouchDispatch(nil, false)
end

function slot1.update(slot0, slot1)
	if not slot0.inGuiding or slot0.ignoreGuide then
		return
	end

	if not slot0.stroyDatas[slot0.curGuideIdx] then
		slot0:cleanGuidePanel()

		slot0.inGuiding = false

		gGameUI.guideLayer:hide()
		gGameUI:disableTouchDispatch(nil, true)
		slot0.battleView:onModelResume()

		return
	end

	slot3 = slot0.stroyDatas[slot0.curGuideIdx + 1]
	slot4 = slot2.cfg
	slot0.totalTriggerTime = slot0.totalTriggerTime + slot1

	if not slot2.visit and slot4.triggerTime <= slot0.totalTriggerTime then
		slot2.visit = true
		slot5 = csvClone(slot4.operateLimit)

		table.insert(slot0.guideLimits, slot5)

		if slot5 then
			table.insert(slot0.guideLimitsWord, csvClone(slot4.limitHint) or "")
		end

		slot0:showExtraGuideAni(slot4)

		if slot4.showType == 2 then
			gGameUI:disableTouchDispatch(nil, true)
			slot0:showDialog(slot4, function (slot0)
				uv1 = "totalTriggerTime"
				uv2 = "triggerTime"
				uv3 = "triggerTime"
				slot3 = slot3.lastTime
				slot2 = slot2.triggerTime + slot3
				slot1.totalTriggerTime = slot2
				uv1 = "totalTriggerTime"
				uv2 = "totalTriggerTime"
				slot1.curGuideIdx = slot2.curGuideIdx + 1
				uv1 = "totalTriggerTime"
				uv3 = "triggerTime"

				slot1:updateChoice(slot3, slot0)
				gGameUI:disableTouchDispatch(nil, false)
			end, {
				isBattle = true,
				skipCb = function ()
					uv0 = "curGuideIdx"
					uv1 = "table"
					uv3 = "table"

					for slot4 = slot1.curGuideIdx + 1, table.length(slot3.stroyDatas) do
						uv5 = "table"

						if slot5.stroyDatas[slot4].cfg.canSkip then
							uv5 = "table"
							slot5 = slot5.stroyDatas[slot4]
							slot0 = slot5.cfg
							uv5 = "table"
							slot5.curGuideIdx = slot4
						else
							break
						end
					end

					uv1 = "table"
					slot2 = slot0.triggerTime + slot0.lastTime
					slot1.totalTriggerTime = slot2
					uv1 = "table"
					uv2 = "table"
					slot1.curGuideIdx = slot2.curGuideIdx + 1
					slot1 = gGameUI
					slot1 = slot1.disableTouchDispatch

					slot1(slot1, nil, false)

					uv1 = "table"

					slot1:afterGuideTip()
				end
			})
		elseif slot4.showType ~= 3 then
			slot0:showClickGuide(slot4, function ()
				uv0 = "totalTriggerTime"
				uv1 = "triggerTime"
				uv2 = "triggerTime"
				slot1 = slot1.triggerTime + slot2.lastTime
				slot0.totalTriggerTime = slot1
				uv0 = "totalTriggerTime"
				uv1 = "totalTriggerTime"
				slot0.curGuideIdx = slot1.curGuideIdx + 1
				slot0 = gGameUI
				slot0 = slot0.disableTouchDispatch

				slot0(slot0, nil, false)

				uv0 = "totalTriggerTime"

				slot0:afterGuideTip()
			end, {
				isBattle = true
			})
		end
	end
end

function slot1.updateChoice(slot0, slot1, slot2)
	slot3 = nil

	if slot2 and slot2.nextId and slot2.nextId > 0 then
		slot3 = {
			slot2.nextId
		}
	end

	if table.length(slot1.gotoStep) > 0 then
		slot3 = slot1.gotoStep
	end

	if slot3 then
		slot0:initStoryDatas(slot3)
	end
end

function slot1.showDialog(slot0, slot1, slot2, slot3)
	uv4 = "showDialog"

	slot4.showDialog(slot0, slot1, slot2, slot3)
	slot0.guidePanel:setBackGroundColorOpacity(0)
end

function slot1.checkOperate(slot0, slot1, ...)
	if not slot0.guideLimits[1] then
		return true
	end

	if lushi.GuideCountExclude[slot1] then
		if slot1 == lushi.OperateTable.embattleMoveBegin then
			slot0.guideSpr = slot0.battleView:onViewProxyCall("getSceneObjById", ...)
			slot0.guideSeat = slot0.guideSpr.model.seat
		end

		return true
	end

	slot3 = {
		slot1,
		...
	}

	if slot0.guideLimits[1] then
		for slot7, slot8 in ipairs(slot2) do
			if slot3[slot7] ~= slot8 then
				if not slot0.guideLimitsWord[1] or slot9 == "" then
					slot9 = gLanguageCsv.guideTip
				end

				gGameUI:showTip(slot9)

				slot10 = slot0.battleView._model.scene

				if slot0.guideSpr then
					slot10:embattleCardMoveEnd(slot0.guideSpr.id, slot0.guideSeat)
					slot0:clearSpecialGuide()
				end

				slot10:removeFakeCardInEmbattle()
				slot10:refreshCardInEmbattle()
				slot10:refreshCardsInHand()

				return false
			end
		end
	end

	slot0:clearSpecialGuide()
	table.remove(slot0.guideLimits, 1)
	table.remove(slot0.guideLimitsWord, 1)
	slot0:afterGuideLimit()

	return true
end

function slot1.clearSpecialGuide(slot0)
	slot0.guideSeat = nil
	slot0.guideSpr = nil
end

slot4 = {
	[lushi.OperateTable.handCardMove] = true,
	[lushi.OperateTable.embattleMoveEnd] = true
}

function slot1.getGuideEmbattleIndex(slot0, slot1)
	if not slot0.guideLimits[1] then
		return nil
	end

	uv3 = "guideLimits"

	if slot3[slot0.guideLimits[1][1]] and slot1 == slot2[2] then
		return slot2[3]
	end

	return nil
end

slot5 = {
	function (slot0, slot1)
		slot2 = slot0.battleView.gameLayer
		slot3 = newCSprite("lushi/zizouqi_cj.skel")

		slot2:add(slot3)
		slot3:setLocalZOrder(0)
		slot3:anchorPoint(0.5, 0.5):scale(1):xy(slot2:width() / 2, slot2:height() / 2 + 40)
		slot3:play("region_highlight")
		slot3:setTimeScale(1)
		table.insert(slot0.extraGuideAni, {
			isSpeical = true,
			spr = slot3,
			waitGuideLimit = slot1.extraAniWaitGuide
		})
	end
}

function slot1.showExtraGuideAni(slot0, slot1)
	for slot5, slot6 in ipairs(slot1.specialRegionAni) do
		uv7 = "ipairs"

		slot7[slot6](slot0, slot1)
	end

	if not slot1.extraAniRes then
		return
	end

	slot2 = gGameUI.guideLayer
	slot3 = cc.p(0, 0)

	if slot1.extraAniTarget == 1 then
		if not slot0:findNodeByName(gGameUI.scene, slot1.tagName) then
			printWarn("showExtraGuideAni no targetNode")

			return
		end

		slot3 = slot2:convertToNodeSpace(slot4:parent():convertToWorldSpace(cc.p(slot4:getPosition())))
	else
		slot3 = cc.p(slot2:width() / 2, slot2:height() / 2)
	end

	slot3 = cc.pAdd(slot3, slot1.extraAniPos)
	slot4 = newCSprite(slot1.extraAniRes)

	slot2:add(slot4, 9999999)
	slot4:anchorPoint(0.5, 0.5):scale(1):xy(slot3.x, slot3.y):setRotation(slot1.extraAniAngle)
	slot4:play(slot1.extraAniName)
	slot4:setTimeScale(1)
	table.insert(slot0.extraGuideAni, {
		spr = slot4,
		waitGuideLimit = slot1.extraAniWaitGuide
	})
end

function slot1.afterGuideTip(slot0)
	for slot4 = table.length(slot0.extraGuideAni), 1, -1 do
		if not slot0.extraGuideAni[slot4].waitGuideLimit then
			slot5.spr:setRotation(0)
			removeCSprite(slot5.spr)
			table.remove(slot0.extraGuideAni, slot4)
		elseif not slot5.isSpeical then
			slot5.spr:retain()
			slot5.spr:removeFromParent()
			slot5.spr:addTo(slot0.battleView)
			slot5.spr:autorelease()
		end
	end
end

function slot1.afterGuideLimit(slot0)
	for slot4 = table.length(slot0.extraGuideAni), 1, -1 do
		slot5 = slot0.extraGuideAni[slot4]

		slot5.spr:setRotation(0)
		removeCSprite(slot5.spr)
		table.remove(slot0.extraGuideAni, slot4)
	end
end

return slot1
