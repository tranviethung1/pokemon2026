slot0 = cc.load("mvc").ViewBase
slot1 = class("CardStarChangeSkillView", Dialog)

function slot2(slot0)
	slot1 = csv.cards[slot0.id]
	slot5 = 1

	if gGameModel.cards:find(slot0.dbid):read("getstar") < slot0.star then
		for slot9 = slot3, slot4 - 1 do
			if gStarCsv[slot1.starTypeID][slot9] then
				slot5 = slot5 + slot10.costCardNum
			end
		end
	end

	return slot5
end

slot1.RESOURCE_FILENAME = "card_star_skill.json"
slot1.RESOURCE_BINDING = {
	["selectPanel.subList"] = "subList",
	cardPanel2 = "cardPanel2",
	["selectPanel.textNum"] = "textNum",
	["barPanel.needFrags"] = "needFrags",
	textTips = "textTips",
	cardItem = "cardItem",
	item = "item",
	["selectPanel.bg.bgIcon"] = "bgIcon",
	["barPanel.bar"] = "slider",
	barPanel = "barPanel",
	combTipPos = "combTipPos",
	titleTxt = "title",
	cardPanel1 = "cardPanel1",
	["barPanel.myFrags"] = "myFrags",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnList = {
		varname = "btnList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:get("btn")
					slot5 = slot1:get("title")

					slot5:text(slot3.name)
					slot4:setBright(not slot3.isSelected)
					adapt.setTextScaleWithWidth(slot5, nil, slot4:size().width - 20)
					slot1:onClick(functools.partial(slot0.itemClick, slot2))

					if slot3.isSelected then
						text.addEffect(slot5, {
							glow = {
								color = ui.COLORS.GLOW.WHITE
							},
							color = ui.COLORS.NORMAL.WHITE
						})
					else
						text.addEffect(slot5, {
							color = ui.COLORS.NORMAL.RED
						})
					end
				end
			},
			handlers = {
				itemClick = bindHelper.self("onChangePage")
			}
		}
	},
	["cardPanel2.card1"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onFragClick")
			}
		}
	},
	["cardPanel2.btnFrags"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onUniversalFragClick")
			}
		}
	},
	["cardPanel2.btnFrags.textNote"] = {
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
	["barPanel.subBtn"] = {
		varname = "subBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onReduceClick")
			}
		}
	},
	["barPanel.addBtn"] = {
		varname = "addBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAddClick")
			}
		}
	},
	changeBtn = {
		varname = "changeBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeClick")
			}
		}
	},
	["changeBtn.title"] = {
		varname = "btnTxt",
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
				ended = bindHelper.self("onUniversalFragClick")
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
							cardId = slot3.id,
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
						uiEasy.addTextEffect1(slot5)
					end

					adapt.oneLinePos(slot1:get("textFightNote"), slot1:get("textFight"))
					slot1:get("mask"):visible(slot3.status ~= 0)
					slot1:get("iconSelect"):visible(slot3.selectState == true)
					slot1:setTouchEnabled(slot3.status == 0)

					if slot3.canSelect == false and slot3.selectState == false then
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
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.selectDbId = slot1()
	slot0.chipBarPercent = idler.new(0)
	slot0.chipNum = idler.new(0)
	slot0.chipNeed = idler.new(0)
	slot0.needCash = idler.new(0)
	slot0.selectPanelState = idler.new(false)
	slot0.cardInfos = idlers.new()
	slot0.selectIdx = idler.new()
	slot0.costNum = idler.new(0)
	slot0.getNum = idler.new(0)
	slot0.selectEpNum = idler.new(0)
	slot0.selectedFragId = idler.new(0)

	slot0:initModel()

	slot2 = {}
	slot0.tabIdx = idler.new(1)
	slot6 = csv.cards[csv.cards[slot0.cardId:read()].cardMarkID].starSkillSeqID
	slot7 = csv.card_star_skill[slot6].cardExchangeRate
	slot0.fragExchangeRate = csv.card_star_skill[slot6].fragExchangeRate
	slot8 = csv.card_star_skill[slot6].universalCards

	idlereasy.any({
		slot0.costNum,
		slot0.tabIdx,
		slot0.getNum
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "cardPanel1"
		slot4 = slot4.cardPanel1
		slot6 = slot4

		slot4.setVisible(slot6, slot2 == 1)

		uv6 = "setVisible"
		slot6 = csv.unit[csv.cards[slot6].unitID]
		uv9 = "setVisible"
		slot8 = ui.COLORS.QUALITY[dataEasy.getCfgByKey(csv.cards[slot9].fragID).quality]

		if slot2 == 1 then
			slot9 = slot1 < 1 and 1 or 0
			uv12 = "setVisible"

			function slot12(slot0)
				slot0:setTouchEnabled(false)

				slot4 = slot0:box()

				slot0:alignCenter(slot4)

				slot2 = uiEasy.setCardNum
				uv4 = "setTouchEnabled"
				uv6 = "box"

				slot2(slot0, slot4, nil, slot6)

				uv2 = "setTouchEnabled"

				if slot2 == 0 then
					slot4 = "num"
					uv4 = "setTouchEnabled"

					slot0:get(slot4):text(slot4)
				end
			end

			uv12 = "cardPanel1"

			bind.extend(slot12, slot4:get("card1"), {
				class = "card_icon",
				props = {
					cardId = slot12,
					rarity = slot6.rarity,
					grayState = slot9,
					advance = slot6.advance,
					star = slot6.star,
					levelProps = {
						data = slot6.level
					},
					onNode = slot12
				}
			})

			slot13 = slot9 == 1

			slot4:get("card1.imgAdd"):visible(slot13)

			uv13 = "setVisible"

			uiEasy.setIconName("card", slot13, {
				space = true,
				node = slot4:get("textName1"),
				name = slot5.name,
				advance = slot5.advance
			})

			slot12 = slot4:get("textName1")

			text.addEffect(slot12, {
				color = slot8
			})

			uv12 = "cardPanel1"
			slot14 = {
				methods = {
					ended = function ()
						uv0 = "selectPanelState"

						slot0.selectPanelState:set(true)
					end
				}
			}

			bind.touch(slot12, slot4:get("card1"), slot14)

			slot12 = slot5.cardMarkID
			slot11 = "star_skill_points_" .. slot12
			uv12 = "csv"
			slot12 = slot12 * slot3
			uv14 = "cardPanel1"

			bind.extend(slot14, slot4:get("card2"), {
				class = "icon_key",
				props = {
					data = {
						key = slot11,
						num = slot12
					},
					onNode = function (slot0)
						uv1 = "get"
						uv2 = "num"

						if slot1 * slot2 == 0 then
							slot0:get("num"):text(0)
						end
					end
				}
			})
			uiEasy.setIconName(slot11, slot12, {
				node = slot4:get("textName2")
			})

			slot13 = text.addEffect

			slot13(slot4:get("textName2"), {
				color = slot8
			})

			uv13 = "cardPanel1"

			slot13.barPanel:hide()
		end
	end)

	slot9 = 0

	idlereasy.any({
		slot0.selectedFragId,
		slot0.selectEpNum,
		slot0.tabIdx,
		slot0.frags
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
	slot0.slider:setPercent(0)
	slot0.slider:addEventListener(function (slot0, slot1)
		if slot1 == ccui.SliderEventType.percentChanged then
			uv4 = "ccui"
			uv5 = "SliderEventType"
			slot5 = math.ceil(slot4 * slot0:getPercent() / 100) / slot5.fragExchangeRate
			slot4 = math.floor(slot5)
			uv5 = "SliderEventType"
			uv4 = "SliderEventType"

			slot4.selectEpNum:set(slot4 * slot5.fragExchangeRate)
		end
	end)

	slot0.tabDatas = idlers.newWithMap({
		{
			isSelected = false,
			name = gLanguageCsv.cardChange
		},
		{
			isSelected = false,
			name = gLanguageCsv.fragChange
		}
	})

	slot0.tabIdx:addListener(function (slot0, slot1, slot2)
		uv3 = "tabDatas"

		if slot3.tabDatas:atproxy(slot1) then
			uv3 = "tabDatas"
			slot3.tabDatas:atproxy(slot1).isSelected = false
		end

		uv3 = "tabDatas"

		if slot3.tabDatas:atproxy(slot0) then
			uv3 = "tabDatas"
			slot3.tabDatas:atproxy(slot0).isSelected = true
		end

		slot3 = ""

		if slot0 == 1 then
			uv5 = "atproxy"
			slot4 = csv.cards[slot5]
			slot5 = csv.unit[slot4.unitID]
			uv8 = "atproxy"
			slot12 = gLanguageCsv["rarityCard" .. csv.unit[slot4.unitID].rarity - 1]
			uv12 = "isSelected"
			slot3 = string.format(gLanguageCsv.starSkillCardChangeTips, ui.QUALITYCOLOR[dataEasy.getCfgByKey(csv.cards[slot8].fragID).quality] .. slot12, slot12)
		else
			uv6 = "tabDatas"
			slot3 = string.format(gLanguageCsv.starSkillFragChangeTips, slot6.fragExchangeRate)
		end

		uv4 = "tabDatas"

		slot4.combTipPos:removeChildByName("richTxt")

		slot6 = 0.5
		slot4 = rich.createByStr(slot3, 40):anchorPoint(slot6, 0.5)
		slot4 = slot4.addTo
		uv6 = "tabDatas"

		slot4(slot4, slot6.combTipPos, 6, "richTxt")

		uv4 = "tabDatas"

		slot4.btnTxt:text(gLanguageCsv.spaceExchange)
	end)
	idlereasy.when(slot0.frags, function (slot0, slot1)
		uv2 = "setFragsPanel"

		slot2:setFragsPanel()
	end)
	idlereasy.when(slot0.cards, function (slot0, slot1)
		uv2 = "setCardDatas"
		uv5 = "setCardDatas"

		slot2:setCardDatas(slot1, slot5)
	end)
	idlereasy.when(slot0.selectIdx, function (slot0, slot1)
		uv2 = "textNum"
		slot2 = slot2.textNum
		slot2 = slot2.text

		slot2(slot2, "0")

		uv2 = "textNum"

		if slot2.cardInfos:atproxy(slot1) then
			uv2 = "textNum"
			slot2 = slot2.cardInfos:atproxy(slot1)
			slot2.selectState = not slot2.selectState
			uv6 = "textNum"

			for slot8 = 1, slot6.cardInfos:size() do
				uv9 = "textNum"

				if slot9.cardInfos:atproxy(slot8).selectState == true then
					slot3 = 0 + 1

					table.insert({}, slot9.dbid)
				end
			end

			uv5 = "textNum"
			slot5.selectNum = slot3
			uv5 = "textNum"
			slot5 = slot5.textNum
			slot6 = slot5

			slot5.text(slot6, slot3)

			uv6 = "textNum"

			for slot8 = 1, slot6.cardInfos:size() do
				uv9 = "textNum"
				slot9.cardInfos:atproxy(slot8).canSelect = true
			end
		end
	end)

	if matchLanguage({
		"en"
	}) then
		adapt.setTextAdaptWithSize(slot0.textTips, {
			vertical = "center",
			size = cc.size(800, 120)
		})
	end

	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.cards = gGameModel.role:getIdler("cards")
	slot0.cardCapacity = gGameModel.role:getIdler("card_capacity")
	slot0.frags = gGameModel.role:getIdler("frags")

	idlereasy.when(slot0.selectDbId, function (slot0, slot1)
		uv2 = "costCardIDs"
		slot2.costCardIDs = {}
		slot2 = gGameModel.cards
		slot3 = slot2
		slot2 = slot2.find(slot3, slot1)
		uv3 = "costCardIDs"
		slot6 = slot2
		uv6 = "costCardIDs"
		slot3.cardId = idlereasy.assign(slot2.getIdler(slot6, "card_id"), slot6.cardId)
		uv3 = "costCardIDs"
		slot6 = slot2
		uv6 = "costCardIDs"
		slot3.star = idlereasy.assign(slot2.getIdler(slot6, "star"), slot6.star)
	end)
end

function slot1.onAddClick(slot0)
	slot0.selectEpNum:set(slot0.selectEpNum:read() + slot0.fragExchangeRate)
end

function slot1.onReduceClick(slot0)
	slot0.selectEpNum:set(slot0.selectEpNum:read() - slot0.fragExchangeRate)
end

function slot1.onChangePage(slot0, slot1, slot2)
	slot0.tabIdx:set(slot2)
end

function slot1.onChangeClick(slot0)
	if slot0.tabIdx:read() == 1 then
		if #slot0.costCardIDs == 0 then
			gGameUI:showTip(string.format(gLanguageCsv.pleaseSelectNumber, gLanguageCsv.starSkillExchange))

			return
		end

		gGameApp:requestServer("/game/card/star/skill/card/exchange", function (slot0)
			slot1 = gGameUI
			slot1 = slot1.showGainDisplay

			slot1(slot1, slot0)

			uv1 = "gGameUI"
			slot1 = slot1.costNum
			slot1 = slot1.set

			slot1(slot1, 0)

			uv1 = "gGameUI"
			slot1 = slot1.getNum
			slot1 = slot1.set

			slot1(slot1, 0)

			uv1 = "gGameUI"
			slot1.costCardIDs = {}
		end, slot0.selectDbId:read(), slot0.costCardIDs)
	else
		if slot0.selectedFragId:read() == 0 then
			gGameUI:showTip(string.format(gLanguageCsv.selectFragment))

			return
		end

		if slot0.selectEpNum:read() == 0 then
			gGameUI:showTip(string.format(gLanguageCsv.pleaseSelectNumber, gLanguageCsv.starSkillExchange))

			return
		end

		gGameApp:requestServer("/game/card/star/skill/frag/exchange", function (slot0)
			slot1 = gGameUI
			slot1 = slot1.showGainDisplay

			slot1(slot1, slot0)

			uv1 = "gGameUI"
			slot1 = slot1.selectEpNum
			slot1 = slot1.set

			slot1(slot1, 0)

			uv1 = "gGameUI"
			slot1 = slot1.slider
			slot1 = slot1.setPercent

			slot1(slot1, 0)

			uv1 = "gGameUI"

			slot1.selectedFragId:set(0)
		end, slot0.selectDbId:read(), slot0.selectedFragId:read(), slot0.selectEpNum:read())
	end
end

function slot1.onCombClick(slot0)
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

function slot1.onUniversalFragClick(slot0)
	gGameUI:stackUI("city.card.star_changefrags", nil, , slot0.selectDbId:read())
end

function slot1.onGainWayClick(slot0)
	slot1 = csv.cards[slot0.cardId:read()].fragID

	gGameUI:stackUI("common.gain_way", nil, , slot1, nil, csv.fragments[slot1].combCount)
end

function slot3(slot0, slot1, slot2)
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

function slot1.setFragsPanel(slot0)
	slot1 = csv.cards[slot0.cardId:read()].fragID
	slot3 = csv.fragments[slot1].combCount
	slot4 = dataEasy.getNumByKey(slot1)

	bind.extend(slot0, slot0.selectPanel:get("iconPanel"), {
		class = "icon_key",
		props = {
			data = {
				key = slot1,
				num = slot4
			},
			onNode = function (slot0)
				slot0:setTouchEnabled(false):scale(0.9)
			end
		}
	})
	slot0.chipNum:set(slot4)
	slot0.chipNeed:set("/" .. slot3)
	slot0.chipBarPercent:set(cc.clampf(slot4 / slot3 * 100, 0, 100))
end

function slot1.onSureClick(slot0)
	slot0.costCardIDs = {}

	for slot5, slot6 in slot0.cardInfos:pairs() do
		if slot6:proxy().selectState then
			slot8 = table.insert

			slot8(slot0.costCardIDs, slot7.dbid)

			uv8 = "costCardIDs"
			slot1 = 0 + slot8(slot7)
		end
	end

	slot0.costNum:set(#slot0.costCardIDs)
	slot0.getNum:set(slot1)
	slot0.selectPanelState:set(false)
end

function slot1.onSelectPanelClick(slot0)
	slot0.selectPanelState:set(false)
end

function slot1.setCardDatas(slot0, slot1, slot2)
	slot3 = csv.cards[slot0.cardId:read()]
	slot0.selectNum = 0

	slot0.selectIdx:set(0)

	slot4 = csv.cards[slot0.cardId:read()].cardMarkID
	slot5 = dataEasy.inUsingCardsHash()
	slot2 = (not slot2 or itertools.map(slot2, function (slot0, slot1)
		return slot1, slot0
	end)) and {}
	slot6 = {}

	for slot10, slot11 in pairs(slot1) do
		if gGameModel.cards:find(slot11) then
			slot13 = slot12:read("card_id", "name", "fighting_point", "locked", "level", "star", "advance")
			slot15 = csv.unit[csv.cards[slot13.card_id].unitID]
			slot16 = 0

			if slot13.locked then
				slot16 = 1
			elseif slot5[slot11] then
				slot16 = 3
			elseif slot0.star:read() < slot13.star then
				slot16 = 4
			end

			if slot14.cardMarkID == slot4 and slot0.selectDbId:read() ~= slot11 or slot2[slot13.card_id] then
				table.insert(slot6, {
					selectState = false,
					id = slot13.card_id,
					rarity = slot15.rarity,
					attr1 = slot15.natureType,
					attr2 = slot15.natureType2,
					level = slot13.level,
					star = slot13.star,
					name = slot13.name,
					locked = slot13.locked,
					advance = slot13.advance,
					fight = slot13.fighting_point,
					dbid = slot11,
					status = slot16,
					battleType = slot5[slot11],
					universal = slot2[slot13.card_id]
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

function slot1.onCardItemClick(slot0, slot1, slot2, slot3)
	if slot3.selectState == false and (gGameModel.cards:find(slot3.dbid):read("getstar") < slot3.star or slot3.level > 1 or slot3.advance > 1 or slot0:getDevelopState(slot3.dbid)) then
		gGameUI:showDialog({
			isRich = true,
			btnType = 2,
			content = gLanguageCsv.starSkillChangeTips,
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

function slot1.getDevelopState(slot0, slot1)
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

function slot1.onFragClick(slot0)
	gGameUI:stackUI("city.card.star_selectfrag", nil, , {
		selectedFragId = slot0.selectedFragId,
		cardId = slot0.cardId:read()
	})
end

return slot1
