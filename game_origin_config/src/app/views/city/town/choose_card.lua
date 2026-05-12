slot0 = game.TOWN_CARD_STATE
slot1 = {
	[slot0.NONE] = "cardIdle",
	[slot0.IDLE] = "cardIdle",
	[slot0.REST] = gLanguageCsv.restIn,
	[slot0.ALCHEMYFACTORY] = gLanguageCsv.townRestWorking,
	[slot0.ALCHEMYFACTORY1] = gLanguageCsv.townRestWorking,
	[slot0.PRODUCTION_THREE1] = gLanguageCsv.townRestWorking,
	[slot0.PRODUCTION_THREE] = gLanguageCsv.townRestWorking,
	[slot0.PRODUCTION_FOUR] = gLanguageCsv.townRestWorking,
	[slot0.FINANCIAL_CENTER] = gLanguageCsv.townRestWorking,
	[slot0.ADVENTURE] = gLanguageCsv.townRestAdventure,
	[slot0.CARDFULL] = gLanguageCsv.townRestFull,
	[slot0.ANENERGIA] = gLanguageCsv.townCardEnergyNotEnough,
	[slot0.TEAM] = gLanguageCsv.inTheTeam
}
slot2 = {
	normal = 1,
	adventure = 3,
	order = 2
}
slot4 = class("TownFactoryChooseCardView", cc.load("mvc").ViewBase)
slot4.RESOURCE_FILENAME = "town_factory_choose.json"
slot4.RESOURCE_BINDING = {
	["rightPanel.subList"] = "subList",
	leftPanel = "leftPanel",
	["rightPanel.item"] = "item",
	bg = "bg",
	rightPanel = "rightPanel",
	["rightPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				data = bindHelper.self("cardsDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				columnSize = bindHelper.self("columnSize"),
				asyncPreload = bindHelper.self("asyncPreload"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("mask", "icon")

					if not slot3.isSel then
						uv6 = "multiget"
						slot5 = slot3.status ~= slot6.IDLE
					end

					if slot3.teamId then
						uv7 = "multiget"
						slot5 = slot3.status == slot7.TEAM and true or false
					end

					bind.extend(slot0, slot4.icon, {
						class = "card_icon",
						props = {
							unitId = slot3.unitId,
							dbid = slot3.dbID,
							advance = slot3.advance,
							star = slot3.star,
							rarity = slot3.rarity,
							grayState = slot5 and 1 or 0,
							levelProps = {
								data = slot3.level
							},
							onNode = function (slot0)
								slot0:scale(1.1)
							end
						}
					})
					slot4.mask:visible(slot5)

					if slot5 then
						slot4.mask:get("choose"):visible(slot3.isSel)

						uv9 = "multiget"

						slot4.mask:get("txt"):visible(slot3.status ~= slot9.IDLE)

						slot7 = slot4.mask
						slot8 = slot7
						uv8 = "mask"

						adapt.setTextScaleWithWidth(slot7.get(slot8, "txt"), slot8[slot3.status], 200)
					end

					slot8 = slot2
					uv8 = "multiget"

					if slot3.status ~= slot8.IDLE and slot3.teamId then
						uv8 = "multiget"

						if slot3.status ~= slot8.TEAM then
							bind.touch(slot0, slot1, {
								clicksafe = true,
								methods = {
									ended = functools.partial(slot0.clickCell, slot0:getIdx(slot8), slot3)
								}
							})
						end
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onCardClick")
			}
		}
	},
	["rightPanel.btnSure"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSureClick")
			}
		}
	}
}

