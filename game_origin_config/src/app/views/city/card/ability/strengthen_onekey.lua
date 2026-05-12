slot0 = {
	cc.c4b(97, 145, 192, 255),
	cc.c4b(139, 92, 153, 255),
	cc.c4b(250, 105, 74, 255)
}
slot1 = {
	1.1,
	1,
	0.9
}
slot2 = {
	"city/card/ability/panel_jctx.png",
	"city/card/ability/panel_pttx.png",
	"city/card/ability/panel_hxtx.png",
	"city/card/ability/panel_fz.png"
}

function slot3(slot0, slot1, slot2, slot3, slot4)
	slot5 = {}
	slot6 = 0

	for slot10 = slot0 or 0, slot3 - 1 do
		if slot10 < slot1.strengthMax then
			slot11 = nil
			slot11 = ((slot4 or {}).type ~= 2 or csv.card_ability_extra_cost[slot10 + 1]["costItemMap" .. slot1.strengthSeqID]) and csv.card_ability_cost[slot10 + 1]["costItemMap" .. slot1.strengthSeqID]

			for slot15, slot16 in csvMapPairs(slot11) do
				if slot15 ~= "gold" then
					slot17 = nil
					slot18 = slot2[slot15] or 0

					for slot23, slot24 in ipairs(slot5) do
						if slot24.key == slot15 then
							slot17 = slot23
							slot19 = slot16 + slot24.targetNum

							break
						end
					end

					if slot18 < slot19 then
						return slot5, slot6, slot10
					end

					if slot17 then
						slot5[slot17].targetNum = slot19
					else
						table.insert(slot5, {
							key = slot15,
							num = slot2[slot15] or 0,
							targetNum = slot16
						})
					end
				end
			end

			slot6 = slot6 + (slot11.gold or 0)
		end
	end

	return slot5, slot6
end

slot4 = require("app.views.city.card.ability.tools")
slot6 = class("CardAbilityStrengthenOneKeyView", cc.load("mvc").ViewBase)
slot6.RESOURCE_FILENAME = "card_ability_strengthen_onekey.json"
slot6.RESOURCE_BINDING = {
	["panel.numPanel"] = "numPanel",
	item = "item",
	["panel.textNote1"] = "textNote1",
	["panel.icon"] = "icon",
	panel = "panel",
	["panel.textLvNote"] = "textLvNote",
	["panel.textLvMaxNum"] = "textLvMaxNum",
	["panel.textLvNum"] = "textLvNum",
	["panel.iconPanel"] = "iconPanel",
	["panel.textNum"] = "textNum",
	["panel.textName"] = "textName",
	["panel.btnSure"] = {
		varname = "btnStrengthen",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onStrengthenClick")
			}
		}
	},
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
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
	["panel.numPanel.subBtn"] = {
		varname = "numSubBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -1)
			end)
		}
	},
	["panel.numPanel.addBtn"] = {
		varname = "numAddBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 1)
			end)
		}
	}
}

