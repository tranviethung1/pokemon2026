slot0 = table.insert
slot1 = 8
slot2 = 0

function slot3(slot0, slot1, slot2, slot3)
	return widget.addAnimationByKey(slot0, "effect/jiesuanjiemian.skel", slot1, slot2, slot3):xy(96, 145)
end

slot5 = class("GainDisplayView", cc.load("mvc").ViewBase)
slot5.RESOURCE_FILENAME = "common_gain_display.json"
slot5.RESOURCE_BINDING = {
	item = "item",
	list = "list",
	innerList = "innerList",
	imgBG = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	textNote = {
		binds = {
			event = "visible",
			idler = bindHelper.self("canClose")
		}
	}
}
slot5.RESOURCE_STYLES = {
	backGlass = true
}

function slot5.onCreate(slot0, slot1, slot2)
	audio.playEffectWithWeekBGM("item_gain.mp3")

	slot2 = slot2 or {}

	if slot1.view then
		if slot1.view.regainD then
			for slot6, slot7 in pairs(slot1.view.regainD) do
				gGameUI:showTip(string.format(gLanguageCsv.regainOnlyItem, uiEasy.setIconName(slot6, slot7)))
			end

			slot1.view.regainD = {}
		end
	elseif slot1.regainD then
		for slot6, slot7 in pairs(slot1.regainD) do
			gGameUI:showTip(string.format(gLanguageCsv.regainOnlyItem, uiEasy.setIconName(slot6, slot7)))
		end

		slot1.regainD = {}
	end

	slot0.canClose = idler.new(true)
	slot0.cb = slot2.cb
	slot0.hadSprite = {}
	slot0.isDouble = slot2.isDouble
	slot0.curSubList = nil

	if slot2.tips then
		slot0:showTips(slot2.tips)
	end

	if not slot0.isDouble then
		slot0.onlyGoldDouble = slot2.onlyGoldDouble
	end

	if slot2.raw == false then
		slot0.data = dataEasy.getItemData(slot1)
	else
		slot0.data, slot0.isFull, slot0.isHaveTip = dataEasy.mergeRawDate(slot1)
	end

	if #slot0.data == 0 then
		slot0:hide()
		performWithDelay(slot0, handler(slot0, "onClose"), 0)

		return
	end

	slot0.canClose:set(false)
	idlereasy.if_(slot0.canClose, function ()
		uv0 = "data"
		uv1 = "list"

		if #slot0.data > slot1 * 2 then
			uv0 = "data"

			slot0.list:setTouchEnabled(true)
		end
	end)

	slot0.intervalTime = 0.25

	slot0.list:setScrollBarEnabled(false)
	slot0.innerList:setScrollBarEnabled(false)
	slot0.list:setTouchEnabled(false)
	slot0.innerList:setTouchEnabled(false)
	slot0.innerList:setClippingEnabled(false)

	slot3 = slot0.list:size()
	slot4 = slot0.innerList:size()
	slot5 = slot0.item:size()
	slot6 = #slot0.data
	slot0.hasMoreCard = false
	slot0.isFirstShow = true

	for slot11, slot12 in pairs(slot0.data) do
		if slot12.specialFlag == "card" then
			slot7 = 0 + 1
		end

		if slot7 > 1 then
			slot0.hasMoreCard = true

			break
		end
	end

	uv8 = "audio"

	if slot6 <= slot8 then
		slot8 = slot0.innerList:getItemsMargin()
		slot11 = slot6 * slot8
		uv11 = "playEffectWithWeekBGM"
		slot10 = (slot3.width - slot5.width * slot6 - slot11 - slot11) / 2
		uv10 = "playEffectWithWeekBGM"

		slot0.list:xy(slot0.list:x() + slot10 - (slot10 + slot8) / 2, slot0.list:y() - 200)
	else
		uv8 = "audio"

		if slot6 <= slot8 * 2 then
			slot0.list:setTouchEnabled(false)
			slot0.list:y(slot0.list:y() - 100)
		end
	end

	slot0:showItem(1)

	slot8 = slot0:getResourceNode()

	widget.addAnimationByKey(slot8, "effect/gongxihuode.skel", "gongxihuode", "effect", 10):anchorPoint(cc.p(0.5, 0.5)):xy(slot8:width() / 2, slot8:height() - 300):addPlay("effect_loop")
end

function slot5.onClose(slot0)
	if slot0.canClose:read() then
		slot1 = slot0.addCallbackOnExit

		slot1(slot0, slot0.cb)

		uv1 = "canClose"

		slot1.onClose(slot0)
	else
		slot0.intervalTime = 0
	end
end

function slot5.showTips(slot0, slot1)
	rich.createByStr(slot1.str, slot1.foneSize):xy(slot1.position.x, slot1.position.y):anchorPoint(slot1.anchorPoint.x, slot1.anchorPoint.y):addTo(slot0, 5)
end

