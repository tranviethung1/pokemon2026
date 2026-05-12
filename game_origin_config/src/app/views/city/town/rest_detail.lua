slot0 = 2
slot1 = gCommonConfigCsv.townHomeEnergyRecovery
slot2 = game.TOWN_CARD_STATE
slot3 = {
	[slot2.NONE] = "CardIdle",
	[slot2.IDLE] = "CardIdle",
	[slot2.REST] = gLanguageCsv.restIn,
	[slot2.ALCHEMYFACTORY] = gLanguageCsv.townRestWorking,
	[slot2.PRODUCTION_THREE] = gLanguageCsv.townRestWorking,
	[slot2.PRODUCTION_FOUR] = gLanguageCsv.townRestWorking,
	[slot2.FINANCIAL_CENTER] = gLanguageCsv.townRestWorking,
	[slot2.ADVENTURE] = gLanguageCsv.townRestAdventure,
	[slot2.ALCHEMYFACTORY1] = gLanguageCsv.townRestWorking,
	[slot2.PRODUCTION_THREE1] = gLanguageCsv.townRestWorking,
	[slot2.CARDFULL] = gLanguageCsv.townRestFull
}
slot4 = class("TownRestDetailView", Dialog)
slot4.RESOURCE_FILENAME = "town_rest_detail.json"
slot4.RESOURCE_BINDING = {
	noData = "noData",
	["down.textNum"] = "textNum",
	item = "item",
	["down.textNote"] = "textNote",
	title = "title",
	innerList = "innerList",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 3,
				asyncPreload = 15,
				data = bindHelper.self("cardDatas"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("head", "textName", "energyNum", "imgMask", "imgTick", "battle", "energyIcon")

					bind.extend(slot0, slot4.head, {
						class = "card_icon",
						props = {
							unitId = slot3.unitId,
							advance = slot3.advance,
							dbid = slot3.dbID,
							star = slot3.star,
							rarity = slot3.rarity,
							levelProps = {
								data = slot3.level
							}
						}
					})

					slot6 = "#C0x5B545B#"
					slot9 = "textNote"
					uv9 = "multiget"

					slot4.battle:get(slot9):text(slot9[slot3.status])

					if slot3.energy <= slot3.energyMax then
						uv8 = "head"

						if slot3.status ~= slot8.REST then
							uv8 = "head"

							if slot3.status == slot8.IDLE then
								uv8 = "head"

								if slot3.energy + math.max(math.floor((time.getTime() - slot3.energyRefreshTime) / 3600 * (slot3.status == slot8.REST and slot3.reply or gCommonConfigCsv.townHomeEnergyRecovery)), 0) < slot3.energyMax then
									slot6 = "#C0xF76B45#"
								else
									uv10 = "head"

									if slot3.status == slot10.REST then
										slot11 = "textNote"
										uv11 = "multiget"
										uv12 = "head"

										slot4.battle:get(slot11):text(slot11[slot12.CARDFULL])
									end

									slot5 = slot3.energyMax
								end
							else
								uv8 = "head"

								if slot3.status == slot8.CARDFULL then
									slot5 = slot3.energyMax
								end
							end
						end
					end

					slot4.energyNum:removeAllChildren()
					rich.createWithWidth(slot6 .. slot5 .. "#C0x5B545B#/" .. slot3.energyMax, 40, nil, 1000):anchorPoint(cc.p(0, 0.5)):addTo(slot4.energyNum):xy(0, 0)
					slot4.energyNum:text("")

					slot12 = 5

					adapt.oneLinePos(slot4.energyIcon, slot4.energyNum, cc.p(slot12, 0))

					slot8 = slot1:get("battle.textNote")
					uv12 = "head"

					slot4.imgMask:visible(slot3.status ~= slot12.IDLE or slot3.isSel)

					uv12 = "head"

					slot4.battle:visible(slot3.status ~= slot12.IDLE)
					slot4.imgTick:visible(slot3.isSel)
					uiEasy.addTextEffect1(slot8)
					text.addEffect(slot8, {
						outline = {
							color = cc.c4b(255, 84, 0, 255)
						}
					})
					slot4.textName:text(slot3.name)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot0:getIdx(slot2), slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onCellClick"),
				from = bindHelper.self("from")
			}
		}
	},
	["down.btnOk"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSureClick")
			}
		}
	},
	tipPanel = {
		binds = {
			event = "visible",
			idler = bindHelper.self("showTip")
		}
	}
}

