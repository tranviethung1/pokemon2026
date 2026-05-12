slot0 = 8
slot1 = game.TOWN_CARD_STATE
slot2 = {
	normal = 1,
	order = 2
}
slot3 = {
	[slot1.NONE] = "cardIdle",
	[slot1.IDLE] = "cardIdle",
	[slot1.REST] = gLanguageCsv.restIn,
	[slot1.ALCHEMYFACTORY] = gLanguageCsv.townRestWorking,
	[slot1.ALCHEMYFACTORY1] = gLanguageCsv.townRestWorking,
	[slot1.PRODUCTION_THREE1] = gLanguageCsv.townRestWorking,
	[slot1.PRODUCTION_THREE] = gLanguageCsv.townRestWorking,
	[slot1.PRODUCTION_FOUR] = gLanguageCsv.townRestWorking,
	[slot1.FINANCIAL_CENTER] = gLanguageCsv.townRestWorking,
	[slot1.ADVENTURE] = gLanguageCsv.townRestAdventure,
	[slot1.CARDFULL] = gLanguageCsv.townRestFull,
	[slot1.ANENERGIA] = gLanguageCsv.townCardEnergyNotEnough
}
slot4 = class("TownFactoryTeamView", Dialog)
slot4.RESOURCE_FILENAME = "town_factory_team.json"
slot4.RESOURCE_BINDING = {
	item = "item",
	["topPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				padding = 10,
				data = bindHelper.self("allTeamDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("name", "btnChangeName", "list", "item", "btnReset", "btnApply")

					adapt.setTextScaleWithWidth(slot4.name, slot3.name, 250)
					bind.touch(slot0, slot4.btnChangeName, {
						methods = {
							ended = functools.partial(slot0.clickTeamName, slot2, slot3)
						}
					})
					bind.touch(slot0, slot4.btnReset, {
						methods = {
							ended = functools.partial(slot0.clickReset, slot2)
						}
					})
					bind.touch(slot0, slot4.btnApply, {
						methods = {
							ended = functools.partial(slot0.clickApply, slot2, slot3)
						}
					})
					slot4.btnReset:visible(slot3.state)
					uiEasy.setBtnShader(slot4.btnApply, false, slot3.state and 1 or 2)
					slot4.list:removeAllItems()
					slot4.list:setScrollBarEnabled(false)

					for slot8 = 1, 3 do
						slot9 = slot4.item:clone()

						slot9:show()

						slot10 = slot9:get("add")

						itertools.invoke({
							slot9:get("btnDel"),
							slot9:get("icon"),
							slot9:get("skill"),
							slot9:get("energyImg"),
							slot9:get("energNum"),
							slot9:get("mask")
						}, "hide")
						slot9:get("add"):show()

						if slot3.cardsData[slot8] then
							itertools.invoke({
								slot9:get("btnDel"),
								slot9:get("icon"),
								slot9:get("skill"),
								slot9:get("energyImg"),
								slot9:get("energNum")
							}, "show")
							slot9:get("add"):hide()

							slot10 = slot9:get("icon")
							slot14 = slot3.cardsData[slot8].energyCur

							slot9:get("energNum"):text(math.floor(slot14))
							slot9:get("skill"):texture(slot3.cardsData[slot8].skillIcon)

							uv14 = "multiget"

							slot9:get("mask"):visible(slot3.cardsData[slot8].status ~= slot14.IDLE)

							slot13 = "mask.txt"
							uv13 = "name"

							slot9:get(slot13):text(slot13[slot3.cardsData[slot8].status])
							uiEasy.addTextEffect1(slot9:get("mask.txt"))

							uv18 = "multiget"

							bind.extend(slot0, slot9:get("icon"), {
								class = "card_icon",
								props = {
									unitId = slot3.cardsData[slot8].unitId,
									advance = slot3.cardsData[slot8].cardInfo.advance,
									dbid = slot3.cardsData[slot8].dbid,
									rarity = slot3.cardsData[slot8].rarity,
									grayState = slot3.cardsData[slot8].status ~= slot18.IDLE and 1 or 0,
									star = slot11.star,
									levelProps = {
										data = slot11.level
									}
								}
							})
							bind.touch(slot0, slot9:get("btnDel"), {
								methods = {
									ended = functools.partial(slot0.clickDown, slot2, slot3, slot8)
								}
							})
							bind.touch(slot0, slot9:get("skill"), {
								methods = {
									ended = functools.partial(slot0.clickSkill, slot8, slot3, slot9:get("skill"))
								}
							})
						end

						bind.touch(slot0, slot10, {
							methods = {
								ended = functools.partial(slot0.clickCellItem, slot2, slot3, slot8)
							}
						})
						slot4.list:pushBackCustomItem(slot9)
					end
				end
			},
			handlers = {
				clickTeamName = bindHelper.self("changeName"),
				clickCellItem = bindHelper.self("addCards"),
				clickDown = bindHelper.self("downCards"),
				clickSkill = bindHelper.self("skillDetail"),
				clickReset = bindHelper.self("resetTeam"),
				clickApply = bindHelper.self("applyTeam")
			}
		}
	}
}

