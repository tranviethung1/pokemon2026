slot1 = class("SummerChallengeGateDetail", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "summer_challenge_gate_detail.json"
slot1.RESOURCE_BINDING = {
	title3 = "title3",
	rewardList = "rewardList",
	item = "item",
	title1 = "title1",
	reviewPanel = "reviewPanel",
	title2 = "title2",
	["reviewPanel.list"] = "reviewList",
	gateTextList = "gateTextList",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	enemyList = {
		varname = "enemyList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				padding = 10,
				data = bindHelper.self("combatDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							cardId = slot3.unitId == 0 and slot3.cardId or nil,
							unitId = slot3.unitId > 0 and slot3.unitId or nil,
							advance = slot3.advance,
							levelProps = {
								data = slot3.level
							},
							star = slot3.star,
							rarity = slot3.rarity,
							onNode = function (slot0)
								uv3 = "y"

								slot0:y(slot3:height() / 2)
								slot0:anchorPoint(0, 0.5)
								slot0:scale(0.9)
							end
						}
					})
				end
			}
		}
	},
	battleBtn = {
		varname = "battleBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBattleClick")
			}
		}
	},
	["battleBtn.title"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}
slot1.RESOURCE_STYLES = {
	blackLayer = true,
	clickClose = true
}

function slot1.onCreate(slot0, slot1)
	slot0.handler = slot1.handler
	slot0.yyID = slot1.yyID
	slot2 = slot1.data
	slot4 = slot2.gateCfg
	slot0.gateCfg = slot4
	slot0.gateID = slot2.gateID

	slot0.title2:text(slot2.floor)
	slot0.title3:text(slot4.name)
	adapt.oneLinePos(slot0.title1, slot0.title2, cc.p(3, 0))
	adapt.oneLinePos(slot0.title2, slot0.title3, cc.p(15, 0))
	beauty.textScroll({
		isRich = true,
		fontSize = 36,
		list = slot0.gateTextList,
		strs = "#C0x5B545B#" .. slot4.desc
	})
	uiEasy.createItemsToList(slot0, slot0.rewardList, slot4.award, {
		scale = 0.8
	})

	slot0.combatDatas = idlers.newWithMap(slot0:getMonsters(csv.summer_challenge.monsters[slot4.monsterIDs[itertools.size(slot4.monsterIDs)]].cards))
	slot9 = csv.yunying.yyhuodong[slot0.yyID]
	slot11 = ((gGameModel.role:read("yyhuodongs")[slot0.yyID] or {}).stamps or {})[slot0.gateID] == 1

	slot0.battleBtn:visible(not slot11)
	slot0.reviewPanel:visible(slot11)

	if slot11 then
		beauty.textScroll({
			isRich = true,
			fontSize = 40,
			list = slot0.reviewList,
			strs = "#C0x5B545B#" .. slot4.reviewPlot
		})
	end
end

function slot1.getMonsters(slot0, slot1)
	slot2 = {}

	for slot7, slot8 in ipairs(slot1) do
		if slot8 > 0 then
			slot9 = csv.summer_challenge.cards[slot8]

			table.insert(slot2, {
				cardId = slot9.cardID,
				unitId = slot9.unitID,
				advance = slot9.advance,
				level = slot9.level,
				rarity = slot9.rarity,
				star = slot9.star
			})
		end
	end

	return slot2
end

function slot1.onBattleClick(slot0)
	gGameUI:stackUI("city.activity.summer_challenge.embattle", nil, {
		full = true
	}, {
		fightCb = slot0:createHandler("startFighting"),
		gateCfg = slot0.gateCfg,
		gateID = slot0.gateID,
		yyID = slot0.yyID
	})
end

function slot1.startFighting(slot0, slot1, slot2)
	slot0.handler(slot1, slot0, slot2)
end

return slot1