function slot5.showItem(slot0, slot1)
	if slot1 > #slot0.data then
		performWithDelay(slot0, function ()
			uv0 = "canClose"

			slot0.canClose:set(true)
			userDefault.setForeverLocalKey("isJumpSpriteView", false)
		end, 0.4)

		return
	end

	uv2 = "data"

	if slot1 % slot2 == 1 then
		if slot0.curSubList then
			uv4 = "performWithDelay"

			slot0.curSubList:pushBackCustomItem(ccui.Layout:create():size(slot4, 245))
		end

		slot0.curSubList = slot0.innerList:clone()

		slot0.curSubList:show()

		slot4 = 0.3

		slot0.list:pushBackCustomItem(slot0.curSubList):refreshView():scrollToBottom(slot4, true)

		uv4 = "performWithDelay"

		slot0.curSubList:pushBackCustomItem(ccui.Layout:create():size(slot4, 245))
	end

	if slot1 == 1 and slot0.isHaveTip then
		gGameUI:showTip(gLanguageCsv.autoDecompose)
		performWithDelay(slot0, function (slot0)
			uv1 = "showDetaiItem"
			uv3 = "showDetaiItem"

			slot1:showDetaiItem(slot3)
		end, 1)
	else
		slot0:showDetaiItem(slot1)
	end
end

function slot5.showDetaiItem(slot0, slot1)
	if slot0.data[slot1].specialFlag == "card" then
		if not userDefault.getForeverLocalKey("isJumpSpriteView", false) or gCommonConfigCsv.showCardRarityMin <= csv.unit[csv.cards[gGameModel.cards:find(slot2.dbid):read("card_id")].unitID].rarity or slot2.new and not slot0.hadSprite[slot3] then
			slot7 = nil

			if slot0.isFirstShow and slot0.hasMoreCard then
				slot7 = true
				slot0.isFirstShow = false
			elseif slot0.isFirstShow and not slot0.hasMoreCard then
				slot7 = false
			end

			gGameUI:stackUI("common.gain_sprite", {
				cb = slot0:createHandler("handlerShowItem", slot1, slot2)
			}, {
				full = true
			}, slot2, slot0.hadSprite, slot7)
		else
			slot0:handlerShowItem(slot1, slot2)
		end
	else
		slot3, slot4 = dataEasy.isSkinByKey(slot2.key)

		if slot3 then
			gGameUI:stackUI("city.card.skin.award", {
				cb = slot0:createHandler("handlerShowItem", slot1, slot2)
			}, {
				full = true
			}, slot4.skinID, slot4.days)
		else
			slot0:handlerShowItem(slot1, slot2)
		end
	end
end

function slot5.handlerShowItem(slot0, slot1, slot2)
	slot3 = slot0.item:clone()

	slot3:show()

	slot4 = slot3:size()
	slot5 = slot2.key
	slot6 = slot2.num
	slot7 = slot2.specialKey == "extra"

	if not slot0.isDouble and slot5 == "gold" then
		slot8 = slot0.onlyGoldDouble
	end

	slot9 = 1.25

	if dataEasy.isFurnitureItem(slot5) then
		slot9 = 1
	end

	bind.extend(slot0, slot3, {
		class = "icon_key",
		props = {
			effect = "gain",
			data = {
				key = slot5,
				num = slot6,
				dbId = slot2.dbId
			},
			specialKey = {
				maxLimit = true
			},
			isExtra = slot7,
			isDouble = slot8,
			onNode = function (slot0)
				uv3 = "xy"
				uv4 = "xy"
				slot3 = 3
				uv3 = "width"

				slot0:xy(slot3.width / 2, slot4.height / 2 + 20):hide():z(slot3):scale(slot3)
				transition.executeSequence(slot0, true):delay(0.5):func(function ()
					uv0 = "show"

					slot0:show()
				end):done()
			end
		}
	})

	slot10 = 1

	if type(slot5) == "string" and string.find(slot5, "star_skill_points_%d+") then
		slot10 = csv.fragments[csv.cards[tonumber(string.sub(slot5, string.find(slot5, "%d+")))].fragID].quality
	elseif slot5 ~= "card" then
		slot10 = dataEasy.getCfgByKey(slot5).quality
	end

	if not dataEasy.isFurnitureItem(slot5) and not dataEasy.isContractItem(slot5) then
		widget.addAnimationByKey(slot3, "effect/jiesuanjiemian.skel", "djhd_hou", "djhd_hou" .. slot10, 2):xy(slot4.width / 2, slot4.height / 2 + 20):scale(1.25):setSpriteEventHandler(function (slot0, slot1)
			uv2 = "hide"

			slot2:hide()
		end, sp.EventType.ANIMATION_COMPLETE)
		widget.addAnimationByKey(slot3, "effect/jiesuanjiemian.skel", "djhd", "djhd" .. slot10, 4):xy(slot4.width / 2, slot4.height / 2 + 20):scale(1.25):setSpriteEventHandler(function (slot0, slot1)
			uv2 = "hide"

			slot2:hide()
		end, sp.EventType.ANIMATION_COMPLETE)
	end

	slot11, slot12 = uiEasy.setIconName(slot5, slot6)

	beauty.singleTextLimitWord(slot11, {
		fontSize = 40
	}, {
		width = 240
	}):xy(slot4.width / 2, 20):addTo(slot3, 10)
	slot0.curSubList:pushBackCustomItem(slot3)
	audio.playEffectWithWeekBGM("iconpopup.mp3")
	transition.executeSequence(slot0.list, true):delay(slot0.intervalTime):func(function ()
		uv0 = "showItem"
		uv2 = "showItem"

		slot0:showItem(slot2 + 1)
	end):done()

	if slot1 == #slot0.data and slot0.isFull then
		gGameUI:showDialog({
			content = gLanguageCsv.cardBagHaveBeenFull
		})
	end
end

return slot5
