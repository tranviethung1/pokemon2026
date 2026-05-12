slot1 = class("EventList", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "auto_chess_battle_event.json"
slot1.RESOURCE_BINDING = {
	eventList = {
		varname = "eventList",
		binds = {
			event = "touch",
			scaletype = 0,
			methods = {
				ended = bindHelper.self("onCloseClick")
			}
		}
	},
	["eventList.cardList"] = {
		class = "listview",
		varname = "cardList"
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.parent = slot1

	slot0.cardList:setScrollBarEnabled(false)
	slot0.cardList:setLeftPadding(96)

	slot0.cards = {}
	slot2 = rich.createWithWidth(gLanguageCsv.autoChessEventTittle, 66, nil, 550):anchorPoint(0.5, 0.5):addTo(slot0.eventList, 1):xy(slot0.eventList:width() / 2, slot0.eventList:height() - 140)

	slot0:hide()
end

function slot1.onShowEventList(slot0, slot1)
	if slot1 then
		slot0:clearAll()
		slot0:initCards()

		if table.length(slot0.cards) == 0 then
			gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessNoEvent)

			return
		end

		slot0:show()
	else
		slot0:hide()
		slot0:clearAll()
	end
end

function slot1.createSpr(slot0, slot1)
	slot2 = ccui.Layout:create():size(489, 639):setAnchorPoint(0.5, 0.5)

	slot2:setTouchEnabled(true)

	slot3 = EventListItem.new(slot0.parent, slot1, tostring(slot1) .. "list")

	slot3:init()
	slot3:addTo(slot2):xy(slot2:width() / 2, slot2:height() / 2)
	table.insert(slot0.cards, slot3)

	return slot2
end

function slot1.initCards(slot0)
	for slot5, slot6 in ipairs(slot0.parent:getSceneModel().trainer[1].takeEffectEvents) do
		slot0.cardList:pushBackCustomItem(slot0:createSpr(slot6))
	end

	slot0.cardList:adaptTouchEnabled()
end

function slot1.onUpdateEventList(slot0)
	if not slot0:isVisible() then
		return
	end

	slot0:clearAll()
	slot0:initCards()
end

function slot1.clearAll(slot0)
	for slot4, slot5 in ipairs(slot0.cards) do
		slot5:sceneDelObj()
	end

	slot0.cards = {}

	slot0.cardList:removeAllItems()
end

function slot1.onCloseClick(slot0)
	slot0:onShowEventList(false)
end

return slot1
