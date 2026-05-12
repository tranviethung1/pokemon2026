slot0 = {
	"city/card/ability/panel_jctx.png",
	"city/card/ability/panel_pttx.png",
	"city/card/ability/panel_hxtx.png",
	"city/card/ability/panel_fz.png"
}
slot1 = {
	cc.c4b(97, 145, 192, 255),
	cc.c4b(139, 92, 153, 255),
	cc.c4b(250, 105, 74, 255)
}
slot2 = {
	1.1,
	1,
	0.9
}

function slot3(slot0, slot1, slot2)
	slot3 = slot0:multiget("textNote", "textNum", "iconCoin")
	slot4 = ui.COLORS.NORMAL.ALERT_ORANGE

	if slot2 <= slot1 then
		slot4 = ui.COLORS.NORMAL.DEFAULT
	end

	slot3.textNum:text(slot2)
	text.addEffect(slot3.textNum, {
		color = slot4
	})

	slot5 = slot0:size()

	adapt.oneLineCenterPos(cc.p(slot5.width / 2, slot5.height / 2), {
		slot3.textNote,
		slot3.textNum,
		slot3.iconCoin
	}, cc.p(15, 0))
end

function slot4(slot0, slot1, slot2)
	slot5 = {}
	slot6 = 0

	if (slot0[csv.card_ability[slot1].position] or 0) < slot3.strengthMax then
		slot6 = csv.card_ability_cost[slot4 + 1]["costItemMap" .. slot3.strengthSeqID].gold or 0

		for slot11, slot12 in csvMapPairs(slot7) do
			if slot11 ~= "gold" then
				table.insert(slot5, {
					key = slot11,
					num = slot2[slot11] or 0,
					targetNum = slot12
				})
			end
		end
	end

	return slot5, slot6
end

function slot5(slot0, slot1, slot2, slot3)
	slot5 = ""

	for slot9, slot10 in pairs(string.split(slot0, "$")) do
		if string.find(slot10, "skillLevel") then
			slot13 = ""

			if slot4[slot9 + 1] and string.find(slot4[slot9 + 1], "^%%") then
				slot13 = "%"
				slot4[slot9 + 1] = string.gsub(slot4[slot9 + 1], "^%%", "")
			end

			slot14 = eval.doFormula(slot10, {
				skillLevel = slot1,
				math = math
			}, slot0)

			if slot1 == 0 then
				slot14 = 0
			end

			slot15 = eval.doFormula(slot10, {
				skillLevel = slot1 + 1,
				math = math
			}, slot0)

			if tonumber(slot14) < tonumber(slot15) and slot1 < slot2 then
				if slot3 == 1 then
					slot11 = string.format(gLanguageCsv.abilitySkillAddDesc, slot14 .. slot13, slot15 - slot14 .. slot13)
				elseif slot3 == 2 then
					slot11 = string.format(gLanguageCsv.abilityAttrAdd, slot11, slot16)
				elseif slot3 == 3 then
					slot11 = string.format(gLanguageCsv.extraDescType3, slot11)
				end
			end

			slot11 = "#C0x60C456#+" .. slot11 .. "#C0x5B545B#"
		end

		slot5 = slot5 .. slot11
	end

	return slot5
end

function slot6(slot0, slot1, slot2, slot3, slot4)
	slot6 = slot0[slot4] or 0
	slot7 = ""

	if string.find(slot0[slot1] or 0, "%%") then
		slot5 = string.gsub(slot5, "%%", "")
		slot7 = "%"
	end

	if string.find(slot6, "%%") then
		slot6 = string.gsub(slot6, "%%", "")
		slot7 = "%"
	end

	if tonumber(slot5) < tonumber(slot6) and slot1 < slot2 then
		slot8 = string.format(gLanguageCsv.abilitySkillAddDesc, dataEasy.getAttrValueString(slot3, slot5 .. slot7), dataEasy.getAttrValueString(slot3, slot6 - slot5 .. slot7))
	end

	return "#C0x60C456#+" .. slot8 .. "#C0x5B545B#"
end

function slot7(slot0, slot1, slot2, slot3)
	slot4 = ""
	slot5 = slot3 or slot2 + 1

	if slot1.effectType == 2 then
		uv9 = ""
		slot4 = string.format(slot1.desc, slot9(dataEasy.getSkillDesc(csv.skill[slot1.skillID]), slot2, slot1.strengthMax, 1))
	end

	if slot1.effectType == 1 then
		slot6 = {}

		for slot10 = 1, 2 do
			if slot1["attrType" .. slot10] ~= 0 then
				slot14 = getLanguageAttr

				table.insert(slot6, slot14(slot11))

				uv14 = "effectType"

				table.insert(slot6, slot14(slot1["attrNum" .. slot10], slot2, slot1.strengthMax, slot11, slot5))
			end
		end

		slot4 = string.format(slot1.desc, unpack(slot6))
	end

	beauty.textScroll({
		isRich = true,
		verticalSpace = 10,
		list = slot0,
		strs = "#C0x5B545B#" .. slot4
	})
