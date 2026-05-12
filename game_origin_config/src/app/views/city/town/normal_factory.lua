slot0 = {
	[game.TOWN_BUILDING_ID.GOLDHOUSE] = "Gold Smelter",
	[game.TOWN_BUILDING_ID.CUTTINGHOUSE] = "Lumber Yard",
	[game.TOWN_BUILDING_ID.DESSERTHOUSE] = "Dessert Station",
	[game.TOWN_BUILDING_ID.BANKHOUSE] = "Financial Bank",
	[game.TOWN_BUILDING_ID.GOLDHOUSE1] = "Gold Smelter",
	[game.TOWN_BUILDING_ID.CUTTINGHOUSE1] = "Lumber Yard"
}
slot1 = {
	[game.TOWN_BUILDING_ID.GOLDHOUSE] = "gold_smelter",
	[game.TOWN_BUILDING_ID.GOLDHOUSE1] = "gold_smelter",
	[game.TOWN_BUILDING_ID.CUTTINGHOUSE] = "lumber",
	[game.TOWN_BUILDING_ID.CUTTINGHOUSE1] = "lumber",
	[game.TOWN_BUILDING_ID.DESSERTHOUSE] = "exploration",
	[game.TOWN_BUILDING_ID.BANKHOUSE] = "financial"
}
slot2 = {
	[game.TOWN_BUILDING_ID.GOLDHOUSE] = "city/town/basebuilding/base_3.png",
	[game.TOWN_BUILDING_ID.GOLDHOUSE1] = "city/town/basebuilding/base_3.png",
	[game.TOWN_BUILDING_ID.CUTTINGHOUSE] = "city/town/basebuilding/base_4.png",
	[game.TOWN_BUILDING_ID.CUTTINGHOUSE1] = "city/town/basebuilding/base_4.png",
	[game.TOWN_BUILDING_ID.DESSERTHOUSE] = "city/town/basebuilding/base_5.png",
	[game.TOWN_BUILDING_ID.BANKHOUSE] = "city/town/basebuilding/base_6.png"
}
slot3 = {
	[game.TOWN_BUILDING_ID.GOLDHOUSE] = "town/hometown_lianjin.mp3",
	[game.TOWN_BUILDING_ID.GOLDHOUSE1] = "town/hometown_lianjin.mp3",
	[game.TOWN_BUILDING_ID.CUTTINGHOUSE] = "town/hometown_famu.mp3",
	[game.TOWN_BUILDING_ID.CUTTINGHOUSE1] = "town/hometown_famu.mp3",
	[game.TOWN_BUILDING_ID.DESSERTHOUSE] = "town/hometown_tiandian.mp3"
}
slot5 = class("TownOrderFactoryView", cc.load("mvc").ViewBase)
slot5.RESOURCE_FILENAME = "town_normal_factory.json"
slot5.RESOURCE_BINDING = {
	["rightTopPanel.consumePanel.icon"] = "consumeIcon",
	["rightTopPanel.inventoryPanel"] = "inventoryPanel",
	["rightTopPanel.consumePanel.num"] = "consumeNum",
	["rightTopPanel.productPanel.num"] = "productNum",
	["rightTopPanel.inventoryPanel.num"] = "inventoryNum",
	["leftPanel.img"] = "img",
	leftPanel = "leftPanel",
	["rightTopPanel.inventoryPanel.max"] = "inventorymax",
	rightBottomPanel = "rightBottomPanel",
	["rightTopPanel.consumePanel"] = "consumePanel",
	["leftPanel.levelNum"] = "levelNum",
	bg = "bg",
	["rightBottomPanel.item"] = "item",
	["rightTopPanel.productPanel"] = "productPanel",
	["rightTopPanel.inventoryPanel.icon"] = "inventoryIcon",
	["rightTopPanel.productPanel.icon"] = "productIcon",
	rightTopPanel = "rightTopPanel",
	awardPanel = {
		varname = "awardPanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAwardClick")
			}
		}
	},
	["leftPanel.rule"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	["leftPanel.btnUp"] = {
		varname = "btnUp",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onUpClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "townBuildingUpgradeRedHint",
					listenData = {
						buildingId = bindHelper.self("buildingId"),
						isHideMark = bindHelper.self("redCanHideMark")
					}
				}
			}
		}
	},
	["leftPanel.immediatelyPanel.btnfinish"] = {
		varname = "btnfinish",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuildingLevelUpTip")
			}
		}
	},
	["leftPanel.updatingPanel.timeText"] = {
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = cc.c4b(91, 84, 91, 255)
					}
				}
			}
		}
	},
	["rightBottomPanel.team"] = {
		varname = "btnTeam",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onTeamClick")
			}
		}
	},
	["rightBottomPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("workDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("icon", "down", "add", "doPanel", "tip")
					slot5 = ui.COLORS.NORMAL.DEFAULT

					if slot3.dbid == 0 then
						slot4.add:show()
						slot4.down:hide()
						slot4.tip:text(gLanguageCsv.townFactoryEmptySeat):show()
						slot4.doPanel:hide()
						slot4.icon:hide()
						bind.touch(slot0, slot4.add, {
							methods = {
								ended = functools.partial(slot0.clickCellItem, slot2, slot3)
							}
						})
					else
						slot4.add:hide()
						slot4.down:show()
						slot4.icon:show()

						if slot3.energy == 0 then
							slot4.tip:text(gLanguageCsv.townFactoryEndWork):show()
							slot4.doPanel:hide()

							slot5 = ui.COLORS.NORMAL.ALERT_ORANGE
						else
							slot4.doPanel:show()
							slot4.tip:hide()
							slot4.doPanel:get("energyNum"):text(slot3.energy .. "/" .. slot3.energyMax)
							adapt.oneLineCenterPos(cc.p(slot4.doPanel:size().width / 2, slot4.doPanel:get("energyNum"):y()), {
								slot4.doPanel:get("energyImg"),
								slot4.doPanel:get("energyNum")
							}, cc.p(6, 0))
						end

						if slot3.skillMatch then
							slot4.doPanel:get("skill.txt"):text(gLanguageCsv.townFactorySkillMatch)
							text.addEffect(slot4.doPanel:get("skill.txt"), {
								color = cc.c4b(96, 196, 86, 255)
							})
						else
							slot4.doPanel:get("skill.txt"):text(gLanguageCsv.townFactorySkillNoMatch)
							text.addEffect(slot4.doPanel:get("skill.txt"), {
								color = cc.c4b(247, 110, 72, 255)
							})
						end

						adapt.setTextAdaptWithSize(slot4.doPanel:get("skill.txt"), {
							maxLine = 2,
							vertical = "center",
							horizontal = "center",
							size = cc.size(210, 120)
						})
						slot4.doPanel:get("skill.icon"):texture(slot3.icon)
						slot4.doPanel:get("skill"):visible(slot3.skillId ~= 0)
						bind.extend(slot0, slot4.icon, {
							class = "card_icon",
							props = {
								unitId = slot3.unitID,
								advance = slot3.advance,
								rarity = slot3.rarity,
								dbid = slot3.dbid,
								star = slot3.star,
								levelProps = {
									data = slot3.level
								},
								onNode = function (slot0)
									slot0:scale(0.8)
								end
							}
						})
						bind.touch(slot0, slot4.icon, {
							methods = {
								ended = functools.partial(slot0.clickCellItem, slot2, slot3)
							}
						})
						bind.touch(slot0, slot4.down, {
							methods = {
								ended = functools.partial(slot0.clickDown, slot2, slot3)
							}
						})
						bind.touch(slot0, slot4.doPanel:get("skill"), {
							methods = {
								ended = functools.partial(slot0.clickSkill, slot2, slot3, slot4.doPanel:get("skill"))
							}
						})
					end

					if not slot3.lock then
						slot4.tip:text(gLanguageCsv.notUnlock)
						slot4.add:get("mask"):show()
					else
						slot4.add:get("mask"):hide()
					end

					text.addEffect(slot4.tip, {
						color = slot5
					})
				end
			},
			handlers = {
				clickCellItem = bindHelper.self("addCards"),
				clickDown = bindHelper.self("downCards"),
				clickSkill = bindHelper.self("skillDetail")
			}
		}
	}
}