function slot4.onCreate(slot0, slot1, slot2)
	slot0.buildingId = slot1
	slot0.factoryType = slot2

	slot0:initModel()
	idlereasy.when(slot0.teamDatas, function (slot0, slot1)
		slot3 = slot1
		uv3 = "table"

		slot3:updateTeamDatas(table.deepcopy(slot3, true))
	end)
	Dialog.onCreate(slot0)
end

function slot4.initModel(slot0)
	slot0.allTeamDatas = idlers.new()
	slot0.teamDatas = gGameModel.town:getIdler("ready_cards")
	slot1 = gGameModel.town
	slot2 = slot1
	slot0.buildings = slot1.getIdler(slot2, "buildings")
	uv2 = "allTeamDatas"

	if slot0.factoryType == slot2.normal then
		slot0.factoryInfo = gGameModel.town:getIdler("continuous_factory")
	else
		slot0.factoryInfo = gGameModel.town:getIdler("order_factory")
	end
end

function slot4.updateTeamDatas(slot0, slot1)
	slot2 = {}
	uv4 = "gLanguageCsv"

	for slot6 = 1, slot4 do
		slot7 = {}
		slot8 = true
		slot9 = gLanguageCsv.team .. gLanguageCsv["symbolNumber" .. slot6]
		slot10 = slot1[slot6] and slot1[slot6].cards or {}

		if slot1[slot6] then
			for slot14, slot15 in pairs(slot10) do
				slot8 = false
				slot7[slot14] = slot0:getCardInfo(slot15)
			end

			if slot1[slot6].name and slot1[slot6].name ~= "" then
				slot9 = slot1[slot6].name
			end
		end

		table.insert(slot2, {
			cards = slot10,
			cardsData = slot7,
			name = slot9,
			state = not slot8
		})
	end

	dataEasy.tryCallFunc(slot0.list, "updatePreloadCenterIndex")
	slot0.allTeamDatas:update(slot2)
end

function slot4.getCardInfo(slot0, slot1)
	slot3 = gGameModel.cards:find(slot1):read("card_id", "level", "star", "advance")
	slot4 = csv.cards[slot3.card_id]
	slot6 = csv.unit[slot4.unitID].rarity
	slot7 = 0
	slot8 = 0
	slot9 = 0
	slot10 = nil

	if gGameModel.town:read("cards")[slot1] then
		slot7 = slot2[slot1].max_energy
		slot8 = slot2[slot1].energy

		if slot2[slot1].energy_refresh_time and slot14 ~= 0 then
			uv15 = "gGameModel"

			if slot2[slot1].status ~= slot15.IDLE and slot8 - math.max(math.floor((gTownFactoryCsv[slot0.buildingId][gGameModel.town:read("buildings")[slot0.buildingId].level or 1].energyExpend - townDataEasy.getCardSkillEffect(townDataEasy.getSkillCfg(slot4.townSkill, slot3.advance, slot3.star), slot0.buildingId, slot0.factoryType, slot8, slot0.factoryInfo:read()[slot0.buildingId].count).orderEnergyCost) * (time.getTime() - slot14) / 3600), 0) <= 0 then
				slot8 = 0
			end
		end
	else
		slot8 = townDataEasy.getCardEnergy(slot3.card_id, slot3.advance, slot3.star)
	end

	if slot8 == 0 then
		uv14 = "gGameModel"
		slot9 = slot14.ANENERGIA
	end

	return {
		energyCur = slot8,
		energyMax = slot7,
		dbid = slot1,
		skillIcon = slot11.icon,
		cardInfo = slot3,
		name = slot4.name,
		unitId = slot5,
		rarity = slot6,
		status = slot9
	}