function slot4.onCreate(slot0, slot1, slot2, slot3, slot4, slot5)
	gGameUI.topuiManager:createView("town", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "FORMATION",
		title = slot4 and gLanguageCsv.presetFormation or gLanguageCsv.townFactoryCardDuty
	})

	slot6, slot7 = adapt.centerWithScreen("left", "right", {
		itemWidthExtra = 100,
		itemWidth = slot0.item:size().width
	}, {
		{
			slot0.leftPanel,
			"pos",
			"left"
		},
		{
			slot0.rightPanel:get("tip"),
			"pos",
			"left"
		},
		{
			slot0.rightPanel:get("list"),
			"pos",
			"left"
		},
		{
			slot0.rightPanel:get("subList"),
			"pos",
			"left"
		},
		{
			slot0.rightPanel:get("list"),
			"width"
		},
		{
			slot0.rightPanel:get("subList"),
			"width"
		}
	})
	slot0.columnSize = 5 + slot7
	slot0.asyncPreload = slot0.columnSize * 5
	slot0.idx = slot1
	slot0.factoryId = slot2
	slot0.factoryType = slot3
	slot0.teamCard = slot5
	slot0.teamId = slot4

	slot0:initModel()

	if slot4 then
		slot0.lastClick:set(0)
	else
		slot0.lastClick:set(slot0.factoryInfo:read()[slot2].card_ids[slot1] or 0)
	end

	slot0:initData()
	idlereasy.when(slot0.lastClick, function (slot0, slot1)
		uv2 = "refreshLeftPanel"

		slot2:refreshLeftPanel(slot1)
	end)
	slot0:adaptUI()
end

function slot4.initModel(slot0)
	uv2 = "factoryType"

	if slot0.factoryType == slot2.normal then
		slot0.factoryInfo = gGameModel.town:getIdler("continuous_factory")
	else
		slot0.factoryInfo = gGameModel.town:getIdler("order_factory")
	end

	slot0.cardsDatas = idlers.newWithMap({})
	slot0.filterCondition = idlertable.new()
	slot0.lastClick = idler.new(0)
	slot0.buildings = gGameModel.town:getIdler("buildings")
end

function slot4.initData(slot0)
	slot1 = {}
	slot0.selected = {}
	slot2 = gGameModel.town:read("cards")

	for slot8, slot9 in gGameModel.cards:pairs() do
		slot10 = slot9:read("card_id", "level", "star", "advance", "name", "fighting_point")
		slot11 = csv.cards[slot10.card_id]
		slot13 = csv.unit[slot11.unitID]
		slot14 = 0
		slot15 = 0
		slot16 = 0
		slot17 = nil
		slot18 = slot10.fighting_point

		if slot2[slot8] then
			slot14 = slot2[slot8].max_energy
			slot15 = slot2[slot8].energy

			if slot2[slot8].energy_refresh_time ~= 0 then
				uv20 = "selected"

				if slot2[slot8].status ~= slot20.IDLE and slot15 - math.max(math.floor((gTownFactoryCsv[slot0.factoryId][slot0.buildings:read()[slot0.factoryId].level or 1].energyExpend - townDataEasy.getCardSkillEffect(townDataEasy.getSkillCfg(slot11.townSkill, slot10.advance, slot10.star), slot0.factoryId, slot0.factoryType, slot15, slot0.factoryInfo:read()[slot0.factoryId].count).orderEnergyCost) * (time.getTime() - slot17) / 3600), 0) <= 0 then
					slot15 = 0
				end
			end
		else
			slot15 = math.floor(townDataEasy.getCardEnergy(slot10.card_id, slot10.advance, slot10.star))
		end

		if slot8 == slot0.lastClick:read() then
			uv20 = "selected"
			slot16 = slot20.IDLE or slot16
		end

		if slot15 == 0 then
			uv20 = "selected"
			slot16 = slot20.ANENERGIA
		end

		if slot19 and slot11.townSkill ~= 0 and slot14 ~= 0 then
			uv20 = "selected"

			if slot16 ~= slot20.NONE then
				slot20 = slot19.type == gTownBuildingCsv[slot0.factoryId][1].buildType

				if slot0.teamId and itertools.include(slot0.teamCard, slot8) then
					uv21 = "selected"
					slot16 = slot21.TEAM
				end

				table.insert(slot1, {
					dbID = slot8,
					unitId = slot12,
					status = slot16,
					energy = slot15,
					energyMax = slot14,
					rarity = slot13.rarity,
					attr1 = slot13.natureType,
					attr2 = slot13.natureType2,
					name = slot13.name,
					advance = slot10.advance,
					star = slot10.star,
					level = slot10.level,
					isSel = slot8 == slot0.lastClick:read(),
					fightingPoint = slot18,
					skillId = slot11.townSkill,
					atkType = slot11.atkType,
					match = slot20,
					energyRefreshTime = slot17,
					teamId = slot0.teamId
				})
			end
		end
	end

	table.sort(slot1, function (slot0, slot1)
		uv2 = "teamId"

		if slot2.teamId then
			uv3 = "status"

			if slot0.status ~= slot3.TEAM then
				uv3 = "status"

				if slot1.status == slot3.TEAM and slot0.status ~= slot1.status then
					return slot0.status < slot1.status
				end
			end
		elseif slot0.status ~= slot1.status then
			return slot0.status < slot1.status
		end

		if slot0.match ~= slot1.match then
			return slot0.match
		end

		if slot0.energy ~= slot1.energy then
			return slot1.energy < slot0.energy
		end

		return slot1.fightingPoint < slot0.fightingPoint
	end)
	slot0.cardsDatas:update(slot1)
