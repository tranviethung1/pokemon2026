slot0 = itertools.map(battle.MainSkillType, function (slot0, slot1)
	return slot1, slot0
end)
slot1 = require("app.views.city.zawake.tools")
slot2 = cc.load("mvc").ViewBase
slot3 = class("ZawakePreviewView", Dialog)
slot4 = {
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0
}
slot5 = {
	15,
	15,
	5,
	15,
	10,
	30,
	10,
	10
}
slot6 = {
	0.6,
	0.5,
	0.6,
	0.7,
	0.6,
	0.7,
	0.6,
	0.5
}

function slot7(slot0, slot1, slot2)
	slot3 = string.format("zawake/jiqi_%s.skel", slot1)
	slot4 = "effect_posun_loop"

	if slot2 > 0 then
		slot4 = "effect_xiufu_loop" .. slot2
	end

	slot8 = "effect"
	slot5 = widget.addAnimationByKey(slot0, slot3, slot8, slot4, 5)
	uv8 = "string"

	slot5:scale(slot8[slot1])
	slot5:play(slot4)

	slot9 = slot0
	uv9 = "format"
	slot9 = slot9[slot1]
	uv9 = "zawake/jiqi_%s.skel"

	slot5:xy(slot0.width(slot9) / 2 + slot9, slot9[slot1])

	if slot1 == 4 then
		slot9 = "houEffect"
		slot6 = widget.addAnimationByKey(slot0, slot3, slot9, "effect_hou_loop", 2)
		uv9 = "string"

		slot6:scale(slot9[slot1])
		slot6:play("effect_hou_loop")

		slot10 = slot0
		uv10 = "format"
		slot10 = slot10[slot1]
		uv10 = "zawake/jiqi_%s.skel"

		slot6:xy(slot0.width(slot10) / 2 + slot10, slot10[slot1])
	elseif slot1 == 7 then
		slot9 = "houEffect"
		slot6 = widget.addAnimationByKey(slot0, "zawake/jiqi_7_hou.skel", slot9, slot4, 2)
		uv9 = "string"

		slot6:scale(slot9[slot1])
		slot6:play(slot4)

		slot10 = slot0
		uv10 = "format"
		slot10 = slot10[slot1]
		uv10 = "zawake/jiqi_%s.skel"

		slot6:xy(slot0.width(slot10) / 2 + slot10, slot10[slot1])
	end
end

function slot8(slot0, slot1, slot2, slot3)
	slot0:removeChildByName("noActiveTip")

	slot4 = nil
	slot5 = 30
	slot6 = ui.COLORS.NORMAL.RED

	if not slot3.active then
		slot4 = gLanguageCsv.zawakeNoActiveTip
	end

	if slot4 then
		if slot2 then
			slot2()
		end

		slot7 = label.create(slot4, {
			fontPath = "font/youmi1.ttf",
			color = slot6,
			fontSize = slot5
		})
		slot8 = slot1:box()
		slot9 = slot8.x + slot8.width
		slot10 = slot8.y

		if checkLanguage("en") then
			slot9 = slot8.x
			slot10 = slot8.y - slot8.height / 2
		end

		slot7:addTo(slot0, 10, "noActiveTip"):anchorPoint(0, 0):xy(slot9 + 60, slot10)

		return true
	end

	return false
end

function slot9(slot0, slot1, slot2)
	slot0.skillPanel:show()

	slot3 = slot0.skillPanel:multiget("title", "list", "skill", "skillText", "name", "iconUp")

	uiEasy.setSkillInfoToItems({
		name = slot3.name,
		icon = slot3.skill,
		type1 = slot3.skillText
	}, slot2.skillCfg.cfg)
	slot3.name:text(csv.skill[slot2.skillID].skillName .. slot3.name:text())
	adapt.setTextScaleWithWidth(slot3.name, nil, 400)
	adapt.oneLinePos(slot3.title, slot3.skill, cc.p(5, 0))
	adapt.oneLinePos(slot3.skill, slot3.skillText, cc.p(60, 0))
	adapt.oneLinePos(slot3.skillText, slot3.name, cc.p(20, 0))
	slot3.iconUp:x(slot3.skill:x() + 60)

	slot5, slot6 = nil
	slot6 = dataEasy.isSkillChange() and eval.doMixedFormula(uiEasy.skillDesc2str(csvSize(slot4.zawakeEffectDesc1) > 0 and slot4.zawakeEffectDesc1 or slot4.describe1), {
		skillLevel = 1,
		math = math
	}) .. uiEasy.getStarSkillDesc({
		isZawake = true,
		star = 12,
		skillId = slot2.skillCfg.id,
		cardId = slot2.skillCfg.cardId
	}) or eval.doMixedFormula(slot4.zawakeEffect[2] == 1 and slot4.describe or slot4.zawakeEffectDesc, {
		skillLevel = 1,
		math = math
	}, nil) .. uiEasy.getStarSkillDesc({
		isZawake = true,
		star = 12,
		skillId = slot2.skillCfg.id,
		cardId = slot2.skillCfg.cardId
	})

	if slot4.zawakeSimpleDesc and slot4.zawakeSimpleDesc ~= "" then
		uv7 = "skillPanel"
		slot8 = ""

		if slot7[slot4.skillType2] then
			slot8 = gLanguageCsv["zawake" .. slot7]
		end

		slot6 = string.format("#C0xE69900#[%s%s%s]:\n#F20# \n#F40#\t%s%s", slot8, slot5 and gLanguageCsv.star or "", slot4.zawakeSimpleType == 1 and gLanguageCsv.zawakeSimpleType1 or gLanguageCsv.zawakeSimpleType2, slot4.zawakeSimpleType == 1 and "#C0x5c9970#" or "#C0x5B545B#", slot4.zawakeSimpleDesc)
	end

	slot7 = beauty.textScroll

	slot7({
		fontSize = 40,
		isRich = true,
		list = slot3.list,
		strs = "#C0x5B545B#" .. slot6
	})

	uv7 = "show"

	slot7(slot0.skillPanel, slot3.name, function ()
		uv1 = "adapt"

		adapt.setTextScaleWithWidth(slot1.name, nil, 400)
	end, slot2)