function slot5.onCreate(slot0, slot1, slot2, slot3)
	uv6 = "gGameUI"
	slot7 = gTownBuildingCsv[slot1][1].name
	uv7 = "topuiManager"

	gGameUI.topuiManager:createView(slot6[slot1], slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		title = slot7,
		subTitle = slot7[slot1]
	})

	slot0.factoryId = slot1
	slot0.buildingId = idler.new(slot1)
	slot0.baseType = slot2
	slot0.closeCb = slot3

	slot0:initModel()

	slot0.refresh = idler.new(true)
	slot0.redCanHideMark = idler.new(false)
	slot0.inventoryPanelY = slot0.inventoryPanel:y()
	slot0.consumePanelY = slot0.consumePanel:y()

	slot0:addRelicBuffIcon()

	slot4 = idlereasy.any

	slot4({
		slot0.buildings,
		slot0.factoryInfo,
		slot0.refresh
	}, function (slot0, slot1, slot2)
		uv3 = "stopAllActions"
		slot3 = slot3.stopAllActions

		slot3(slot3)

		uv3 = "level"
		slot3 = slot1[slot3].level or 1
		uv5 = "level"
		slot4 = gTownFactoryCsv[slot5][slot3]
		uv5 = "level"
		uv6 = "stopAllActions"

		slot6.levelNum:text(slot3)

		slot6 = tonumber(slot4.item) or slot4.item
		uv7 = "stopAllActions"
		slot7 = slot7.updateLeftImg
		uv9 = "level"

		slot7(slot7, slot9, slot3)

		uv7 = "stopAllActions"
		slot7 = slot7.productIcon
		slot7 = slot7.texture

		slot7(slot7, dataEasy.getIconResByKey(slot6))

		uv7 = "stopAllActions"
		slot7 = slot7.inventoryIcon
		slot7 = slot7.texture

		slot7(slot7, dataEasy.getIconResByKey(slot6))

		uv7 = "stopAllActions"
		slot7 = slot7.awardPanel:get("icon")
		slot7 = slot7.texture

		slot7(slot7, dataEasy.getIconResByKey(slot6))

		uv7 = "stopAllActions"
		slot7 = slot7.productNum
		slot7 = slot7.text

		slot7(slot7, slot4.efficient .. gLanguageCsv.townRestHour)

		uv7 = "stopAllActions"
		slot7 = slot7.inventoryNum
		slot7 = slot7.text

		slot7(slot7, slot4.inventory)

		uv7 = "stopAllActions"
		slot7 = slot7.consumeNum
		slot7 = slot7.text

		slot7(slot7, slot4.energyExpend .. gLanguageCsv.townRestHour)

		uv7 = "stopAllActions"
		slot7, slot8, slot9, slot10 = slot7:updateCardEnergy()
		uv11 = "stopAllActions"
		slot11 = slot11.productPanel:get("normalPanel")
		slot11 = slot11.hide

		slot11(slot11)

		uv11 = "stopAllActions"
		slot11 = slot11.productPanel:get("skillPanel")
		slot11 = slot11.hide

		slot11(slot11)

		uv11 = "stopAllActions"
		slot11 = slot11.inventoryPanel:get("normalPanel")
		slot11 = slot11.hide

		slot11(slot11)

		uv11 = "stopAllActions"
		slot11 = slot11.inventoryPanel:get("skillPanel")
		slot11 = slot11.hide

		slot11(slot11)

		uv11 = "stopAllActions"

		slot11.consumePanel:get("skillPanel"):hide()

		if (slot2[slot5] or {}).collection_time + 3600 < time.getTime() and slot5.total >= 1 then
			uv11 = "stopAllActions"
			slot11.inventoryIsMax = true
			uv11 = "stopAllActions"

			slot11.awardPanel:show()
		else
			uv11 = "stopAllActions"
			slot11.inventoryIsMax = false
			uv11 = "stopAllActions"

			slot11.awardPanel:hide()

			slot13 = 1
			uv13 = "stopAllActions"

			performWithDelay(slot13, function ()
				uv0 = "refresh"

				slot0.refresh:notify()
			end, math.max(slot5.collection_time + 3600 - time.getTime(), slot13))
		end

		uv11 = "stopAllActions"
		slot11 = slot11.showSkillAndNormalIcon
		slot13 = slot7

		slot11(slot11, slot13, slot8, slot9, slot10, slot5, slot4)

		uv11 = "stopAllActions"
		uv13 = "level"

		slot11:checkUpgradeLevel(slot13, slot1)
	end)

	uv4 = "createView"

	if slot4[slot1] then
		slot0:enableSchedule()
		slot0:schedule(function ()
			uv1 = "audio"
			uv2 = "playEffectWithWeekBGM"

			audio.playEffectWithWeekBGM(slot1[slot2])
		end, 15)
	end