end

function slot4.adaptUI(slot0)
	if matchLanguage({
		"en"
	}) then
		slot0.leftPanel:get("detailPanel.skillTip"):xy(cc.p(slot0.leftPanel:get("detailPanel.skillTitle"):x(), slot0.leftPanel:get("detailPanel.skillTitle"):y() - 50))
		slot0.leftPanel:get("detailPanel.skillText"):y(slot0.leftPanel:get("detailPanel.skillTip"):y() - slot0.leftPanel:get("detailPanel.skillText"):height() - 20)
	end
end

function slot4.initFilter(slot0)
	slot2 = slot0:convertToNodeSpace(slot0.filter:parent():convertToWorldSpace(slot0.filter:box()))

	gGameUI:createView("city.card.bag_filter", slot0.filter):init({
		cb = slot0:createHandler("onBattleFilter"),
		others = {
			height = 102,
			panelOffsetX = 400,
			subPanelOrder = true,
			panelOffsetY = 620,
			panelOrder = true,
			width = 250,
			btn = slot0.filter:get("btnFilter"),
			x = gGameUI:getConvertPos(slot0.filter, slot0:getResourceNode())
		}
	}):xy(-slot2.x, -slot2.y)
	slot0.filter:z(1000)
	idlereasy.any({
		slot0.filterCondition
	}, function ()
		uv1 = "dataEasy"

		dataEasy.tryCallFunc(slot1.list, "filterSortItems", false)
	end)
end

function slot4.onBattleFilter(slot0, slot1, slot2, slot3, slot4)
	slot0.filterCondition:set({
		attr1 = slot1,
		attr2 = slot2,
		rarity = slot3,
		atkType = slot4
	}, true)
end

function slot4.onFilterCards(slot0, slot1)
	slot3 = {
		{
			"rarity",
			slot0.filterCondition:read().rarity < ui.RARITY_LAST_VAL and slot2.rarity or nil
		},
		{
			"attr2",
			slot2.attr2 < ui.ATTR_MAX and slot2.attr2 or nil
		},
		{
			"attr1",
			slot2.attr1 < ui.ATTR_MAX and slot2.attr1 or nil
		},
		{
			"atkType",
			slot2.atkType
		}
	}

	function slot4(slot0, slot1, slot2)
		if slot0[slot1] == nil and (slot1 ~= "attr2" or slot0.attr1 == slot2) then
			return true
		end

		if slot1 == "atkType" then
			for slot6, slot7 in ipairs(slot0.atkType) do
				if slot2[slot7] then
					return true
				end
			end

			return false
		end

		if slot0[slot1] == slot2 then
			return true
		end

		return false
	end

	return function ()
		error("Decompilation failed")
		-- Exception in function building!
		-- Traceback (most recent call last):
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
		--     return _build_function_definition(prototype, state.header)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
		--     node.statements.contents = _build_function_blocks(state, instructions)
		--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
		--     statement, line_marked_elements = _build_statement(state, addr, instruction)
		--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
		--     return _build_var_assignment(state, addr, instruction)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
		--     assn = func(*args, **kwargs)
		--            ^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
		--     expression = _build_const_expression(state, addr, instruction)
		--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
		--     return _build_string_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
		--     node.value = state.constants.complex_constants[index]
		--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end
