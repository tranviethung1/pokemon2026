slot1 = class("SelectList", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "auto_chess_battle_select.json"
slot1.RESOURCE_BINDING = {
	["selectList.item"] = "item",
	["selectList.cardList"] = "cardList",
	["selectList.subList"] = "subList",
	["selectList.tip"] = "tip",
	selectList = {
		varname = "selectList",
		binds = {
			event = "touch",
			scaletype = 0,
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["selectList.selectBtn"] = {
		varname = "selectBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSelectListConfirm")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.selectSpr = nil
	slot0.parent = slot1
	slot0.cards = {}

	text.addEffect(slot0.tip, {
		outline = {
			size = 3,
			color = cc.c3b(91, 84, 91)
		}
	})
	slot0:hide()
end

function slot1.onShowSelectList(slot0, slot1, slot2)
	if slot1 then
		slot0:initCards(slot2)

		if table.length(slot0.cards) == 0 then
			gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessNoCards)

			return
		end

		slot0:show()
	else
		slot0:hide()
		slot0:clearAll()
	end
end

function slot1.createSpr(slot0, slot1)
	slot2 = ListSprite.new(slot0.parent, slot1, tostring(slot1) .. "list")

	slot2:init()
	slot2:onAddToScene()
	table.insert(slot0.cards, slot2)

	return slot2
end

function slot1.clearAll(slot0)
	for slot4, slot5 in ipairs(slot0.cards) do
		slot5:sceneDelObj(slot0.parent.deleteObjLayer)
	end

	slot0.cards = {}
	slot0.selectSpr = nil

	slot0.cardList:removeAllItems()
	slot0.parent:clearDeleteObjLayer()
end

function slot1.initCards(slot0, slot1)
	slot2 = slot0.parent:getSceneModel()

	if slot1 == 1 then
		function slot4(slot0)
			uv1 = "parent"

			if not slot1.parent:onViewProxyCall("getSceneObjById", slot0.id) or slot1.isEnhancing then
				return false
			end

			return true
		end

		function slot3(slot0)
			uv1 = "star"

			return slot1(slot0) and slot0.star < lushi.StarLimit
		end
	end

	slot4 = {}

	for slot9, slot10 in ipairs(slot2.handCards) do
		function (slot0)
			if slot0.type == lushi.ObjectType.normal then
				uv1 = "type"

				if slot1(slot0) then
					uv2 = "lushi"

					table.insert(slot2, slot0)
				end
			end
		end(slot10)
	end

	for slot9, slot10 in slot2.heros:order_pairs() do
		slot5(slot10)
	end

	bind.extend(slot0, slot0.cardList, {
		class = "tableview",
		props = {
			columnSize = 6,
			data = slot4,
			item = bindHelper.self("subList"),
			cell = bindHelper.self("item"),
			onCell = function (slot0, slot1, slot2, slot3)
				uv4 = "createSpr"

				slot4:createSpr(slot3):addTo(slot1):xy(160, 208):scale(1.1)
			end,
			onAfterBuild = function (slot0)
				slot0:adaptTouchEnabled()
			end
		}
	})
end

function slot1.onSelectListItem(slot0, slot1)
	if not slot0:isVisible() then
		return
	end

	if slot0.selectSpr then
		if not slot0.selectSpr.onSelectHalo then
			errorInWindows("selectSpr.onSelectHalo is nil , isVisible:%s spr:%s tracelog:%s", slot0:isVisible(), slot0.selectSpr, slot0.tracelog)
		else
			slot0.selectSpr:onSelectHalo(false)
		end
	end

	slot0.selectSpr = slot1
end

function slot1.onSetTraceLog(slot0, slot1)
	if slot1 == slot0.selectSpr then
		slot0.tracelog = debug.traceback()
	end
end

function slot1.onSelectListConfirm(slot0, slot1)
	if not slot0.selectSpr then
		gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessSelectFirst)

		return
	end

	slot0.parent:onViewProxyNotify("listSelect", slot0.selectSpr.id)
	slot0:onClose()
end

function slot1.onClose(slot0)
	slot0:onShowSelectList(false)
end

return slot1
