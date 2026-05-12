function slot0(slot0)
	if slot0 == game.ATTRDEF_ENUM_TABLE.damage then
		return gLanguageCsv.attrDoubleAttack
	end

	if slot0 == game.ATTRDEF_ENUM_TABLE.defence then
		return gLanguageCsv.attrDoubleDefence
	end

	if slot0 == game.ATTRDEF_ENUM_TABLE.defenceIgnore then
		return gLanguageCsv.attrDoubleDefenceIgnore
	end

	if itertools.include({
		game.ATTRDEF_ENUM_TABLE.specialDamage,
		game.ATTRDEF_ENUM_TABLE.specialDefence,
		game.ATTRDEF_ENUM_TABLE.specialDefenceIgnore
	}, slot0) then
		return
	end

	return getLanguageAttr(slot0)
end

function slot1(slot0, slot1, slot2)
	bind.extend(slot0, slot1, {
		class = "card_icon",
		props = {
			unitId = slot2.unitId,
			advance = slot2.advance,
			rarity = slot2.rarity,
			star = slot2.star,
			levelProps = {
				data = slot2.level
			},
			params = {
				starScale = 0.9520000000000001,
				starInterval = 14.560000000000002
			},
			onNode = function (slot0)
				slot0:get("star"):y(-40)
			end
		}
	})
end

function slot2(slot0, slot1, slot2)
	bind.extend(slot0, slot1, {
		class = "icon_key",
		props = {
			data = {
				key = slot2.key,
				num = slot2.num
			},
			onNode = function (slot0)
				slot0:setTouchEnabled(false):scale(0.9)
			end
		}
	})
end

function slot3(slot0, slot1)
	slot0:removeAllChildren()

	slot2 = 15
	slot3 = slot1 > 6 and 6 or slot1

	for slot7 = 1, slot3 do
		slot9 = "common/icon/icon_star_d.png"

		if slot7 <= slot1 then
			slot9 = slot7 <= slot1 - 6 and "common/icon/icon_star_z.png" or "common/icon/icon_star.png"
		end

		ccui.ImageView:create(slot9):xy(99 - slot2 * (slot3 + 1 - 2 * slot7), -20):addTo(slot0, 4, "star"):scale(0.35)
	end
end

function slot4()
	for slot5, slot6 in pairs(gGameModel.role:read("battle_cards")) do
		table.insert({}, slot6)
	end

	for slot7, slot8 in pairs(gGameModel.role:read("card_deployment").arena.defence_cards or {}) do
		table.insert(slot0, slot8)
	end

	return slot0
end

function slot5(slot0, slot1, slot2)
	for slot7 = 1, slot2 or 1 do
		if csv.base_attribute.skill_level[slot0 + slot7 - 1] then
			slot3 = 0 + csv.base_attribute.skill_level[slot0 + slot7 - 1]["itemNum" .. slot1]
		end
	end

	return slot3
end

