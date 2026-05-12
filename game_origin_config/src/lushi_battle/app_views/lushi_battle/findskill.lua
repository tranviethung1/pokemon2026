slot1 = class("FindSkill", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "auto_chess_battle_find_skill.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	findList = {
		varname = "findList"
	},
	["findList.cardList"] = {
		class = "listview",
		varname = "cardList"
	},
	["findList.confirmBtn"] = {
		varname = "confirmBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onConfirm")
			}
		}
	},
	hideBtn = {
		varname = "hideBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onHideBtn")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.parent = slot1
	slot0.title = rich.createByStr(gLanguageCsv.autoChessFindSkill, 63):anchorPoint(0.5, 0.5):addTo(slot0.findList, 1):xy(slot0.findList:width() / 2, display.height - 150)
	slot0.selectSpr = nil
	slot0.skillId = nil
	slot0.isHide = false

	slot0.cardList:setScrollBarEnabled(false)
	slot0:hide()
end

function slot1.onShowFindSkill(slot0, slot1, slot2)
	if slot1 then
		slot0:initSkills(slot2)
		slot0:show()
		slot0:setFindTempVisible(true)
	else
		slot0:clearAll()
		slot0:hide()
	end
end

function slot1.createSpr(slot0, slot1)
	slot2 = slot0.item:clone()
	slot2.selectHalo = slot2:get("selectHalo")

	AutoChessEasy.updateSkillInfo(slot2, csvClone(csv.auto_chess.trainer_skills[slot1]))
	slot2:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv2 = "ccui"
			uv4 = "TouchEventType"
			uv5 = "ended"

			slot2:selectListItem(slot4, slot5)
		end
	end)

	return slot2
end

function slot1.initSkills(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		slot0.cardList:pushBackCustomItem(slot0:createSpr(slot6))
	end

	slot0.cardList:setLeftPadding(slot0:calcPadding(table.length(slot1)))
	slot0.cardList:adaptTouchEnabled()
end

function slot1.calcPadding(slot0, slot1)
	slot1 = math.max(1, slot1)

	return math.max((slot0.cardList:width() - (slot0.item:width() * slot1 + 88 * (slot1 - 1))) / 2, 88)
end

function slot1.clearAll(slot0)
	slot0.selectSpr = nil
	slot0.skillId = nil

	slot0.cardList:removeAllItems()
	slot0.parent:clearDeleteObjLayer()
end

function slot1.selectListItem(slot0, slot1, slot2)
	if slot0.selectSpr then
		slot0.selectSpr.selectHalo:hide()
	end

	slot1.selectHalo:show()

	slot0.selectSpr = slot1
	slot0.skillId = slot2
end

function slot1.onConfirm(slot0)
	if not slot0.skillId then
		gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessSelectFirst)

		return
	end

	slot0.parent:handleOperation(lushi.OperateTable.findSkillConfirm, slot0.skillId)
	slot0:onShowFindSkill(false)
end

function slot1.onClose(slot0)
	slot0:onShowFindSkill(false)
end

function slot1.onHideBtn(slot0)
	slot0:setFindTempVisible(slot0.isHide)
end

function slot1.setFindTempVisible(slot0, slot1)
	if slot1 then
		slot0.findList:show()
		slot0.hideBtn:loadTextureNormal("lushi/pop/btn_zzq_eye1.png")
	else
		slot0.findList:hide()
		slot0.hideBtn:loadTextureNormal("lushi/pop/btn_zzq_eye2.png")
	end

	slot0.parent:setDisableState(not slot1, "find")

	slot0.isHide = not slot1

	slot0.cardList:setVisible(slot1)
	slot0.title:setVisible(slot1)
	slot0.confirmBtn:setVisible(slot1)
end

return slot1
