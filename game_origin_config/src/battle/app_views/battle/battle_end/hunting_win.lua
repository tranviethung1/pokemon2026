slot0 = class("HuntingWinView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "battle_end_hunting_win.json"
slot0.RESOURCE_BINDING = {
	awardsList = "awardsList",
	awardsItem = "awardsItem",
	bkg = {
		binds = {
			event = "click",
			method = bindHelper.self("onQuitClick")
		}
	}
}

function slot0.playEndEffect(slot0)
	slot1 = slot0:getResourceNode()
	slot2 = CSprite.new("level/jiesuanshengli.skel")

	slot2:addTo(slot1, 100)
	slot2:setAnchorPoint(cc.p(0.5, 1))
	slot2:setPosition(slot1:get("title"):getPosition())
	slot2:visible(true)
	slot2:play("jiesuan_shenglizi")
	slot2:addPlay("jiesuan_shenglizi_loop")
	slot2:retain()

	slot3 = CSprite.new("level/jiesuanshengli.skel")

	slot3:addTo(slot1, 99)
	slot3:setAnchorPoint(cc.p(0.5, 1))
	slot3:setPosition(slot1:get("title"):getPosition())
	slot3:visible(true)
	slot3:play("jiesuan_shenglitu")
	slot3:addPlay("jiesuan_shenglitu_loop")
	slot3:retain()
end

function slot0.onCreate(slot0, slot1, slot2, slot3, slot4)
	audio.playEffectWithWeekBGM("gate_win.mp3")

	slot0.data = slot3
	slot0.results = slot4
	slot0.sceneID = slot2

	slot0:playEndEffect()
	slot0:showCardStateInfo()
	slot0:getResourceNode():get("awardsText"):text(gLanguageCsv.getAwards .. ":")

	if next(dataEasy.mergeRawDate(slot4.serverData.drop or {})) then
		slot0:showItem(1, slot8)
	else
		slot9, slot10 = slot6:xy()

		slot6:xy(slot9 + 325, slot10)
		slot6:text(gLanguageCsv.passAwardsAlreadyToplimit)
		slot0.awardsList:hide()
	end
end

function slot0.showItem(slot0, slot1, slot2)
	slot3 = slot0.awardsItem:clone()

	slot3:show()
	bind.extend(slot0, slot3, {
		class = "icon_key",
		props = {
			data = {
				key = slot2[slot1].key,
				num = slot2[slot1].num,
				dbId = slot2[slot1].dbId
			},
			isDouble = dataEasy.isGateIdDoubleDrop(slot0.sceneID),
			specialKey = {
				maxLimit = true
			},
			onNode = function (slot0)
				slot1, slot2 = slot0:xy()

				slot0:xy(slot1, slot2 + 3)
				slot0:hide():z(2)
				transition.executeSequence(slot0, true):delay(0.5):func(function ()
					uv0 = "show"

					slot0:show()
				end):done()
			end
		}
	})
	slot0.awardsList:setItemsMargin(25)
	slot0.awardsList:pushBackCustomItem(slot3)
	slot0.awardsList:setScrollBarEnabled(false)
	transition.executeSequence(slot0.awardsList):delay(0.1):func(function ()
		uv0 = "table"
		uv2 = "length"

		if slot0 < table.length(slot2) then
			uv0 = "showItem"
			uv2 = "table"
			uv3 = "length"

			slot0:showItem(slot2 + 1, slot3)
		end
	end):done()
end

function slot0.showCardStateInfo(slot0)
	slot5 = slot0:getResourceNode():get("cardsList")

	slot5:setScrollBarEnabled(false)
	slot5:setItemsMargin(25)

	for slot9, slot10 in pairs(slot0.data.roleOut or {}) do
		if slot9 <= 6 then
			slot11 = slot2:get("cardItem"):clone()

			slot5:pushBackCustomItem(slot11)
			bind.extend(slot0, slot11:get("card"), {
				class = "card_icon",
				props = {
					unitId = slot10.roleId,
					advance = slot10.advance,
					star = slot10.star,
					rarity = csv.unit[slot10.roleId].rarity
				}
			})

			if (slot0.results.cardStates or {})[slot10.cardId] then
				slot11:get("hpBar"):setPercent(math.floor(slot12[1] * 100))
				slot11:get("mpBar"):setPercent(math.floor(slot12[2] * 100))
				slot11:get("mask"):visible(slot12[1] <= 0)
			end
		end
	end
end

function slot0.onQuitClick(slot0)
	gGameUI:switchUI("city.view")
end

return slot0