slot6 = require("app.views.city.card.rebirth.tools")
slot7 = class("CardStarView", cc.load("mvc").ViewBase)
slot7.RESOURCE_FILENAME = "card_star.json"
slot7.RESOURCE_BINDING = {
	["selectPanel.bg.bgIcon"] = "bgIcon",
	["panel.costInfo.textCostNote"] = "costTxt",
	["extremePanel.item"] = "extremeItem",
	["panel.costInfo.imgIcon"] = "costIcon",
	cardItem = "cardItem",
	item = "item",
	["selectPanel.textNum"] = "textNum",
	effectItem = "effectItem",
	["selectPanel.empty.text"] = "txtEmpty",
	panel = "panel",
	["panel.costInfo"] = "costInfo",
	["panel.costInfo.textCostNum"] = "needGoldTxt",
	["selectPanel.subList"] = "subList",
	["extremePanel.subList"] = "extremeSubList",
	["selectPanel.progressBar2"] = {
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				maskImg = "common/icon/mask_bar_red.png",
				data = bindHelper.self("chipBarPercent")
			}
		}
	},
	["selectPanel.textHasNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("chipNum")
		}
	},
	["selectPanel.textNeedNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("chipNeed")
		}
	},
	["selectPanel.btnFrags"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeClick")
			}
		}
	},
	["selectPanel.btnFrags.textNote"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["selectPanel.btnAdd"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onGainWayClick")
			}
		}
	},
	selectPanel = {
		varname = "selectPanel",
		binds = {
			{
				event = "visible",
				idler = bindHelper.self("selectPanelState")
			},
			{
				event = "click",
				method = bindHelper.self("onSelectPanelClick")
			}
		}
	},
	["selectPanel.btnCombine"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onCombClick")
			}
		}
	},
	["selectPanel.btnCombine.textNote"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["selectPanel.btnSure"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSureClick")
			}
		}
	},
	["selectPanel.btnSure.textNote"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["selectPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				asyncPreload = 8,
				data = bindHelper.self("cardInfos"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("cardItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:name("item" .. slot0:getIdx(slot2).k)
					bind.extend(slot0, slot1:get("iconPanel"), {
						class = "card_icon",
						props = {
							unitId = slot3.unitId,
							advance = slot3.advance,
							rarity = slot3.rarity,
							star = slot3.star,
							dbid = slot3.dbid,
							levelProps = {
								data = slot3.level
							},
							params = {
								starScale = 0.88,
								starInterval = 14
							}
						}
					})
					uiEasy.setIconName("card", slot3.id, {
						space = true,
						node = slot1:get("textName"),
						name = slot3.name,
						advance = slot3.advance
					})
					slot1:get("textFight"):text(slot3.fight)
					slot1:get("iconLock"):visible(slot3.locked)
					slot1:get("textPanel"):visible(slot3.battleType ~= nil)

					if slot3.battleType and ui.CARD_USING_TXTS[slot3.battleType] then
						slot5 = slot1:get("textPanel"):get("text")

						slot5:text(gLanguageCsv[ui.CARD_USING_TXTS[slot3.battleType]])
						slot1:get("textPanel"):get("bg"):size(slot5:size().width + 50, 60)
					end

					adapt.oneLinePos(slot1:get("textFightNote"), slot1:get("textFight"))
					slot1:get("mask"):visible(slot3.status ~= 0)
					slot1:get("iconSelect"):visible(slot3.selectState == true)
					slot1:setTouchEnabled(slot3.status == 0)

					if slot3.canSelect == true and slot3.selectState == false then
						slot1:setTouchEnabled(false)
						slot1:get("mask"):show()
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot0:getIdx(slot2), slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onCardItemClick")
			}
		}
	},
	extremePanel = {
		varname = "extremePanel",
		binds = {
			{
				event = "visible",
				idler = bindHelper.self("extremePanelState")
			},
			{
				event = "click",
				method = bindHelper.self("closeExtreme")
			}
		}
	},
	["extremePanel.imgBg.textExtremePoint"] = {
		varname = "textExtremePoint",
		binds = {
			event = "text",
			idler = bindHelper.self("extremePoint")
		}
	},
	["extremePanel.imgBg"] = {
		varname = "btnAddExtrePoint",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAddExtrePointClick")
			}
		}
	},
	["extremePanel.btnReset"] = {
		varname = "btnResetEp",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onResetEp")
			}
		}
	},
	["extremePanel.textResetEpCost"] = {
		varname = "textResetEpCost",
		binds = {
			event = "text",
			idler = bindHelper.self("resetEpCost")
		}
	},
	["extremePanel.imgBg.imgIcon"] = {
		binds = {
			event = "texture",
			idler = bindHelper.self("starSkillIcon")
		}
	},
	["extremePanel.list"] = {
		varname = "extremeList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				margin = 0,
				columnSize = 2,
				asyncPreload = 6,
				data = bindHelper.self("starSkills"),
				item = bindHelper.self("extremeSubList"),
				cell = bindHelper.self("extremeItem"),
				cardId = bindHelper.self("cardId"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("textLv"):text(slot3.skillLevel)
					adapt.oneLinePos(slot1:get("textLv1"), slot1:get("textLv"), cc.p(3, -5), "left")
					slot1:removeChildByName("richText")

					slot6 = string.format("#C0x5b545b#%s", eval.doMixedFormula(dataEasy.getSkillDesc(csv.skill[slot3.skillId]), {
						skillLevel = slot3.skillLevel or 1,
						math = math
					}, nil) or "no desc")
					slot7 = math.max(slot3.skillLevel, 1)
					slot8 = nil

					for slot12, slot13 in orderCsvPairs(csv.card_star_skill_attr) do
						if slot13.skillID == slot3.skillId and slot13.level == slot7 then
							slot8 = slot13

							break
						end
					end

					slot13 = slot3.skillId

					assert(slot8, string.format("csv.card_star_skill_attr not exist skillID(%s), level(%s)", slot13, slot7))

					slot9 = {}

					for slot13 = 1, math.huge do
						if not slot8["attrType" .. slot13] or slot14 == 0 then
							break
						end

						uv15 = "get"

						if slot15(slot14) then
							if slot3.skillLevel == 0 then
								slot15 = string.find(slot8["attrNum" .. slot13], "%%") and "0%" or 0
							end

							uv20 = "get"

							table.insert(slot9, string.format("#C0x5B545B#%s#C0x5C9970#+%s", slot20(slot14), dataEasy.getAttrValueString(slot14, slot15)))
						end
					end

					slot12 = rich.createWithWidth(table.concat(slot9, "\n"), matchLanguage({
						"kr",
						"en"
					}) and 30 or 42, cc.size(400, 130), 400, 20):anchorPoint(0, 1):xy(60, 220):addTo(slot1):z(2):name("richText")

					slot1:get("imgIcon"):texture(slot3.icon)

					slot14 = slot3.skillId
					uv14 = "textLv"

					slot1:get("textNum3"):text(slot14(slot3.skillLevel, csv.skill[slot14].costID))

					if csv.cards[slot3.cardId].starSkillMaxLevel < slot3.skillLevel + 1 then
						uiEasy.setBtnShader(slot1:get("btnAdd"), nil, 3)
					end

					if slot0.isAiding() then
						uiEasy.setBtnShader(slot1:get("btnAdd"), nil, 2)
					end

					bind.touch(slot0, slot1:get("btnAdd"), {
						methods = {
							ended = functools.partial(slot0.clickAdd, slot2, slot3, slot14)
						}
					})
				end
			},
			handlers = {
				clickAdd = bindHelper.self("onEpUpClick"),
				isAiding = bindHelper.self("isAiding")
			}
		}
	},
	["panel.btnChange"] = {
		varname = "panelBtnChange",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeClick")
			}
		}
	},
	["panel.effectList"] = {
		varname = "effectList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("effectStartConfig"),
				item = bindHelper.self("effectItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("textNote", "iconStar")

					slot4.textNote:removeChildByName("richText1")

					slot5 = rich.createWithWidth(string.format("%s%s", slot3.color, "x" .. slot3.value .. ": "), 44, nil, 100, 5):anchorPoint(0, 0.5):addTo(slot4.textNote, 6):name("richText1")

					slot4.textNote:removeChildByName("richText2")

					slot6 = rich.createWithWidth(slot3.str, 44, nil, 678, 5):anchorPoint(0, 0.5):addTo(slot4.textNote, 6):name("richText2")
					slot8 = slot6:size().height - 46

					slot5:y(slot8 - (slot5:size().height - 46) - 0)
					slot6:y(slot8 / 2)
					slot6:x(slot6:x() + 100)
					slot1:size(879, slot8 + 74)
					slot4.iconStar:texture(string.format("common/icon/icon_star%s.png", slot3.star < slot3.value and "_d" or "")):y(slot1:size().height / 2 + slot8 / 2)
					slot4.textNote:text("")
				end
			}
		}
	},
	["panel.btnOk"] = {
		varname = "btnOk",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onStarClick")
			}
		}
	},
	["panel.btnOk.textNote"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["panel.btnExtreme"] = {
		varname = "btnExtreme",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onExtremeClick")
			}
		}
	},
	["panel.btnExtreme.textNote"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["panel.itemList"] = {
		varname = "itemList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 4,
				data = bindHelper.self("costItems"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:name("item" .. slot0:getIdx(slot2))

					slot4 = slot3.num < slot3.targetNum and 1 or 0

					if slot0.isAiding() then
						slot4 = 2
					end

					slot1:get("cardIcon"):visible(slot3.typ == "card")
					slot1:get("itemIcon"):visible(slot3.typ ~= "card")

					if slot3.typ == "card" then
						bind.extend(slot0, slot1:get("cardIcon"), {
							class = "card_icon",
							props = {
								cardId = slot3.id,
								rarity = slot3.rarity,
								grayState = slot4,
								onNode = function (slot0)
									uv3 = "uiEasy"
									uv4 = "uiEasy"

									uiEasy.setCardNum(slot0, slot3.num, slot4.targetNum, 1)
									slot0:setTouchEnabled(false)
								end
							}
						})
					else
						bind.extend(slot0, slot1, {
							class = "icon_key",
							props = {
								data = {
									key = slot3.id,
									num = slot3.num,
									targetNum = slot3.targetNum
								},
								grayState = slot4,
								onNode = function (slot0)
									slot0:setTouchEnabled(false)
								end
							}
						})
					end

					slot1:get("mask"):visible(slot3.num < slot3.targetNum)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onCostItemClick"),
				isAiding = bindHelper.self("isAiding")
			}
		}
	}
}

