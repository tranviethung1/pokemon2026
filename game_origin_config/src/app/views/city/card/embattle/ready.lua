slot0 = cc.load("mvc").ViewBase
slot1 = class("CardEmbattleReady", Dialog)
slot1.RESOURCE_FILENAME = "card_embattle_ready.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	btnClose = {
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
				asyncPreload = 4,
				data = bindHelper.self("battleDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("list", "node", "name", "btnGHimg", "power", "powerText", "btnChangeName", "btnSure", "btnFormation", "btnClear").name:text(slot3.name)

					if csv.weather_system.weather[slot3.extra.weather] then
						slot1:get("btnWeather"):show()
						slot1:get("btnWeather.icon"):texture(slot5.iconRes)
					else
						slot1:get("btnWeather"):hide()
					end

					bind.extend(slot0, slot4.btnGHimg, {
						class = "buff_arms",
						props = {
							noListener = true,
							battleCards = slot3.cards,
							arms = slot3.extra.arms or {},
							sceneType = slot3.sceneType,
							onNode = function (slot0)
								slot0:scale(0.8)
							end
						}
					})
					slot4.powerText:text(slot3.getFightSumNum)
					adapt.oneLinePos(slot4.power, slot4.powerText, cc.p(0, 0))
					slot4.btnClear:setTouchEnabled(slot3.state)
					slot4.btnSure:setTouchEnabled(slot3.state)
					text.deleteAllEffect(slot4.btnSure:get("textNote"))

					if slot3.state then
						cache.setShader(slot4.btnClear, false, "normal")
						cache.setShader(slot4.btnSure, false, "normal")
						text.addEffect(slot4.btnSure:get("textNote"), {
							color = ui.COLORS.NORMAL.WHITE,
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
					else
						cache.setShader(slot4.btnClear, false, "hsl_gray")
						cache.setShader(slot4.btnSure, false, "hsl_gray")
						text.addEffect(slot4.btnSure:get("textNote"), {
							color = ui.COLORS.DISABLED.WHITE
						})
					end

					slot4.list:removeAllItems()
					slot4.list:setScrollBarEnabled(false)

					for slot9 = 1, 6 do
						slot10 = slot4.node:clone()

						slot10:visible(true)
						slot10:setTouchEnabled(true)
						bind.touch(slot0, slot10, {
							methods = {
								ended = functools.partial(slot0.formationClickCell, slot2, slot3)
							}
						})

						if slot3.cardsData[slot9] then
							bind.extend(slot0, slot10, {
								class = "card_icon",
								props = {
									unitId = dataEasy.getUnitId(slot3.cardsData[slot9]:read("card_id"), slot3.cardsData[slot9]:read("skin_id")),
									advance = slot3.cardsData[slot9]:read("advance"),
									rarity = slot3.cardsData[slot9]:read("rarity"),
									star = slot3.cardsData[slot9]:read("star"),
									dbid = slot3.cardsData[slot9]:read("id"),
									levelProps = {
										data = slot3.cardsData[slot9]:read("level")
									}
								}
							})
							slot10:get("bg"):visible(false)
						end

						slot4.list:pushBackCustomItem(slot10)
					end

					bind.touch(slot0, slot4.btnClear, {
						methods = {
							ended = functools.partial(slot0.clearClickCell, slot2, slot3)
						}
					})
					bind.touch(slot0, slot4.btnFormation, {
						methods = {
							ended = functools.partial(slot0.formationClickCell, slot2, slot3)
						}
					})
					bind.touch(slot0, slot4.btnSure, {
						methods = {
							ended = functools.partial(slot0.sureClickCell, slot2, slot3)
						}
					})
					bind.touch(slot0, slot4.btnChangeName, {
						methods = {
							ended = functools.partial(slot0.changeNameClickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				sureClickCell = bindHelper.self("onSureClick"),
				clearClickCell = bindHelper.self("onClearClick"),
				formationClickCell = bindHelper.self("onFormationClick"),
				changeNameClickCell = bindHelper.self("onChangeNameClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.params = slot1

	slot0:initModel()

	slot0.battleDatas = idlers.newWithMap({})

	idlereasy.when(slot0.ready_cards, function (slot0, slot1)
		slot2 = {}

		for slot6 = 1, gCommonConfigCsv.embattleReadyMax do
			slot7 = {}
			slot8 = true
			slot9 = gLanguageCsv["team" .. slot6]
			slot10 = 0
			slot11 = dataEasy.fixInMeteorCards(slot1[slot6] and slot1[slot6].cards or {})

			if slot1[slot6] then
				for slot15, slot16 in pairs(slot11) do
					slot8 = false
					uv17 = "gCommonConfigCsv"
					slot7[slot15] = slot17:getCardAttr(slot16)
				end

				uv12 = "gCommonConfigCsv"
				slot10 = slot12:getFightSumNum(slot11)

				if slot1[slot6].name and slot1[slot6].name ~= "" then
					slot9 = slot1[slot6].name
				end
			end

			slot15 = not slot8
			uv15 = "embattleReadyMax"

			table.insert(slot2, {
				cards = slot11,
				cardsData = slot7,
				name = slot9,
				state = slot15,
				getFightSumNum = slot10,
				sceneType = slot15.sceneType,
				extra = slot1[slot6] and slot1[slot6].extra or {}
			})
		end

		slot3 = dataEasy.tryCallFunc
		uv4 = "gCommonConfigCsv"

		slot3(slot4.list, "updatePreloadCenterIndex")

		uv3 = "gCommonConfigCsv"

		slot3.battleDatas:update(slot2)
	end)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.ready_cards = gGameModel.role:getIdler("ready_cards")
end

function slot1.getCardAttr(slot0, slot1, slot2)
	if slot2 then
		return gGameModel.cards:find(slot1):read(slot2)
	else
		return gGameModel.cards:find(slot1)
	end
end

function slot1.getFightSumNum(slot0, slot1)
	for slot6, slot7 in pairs(slot1) do
		slot2 = 0 + slot0:getCardAttr(slot7, "fighting_point")
	end

	return slot2
end

function slot1.onSureClick(slot0, slot1, slot2, slot3)
	function slot4()
		slot0 = gGameUI
		slot1 = slot0
		slot0 = slot0.showTip

		slot0(slot1, gLanguageCsv.teamSaveSuccess)

		uv0 = "gGameUI"
		uv1 = "showTip"

		slot0.onClose(slot1)
	end

	slot5 = table.deepcopy(slot3.cards, true)
	slot6 = table.deepcopy(slot3.extra, true)

	if slot0.params.from == game.EMBATTLE_FROM_TABLE.onlineFight then
		slot9 = {}
		slot10 = false
		slot11 = {}

		for slot15, slot16 in csvPairs(csv.cross.online_fight.theme_open) do
			if slot16.day == math.floor((time.getTime() - time.getNumTimestamp(gGameModel.cross_online_fight:read("start_date"), 5, 0, 0)) / 60 / 60 / 24) + 1 then
				slot9 = slot16

				break
			end
		end

		if itertools.size(slot9.invalidMarkIDs or {}) ~= 0 or itertools.size(slot9.invalidMegaCardIDs or {}) ~= 0 then
			for slot15, slot16 in pairs(slot5) do
				if itertools.include(slot9.invalidMarkIDs, csv.cards[gGameModel.cards:find(slot16):read("card_id")].cardMarkID) or itertools.include(slot9.invalidMegaCardIDs, csv.cards[slot18].cardMarkID) then
					slot10 = true
					slot5[slot15] = nil
				end
			end
		end

		if slot10 then
			function slot12()
				uv0 = "params"
				uv1 = "cb"
				uv2 = "params"
				uv3 = "cb"

				slot0.params.cb(slot1, slot2, slot3)
			end

			if itertools.size(slot5) == 0 then
				function slot12()
					gGameUI:showTip(gLanguageCsv.readTeamNoneCard)
				end
			end

			gGameUI:showDialog({
				btnType = 2,
				clearFast = true,
				cb = slot12,
				content = gLanguageCsv.readTeamHasBanCard
			})

			return
		end
	end

	slot0.params.cb(slot5, slot4, slot6)
end

function slot1.onClearClick(slot0, slot1, slot2, slot3)
	gGameUI:showDialog({
		btnType = 2,
		content = gLanguageCsv.teamClear,
		cb = function ()
			uv4 = "gGameApp"

			gGameApp:requestServer("/game/ready/card/deploy", function (slot0)
				gGameUI:showTip(gLanguageCsv.positionSave)
			end, slot4, {})
		end
	})
end

function slot1.onFormationClick(slot0, slot1, slot2, slot3)
	gGameUI:stackUI("city.card.embattle.base", nil, {
		full = true
	}, {
		sceneType = slot0.params.sceneType,
		from = game.EMBATTLE_FROM_TABLE.ready,
		inputCards = idlertable.new(slot3.cards),
		readyIdx = slot2,
		inputExtra = slot3.extra
	})
end

function slot1.onChangeNameClick(slot0, slot1, slot2, slot3)
	gGameUI:stackUI("city.card.changename", nil, , {
		cost = 0,
		typ = "ready",
		maxFontCount = 7,
		name = slot3.name,
		titleTxt = gLanguageCsv.changeReadyName,
		requestParams = {
			slot2
		},
		cb = function (slot0)
			uv1 = "battleDatas"
			uv3 = "atproxy"
			slot1.battleDatas:atproxy(slot3).name = slot0
		end
	})
end

return slot1