end

function slot4.onCardClick(slot0, slot1, slot2, slot3)
	if slot3.isSel then
		return
	else
		for slot7, slot8 in slot0.cardsDatas:ipairs() do
			if slot8:proxy().dbID == slot0.lastClick:read() then
				slot9.isSel = false

				break
			end
		end

		for slot7, slot8 in slot0.cardsDatas:ipairs() do
			if slot8:proxy().dbID == slot3.dbID then
				slot9.isSel = true

				break
			end
		end

		slot0.lastClick:set(slot3.dbID)
	end
end

function slot4.updateSkillBuff(slot0)
	slot1 = 0
	slot3 = gGameModel.town:read("cards")
	slot4 = gGameModel.town:read("continuous_factory")[slot0.factoryId].card_ids
	slot5 = 1
	slot6 = {}

	for slot10 = 1, 3 do
		if slot10 ~= slot0.idx then
			if slot4[slot10] then
				slot12 = gGameModel.cards:find(slot4[slot10]):read("card_id", "level", "star", "advance", "name")
				slot13 = csv.cards[slot12.card_id]
				slot15 = csv.unit[slot13.unitID]
				slot16 = 0

				if townDataEasy.getSkillCfg(slot13.townSkill, slot12.advance, slot12.star) then
					for slot21 = 1, math.huge do
						if slot17["effect" .. slot21] then
							if slot17["effect" .. slot21] == game.TOWN_SKILL_EFFECT.A_ENERGY_COST_SUB then
								slot16 = slot17.id
							end
						else
							break
						end
					end
				end

				if slot3[slot4[slot10]] then
					slot6[slot5] = {
						skillId = slot16,
						energy = slot3[slot4[slot10]].energy
					}
				else
					slot18 = {}

					for slot22, slot23 in orderCsvPairs(csv.town.energy) do
						if slot23.rarity == slot15.rarity then
							slot18 = slot23

							break
						end
					end

					slot6[slot5] = {
						skillId = slot16,
						energy = slot13.energy + (slot18.advanceAdd * slot11:read("advance") + slot18.starAdd * slot11:read("star")) * slot13.energyCorrection
					}
				end
			else
				slot6[slot5] = {
					skillId = 0,
					energy = 0
				}
			end

			slot5 = slot5 + 1
		end
	end

	return slot6
end