function slot7.onCreate(slot0, slot1)
	slot0.selectDbId = slot1()
	slot0.isAiding = dataEasy.getIsStarAidState(slot0.selectDbId:read())

	slot0:initModel()
	slot0.txtEmpty:anchorPoint(0.5, 0.5)
	slot0.txtEmpty:x(slot0.txtEmpty:x() + 250)

	slot0.costCardIDs = {}
	slot0.chipBarPercent = idler.new(0)
	slot0.chipNum = idler.new(0)
	slot0.chipNeed = idler.new(0)
	slot0.needCash = idler.new(0)
	slot0.effectStartConfig = idlers.new()
	slot0.selectPanelState = idler.new(false)
	slot0.extremePanelState = idler.new(false)
	slot0.cardInfos = idlers.new()
	slot0.costItems = idlers.new()
	slot0.selectIdx = idler.new()
	slot0.eps = idlers.new()
	slot0.extremePoint = idler.new(0)
	slot0.starSkillIcon = idler.new()
	slot0.resetEpCost = idler.new(gCommonConfigCsv.cardStarSkillResetCostRMB)
	slot0.starSkills = idlers.new()
	slot0.canResetEp = idler.new(false)
	slot2 = 0

	idlereasy.any({
		slot0.cardId,
		slot0.star,
		slot0.frags,
		slot0.cards,
		slot0.items,
		slot0.extremePoints
	}, function ()
		error("Decompilation failed")
		-- Exception in function building!
		-- Traceback (most recent call last):
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
		--     return _build_function_definition(prototype, state.header)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
		--     node.statements.contents = _build_function_blocks(state, instructions)
		--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
		--     statement, line_marked_elements = _build_statement(state, addr, instruction)
		--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
		--     return _build_var_assignment(state, addr, instruction)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
		--     assn = func(*args, **kwargs)
		--            ^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
		--     expression = _build_const_expression(state, addr, instruction)
		--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
		--     return _build_numeric_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
		--     number = state.constants.numeric_constants[index]
		--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end)
	idlereasy.when(slot0.canResetEp, function (slot0, slot1)
		uv3 = "uiEasy"

		uiEasy.setBtnShader(slot3.btnResetEp, nil, slot1 and 1 or 3)
	end)
	idlereasy.when(slot0.gold, function (slot0, slot1)
		uv3 = "csv"
		slot4 = csv.cards[slot3.cardId:read()].starTypeID
		uv4 = "csv"
		uv6 = "csv"

		text.addEffect(slot6.needGoldTxt, {
			color = gStarCsv[slot4][slot4.star:read()].gold <= slot1 and cc.c4b(91, 84, 91, 255) or cc.c4b(249, 87, 114, 255)
		})
	end)

	slot0.selectMax = idler.new(1)
	slot0.selectNum = 0

	idlereasy.any({
		slot0.selectIdx,
		slot0.selectMax
	}, function (slot0, slot1, slot2)
		uv3 = "textNum"
		slot3 = slot3.textNum
		slot3 = slot3.text

		slot3(slot3, "0/" .. slot2)

		uv3 = "textNum"

		if slot3.cardInfos:atproxy(slot1) then
			uv3 = "textNum"
			slot3 = slot3.cardInfos
			slot4 = slot3
			slot3 = slot3.atproxy(slot4, slot1)
			uv4 = "textNum"

			if slot2 <= slot4.selectNum and slot3.selectState == false then
				return
			end

			slot3.selectState = not slot3.selectState
			uv7 = "textNum"

			for slot9 = 1, slot7.cardInfos:size() do
				uv10 = "textNum"

				if slot10.cardInfos:atproxy(slot9).selectState == true then
					slot4 = 0 + 1

					table.insert({}, slot10.dbid)
				end
			end

			uv6 = "textNum"
			slot6.selectNum = slot4
			uv6 = "textNum"
			slot6 = slot6.textNum
			slot7 = slot6
			slot9 = "/"

			slot6.text(slot7, slot4 .. slot9 .. slot2)

			uv7 = "textNum"

			for slot9 = 1, slot7.cardInfos:size() do
				uv10 = "textNum"
				slot10.cardInfos:atproxy(slot9).canSelect = slot2 <= slot4
			end
		end
	end)
