slot0 = require("app.views.city.zawake.tools")
slot1 = cc.load("mvc").ViewBase
slot2 = class("ZawakeForceView", Dialog)
slot2.RESOURCE_FILENAME = "zawake_force.json"
slot2.RESOURCE_BINDING = {
	leftInnerList = "leftInnerList",
	item = "item",
	downListTips = "downListTips",
	leftItem = "leftItem",
	["bgPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnRule = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	textLv = {
		binds = {
			event = "text",
			idler = bindHelper.self("lvText")
		}
	},
	textExp = {
		binds = {
			event = "text",
			idler = bindHelper.self("expText")
		}
	},
	expBar = {
		varname = "bar",
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				maskImg = "common/icon/mask_bar_red.png",
				data = bindHelper.self("expSlider")
			}
		}
	},
	rightList = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("listDatas"),
				item = bindHelper.self("item"),
				level = bindHelper.self("level"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("num", "txt")

					slot4.txt:removeAllChildren()
					slot4.num:text(string.format("Lv.%s:", slot3.level))

					slot6 = false

					if slot0.level:read() < slot3.level then
						text.addEffect(slot4.num, {
							color = ui.COLORS.DISABLED.GRAY
						})

						slot6 = true
					end

					uv7 = "multiget"
					slot9 = rich.createWithWidth(slot7.getAttrStr(slot3.cfg, slot6), 40, nil, slot1:width() - slot4.num:width() - slot4.num:x() - 20)

					slot9:anchorPoint(0, 0)
					slot9:xy(0, 0)
					slot9:addTo(slot4.txt)
					slot1:height(slot9:height() + 10)
					slot4.num:y(slot1:height() - 30)
					adapt.oneLinePos(slot4.num, slot4.txt, cc.p(5, 0))
					slot4.txt:y(5)
				end
			}
		}
	},
	leftList = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 6,
				data = bindHelper.self("attrCardDatas"),
				item = bindHelper.self("leftInnerList"),
				cell = bindHelper.self("leftItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("icon", "txt")
					slot5 = {}

					for slot9, slot10 in pairs(slot3.zawakeDate) do
						table.insert(slot5, {
							stage = slot9,
							level = slot10
						})
					end

					table.sort(slot5, function (slot0, slot1)
						return slot1.stage < slot0.stage
					end)
					slot4.txt:text(string.format("%s%s", gLanguageCsv.effortAdvance, gLanguageCsv["symbolRome" .. slot5[1].stage]))
					bind.extend(slot0, slot4.icon, {
						class = "card_icon",
						props = {
							cardId = slot3.cardId,
							rarity = csv.unit[csv.cards[slot3.cardId].unitID].rarity,
							onNode = function (slot0)
								slot1 = slot0.anchorPoint

								slot1(slot0, 0.5, 0.5)

								uv1 = "anchorPoint"
								slot1 = slot1.icon:size()

								slot0:xy(slot1.width / 2, slot1.height / 2)
								slot0:scale(0.7)
							end
						}
					})
				end
			}
		}
	}
}

function slot2.onCreate(slot0)
	Dialog.onCreate(slot0)
	slot0:initModel()
	idlereasy.when(slot0.zawake, function (slot0, slot1)
		if slot1 == nil then
			slot1 = {}
		end

		slot2 = 0
		slot3 = 0
		slot4 = 0
		slot5 = 0
		slot6 = 0
		slot7 = {}

		for slot11, slot12 in pairs(slot1) do
			if next(slot12) then
				for slot16, slot17 in pairs(slot12) do
					for slot21 = 1, slot17 do
						uv22 = "pairs"

						if not slot22.getLevelCfg(slot11, slot16, slot17) then
							break
						end

						slot2 = slot2 + slot22.exp
					end
				end

				uv13 = "pairs"
				slot13 = slot13.getCardByZawakeID(slot11)
				slot13.zawakeDate = slot12
				slot13.fightPoint = 0

				if slot13.dbId then
					slot13.fightPoint = gGameModel.cards:find(slot13.dbId):read("fighting_point")
				end

				slot15 = csv.unit[slot13.cfg.unitID].rarity
				slot13.rarity = slot15
				uv15 = "pairs"
				slot15, slot16 = slot15.getMaxStageLevel(slot11)
				slot13.maxStageLevel = slot15 * 100 + slot16

				table.insert(slot7, slot13)
			end
		end

		slot8 = table.sort

		slot8(slot7, function (slot0, slot1)
			if slot0.rarity ~= slot1.rarity then
				return slot1.rarity < slot0.rarity
			end

			if slot0.maxStageLevel ~= slot1.maxStageLevel then
				return slot1.maxStageLevel < slot0.maxStageLevel
			end

			return slot1.fightPoint < slot0.fightPoint
		end)

		uv8 = "next"
		slot8 = slot8.attrCardDatas
		slot8 = slot8.update

		slot8(slot8, slot7)

		uv8 = "next"

		slot8.downListTips:visible(#slot7 == 0)

		slot8 = {}

		for slot12, slot13 in csvPairs(csv.zawake.bonus) do
			table.insert(slot8, {
				cfg = slot13,
				level = slot12
			})
		end

		table.sort(slot8, function (slot0, slot1)
			return slot0.level < slot1.level
		end)

		for slot12, slot13 in ipairs(slot8) do
			if slot4 + slot13.cfg.exp - slot2 > 0 then
				slot6 = slot13.level - 1

				break
			elseif slot12 == csvSize(csv.zawake.bonus) and slot4 <= slot2 then
				slot6 = slot13.level
			end
		end

		uv9 = "next"
		slot9 = slot9.level
		slot9 = slot9.set

		slot9(slot9, slot6)

		uv9 = "next"
		slot9 = slot9.listDatas
		slot9 = slot9.update

		slot9(slot9, slot8)

		uv9 = "next"
		slot9 = slot9.lvText
		slot9 = slot9.set

		slot9(slot9, gLanguageCsv.textLv .. ":" .. slot6)

		uv9 = "next"

		slot9.expText:set(slot3 >= 0 and string.format("%s/%s", slot5 - slot3, slot5) or "Max")

		slot9 = 100

		if slot5 - slot3 >= 0 then
			slot9 = cc.clampf(100 * (slot5 - slot3) / slot5, 0, 100)
		end

		uv10 = "next"

		slot10.expSlider:set(slot9)
	end)
end

function slot2.initModel(slot0)
	slot0.zawake = gGameModel.role:getIdler("zawake")
	slot0.attrCardDatas = idlers.newWithMap({})
	slot0.listDatas = idlers.newWithMap({})
	slot0.lvText = idler.new("")
	slot0.expText = idler.new("")
	slot0.level = idler.new(0)
	slot0.expSlider = idler.new(0)
end

function slot2.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1500
	})
end

function slot2.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.zawakeForceLevelTitle)
		end),
		slot2.noteText(124101, 124151)
	}
end

return slot2
