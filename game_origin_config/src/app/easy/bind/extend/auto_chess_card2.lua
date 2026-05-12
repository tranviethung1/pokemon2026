slot0 = require("easy.bind.helper")
slot2 = class("autoChessCard2", require("app.easy.bind.extend.auto_chess_card1"))
slot3 = {
	RESOURCE_FILENAME = "auto_chess_common_card2.json",
	RESOURCE_BINDING = {
		panelHp = "panelHp",
		skillList = "skillList",
		["panelStar.bg"] = "starBg",
		["panelIcon.icon"] = "icon",
		["panelDmg.bg"] = "dmgBg",
		cardBg = "cardBg",
		panelIcon = "panelIcon",
		panelEvent = "panelEvent",
		panelDef = "panelDef",
		cardFrame = "cardFrame",
		attrList = "attrList",
		["panelDef.bg"] = "defBg",
		panelStar = "panelStar",
		["panelHp.bg"] = "hpBg",
		panelDmg = "panelDmg",
		["panelDmg.txt"] = {
			varname = "dmgText",
			binds = {
				event = "effect",
				data = {
					outline = {
						size = 6,
						color = cc.c3b(35, 33, 33)
					}
				}
			}
		},
		["panelHp.txt"] = {
			varname = "hpText",
			binds = {
				event = "effect",
				data = {
					outline = {
						size = 6,
						color = cc.c3b(35, 33, 33)
					}
				}
			}
		},
		["panelDef.txt"] = {
			varname = "defText",
			binds = {
				event = "effect",
				data = {
					color = cc.c3b(251, 248, 233),
					outline = {
						size = 6,
						color = cc.c3b(35, 33, 33)
					}
				}
			}
		},
		["panelEvent.name"] = {
			varname = "eventName",
			binds = {
				event = "effect",
				data = {
					outline = {
						size = 6,
						color = cc.c3b(35, 33, 33)
					}
				}
			}
		},
		cardName = {
			varname = "cardName",
			binds = {
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = cc.c3b(35, 33, 33)
					}
				}
			}
		},
		attrIcon = {
			varname = "attrIcon",
			binds = {
				event = "visible",
				data = false
			}
		},
		buffPanel = {
			varname = "buffPanel",
			binds = {
				event = "visible",
				data = false
			}
		},
		["buffPanel.item"] = {
			binds = {
				event = "visible",
				data = false
			}
		},
		skillKeyWordsItem = {
			varname = "skillKeyWordsItem",
			binds = {
				event = "visible",
				data = false
			}
		},
		skillKeyWordsList = {
			varname = "skillKeyWordsList",
			binds = {
				event = "visible",
				data = false
			}
		}
	}
}
slot2.defaultProps = {
	grayState = 0,
	star = 1,
	showKeyWords = false
}

function slot2.initExtend(slot0)
	if not tolua.isnull(slot0.node) then
		slot0.attrListOriginX = nil
		slot0.attrListOriginWidth = nil
		slot0.skillKeyWordsListOriginX = nil
	end

	uv1 = "tolua"
	uv3 = "isnull"

	slot1.initExtend(slot0, slot3)

	return slot0
end

function slot2.buildExtend(slot0)
	slot0.attrListOriginX = slot0.attrListOriginX or slot0.node.attrList:x()
	slot0.attrListOriginWidth = slot0.attrListOriginWidth or slot0.node.attrList:width()
	slot1 = slot0.skillKeyWordsListOriginX or slot0.node.skillKeyWordsList:x()
	slot0.skillKeyWordsListOriginX = slot1
	uv1 = "attrListOriginX"

	slot1.buildExtend(slot0)

	if slot0._type == "event" then
		slot0.node.icon:scale(1.2)
	end

	return slot0
end

function slot2._initGray(slot0)
	uv1 = "_initGray"

	slot1._initGray(slot0)

	for slot4, slot5 in pairs({
		slot0.node.skillList,
		slot0.node.skillKeyWordsList
	}) do
		for slot9, slot10 in pairs(slot5:getChildren()) do
			slot10:setCascadeColorEnabled(true)

			for slot14, slot15 in pairs(slot10:getChildren()) do
				slot15:setCascadeColorEnabled(true)
			end
		end
	end
end

