slot0 = class("SkillDetailView", Dialog)
slot0.RESOURCE_FILENAME = "common_skill_detail1.json"
slot0.RESOURCE_BINDING = {
	["actionPanel.rightPanel.list"] = "rightList",
	["actionPanel.middlePanel"] = "middlePanel",
	["actionPanel.topPanel.imgType"] = "imgType",
	["actionPanel.topPanel.textNoteType"] = "attackType",
	["actionPanel.middlePanel.btnChange.text"] = "btnText",
	["actionPanel.imgBg"] = "imgBg",
	["actionPanel.buttomPanel.imgLine"] = "buttomLine",
	["actionPanel.topPanel.textNote"] = "skillType",
	["actionPanel.topPanel.imgBg"] = "topImgBg",
	["actionPanel.rightPanel"] = "rightPanel",
	["actionPanel.topPanel.textLevel"] = "skillLv",
	["actionPanel.topPanel"] = "panel",
	["actionPanel.rightPanel.item"] = "rightItem",
	["actionPanel.buttomPanel"] = "buttomPanel",
	["actionPanel.middlePanel.imgLine"] = "imgLine",
	item = "item",
	["actionPanel.topPanel.textName"] = "skillName",
	["actionPanel.topPanel.startDesc"] = "startDesc",
	actionPanel = "actionPanel",
	["actionPanel.topPanel.imgIcon"] = "imgIcon",
	["actionPanel.middlePanel.list"] = "list",
	["actionPanel.middlePanel.btnChange"] = {
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
	clickClose = true,
	blackLayer = true
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

	slot0.lastSelectKeyWords = {}

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

	slot0.topImgBg:width(slot0.skillType:width() + 34)

	slot0.keyWords = slot3.keyWords

	if slot1.isZawake then
		slot0.keyWords = slot3.zawakeKeyWords

		ccui.ImageView:create("city/drawcard/draw/txt_up.png"):scale(1.2):align(cc.p(1, 1), 200, 190):addTo(slot0.imgIcon, 1, "zawakeUp")
		slot0.skillName:text(csv.skill[csv.skill[slot1.skillId].zawakeEffect[1]].skillName .. slot0.skillName:text())
	end

	if userDefault.getForeverLocalKey("skillDetailOrSimple") == false then
		slot0.btnText:text(gLanguageCsv.easyDesc)
	else
		slot0.btnText:text(gLanguageCsv.detailDesc)
	end

	slot0.btnChange:hide()

	if dataEasy.isUnlock(gUnlockCsv.shortDesc) and csvSize(slot3.describeShort1) > 0 then
		slot0.btnChange:show()
	end

	slot0.originData = {
		listHeight = slot0.list:height(),
		imgBgSize = slot0.imgBg:size(),
		panelY = slot0.panel:y(),
		actionPanelPos = cc.p(slot0.actionPanel:xy())
	}

	function slot1.linkFunc(slot0)
		uv1 = "onItemClick"

		slot1:onItemClick(slot0)
	end

	slot0:UpdateSkillDetailText(slot1, slot2)
	adapt.oneLinePos(slot0.skillLv, slot0.attackType, cc.p(20, 0))
	slot0.list:setScrollBarEnabled(false)
	Dialog.onCreate(slot0, {
		noBlackLayer = true,
		clickClose = false
	})
	slot0.rightList:setScrollBarEnabled(false)
end

function slot0.updateDetailList(slot0)
	slot0.rightList:removeAllItems()

	for slot5, slot6 in ipairs(slot0.lastSelectKeyWords) do
		slot0.rightList:pushBackCustomItem(function (slot0, slot1)
			uv2 = "rightItem"
			slot2 = slot2.rightItem:clone()
			slot3 = slot2
			uv3 = "rightItem"
			uv8 = "rightItem"
			slot5 = rich.createWithWidth("#C0x5B545B#" .. eval.doMixedFormula(slot1, {
				skillLevel = slot8.params.skillLevel or 1,
				math = math
			}), 40, nil, 570):anchorPoint(0, 1):xy(42, 0):addTo(slot2, 3, "text")
			slot6 = slot5:height() + 150

			slot2:height(slot6)
			slot5:y(slot2:height() - 102)
			slot3:createKeyWordsItem(slot0):anchorPoint(0, 1):xy(42, 280):name("name"):addTo(slot2.show(slot3)):y(slot2:height() - 28)
			slot2:get("imgBg"):height(slot6)

			return slot2
		end(slot6.key, slot6.str))
	end

	slot0.rightList:height(slot0.imgBg:height())
	slot0.rightPanel:height(slot0.imgBg:height())
	slot0.rightPanel:y(slot0.panel:y() + slot0.panel:height() / 2 + 20)
	slot0.rightList:y(0)
	slot0.rightList:adaptTouchEnabled()
end

function slot0.onItemClick(slot0, slot1)
	slot2 = false
	slot3 = nil

	for slot7, slot8 in ipairs(slot0.lastSelectKeyWords) do
		if slot8.key == slot1 then
			slot2 = true
			slot3 = slot7

			break
		end
	end

	if slot2 then
		table.remove(slot0.lastSelectKeyWords, slot3)

		if itertools.size(slot0.lastSelectKeyWords) == 0 then
			slot0.actionPanel:runAction(cc.Spawn:create(cc.MoveTo:create(0.1, slot0.originData.actionPanelPos), cc.CallFunc:create(function ()
				uv0 = "rightPanel"

				slot0.rightPanel:hide()
			end)))

			slot0.lastSelectKeyWords = {}

			return
		end

		slot0:updateDetailList()

		return
	end

	if not gSkillDescKeyWordsCsv[slot1] then
		printError("csv.skill_desc_key_words[%s] 不存在", slot1)

		return
	end

	if itertools.size(slot0.lastSelectKeyWords) == 0 then
		slot0.actionPanel:runAction(cc.Spawn:create(cc.MoveTo:create(0.1, cc.pAdd(slot0.originData.actionPanelPos, cc.p(-350, 0))), cc.Sequence:create(cc.DelayTime:create(0.1), cc.CallFunc:create(function ()
			uv0 = "rightPanel"

			slot0.rightPanel:show()
		end))))
	end

	table.insert(slot0.lastSelectKeyWords, 1, {
		key = slot1,
		str = slot4.desc
	})
	slot0:updateDetailList()
end

function slot0.createKeyWordsItem(slot0, slot1)
	slot2 = gSkillDescKeyWordsCsv[slot1]
	slot4 = slot0.item:clone():get("text")

	slot4:text(slot2.name)
	text.addEffect(slot4, {
		outline = {
			size = 3,
			color = cc.c3b(unpack(slot2.strokeColor, 1, 3))
		}
	})

	if matchLanguage({
		"cn"
	}) then
		slot3:get("imgBg"):color(cc.c3b(unpack(slot2.bgColor, 1, 3))):width(slot4:width())
	else
		slot3:get("imgBg"):color(cc.c3b(unpack(slot2.bgColor, 1, 3))):width(slot5 + 40)
	end

	slot3:width(slot5)

	return slot3:show()
end

function slot0.UpdateSkillDetailText(slot0, slot1, slot2)
	slot4 = userDefault.getForeverLocalKey("skillDetailOrSimple", true)
	slot5 = false

	if csv.skill[slot1.skillId].descGray and slot3.descGray ~= "" then
		slot5 = true
	end

	slot0.list:height(0)
	uiEasy.showSkillDesc(slot0.list, slot1, slot2, slot4)
	slot0.list:jumpToTop()

	slot7 = slot0.list:getInnerContainerSize().height
	slot8 = 240

	if not slot5 then
		slot9 = 860 + 76
	end

	if csvSize(slot0.keyWords) == 0 then
		slot9 = slot9 + slot0.buttomPanel:height()
	end

	if slot0.btnChange:visible() then
		slot8 = slot8 - 90
		slot9 = slot9 - 90
	end

	slot10 = cc.clampf(slot7, slot8, slot9) - slot0.originData.listHeight

	slot0.list:height(slot0.originData.listHeight + slot10)
	slot0.middlePanel:height(slot0.originData.listHeight + slot10)

	slot11 = -100

	if csvSize(slot0.keyWords) > 0 then
		for slot15, slot16 in pairs(slot0.buttomPanel:getChildren()) do
			if slot16:name() ~= "imgLine" then
				slot0.buttomPanel:removeChild(slot16)
			end
		end

		slot12 = 50
		slot13 = 1
		slot14 = 0

		for slot18, slot19 in orderCsvPairs(slot0.keyWords) do
			if not gSkillDescKeyWordsCsv[slot19] then
				printError("csv.skill_desc_key_words[%s] 不存在", slot19)
			else
				if slot0.buttomPanel:width() < slot14 + slot0:createKeyWordsItem(slot19):width() then
					slot14 = 0
					slot13 = slot13 + 1
				end

				slot20:addTo(slot0.buttomPanel):xy(slot14 + slot20:width() / 2, -(slot13 - 1) * 88 + slot0.buttomPanel:height() - slot20:height() / 2)

				slot14 = slot14 + slot21 + slot12

				bind.touch(slot0, slot20, {
					methods = {
						ended = functools.partial(slot0.onItemClick, slot0, slot19)
					}
				})
			end
		end

		setContentSizeOfAnchor(slot0.buttomPanel, cc.size(slot0.buttomPanel:width(), slot13 * 88))

		slot11 = cc.clampf(slot0.buttomPanel:height(), 100, 300) - 100
	else
		slot0.buttomPanel:hide()
	end

	if not (csvSize(slot3.describeShort1) > 0) then
		slot13 = slot10 + slot11 - 90
	end

	if slot5 then
		slot0.startDesc:text(slot3.descGray):show()
	else
		slot0.startDesc:hide()
	end

	if not slot5 then
		slot13 = slot13 - 70
	end

	slot0.panel:y(slot0.originData.panelY + slot13 / 2)

	slot14 = slot0.panel:y() - slot0.panel:height() / 2 - slot0.middlePanel:height() / 2

	slot0.middlePanel:y(slot5 and slot14 - 30 or slot14 + 30)
	slot0.imgLine:y(slot0.middlePanel:height() + 20)

	if slot12 then
		slot0.buttomPanel:y(slot0.middlePanel:y() - slot0.middlePanel:height() / 2 - 130)
	else
		slot0.buttomPanel:y(slot0.middlePanel:y() - slot0.middlePanel:height() / 2 - 40)
	end

	slot0.buttomLine:y(slot0.buttomPanel:height() + 20)
	slot0.imgBg:height(slot0.originData.imgBgSize.height + slot13)
	slot0.rightPanel:y(slot0.panel:y() + slot0.panel:height() / 2 + 20)
end

function slot0.onBtnChangeClick(slot0)
	if userDefault.getForeverLocalKey("skillDetailOrSimple") == false then
		slot0.btnText:text(gLanguageCsv.detailDesc)
		userDefault.setForeverLocalKey("skillDetailOrSimple", true)
		slot0:UpdateSkillDetailText(slot0.params, slot0.typ)
	else
		slot0.btnText:text(gLanguageCsv.easyDesc)
		userDefault.setForeverLocalKey("skillDetailOrSimple", false)
		slot0:UpdateSkillDetailText(slot0.params, slot0.typ)
	end
end

return slot0
