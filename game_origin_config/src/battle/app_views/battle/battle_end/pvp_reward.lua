slot0 = class("BattleEndPvpRewardView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "battle_end_pvp_reward.json"
slot0.RESOURCE_BINDING = {
	["item.imgCardBack"] = "imgCardBack",
	["item.awardPanel.imgCard"] = "imgCard",
	item = "item",
	title = "title",
	textContinue = "textContinue",
	imgBg = {
		varname = "imgBg",
		binds = {
			event = "click",
			method = bindHelper.self("onCloseClick")
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 3,
				data = bindHelper.self("listData"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot0.initItem(slot1, slot2)
					bind.touch(slot0, slot1:multiget("imgCardBack", "awardPanel").imgCardBack, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick"),
				initItem = bindHelper.self("initItem")
			}
		}
	}
}

function slot0.playEffect(slot0)
	slot0.selEffect = CSprite.new("level/zhandoujiangli.skel")

	slot0.selEffect:addTo(slot0:getResourceNode(), 100)
	slot0.selEffect:setAnchorPoint(cc.p(0.5, 1))

	slot2, slot3 = slot0.title:xy()

	slot0.selEffect:xy(slot2, slot3 + 300)
	slot0.selEffect:visible(true)

	if slot0.isBattleWin then
		slot0.selEffect:play("zhandoujiangli")
		slot0.selEffect:addPlay("zhandoujiangli_loop")
	else
		slot0.selEffect:play("zhandoujiangli2")
		slot0.selEffect:addPlay("zhandoujiangli2_loop")
	end

	slot0.selEffect:retain()
end

function slot0.onCreate(slot0, slot1)
	slot2 = slot1.serverData.view
	slot0.awardTb = slot2.award
	slot0.showItemTb = slot2.show
	slot0.isBattleWin = slot2.result == "win"

	slot0.imgCard:hide()

	if slot0.isBattleWin then
		slot0.imgCardBack:texture("city/pvp/reward/img_kapai01@.png")
		slot0.imgCard:texture("city/pvp/reward/img_kapai02@.png")
		slot0.imgBg:texture("city/pvp/reward/bg_pvp_win.png")
	else
		slot0.imgCardBack:texture("city/pvp/reward/img_kapai_defeat01@.png")
		slot0.imgCard:texture("city/pvp/reward/img_kapai_defeat02@.png")
		slot0.imgBg:texture("city/pvp/reward/bg_pvp_lose.png")
	end

	slot0:playEffect()

	slot0.listData = {
		{
			key = 1
		},
		{
			key = 2
		},
		{
			key = 3
		}
	}
end

function slot0.setCanJump(slot0)
	slot0.canJump = slot0.canJump or 0
	slot0.canJump = slot0.canJump + 1

	if slot0.canJump >= 3 then
		slot0.textContinue:text(gLanguageCsv.click2Continue)
	end
end

function slot0.initItem(slot0, slot1, slot2, slot3)
	slot0.items = slot0.items or {}
	slot0.items[slot3] = slot2
end

function slot0.onItemClick(slot0, slot1, slot2, slot3)
	if slot0.clickClose then
		return
	end

	slot0.clickClose = true
	slot4 = 1

	for slot8, slot9 in pairs(slot0.items) do
		if slot8 ~= slot2 then
			slot10 = slot4
			slot4 = slot4 + 1

			performWithDelay(slot9, function ()
				uv0 = "showEffectOnItem"
				uv2 = "showItemTb"
				uv3 = "showEffectOnItem"
				uv4 = "showEffectOnItem"
				uv5 = "showItemTb"

				slot0:showEffectOnItem(slot2, slot3, slot4.showItemTb[slot5], false)
			end, 1)
		else
			slot0:showEffectOnItem(slot1, slot9, slot0.awardTb, true)
		end
	end
end

function slot0.showEffectOnItem(slot0, slot1, slot2, slot3, slot4)
	slot5, slot6 = next(slot3)
	slot7 = slot2:multiget("imgCardBack", "awardPanel")

	slot7.imgCardBack:setTouchEnabled(false)
	bind.extend(slot1, slot7.awardPanel:multiget("imgCard", "itemPanel", "awardName", "selectBox").itemPanel, {
		class = "icon_key",
		props = {
			data = {
				key = slot5,
				num = slot6 or 0
			},
			specialKey = {
				maxLimit = true
			},
			onNode = function (slot0)
				slot0:setTouchEnabled(false)
			end
		}
	})
	slot8.awardName:text(dataEasy.getCfgByKey(slot5).name)
	slot8.awardName:hide()
	text.addEffect(beauty.singleTextLimitWord(dataEasy.getCfgByKey(slot5).name, {
		fontSize = slot8.awardName:getFontSize()
	}, {
		width = 350
	}):anchorPoint(0.5, 0.5):xy(slot8.awardName:xy()):addTo(slot7.awardPanel, slot8.awardName:z()):color(cc.c3b(255, 255, 255)), {
		outline = {
			color = ui.COLORS.OUTLINE.DEFAULT
		}
	})
	slot7.imgCardBack:scale(2)
	slot7.awardPanel:scale(0, 1)
	transition.executeSequence(slot7.imgCardBack):func(function ()
		uv0 = "xy"

		if slot0 then
			uv0 = "widget"
			slot0, slot1 = slot0:xy()
			uv2 = "addAnimation"
			slot2, slot3 = slot2:xy()
			uv5 = "addAnimation"
			uv7 = "parent"

			widget.addAnimation(slot5:parent(), "level/zhandoujiangli.skel", slot7.isBattleWin and "fanpai" or "fanpai2", 1):anchorPoint(cc.p(0, 0)):xy(slot0 + slot2, slot1 + slot3)
			audio.playEffectWithWeekBGM("flop.mp3")
		else
			uv0 = "level/zhandoujiangli.skel"

			slot0.imgCard:show()
		end
	end):delay(slot4 and 0.6 or 0):func(function ()
		uv0 = "itemPanel"

		slot0.itemPanel:show()
	end):scaleTo(0.2, 0, 2):func(function ()
		uv1 = "transition"

		transition.executeSequence(slot1.awardPanel):scaleTo(0.2, 1, 1):done()
	end):delay(0.5):func(function ()
		uv0 = "setCanJump"

		slot0:setCanJump()
	end):done()
end

function slot0.onCloseClick(slot0)
	if not slot0.canJump or slot0.canJump < 3 then
		return
	end

	slot0:onClose()
	slot0.showEndView()
end

return slot0
