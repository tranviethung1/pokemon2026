slot0 = 0.08
slot1 = require("app.views.city.zawake.tools")
slot3 = class("ZawakeAwakeSuccessView", cc.load("mvc").ViewBase)
slot3.RESOURCE_FILENAME = "zawake_awake_success.json"
slot3.RESOURCE_BINDING = {
	centerPos = "centerPos",
	name21 = "name21",
	item = "item",
	jiqi2 = "jiqi2",
	jiqi1 = "jiqi1",
	name11 = "name11",
	pos = "pos",
	name2 = "name2",
	txt1 = "txt1",
	name1 = "name1",
	skillPanel = "skillPanel",
	innerList = "innerList",
	cardImg = "cardImg",
	bg = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	["skillPanel.name"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = ui.COLORS.NORMAL.ALERT_ORANGE
				}
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 3,
				data = bindHelper.self("lableDatas"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("keyText"):text(slot3.key)
					slot1:get("valText"):text(slot3.val)
					adapt.oneLinePos(slot1:get("keyText"), slot1:get("valText"))

					slot5 = slot0
					uv5 = "get"

					uiEasy.setExecuteSequence({
						slot1:get("keyText"),
						slot1:get("valText")
					}, {
						delayTime = slot5 * (1 + slot0.getIdx(slot5, slot2).k)
					})
				end
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0.stageID = slot1.stageID
	slot2 = slot1.level
	slot0.cb = slot1.cb
	slot3 = slot1.cfg
	slot4 = slot1.zawakeID

	uiEasy.setTitleEffect(slot0.centerPos, "xjiesuan_juexingzi")

	slot5 = {}

	for slot9 = 1, math.huge do
		slot11 = slot3["attrNum" .. slot9]

		if slot3["attrType" .. slot9] == nil or slot10 == 0 then
			break
		end

		table.insert(slot5, {
			key = getLanguageAttr(slot10),
			val = "+" .. dataEasy.getAttrValueString(slot10, slot11)
		})
	end

	slot0.lableDatas = idlers.newWithMap(slot5)

	slot0:updateSpine(slot0.jiqi1, slot2)
	slot0:updateSpine(slot0.jiqi2, slot2 + 1)

	if slot2 == 0 then
		slot0.name1:text(gLanguageCsv.noAwake)
		slot0.name11:hide()
	else
		slot0.name1:text(string.format(gLanguageCsv.zawakeStageLevel, gLanguageCsv["symbolRome" .. slot0.stageID]))
		slot0.name11:show()
		slot0.name11:text("- " .. slot2)
		adapt.oneLinePos(slot0.name1, slot0.name11, cc.p(-4, 0))
	end

	slot0.name2:text(string.format(gLanguageCsv.zawakeStageLevel, gLanguageCsv["symbolRome" .. slot0.stageID]))
	slot0.name21:text("- " .. slot2 + 1)
	adapt.oneLinePos(slot0.name2, slot0.name21, cc.p(-4, 0))

	slot6 = slot0.skillPanel
	slot6 = slot6.hide

	slot6(slot6)

	uv6 = "stageID"

	if slot6.getSkillCfg(slot4, slot3.skillID) then
		for slot10, slot11 in ipairs(slot6) do
			slot12 = slot0.skillPanel:clone()
			slot13 = slot12:multiget("skill", "skillText", "name", "iconUp")

			uiEasy.setSkillInfoToItems({
				name = slot13.name,
				icon = slot13.skill,
				type1 = slot13.skillText
			}, slot11.cfg)
			slot13.name:text(csv.skill[slot3.skillID].skillName .. slot13.name:text())
			adapt.oneLinePos(slot13.skill, slot13.skillText, cc.p(60, 0))
			adapt.oneLinePos(slot13.skillText, slot13.name, cc.p(20, 0))

			slot16 = slot13.skill
			slot17 = slot16

			slot13.iconUp:x(slot16.x(slot17) + 60)

			uv17 = "level"

			uiEasy.setExecuteSequence(slot12, {
				delayTime = 10 * slot17
			})
			slot12:addTo(slot0.skillPanel:parent(), slot0.skillPanel:z()):xy(slot0.skillPanel:x(), slot0.skillPanel:y() - (slot10 - 1) * slot0.skillPanel:height())
		end
	end

	uv7 = "stageID"

	if slot7.getLevelCfg(slot4, slot0.stageID, slot2 + 1) and slot7.nvalue and csvSize(slot7.nvalue) > 0 then
		slot8 = {}
		slot9 = true

		for slot14, slot15 in csvMapPairs(slot7.nvalue) do
			if nil == nil then
				slot10 = slot15
			elseif slot10 ~= slot15 then
				slot9 = false

				break
			end
		end

		if not slot9 then
			printWarn("zawakeid = %d stage = %d  level = %d nvalues is not same", slot4, slot0.stageID, slot2)
		end

		slot12 = slot0.skillPanel:clone()
		slot17 = "name"
		slot13 = slot12:multiget("skill", "skillText", slot17, "iconUp")

		slot13.name:text(string.format(gLanguageCsv.additionalPromotionDescribe, slot10)):x(500)
		slot13.skill:hide()
		slot13.skillText:hide()
		slot13.iconUp:hide()

		uv17 = "level"

		uiEasy.setExecuteSequence(slot12, {
			delayTime = 10 * slot17
		})
		slot12:addTo(slot0.skillPanel:parent(), slot0.skillPanel:z()):xy(slot0.skillPanel:x(), slot0.skillPanel:y() - (slot6 and csvSize(slot6) or 0) * slot0.skillPanel:height())
	end

	uiEasy.setExecuteSequence(slot0.cardImg)

	uv11 = "level"

	uiEasy.setExecuteSequence(slot0.jiqi2, {
		delayTime = slot11
	})

	uv11 = "level"

	uiEasy.setExecuteSequence(slot0.name2, {
		delayTime = slot11
	})

	uv11 = "level"

	uiEasy.setExecuteSequence(slot0.name21, {
		delayTime = slot11
	})
end

function slot3.updateSpine(slot0, slot1, slot2)
	slot3 = string.format("zawake/jiqi_%s.skel", slot0.stageID)
	slot4 = "effect_posun_loop"

	if slot2 > 0 then
		slot4 = "effect_xiufu_loop" .. slot2
	end

	slot5 = widget.addAnimationByKey(slot1, slot3, "effect", slot4, 5)

	slot5:scale(0.6)
	slot5:play(slot4)
	slot5:xy(slot1:width() / 2, 0)

	if slot0.stageID == 4 then
		slot6 = widget.addAnimationByKey(slot1, slot3, "houEffect", "effect_hou_loop", 2)

		slot6:scale(0.6)
		slot6:play("effect_hou_loop")
		slot6:xy(slot1:width() / 2, 0)
	elseif slot0.stageID == 7 then
		slot6 = widget.addAnimationByKey(slot1, "zawake/jiqi_7_hou.skel", "houEffect", slot4, 2)

		slot6:scale(0.6)
		slot6:play(slot4)
		slot6:xy(slot1:width() / 2, 0)
	end
end

function slot3.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot3
