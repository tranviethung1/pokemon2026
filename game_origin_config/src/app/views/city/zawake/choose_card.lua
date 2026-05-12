slot0 = cc.load("mvc").ViewBase
slot1 = class("ZawakeChoosCardView", Dialog)

function slot2(slot0)
	for slot5, slot6 in pairs(gGameModel.role:read("card_deployment").union_training.cards or {}) do
		if slot6 == slot0 then
			return true
		end
	end

	return false
end

slot1.RESOURCE_FILENAME = "zawake_choose_card.json"
slot1.RESOURCE_BINDING = {
	["title.textNote1"] = "textNote1",
	chooseItem = "item",
	["title.textNote2"] = "textNote2",
	innerList = "innerList",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	tipPanel = {
		binds = {
			event = "visible",
			idler = bindHelper.self("showTip")
		}
	},
	list = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 3,
				asyncPreload = 12,
				data = bindHelper.self("cardDatas"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					if slot0.battle ~= slot1.battle then
						return slot0.battle == 2
					end

					if slot0.rarity ~= slot1.rarity then
						return slot0.rarity < slot1.rarity
					end

					if slot0.id ~= slot1.id then
						return slot0.id < slot1.id
					end

					return slot0.fight < slot1.fight
				end,
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1:get("head"), {
						class = "card_icon",
						props = {
							unitId = slot3.unitId,
							advance = slot3.advance,
							star = slot3.star,
							dbid = slot3.dbid,
							rarity = slot3.rarity,
							levelProps = {
								data = slot3.level
							}
						}
					})

					slot4 = gLanguageCsv.inTheTeam

					if slot3.battle == 1 and ui.CARD_USING_TXTS[slot3.battleType] then
						slot4 = gLanguageCsv[ui.CARD_USING_TXTS[slot3.battleType]]
					end

					slot5 = slot1:get("battle.textNote")

					slot5:text(slot4)
					uiEasy.addTextEffect1(slot5)
					slot1:get("textName"):text(csv.cards[slot3.id].name)
					slot1:get("textFightPoint"):text(slot3.fight)
					slot1:get("imgLock"):visible(slot3.lock)
					slot1:get("imgTick"):visible(slot3.isSel)
					slot1:get("imgMask"):visible(slot3.battle == 1 or slot3.isSel)
					slot1:get("battle"):visible(slot3.battle == 1)
					adapt.oneLinePos(slot1:get("textNote"), slot1:get("textFightPoint"))
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onSelectClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.selectCardDbId = slot1.selectCardDbId
	slot0.cardDatas = idlers.new({})
	slot0.cb = slot2
	slot0.showTip = idler.new(false)
	slot0.exchangeCfg = csv.zawake.exchange[slot1.fragID]
	slot5 = slot0:getSelectCard(slot0.selectCardDbId:read())

	slot0.cardDatas:update(slot5)
	slot0.showTip:set(itertools.size(slot5) == 0)
	slot0.textNote2:text(gLanguageCsv.card)
	adapt.oneLinePos(slot0.textNote1, slot0.textNote2, cc.p(4, 0))
	Dialog.onCreate(slot0)
end

function slot1.getSelectCard(slot0, slot1)
	slot2 = {}
	slot5 = dataEasy.inUsingCardsHash()

	for slot10, slot11 in ipairs(gGameModel.role:read("cards")) do
		slot12 = gGameModel.cards:find(slot11)
		slot13 = slot12:read("card_id")
		slot15 = csv.cards[slot13]
		slot16 = csv.unit[slot15.unitID]
		slot17 = dataEasy.getUnitId(slot13, slot12:read("skin_id"))

		if slot12:read("star") == slot15.star and not itertools.include(slot0.exchangeCfg.roriCards, slot13) then
			for slot21, slot22 in csvMapPairs(slot0.exchangeCfg.needCards) do
				if slot22[1] == slot16.rarity and (slot22[2] == -1 or slot22[2] == slot16.natureType or slot22[2] == slot16.natureType2) then
					slot24 = slot5[slot11]
					uv24 = "csv"
					slot2[slot11] = {
						id = slot13,
						unitId = slot17,
						rarity = slot16.rarity,
						fight = slot12:read("fighting_point"),
						level = slot12:read("level"),
						star = slot12:read("star"),
						advance = slot12:read("advance"),
						dbid = slot11,
						lock = slot12:read("locked"),
						battle = slot5[slot11] and 1 or 2,
						battleType = slot24,
						isUnion = slot24(slot11),
						isSel = slot1 == slot11,
						cardType = slot15.cardType
					}
				end
			end

			for slot21, slot22 in csvMapPairs(slot0.exchangeCfg.needSpecialCards) do
				if slot22 == slot15.cardMarkID then
					slot24 = slot5[slot11]
					uv24 = "csv"
					slot2[slot11] = {
						id = slot13,
						unitId = slot17,
						rarity = slot16.rarity,
						fight = slot12:read("fighting_point"),
						level = slot12:read("level"),
						star = slot12:read("star"),
						advance = slot12:read("advance"),
						dbid = slot11,
						lock = slot12:read("locked"),
						battle = slot5[slot11] and 1 or 2,
						battleType = slot24,
						isUnion = slot24(slot11),
						isSel = curSle == slot11,
						cardType = slot15.cardType
					}
				end
			end
		end
	end

	return slot2
end

function slot1.onSelectClick(slot0, slot1, slot2, slot3)
	if slot3.isSel then
		return
	end

	function slot4()
		uv0 = "lock"

		if slot0.lock then
			gGameUI:showDialog({
				btnType = 2,
				clearFast = true,
				cb = function ()
					uv6 = "gGameUI"
					uv7 = "stackUI"
					uv10 = "city.card.strengthen"
					uv11 = "gGameUI"

					gGameUI:stackUI("city.card.strengthen", nil, {
						full = true
					}, 1, slot6.dbid, slot7:createHandler("onChangeData", slot10, slot11))
				end,
				content = string.format(gLanguageCsv.gotoUnLock, gLanguageCsv.starSkillExchange)
			})

			return true
		end
	end

	if function ()
		uv0 = "battle"

		if slot0.battle == 1 then
			uv2 = "battle"
			slot2 = gGameUI

			slot2:showTip(gLanguageCsv[({
				crossCraft = "inCrossCraftCantExchange",
				arena = "inArenaCantExchange",
				crossArena = "inCrossArenaCantExchange",
				crossMine = "inCrossMineCantExchange",
				unionTraining = "isInUnionCantExchange",
				gymBadgeGuard = "inGymBadgeGuardCantExchange",
				unionFight = "inUnionFightCantExchange",
				craft = "inCraftCantExchange",
				crossGymLeader = "inCrossGymCantExchange",
				battle = "inCityTeamCantExchange",
				gymLeader = "inGymCantExchange",
				cloneBattle = "inCloneBattleCantExchange"
			})[slot2.battleType]])

			return true
		end
	end() then
		return
	end

	if slot4() then
		return
	end

	slot7 = nil

	if slot3.level > 1 or slot3.advance > 1 or csv.cards[slot3.id].star < slot3.star then
		slot7 = gLanguageCsv.selectCardMaterialsMega
	end

	function slot8()
		uv0 = "selectCardDbId"
		slot0 = slot0.selectCardDbId
		slot1 = slot0
		slot0 = slot0.set
		uv2 = "set"

		slot0(slot1, slot2.dbid)

		uv0 = "dbid"
		uv1 = "selectCardDbId"

		slot0.onClose(slot1)
	end

	if slot7 then
		gGameUI:showDialog({
			fontSize = 50,
			btnType = 2,
			isRich = true,
			title = gLanguageCsv.spaceTips,
			content = slot7,
			cb = slot8
		})

		return
	end

	slot8()
end

function slot1.onChangeData(slot0, slot1, slot2)
	slot0.cardDatas:atproxy(slot2.dbid).lock = gGameModel.cards:find(slot2.dbid):read("locked")
end

return slot1