end

function slot4.changeName(slot0, slot1, slot2, slot3)
	gGameUI:stackUI("city.card.changename", nil, , {
		typ = "team",
		titleTxt = gLanguageCsv.changeReadyName,
		requestParams = {
			slot2
		},
		name = slot3.name
	})
end

function slot4.resetTeam(slot0, slot1, slot2)
	gGameUI:showDialog({
		btnType = 2,
		isRich = false,
		clearFast = true,
		cb = function ()
			uv4 = "gGameApp"

			gGameApp:requestServer("/game/town/ready/card/deploy", function (slot0)
				gGameUI:showTip(gLanguageCsv.positionSave)
			end, slot4, {})
		end,
		content = gLanguageCsv.townReadyReset
	})
end

function slot4.applyTeam(slot0, slot1, slot2, slot3)
	slot4 = itertools.size(slot3.cardsData)
	slot5 = {}

	for slot10 = 1, 3 do
		if slot3.cardsData[slot10] then
			uv12 = "itertools"

			if slot3.cardsData[slot10].status ~= slot12.IDLE then
				table.insert(slot5, slot3.cardsData[slot10].name)

				table.deepcopy(slot3.cards)[slot10] = nil
			end
		end
	end

	function slot7()
		uv4 = "gGameApp"
		uv5 = "requestServer"
		uv6 = "/game/town/ready/card/place"

		gGameApp:requestServer("/game/town/ready/card/place", function (slot0)
			uv2 = "Dialog"

			Dialog.onClose(slot2)
		end, slot4.buildingId, slot5, slot6)
	end

	if itertools.size(slot5) == slot4 then
		gGameUI:showTip(gLanguageCsv.townReadyAllWork)

		return
	elseif itertools.size(slot5) > 0 then
		gGameUI:showDialog({
			btnType = 2,
			isRich = true,
			clearFast = true,
			cb = slot7,
			content = string.format(gLanguageCsv.townReadyCardWork, table.concat(slot5, ",")),
			size = {
				width = 850,
				height = 450
			}
		})

		return
	else
		if itertools.size(slot0.factoryInfo:read()[slot0.buildingId].card_ids) > 0 then
			gGameUI:showDialog({
				btnType = 2,
				isRich = true,
				clearFast = true,
				cb = slot7,
				content = gLanguageCsv.townReadyCardReplace,
				size = {
					width = 850,
					height = 450
				}
			})

			return
		end

		slot7()
	end
end

function slot4.addCards(slot0, slot1, slot2, slot3, slot4)
	gGameUI:stackUI("city.town.choose_card", nil, , slot4, slot0.buildingId, slot0.factoryType, slot2, slot3.cards)
end

function slot4.downCards(slot0, slot1, slot2, slot3, slot4)
	slot3.cards[slot4] = nil

	gGameApp:requestServer("/game/town/ready/card/deploy", function (slot0)
		gGameUI:showTip(gLanguageCsv.positionSave)
	end, slot2, slot3.cards)
end

function slot4.skillDetail(slot0, slot1, slot2, slot3, slot4)
	if not slot3.cards[slot2] then
		return
	end

	if slot4:getParent():convertToWorldSpace(cc.p(slot4:xy())).x > 1600 then
		-- Nothing
	else
		slot6.pos = cc.p(slot7.x + 400, slot7.y - 20)
		slot6.sign = true
	end

	slot8 = gGameModel.cards:find(slot5):read("card_id", "level", "star", "advance", "name")

	gGameUI:stackUI("city.town.exploration.tip", nil, {
		dispatchNodes = gGameUI.uiRoot:getResourceNode()
	}, {
		pos = cc.p(slot7.x - 400, slot7.y - 20),
		sign = false,
		townSkillCsv = townDataEasy.getSkillCfg(csv.cards[slot8.card_id].townSkill, slot8.advance, slot8.star),
		isSameSign = true
	})
end

return slot4
