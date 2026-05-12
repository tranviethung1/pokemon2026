slot0 = class("AutoChessTrainerSkillDetailView", cc.load("mvc").ViewBase)
slot1 = 150
slot2 = 550
slot0.RESOURCE_FILENAME = "auto_chess_skill_detail.json"
slot0.RESOURCE_BINDING = {
	["panel.list"] = "list",
	["panel.unlockTips"] = "unlockTips",
	["panel.bg"] = "bg",
	["panel.skillInfoPanel"] = "skillInfoPanel",
	panel = "panel"
}
slot3 = {
	gLanguageCsv.autoChessTrainerSkillType1,
	gLanguageCsv.autoChessTrainerSkillType1,
	gLanguageCsv.autoChessTrainerSkillType2
}

function slot0.onCreate(slot0, slot1, slot2)
	slot3 = slot0.skillInfoPanel:multiget("skillIcon", "skillName", "skillType", "unlockCostIcon", "unlockCostNum")
	slot4 = csv.auto_chess.trainer_skills[slot1] or {}
	slot7 = slot4.name

	slot3.skillName:text(slot7)

	uv7 = "skillInfoPanel"

	slot3.skillType:text(slot7[slot4.type])
	slot3.skillIcon:texture(slot4.skillIcon):scale(1.3)
	itertools.invoke({
		slot3.unlockCostIcon,
		slot3.unlockCostNum
	}, "visible", slot4.cost ~= 0)
	slot3.unlockCostNum:text(slot4.cost)
	slot0.unlockTips:visible(slot2.unlockLv ~= nil)

	if slot2.unlockLv then
		slot0.unlockTips:text(string.format(gLanguageCsv.autoChessTrainerSkillUnlockTips, slot2.unlockLv))
	end

	slot5 = {
		listHeight = slot0.list:height(),
		skillInfoPanelY = slot0.skillInfoPanel:y(),
		panelSize = slot0.panel:size(),
		imgBgSize = slot0.bg:size()
	}
	slot7, slot8 = beauty.textScroll({
		fontSize = 40,
		isRich = true,
		list = slot0.list,
		strs = "#C0x5B545B#" .. slot4.desc
	})
	uv13 = "multiget"
	uv14 = "skillIcon"
	slot11 = cc.clampf(slot0.list:getInnerContainerSize().height, slot13, slot14) - slot5.listHeight

	slot0.list:height(slot5.listHeight + slot11)
	slot0.list:y(slot0.skillInfoPanel:y() - slot0.skillInfoPanel:height() / 2 - slot0.list:height() - 25)
	slot0.bg:height(slot5.imgBgSize.height + slot11)
	slot0.unlockTips:y(slot0.list:y() - 25)
end

return slot0
