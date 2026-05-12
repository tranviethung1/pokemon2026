slot0 = class("ContestBetDetailView", Dialog)
slot1 = {
	"strike",
	"damageAdd",
	"strikeDamage",
	"damageSub",
	"strikeResistance",
	"block",
	"breakBlock",
	"cure",
	"blockPower",
	"controlPer",
	"immuneControl",
	"defenceIgnore",
	"specialDefenceIgnore",
	"suckBlood",
	"rebound"
}
slot0.RESOURCE_FILENAME = "contest_bet_attrdetail.json"
slot0.RESOURCE_BINDING = {
	["bg.cardName"] = "cardName",
	["bg.teamNote"] = "teamNote",
	["bg.teamName"] = "teamName",
	["bg.heldItem.imgBG"] = "heldItemImgBg",
	["bg.attrPanel"] = "attrPanel",
	["bg.headPanel"] = "headPanel",
	skillItem = "skillItem",
	item1 = "item1",
	subList1 = "subList1",
	item2 = "item2",
	["bg.heldItem.imgIcon"] = "heldItemIcon",
	subList2 = "subList2",
	["bg.heldItem.textLv"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["bg.skillList"] = {
		varname = "skillList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("skillDatas"),
				item = bindHelper.self("skillItem"),
				zawakeSkills = bindHelper.self("zawakeSkills"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("level", "name", "type", "icon", "imgBg", "btn", "levelNote")

					slot4.level:text(slot3.level)
					slot4.levelNote:text(gLanguageCsv.textLv)
					adapt.oneLinePos(slot4.level, slot4.levelNote, cc.p(2, 0), "right")
					uiEasy.setSkillInfoToItems({
						name = slot4.name,
						icon = slot4.icon,
						type1 = slot4.type
					}, slot3.id)
					slot4.imgBg:removeChildByName("zawakeBg")
					slot4.icon:removeChildByName("zawakeUp")

					if slot3.zawake then
						ccui.ImageView:create("city/zawake/panel_z2.png"):alignCenter(slot4.imgBg:size()):addTo(slot4.imgBg, 0, "zawakeBg"):scaleX(0.94):scaleY(0.8)
						ccui.ImageView:create("city/drawcard/draw/txt_up.png"):scale(1):align(cc.p(1, 1), 200, 190):addTo(slot4.icon, 1, "zawakeUp")
						slot4.name:text(csv.skill[csv.skill[slot3.id].zawakeEffect[1]].skillName .. slot4.name:text())
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onSkillDetail")
			}
		}
	},
	["bg.attrPanel.list1"] = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("subList1"),
				cell = bindHelper.self("item1"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("txt1"):setString(slot3.txt1 .. ":")
					slot1:get("txt2"):setString(slot3.txt2)
					slot1:get("icon"):loadTexture(slot3.icon)
					adapt.oneLinePos(slot1:get("txt1"), slot1:get("txt2"), cc.p(20, 0), "left")
				end
			}
		}
	},
	["bg.attrPanel.list2"] = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("damageData"),
				item = bindHelper.self("subList2"),
				cell = bindHelper.self("item2"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("txt1"):setString(slot3.txt .. ":")
					slot1:get("txt2"):setString(dataEasy.getBuffShow(mathEasy.getPreciseDecimal(slot3.num, 2)))
					adapt.oneLinePos(slot1:get("txt1"), slot1:get("txt2"), cc.p(0, 0), "left")
				end
			}
		}
	},
	["bg.attrPanel.attrdetailBtn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onEnterProperty")
			}
		}
	},
	["bg.btnAttr"] = {
		varname = "btnAttr",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onTabChange")
			}
		}
	},
	["bg.btnSkill"] = {
		varname = "btnSkill",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onTabChange")
			}
		}
	},
	["bg.heldItem"] = {
		varname = "heldItem",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onHeldItemClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:initTools(slot5 or 2)

	slot0.btnType = idler.new(1)
	slot0.cardCsvId = slot1
	slot0.data = slot3
	slot0.isBetView = slot4

	slot0:initModel(slot1, slot2, slot3)

	slot0.attrDatas = {}

	for slot9, slot10 in ipairs(game.ATTRDEF_SIMPLE_TABLE) do
		table.insert(slot0.attrDatas, {
			txt2 = 0,
			txt1 = getLanguageAttr(slot10),
			icon = ui.ATTR_LOGO[slot10]
		})
	end

	slot0.damageData = {}
	uv7 = "initTools"

	for slot9, slot10 in ipairs(slot7) do
		slot0.damageData[slot9] = {
			num = "",
			txt = getLanguageAttr(slot10)
		}
	end

	for slot9, slot10 in ipairs(game.ATTRDEF_SIMPLE_TABLE) do
		slot0.attrDatas[slot9].txt2 = math.floor(slot0.attrs[slot10] or 0)
	end

	uv7 = "initTools"

	for slot9, slot10 in ipairs(slot7) do
		if slot0.attrs[slot10] ~= nil then
			slot0.damageData[slot9].num = math.floor(slot0.attrs[slot10] or 0)
		elseif slot0.attrs2[slot10] ~= nil then
			slot0.damageData[slot9].num = math.floor(slot0.attrs2[slot10] or 0)
		else
			slot0.damageData[slot9].num = 0
		end
	end

	slot0:onResetHeldItemIcon()
	idlereasy.when(slot0.btnType, function (slot0, slot1)
		if slot1 == 1 then
			uv2 = "btnAttr"
			slot2 = slot2.btnAttr
			slot2 = slot2.setEnabled

			slot2(slot2, false)

			uv2 = "btnAttr"
			slot2 = slot2.btnAttr:get("textNote")
			slot2 = slot2.setTextColor

			slot2(slot2, ui.COLORS.NORMAL.WHITE)

			uv2 = "btnAttr"
			slot2 = slot2.btnSkill
			slot2 = slot2.setEnabled

			slot2(slot2, true)

			uv2 = "btnAttr"
			slot2 = slot2.btnSkill:get("textNote")
			slot2 = slot2.setTextColor

			slot2(slot2, ui.COLORS.NORMAL.RED)

			uv2 = "btnAttr"
			slot2 = slot2.attrPanel
			slot2 = slot2.show

			slot2(slot2)

			uv2 = "btnAttr"

			slot2.skillList:hide()
		else
			uv2 = "btnAttr"
			slot2 = slot2.btnAttr
			slot2 = slot2.setEnabled

			slot2(slot2, true)

			uv2 = "btnAttr"
			slot2 = slot2.btnAttr:get("textNote")
			slot2 = slot2.setTextColor

			slot2(slot2, ui.COLORS.NORMAL.RED)

			uv2 = "btnAttr"
			slot2 = slot2.btnSkill
			slot2 = slot2.setEnabled

			slot2(slot2, false)

			uv2 = "btnAttr"
			slot2 = slot2.btnSkill:get("textNote")
			slot2 = slot2.setTextColor

			slot2(slot2, ui.COLORS.NORMAL.WHITE)

			uv2 = "btnAttr"
			slot2 = slot2.attrPanel
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "btnAttr"

			slot2.skillList:show()
		end
	end)
end

function slot0.onTabChange(slot0, slot1)
	slot2 = slot1:name()

	if slot1 == slot0.btnSkill then
		slot0.btnType:set(2)
	else
		slot0.btnType:set(1)
	end
end

function slot0.initTools(slot0, slot1)
	if slot1 == 1 then
		slot0.tools = require("app.views.city.activity.yy_bet.tools")
	else
		slot0.tools = require("app.views.city.activity.contest_bet.tools")
	end
end

function slot0.initModel(slot0, slot1, slot2, slot3)
	slot0.btnType = idler.new(1)
	slot4 = slot0.tools.getCsv("cards")[slot1]
	slot0.cardData = slot4

	slot0.cardName:text(slot4.desc)
	slot0.teamName:text(slot0.tools.getCsv("teams")[slot2].name)
	adapt.oneLinePos(slot0.teamNote, slot0.teamName, cc.p(10, 0))
	bind.extend(slot0, slot0.headPanel, {
		class = "card_icon",
		props = {
			cardId = slot4.cardID,
			advance = slot4.advance,
			levelProps = {
				data = slot4.level
			},
			star = slot4.star,
			rarity = slot4.rarity
		}
	})

	slot0.attrs = slot3.attrs or {}
	slot0.attrs2 = slot3.attrs2 or {}
	slot0.zawakeSkills = slot3.passive_skills
	slot5 = {}
	slot6 = {
		61101,
		61102,
		61151,
		61152
	}

	for slot10, slot11 in pairs(slot3.skills) do
		slot13 = false

		if csv.skill[slot10].zawakeEffect and slot12.zawakeEffect[1] and slot3.passive_skills[slot12.zawakeEffect[1]] then
			slot13 = true
		end

		if not itertools.include(slot6, slot10) then
			table.insert(slot5, {
				id = slot10,
				level = slot11,
				zawake = slot13
			})
		end

		table.sort(slot5, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end

	slot0.skillDatas = slot5
end

function slot0.onHeldItemClick(slot0)
	slot1 = slot0.tools.getCsv("cards")[slot0.cardCsvId].helditem

	gGameUI:showItemDetail(slot0.heldItem, {
		num = 1,
		key = slot1.id,
		level = slot1.level,
		advance = slot1.advance
	})
end

function slot0.onSkillDetail(slot0, slot1, slot2, slot3)
	if dataEasy.isSkillChange() then
		gGameUI:stackUI("common.skill_detail", nil, , {
			skillId = slot3.id,
			skillLevel = slot3.level,
			cardId = slot0.cardData.cardID,
			star = slot0.cardData.star,
			isZawake = slot3.zawake
		})

		return
	end

	slot5 = gGameUI:stackUI("common.skill_detail", nil, {
		clickClose = true,
		dispatchNodes = slot1
	}, {
		skillId = slot3.id,
		skillLevel = slot3.level,
		cardId = slot0.cardData.cardID,
		star = slot0.cardData.star,
		isZawake = slot3.zawake
	}):getResourceNode()
	slot6, slot7 = slot5:xy()

	slot5:xy(slot0.isBetView and slot6 + 1100 or slot6 + 450, slot7)
end

function slot0.onResetHeldItemIcon(slot0)
	slot1 = "common/box/box_carry.png"
	slot2 = "city/card/helditem/icon_jiahao.png"
	slot3 = 1
	slot4 = false
	slot4 = true
	slot6 = csv.held_item.items[slot0.tools.getCsv("cards")[slot0.cardCsvId].helditem.id]
	slot2 = slot6.icon
	slot1 = string.format("city/card/helditem/panel_icon_%d.png", slot6.quality)

	if csvSize(slot6.exclusiveCards) > 0 then
		ccui.ImageView:create("common/icon/txt_zs.png"):xy(75, 130):addTo(slot0.heldItem, 6, "exclusive")
	end

	slot8 = cc.Label:createWithTTF(gLanguageCsv.textLv, ui.FONT_PATH, 30):xy(80, 100):addTo(slot0.heldItem, 8, "textLv")
	slot9 = cc.Label:createWithTTF(slot5.helditem.level, ui.FONT_PATH, 38):xy(65, 0):addTo(slot0.heldItem, 8, "textLvNum")
	slot3 = 1.7

	adapt.oneLineCenterPos(cc.p(75, 0), {
		slot8,
		slot9
	}, cc.p(5, 0))
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

function slot0.onEnterProperty(slot0)
	gGameUI:stackUI("city.card.detailed_attribute", nil, )
end

return slot0
