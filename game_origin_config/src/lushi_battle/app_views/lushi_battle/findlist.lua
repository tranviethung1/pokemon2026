slot1 = class("FindList", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "auto_chess_battle_find_card.json"
slot1.RESOURCE_BINDING = {
	findList = {
		varname = "findList"
	},
	["findList.list"] = {
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
	slot0.title = rich.createWithWidth("#C0xFFC843##Pfont/youmi1.ttf##LOC0xEE0000##L00100000##LOS4#发现一张牌", 66, nil, 380):addTo(slot0.findList, 1):xy(slot0.findList:width() / 2, slot0.findList:height() - 143)

	slot0:hide()
	slot0.cardList:setScrollBarEnabled(false)

	slot0.isHide = false
	slot0.selectSpr = nil
end

function slot1.onShowFindList(slot0, slot1)
	if slot1 then
		slot0:initCards()
		slot0:show()
		slot0:setFindTempVisible(true)
	else
		slot0:clearAll()
		slot0:hide()
	end
end

slot2 = 543

function slot1.createSpr(slot0, slot1)
	uv4 = "ccui"
	slot2 = ccui.Layout:create():size(slot4, 709):setAnchorPoint(0.5, 0.5)
	slot3 = FindListItem.new(slot0.parent, slot1, tostring(slot1) .. "list")

	slot3:init()
	slot3:onAddToScene()
	slot3:addTo(slot2):xy(slot2:width() / 2, slot2:height() / 2)

	return slot2
end

function slot1.initCards(slot0)
	for slot5, slot6 in ipairs(slot0.parent:getSceneModel().findCards) do
		slot0.cardList:pushBackCustomItem(slot0:createSpr(slot6))
	end

	slot0.cardList:setLeftPadding(slot0:calcPadding(table.length(slot1.findCards)))
	slot0.cardList:adaptTouchEnabled()
end

function slot1.calcPadding(slot0, slot1)
	slot2 = math.max(1, slot1)
	slot1 = slot2
	uv2 = "math"

	return math.max((slot0.cardList:width() - (slot2 * slot1 + 160 * (slot1 - 1))) / 2, 160)
end

function slot1.clearAll(slot0)
	slot0.selectSpr = nil
	slot0.isHide = false

	slot0.cardList:removeAllItems()
	slot0.parent:clearDeleteObjLayer()
end

function slot1.onFindListItem(slot0, slot1)
	if slot0.selectSpr then
		slot0.selectSpr:onSelectHalo(false)
	end

	slot0.selectSpr = slot1
end

function slot1.onConfirm(slot0)
	if not slot0.selectSpr then
		gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessSelectFirst)

		return
	end

	slot0:onShowFindList(false)
	slot0.parent:handleOperation(lushi.OperateTable.findCardConfirm, slot0.selectSpr.model.seat)
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