end

function slot8(slot0, slot1, slot2, slot3)
	slot4 = slot0 or 0
	slot5 = {}
	slot6 = 0

	if slot1 and slot4 < slot1.strengthMax then
		slot6 = csv.card_ability_extra_cost[slot4 + 1]["costItemMap" .. slot1.strengthSeqID].gold or 0

		for slot11, slot12 in csvMapPairs(slot7) do
			if slot11 ~= "gold" then
				table.insert(slot5, {
					key = slot11,
					num = slot2[slot11] or 0,
					targetNum = slot12
				})
			end
		end

		table.insert(slot5, {
			key = "gold",
			num = slot3,
			targetNum = slot6
		})
	end

	return slot5
end

function slot9(slot0, slot1, slot2, slot3)
	slot4 = ""
	slot5 = {}

	if slot1 + 1 <= slot0.strengthMax then
		for slot9 = 1, math.huge do
			if slot0["attrType" .. slot9] then
				slot10 = nil
				slot11 = {}

				for slot15, slot16 in csvMapPairs(slot0["attrNum" .. slot9]) do
					table.insert(slot11, slot16)
				end

				if slot11[slot1 + 1] and slot11[slot1] then
					table.insert(slot5, {
						type = 1,
						name = getLanguageAttr(slot0["attrType" .. slot9]),
						value1 = slot11[slot1],
						value2 = slot11[slot1 + 1] - slot11[slot1]
					})
				else
					table.insert(slot5, {
						type = 1,
						name = getLanguageAttr(slot0["attrType" .. slot9]),
						value1 = slot11[1]
					})
				end
			else
				break
			end
		end
	elseif slot1 == slot0.strengthMax then
		for slot9 = 1, math.huge do
			if slot0["attrType" .. slot9] then
				slot10 = nil
				slot11 = {}

				for slot15, slot16 in csvMapPairs(slot0["attrNum" .. slot9]) do
					table.insert(slot11, slot16)
				end

				if slot11[slot1] then
					table.insert(slot5, {
						type = 1,
						name = getLanguageAttr(slot0["attrType" .. slot9]),
						value1 = slot11[slot1]
					})
				end
			else
				break
			end
		end
	end

	slot7 = slot1 == 0 and 0 or math.floor(slot1 / slot0.skillLevelNode) + 1
	uv11 = ""

	return slot5, "#C0x5B545B##F40#" .. slot11(dataEasy.getSkillDesc(csv.skill[slot2 == 1 and slot0.skillID1 or slot0.skillID2]), slot7, math.floor(slot0.strengthMax / slot0.skillLevelNode) + 1, slot3 and 4 or (slot1 == 0 and 1 or math.floor((slot1 + 1) / slot0.skillLevelNode) + 1) ~= slot7 and 2 or 3)
end

slot10 = require("app.views.city.card.ability.tools")
slot11 = class("CardAbilityStrengthenView", cc.load("mvc").ViewBase)
slot11.RESOURCE_FILENAME = "card_ability_strengthen.json"
slot11.RESOURCE_BINDING = {
	["panel.descInnerList"] = "descInnerList",
	["panel.iconMax"] = "iconMax",
	["panel.textLvNum"] = "textLvNum",
	panel = "panel",
	["panel.bg.bg"] = "descBg",
	["panel.imgMax"] = "imgMax",
	["panel.descList"] = "descList",
	["panel.costInfo"] = "costInfo",
	["panel.iconPanel"] = "iconPanel",
	["panel.textNum"] = "textNum",
	["panel.textCondition2"] = "textCondition2",
	["panel.iconArrow"] = "iconArrow",
	item = "item",
	["panel.descItem"] = "descItem",
	["panel.textNote"] = "textNote",
	["panel.textCondition1"] = "textCondition1",
	["panel.textLvMaxNum"] = "textLvMaxNum",
	["panel.textName"] = "textName",
	["panel.textNextNum"] = "textNextNum",
	["panel.textCost"] = "textCost",
	["panel.btnSure"] = {
		varname = "btnStrengthen",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onStrengthenClick")
			}
		}
	},
	["panel.btnSureOne"] = {
		varname = "btnStrengthenOneKey",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onStrengthenOneKeyClick")
			}
		}
	},
	["panel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("cb")
			}
		}
	},
	["panel.itemList"] = {
		varname = "itemList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("eventDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1:multiget("itemPanel", "textName").itemPanel, {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key,
								num = slot3.num,
								targetNum = slot3.targetNum
							},
							grayState = slot3.num < slot3.targetNum and 1 or 0,
							onNode = function (slot0)
								slot0:setTouchEnabled(false)
							end
						}
					})
					slot1:get("mask"):visible(slot3.num < slot3.targetNum)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onCostItemClick")
			}
		}
	},
	["panel.descTableList"] = {
		varname = "descTableList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("attrData"),
				item = bindHelper.self("descInnerList"),
				cell = bindHelper.self("descItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					if slot3 and slot3.type == 1 then
						slot1:get("text1"):text(slot3.name .. " +" .. slot3.value1)

						if slot3.value2 then
							slot1:get("text2"):show()
							slot1:get("text2"):text(gLanguageCsv.symbolBracketLeft .. "+" .. slot3.value2 .. gLanguageCsv.symbolBracketRight)
							adapt.oneLinePos(slot1:get("text1"), slot1:get("text2"), cc.p(0, 0))
						else
							slot1:get("text2"):hide()
						end
					end

					if slot3 and slot3.type == 3 then
						slot1:get("text1"):hide()
						slot1:get("text2"):hide()
					end

					if slot3 and slot3.type == 2 then
						slot1:get("text1"):hide()
						slot1:get("text2"):hide()

						slot4 = rich.createWithWidth(slot3.value, 40, nil, 840, 10):addTo(slot1):anchorPoint(0, 0.5)
						slot6 = slot4:height()

						slot0:height(slot6)
						slot1:width(slot4:width())
						slot1:height(slot6)
						slot1:y(20 - slot6 / 2)
						slot4:y(slot6 / 2)
					end
				end
			}
		}
	}
}