end

function slot5.initModel(slot0)
	slot0.factoryInfo = gGameModel.town:getIdler("continuous_factory")
	slot0.buildings = gGameModel.town:getIdler("buildings")
	slot0.workDatas = idlers.new()

	if dataEasy.isTownRelicBuffUnlock() then
		slot0.relicBuff = gGameModel.town:getIdler("relic_buff")
	end
end

function slot5.updateCardEnergy(slot0)
	slot3 = gTownFactoryCsv[slot0.factoryId][slot0.buildings:read()[slot0.factoryId].level or 1]
	slot4 = slot0.factoryInfo:read()[slot0.factoryId].card_ids or {}
	slot5 = {}
	slot6 = 0
	slot7 = gGameModel.town:read("cards")
	slot8 = 0
	slot9 = 0
	slot10 = 0
	slot0.teamShow = true

	for slot14 = 1, 3 do
		slot15 = slot14 <= slot3.unlockSeat
		slot16 = slot3.energyExpend

		if slot4[slot14] then
			slot21 = csv.unit[csv.cards[gGameModel.cards:find(slot4[slot14]):read("card_id", "level", "star", "advance", "name").card_id].unitID]
			slot22 = 0
			slot23 = 0
			slot24 = false

			if slot7[slot4[slot14]] then
				slot22 = slot7[slot4[slot14]].max_energy
				slot23 = slot7[slot4[slot14]].energy
			else
				slot23 = townDataEasy.getCardEnergy(slot18.card_id, slot18.advance, slot18.star)
			end

			if townDataEasy.getSkillCfg(slot19.townSkill, slot18.advance, slot18.star) and slot25.type == gTownBuildingCsv[slot0.factoryId][1].buildType then
				slot24 = true

				if slot23 ~= 0 then
					slot26 = townDataEasy.getCardSkillEffect(slot25, slot0.factoryId, 1)
					slot8 = slot8 + slot26.productEffect
					slot9 = slot9 + slot26.inventoryEffect
					slot10 = math.max(slot10, slot26.normalEnergyReduce)

					if slot7[slot4[slot14]].energy_refresh_time ~= 0 and slot23 - math.max(math.floor((slot16 - slot26.orderEnergyCost) * (time.getTime() - slot7[slot4[slot14]].energy_refresh_time) / 3600), 0) <= 0 then
						slot23 = 0
					end
				end
			end

			slot5[slot14] = {
				dbid = slot4[slot14],
				unitID = slot20,
				name = slot19.name,
				level = slot18.level,
				star = slot18.star,
				advance = slot18.advance,
				lock = slot15,
				energy = slot23,
				energyMax = slot22,
				skillId = slot19.townSkill,
				skillMatch = slot24,
				icon = slot25 and slot25.icon
			}
			slot6 = slot23 == 0 and slot6 or slot6 + 1
		else
			slot5[slot14] = {
				dbid = 0,
				lock = slot15
			}
		end

		if not slot15 then
			slot0.teamShow = false
		end
	end

	slot0.workDatas:update(slot5)
	slot0.btnTeam:visible(dataEasy.isUnlock(gUnlockCsv.townReadyCard))
	uiEasy.setBtnShader(slot0.btnTeam, false, slot0.teamShow and 1 or 3)

	return slot8, slot9, slot10, slot6