function slot4.refreshLeftPanel(slot0, slot1)
	if slot1 == 0 then
		slot0.leftPanel:get("detailPanel"):hide()
		slot0.leftPanel:get("noData"):show()
	else
		slot2 = {}
		slot4 = gTownFactoryCsv[slot0.factoryId][gGameModel.town:read("buildings")[slot0.factoryId].level or 1]

		for slot8, slot9 in slot0.cardsDatas:ipairs() do
			if slot9:proxy().dbID == slot0.lastClick:read() then
				slot2 = slot10

				break
			end
		end

		slot0.leftPanel:get("detailPanel"):show()
		slot0.leftPanel:get("noData"):hide()
		bind.extend(slot0, slot0.leftPanel:get("detailPanel.icon"), {
			class = "card_icon",
			props = {
				unitId = slot2.unitId,
				advance = slot2.advance,
				star = slot2.star,
				dbid = slot2.dbID,
				rarity = slot2.rarity,
				levelProps = {
					data = slot2.level
				},
				onNode = function (slot0)
					slot0:scale(1.5)
				end
			}
		})

		if slot2.energyRefreshTime then
			slot8 = math.min(slot2.energy + math.max(math.floor((time.getTime() - slot2.energyRefreshTime) / 3600 * gCommonConfigCsv.townHomeEnergyRecovery), 0), slot2.energyMax)
		end

		slot0.leftPanel:get("detailPanel.energyText"):text(slot2.energy .. "/" .. slot2.energyMax)

		slot11 = 0

		adapt.oneLinePos(slot0.leftPanel:get("detailPanel.energyIcon"), slot0.leftPanel:get("detailPanel.energyText"), cc.p(5, slot11))

		slot6 = nil
		slot7 = slot4.energyExpend

		for slot11, slot12 in orderCsvPairs(csv.town.skill) do
			if slot12.skill == slot2.skillId and slot12.needAdvance <= slot2.advance and slot12.needStar <= slot2.star then
				slot6 = slot12
			end
		end

		if slot6 then
			slot0.leftPanel:get("detailPanel.skillTitle"):text(slot6.name .. gLanguageCsv["symbolRome" .. slot6.level])
			slot0.leftPanel:get("detailPanel.skillTip"):visible(not (slot6.type == gTownBuildingCsv[slot0.factoryId][1].buildType))

			if not matchLanguage({
				"en"
			}) then
				adapt.oneLinePos(slot0.leftPanel:get("detailPanel.skillTitle"), slot0.leftPanel:get("detailPanel.skillTip"), cc.p(5, 0))
			end

			for slot12 = 1, math.huge do
				if slot6["effect" .. slot12] then
					if slot6["effect" .. slot12] ~= 0 then
						uv15 = "leftPanel"

						if slot0.factoryType == slot15.normal then
							slot0:updateSkillBuff()[3] = {
								skillId = slot13,
								energy = slot2.energy
							}
							slot15 = 0

							if slot2.energy ~= 0 then
								slot15 = slot0:getWorkTime(slot7, slot14)
							end

							slot0.leftPanel:get("detailPanel.timeText"):text(time.getCutDown(slot15).str)

							if slot13 == game.TOWN_SKILL_EFFECT.A_ENERGY_COST_SUB then
								break
							end
						else
							uv15 = "leftPanel"

							if slot0.factoryType == slot15.order then
								if slot13 == game.TOWN_SKILL_EFFECT.B_ENERGY_COST_SUB then
									slot14, slot15 = csvNext(slot6["params" .. slot12])
									slot16, slot17 = dataEasy.parsePercentStr(slot15)

									slot0.leftPanel:get("detailPanel.timeText"):text(time.getCutDown(math.floor(slot2.energy / (slot7 * (100 - slot16) / 100) * 3600)).str)

									break
								end

								slot0.leftPanel:get("detailPanel.timeText"):text(time.getCutDown(math.floor(slot2.energy / slot7 * 3600)).str)
							end
						end
					end
				else
					break
				end
			end

			beauty.textScroll({
				isRich = true,
				list = slot0.leftPanel:get("detailPanel.skillText"),
				strs = "#C0x5B545B#" .. slot6.desc
			})
		end

		adapt.oneLinePos(slot0.leftPanel:get("detailPanel.timeImg"), slot0.leftPanel:get("detailPanel.timeText"), cc.p(5, 0))
	end

	if slot0.teamId then
		itertools.invoke({
			slot0.leftPanel:get("detailPanel.timeImg"),
			slot0.leftPanel:get("detailPanel.timeText")
		}, "hide")
		adapt.oneLineCenterPos(cc.p(slot0.leftPanel:get("detailPanel"):size().width / 2, slot0.leftPanel:get("detailPanel.energyIcon"):y()), {
			slot0.leftPanel:get("detailPanel.energyIcon"),
			slot0.leftPanel:get("detailPanel.energyText")
		}, cc.p(0, 0))
		slot0.leftPanel:get("detailPanel.skillTip"):hide()
	end
end

function slot4.getWorkTime(slot0, slot1, slot2)
	slot3 = slot1

	for slot7, slot8 in ipairs(slot2) do
		for slot12 = 1, math.huge do
			if (csv.town.skill[slot8.skillId] and slot13["effect" .. slot12]) == game.TOWN_SKILL_EFFECT.A_ENERGY_COST_SUB then
				slot14, slot15 = csvNext(slot13["params" .. slot12])
				slot16, slot17 = dataEasy.parsePercentStr(slot15)

				if slot17 == 0 then
					slot3 = math.min(slot3, slot1 * (100 - slot16) / 100)
				else
					slot3 = math.min(slot3, slot1 - slot16)
				end
			else
				break
			end
		end
	end

	return slot0:getNextTime(slot1, slot2, 0, slot3, 0)