function slot4.onCreate(slot0, slot1)
	slot0.cb = slot1.cb

	slot0:initModel()
	slot0:initData()
	slot0.textNum:text(string.format("%s/%s", itertools.size(slot0.selected), slot0.maxNum))
	adapt.oneLinePos(slot0.textNote, slot0.textNum, nil, "left")
	adapt.setTextScaleWithWidth(slot0.noData:get("tipText"), nil, 550)
	adapt.oneLinePos(slot0.title:get("textNote1"), slot0.title:get("textNote2"), cc.p(5, 0))
	Dialog.onCreate(slot0)
end

function slot4.initModel(slot0)
	slot1 = gGameModel.town
	slot2 = slot1
	uv2 = "level"
	slot0.level = slot1.read(slot2, "buildings")[slot2].level
	slot0.myCards = gGameModel.town:read("cards")
	slot0.showTip = idler.new(false)
	slot0.cardDatas = idlers.newWithMap({})
	slot0.maxNum = csv.town.home[slot0.level].cardNum
	slot0.reply = csv.town.home[slot0.level].reply
end

function slot4.initData(slot0)
	slot1 = {}
	slot0.selected = {}

	for slot5, slot6 in pairs(slot0.myCards) do
		if gGameModel.cards:find(slot5) then
			slot11 = csv.unit[csv.cards[slot7:read("card_id", "level", "star", "advance", "name").card_id].unitID]
			slot14 = math.floor((time.getTime() - slot6.energy_refresh_time) / 3600 * slot0.reply)
			uv14 = "selected"

			if slot6.status == slot14.IDLE and slot6.max_energy <= slot6.energy + math.max(slot14, 0) then
				uv14 = "selected"
				slot13 = slot14.CARDFULL
			end

			uv15 = "selected"

			if slot6.status ~= slot15.NONE then
				slot15 = slot1

				table.insert(slot15, {
					isSel = false,
					dbID = slot5,
					name = slot11.name,
					unitId = slot10,
					status = slot13,
					energy = slot6.energy,
					energyMax = slot6.max_energy,
					energyRefreshTime = slot6.energy_refresh_time,
					rarity = slot11.rarity,
					advance = slot8.advance,
					star = slot8.star,
					level = slot8.level,
					reply = slot0.reply
				})

				uv15 = "selected"

				if slot6.status == slot15.REST then
					slot0.selected[slot5] = slot6
				end
			end
		end
	end

	table.sort(slot1, function (slot0, slot1)
		if slot0.status ~= slot1.status then
			return slot0.status < slot1.status
		end

		slot3 = slot0.energy
		uv3 = "status"
		slot6 = slot1.energy
		uv6 = "status"

		return slot0.energyRefreshTime + (slot0.energyMax - slot3) / slot3.reply * 60 * 60 - time.getTime() > slot1.energyRefreshTime + (slot1.energyMax - slot6) / slot6.reply * 60 * 60 - time.getTime()
	end)
	slot0.cardDatas:update(slot1)
	slot0.noData:visible(itertools.size(slot1) == 0)
end

function slot4.onCellClick(slot0, slot1, slot2, slot3)
	slot4 = itertools.size(slot0.selected)

	if slot3.status ~= 0 then
		gGameUI:showTip(gLanguageCsv.townRestCanNotBeSelect)

		return
	end

	if not slot3.isSel and slot0.maxNum <= slot4 then
		gGameUI:showTip(gLanguageCsv.townRestCardFull)

		return
	end

	if slot3.isSel then
		slot0.cardDatas:atproxy(slot2.k).isSel = false
		slot0.selected[slot2.k] = nil

		slot0.textNum:text(string.format("%s/%s", itertools.size(slot0.selected), slot0.maxNum))
		adapt.oneLinePos(slot0.textNote, slot0.textNum, nil, "left")
	else
		slot0.cardDatas:atproxy(slot2.k).isSel = true
		slot0.selected[slot2.k] = slot3

		slot0.textNum:text(string.format("%s/%s", itertools.size(slot0.selected), slot0.maxNum))
		adapt.oneLinePos(slot0.textNote, slot0.textNum, nil, "left")
	end
end

function slot4.onSureClick(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.selected) do
		table.insert(slot1, slot6.dbID)
	end

	if itertools.size(slot1) == 0 then
		gGameUI:showTip(gLanguageCsv.townRestNoCardBeSelect)
	else
		gGameApp:requestServer("/town/home/card/rest", function (slot0)
			slot1 = gGameUI
			slot1 = slot1.showTip

			slot1(slot1, gLanguageCsv.townRestNoCardSelect)

			uv1 = "gGameUI"

			if slot1.cb then
				uv1 = "gGameUI"

				slot1.cb()
			end

			uv1 = "gGameUI"

			slot1:onClose()
		end, slot1)
	end
end

return slot4