end

function slot5.updateLeftImg(slot0, slot1, slot2)
	uv5 = "img"

	slot0.img:texture(slot5[slot0.factoryId])

	if slot0.img:get("spine") then
		slot3:removeFromParent()

		slot3 = nil
	end

	widget.addAnimationByKey(slot0.img, gTownBuildingCsv[slot1][slot2].spineRes, "spine", "effect_loop", 4):xy(slot0.img:width() / 2, slot0.img:height() / 2)
end

function slot5.checkUpgradeLevel(slot0, slot1, slot2)
	slot5 = slot2[slot1].level < itertools.size(gTownBuildingCsv[slot1])

	slot0.btnUp:visible(slot5)
	slot0.leftPanel:get("levelMax"):visible(not slot5)
	slot0.leftPanel:get("immediatelyPanel"):hide()
	slot0.leftPanel:get("updatingPanel"):y(slot0.leftPanel:get("immediatelyPanel"):y()):hide()
	slot0.redCanHideMark:set(slot2[slot1].finish_time ~= 0)

	if slot2[slot1].finish_time ~= 0 and time.getTime() < slot2[slot1].finish_time then
		slot0.btnUp:hide()
		slot0.leftPanel:get("updatingPanel"):show()
		bind.extend(slot0, slot0.leftPanel:get("updatingPanel.timeText"), {
			class = "cutdown_label",
			props = {
				endTime = cc.clampf(slot2[slot1].finish_time - time.getTime(), 1, gTownBuildingCsv[slot1][slot4.level + 1].levelUpCostTime) + time.getTime(),
				endFunc = function ()
					uv1 = "performWithDelay"

					performWithDelay(slot1, function ()
						uv0 = "refresh"

						slot0.refresh:notify()
					end, 0)
				end,
				callFunc = function (slot0)
					if slot0.day * 24 * 3600 + slot0.hour * 3600 + slot0.min * 60 + slot0.sec <= gCommonConfigCsv.buildingCompletionFree * 60 then
						uv2 = "day"
						slot2.canFree = true
						uv2 = "day"

						slot2.leftPanel:get("immediatelyPanel.cost"):text(gLanguageCsv.cost .. ":" .. 0)
					else
						uv2 = "day"
						slot2.canFree = false
						uv2 = "day"
						uv7 = "hour"

						slot2.leftPanel:get("immediatelyPanel.cost"):text(gLanguageCsv.cost .. ":" .. townDataEasy.getCostNum(slot7))
					end

					uv4 = "day"
					slot4 = slot4.leftPanel:get("immediatelyPanel")
					slot5 = slot4
					uv5 = "day"
					slot5 = slot5.leftPanel:get("immediatelyPanel.cost")
					slot5 = slot5.y
					uv5 = "day"
					slot5 = slot5.leftPanel:get("immediatelyPanel.cost")
					uv5 = "day"

					adapt.oneLineCenterPos(cc.p(slot4.width(slot5) / 2, slot5(slot5)), {
						slot5,
						slot5.leftPanel:get("immediatelyPanel.img")
					}, cc.p(0, 0))
				end
			}
		})

		if dataEasy.isUnlock(gUnlockCsv.buildingFinishAtOnce) then
			slot0.leftPanel:get("immediatelyPanel"):show()
			slot0.leftPanel:get("updatingPanel"):y(slot0.leftPanel:get("immediatelyPanel"):y() + slot0.leftPanel:get("immediatelyPanel"):height() / 2)
		end
	end