end

function slot7.refreshView(slot0)
	slot2 = slot0.skinId:read()
	slot3 = slot0.star:read()
	slot4 = slot0.frags:read()

	slot0.panelBtnChange:visible(csv.cards[slot0.cardId:read()].cardType == 1)
	slot0:setEffectPanel(slot3, gStarEffectCsv[slot5.starEffectIndex])
	slot0:setCostDatas(gStarCsv[slot5.starTypeID][slot3], slot1, slot5)

	if dataEasy.isUnlock(gUnlockCsv.extremityProperty) and table.length(gStarCsv[slot5.starTypeID]) <= slot3 and itertools.size(csv.card_star_skill[csv.cards[slot5.cardMarkID].starSkillSeqID].starSkillList) > 0 then
		slot0.panel:get("btnExtreme"):show()
		slot0.panel:get("iconMax"):hide()
	else
		slot0.panel:get("iconMax"):visible(slot6 <= slot3)
		slot0.panel:get("btnExtreme"):hide()
	end

	slot0:setFragsPanel(slot5, slot4)

	slot13 = {
		id = slot1,
		unitId = dataEasy.getUnitId(slot1, slot2),
		advance = slot0.advance:read(),
		rarity = csv.unit[slot5.unitID].rarity,
		star = slot3,
		level = slot14
	}
	uv14 = "cardId"

	slot0.level:read()(slot0, slot0.panel:get("iconPanel1"), slot13)

	slot14 = math.min(slot3 + 1, slot6)
	slot13.star = slot14
	uv14 = "cardId"

	slot14(slot0, slot0.panel:get("iconPanel2"), slot13)

	if slot7 then
		slot0.needCash:set(slot7.gold)
		slot0.needGoldTxt:text(slot7.gold)
		text.addEffect(slot0.needGoldTxt, {
			color = slot7.gold <= dataEasy.getNumByKey("gold") and cc.c4b(91, 84, 91, 255) or cc.c4b(249, 87, 114, 255)
		})

		slot15, slot16 = slot0.btnOk:xy()

		slot0.costInfo:xy(slot15, slot16 + slot0.btnOk:height() / 2 + 30)
		adapt.oneLineCenterPos(cc.p(slot0.costInfo:width() / 2, slot0.costInfo:height() / 2), {
			slot0.costTxt,
			slot0.needGoldTxt,
			slot0.costIcon
		}, cc.p(10, 0))
	end

	slot0:setCardDatas(slot7)

	if slot0.extremePanelState:read() == true then
		slot0:onExtremeClick()
	end

	slot0.costInfo:visible(not slot0.isAiding and slot3 < slot6 and slot7 and slot7.gold and slot7.gold > 0)
	slot0.btnOk:visible(not slot14 and slot3 < slot6)
	slot0.btnResetEp:visible(not slot14)
	slot0.extremePanel:get("textCost"):visible(not slot14)
	slot0.extremePanel:get("textResetEpCost"):visible(not slot14)
	slot0.extremePanel:get("imgCost"):visible(not slot14)

	if slot14 then
		if slot0.extremePanel:get("aidTip") then
			slot0.extremePanel:get("aidTip"):show()
		else
			slot15 = cc.Label:createWithTTF(gLanguageCsv.starNotExtremity, "font/youmi1.ttf", 40):addTo(slot0.extremePanel):anchorPoint(0.5, 0.5):name("aidTip"):xy(slot0.btnResetEp:x(), slot0.btnResetEp:y()):color(cc.c4b(247, 107, 69, 255))
		end

		if slot3 < slot6 then
			if slot0.panel:get("aidStarTip") then
				slot0.panel:get("aidStarTip"):show()
			else
				slot15 = cc.Label:createWithTTF(gLanguageCsv.starNotUp, "font/youmi1.ttf", 40):addTo(slot0.panel):anchorPoint(0.5, 0.5):name("aidStarTip"):xy(slot0.btnOk:x() - 240, slot0.btnOk:y() - 32):color(cc.c4b(247, 107, 69, 255))
			end
		elseif slot0.panel:get("aidStarTip") then
			slot0.panel:get("aidStarTip"):hide()
		end
	else
		if slot0.extremePanel:get("aidTip") then
			slot0.extremePanel:get("aidTip"):hide()
		end

		if slot0.panel:get("aidStarTip") then
			slot0.panel:get("aidStarTip"):hide()
		end
	end
