slot1 = class("AwatdList", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "auto_chess_battle_award.json"
slot1.RESOURCE_BINDING = {
	["goldCard.num"] = "goldNum",
	goldCard = "goldCard",
	["awardList.bg"] = "bg",
	["awardList.titleSpr"] = "titleSpr",
	["awardList.tip"] = "tip",
	["goldCard.tittle"] = "goldTitle",
	awardList = {
		varname = "awardList",
		binds = {
			event = "touch",
			soundClose = true,
			scaletype = 0,
			methods = {
				ended = bindHelper.self("onCloseClick")
			}
		}
	},
	["awardList.list"] = {
		class = "listview",
		varname = "list"
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.parent = slot1

	slot0.list:setScrollBarEnabled(false)
	slot0:hide()
end

function slot1.onShowAwardList(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 then
		slot0.closeCb = slot5

		slot0:initCards(slot2, slot3)

		if slot4 ~= "win" and slot4 ~= "fail" then
			slot4 = "fail"
		end

		slot0.bg:loadTexture(lushi.AwardListResName[slot4].bg)
		slot0.titleSpr:loadTexture(lushi.AwardListResName[slot4].title)
		slot0:show()
	else
		slot0:clearAll()
		gRootViewProxy:notify("setShopVisible", true, "fight", true)
		slot0:hide()

		if slot0.closeCb then
			slot0.closeCb()

			slot0.closeCb = nil
		end
	end
end

slot2 = 381

function slot1.createSpr(slot0, slot1)
	uv4 = "ccui"
	slot2 = ccui.Layout:create():size(slot4, 495):setAnchorPoint(0.5, 0.5)

	slot2:setTouchEnabled(false)

	slot3 = ListSprite.new(slot0.parent, slot1, tostring(slot1) .. "list")

	slot3:init()
	slot3:onAddToScene()
	slot3:setClickEnable(false)
	slot3:scale(1.4)
	slot3:addTo(slot2):xy(slot2:width() / 2, slot2:height() / 2)
	slot3.sprite:setTouchEnabled(false)
	slot3.sprite:getEventDispatcher():removeEventListener(slot3.listener)

	return slot2
end

function slot1.initCards(slot0, slot1, slot2)
	slot0.objs = slot1

	for slot6, slot7 in ipairs(slot1) do
		slot0.list:pushBackCustomItem(slot0:createSpr(slot7))
	end

	if slot2 then
		slot3 = table.length(slot1) + 1

		slot0.goldNum:setText("x" .. slot2)

		slot4 = slot0.goldCard:clone()

		slot4:show()
		slot0.list:pushBackCustomItem(slot4)
	end

	slot0.list:setLeftPadding(slot0:calcPadding(slot3))
	slot0.list:adaptTouchEnabled()
end

function slot1.calcPadding(slot0, slot1)
	slot2 = math.max(1, slot1)
	slot1 = slot2
	uv2 = "math"

	return math.max((slot0.list:width() - (slot2 * slot1 + 57 * (slot1 - 1))) / 2, 57)
end

function slot1.clearAll(slot0)
	slot0.list:removeAllItems()
	slot0.parent:clearDeleteObjLayer()
end

function slot1.onCloseClick(slot0)
	slot0:onShowAwardList(false)
end

return slot1
