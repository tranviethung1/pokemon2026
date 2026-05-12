slot0 = class("BattleBetDetailView", Dialog)
slot0.RESOURCE_FILENAME = "yybet_attrdetail.json"
slot0.RESOURCE_BINDING = {
	bottomPanel = "bottomPanel",
	["list.centerPanel.attrPanel1.item"] = "attrItem1",
	["bottomPanel.textList"] = "textList",
	["list.centerPanel.attrPanel.item"] = "attrItem",
	["cardPanel.cardIcon"] = "cardIcon",
	cardName = "cardNameTxt",
	["list.centerPanel.attrPanel.subList"] = "attrSubList",
	["list.centerPanel.attrPanel1.innerList"] = "innerList",
	["heldItem.imgBG"] = "heldItemImgBg",
	list = "bottomList",
	["heldItem.imgIcon"] = "heldItemIcon",
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
	},
	btn = {
		varname = "btn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onHandbookClick")
			}
		}
	},
	heldItem = {
		varname = "heldItem",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onHeldItemClick")
			}
		}
	}
}

function slot0.onEnterProperty(slot0)
	gGameUI:stackUI("city.card.detailed_attribute", nil, )
end

function slot0.onCreate(slot0, slot1, slot2)
	slot0.selectDbId = slot1

	slot0:initModel(slot2)
	slot0.bottomList:setScrollBarEnabled(false)
	slot0.attrSubList:setScrollBarEnabled(false)
	slot0.innerList:setScrollBarEnabled(false)

	slot0.attrDatas = {}

	for slot6, slot7 in ipairs(game.ATTRDEF_SIMPLE_TABLE) do
		table.insert(slot0.attrDatas, {
			txt2 = 0,
			txt1 = getLanguageAttr(slot7),
			icon = ui.ATTR_LOGO[slot7]
		})
	end

	slot0.damageData = {}

	for slot7, slot8 in ipairs({
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
		"rebound"
	}) do
		slot0.damageData[slot7] = {
			num = "",
			txt = getLanguageAttr(slot8)
		}
	end

	for slot7, slot8 in ipairs(game.ATTRDEF_SIMPLE_TABLE) do
		slot0.attrDatas[slot7].txt2 = math.floor(slot0.attrs[slot8] or 0)
	end

	for slot7, slot8 in ipairs(slot3) do
		if slot0.attrs[slot8] ~= nil then
			slot0.damageData[slot7].num = math.floor(slot0.attrs[slot8] or 0)
		elseif slot0.attrs2[slot8] ~= nil then
			slot0.damageData[slot7].num = math.floor(slot0.attrs2[slot8] or 0)
		else
			slot0.damageData[slot7].num = 0
		end
	end

	beauty.textScroll({
		isRich = false,
		align = "left",
		list = slot0.textList,
		strs = csv.cards[slot0.cardId].introduction
	})
	cc.Sprite:create(dataEasy.getUnitCsv(slot0.cardId).cardShow):alignCenter(slot0.cardIcon:getContentSize()):addTo(slot0.cardIcon, 5, "icon")
	slot0.cardNameTxt:text(csv.cards[slot0.cardId].name)
	slot0:onResetHeldItemIcon()
	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0, slot1)
	slot0.cardName = csv.cross.battlebet.cards[slot0.selectDbId].desc
	slot0.cardId = slot1.card_id
	slot0.advance = slot1.advance
	slot0.attrs = slot1.attrs or {}
	slot0.attrs2 = slot1.attrs2 or {}
end

function slot0.onHandbookClick(slot0)
	gGameUI:stackUI("city.handbook.view", nil, {
		full = true
	}, {
		cardId = csv.cross.battlebet.cards[slot0.selectDbId].cardID
	})
end

function slot0.onHeldItemClick(slot0)
	slot1 = csv.cross.battlebet.cards[slot0.selectDbId].helditem

	gGameUI:showItemDetail(slot0.heldItem, {
		num = 1,
		key = slot1.id,
		level = slot1.level,
		advance = slot1.advance
	})
end

function slot0.onResetHeldItemIcon(slot0)
	slot1 = "common/box/box_carry.png"
	slot2 = "city/card/helditem/icon_jiahao.png"
	slot3 = 1
	slot4 = false
	slot4 = true
	slot6 = csv.held_item.items[csv.cross.battlebet.cards[slot0.selectDbId].helditem.id]
	slot2 = slot6.icon
	slot1 = string.format("city/card/helditem/panel_icon_%d.png", slot6.quality)

	if csvSize(slot6.exclusiveCards) > 0 then
		ccui.ImageView:create("common/icon/txt_zs.png"):xy(75, 130):addTo(slot0.heldItem, 6, "exclusive")
	end

	slot8 = cc.Label:createWithTTF(gLanguageCsv.textLv, ui.FONT_PATH, 30):xy(65, 0):addTo(slot0.heldItem, 8, "textLv")
	slot9 = cc.Label:createWithTTF(slot5.helditem.level, ui.FONT_PATH, 38):xy(65, 0):addTo(slot0.heldItem, 8, "textLvNum")
	slot3 = 1.7

	adapt.oneLineCenterPos(cc.p(75, -10), {
		slot8,
		slot9
	}, cc.p(5, 3))
	text.addEffect(slot8, {
		outline = {
			color = ui.COLORS.OUTLINE.DEFAULT
		}
	})
	text.addEffect(slot9, {
		outline = {
			color = ui.COLORS.OUTLINE.DEFAULT
		}
	})

	if slot0.heldItem:get("spine") then
		slot0.heldItem:get("spine"):show()
		slot0.heldItem:get("spine"):play("effect_loop")
	else
		widget.addAnimationByKey(slot0.heldItem, "effect/yuanxingsaoguang.skel", "spine", "effect_loop", 100):xy(slot0.heldItem:size().width / 2, slot0.heldItem:size().height / 2)
	end

	slot0.heldItemImgBg:scale(1)
	slot0.heldItemImgBg:texture(slot1)
	slot0.heldItemIcon:texture(slot2)
	slot0.heldItemIcon:scale(slot3)
end

return slot0