end

function slot7.initModel(slot0)
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.items = gGameModel.role:getIdler("items")
	slot0.frags = gGameModel.role:getIdler("frags")
	slot0.cards = gGameModel.role:getIdler("cards")
	slot0.cardCapacity = gGameModel.role:getIdler("card_capacity")
	slot0.extremePoints = gGameModel.role:getIdler("star_skill_points")

	idlereasy.when(slot0.selectDbId, function (slot0, slot1)
		uv2 = "costCardIDs"
		slot2.costCardIDs = {}
		slot2 = gGameModel.cards
		slot3 = slot2
		slot2 = slot2.find(slot3, slot1)
		uv3 = "costCardIDs"
		slot6 = slot2
		uv6 = "costCardIDs"
		slot3.level = idlereasy.assign(slot2.getIdler(slot6, "level"), slot6.level)
		uv3 = "costCardIDs"
		slot6 = slot2
		uv6 = "costCardIDs"
		slot3.cardId = idlereasy.assign(slot2.getIdler(slot6, "card_id"), slot6.cardId)
		uv3 = "costCardIDs"
		slot6 = slot2
		uv6 = "costCardIDs"
		slot3.skinId = idlereasy.assign(slot2.getIdler(slot6, "skin_id"), slot6.skinId)
		uv3 = "costCardIDs"
		slot6 = slot2
		uv6 = "costCardIDs"
		slot3.fight = idlereasy.assign(slot2.getIdler(slot6, "fighting_point"), slot6.fight)
		uv3 = "costCardIDs"
		slot6 = slot2
		uv6 = "costCardIDs"
		slot3.advance = idlereasy.assign(slot2.getIdler(slot6, "advance"), slot6.advance)
		uv3 = "costCardIDs"
		slot6 = slot2
		uv6 = "costCardIDs"
		slot3.attrs = idlereasy.assign(slot2.getIdler(slot6, "attrs"), slot6.attrs)
		uv3 = "costCardIDs"
		slot6 = slot2
		uv6 = "costCardIDs"
		slot3.skills = idlereasy.assign(slot2.getIdler(slot6, "skills"), slot6.skills)
		uv3 = "costCardIDs"
		slot6 = slot2
		uv6 = "costCardIDs"
		slot3.star = idlereasy.assign(slot2.getIdler(slot6, "star"), slot6.star)
		uv3 = "costCardIDs"
		slot3.isAiding = dataEasy.getIsStarAidState(slot1)
	end)
