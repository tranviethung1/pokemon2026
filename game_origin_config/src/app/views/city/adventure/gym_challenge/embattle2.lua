slot1 = class("GymChallengeEmbattleView", require("app.views.city.card.embattle.base"))
slot1.RESOURCE_FILENAME = "gym_embattle2.json"
slot1.RESOURCE_BINDING = {
	spritePanel = "spriteItem",
	upItem = "upItem",
	attrItem = "attrItem",
	rightTop = "rightTop",
	["rightTop.textNote"] = "textNote",
	battlePanel = "battlePanel",
	rightDown = "rightDown",
	bottomPanel = "bottomPanel",
	["rightTop.imgBg"] = "attrBg",
	["battlePanel.ahead.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["battlePanel.back.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightDown.btnChallenge"] = {
		varname = "btnChallenge",
		binds = {
			event = "touch",
			clicksafe = true,
			methods = {
				ended = bindHelper.self("fightBtn")
			}
		}
	},
	["rightDown.btnChallenge.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightDown.btnOneKeySet"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("oneKeyEmbattleBtn")
			}
		}
	},
	["rightDown.btnOneKeySet.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightTop.arrList"] = {
		varname = "arrList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("limitInfo"),
				item = bindHelper.self("attrItem"),
				textNote = bindHelper.self("textNote"),
				attrBg = bindHelper.self("attrBg"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("imgIcon"):texture(ui.ATTR_ICON[slot3])
				end,
				onAfterBuild = function (slot0)
					slot2 = csvSize(slot0.data)
					slot3 = slot0.item:size().width * slot2 + slot0:getItemsMargin() * (slot2 - 1)

					slot0:setAnchorPoint(cc.p(1, 0.5))
					slot0:width(slot3)
					slot0:xy(cc.p(600, 50))
					adapt.oneLinePos(slot0, slot0.textNote, cc.p(0, 0), "right")
					slot0.attrBg:width(slot3 + slot0.textNote:width() + 40)
					slot0.attrBg:x(slot0.textNote:x() - 40)
				end
			}
		}
	},
	["textPanel.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("battleNum")
		}
	}
}

function slot1.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose", false)
	}):init({
		subTitle = "FORMATION",
		title = gLanguageCsv.formation
	})
	slot0:initDefine(slot1)
	slot0:initParams(slot1)
	slot0:initModel(slot1)
	slot0:initRoundUIPanel()
	slot0:initHeroSprite()
	slot0:initBottomList()
	slot0.battleCardsData:set(slot0:getOneKeyCardDatas())
end

function slot1.initDefine(slot0, slot1)
	slot0.embattleMax = csv.gym.gate[slot1.gateId].deployCardNumLimit
	slot0.deployType = csv.gym.gate[slot1.gateId].deployType
	slot0.panelNum = slot0.embattleMax
	slot0.gymId = slot1.gymId
	slot0.k = slot1.k
end

function slot1.initParams(slot0, slot1)
	slot1 = slot1 or {}
	slot0.from = game.EMBATTLE_FROM_TABLE.onekey
	slot0.sceneType = game.SCENE_TYPE.gym
	slot0.fightCb = slot1.fightCb
	slot0.limitInfo = csv.gym.gate[slot1.gateId].deployNatureLimit
	slot0.checkBattleArr = slot1.checkBattleArr or function ()
		return true
	end
end

function slot1.initRoundUIPanel(slot0)
	adapt.centerWithScreen("left", "right", nil, {
		{
			slot0.rightDown,
			"pos",
			"right"
		},
		{
			slot0.rightTop,
			"pos",
			"right"
		}
	})

	if itertools.size(slot0.limitInfo) == 0 then
		slot0.rightTop:hide()
	end
end

function slot1.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot10 = itertools.map(slot0.limitInfo or {}, function (slot0, slot1)
		return slot1, 1
	end)
	slot12 = csv.unit[csv.cards[slot2].unitID]

	if csvSize(slot0.limitInfo) == 0 or slot10[slot12.natureType] or slot10[slot12.natureType2] then
		uv13 = "itertools"

		return slot13.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	else
		return nil
	end
end

