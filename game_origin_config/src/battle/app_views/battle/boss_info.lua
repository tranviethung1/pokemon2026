slot1 = class("BossInfoPanel", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "battle_boss_info.json"
slot1.RESOURCE_BINDING = {
	centerPanel = "centerPanel",
	refreshBtnL = {
		varname = "refreshBtnL",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRefreshBtnLClick")
			}
		}
	},
	refreshBtnR = {
		varname = "refreshBtnR",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRefreshBtnRClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.battleView = slot1

	widget.addAnimationByKey(slot0, "level/qiangdilaixi.skel", "MainEffect", "hou", 0):xy(display.center):scale(2):addPlay("effect_loop")
	widget.addAnimationByKey(slot0, "level/qiangdilaixi.skel", "QainEffect", "qian", 20):xy(display.center):scale(2):setSpriteEventHandler(function (slot0, slot1)
		if slot0 == sp.EventType.ANIMATION_COMPLETE then
			uv2 = "sp"
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "EventType"

			slot2.centerPanel:show()
		end
	end)
	slot0:getResourceNode():onClick(function ()
		uv0 = "stop"
		slot1 = slot0
		slot0 = slot0.stop

		slot0(slot1)

		uv0 = "onClose"
		uv1 = "stop"

		slot0.onClose(slot1)
	end)

	slot8 = slot0.battleView._play:getMonsterCsv(slot0.battleView.sceneID, slot0.battleView:getPlayModel().curWave)
	slot0.bossTb = {}

	for slot12 = 1, 6 do
		slot14 = slot8.monsters[slot12] or 0

		if slot8.bossMark[slot12] == 1 and slot14 > 0 then
			table.insert(slot0.bossTb, slot14)
		end
	end

	slot0.centerPanel:get("attrText"):setString(gLanguageCsv.attribute .. ":")
	slot0.centerPanel:get("rareText"):setString(gLanguageCsv.rarity .. ":")
	slot0.centerPanel:get("descArea1.title"):setString(gLanguageCsv.summary .. ":")
	slot0.centerPanel:get("descArea2.title"):setString(gLanguageCsv.uniqueSkill .. ":")
	slot0.refreshBtnL:hide()

	if table.length(slot0.bossTb) <= 1 then
		slot0.refreshBtnR:hide()
	end

	slot0.curBossIdx = 1

	slot0:showBossInfo(slot0.curBossIdx)
end

function slot1.showBossInfo(slot0, slot1)
	if not csv.unit[slot0.bossTb[slot1]] then
		return
	end

	slot4 = slot0:getResourceNode()

	slot0.centerPanel:get("nameText"):setString(slot3.name)
	slot0.centerPanel:get("attrIcon1"):loadTexture(ui.ATTR_ICON[slot3.natureType])
	slot0.centerPanel:get("attrIcon2"):setVisible(ui.ATTR_ICON[slot3.natureType2] ~= nil)

	if slot6 then
		slot0.centerPanel:get("attrIcon2"):loadTexture(slot6)
	end

	slot0.centerPanel:get("rareImg"):loadTexture(ui.RARITY_ICON[slot3.rarity])

	slot7 = slot0.centerPanel:get("potrait")

	slot7:loadTexture(slot3.show)
	function (slot0, slot1)
		uv2 = ""
		slot2 = slot2.centerPanel:get("descArea" .. slot0)
		slot3 = slot2:get("textArea")
		slot5, slot6 = slot3:getPosition()
		slot7 = rich.createWithWidth("#C0x5b545b#" .. (slot1 or ""), 40, deltaSize, slot3:size().width)

		slot7:setAnchorPoint(cc.p(0, 1))
		slot7:xy(slot5, slot6)
		slot2:add(slot7, 3)
	end(1, csv.cards[slot3.cardID].introduction)

	slot10 = nil

	if table.length(slot3.skillList) ~= 0 then
		slot10 = csv.skill[slot9[table.length(slot9)]].simDesc
	end

	slot7(2, slot10)
end

function slot1.onRefreshBtnLClick(slot0)
	if table.length(slot0.bossTb) == 1 then
		return
	end

	slot0.curBossIdx = slot0.curBossIdx - 1

	if slot0.curBossIdx <= 1 then
		slot0.curBossIdx = 1
	end

	slot0:showBossInfo(slot0.curBossIdx)

	slot1 = slot0:getResourceNode()

	if slot0.curBossIdx == 1 then
		slot0.refreshBtnL:hide()
	end

	slot0.refreshBtnR:show()
end

function slot1.onRefreshBtnRClick(slot0)
	if #slot0.bossTb == 1 then
		return
	end

	slot0.curBossIdx = slot0.curBossIdx + 1

	if table.length(slot0.bossTb) <= slot0.curBossIdx then
		slot0.curBossIdx = table.length(slot0.bossTb)
	end

	slot0:showBossInfo(slot0.curBossIdx)

	slot1 = slot0:getResourceNode()

	if slot0.curBossIdx == table.length(slot0.bossTb) then
		slot0.refreshBtnR:hide()
	end

	slot0.refreshBtnL:show()
end

return slot1