end

function slot7.setFragsPanel(slot0, slot1, slot2)
	slot4 = csv.fragments[slot1.fragID].combCount
	slot6 = slot1.fragID
	slot5 = dataEasy.getNumByKey(slot6)
	uv6 = "csv"

	slot6(slot0, slot0.selectPanel:get("iconPanel"), {
		key = slot1.fragID,
		num = slot5
	})
	slot0.chipNum:set(slot5)
	slot0.chipNeed:set("/" .. slot4)
	slot0.chipBarPercent:set(cc.clampf(slot5 / slot4 * 100, 0, 100))
end

function slot7.setCostDatas(slot0, slot1, slot2, slot3)
	slot4 = {}
	slot5 = {}

	if slot1 then
		if slot1.costCardNum > 0 then
			slot7 = csv.unit[slot3.unitID].rarity

			if slot3.megaIndex > 0 then
				for slot13, slot14 in pairs(slot0.cards:read()) do
					slot15 = gGameModel.cards:find(slot14)

					if csv.cards[gGameModel.cards:find(slot14):read("card_id")].cardMarkID == csv.cards[slot0.cardId:read()].cardMarkID and csv.unit[slot17.unitID].rarity < slot7 then
						slot7 = csv.unit[slot17.unitID].rarity
					end
				end
			end

			table.insert(slot4, {
				typ = "card",
				num = 0,
				id = slot3.cardMarkID,
				rarity = slot7,
				targetNum = slot1.costCardNum
			})
		end

		for slot9, slot10 in csvPairs(slot1.costItems) do
			table.insert(slot4, {
				id = slot9,
				num = dataEasy.getNumByKey(slot9),
				targetNum = slot10
			})
		end
	end

	slot0.costItems:update(slot4)
end

function slot7.setCardDatas(slot0, slot1)
	slot0.selectNum = 0

	slot0.selectIdx:set(0)

	slot2 = slot0.cards:read()
	slot3 = csv.cards[slot0.cardId:read()].cardMarkID
	slot4 = dataEasy.inUsingCardsHash()
	slot5 = {}

	if slot1 and slot1.universalCards then
		slot5 = itertools.map(slot1.universalCards, function (slot0, slot1)
			return slot1, slot0
		end)
	end

	slot6 = {}

	for slot10, slot11 in pairs(slot2) do
		if gGameModel.cards:find(slot11) then
			slot13 = slot12:read("card_id", "unit_id", "skin_id", "name", "fighting_point", "locked", "level", "star", "advance")
			slot14 = csv.cards[slot13.card_id]
			slot15 = dataEasy.getUnitId(slot13.card_id, slot13.skin_id)
			slot16 = csv.unit[slot13.unit_id]
			slot17 = 0

			if slot13.locked then
				slot17 = 1
			elseif slot4[slot11] then
				slot17 = 3
			elseif slot0.star:read() < slot13.star then
				slot17 = 4
			end

			if slot14.cardMarkID == slot3 and slot0.selectDbId:read() ~= slot11 or slot5[slot13.card_id] then
				table.insert(slot6, {
					selectState = false,
					id = slot13.card_id,
					unitId = slot15,
					rarity = slot16.rarity,
					attr1 = slot16.natureType,
					attr2 = slot16.natureType2,
					level = slot13.level,
					star = slot13.star,
					name = slot13.name,
					locked = slot13.locked,
					advance = slot13.advance,
					fight = slot13.fighting_point,
					dbid = slot11,
					status = slot17,
					battleType = slot4[slot11],
					universal = slot5[slot13.card_id]
				})
			end
		end
	end

	slot0.selectPanel:get("empty"):visible(#slot6 == 0)
	slot0.bgIcon:visible(#slot6 ~= 0)
	table.sort(slot6, function (slot0, slot1)
		if slot0.universal and not slot1.universal then
			return true
		elseif not slot0.universal and slot1.universal then
			return false
		end

		return slot1.fight < slot0.fight
	end)
	slot0.cardInfos:update(slot6)
end

function slot7.setEffectPanel(slot0, slot1, slot2)
	slot3 = itertools.keys(slot2)

	table.sort(slot3)

	slot6 = {}

	for slot10, slot11 in ipairs(slot3) do
		slot12 = slot2[slot11]
		slot13 = ""
		slot14 = {}
		slot15 = slot1 < slot11 and "#C0xB7B09E#" or "#C0x5B545B#"
		slot16 = slot11 <= slot1 and "#C0x5B545B##F44#" or "#C0xB7B09E#"
		slot17 = slot11 <= slot1 and "#C0x60C456##F44#" or "#C0xB7B09E#"
		slot18 = true
		slot19 = nil

		for slot23, slot24 in csvPairs(slot12.attrNum) do
			slot26 = gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot23])]

			if slot11 >= 12 then
				if slot19 then
					if slot19 ~= "+" .. dataEasy.getAttrValueString(slot23, slot24) then
						slot18 = false
					end
				else
					slot19 = slot27
				end
			end

			table.insert(slot14, slot16 .. slot26 .. slot17 .. slot27)
		end

		slot6[slot10] = {
			str = (slot11 >= 12 and slot18 and csvSize(slot12.attrNum) == 6 and slot16 .. gLanguageCsv.cardStarSixD .. slot17 .. slot19 or table.concat(slot14, " ")) .. slot16 .. (slot12.effectDesc or ""),
			value = slot11,
			star = slot1,
			color = slot15
		}
	end

	slot0.effectStartConfig:update(slot6)
