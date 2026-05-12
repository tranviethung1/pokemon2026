slot0 = class("CardAttrDetailView", Dialog)
slot0.RESOURCE_FILENAME = "card_attrdetail.json"
slot0.RESOURCE_BINDING = {
	["list.centerPanel.attrPanel.item"] = "attrItem",
	["list.centerPanel.attrPanel.subList"] = "attrSubList",
	cardName = "cardNameTxt",
	["list.centerPanel.attrPanel1.item"] = "attrItem1",
	["bottomPanel.textList"] = "textList",
	["list.centerPanel.attrPanel1.innerList"] = "innerList",
	["cardPanel.cardIcon"] = "cardIcon",
	list = "bottomList",
	bottomPanel = "bottomPanel",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["list.centerPanel.attrPanel.list"] = {
		varname = "attrList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				asyncPreload = 6,
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("attrSubList"),
				cell = bindHelper.self("attrItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("txt1"):setString(slot3.txt1 .. ":")
					slot1:get("txt2"):setString(slot3.txt2)
					slot1:get("icon"):loadTexture(slot3.icon)
					adapt.oneLinePos(slot1:get("txt1"), slot1:get("txt2"), cc.p(20, 0), "left")
				end
			}
		}
	},
	["list.centerPanel.attrPanel1.list"] = {
		varname = "attrList1",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("damageData"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("attrItem1"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("txt1"):setString(slot3.txt .. ":")
					slot1:get("txt2"):setString(dataEasy.getBuffShow(mathEasy.getPreciseDecimal(slot3.num, 2)))
					adapt.oneLinePos(slot1:get("txt1"), slot1:get("txt2"), cc.p(0, 0), "left")
				end
			}
		}
	},
	["list.centerPanel.attrdetailBtn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onEnterProperty")
			}
		}
	}
}

function slot0.onEnterProperty(slot0)
	gGameUI:stackUI("city.card.detailed_attribute", nil, )
end

function slot0.onCreate(slot0, slot1)
	slot0.selectDbId = slot1

	slot0:initModel()
	slot0.bottomList:setScrollBarEnabled(false)
	slot0.attrSubList:setScrollBarEnabled(false)
	slot0.innerList:setScrollBarEnabled(false)

	slot2 = {}

	for slot6, slot7 in ipairs(game.ATTRDEF_SIMPLE_TABLE) do
		table.insert(slot2, {
			txt2 = 0,
			txt1 = getLanguageAttr(slot7),
			icon = ui.ATTR_LOGO[slot7]
		})
	end

	slot0.attrDatas = idlertable.new(slot2)
	slot4 = {
		finalDamageAdd = true,
		finalDamageSub = true,
		finalDamageDeepen = true,
		finalDamageReduce = true
	}

	for slot9, slot10 in ipairs({
		"strike",
		"damageAdd",
		"strikeDamage",
		"damageSub",
		"strikeResistance",
		"ultimateAdd",
		"block",
		"ultimateSub",
		"breakBlock",
		"cure",
		"blockPower",
		"pvpDamageAdd",
		"controlPer",
		"pvpDamageSub",
		"immuneControl",
		"physicalDamageAdd",
		"defenceIgnore",
		"physicalDamageSub",
		"specialDefenceIgnore",
		"specialDamageAdd",
		"suckBlood",
		"specialDamageSub",
		"rebound",
		"finalDamageAdd",
		"finalDamageSub",
		"finalDamageDeepen",
		"finalDamageReduce"
	}) do
		-- Nothing
	end

	slot0.damageData = idlertable.new({
		[slot9] = {
			num = "",
			txt = getLanguageAttr(slot10)
		}
	})

	idlereasy.any({
		slot0.attrs,
		slot0.attrs2
	}, function (slot0, slot1, slot2)
		uv3 = "attrDatas"
		slot3 = slot3.attrDatas
		slot3 = slot3.modify

		slot3(slot3, function (slot0)
			for slot4, slot5 in ipairs(game.ATTRDEF_SIMPLE_TABLE) do
				uv8 = "ipairs"
				slot0[slot4].txt2 = math.floor(slot8[slot5])
			end
		end, true)

		uv3 = "attrDatas"

		slot3.damageData:modify(function (slot0)
			uv2 = "ipairs"

			for slot4, slot5 in ipairs(slot2) do
				uv6 = "num"

				if slot6[slot5] ~= nil then
					uv8 = "num"
					slot0[slot4].num = math.floor(slot8[slot5])
				else
					uv6 = "math"

					if slot6[slot5] ~= nil then
						uv8 = "math"
						slot0[slot4].num = math.floor(slot8[slot5])
					else
						slot0[slot4].num = 0
					end
				end

				uv6 = "floor"

				if slot6[slot5] and slot0[slot4].num == 0 then
					slot0[slot4] = nil
				end
			end
		end, true)
	end)
	beauty.textScroll({
		isRich = false,
		align = "left",
		list = slot0.textList,
		strs = csv.cards[slot0.cardId:read()].introduction
	})
	cc.Sprite:create(dataEasy.getUnitCsv(slot0.cardId:read(), slot0.skinId:read()).cardShow):alignCenter(slot0.cardIcon:getContentSize()):addTo(slot0.cardIcon, 5, "icon")
	slot0.cardNameTxt:text(csv.cards[slot0.cardId:read()].name)
	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0)
	slot1 = gGameModel.cards:find(slot0.selectDbId)
	slot0.cardName = slot1:getIdler("name")
	slot0.cardId = slot1:getIdler("card_id")
	slot0.advance = slot1:getIdler("advance")
	slot0.unitId = slot1:getIdler("unit_id")
	slot0.skinId = slot1:getIdler("skin_id")
	slot0.attrs = slot1:getIdler("attrs")
	slot0.attrs2 = slot1:getIdler("attrs2")
end

return slot0