function slot11.onCreate(slot0, slot1, slot2)
	slot0.itemList:setClippingEnabled(false)

	slot0.refreshData = slot1()
	slot0.cb = slot2

	slot0:initModel()

	slot0.eventDatas = idlers.new()
	slot0.oneKeyLevel = idler.new(0)
	slot0.extraOneKeyLevel = idler.new(0)

	idlereasy.when(slot0.branch, function (slot0, slot1)
		if slot1 > 0 then
			uv2 = "descList"
			slot2 = slot2.descList
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "descList"
			slot2 = slot2.descTableList
			slot2 = slot2.show

			slot2(slot2)

			uv2 = "descList"
			slot2 = slot2.descBg:height(343)
			slot2 = slot2.y

			slot2(slot2, 644)

			uv2 = "descList"

			slot2.itemList:y(250):setItemsMargin(60)
		else
			uv2 = "descList"
			slot2 = slot2.textCost
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "descList"
			slot2 = slot2.descTableList
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "descList"
			slot2 = slot2.descList
			slot2 = slot2.show

			slot2(slot2)

			uv2 = "descList"
			slot2 = slot2.descBg:height(293)
			slot2 = slot2.y

			slot2(slot2, 664)

			uv2 = "descList"

			slot2.itemList:y(345):show():setItemsMargin(120)
		end
	end)
	slot0:extraPanel()
	slot0:normalPanel()
end

function slot11.extraNameAndLevel(slot0, slot1, slot2)
	if not gCardAbilityExtraCsv[slot0.abilityId] then
		return
	end

	slot0.textName:text(slot3["name" .. slot1])

	uv10 = "gCardAbilityExtraCsv"

	text.addEffect(slot0.textName, {
		color = slot10[3]
	})

	slot9 = slot3["icon" .. slot1]
	uv9 = "abilityId"

	slot0.iconPanel:get("icon"):texture(slot9):scale(slot9[1])

	slot9 = "iconBg"
	uv9 = "icon"
	slot9 = slot9[4]
	uv9 = "abilityId"

	slot0.iconPanel:get(slot9):texture(slot9):scale(slot9[1])
	slot0.textLvNum:text(slot2)
	slot0.textLvMaxNum:text("/" .. slot3.strengthMax)
	adapt.oneLinePos(slot0.textLvNum, slot0.textLvMaxNum, cc.p(3, 0), "left")

	slot7 = gLanguageCsv.textLv .. slot2
	slot8 = 50

	if slot2 == 0 then
		slot7 = gLanguageCsv.notActivatedTip
		slot8 = 40
	end

	slot0.textNum:text(slot7):setFontSize(slot8)
	slot0.textNextNum:text(gLanguageCsv.textLv .. math.min(slot2 + 1, slot6))
	adapt.oneLinePos(slot0.textNote, {
		slot0.textNum,
		slot0.iconMax
	})
end