end

function slot4.getNextTime(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot5 > 10 then
		return slot3
	end

	assert(slot4 > 0, "TownFactoryChooseCardView:getNextTime curCost <= 0")

	for slot11, slot12 in ipairs(slot2) do
		if slot12.energy > 0.1 then
			slot7 = math.min(math.huge, slot12.energy / slot4 * 3600)
		end
	end

	if not ({
		[slot11] = slot13
	})[3] then
		return slot3
	end

	if slot6[3] == slot7 then
		return slot3 + slot7
	end

	slot8 = slot1

	for slot12, slot13 in ipairs(slot2) do
		slot13.energy = slot13.energy - slot7 * slot4 / 3600

		if slot13.energy > 0 then
			for slot17 = 1, math.huge do
				if (csv.town.skill[slot13.skillId] and slot18["effect" .. slot17]) == game.TOWN_SKILL_EFFECT.A_ENERGY_COST_SUB then
					slot19, slot20 = csvNext(slot18["params" .. slot17])
					slot21, slot22 = dataEasy.parsePercentStr(slot20)

					if slot22 == 0 then
						slot8 = math.min(slot8, slot1 * (100 - slot21) / 100)
					else
						slot8 = math.min(slot8, slot1 - slot21)
					end
				else
					break
				end
			end
		end
	end

	return slot0:getNextTime(slot1, slot2, slot3, slot8, slot5 + 1)
end

function slot4.onSureClick(slot0)
	if slot0.teamId then
		if itertools.include(slot0.teamCard, slot0.lastClick:read()) then
			gGameUI:showTip(gLanguageCsv.townReadySameCard)

			return
		end

		if slot0.lastClick:read() == 0 then
			gGameUI:showTip(gLanguageCsv.notSelRole)

			return
		end

		slot0.teamCard[slot0.idx] = slot0.lastClick:read()

		gGameApp:requestServer("/game/town/ready/card/deploy", function (slot0)
			uv1 = "onClose"
			uv2 = "onClose"

			slot1.onClose(slot2)
		end, slot0.teamId, slot0.teamCard)

		return
	end

	if slot0.lastClick:read() == slot0.factoryInfo:read()[slot0.factoryId].card_ids[slot0.idx] or slot0.lastClick:read() == 0 then
		uv2 = "teamId"

		slot2.onClose(slot0)

		return
	end

	uv3 = "itertools"

	if slot0.factoryType == slot3.normal then
		gGameApp:requestServer("/town/continuous/card/place", function (slot0)
			uv1 = "onClose"
			uv2 = "onClose"

			slot1.onClose(slot2)
		end, slot0.factoryId, slot0.idx, slot0.lastClick:read())
	else
		uv3 = "itertools"

		if slot0.factoryType == slot3.order then
			gGameApp:requestServer("/town/order/card/place", function (slot0)
				uv1 = "onClose"
				uv2 = "onClose"

				slot1.onClose(slot2)
			end, slot0.factoryId, slot0.idx, slot0.lastClick:read())
		end
	end
end

function slot4.onClose(slot0)
	if slot0.teamId then
		uv1 = "teamId"

		slot1.onClose(slot0)

		return
	end

	if slot0.lastClick:read() == slot0.factoryInfo:read()[slot0.factoryId].card_ids[slot0.idx] or slot0.lastClick:read() == 0 then
		uv2 = "teamId"

		slot2.onClose(slot0)

		return
	end

	gGameUI:showDialog({
		isRich = false,
		btnType = 2,
		clearFast = true,
		cb = function ()
			uv0 = "onSureClick"

			slot0:onSureClick()
		end,
		closeCb = function ()
			uv0 = "onClose"
			uv1 = "onClose"

			slot0.onClose(slot1)
		end,
		content = string.format(gLanguageCsv.townFactoryDutyeExit),
		size = {
			width = 850,
			height = 450
		},
		dialogParams = {
			clickClose = false
		}
	})
end

return slot4
