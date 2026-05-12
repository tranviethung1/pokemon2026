slot0 = class("CardEffortLimitView", Dialog)
slot0.RESOURCE_FILENAME = "card_effortvalue_limit.json"
slot0.RESOURCE_BINDING = {
	["panel.Lv"] = "beforeLv",
	item = "item",
	["panel.goldCost.costNum"] = "costNum",
	panel = "panel",
	items = "items",
	["panel.goldCost.costImg"] = "costImg",
	["panel.goldCost"] = "goldCost",
	["panel.max"] = "max",
	["panel.afterLv"] = "afterLv",
	["panel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				padding = 5,
				data = bindHelper.self("advanceDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					for slot7 = 1, 2 do
						if slot3[slot7] then
							slot9 = slot3[slot7]
							slot10, slot11 = dataEasy.getEffortValueAttrData(slot9.attrType)

							slot1:get("pos" .. slot7):multiget("icon", "name", "addAttr", "txt", "up").icon:texture(slot11)

							if not slot9.nextLv then
								slot8.name:text(string.format(gLanguageCsv.effortExtraLvUp, slot10, slot9.maxVal + slot9.totalVal))
								itertools.invoke({
									slot8.up,
									slot8.addAttr,
									slot8.txt
								}, "hide")
							else
								slot8.name:text(string.format(gLanguageCsv.effortExtraLvUp .. gLanguageCsv.symbolBracketLeft, slot10, slot9.maxVal + slot9.totalVal))
								slot8.addAttr:text("+" .. slot9.nextLv)
							end

							adapt.oneLinePos(slot8.name, {
								slot8.addAttr,
								slot8.up,
								slot8.txt
							}, {
								cc.p(5, 0),
								cc.p(5, 0),
								cc.p(5, 0)
							}, "left")
						else
							slot8 = slot1:get("pos" .. slot7):multiget("icon", "name", "addAttr", "txt", "up")

							itertools.invoke({
								slot8.icon,
								slot8.name,
								slot8.addAttr,
								slot8.txt,
								slot8.up
							}, "hide")
						end
					end
				end
			}
		}
	},
	["panel.itemList"] = {
		varname = "itemList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 61,
				data = bindHelper.self("listDatas"),
				item = bindHelper.self("items"),
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key,
								num = dataEasy.getNumByKey(slot3.key),
								targetNum = slot3.num
							},
							onNode = function (slot0)
								slot0:scale(0.9)
							end
						}
					})
				end
			}
		}
	},
	["panel.btn"] = {
		varname = "btn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.selectDbId = slot2()
	slot0.cardId = slot1
	slot3 = csv.cards[slot1]

	slot0:initModel()
	slot0:initCfg()
	idlereasy.when(slot0.effortExtraLevel, function (slot0, slot1)
		slot2 = 0
		uv3 = "levelMax"
		slot3.levelMax = false
		uv3 = "levelMax"
		slot3.extraCfg = gCardEffortExtra[slot1 + 1]
		uv3 = "levelMax"

		if not slot3.extraCfg then
			uv3 = "levelMax"
			slot3.levelMax = true
			uv3 = "levelMax"
			slot3.extraCfg = gCardEffortExtra[slot1]
			slot3 = itertools.invoke
			uv5 = "levelMax"
			slot5 = slot5.afterLv
			uv5 = "levelMax"
			slot5 = slot5.beforeLv
			uv5 = "levelMax"

			slot3({
				slot5,
				slot5,
				slot5.panel:get("up")
			}, "hide")

			uv3 = "levelMax"
			slot3 = slot3.max
			slot3 = slot3.show

			slot3(slot3)

			uv3 = "levelMax"

			slot3.max:get("txt"):text(gLanguageCsv.textLv .. slot1)

			slot6 = 40
			uv6 = "levelMax"
			slot6 = slot6.max:get("txt")
			uv6 = "levelMax"

			adapt.oneLineCenterPos(cc.p(200, slot6), {
				slot6,
				slot6.max:get("img")
			}, cc.p(10, 0))
		else
			uv3 = "levelMax"
			slot3.levelMax = false
			uv3 = "levelMax"
			slot3 = slot3.max
			slot3 = slot3.hide

			slot3(slot3)

			uv3 = "levelMax"
			slot3 = slot3.beforeLv
			slot3 = slot3.text

			slot3(slot3, slot1 <= 0 and gLanguageCsv.notActivatedTip or gLanguageCsv.textLv .. slot1)

			uv3 = "levelMax"

			slot3.afterLv:text(gLanguageCsv.textLv .. slot1 + 1)
		end

		slot3 = {}
		uv5 = "levelMax"

		for slot7, slot8 in orderCsvPairs(slot5.cfg) do
			slot10, slot11, slot12, slot13 = dataEasy.getCardEffortExtraMax(game.ATTRDEF_TABLE[slot8.attrType], slot1)

			if (slot2 + 1) % 2 == 1 then
				table.insert(slot3, {})
			end

			table.insert(slot3[#slot3], {
				id = slot7,
				attrType = slot8.attrType,
				maxVal = slot10,
				totalVal = slot11,
				nextLv = slot13
			})
		end

		uv4 = "levelMax"
		slot6 = slot3

		slot4.advanceDatas:update(slot6)

		slot4 = {}
		slot5 = 0
		uv6 = "levelMax"
		uv7 = "levelMax"
		uv9 = "levelMax"
		slot7, slot6.cost, slot9 = slot7:getOtherCost(slot9.extraCfg.cost)
		slot5 = slot9
		uv6 = "levelMax"
		slot6 = slot6.listDatas
		slot6 = slot6.update

		slot6(slot6, slot7)

		uv6 = "levelMax"
		slot6, slot7 = slot6:costEnough()
		slot8 = uiEasy.setBtnShader
		uv9 = "levelMax"
		slot9 = slot9.btn
		uv10 = "levelMax"
		slot10 = slot10.btn:get("txt")

		if slot6 then
			uv11 = "levelMax"

			if not slot11.levelMax then
				uv11 = "levelMax"
				slot11 = slot11.level
				slot12 = slot11
				uv12 = "levelMax"

				if slot12.extraCfg.needLevel <= slot11.read(slot12) then
					slot11 = 1
				end
			end
		else
			slot11 = 3
		end

		slot8(slot9, slot10, slot11)

		uv8 = "levelMax"

		slot8.costNum:text(mathEasy.getShortNumber(slot5, 2))

		uv10 = "levelMax"

		text.addEffect(slot10.costNum, {
			color = slot7 and cc.c4b(91, 84, 91, 255) or cc.c4b(249, 87, 114, 255)
		})

		slot9 = adapt.oneLineCenterPos
		slot12 = 35
		uv12 = "levelMax"
		slot12 = slot12.goldCost:get("costTxt")
		uv12 = "levelMax"
		slot12 = slot12.costNum
		uv12 = "levelMax"

		slot9(cc.p(200, slot12), {
			slot12,
			slot12,
			slot12.costImg
		}, cc.p(15, 0))

		uv9 = "levelMax"

		slot9.goldCost:visible(slot5 > 0)
	end)
	Dialog.onCreate(slot0, {
		noBlackLayer = true,
		clickClose = true
	})
end

function slot0.initModel(slot0)
	idlereasy.when(slot0.selectDbId, function (slot0, slot1)
		slot2 = gGameModel.cards
		slot3 = slot2
		slot2 = slot2.find(slot3, slot1)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.effortExtraLevel = idlereasy.assign(slot2.getIdler(slot6, "extra_effort_level"), slot6.effortExtraLevel)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.level = idlereasy.assign(slot2.getIdler(slot6, "level"), slot6.level)
	end)

	slot1 = gGameModel.cards:find(slot0.selectDbId)
	slot0.advanceDatas = idlers.new({})
	slot0.listDatas = idlers.new({})
	slot0.levelMax = false
end

function slot0.initCfg(slot0)
	for slot5, slot6 in orderCsvPairs(csv.card_effort) do
		if slot6.attrType ~= game.ATTRDEF_ENUM_TABLE.specialDamage and slot6.advance == 1 then
			-- Nothing
		end
	end

	slot0.cfg = {
		[slot5] = slot6
	}
end

function slot0.getOtherCost(slot0, slot1)
	slot3 = {}
	slot4 = 0
	slot0.goldEnough = true

	for slot8, slot9 in pairs(dataEasy.getItemData(slot1)) do
		if dataEasy.stringMapingID(slot9.key) ~= game.ITEM_STRING_ENUM_TABLE.gold then
			table.insert(slot3, {
				key = slot9.key,
				num = slot9.num
			})
		else
			slot0.goldEnough = slot9.num < dataEasy.getNumByKey(slot8)
			slot4 = slot9.num
		end
	end

	return slot3, slot2, slot4
end

function slot0.costEnough(slot0)
	slot1 = true
	slot2 = true

	for slot6, slot7 in pairs(slot0.cost) do
		if dataEasy.stringMapingID(slot7.key) == game.ITEM_STRING_ENUM_TABLE.gold then
			slot1 = slot7.num < dataEasy.getNumByKey(slot7.key)
		end

		if dataEasy.getNumByKey(slot7.key) < slot7.num then
			slot2 = false
		end
	end

	return slot2, slot1
end

function slot0.onBtnClick(slot0)
	slot1, slot2 = slot0:costEnough()

	if slot0.levelMax then
		gGameUI:showTip(gLanguageCsv.effortExtraLvMax)
	elseif slot0.level:read() < slot0.extraCfg.needLevel then
		gGameUI:showTip(string.format(gLanguageCsv.effortExtraNeedLv, slot0.extraCfg.needLevel))
	elseif not slot2 then
		gGameUI:showTip(gLanguageCsv.talentLevelGoldUp)
	elseif slot1 then
		gGameApp:requestServer("/game/card/effort/advance", function (slot0)
		end, slot0.selectDbId:read())
	else
		gGameUI:showTip(gLanguageCsv.effortExtraItemLess)
	end
end

function slot0.createItemList(slot0, slot1)
	slot1 = slot1 or {}
	slot2 = ccui.Layout:create():size(0, 0):hide()

	slot2:retain()
	slot0:onNodeEvent("exit", function ()
		uv0 = "release"

		if slot0 then
			uv0 = "release"

			slot0:release()

			uv0 = nil
		end
	end)
	bind.extend(slot0, slot0.itemList, {
		class = "listview",
		props = {
			data = bindHelper.model("advanceDatas"),
			item = slot2,
			margin = slot1.margin,
			padding = slot1.padding,
			dataOrderCmp = slot1.sortFunc or dataEasy.sortItemCmp,
			onAfterBuild = slot1.onAfterBuild,
			itemAction = {
				isAction = false
			},
			onItem = function (slot0, slot1, slot2, slot3)
				bind.extend(slot0, slot1, {
					class = "icon_key",
					props = {
						data = {
							key = slot3.key,
							num = dataEasy.getNumByKey(slot3.key),
							targetNum = slot3.num
						},
						onNode = function (slot0)
							uv1 = "scale"

							if slot1.scale then
								uv3 = "scale"

								slot0:scale(slot3.scale)
							end

							slot1 = slot0:box()
							slot2 = slot0.alignCenter

							slot2(slot0, slot1)

							uv2 = "box"
							slot2 = slot2.size

							slot2(slot2, slot1)

							uv2 = "scale"

							if slot2.onNode then
								uv2 = "scale"
								uv4 = "alignCenter"

								slot2.onNode(slot0, slot4)
							end
						end
					}
				})
			end
		}
	})
	slot0.itemList:adaptTouchEnabled()
end

return slot0