function slot11.extraToActive(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.btnStrengthen:show()
	slot0.btnStrengthen:get("textNote"):text(gLanguageCsv.spaceActive)
	slot0.textNum:show()
	slot0.descTableList:height(326):y(520)

	slot6 = slot0.descBg:height(343)
	slot6 = slot6.y

	slot6(slot6, 644)

	uv6 = "btnStrengthen"
	slot6, slot7 = slot6(slot3, slot2, slot1)

	if #slot6 % 2 ~= 0 then
		table.insert(slot6, {
			type = 3
		})
	end

	table.insert(slot6, {
		type = 2,
		value = slot7
	})
	slot0.attrData:set(slot6)

	slot0.btnType = 1

	slot0.btnStrengthen:x(953)
	uiEasy.setBtnShader(slot0.btnStrengthen, slot0.btnStrengthen:get("textNote"), slot0:refreshCost(slot2, slot3, slot4, slot5) and 1 or 3)
	uiEasy.setBtnShader(slot0.btnStrengthenOneKey, slot0.btnStrengthenOneKey:get("textNote"), slot8 and 1 or 3)
end

function slot11.extraNormal(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.btnStrengthen:show()

	if slot1 ~= 0 and slot2 == slot1 then
		slot0.btnType = 1

		slot0.btnStrengthen:get("textNote"):text(gLanguageCsv.spaceStrengthen)
		slot0.textNextNum:show()
		slot0.textNum:show()
		slot0.btnStrengthen:x(673)
		slot0.btnStrengthenOneKey:x(1233):show()

		slot8 = slot0.iconArrow
		slot8 = slot8.show

		slot8(slot8)

		uv8 = "btnStrengthen"
		slot8, slot9 = slot8(slot4, slot3, slot2)

		if #slot8 % 2 ~= 0 then
			table.insert(slot8, {
				type = 3
			})
		end

		table.insert(slot8, {
			type = 2,
			value = slot9 .. "\n" .. string.format(gLanguageCsv.extraSkillDesc, slot4.skillLevelNode)
		})
		slot0.attrData:set(slot8)
		uiEasy.setBtnShader(slot0.btnStrengthen, slot0.btnStrengthen:get("textNote"), slot0:refreshCost(slot3, slot4, slot5, slot6) and 1 or 3)
		uiEasy.setBtnShader(slot0.btnStrengthenOneKey, slot0.btnStrengthenOneKey:get("textNote"), slot10 and 1 or 3)
	else
		slot0.btnType = 2

		slot0.btnStrengthen:get("textNote"):text(gLanguageCsv.changeBranch)

		slot8 = slot0.btnStrengthen
		slot8 = slot8.x

		slot8(slot8, 953)

		uv8 = "btnStrengthen"
		slot8, slot9 = slot8(slot4, slot3, slot2, true)

		if #slot8 % 2 ~= 0 then
			table.insert(slot8, {
				type = 3
			})
		end

		table.insert(slot8, {
			type = 2,
			value = slot9 .. "\n" .. gLanguageCsv.extraDescTip
		})
		slot0.attrData:set(slot8)
	end

	slot0.descTableList:height(326):y(520)
	slot0.descBg:height(343):y(644)
end

function slot11.extraMax(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot1 ~= 0 and slot2 == slot1 then
		slot0.iconMax:show()

		slot8 = slot0.imgMax
		slot8 = slot8.show

		slot8(slot8)

		uv8 = "iconMax"
		slot8, slot9 = slot8(slot4, slot3, slot2)

		if #slot8 % 2 ~= 0 then
			table.insert(slot8, {
				type = 3
			})
		end

		table.insert(slot8, {
			type = 2,
			value = slot9 .. "\n" .. string.format(gLanguageCsv.extraSkillDesc, slot4.skillLevelNode)
		})
		slot0.attrData:set(slot8)
	else
		slot0.btnType = 2

		slot0.btnStrengthen:get("textNote"):text(gLanguageCsv.changeBranch)

		slot8 = slot0.btnStrengthen:x(953)
		slot8 = slot8.show

		slot8(slot8)

		uv8 = "iconMax"
		slot8, slot9 = slot8(slot4, slot3, slot2, true)

		if #slot8 % 2 ~= 0 then
			table.insert(slot8, {
				type = 3
			})
		end

		table.insert(slot8, {
			type = 2,
			value = slot9 .. "\n" .. gLanguageCsv.extraDescTip
		})
		slot0.attrData:set(slot8)
	end
end

function slot11.refreshCost(slot0, slot1, slot2, slot3, slot4)
	slot0.costInfo:hide()

	uv5 = "costInfo"
	slot5 = slot5(slot1, slot2, slot3, slot4 or 0)

	slot0.eventDatas:update(slot5)

	if #slot5 > 0 then
		slot0.itemList:xy(math.max(953 - (#slot5 * slot0.item:size().width + (#slot5 - 1) * 60) / 2, 500), 250)
	end

	slot0.itemList:show()

	slot6 = true
	uv7 = "costInfo"
	slot11 = slot4 or 0

	for slot11, slot12 in pairs(slot7(slot1, slot2, slot3, slot11)) do
		if slot12.num < slot12.targetNum then
			slot6 = false
		end
	end

	return slot6
end

function slot11.extraPanel(slot0)
	for slot4 = 1, 2 do
		slot0["textCondition" .. slot4]:hide()
	end

	idlereasy.any({
		slot0.extraLevel,
		slot0.items,
		slot0.branch,
		slot0.gold,
		slot0.rmb
	}, function (slot0, slot1, slot2, slot3, slot4, slot5)
		if slot3 == 0 then
			return
		end

		uv7 = "gCardAbilityExtraCsv"
		slot7 = slot7.abilityId
		uv7 = "gCardAbilityExtraCsv"
		slot7 = slot7.nowBranch:read()

		if gCardAbilityExtraCsv[slot7] then
			slot8 = slot1 or 0
			uv9 = "gCardAbilityExtraCsv"
			slot12 = slot8

			slot9:extraNameAndLevel(slot3, slot12)

			uv12 = "gCardAbilityExtraCsv"
			slot12 = slot12.iconMax
			uv12 = "gCardAbilityExtraCsv"
			slot12 = slot12.imgMax
			uv12 = "gCardAbilityExtraCsv"
			slot12 = slot12.textCost
			uv12 = "gCardAbilityExtraCsv"
			slot12 = slot12.itemList
			uv12 = "gCardAbilityExtraCsv"
			slot12 = slot12.btnStrengthen
			uv12 = "gCardAbilityExtraCsv"
			slot12 = slot12.textNum
			uv12 = "gCardAbilityExtraCsv"
			slot12 = slot12.btnStrengthenOneKey
			uv12 = "gCardAbilityExtraCsv"
			slot12 = slot12.iconArrow
			uv12 = "gCardAbilityExtraCsv"

			itertools.invoke({
				slot12,
				slot12,
				slot12,
				slot12,
				slot12,
				slot12,
				slot12,
				slot12,
				slot12.textNextNum
			}, "hide")

			slot11 = slot6.strengthMax <= slot8
			slot12 = slot7 ~= 0 and slot3 ~= slot7

			if not (slot8 > 0 and slot7 ~= 0) then
				uv13 = "gCardAbilityExtraCsv"

				slot13:extraToActive(slot3, slot8, slot6, slot2, slot4)
			elseif slot11 then
				uv13 = "gCardAbilityExtraCsv"

				slot13:extraMax(slot7, slot3, slot8, slot6, slot2, slot4)
			else
				uv13 = "gCardAbilityExtraCsv"

				slot13:extraNormal(slot7, slot3, slot8, slot6, slot2, slot4)
			end

			uv13 = "gCardAbilityExtraCsv"

			slot13.extraOneKeyLevel:set(0)
		end

		uv8 = "gCardAbilityExtraCsv"

		slot8.costInfo:visible(false)
	end)
	idlereasy.when(slot0.extraOneKeyLevel, function (slot0, slot1)
		if slot1 ~= 0 then
			uv2 = "onExtraStrengthenClick"

			slot2:onExtraStrengthenClick()
		end
	end)
end

function slot11.normalPanel(slot0)
	idlereasy.any({
		slot0.abilities,
		slot0.items,
		slot0.refreshData
	}, function (slot0, slot1, slot2)
		uv4 = "csv"

		if csv.card_ability[slot4.abilityId] then
			slot4 = slot3.strengthMax
			uv5 = "csv"
			slot5 = slot5.textName
			slot6 = slot5

			slot5.text(slot6, slot3.name)

			slot5 = text.addEffect
			uv6 = "csv"
			uv8 = "card_ability"

			slot5(slot6.textName, {
				color = slot8[slot3.type]
			})

			uv5 = "csv"
			slot7 = slot3.icon
			slot5 = slot5.iconPanel:get("icon"):texture(slot7)
			slot5 = slot5.scale
			uv7 = "abilityId"

			slot5(slot5, slot7[slot3.type] * 2)

			uv5 = "csv"
			slot7 = "iconBg"
			uv7 = "strengthMax"
			slot7 = slot7[slot3.type]
			uv7 = "abilityId"

			slot5.iconPanel:get(slot7):texture(slot7):scale(slot7[slot3.type])

			slot5 = slot1[slot3.position] or 0
			uv6 = "csv"
			slot6 = slot6.textLvNum
			slot6 = slot6.text

			slot6(slot6, slot5)

			uv6 = "csv"
			slot6.level = slot5
			uv6 = "csv"
			slot6 = slot6.textLvMaxNum
			slot6 = slot6.text

			slot6(slot6, "/" .. slot4)

			uv6 = "csv"
			slot6 = slot6.textNum:text(slot5 == 0 and gLanguageCsv.notActivatedTip or gLanguageCsv.textLv .. slot5)
			slot6 = slot6.setFontSize

			slot6(slot6, slot5 == 0 and 40 or 50)

			uv6 = "csv"
			slot6 = slot6.textNextNum
			slot7 = slot6
			slot8 = gLanguageCsv.textLv .. math.min(slot5 + 1, slot4)

			slot6.text(slot7, slot8)

			uv7 = "csv"
			slot7 = slot7.textNote
			uv8 = "csv"
			slot8 = slot8.textNum

			adapt.oneLinePos(slot7, slot8)

			uv7 = "csv"
			uv8 = "csv"

			adapt.oneLinePos(slot7.textLvNum, slot8.textLvMaxNum, cc.p(3, 0), "left")

			slot6 = slot4 <= slot5
			uv7 = "csv"
			uv9 = "csv"
			slot9 = slot9.textNum
			slot10 = slot9
			uv10 = "csv"
			slot10 = slot10.textNum:width()
			slot9 = slot9.x(slot10) + slot10
			uv10 = "csv"

			slot7.iconMax:xy(slot9, slot10.textNum:y())

			uv9 = "csv"
			slot9 = slot9.iconMax
			uv9 = "csv"
			slot9 = slot6 and "show" or "hide"

			itertools.invoke({
				slot9,
				slot9.imgMax
			}, slot9)

			slot7 = itertools.invoke
			uv9 = "csv"
			uv9 = "csv"
			slot9 = slot9.btnStrengthen.iconArrow
			uv9 = "csv"
			slot9 = not slot6 and "show" or "hide"

			slot7({
				slot9,
				slot9,
				slot9.textNextNum
			}, slot9)

			uv7 = "csv"
			slot7 = slot7.textNum
			slot8 = slot7
			slot7 = slot7.show

			slot7(slot8)

			uv7 = "textName"
			uv8 = "csv"
			uv9 = "csv"
			slot7 = slot7.getConditionStr(slot8.selectDbId, slot9.abilityId)

			for slot11 = 1, 2 do
				if slot7[slot11] then
					uv12 = "csv"

					slot12["textCondition" .. slot11]:show():text(slot7[slot11])
				else
					uv12 = "csv"

					slot12["textCondition" .. slot11]:hide()
				end
			end

			uv9 = "csv"
			slot9 = slot9.btnStrengthen:get("textNote")
			slot10 = slot9
			slot11 = slot5 == 0 and gLanguageCsv.spaceActive or gLanguageCsv.spaceStrengthen

			slot9.text(slot10, slot11)

			uv10 = "csv"
			slot10 = slot10.btnStrengthen
			uv11 = "csv"
			slot11 = slot11.btnStrengthen:get("textNote")

			uiEasy.setBtnShader(slot10, slot11, #slot7 == 0 and 1 or 3)

			slot9 = uiEasy.setBtnShader
			uv10 = "csv"
			uv11 = "csv"
			slot11 = slot11.btnStrengthenOneKey:get("textNote")

			slot9(slot10.btnStrengthenOneKey, slot11, #slot7 == 0 and 1 or 3)

			uv9 = "text"
			uv11 = "csv"
			slot11 = slot11.abilityId
			slot9, slot10 = slot9(slot1, slot11, slot2)
			uv11 = "csv"

			slot11.eventDatas:update(slot9)

			if #slot9 == 1 or #slot9 == 2 then
				uv11 = "csv"
				slot13 = (#slot9 - 1) * 120
				uv13 = "csv"

				slot13.itemList:x(953 - (#slot9 * slot11.item:size().width + slot13) / 2)
			end

			slot11 = next(slot7) == nil and slot10 > 0
			uv12 = "csv"

			slot12.costInfo:visible(slot11)

			if slot11 then
				uv12 = "name"
				uv13 = "csv"
				uv14 = "csv"

				slot12(slot13.costInfo, slot14.gold:read(), slot10)
			end

			uv12 = "addEffect"
			uv13 = "csv"

			slot12(slot13.descList, slot3, slot5)

			if dataEasy.isUnlock(gUnlockCsv.potentialOneKey) and not slot6 then
				uv12 = "csv"
				slot12 = slot12.btnStrengthen
				slot12 = slot12.x

				slot12(slot12, 673)

				uv12 = "csv"
				slot12 = slot12.btnStrengthenOneKey
				slot12 = slot12.show

				slot12(slot12)

				uv12 = "csv"
				slot12 = slot12.btnStrengthenOneKey
				slot12 = slot12.x

				slot12(slot12, 1233)

				uv12 = "csv"

				slot12.costInfo:x(673)
			else
				uv12 = "csv"
				slot12 = slot12.btnStrengthen
				slot12 = slot12.x

				slot12(slot12, 953)

				uv12 = "csv"
				slot12 = slot12.btnStrengthenOneKey
				slot12 = slot12.hide

				slot12(slot12)

				uv12 = "csv"

				slot12.costInfo:x(953)
			end

			uv12 = "csv"

			slot12.oneKeyLevel:set(0)
		end
	end)
	idlereasy.when(slot0.oneKeyLevel, function (slot0, slot1)
		if slot1 ~= 0 then
			uv3 = "csv"

			if csv.card_ability[slot3.abilityId] then
				uv3 = "card_ability"
				uv4 = "csv"
				uv6 = "csv"

				slot3(slot4.descList, slot2, slot6.level, slot1)

				uv3 = "csv"

				slot3.textNextNum:text(slot1)
			end

			uv3 = "csv"

			slot3:onStrengthenClick()
		end
	end)
end

function slot11.initModel(slot0)
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.items = gGameModel.role:getIdler("items")
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.extraLevel = idler.new(0)
	slot0.branch = idler.new(0)
	slot0.nowBranch = idler.new(0)
	slot0.attrData = idlertable.new({})

	idlereasy.when(slot0.refreshData, function (slot0, slot1)
		uv2 = "selectDbId"
		slot2.selectDbId = slot1.cardDbid
		uv2 = "selectDbId"
		slot3 = slot1.id
		slot2.abilityId = slot3
		uv3 = "selectDbId"
		uv6 = "selectDbId"

		if assertInWindows(slot3.selectDbId, "val:%s", tostring(slot6.selectDbId)) then
			return
		end

		slot2 = gGameModel.cards
		slot3 = slot2
		uv4 = "selectDbId"
		slot2 = slot2.find(slot3, slot4.selectDbId)
		uv3 = "selectDbId"
		slot6 = slot2
		uv6 = "selectDbId"
		slot3.advance = idlereasy.assign(slot2.getIdler(slot6, "advance"), slot6.advance)
		uv3 = "selectDbId"
		slot6 = slot2
		uv6 = "selectDbId"
		slot3.cardId = idlereasy.assign(slot2.getIdler(slot6, "card_id"), slot6.cardId)
		uv3 = "selectDbId"
		slot6 = slot2
		uv6 = "selectDbId"
		slot3.cardLv = idlereasy.assign(slot2.getIdler(slot6, "level"), slot6.cardLv)
		uv3 = "selectDbId"
		slot6 = slot2
		uv6 = "selectDbId"
		slot3.abilities = idlereasy.assign(slot2.getIdler(slot6, "abilities"), slot6.abilities)
		uv3 = "selectDbId"
		slot3 = slot3.branch
		slot3 = slot3.set

		slot3(slot3, slot1.branch or 0)

		uv3 = "selectDbId"
		slot6 = slot2
		uv6 = "selectDbId"
		slot3.abilitiesExtra = idlereasy.assign(slot2.getIdler(slot6, "abilities_extra"), slot6.abilitiesExtra)
	end)
	idlereasy.any({
		slot0.abilitiesExtra,
		slot0.cardId
	}, function (slot0, slot1, slot2)
		uv3 = "nowBranch"
		slot3 = slot3.nowBranch
		slot3 = slot3.set

		slot3(slot3, slot1 and slot1.branch or 0)

		uv3 = "nowBranch"
		slot3 = slot3.extraLevel
		slot3 = slot3.set

		slot3(slot3, slot1 and slot1.level or 0)

		uv3 = "nowBranch"

		slot3.branch:notify()
	end)
end

function slot11.onCostItemClick(slot0, slot1, slot2, slot3)
	gGameUI:stackUI("common.gain_way", nil, , slot3.key, nil, slot3.targetNum)
end

function slot11.onStrengthenClick(slot0)
	if slot0.branch:read() > 0 then
		slot0:onExtraStrengthenClick()
	else
		uv1 = "branch"

		if #slot1.getConditionStr(slot0.selectDbId, slot0.abilityId) > 0 then
			gGameUI:showTip(gLanguageCsv.activeSlotNotEnough)

			return
		end

		uv2 = "read"
		slot2, slot3 = slot2(slot0.abilities:read(), slot0.abilityId, slot0.items:read())

		for slot7, slot8 in pairs(slot2) do
			if slot8.num < slot8.targetNum then
				gGameUI:showTip(gLanguageCsv.materialsNotEnough)

				return
			end
		end

		if slot0.gold:read() < slot3 then
			gGameUI:showTip(gLanguageCsv.goldNotEnough)

			return
		end

		slot4 = slot0.abilities:read()

		gGameApp:requestServerCustom("/game/card/ability/strength"):params(slot0.selectDbId, csv.card_ability[slot0.abilityId].position, slot0.oneKeyLevel:read() == 0 and 1 or slot0.oneKeyLevel:read() - slot0.level):onResponse(function (slot0)
			uv1 = "position"
			uv2 = "gLanguageCsv"
			slot2 = gGameUI
			slot2 = slot2.showTip
			slot4 = slot1[slot2.position] == 1 and gLanguageCsv.activeSuccess or gLanguageCsv.strengthenSuccess

			slot2(slot2, slot4)

			uv2 = "activeSuccess"
			slot2 = slot2.setEffect
			uv4 = "strengthenSuccess"

			slot2({
				effectName = "effect",
				spinePath = "effect/texing_saoguang.skel",
				parent = slot4.panel:get("pos")
			})

			uv2 = "gGameUI"
			slot2[1] = true
		end):wait({
			false
		}):doit()
	end
end

function slot11.onStrengthenOneKeyClick(slot0)
	if slot0.branch:read() > 0 then
		slot0:onExtraStrengthenOneKeyClick()
	else
		uv1 = "branch"

		if #slot1.getConditionStr(slot0.selectDbId, slot0.abilityId, true) > 0 then
			gGameUI:showTip(gLanguageCsv.activeSlotNotEnough)

			return
		end

		uv2 = "read"
		slot2, slot3 = slot2(slot0.abilities:read(), slot0.abilityId, slot0.items:read())

		for slot7, slot8 in pairs(slot2) do
			if slot8.num < slot8.targetNum then
				gGameUI:showTip(gLanguageCsv.materialsNotEnough)

				return
			end
		end

		gGameUI:stackUI("city.card.ability.strengthen_onekey", nil, {
			clickClose = true,
			blackLayer = true
		}, {
			refreshData = slot0.refreshData:read(),
			oneKeyLevel = slot0.oneKeyLevel
		})
	end
end

function slot11.sendParams(slot0)
	if slot0.branch:read() > 0 then
		return slot0.refreshData, slot0.extraOneKeyLevel
	else
		return slot0.refreshData, slot0.oneKeyLevel
	end
end

function slot11.onExtraStrengthenClick(slot0)
	uv2 = "gCardAbilityExtraCsv"
	slot3 = slot0.extraOneKeyLevel:read() == 0 and 1 or slot0.extraOneKeyLevel:read() - slot0.extraLevel:read()
	slot4 = slot0.branch:read() == 1 and slot1.name1 or slot1.name2

	if slot0.btnType == 1 then
		if not slot0:onShowTip(slot2(slot0.extraLevel:read(), gCardAbilityExtraCsv[slot0.abilityId], slot0.items:read(), slot0.gold:read() or 0)) then
			return
		end

		if slot0.extraLevel:read() == 0 then
			gGameUI:stackUI("city.card.ability.prompt_box", nil, , {
				isRich = true,
				strs1 = string.format(gLanguageCsv.extraAbilityDialog, slot4),
				strs2 = gLanguageCsv.extraDescTips,
				cb = function ()
					slot0 = gGameUI
					slot0 = slot0.showTip

					slot0(slot0, gLanguageCsv.selectExtra)

					uv0 = "gGameUI"

					slot0:onRequest(1)
				end,
				dialogParams = {
					clickClose = false
				}
			})
		else
			slot0:onRequest(slot3, true)
		end
	else
		if not slot0:onShowRmb() then
			return
		end

		gGameUI:stackUI("city.card.ability.prompt_box", nil, , {
			isRich = true,
			strs1 = string.format(gLanguageCsv.sureExtraBranch, gCommonConfigCsv.abilityExtraSwitchCost, slot4),
			strs2 = gLanguageCsv.extraAbilityTip,
			cb = function ()
				uv4 = "gGameApp"
				uv5 = "gGameApp"

				gGameApp:requestServer("/game/card/ability/extra/switch", function ()
					slot0 = gGameUI
					slot0 = slot0.showTip

					slot0(slot0, gLanguageCsv.changeBranchSuccess)

					uv0 = "gGameUI"

					slot0.branch:notify()
				end, slot4.selectDbId, slot5.branch:read())
			end,
			dialogParams = {
				clickClose = false
			}
		})
	end
end

function slot11.onRequest(slot0, slot1, slot2)
	gGameApp:requestServerCustom("/game/card/ability/extra/strength"):params(slot0.selectDbId, slot0.branch:read(), slot1):onResponse(function (slot0)
		uv1 = "extraLevel"

		if slot1 then
			uv1 = "read"

			gGameUI:showTip(slot1.extraLevel:read() == 0 and gLanguageCsv.activeSuccess or gLanguageCsv.strengthenSuccess)
		end

		uv1 = "gLanguageCsv"
		slot1 = slot1.setEffect
		uv3 = "read"

		slot1({
			effectName = "effect",
			spinePath = "effect/texing_saoguang.skel",
			parent = slot3.panel:get("pos")
		})

		uv1 = "activeSuccess"
		slot1[1] = true
	end):wait({
		false
	}):doit()
end

function slot11.onExtraStrengthenOneKeyClick(slot0)
	uv2 = "gCardAbilityExtraCsv"

	if not slot0:onShowTip(slot2(slot0.extraLevel:read(), gCardAbilityExtraCsv[slot0.abilityId], slot0.items:read(), slot0.gold:read() or 0)) then
		return
	end

	gGameUI:stackUI("city.card.ability.strengthen_onekey", nil, {
		clickClose = true,
		blackLayer = true
	}, {
		refreshData = slot0.refreshData:read(),
		oneKeyLevel = slot0.extraOneKeyLevel
	})
end

function slot11.onShowRmb(slot0)
	slot1 = true

	if slot0.rmb:read() < gCommonConfigCsv.abilityExtraSwitchCost then
		gGameUI:showTip(gLanguageCsv.notEnoughRmb)

		slot1 = false
	end

	return slot1
end

function slot11.onShowTip(slot0, slot1)
	slot2 = true

	for slot6, slot7 in pairs(slot1) do
		if slot7.num < slot7.targetNum then
			if slot7.key == "gold" then
				gGameUI:showTip(gLanguageCsv.goldNotEnough)
			else
				gGameUI:showTip(gLanguageCsv.materialsNotEnough)
			end

			slot2 = false
		end
	end

	return slot2
end

return slot11
