slot0 = class("BattleEndPvpRewardView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "battle_end_reward.json"
slot0.RESOURCE_BINDING = {
	tipText = "tipText",
	awardsList = "awardsList",
	title = "title",
	textContinue = "textContinue",
	awardItem = "awardItem",
	blackBg = {
		varname = "blackBg",
		binds = {
			event = "click",
			method = bindHelper.self("onCloseClick")
		}
	}
}

function slot0.playEffect(slot0)
	slot0.selEffect = CSprite.new("level/zhandoujiangli.skel")

	slot0.selEffect:addTo(slot0:getResourceNode(), 100)
	slot0.selEffect:setAnchorPoint(cc.p(0.5, 1))

	slot2, slot3 = slot0.title:xy()

	slot0.selEffect:xy(slot2, slot3)
	slot0.selEffect:visible(true)
	slot0.selEffect:play(slot0.isFail and "zhandoujiangli2" or "zhandoujiangli")
	slot0.selEffect:addPlay(slot0.isFail and "zhandoujiangli2_loop" or "zhandoujiangli_loop")
end

function slot0.onCreate(slot0, slot1, slot2)
	slot2.showReward = false
	slot0.showEndView = slot1
	slot0.isFail = slot2.result ~= "win"

	slot0:playEffect()
	slot0.awardsList:setScrollBarEnabled(false)

	if next(slot2.serverData.view.award) ~= nil then
		slot4 = {}

		for slot8, slot9 in pairs(slot3.award) do
			table.insert(slot4, {
				key = slot8,
				num = slot9
			})
		end

		if #slot4 <= 5 then
			slot0.awardsList:x(slot0.awardsList:x() + (slot0.awardsList:width() - slot0.awardItem:width() * slot5) / 2)
		end

		slot0:showItem(1, slot4)
	end

	slot0.textContinue:text(gLanguageCsv.click2Continue)
	rich.createByStr(string.format(gLanguageCsv.canReciveAwardTime, slot2.awardRemainTime), 44):anchorPoint(0.5, 0.5):xy(slot0.tipText:x(), slot0.tipText:y()):addTo(slot0:getResourceNode()):z(10)

	if slot2.from == "ban_embattle" then
		ccui.ImageView:create("battle/scene/bg_dzjjc.png"):scale(2):xy(display.sizeInView.width / 2, display.sizeInView.height / 2):addTo(slot0:getResourceNode(), 0)
	end
end

function slot0.showItem(slot0, slot1, slot2)
	slot3 = slot0.awardItem:clone()

	slot3:show()

	slot5 = slot2[slot1].key
	slot6 = slot2[slot1].num
	slot7 = dataEasy.getCfgByKey(slot5)
	slot9, slot10 = uiEasy.setIconName(slot5, slot6)

	beauty.singleTextLimitWord(slot9, {
		fontSize = 40
	}, {
		width = 240
	}):xy(slot3:size().width / 2, 20):addTo(slot3, 10)
	bind.extend(slot0, slot3, {
		class = "icon_key",
		props = {
			effect = "gain",
			data = {
				key = slot5,
				num = slot6
			},
			specialKey = {
				maxLimit = true
			},
			onNode = function (slot0)
				uv3 = "xy"
				uv4 = "xy"

				slot0:xy(slot3.width / 2, slot4.height / 2 + 20)
				slot0:hide():z(2)
				transition.executeSequence(slot0, true):delay(0.5):func(function ()
					uv0 = "show"

					slot0:show()
				end):done()
			end
		}
	})
	slot0.awardsList:pushBackCustomItem(slot3)
	transition.executeSequence(slot0.awardsList, true):delay(0.25):func(function ()
		uv0 = "csvSize"
		uv2 = "showItem"

		if slot0 < csvSize(slot2) then
			uv0 = "awardsList"
			uv2 = "csvSize"
			uv3 = "showItem"

			slot0:showItem(slot2 + 1, slot3)
		else
			uv0 = "awardsList"

			slot0.awardsList:adaptTouchEnabled()
		end
	end):done()
end

function slot0.onCloseClick(slot0)
	slot0:onClose()
	slot0.showEndView()
end

return slot0
