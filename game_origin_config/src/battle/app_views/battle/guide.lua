slot0 = require("app.views.guide.manager")
slot1 = class("BattleGuideManager", slot0)
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
	slot0.choicesFunc = nil
end

function slot1.initStoryDatas(slot0, slot1)
	slot0.stroyDatas = {}

	for slot5, slot6 in ipairs(slot1) do
		for slot10 = 0, 99 do
			if not csv.scene_monster_story[slot6 + slot10] then
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
		slot0.battleView:showMainUI(true)
		slot0.battleView:onModelResume()

		return
	end

	slot3 = slot0.stroyDatas[slot0.curGuideIdx + 1]
	slot4 = slot2.cfg
	slot0.totalTriggerTime = slot0.totalTriggerTime + slot1

	if not slot2.visit and slot4.triggerTime <= slot0.totalTriggerTime then
		log.battle.guide("update: id", slot2.id, "triggerTime", slot0.totalTriggerTime)

		slot2.visit = true

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

					gGameUI:disableTouchDispatch(nil, false)
				end
			})
		elseif slot4.showType == 3 then
			if slot0.battleView:onViewProxyCall("getSceneObjBySeat", slot4.topTalkPos) then
				slot5:showGuide(slot4.topTalk, slot4.lastTime)

				slot0.curGuideIdx = slot0.curGuideIdx + 1
			else
				slot0.totalTriggerTime = slot4.triggerTime + slot4.lastTime
				slot0.curGuideIdx = slot0.curGuideIdx + 1
			end
		else
			slot0:showClickGuide(slot4, function ()
				uv0 = "totalTriggerTime"
				uv1 = "triggerTime"
				uv2 = "triggerTime"
				slot1 = slot1.triggerTime + slot2.lastTime
				slot0.totalTriggerTime = slot1
				uv0 = "totalTriggerTime"
				uv1 = "totalTriggerTime"
				slot0.curGuideIdx = slot1.curGuideIdx + 1

				gGameUI:disableTouchDispatch(nil, false)
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

return slot1