end

function slot7.onGainWayClick(slot0)
	slot1 = csv.cards[slot0.cardId:read()].fragID

	gGameUI:stackUI("common.gain_way", nil, , slot1, nil, csv.fragments[slot1].combCount)
end

function slot7.onCombClick(slot0)
	if slot0.cardCapacity:read() <= itertools.size(slot0.cards:read()) then
		gGameUI:showTip(gLanguageCsv.cardBagHaveBeenFull)

		return
	end

	if slot0.chipNum:read() < csv.fragments[csv.cards[csv.cards[slot0.cardId:read()].cardMarkID].fragID].combCount then
		gGameUI:showTip(gLanguageCsv.fragCombfragNotEnough)

		return
	end

	gGameUI:showDialog({
		btnType = 2,
		clearFast = true,
		isRich = true,
		content = {
			string.format("#C0x5b545b#" .. gLanguageCsv.wantConsumeFragsCombCard, slot2.combCount, "#C0x60C456#" .. slot2.name .. "#C0x5b545b#", "#C0x60C456#" .. slot1.name)
		},
		cb = function ()
			uv4 = "requestServer"

			gGameApp:requestServer("/game/role/frag/comb", function (slot0)
				uv9 = "gGameUI"

				gGameUI:stackUI("common.gain_sprite", nil, {
					full = true
				}, slot0.view, nil, false, slot9:createHandler("resetSelectNum"))
			end, slot4.fragID)
		end
	})
end

function slot7.resetSelectNum(slot0)
	slot0.selectNum = 0
end

function slot7.onCardItemClick(slot0, slot1, slot2, slot3)
	if slot3.selectState == false and (gGameModel.cards:find(slot3.dbid):read("getstar") < slot3.star or slot3.level > 1 or slot3.advance > 1 or slot0:getDevelopState(slot3.dbid)) then
		gGameUI:showDialog({
			isRich = true,
			btnType = 2,
			content = gLanguageCsv.tipsForSelectingMaterials,
			cb = function ()
				uv0 = "selectIdx"
				uv2 = "set"

				slot0.selectIdx:set(slot2.k, true)
			end
		})
	else
		slot0.selectIdx:set(slot2.k, true)
	end
end

function slot7.getDevelopState(slot0, slot1)
	slot2 = gGameModel.cards:find(slot1)
	slot3 = slot2:read("effort_values")
	slot4 = slot2:read("equips")
	slot6 = slot2:read("card_id")

	for slot10, slot11 in pairs(slot2:read("skills")) do
		if slot11 > 1 then
			return true
		end
	end

	if csv.fragments[csv.cards[slot6].fragID].combID < slot6 then
		return true
	end

	for slot12, slot13 in pairs(slot3) do
		if slot13 > 0 then
			return true
		end
	end

	for slot12, slot13 in pairs(slot4) do
		if slot13.level > 1 or slot13.star > 0 or slot13.awake > 0 then
			return true
		end
	end

	return false
end

function slot7.onSureClick(slot0)
	slot0.costCardIDs = {}
	slot1 = {}

	for slot5, slot6 in slot0.cardInfos:pairs() do
		if slot6:proxy().selectState then
			table.insert(slot0.costCardIDs, slot7.dbid)
		end
	end

	slot0.costItems:atproxy(1).num = slot0.selectNum

	slot0.selectPanelState:set(false)
end

function slot7.onSelectPanelClick(slot0)
	slot0.selectPanelState:set(false)
end

function slot7.onCostItemClick(slot0, slot1, slot2, slot3)
	if slot0.isAiding then
		return
	end

	if slot3.typ == "card" then
		slot0.selectMax:set(slot3.targetNum)
		slot0.selectPanelState:set(not slot0.selectPanelState:read())
	else
		gGameUI:stackUI("common.gain_way", nil, , slot3.id, nil, slot3.targetNum)
	end
end

function slot7.onStarSkillCostItemClick(slot0)
	slot0.selectMax:set(1)
	slot0.selectPanelState:set(true)
end

function slot7.onChangeClick(slot0)
	if slot0.star:read() == 12 and not dataEasy.isUnlock(gUnlockCsv.extremityProperty) then
		gGameUI:showTip(gLanguageCsv.cardStarMaxErr)

		return
	end

	gGameUI:stackUI("city.card.star_changefrags", nil, , slot0.selectDbId:read())