end

function slot10(slot0, slot1, slot2)
	slot0.attrPanel:show()
	slot0.attrPanel:get("list"):hide():width(1200)

	slot4 = slot0.attrPanel:get("title"):hide()
	slot5 = false
	slot6 = ""

	if csvSize(slot2.cfg.nvalue) > 0 then
		slot4:clone():addTo(slot0.attrPanel, 5):xy(slot4:xy()):show():text(gLanguageCsv.additionalPromotionTitle)

		slot5 = true
		slot8 = {}
		slot9 = true

		for slot14, slot15 in csvMapPairs(slot2.cfg.nvalue) do
			if nil == nil then
				slot10 = slot15
			elseif slot10 ~= slot15 then
				slot9 = false

				break
			end
		end

		if slot9 then
			table.insert(slot8, string.format(gLanguageCsv.additionalPromotionDescribe, slot10))
		else
			for slot14, slot15 in csvMapPairs(slot2.cfg.nvalue) do
				table.insert(slot8, getLanguageAttr(slot14) .. "+" .. dataEasy.getAttrValueString(slot14, slot15))
			end
		end

		beauty.textScroll({
			fontSize = 40,
			isRich = true,
			list = slot3:clone():addTo(slot0.attrPanel):y(slot3:y()):show(),
			strs = "#C0xF76B45#" .. table.concat(slot8, "  ")
		})
	end

	slot6 = ""

	if slot2.cfg.extraScene[1] == 0 then
		slot7 = slot4:clone():addTo(slot0.attrPanel, 5):xy(slot4:x(), slot5 and slot4:y() - 170 or slot4:y()):show():text(gLanguageCsv.zawakeExtraAttr)
	else
		slot7 = slot4:clone():addTo(slot0.attrPanel, 5):xy(slot4:x(), slot5 and slot4:y() - 170 or slot4:y()):show():text(gLanguageCsv.zawakeExtraScene)
		slot8 = {}

		for slot12, slot13 in ipairs(slot2.cfg.extraScene) do
			table.insert(slot8, gLanguageCsv[game.SCENE_TYPE_STRING_TABLE[slot13]])
		end

		slot6 = table.concat(slot8, gLanguageCsv.symbolComma) .. "\n"
	end

	slot7 = {}

	for slot11, slot12 in csvMapPairs(slot2.cfg.extraAttrs) do
		table.insert(slot7, getLanguageAttr(slot11) .. "+" .. dataEasy.getAttrValueString(slot11, slot12))
	end

	slot8 = slot3:clone():addTo(slot0.attrPanel)
	slot9 = slot8
	slot9 = beauty.textScroll

	slot9({
		fontSize = 40,
		isRich = true,
		list = slot8.y(slot9, slot5 and slot3:y() - 170 or slot3:y()):show(),
		strs = "#C0xF76B45#" .. slot6 .. table.concat(slot7, "  ")
	})

	uv9 = "attrPanel"

	slot9(slot0.attrPanel, slot4, nil, slot2)
end