function slot6.onCreate(slot0, slot1)
	slot0:enableSchedule()
	slot0.itemList:setClippingEnabled(false)

	slot0.refreshData = slot1.refreshData
	slot0.oneKeyLevel = slot1.oneKeyLevel

	slot0:initModel()

	slot0.eventDatas = idlers.new()

	if slot0.refreshData.branch then
		if gCardAbilityExtraCsv[slot0.abilitySeqID] then
			slot0.maxNum = slot2.strengthMax

			slot0.textName:text(slot0.branch == 1 and slot2.name1 or slot2.name2)

			uv8 = "enableSchedule"

			text.addEffect(slot0.textName, {
				color = slot8[3]
			})

			slot7 = slot0.branch == 1 and slot2.icon1 or slot2.icon2
			uv7 = "itemList"

			slot0.iconPanel:get("icon"):texture(slot7):scale(slot7[1])

			slot7 = "iconBg"
			uv7 = "setClippingEnabled"
			slot7 = slot7[4]
			uv7 = "itemList"

			slot0.iconPanel:get(slot7):texture(slot7):scale(slot7[1])

			slot5 = slot0.extraLevel:read() or 0
			slot0.level = slot5 + 1

			slot0.textLvNum:text(slot5)
			slot0.textLvMaxNum:text("/" .. slot0.maxNum)

			slot6 = adapt.oneLinePos

			slot6(slot0.textName, {
				slot0.textLvNote,
				slot0.textLvNum,
				slot0.textLvMaxNum
			}, {
				cc.p(5, 0),
				cc.p(5, 0),
				cc.p(5, 0)
			})

			uv6 = "refreshData"
			slot6, slot7, slot8 = slot6(slot5, slot2, slot0.items:read(), slot0.maxNum, {
				type = 2
			})
			slot0.maxNum = slot8 or slot2.strengthMax
			slot0.num = idler.new(tonumber(slot0.maxNum))

			idlereasy.any({
				slot0.extraLevel,
				slot0.items,
				slot0.num,
				slot0.gold
			}, function (slot0, slot1, slot2, slot3, slot4)
				uv5 = "numPanel"
				slot5 = slot5.numPanel:get("num")
				slot5 = slot5.text
				slot7 = slot3

				slot5(slot5, slot7)

				uv5 = "numPanel"
				slot5 = slot5.numSubBtn
				slot5 = slot5.setTouchEnabled
				uv7 = "numPanel"
				slot7 = slot7.level < slot3

				slot5(slot5, slot7)

				uv5 = "numPanel"
				slot5 = slot5.numAddBtn
				slot6 = slot5
				uv7 = "numPanel"

				slot5.setTouchEnabled(slot6, slot3 < slot7.maxNum)

				uv6 = "numPanel"
				slot6 = slot6.numSubBtn
				uv8 = "numPanel"
				slot8 = slot8.level < slot3 and "normal" or "hsl_gray"

				cache.setShader(slot6, false, slot8)

				slot5 = cache.setShader
				uv6 = "numPanel"
				uv8 = "numPanel"

				slot5(slot6.numAddBtn, false, slot3 < slot8.maxNum and "normal" or "hsl_gray")

				uv5 = "get"

				if slot5 then
					uv5 = "num"
					uv7 = "get"
					slot5, slot6 = slot5(slot1, slot7, slot2, slot3, {
						type = 2
					})
					slot7 = true

					if #slot5 == 0 then
						slot7 = false
					end

					slot8 = uiEasy.setBtnShader
					uv9 = "numPanel"
					uv10 = "numPanel"

					slot8(slot9.btnStrengthen, slot10.btnStrengthen:get("textNote"), slot7 and 1 or 3)

					uv8 = "numPanel"

					slot8.textNum:text(slot6)

					uv10 = "numPanel"

					text.addEffect(slot10.textNum, {
						color = slot4 < slot6 and ui.COLORS.NORMAL.RED or ui.COLORS.NORMAL.DEFAULT
					})

					slot9 = adapt.oneLineCenterPos
					slot12 = 835
					uv12 = "numPanel"
					slot12 = slot12.textNote1
					uv12 = "numPanel"
					slot12 = slot12.textNum
					uv12 = "numPanel"

					slot9(cc.p(1710, slot12), {
						slot12,
						slot12,
						slot12.icon
					}, cc.p(15, 0))

					uv9 = "numPanel"

					slot9.eventDatas:update(slot5)

					if #slot5 > 0 then
						uv9 = "numPanel"
						slot11 = (#slot5 - 1) * 60
						uv11 = "numPanel"
						uv13 = "numPanel"

						slot11.itemList:x(slot13.btnStrengthen:x() - (#slot5 * slot9.item:size().width + slot11) / 2):setItemsMargin(60)
					end
				end
			end)
		end

		return
	end

	if csv.card_ability[slot0.abilityId] then
		slot3 = slot2.strengthMax

		slot0.textName:text(slot2.name)

		uv7 = "enableSchedule"

		text.addEffect(slot0.textName, {
			color = slot7[slot2.type]
		})

		slot6 = slot2.icon
		uv6 = "itemList"

		slot0.iconPanel:get("icon"):texture(slot6):scale(slot6[slot2.type] * 2)

		slot6 = "iconBg"
		uv6 = "setClippingEnabled"
		slot6 = slot6[slot2.type]
		uv6 = "itemList"

		slot0.iconPanel:get(slot6):texture(slot6):scale(slot6[slot2.type])

		slot4 = slot0.abilities:read()[slot2.position] or 0
		slot0.level = slot4 + 1

		slot0.textLvNum:text(slot4)

		slot5 = slot0.textLvMaxNum
		slot5 = slot5.text

		slot5(slot5, "/" .. slot3)

		uv5 = "refreshData"
		slot5, slot6, slot7 = slot5(slot0.abilities:read()[slot2.position], slot2, slot0.items:read(), slot3)
		slot0.maxNum = slot7 or slot2.strengthMax

		adapt.oneLinePos(slot0.textLvNum, slot0.textLvMaxNum, cc.p(3, 0), "left")

		slot8 = idler.new(slot0.maxNum)
		slot0.num = slot8
		uv8 = "oneKeyLevel"

		uiEasy.setBtnShader(slot0.btnStrengthen, slot0.btnStrengthen:get("textNote"), #slot8.getConditionStr(slot0.selectDbId, slot0.abilityId) == 0 and 1 or 3)
	end

	idlereasy.any({
		slot0.abilities,
		slot0.items,
		slot0.num,
		slot0.gold
	}, function (slot0, slot1, slot2, slot3, slot4)
		uv5 = "numPanel"
		slot5 = slot5.numPanel:get("num")
		slot6 = slot5

		slot5.text(slot6, slot3)

		uv6 = "numPanel"
		slot6 = slot6.abilityId
		uv6 = "numPanel"
		slot6 = slot6.numSubBtn
		slot6 = slot6.setTouchEnabled
		uv8 = "numPanel"
		slot8 = slot8.level < slot3

		slot6(slot6, slot8)

		uv6 = "numPanel"
		slot6 = slot6.numAddBtn
		slot7 = slot6
		uv8 = "numPanel"

		slot6.setTouchEnabled(slot7, slot3 < slot8.maxNum)

		uv7 = "numPanel"
		slot7 = slot7.numSubBtn
		uv9 = "numPanel"
		slot9 = slot9.level < slot3 and "normal" or "hsl_gray"

		cache.setShader(slot7, false, slot9)

		uv7 = "numPanel"
		uv9 = "numPanel"

		cache.setShader(slot7.numAddBtn, false, slot3 < slot9.maxNum and "normal" or "hsl_gray")

		if csv.card_ability[slot6] then
			uv6 = "get"
			slot8 = slot5
			slot6, slot7 = slot6(slot1[slot5.position], slot8, slot2, slot3)
			uv8 = "numPanel"

			slot8.textNum:text(slot7)

			uv10 = "numPanel"

			text.addEffect(slot10.textNum, {
				color = slot4 < slot7 and ui.COLORS.NORMAL.RED or ui.COLORS.NORMAL.DEFAULT
			})

			slot9 = adapt.oneLineCenterPos
			slot12 = 835
			uv12 = "numPanel"
			slot12 = slot12.textNote1
			uv12 = "numPanel"
			slot12 = slot12.textNum
			uv12 = "numPanel"

			slot9(cc.p(1710, slot12), {
				slot12,
				slot12,
				slot12.icon
			}, cc.p(15, 0))

			uv9 = "numPanel"

			slot9.eventDatas:update(slot6)

			if #slot6 == 1 or #slot6 == 2 then
				uv9 = "numPanel"
				slot11 = (#slot6 - 1) * 120
				uv11 = "numPanel"
				uv13 = "numPanel"

				slot11.itemList:x(slot13.btnStrengthen:x() - (#slot6 * slot9.item:size().width + slot11) / 2):setItemsMargin(120)
			end
		end
	end)
end

function slot6.initModel(slot0)
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.items = gGameModel.role:getIdler("items")
	slot0.selectDbId = slot0.refreshData.cardDbid
	slot0.abilityId = slot0.refreshData.id
	slot0.extraLevel = idler.new(0)

	if assertInWindows(slot0.selectDbId, "val:%s", tostring(slot0.selectDbId)) then
		return
	end

	slot1 = gGameModel.cards:find(slot0.selectDbId)
	slot0.advance = idlereasy.assign(slot1:getIdler("advance"), slot0.advance)
	slot0.cardId = idlereasy.assign(slot1:getIdler("card_id"), slot0.cardId)
	slot0.cardLv = idlereasy.assign(slot1:getIdler("level"), slot0.cardLv)
	slot0.abilities = idlereasy.assign(slot1:getIdler("abilities"), slot0.abilities)

	slot0.extraLevel:set(slot1:getIdler("abilities_extra"):read() and slot2.level or 0)

	slot0.branch = slot0.refreshData.branch or nil
	slot0.abilitySeqID = slot0.branch and slot0.refreshData.id or nil
end

function slot6.onCostItemClick(slot0, slot1, slot2, slot3)
	gGameUI:stackUI("common.gain_way", nil, , slot3.key, nil, slot3.targetNum)
end

function slot6.onStrengthenClick(slot0)
	if slot0.branch then
		slot0:onExtraStrengthenClick()
	else
		uv1 = "branch"

		if #slot1.getConditionStr(slot0.selectDbId, slot0.abilityId, true) > 0 then
			gGameUI:showTip(gLanguageCsv.activeSlotNotEnough)

			return
		end

		slot3 = slot0.abilityId
		slot2 = csv.card_ability[slot3]
		uv3 = "onExtraStrengthenClick"
		slot7 = slot0.num
		slot8 = slot7
		slot3, slot4 = slot3(slot0.abilities:read()[slot2.position], slot2, slot0.items:read(), slot7.read(slot8))

		for slot8, slot9 in pairs(slot3) do
			if slot9.num < slot9.targetNum then
				gGameUI:showTip(gLanguageCsv.materialsNotEnough)

				return
			end
		end

		if slot0.gold:read() < slot4 then
			uiEasy.showDialog("gold", nil, {
				dialog = true
			})

			return
		end

		slot0.oneKeyLevel:set(slot0.num:read())
		slot0:onClose()
	end
end

function slot6.onIncreaseNum(slot0, slot1)
	slot0.num:modify(function (slot0)
		uv3 = "cc"
		uv4 = "clampf"
		uv6 = "clampf"

		return true, cc.clampf(slot0 + slot3, slot4.level, math.max(slot6.maxNum, 1))
	end)
end

function slot6.onChangeNum(slot0, slot1, slot2, slot3)
	if slot2.name == "click" then
		slot0:unScheduleAll()
		slot0:onIncreaseNum(slot3)
	elseif slot2.name == "began" then
		slot0:schedule(function ()
			uv0 = "onIncreaseNum"
			uv2 = "onIncreaseNum"

			slot0:onIncreaseNum(slot2)
		end, 0.05, 0, 1)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot0:unScheduleAll()
	end
end

function slot6.onExtraStrengthenClick(slot0)
	uv1 = "extraLevel"
	slot6 = {
		type = 2
	}
	slot1, slot2 = slot1(slot0.extraLevel:read(), gCardAbilityExtraCsv[slot0.abilitySeqID], slot0.items:read(), slot0.num:read(), slot6)

	for slot6, slot7 in pairs(slot1) do
		if slot7.num < slot7.targetNum then
			gGameUI:showTip(gLanguageCsv.materialsNotEnough)

			return
		end
	end

	if slot0.gold:read() < slot2 then
		uiEasy.showDialog("gold", nil, {
			dialog = true
		})

		return
	end

	slot0.oneKeyLevel:set(slot0.num:read())
	slot0:onClose()
end

return slot6