function slot1.initHeroSprite(slot0)
	slot0.heroSprite = {}

	for slot4 = 1, slot0.embattleMax do
		slot5 = slot0.upItem:clone():addTo(slot0.battlePanel, 2, "panel" .. slot4)

		slot5:show()

		slot0.heroSprite[slot4] = {
			sprite = slot5,
			idx = slot4
		}
	end

	slot4 = 0

	if slot0.embattleMax <= 6 then
		for slot9 = 1, slot0.embattleMax do
			slot0.heroSprite[slot9].sprite:xy(slot0.battlePanel:size().width / 2 - (slot0.upItem:width() + 50) * (slot0.embattleMax - 1) / 2 + (slot9 - 1) * (slot2 + slot1), slot3.height / 2 + 110)
		end
	else
		for slot10 = 1, slot0.embattleMax do
			slot11 = slot0.embattleMax - math.floor(slot0.embattleMax / 2)

			if slot10 <= math.ceil(slot0.embattleMax / 2) then
				slot0.heroSprite[slot10].sprite:xy(slot3.width / 2 - (slot2 + slot1) * (math.ceil(slot0.embattleMax / 2) - 1) / 2 + (slot10 - 1) * (slot2 + slot1), slot3.height / 2 + 120 + slot0.upItem:height() / 2 + 5)
			else
				slot0.heroSprite[slot10].sprite:xy(slot4 + (slot10 - slot11 - 1) * (slot2 + slot1), slot3.height / 2 + 120 - slot6 / 2 - 5)
			end
		end
	end

	idlereasy.when(slot0.clientBattleCards, function (slot0, slot1)
		slot2 = 0
		uv4 = "embattleMax"

		for slot6 = 1, slot4.embattleMax do
			uv7 = "embattleMax"
			slot7 = slot7.heroSprite[slot6]
			slot13 = gLanguageCsv.unionFightRound
			slot14 = slot6

			slot7.sprite:get("tagIdx"):text(string.format(slot13, slot14))

			uv13 = "embattleMax"
			uv14 = "embattleMax"

			slot7.sprite:onTouch(functools.partial(slot13.onBattleCardTouch, slot14, slot6))

			if slot1[slot6] then
				slot10 = gGameModel.cards:find(slot9)

				slot8:get("add"):hide()

				slot12 = slot8:get("info"):show():multiget("head", "level", "text", "fightPoint", "attr1", "attr2")

				slot12.fightPoint:text(slot10:read("fighting_point"))
				adapt.oneLineCenterPos(cc.p(170, 50), {
					slot12.text,
					slot12.fightPoint
				}, cc.p(5, 0))
				slot12.level:text(gLanguageCsv.textLv .. slot10:read("level"))

				slot14 = csv.unit[dataEasy.getUnitId(slot10:read("card_id"), slot10:read("skin_id"))]

				slot12.attr1:texture(ui.ATTR_ICON[slot14.natureType])
				slot12.attr2:visible(slot14.natureType2 and true or false)
				adapt.oneLineCenterPos(cc.p(170, 140), {
					slot12.level,
					slot12.attr1,
					slot12.attr2
				}, cc.p(5, 0))

				if slot16 then
					slot12.attr2:texture(ui.ATTR_ICON[slot16])
				end

				slot11:removeChildByName("starPanel")

				slot17 = uiEasy.getStarPanel(slot10:read("star"), {
					interval = -5,
					align = "center",
					dbid = slot9
				}):scale(0.35):xy(170, 100)
				slot18 = slot17

				slot17.addTo(slot18, slot11, 2)

				uv18 = "embattleMax"

				bind.extend(slot18, slot12.head, {
					class = "card_icon",
					props = {
						unitId = slot13,
						rarity = slot10:read("rarity"),
						advance = slot10:read("advance"),
						onNode = function (slot0)
							slot0:xy(-6, -6)
						end
					}
				})

				slot2 = slot2 + 1
			else
				slot8:get("add"):show()
				slot8:get("info"):hide()
			end
		end

		uv3 = "embattleMax"
		uv7 = "embattleMax"

		slot3.battleNum:set(slot2 .. "/" .. slot7.embattleMax)
	end)
end

function slot1.createMovePanel(slot0, slot1)
	if slot0.movePanel then
		slot0.movePanel:removeSelf()
	end

	slot2 = slot0.spriteItem:clone():addTo(slot0:getResourceNode(), 1000)

	bind.extend(slot0, slot2, {
		class = "card_icon",
		props = {
			unitId = slot1.unit_id,
			advance = slot1.advance,
			rarity = slot1.rarity,
			star = slot1.star,
			dbid = slot1.dbid,
			levelProps = {
				data = slot1.level
			},
			onNode = function (slot0)
				slot0:xy(-2, -2)
			end
		}
	})
	slot2:show()

	slot0.movePanel = slot2

	return slot2
end

function slot1.onBattleCardTouch(slot0, slot1, slot2)
	if not slot0.clientBattleCards:read()[slot1] then
		return
	end

	if slot2.name == "began" then
		slot0:createMovePanel(slot0:getCardAttrs(slot3))
		slot0.selectIndex:set(slot1)
		slot0.heroSprite[slot1].sprite:get("info"):hide()
		slot0.heroSprite[slot1].sprite:get("add"):show()
		slot0.movePanel:xy(slot2.x, slot2.y)
	elseif slot2.name == "moved" then
		slot0:moveMovePanel(slot2)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot0.heroSprite[slot1].sprite:get("info"):show()
		slot0.heroSprite[slot1].sprite:get("add"):hide()
		slot0:deleteMovingItem()

		if slot2.y < 340 then
			slot0:onCardClick(slot4, true)
		elseif slot0:whichEmbattleTargetPos(slot2) then
			if slot5 ~= slot1 then
				slot0:onCardMove(slot4, slot5, true)
				audio.playEffectWithWeekBGM("formation.mp3")
			else
				slot0:onCardMove(slot4, slot5, false)
			end
		else
			slot0:onCardMove(slot4, slot1, false)
		end
	end
end

function slot1.whichEmbattleTargetPos(slot0, slot1)
	for slot5, slot6 in pairs(slot0.heroSprite) do
		slot7 = slot6.sprite
		slot8 = slot7:box()
		slot9 = slot7:getParent():convertToWorldSpace(cc.p(slot8.x, slot8.y))
		slot8.y = slot9.y
		slot8.x = slot9.x

		if cc.rectContainsPoint(slot8, slot1) then
			return slot5
		end
	end
end

function slot1.onClose(slot0)
	slot1 = gGameModel.gym:read("date")
	slot3 = {
		[slot7] = stringz.bintohex(slot8)
	}

	for slot7, slot8 in pairs(slot0.clientBattleCards:read()) do
		-- Nothing
	end

	cc.load("mvc").ViewBase.onClose(slot0)
end

return slot1