end

function slot5.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1000
	})
end

function slot5.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(126001, 126050)
	}
end

function slot5.onUpClick(slot0)
	slot2 = slot0.buildings:read()[slot0.factoryId]
	slot3 = gTownBuildingCsv[slot0.factoryId][slot2.level + 1]
	slot4 = string.format(gLanguageCsv.townFactoryUpdateCondition, gTownBuildingCsv[slot0.factoryId][1].name, slot2.level + 1)
	slot5, slot6, slot7, slot8 = townDataEasy.buildingCanLevelUp(slot0.factoryId)

	for slot12, slot13 in ipairs(slot8 or {}) do
		table.insert({}, "#C0x5B545B#" .. slot13)
	end

	for slot12, slot13 in ipairs(slot7 or {}) do
		table.insert(slot1, "#C0xF76B45#" .. slot13)
	end

	gGameUI:stackUI("city.town.factory_up", nil, , {
		factoryId = slot0.factoryId,
		content = slot1,
		cb = function ()
			uv4 = "gGameApp"

			gGameApp:requestServer("/town/building/level/up", function (slot0)
			end, slot4.factoryId)
		end,
		data = slot3.levelUpCost,
		itemState = slot6,
		conditionState = slot5
	})
end

function slot5.onBuildingLevelUpTip(slot0)
	townDataEasy.onBuildingLevelUpTip(slot0.factoryId, slot0.canFree)
