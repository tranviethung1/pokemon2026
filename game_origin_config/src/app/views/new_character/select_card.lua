slot0 = class("SelectCardView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "character_select_card.json"
slot0.RESOURCE_BINDING = {
	["rightPanel.leftUpPanel.stancePanel2"] = "stancePanel2",
	["leftPanel.imgIcon"] = "imgIcon",
	["rightPanel.leftUpPanel.stancePanel1"] = "stancePanel1",
	["rightPanel.leftUpPanel.stancePanel3"] = "stancePanel3",
	itemCard = "cardItem",
	["leftPanel.attr2"] = "attr2",
	itemSkill = "skillItem",
	["leftPanel.textName"] = {
		binds = {
			event = "text",
			data = bindHelper.self("card"),
			method = function (slot0)
				return slot0.name
			end
		}
	},
	["leftPanel.rarity"] = {
		binds = {
			event = "texture",
			data = bindHelper.self("card"),
			method = function (slot0)
				return ui.RARITY_ICON[csv.unit[slot0.unitID].rarity]
			end
		}
	},
	["leftPanel.attr1"] = {
		binds = {
			event = "texture",
			data = bindHelper.self("card"),
			method = function (slot0)
				return ui.ATTR_ICON[csv.unit[slot0.unitID].natureType]
			end
		}
	},
	["leftPanel.attrPanel.hp.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("hpNum")
		}
	},
	["leftPanel.attrPanel.attack.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("damageNum")
		}
	},
	["leftPanel.attrPanel.special.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("specialDamageNum")
		}
	},
	["leftPanel.attrPanel.phyFang.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("defenceNum")
		}
	},
	["leftPanel.attrPanel.speFang.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("specialDefenceNum")
		}
	},
	["leftPanel.attrPanel.speed.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("speedNum")
		}
	},
	["leftPanel.attrPanel.hp.progressBar"] = {
		binds = {
			event = "percent",
			idler = bindHelper.self("hpPercent")
		}
	},
	["leftPanel.attrPanel.attack.progressBar"] = {
		binds = {
			event = "percent",
			idler = bindHelper.self("damagePercent")
		}
	},
	["leftPanel.attrPanel.special.progressBar"] = {
		binds = {
			event = "percent",
			idler = bindHelper.self("specialDamagePercent")
		}
	},
	["leftPanel.attrPanel.phyFang.progressBar"] = {
		binds = {
			event = "percent",
			idler = bindHelper.self("defencePercent")
		}
	},
	["leftPanel.attrPanel.speFang.progressBar"] = {
		binds = {
			event = "percent",
			idler = bindHelper.self("specialDefencePercent")
		}
	},
	["leftPanel.attrPanel.speed.progressBar"] = {
		binds = {
			event = "percent",
			idler = bindHelper.self("speedPercent")
		}
	},
	["leftPanel.attrPanel.textSum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("allVal")
		}
	},
	["rightPanel.downPanel.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("cardData"),
				item = bindHelper.self("cardItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot5 = csv.unit[slot3.unitID]

					slot1:multiget("next", "rarity", "name", "attr1", "attr2", "iconPanel").next:visible(slot2 ~= 1)
					slot4.rarity:texture(ui.RARITY_ICON[slot5.rarity])
					slot4.attr1:texture(ui.ATTR_ICON[slot5.natureType])

					if slot5.natureType2 then
						slot4.attr2:texture(ui.ATTR_ICON[slot5.natureType2])
					else
						slot4.attr2:hide()
					end

					slot4.name:text(slot3.name)

					slot6 = slot4.iconPanel:size()
					slot7 = widget.addAnimation(slot4.iconPanel, slot5.unitRes, "standby_loop")

					slot7:xy(slot6.width / 2, slot6.height / 3):scale(2)
					slot7:setSkin(slot5.skin)
					adapt.oneLinePos(slot4.name, slot4.rarity, cc.p(25, 0), "right")
					adapt.oneLinePos(slot4.name, {
						slot4.attr1,
						slot4.attr2
					}, {
						cc.p(25, 0),
						cc.p(5, 0)
					}, "left")
				end
			}
		}
	},
	["rightPanel.rightUp.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("skillData"),
				item = bindHelper.self("skillItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("icon", "iconTxt", "txt", "btn")

					uiEasy.setSkillInfoToItems({
						name = slot4.txt,
						icon = slot4.icon,
						type1 = slot4.iconTxt
					}, slot3.skillId)
					slot4.btn:onClick(functools.partial(slot0.clickCell, slot2, slot3))
				end
			},
			handlers = {
				clickCell = bindHelper.self("onClickSkill")
			}
		}
	},
	["rightPanel.leftUpPanel.txt"] = {
		binds = {
			event = "text",
			data = bindHelper.self("card"),
			method = function (slot0)
				return slot0.location
			end
		}
	},
	["leftPanel.btnChange"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["rightPanel.btnSure"] = {
		binds = {
			event = "touch",
			clicksafe = true,
			methods = {
				ended = bindHelper.self("onSure")
			}
		}
	}
}
slot0.RESOURCE_STYLES = {
	full = true
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.index = slot1
	slot0.cb = slot2
	slot0.id = csv.newbie_init[1].cards[slot1].id
	slot6 = {
		[({
			"hp",
			"speed",
			"damage",
			"defence",
			"specialDamage",
			"specialDefence"
		})[slot10]] = csv.cards[slot0.id].specValue[slot10]
	}

	for slot10 = 1, 6 do
	end

	slot0.skillData = {}

	for slot11, slot12 in ipairs(dataEasy.getSortCardSkillList(slot0.id)) do
		table.insert(slot0.skillData, {
			skillLevel = 1,
			skillId = slot12
		})
	end

	slot0.card = slot4
	slot8 = csv.unit[slot4.unitID]

	for slot12, slot13 in pairs(slot6) do
		slot0[slot12 .. "Num"] = idler.new(slot13)
		slot0[slot12 .. "Percent"] = idler.new(slot13 / 255 * 100)
	end

	if slot8.natureType2 then
		slot0.attr2:texture(ui.ATTR_ICON[slot8.natureType2])
	else
		slot0.attr2:hide()
	end

	for slot13, slot14 in ipairs(slot4.specValue) do
		if slot13 > 6 then
			slot0.allVal = idler.new(slot14)

			break
		end
	end

	slot0.imgIcon:texture(slot8.cardShow):visible(true)

	slot0.cardData = {}

	for slot13, slot14 in orderCsvPairs(csv.cards) do
		if slot14.cardMarkID == slot4.cardMarkID and slot14.develop < 4 then
			slot0.cardData[slot14.develop] = slot14
		end
	end

	slot0.stancePanel1:visible(slot1 == 1)
	slot0.stancePanel2:visible(slot1 == 2)
	slot0.stancePanel3:visible(slot1 == 3)
end

function slot0.onSure(slot0)
	gGameApp:requestServer("/game/role/newbie/card/choose", function ()
		uv5 = "gGameUI"
		uv6 = "gGameUI"

		gGameUI:stackUI("new_character.gain_sprite", nil, , slot5.id, slot6.cb)
	end, 2, slot0.id)
	sdk.trackEvent(({
		"starter_grass",
		"starter_fire",
		"starter_water"
	})[slot0.index])
end

function slot0.onClickSkill(slot0, slot1, slot2, slot3)
	if dataEasy.isSkillChange() then
		gGameUI:stackUI("common.skill_detail", nil, , {
			skillId = slot3.skillId,
			skillLevel = slot3.skillLevel,
			cardId = slot0.id
		})

		return
	end

	slot5 = gGameUI:stackUI("common.skill_detail", nil, {
		clickClose = true,
		dispatchNodes = slot1
	}, {
		skillId = slot3.skillId,
		skillLevel = slot3.skillLevel,
		cardId = slot0.id
	}):getResourceNode()
	slot6, slot7 = slot5:xy()

	slot5:xy(slot6 + 1140, slot7 + 200)
end

return slot0
