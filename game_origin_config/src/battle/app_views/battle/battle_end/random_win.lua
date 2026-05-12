slot0 = class("BattleEndRandomWinView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "battle_end_random_win.json"
slot0.RESOURCE_BINDING = {
	text2 = "text2",
	["cardItem.card"] = "awardsItem",
	awardsList = "awardsList",
	["backBtn.text"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["againBtn.text"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["dungeonsBtn.text"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	bkg = {
		binds = {
			event = "click",
			method = bindHelper.self("onDungeonsBtnClick")
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

function slot0.onCreate(slot0, slot1, slot2)
	audio.playEffectWithWeekBGM("gate_win.mp3")

	slot0.battleView = slot1
	slot0.data = slot1.data
	slot0.sceneID = slot1.sceneID
	slot0.results = slot2

	if matchLanguage({
		"en"
	}) then
		slot0.text2:ignoreContentAdaptWithSize(false)
		slot0.text2:setContentSize(cc.size(450, 200))
		slot0.text2:setTextVerticalAlignment(cc.VERTICAL_TEXT_ALIGNMENT_CENTER)
		slot0.text2:setTextHorizontalAlignment(cc.TEXT_ALIGNMENT_LEFT)
		slot0.text2:y(slot0.text2:y() - 22)
	end

	for slot8, slot9 in pairs({
		backBtn = "back2City",
		againBtn = "playAgain",
		dungeonsBtn = "dungeonList"
	}) do
		slot0:getResourceNode():get(slot8 .. ".text"):text(gLanguageCsv[slot9])
	end

	slot0:showPlayerScoreInfo()
	slot0:playEndEffect()
	slot0:showStarsInfo()
	slot0:showCardStateInfo()
	slot0:showItemInfo()
end

function slot0.showPlayerScoreInfo(slot0)
	slot1 = slot0.sceneID
	slot5 = slot0:getResourceNode():multiget("score", "levelTextNote", "levelTextExtre")

	slot5.score:text(((slot0.results.serverData or {}).point >= 0 and "+" or "-") .. tostring(slot3))
	adapt.oneLinePos(slot5.levelTextNote, {
		slot5.score,
		slot5.levelTextExtre
	}, cc.p(10, 0))
end

function slot0.showStarsInfo(slot0)
	slot1 = slot0:getResourceNode()
	slot2 = slot0.results

	if slot2.conditionTb and slot2.gateStarTb then
		for slot8 = 1, 3 do
			slot12 = slot1:get("text" .. slot8)

			slot12:text(string.format(gLanguageCsv["starCondition" .. slot3[slot8][1]], slot3[slot8][2]))
			text.addEffect(slot12, {
				color = ui.COLORS.NORMAL.LIGHT_GREEN
			})

			if not slot4[slot8][1] then
				text.addEffect(slot12, {
					color = cc.c4b(236, 183, 42, 255)
				})
			end

			slot1:get("star" .. slot8 .. ".achieve"):setVisible(slot11)
		end
	end
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

function slot0.showItemInfo(slot0)
	slot1 = slot0:getResourceNode()
	slot3 = {}

	if next((slot0.results.serverData or {}).award or {}) ~= nil then
		function (slot0)
			if next(slot0) then
				for slot4, slot5 in csvMapPairs(slot0) do
					uv8 = "next"

					table.insert(slot8, {
						key = slot4,
						num = slot5
					})
				end
			end
		end(slot2)
	end
end

function slot0.showItem(slot0, slot1, slot2)
	function slot3(slot0, slot1)
		slot2 = slot0:size()
		slot3 = cc.Sprite:create(slot1):addTo(slot0, 999):anchorPoint(1, 1):xy(slot2.width, slot2.height)
	end

	slot4 = slot0.awardsItem:clone()

	slot4:show()

	slot5 = slot2[slot1]

	bind.extend(slot0, slot4, {
		class = "icon_key",
		props = {
			data = {
				key = slot5.key,
				num = slot5.num
			},
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
	slot0.awardsList:pushBackCustomItem(slot4)
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

function slot0.onBackBtnClick(slot0)
	gGameUI:switchUI("city.view")
end

function slot0.onAgainBtnClick(slot0)
	slot0.battleView.entrance:restart()
end

function slot0.onDungeonsBtnClick(slot0)
	gGameUI:switchUI("city.view")
end

return slot0