end

function slot5.onAwardClick(slot0)
	gGameApp:requestServer("/town/continuous/receive", function (slot0)
		uv1 = "inventoryIsMax"
		slot1.inventoryIsMax = false

		gGameUI:showGainDisplay(slot0.view)
	end, slot0.factoryId)
end

function slot5.showSkillAndNormalIcon(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.relicBuffSign = false

	if slot1 > 0 then
		slot0.productPanel:get("skillPanel"):show()
		slot0.productPanel:get("skillPanel.num"):text("+" .. math.floor(mathEasy.getShortNumber(slot1, 1)) .. gLanguageCsv.townRestHour)
	end

	if slot2 > 0 then
		slot0.inventoryPanel:get("skillPanel"):show()
		slot0.inventoryPanel:get("skillPanel.num"):text("+" .. math.floor(slot2))

		slot0.relicBuffSign = true
	end

	slot0.inventoryPanel:get("max"):visible(slot5.total > slot6.inventory + slot2)
	slot0.inventoryPanel:get("num"):visible(slot5.total < slot6.inventory + slot2)
	slot0.awardPanel:get("bg"):texture(slot5.total > slot6.inventory + slot2 and "city/town/map/btn_max.png" or "city/town/map/btn_klq.png")
	adapt.oneLinePos(slot0.productPanel:get("num"), slot0.productPanel:get("icon"), cc.p(10, 0))
	adapt.oneLinePos(slot0.consumePanel:get("num"), slot0.consumePanel:get("icon"), cc.p(10, 0))

	if slot5.total < slot6.inventory + slot2 then
		adapt.oneLinePos(slot0.inventoryPanel:get("num"), slot0.inventoryPanel:get("icon"), cc.p(10, 0))
	else
		adapt.oneLinePos(slot0.inventoryPanel:get("max"), slot0.inventoryPanel:get("icon"), cc.p(10, 0))
	end

	if slot3 > 0 then
		slot0.consumePanel:get("skillPanel"):show()
		slot0.consumePanel:get("skillPanel.num"):text("-" .. slot3 .. gLanguageCsv.townRestHour)
		adapt.oneLinePos(slot0.consumePanel:get("num"), {
			slot0.consumePanel:get("icon"),
			slot0.consumePanel:get("skillPanel")
		}, cc.p(10, 0))
	end

	if slot4 > 0 then
		if slot6.slotCapacityAdd > 0 then
			slot0.productPanel:get("normalPanel"):show()
			slot0.productPanel:get("normalPanel.num"):text("+" .. slot6.slotCapacityAdd * slot4 .. gLanguageCsv.townRestHour)

			if slot1 > 0 then
				slot0.productPanel:get("skillPanel"):width(slot0.productPanel:get("skillPanel.img"):width() + slot0.productPanel:get("skillPanel.num"):width())
				adapt.oneLinePos(slot0.productPanel:get("icon"), {
					slot0.productPanel:get("skillPanel"),
					slot0.productPanel:get("normalPanel")
				}, {
					cc.p(10, 0),
					cc.p(30, 0)
				})
			else
				adapt.oneLinePos(slot0.productPanel:get("icon"), slot0.productPanel:get("normalPanel"), cc.p(10, 0))
			end
		end

		if slot6.slotStockAdd > 0 then
			slot0.inventoryPanel:get("normalPanel"):show()
			slot0.inventoryPanel:get("normalPanel.num"):text("+" .. slot6.slotStockAdd * slot4)

			slot0.relicBuffSign = true

			if slot2 > 0 then
				adapt.oneLinePos(slot0.inventoryPanel:get("icon"), {
					slot0.inventoryPanel:get("skillPanel"),
					slot0.inventoryPanel:get("normalPanel")
				}, {
					cc.p(10, 0),
					cc.p(30, 0)
				})
			else
				adapt.oneLinePos(slot0.inventoryPanel:get("icon"), slot0.inventoryPanel:get("normalPanel"), cc.p(10, 0))
			end
		end
	end

	slot0:relicBuffPositinAdapt()
end

function slot5.addRelicBuffIcon(slot0)
	slot1 = nil

	if slot0.relicBuff then
		for slot5, slot6 in pairs(game.TOWN_BUFF_TYPE) do
			for slot10, slot11 in ipairs(slot6) do
				if slot0.factoryId == slot11 then
					slot1 = slot5

					break
				end
			end

			if slot1 then
				break
			end
		end

		if slot1 then
			idlereasy.when(slot0.relicBuff, function (slot0, slot1)
				uv2 = "relicIconPanel"
				uv4 = "relicIconPanel"
				uv6 = "uiEasy"
				uv8 = "relicIconPanel"
				slot2.relicIconPanel = uiEasy.addRelicIcon(slot4.productPanel, slot1, slot6, nil, slot8)

				if slot1 then
					uv2 = "uiEasy"

					if slot1[slot2] then
						uv2 = "relicIconPanel"
						slot2.relicBuffId = true
					end
				else
					uv2 = "relicIconPanel"
					slot2.relicBuffId = false
					uv2 = "relicIconPanel"

					slot2:relicBuffPositinAdapt()
				end
			end)
		end
	end
end

function slot5.relicBuffPositinAdapt(slot0)
	if slot0.relicBuffId and slot0.relicBuffSign then
		slot0.inventoryPanel:y(slot0.inventoryPanelY - 70)
		slot0.consumePanel:y(slot0.consumePanelY - 70)
		slot0.relicIconPanel:y(-40)
		slot0.relicIconPanel:x(slot0.productPanel:get("icon"):x() + 385)
	else
		slot0.inventoryPanel:y(slot0.inventoryPanelY)
		slot0.consumePanel:y(slot0.consumePanelY)
	end

	if slot0.relicBuffId and not slot0.relicBuffSign then
		slot0.relicIconPanel:xy(914, 45)
	end
end

function slot5.addCards(slot0, slot1, slot2, slot3)
	if not slot3.lock then
		gGameUI:showTip(gLanguageCsv.townFactorySeatUnlockTip)

		return
	end

	if slot0.inventoryIsMax then
		gGameUI:showTip(gLanguageCsv.townFactoryReceiveAwardFirst)

		return
	end

	if not townDataEasy.noCardCanbeClick() then
		gGameUI:showTip(gLanguageCsv.townCanNotChooseCard)

		return
	end

	gGameUI:stackUI("city.town.choose_card", nil, , slot2, slot0.factoryId, 1)
end

function slot5.downCards(slot0, slot1, slot2, slot3)
	if not slot3.lock then
		return
	end

	gGameUI:showDialog({
		btnType = 2,
		isRich = false,
		clearFast = true,
		cb = function ()
			uv4 = "gGameApp"
			uv5 = "requestServer"
			uv6 = "/town/continuous/card/remove"

			gGameApp:requestServer("/town/continuous/card/remove", function (slot0)
			end, slot4.factoryId, slot5, slot6.dbid)
		end,
		content = string.format(gLanguageCsv.townFactoryCardRest, slot3.name),
		size = {
			width = 850,
			height = 450
		},
		dialogParams = {
			clickClose = false
		}
	})
end

function slot5.skillDetail(slot0, slot1, slot2, slot3, slot4)
	if not slot3.dbid then
		return
	end

	if slot4:getParent():convertToWorldSpace(cc.p(slot4:xy())).x > 1600 then
		-- Nothing
	else
		slot6.pos = cc.p(slot7.x + 300, slot7.y - 50)
		slot6.sign = true
	end

	slot9 = gGameModel.cards:find(slot5):read("card_id", "level", "star", "advance", "name")

	gGameUI:stackUI("city.town.exploration.tip", nil, {
		dispatchNodes = gGameUI.uiRoot:getResourceNode()
	}, {
		pos = cc.p(slot7.x - 495, slot7.y - 50),
		sign = false,
		townSkillCsv = townDataEasy.getSkillCfg(csv.cards[slot9.card_id].townSkill, slot9.advance, slot9.star),
		isSameSign = slot3.skillMatch
	})
end

function slot5.onTeamClick(slot0)
	if not slot0.teamShow then
		gGameUI:showTip(gLanguageCsv.productionTeamUnlock)

		return
	end

	gGameUI:stackUI("city.town.factory_team", nil, , slot0.factoryId, 1)
end

function slot5.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.closeCb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot5