function slot2._setData(slot0)
	if not slot0.cfg then
		return
	end

	uv1 = "cfg"

	slot1._setData(slot0)
	slot0.node.cardFrame:texture(string.format("lushi/icon_zzqkp1_%s.png", slot0.RARITY[slot0.cfg.rarity]))
	adapt.setTextScaleWithWidth(slot0.node.cardName, slot0.cfg.name, 280)
	beauty.textScroll({
		fontSize = 44,
		align = "center",
		isRich = true,
		list = slot0.node.skillList,
		strs = uiEasy.autoChessDesc(slot0.cfg.cardEffect, slot0.cfg.keyWords, {
			env = slot0:getEnv()
		})
	})
	bind.extend(slot0.node, slot0.node.attrList, {
		class = "listview",
		props = {
			data = {
				slot0.cfg.nature1,
				slot0.cfg.nature2
			},
			item = slot0.node.attrIcon,
			onItem = function (slot0, slot1, slot2, slot3)
				slot6 = ui.ATTR_ICON[slot3]

				slot1:texture(slot6)

				uv6 = "texture"

				slot1:scale(slot6.node.attrIcon:width() / slot1:width())
			end,
			onAfterBuild = function (slot0)
				slot2 = slot0

				slot0.refreshView(slot2)

				uv2 = "refreshView"
				slot1 = itertools.size(slot2)
				uv2 = "itertools"
				slot2 = slot2.node.attrIcon:width() * slot1 + slot0:getItemsMargin() * (slot1 - 1)
				slot5 = slot2
				uv5 = "itertools"
				uv6 = "itertools"

				slot0:width(slot5):x(slot5.attrListOriginX + slot6.attrListOriginWidth - slot2)
			end
		}
	})
	slot0:setKeyWords()
end

function slot2.setKeyWords(slot0, slot1)
	if not slot0.showKeyWords then
		return
	end

	slot2 = {}

	for slot6, slot7 in orderCsvPairs(slot1 or slot0.cfg.keyWords) do
		if not gAutoChessKeyWordsCsv[slot7] then
			printError("csv.auto_chess.key_words key[%s] 不存在", slot7)
		else
			table.insert(slot2, gAutoChessKeyWordsCsv[slot7])
		end
	end

	slot0.node.skillKeyWordsList:show()
	bind.extend(slot0.node, slot0.node.skillKeyWordsList, {
		class = "listview",
		props = {
			data = slot2,
			item = slot0.node.skillKeyWordsItem,
			onItem = function (slot0, slot1, slot2, slot3)
				slot1:get("title"):text(slot3.title)
				text.addEffect(slot1:get("title"), {
					color = cc.c4b(unpack(slot3.fontColor, 1, 4))
				})

				slot4 = slot1:get("list"):height(0)
				slot8 = "#C0x5B545B#" .. slot3.desc
				slot6, slot7 = beauty.textScroll({
					fontSize = 36,
					isRich = true,
					list = slot4,
					strs = slot8
				})
				uv8 = "get"
				slot8 = slot7 - slot8.node.skillKeyWordsItem:get("list"):height()

				slot4:height(slot7):y(slot4:y() - slot8)
				slot1:get("bg"):height(slot1:get("bg"):height() + slot8 / slot1:get("bg"):scale())
				setContentSizeOfAnchor(slot1, cc.size(slot1:width(), slot1:height() + slot8))
			end,
			onAfterBuild = function (slot0)
				slot0:adaptTouchEnabled()
			end
		}
	})
end

function slot2.setBuffs(slot0, slot1)
	if itertools.isempty(slot1) then
		slot0.node.buffPanel:hide()
		slot0.node.skillKeyWordsList:x(slot0.skillKeyWordsListOriginX)

		return
	end

	slot2 = slot0.node.buffPanel

	slot2:show()
	slot0.node.skillKeyWordsList:x(slot0.skillKeyWordsListOriginX + slot2:width())
	bind.extend(slot0.node, slot2:get("list"), {
		class = "listview",
		props = {
			data = slot1,
			item = slot2:get("item"),
			onItem = function (slot0, slot1, slot2, slot3)
				slot4 = "#L10##C0x5F9A70#"

				if slot3.isEquip then
					slot4 = "#L10##C0x5B545B#"
				end

				beauty.textScroll({
					fontSize = 38,
					isRich = true,
					list = slot1:get("title"),
					strs = slot4 .. slot3.title
				})

				slot5 = slot1:get("list"):height(0)
				slot9 = "#C0x5B545B#" .. slot3.desc
				slot7, slot8 = beauty.textScroll({
					fontSize = 36,
					isRich = true,
					list = slot5,
					strs = slot9
				})
				uv9 = "#L10##C0x5F9A70#"
				slot9 = slot8 - slot9:get("item"):get("list"):height()

				slot5:height(slot8):y(slot5:y() - slot9)

				slot10 = slot1:get("line")
				slot10 = slot10.y

				slot10(slot10, slot1:get("line"):y() - slot9)

				uv10 = "isEquip"

				if slot2 == #slot10 then
					slot1:get("line"):hide()

					slot9 = slot9 - 30
				end

				setContentSizeOfAnchor(slot1, cc.size(slot1:width(), slot1:height() + slot9))
			end,
			onAfterBuild = function (slot0)
				slot0:adaptTouchEnabled()

				uv4 = "adaptTouchEnabled"
				slot2 = math.min(slot0:refreshView():getInnerItemSize().height + 60, slot4:height())
				uv2 = "adaptTouchEnabled"

				slot2:get("bg"):height(slot2)
			end
		}
	})
end

function slot2.setBattleDesc(slot0, slot1)
	beauty.textScroll({
		fontSize = 44,
		align = "center",
		isRich = true,
		list = slot0.node.skillList,
		strs = slot1
	})
end

return slot2