slot3.RESOURCE_FILENAME = "zawake_preview.json"
slot3.RESOURCE_BINDING = {
	["bgPanel.title1"] = "title1",
	item = "item",
	["bgPanel.title2"] = "title2",
	["bgPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				backupCached = false,
				data = bindHelper.self("listDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0:setRenderHint(0)
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("bg1", "name", "fullAwake", "ruleBtn", "attrPanel", "skillPanel", "emptyPanel", "icon")

					slot4.name:text(string.format("%s%s- %s", gLanguageCsv.effortAdvance, gLanguageCsv["symbolRome" .. slot3.stageID], slot3.cfg.level))
					slot4.name:setFontSize(40)
					text.addEffect(slot4.name, {
						color = slot3.cfg.level <= slot3.level and ui.COLORS.NORMAL.ALERT_ORANGE or ui.COLORS.NORMAL.DEFAULT
					})
					itertools.invoke({
						slot4.bg1,
						slot4.fullAwake,
						slot4.attrPanel,
						slot4.skillPanel,
						slot4.emptyPanel,
						slot4.ruleBtn
					}, "hide")

					if slot3.isOpen then
						uv7 = "multiget"

						slot7(slot4.icon, slot3.stageID, slot3.level)

						if slot5 then
							itertools.invoke({
								slot4.bg1,
								slot4.fullAwake
							}, "show")
						end

						if not itertools.isempty(slot3.labelDatas) then
							slot4.ruleBtn:show()

							slot7 = slot0:box()

							bind.touch(slot0, slot4.ruleBtn, {
								methods = {
									ended = functools.partial(slot0.clickUnlock, slot2, slot3, {
										x = slot0:parent():convertToWorldSpace(cc.p(slot7.x, slot7.y)).x + slot4.ruleBtn:x() - slot4.ruleBtn:width() / 2
									})
								}
							})
						end
					else
						uv7 = "multiget"

						slot7(slot4.icon, slot3.stageID, slot3.level)
						slot4.emptyPanel:show()
					end

					if slot3.isOpen then
						if slot3.skillID > 0 then
							uv7 = "bg1"

							slot7(slot4, slot2, slot3)
						else
							uv7 = "name"

							slot7(slot4, slot2, slot3)
						end
					end
				end
			},
			handlers = {
				clickUnlock = bindHelper.self("onUnlockInfoClick")
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	Dialog.onCreate(slot0)

	slot0.zawakeID = slot1
	slot2 = slot0.initModel

	slot2(slot0)

	uv2 = "Dialog"
	slot3 = slot0.zawake or {}

	if dataEasy.getIsStarAidState(slot2.getCardByZawakeID(slot1).dbId) then
		slot3 = slot0.zawakeActiveStage or {}
	end

	slot4 = slot3[slot1] or {}
	slot5 = {}
	uv7 = "Dialog"

	for slot9 = 1, slot7.MAXSTAGE do
		uv11 = "Dialog"

		for slot13 = 1, slot11.MAXLEVEL do
			uv14 = "Dialog"

			if slot14.getLevelCfg(slot1, slot9, slot13) and (csvSize(slot14.extraAttrs) > 0 or slot14.skillID > 0 or csvSize(slot14.nvalue) > 0) then
				uv15 = "Dialog"
				slot15 = slot15.getStagesCfg(slot1, slot9)
				slot16 = slot4[slot9] or 0
				uv17 = "Dialog"
				slot17, slot18 = slot17.getActiveCondition(slot1, slot9, slot14)

				if slot14.skillID > 0 then
					uv19 = "Dialog"

					if slot19.getSkillCfg(slot1, slot14.skillID) then
						for slot23, slot24 in ipairs(slot19) do
							slot28 = slot14.skillID
							uv28 = "Dialog"

							table.insert(slot5, {
								cfg = slot14,
								stageID = slot9,
								level = slot16,
								skillID = slot28,
								skillCfg = slot24,
								isOpen = slot28.isOpenByStage(slot1, slot9),
								active = slot17,
								labelDatas = slot18
							})
						end
					end
				else
					slot22 = slot14.skillID
					uv22 = "Dialog"

					table.insert(slot5, {
						cfg = slot14,
						stageID = slot9,
						level = slot16,
						skillID = slot22,
						isOpen = slot22.isOpenByStage(slot1, slot9),
						active = slot17,
						labelDatas = slot18
					})
				end
			end
		end
	end

	slot0.listDatas:update(slot5)
	adapt.oneLinePos(slot0.title1, slot0.title2, cc.p(4, 0))
end

function slot3.initModel(slot0)
	slot0.zawake = gGameModel.role:read("zawake")
	slot0.zawakeActiveStage = gGameModel.role:read("zawake_active_stage")
	slot0.listDatas = idlers.newWithMap({})
end

function slot3.onUnlockInfoClick(slot0, slot1, slot2, slot3, slot4)
	if itertools.isempty(slot3.labelDatas) then
		return
	end

	gGameUI:stackUI("city.zawake.unlock_tips", nil, , {
		title = gLanguageCsv.zawakeStageLevelAwake,
		labelDatas = slot3.labelDatas,
		align = "left",
		pos = slot4,
		stageID = slot3.stageID
	})
end

return slot3