end

function slot7.onStarClick(slot0)
	if slot0.star:read() == 12 then
		gGameUI:showTip(gLanguageCsv.cardStarMaxErr)

		return
	end

	if dataEasy.getNumByKey("gold") < slot0.needCash:read() then
		gGameUI:showTip(gLanguageCsv.starNoEnoughGold)

		return
	end

	for slot4, slot5 in slot0.costItems:ipairs() do
		slot6 = slot5:proxy()

		if slot6.num < slot6.targetNum then
			gGameUI:showTip(gLanguageCsv.starMaterialsNotEnough)

			return
		end
	end

	slot1 = slot0.fight:read()
	slot2 = clone(slot0.attrs:read())

	function slot3()
		uv4 = "gGameApp"
		uv5 = "gGameApp"

		gGameApp:requestServer("/game/card/star", function (slot0)
			uv1 = "selectNum"
			slot1.selectNum = 0
			uv6 = "selectNum"
			slot6 = slot6.selectDbId
			slot7 = slot6
			uv7 = "gGameUI"
			uv9 = "stackUI"
			uv9 = "selectNum"

			gGameUI:stackUI("city.card.common_success", nil, {
				blackLayer = true
			}, slot6.read(slot7), slot7, {
				starOld = true,
				attrs = slot9,
				skills = slot9.skills:read()
			})
			audio.playEffectWithWeekBGM("star.mp3")
		end, slot4.selectDbId, slot5.costCardIDs)
	end

	slot4 = false

	for slot8, slot9 in slot0.cardInfos:pairs() do
		if slot0.star:read() < slot9:proxy().star then
			slot4 = true
		end
	end

	if slot4 then
		gGameUI:showDialog({
			btnType = 2,
			clearFast = true,
			content = gLanguageCsv.moreStarTips,
			cb = slot3
		})
	else
		slot3()
	end
end

function slot7.onExtremeClick(slot0)
	slot4 = csv.cards[csv.cards[slot0.cardId:read()].cardMarkID]

	if slot0.star:read() == 12 and dataEasy.isUnlock(gUnlockCsv.extremityProperty) then
		slot0.extremePoint:set(slot0.extremePoints:read()[slot3.cardMarkID] or 0)
		slot0.starSkillIcon:set(csv.unit[slot4.unitID].iconSimple)

		slot6 = {}
		slot8 = false

		for slot12, slot13 in ipairs(csv.card_star_skill[slot4.starSkillSeqID].starSkillList) do
			if (slot0.skills:read()[slot13] or 0) > 0 then
				slot8 = true
			end

			slot6[slot13] = {
				fastUpgradeNum = 1,
				cardId = slot0.cardId:read(),
				skillId = slot13,
				skillLevel = slot14,
				clientGold = slot0.gold:read(),
				icon = slot0.starSkillIcon:read()
			}
		end

		slot0.canResetEp:set(slot8)
		slot0.starSkills:update(slot6)
		slot0.extremePanelState:set(true)
	end
end

function slot7.closeExtreme(slot0)
	slot0.extremePanelState:set(false)
end

function slot7.onAddExtrePointClick(slot0)
	gGameUI:stackUI("city.card.star_changestarskill", nil, , slot0:createHandler("selectDbId"))
end

function slot7.onResetEp(slot0)
	if gGameModel.role:read("rmb") < slot0.resetEpCost:read() then
		uiEasy.showDialog("rmb")
	else
		if slot0.canResetEp:read() == false then
			gGameUI:showTip(gLanguageCsv.haveNotUpStarSkill)

			return false
		end

		slot1 = slot0.cardId:read()

		gGameUI:showDialog({
			btnType = 2,
			isRich = true,
			title = "",
			content = string.format(gLanguageCsv.starSkillResetTips, slot0.resetEpCost:read(), ui.QUALITYCOLOR[dataEasy.getCfgByKey(csv.cards[slot1].fragID).quality] .. csv.unit[csv.cards[slot1].unitID].name),
			cb = function ()
				uv4 = "gGameApp"

				gGameApp:requestServer("/game/card/star/skill/reset", function (slot0)
					gGameUI:showGainDisplay(slot0)
				end, slot4.selectDbId:read())
			end
		})
	end
end

function slot7.onEpUpClick(slot0, slot1, slot2, slot3, slot4)
	if csv.cards[slot3.cardId].starSkillMaxLevel < slot3.skillLevel + 1 then
		gGameUI:showTip(gLanguageCsv.starSkillMaxTips)

		return
	end

	if slot4 <= slot0.extremePoint:read() then
		gGameApp:requestServer("/game/card/skill/level/up", function (slot0)
		end, slot0.selectDbId, slot3.skillId, slot3.fastUpgradeNum)
	else
		slot0:onAddExtrePointClick()
	end
end

return slot7
