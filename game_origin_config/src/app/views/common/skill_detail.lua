if dataEasy.isSkillChange() then
	return require("app.views.common.skill_detail1")
end

slot0 = class("SkillDetailView", Dialog)
slot0.RESOURCE_FILENAME = "common_skill_detail.json"
slot0.RESOURCE_BINDING = {
	["panel.textLevel"] = "skillLv",
	["panel.textNote"] = "skillType",
	["panel.imgType"] = "imgType",
	["panel.imgIcon"] = "imgIcon",
	panel = "panel",
	imgBg = "imgBg",
	["panel.textNoteType"] = "attackType",
	["panel.textSkillPower"] = "textSkillPower",
	["panel.textName"] = "skillName",
	["btnChange.text"] = "btnText",
	["panel.textNum"] = "powerNum",
	list = "list",
	btnChange = {
		varname = "btnChange",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnChangeClick")
			}
		}
	}
}
slot0.RESOURCE_STYLES = {
	clickClose = true
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.params = slot1
	slot0.typ = slot2
	slot1.skillLevel = slot1.skillLevel or 1
	slot3 = csv.skill[slot1.skillId]

	if slot1.hideSkillLevel then
		slot0.skillLv:hide()
	else
		slot0.skillLv:text(gLanguageCsv.textLv2 .. slot1.skillLevel)
	end

	itertools.invoke({
		slot0.textSkillPower,
		slot0.powerNum
	}, "hide")
	uiEasy.setSkillInfoToItems({
		name = slot0.skillName,
		icon = slot0.imgIcon,
		type1 = slot0.imgType,
		type2 = slot0.skillType,
		target = slot0.attackType
	}, slot3)

	if slot1.skillIcon then
		slot0.imgIcon:texture(slot1.skillIcon)
	end

	if slot1.isZawake then
		ccui.ImageView:create("city/drawcard/draw/txt_up.png"):scale(1.2):align(cc.p(1, 1), 200, 190):addTo(slot0.imgIcon, 1, "zawakeUp")
		slot0.skillName:text(csv.skill[csv.skill[slot1.skillId].zawakeEffect[1]].skillName .. slot0.skillName:text())
	end

	if userDefault.getForeverLocalKey("skillDetailOrSimple") == true or userDefault.getForeverLocalKey("skillDetailOrSimple") == nil then
		slot0.btnText:text(gLanguageCsv.detailDesc)
	elseif userDefault.getForeverLocalKey("skillDetailOrSimple") == false then
		slot0.btnText:text(gLanguageCsv.easyDesc)
	end

	if dataEasy.isUnlock(gUnlockCsv.shortDesc) then
		if slot3.describeShort == "" then
			slot0.btnChange:hide()
		else
			slot0.btnChange:show()
		end
	else
		slot0.btnChange:hide()
	end

	slot0.originData = {
		imgBgSize = slot0.imgBg:size(),
		panelY = slot0.panel:y(),
		listY = slot0.list:y(),
		btnChangeY = slot0.btnChange:y()
	}

	slot0:UpdateSkillDetailText(slot1, slot2)

	if checkLanguage("kr") or checkLanguage("en") then
		slot0.attackType:anchorPoint(0, 0)
		slot0.attackType:xy(slot0.skillName:x(), slot0.skillName:y() - slot0.skillName:height() - 15)
		adapt.setTextAdaptWithSize(slot0.skillName, {
			maxLine = 1,
			vertical = "center",
			horizontal = "left",
			size = cc.size(610, slot0.skillName:height())
		})
		adapt.setTextAdaptWithSize(slot0.attackType, {
			maxLine = 1,
			vertical = "center",
			horizontal = "left",
			size = cc.size(450, slot0.attackType:height())
		})
	end

	Dialog.onCreate(slot0, {
		noBlackLayer = true,
		clickClose = false
	})
end

function slot0.UpdateSkillDetailText(slot0, slot1, slot2)
	slot4 = userDefault.getForeverLocalKey("skillDetailOrSimple", true)
	slot5, slot6 = nil
	slot6 = slot1.ignoreStar and "" or uiEasy.getStarSkillDesc(slot1, slot2, slot4)
	slot5 = csv.skill[slot1.skillId].describe

	if not slot4 and slot3.describeShort ~= "" then
		slot5 = slot3.describeShort
	end

	if slot1.isZawake and slot3.zawakeEffect[1] and slot3.zawakeEffect[2] ~= 1 then
		slot5 = slot3.zawakeEffectDesc

		if not slot4 and slot3.zawakeEffectDescShort ~= "" then
			slot5 = slot3.zawakeEffectDescShort
		end
	end

	slot7, slot8 = beauty.textScroll({
		fontSize = 40,
		isRich = true,
		list = slot0.list,
		strs = "#C0x5B545B#" .. eval.doMixedFormula(slot5, {
			skillLevel = slot1.skillLevel,
			math = math
		}, nil) .. slot6
	})
	slot9 = cc.clampf(slot8, 250, 750) - 250

	if slot3.describeShort ~= "" then
		slot0.imgBg:size(slot0.originData.imgBgSize.width, slot0.originData.imgBgSize.height + slot9 + 60)
		slot0.btnChange:setPosition(slot0.btnChange:x(), slot0.originData.btnChangeY - slot9 / 2 - 30)
		slot0.panel:y(slot0.originData.panelY + slot9 / 2 + 40)
		slot7:height(250 + slot9)
		slot7:y(slot0.originData.listY - slot9 / 2 + 40)
		slot7:jumpToTop()
	else
		slot0.imgBg:size(slot0.originData.imgBgSize.width, slot0.originData.imgBgSize.height + slot9)
		slot0.btnChange:setPosition(slot0.btnChange:x(), slot0.originData.btnChangeY)
		slot0.panel:y(slot0.originData.panelY + slot9 / 2)
		slot7:height(250 + slot9)
		slot7:y(slot0.originData.listY - slot9 / 2)
	end
end

function slot0.onBtnChangeClick(slot0)
	slot1 = csv.skill[slot0.params.skillId]

	if userDefault.getForeverLocalKey("skillDetailOrSimple") == true or userDefault.getForeverLocalKey("skillDetailOrSimple") == nil then
		slot0.btnText:text(gLanguageCsv.easyDesc)
		userDefault.setForeverLocalKey("skillDetailOrSimple", false)
		slot0:UpdateSkillDetailText(slot0.params, slot0.typ)
	elseif userDefault.getForeverLocalKey("skillDetailOrSimple") == false then
		slot0.btnText:text(gLanguageCsv.detailDesc)
		userDefault.setForeverLocalKey("skillDetailOrSimple", true)
		slot0:UpdateSkillDetailText(slot0.params, slot0.typ)
	end
end

return slot0
