function slot0(slot0, slot1, slot2, slot3, slot4, slot5)
	slot7 = slot0:size()

	if not slot0:get("effect") then
		slot6 = widget.addAnimationByKey(slot0, slot1, "effect", "effect", slot5 or 10):xy(slot7.width / 2 + (slot3 or 0), slot7.height / 2 + (slot4 or 0)):scale(slot2)
	else
		slot6:play("effect")
	end
end

function slot1(slot0, slot1, slot2)
	bind.extend(slot0, slot1, {
		class = "icon_key",
		props = {
			data = {
				key = slot2.key,
				num = slot2.num
			},
			grayState = slot2.num <= 0 and 1 or 0,
			onNode = function (slot0)
				slot0:setTouchEnabled(false)
				slot0:scale(0.8)
			end
		}
	})
	slot1:get("icon"):visible(slot2.num <= 0)
end

slot2 = class("CardFeelView", Dialog)
slot2.RESOURCE_FILENAME = "card_feel.json"
slot2.RESOURCE_BINDING = {
	attrItem = "attrItem",
	["leftPanel.btnSelectItem.img"] = "img",
	pageItem = "pageItem",
	["leftPanel.bar"] = "progressBar",
	["leftPanel.textNum"] = "textNum",
	["rightPanel.attrSubList"] = "attrSubList",
	leftPanel = "leftPanel",
	["leftPanel.btnSelectItem.note"] = "note",
	item = "item",
	mask = "mask",
	["rightPanel.effectList"] = "effectList",
	rightPanel = "rightPanel",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["leftPanel.btnLvUp"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOneKeyClick")
			}
		}
	},
	["leftPanel.btnLvUpEasy"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onLvUpEasyClick")
			}
		}
	},
	["leftPanel.btnLvUp.textTitle"] = {
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
	["leftPanel.btnInfo"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnInfo")
			}
		}
	},
	["leftPanel.btnSelectItem"] = {
		varname = "btnSelectItem",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnSelectItem")
			}
		}
	},
	["leftPanel.itemList"] = {
		varname = "itemList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				backupCached = true,
				data = bindHelper.self("costItemDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					uv4 = "onTouch"

					slot4(slot0, slot1, slot3)
					slot1:onTouch(functools.partial(slot0.itemClick, slot1, slot2, slot3))
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	["leftPanel.pageList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 15,
				data = bindHelper.self("evolutionDatas"),
				item = bindHelper.self("pageItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("normal"):visible(slot3.select ~= true)
					slot1:get("select"):visible(slot3.select == true)
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	["rightPanel.attrList"] = {
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
					slot4 = slot1:multiget("txtName", "txtNum", "icon")

					slot4.icon:texture(slot3.icon)
					slot4.txtName:text(slot3.name)
					slot4.txtNum:text(math.floor(slot3.num))
					adapt.oneLinePos(slot4.txtName, slot4.txtNum, cc.p(20, 0))
				end
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.cardId = slot1 or gGameModel.cards:find(slot0.cards:read()[1]):read("card_id")
	slot0.costData = {}

	slot0:enableSchedule()

	slot0.costItemDatas = idlertable.new()
	slot2 = csv.cards[slot0.cardId]
	slot0.clientCurLvExp = idler.new(0)
	slot0.showSuccessTip = false
	slot0.cardMarkID = slot2.cardMarkID
	slot0.maxLimitLv = table.length(gGoodFeelCsv[slot2.feelType])
	slot0.isFirst = true
	slot0.clientCurLvExp = idler.new(0)
	slot0.clientLv = idler.new(0)
	slot0.canOneUp = false

	idlereasy.when(slot0.cardFeels, function (slot0, slot1)
		uv2 = "cardMarkID"
		slot3 = (slot1[slot2.cardMarkID] or {}).level or 0
		uv4 = "level"

		if slot4.oldClientLvEffect then
			uv4 = "level"

			if slot4.oldClientLvEffect < slot3 then
				uv4 = "level"
				slot4.showSuccessTip = true
			end
		end

		uv4 = "level"
		slot4.oldClientLvEffect = slot3
		uv4 = "level"
		slot4 = slot4.clientLv
		slot4 = slot4.set

		slot4(slot4, slot3)

		uv4 = "level"

		slot4.clientCurLvExp:set(slot2.level_exp or 0)
	end)
	slot0.note:anchorPoint(0.5, 0.5)
	adapt.setTextAdaptWithSize(slot0.note, {
		vertical = "center",
		str = gLanguageCsv.cardFeelViewtext,
		size = cc.size(220, 200)
	})
	adapt.oneLinePos(slot0.img, slot0.note, nil, "left")

	slot0.attrDatas = idlers.new()

	idlereasy.any({
		slot0.clientLv,
		slot0.items,
		slot0.clientCurLvExp
	}, function (slot0, slot1, slot2, slot3)
		uv5 = "gGoodFeelCsv"
		slot5 = {}
		uv6 = "feelType"
		slot6.canOneUp = false
		uv8 = "gGoodFeelCsv"

		for slot10, slot11 in orderCsvPairs(slot8.feelItems) do
			slot14 = {
				key = slot11,
				num = slot2[slot11] or 0,
				cfg = csv.items[slot11]
			}

			table.insert(slot5, slot14)

			uv14 = "feelType"

			if gGoodFeelCsv[slot5.feelType][math.min(slot1 + 1, slot14.maxLimitLv)].needExp <= slot3 + (slot2[slot11] or 0) * csv.items[slot11].specialArgsMap.feel_exp + 0 then
				uv14 = "feelType"
				slot14.canOneUp = true
			end
		end

		uv7 = "feelType"
		slot7 = slot7.costItemDatas
		slot7 = slot7.set

		slot7(slot7, slot5)

		uv7 = "feelType"
		slot7 = slot7.leftPanel:get("textLv")
		slot7 = slot7.text

		slot7(slot7, slot1)

		uv7 = "feelType"

		if slot7.showSuccessTip then
			uv7 = "feelType"
			slot7.showSuccessTip = false
			uv7 = "feelType"
			slot7 = slot7.progressBar
			slot8 = slot7
			slot7 = slot7.setPercent

			slot7(slot8, 0)

			uv7 = "canOneUp"
			uv8 = "feelType"
			slot8 = slot8.progressBar

			slot7(slot8, "effect/shengjitiao.skel", 0.8)

			uv7 = "canOneUp"
			uv8 = "feelType"

			slot7(slot8.leftPanel, "haogan/haogan.skel", 1, 30, -100, 10)
		end

		uv7 = "feelType"
		uv10 = "feelType"
		slot10 = slot10.maxLimitLv
		slot7.clientNextLvExp = slot4[math.min(slot1 + 1, slot10)].needExp
		uv7 = "feelType"
		slot7 = slot7.leftPanel:get("textExp1")
		slot7 = slot7.text

		slot7(slot7, slot3)

		uv7 = "feelType"
		slot7 = slot7.leftPanel:get("textExp2")
		slot8 = slot7
		uv10 = "feelType"

		slot7.text(slot8, "/" .. slot10.clientNextLvExp)

		uv8 = "feelType"
		slot8 = slot3 / slot8.clientNextLvExp * 100
		slot7 = cc.clampf(slot8, 0, 100)
		uv8 = "feelType"

		if slot8.maxLimitLv == slot1 then
			slot7 = 100
			slot8 = slot4[slot1].needExp
			uv9 = "feelType"
			slot9 = slot9.leftPanel:get("textExp1")
			slot9 = slot9.text

			slot9(slot9, slot8)

			uv9 = "feelType"

			slot9.leftPanel:get("textExp2"):text("/" .. slot8)
		end

		slot8 = adapt.oneLinePos
		uv9 = "feelType"
		slot9 = slot9.leftPanel
		slot10 = slot9
		uv10 = "feelType"

		slot8(slot9.get(slot10, "textExp2"), slot10.leftPanel:get("textExp1"), nil, "right")

		uv8 = "feelType"

		if slot7 >= slot8.progressBar:getPercent() then
			uv8 = "feelType"

			if slot8.isFirst then
				uv8 = "feelType"
				slot8.isFirst = false
				uv8 = "feelType"

				slot8.progressBar:setPercent(slot7)
			else
				uv9 = "feelType"

				transition.executeSequence(slot9.progressBar):progressTo(0.29, slot7):done()
			end
		end

		uv8 = "feelType"

		if slot8.oldClientLv ~= slot1 then
			uv8 = "feelType"
			slot8 = slot8.setAttrDatas
			slot10 = slot4

			slot8(slot8, slot10, slot1)

			uv8 = "feelType"
			slot8 = slot8.setAddAttrDatas
			uv10 = "gGoodFeelCsv"
			uv12 = "feelType"

			slot8(slot8, slot10, slot1, slot12.oldClientLv)

			uv8 = "feelType"
			slot8.oldClientLv = slot1
		end
	end)

	slot0.selectState = idler.new(userDefault.getForeverLocalKey("CardFeelView", false))

	idlereasy.any({
		slot0.selectState,
		slot0.costItemDatas
	}, function (slot0, slot1, slot2)
		uv4 = "common/icon/radio_selected.png"

		slot4.btnSelectItem:get("img"):texture(slot1 and "common/icon/radio_selected.png" or "common/icon/radio_normal.png")

		for slot8, slot9 in ipairs(slot2) do
			if slot1 == false or slot1 == true and not slot9.cfg.specialArgsMap.special then
				slot4 = 0 + slot9.cfg.specialArgsMap.feel_exp * slot9.num
			end
		end

		uv5 = "common/icon/radio_selected.png"
		slot5.expEnough = slot4 > 0
	end)

	slot0.evolutionDatas = idlers.new({})
	slot4 = {
		[gGameModel.cards:find(slot9):read("card_id")] = true
	}

	for slot8, slot9 in ipairs(slot0.cards:read()) do
		-- Nothing
	end

	slot5 = {}
	slot6 = false

	for slot10, slot11 in orderCsvPairs(csv.cards) do
		if matchLanguageForce(slot11.languages) then
			slot6 = false

			if slot11.cardMarkID == slot2.cardMarkID and slot11.canDevelop then
				slot6 = true
			end

			if not dataEasy.isUnlock(gUnlockCsv.mega) and slot11.megaIndex > 0 then
				slot6 = false
			elseif not slot11.canDevelop and dataEasy.isUnlock(gUnlockCsv.mega) then
				slot6 = false
			end

			if slot6 then
				table.insert(slot5, {
					existCards = slot4,
					selectDevelop = slot11.develop,
					cfg = slot11,
					id = slot10
				})
			end
		end
	end

	table.sort(slot5, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0.evolutionDatas:update(slot5)

	slot7 = slot0.item:size().width
	slot8 = slot0.costItemDatas:size()

	slot0.itemList:x(slot0.itemList:x() + (5 - slot8) * slot7 / 2)
	slot0.itemList:setItemsMargin((5 - slot8) * slot7 / 8)

	slot9 = 1

	for slot13, slot14 in ipairs(slot5) do
		if slot14.id == slot2.id then
			slot9 = slot13
		end
	end

	slot0.selectEvolution = idler.new(slot9)

	slot0.selectEvolution:addListener(function (slot0, slot1)
		uv2 = "evolutionDatas"
		slot2 = slot2.evolutionDatas
		slot3 = slot2
		slot2 = slot2.atproxy(slot3, slot0)
		uv3 = "evolutionDatas"

		if slot3.evolutionDatas:atproxy(slot1) then
			slot3.select = false
		end

		if slot2 then
			uv4 = "evolutionDatas"

			slot4:setLeftPanel(slot2)

			slot2.select = true
		end
	end)
	slot0:initPrivilegeListener()
	slot0.textNum:hide()
	Dialog.onCreate(slot0)
end

function slot2.initModel(slot0)
	slot0.items = gGameModel.role:getIdler("items")
	slot0.cards = gGameModel.role:getIdler("cards")
	slot0.cardFeels = gGameModel.role:getIdler("card_feels")
	slot0.gold = gGameModel.role:getIdler("gold")
end

function slot2.setAttrDatas(slot0, slot1, slot2)
	slot3 = {}
	slot4 = {}

	for slot8 = 1, 6 do
		slot9 = slot1[slot2]["attrNum" .. slot8]
		slot11 = gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot1[slot2]["attrType" .. slot8]])]
		slot12 = 0

		if slot2 < slot0.maxLimitLv then
			slot12 = slot1[slot2 + 1]["attrNum" .. slot8]
		end

		if slot9 < slot12 then
			table.insert(slot3, {
				name = slot11,
				num = slot12 - slot9
			})
		end

		table.insert(slot4, {
			name = slot11 .. ":",
			num = slot9,
			icon = ui.ATTR_LOGO[slot10]
		})
	end

	if #slot3 > 0 then
		for slot9 = 1, 2 do
			if slot3[slot9] then
				slot5 = string.format("%s#C0x5b545b# %s#C0x60C456#+%s", "#C0x5b545b#(", slot3[slot9].name, slot3[slot9].num)
			end
		end

		slot6 = slot0.rightPanel:get("textTip"):size()

		slot0.rightPanel:get("textTip"):removeAllChildren()
		rich.createByStr(slot5 .. "#C0x5b545b# )", 40):anchorPoint(0, 0.5):xy(slot6.width + 20, slot6.height / 2):addTo(slot0.rightPanel:get("textTip"), 6)
	else
		slot0.rightPanel:get("textTip"):hide()
	end

	slot0.attrDatas:update(slot4)
end

function slot2.setAddAttrDatas(slot0, slot1, slot2, slot3)
	slot5 = {}

	for slot9, slot10 in pairs(gGoodFeelEffectCsv[slot1.cardMarkID]) do
		slot11 = "#C0x5B545B#"
		slot12 = "#C0x60C456#"

		if slot2 < slot9 then
			slot11 = "#C0xB7B09E#"
			slot12 = "#C0xB7B09E#"
		end

		slot14 = 0

		for slot18 = 1, 6 do
			if dataEasy.getAttrValueString(slot10["attrType" .. slot18], slot10["attrNum" .. slot18]) ~= "" then
				if slot14 + 1 > 1 then
					slot13 = string.format("%s%s,", "", slot11)
				end

				slot13 = string.format("%s%s %s%s+%s", slot13, slot11, gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot10["attrType" .. slot18]])], slot12, slot19)
			end
		end

		if slot14 == 6 then
			slot13 = string.format("%s+%s", slot12, dataEasy.getAttrValueString(slot10["attrType" .. 1], slot10["attrNum" .. 1]))
		end

		table.insert(slot5, {
			verticalSpace = 10,
			str = slot11 .. string.format(gLanguageCsv.feelLevelNote, slot9) .. ((slot10.natureType == 0 or string.format(slot10.desc, gLanguageCsv[game.NATURE_TABLE[slot10.natureType]] .. gLanguageCsv.xi, slot13)) and string.format(slot10.desc, slot13)),
			level = slot10.level
		})
	end

	table.sort(slot5, function (slot0, slot1)
		return slot0.level < slot1.level
	end)
	beauty.textScroll({
		fontSize = 40,
		isRich = true,
		list = slot0.effectList,
		strs = slot5
	})

	for slot9, slot10 in ipairs(slot5) do
		if slot3 and slot3 < slot10.level and slot10.level <= slot2 then
			slot11 = slot0.effectList
			slot12 = slot11
			uv12 = "gGoodFeelEffectCsv"

			slot12(slot11.getChildren(slot12)[slot9], "haogandujiesuo/shuzhibianhua.skel", 1, 0, 5)
		end
	end
end

function slot2.setLeftPanel(slot0, slot1)
	slot2 = slot0.leftPanel:multiget("textLv", "textExp", "bar", "cardIcon", "textTip", "iconRarity", "textCardName", "iconAttr1", "iconAttr2", "btnSelectItem")
	slot3 = csv.unit[slot1.cfg.unitID]

	slot2.cardIcon:removeAllChildren()
	widget.addAnimation(slot2.cardIcon, slot3.unitRes, ({
		"standby_loop",
		"attack",
		"win_loop",
		"run_loop"
	})[1], 5):xy(slot2.cardIcon:size().width / 2, 0):scale(slot3.scaleU * 2.3):setSkin(slot3.skin)
	slot2.iconAttr1:texture(ui.ATTR_ICON[slot3.natureType])
	slot2.iconAttr2:hide()

	if slot3.natureType2 then
		slot2.iconAttr2:texture(ui.ATTR_ICON[slot3.natureType2]):show()
	end

	slot2.textTip:visible(slot1.existCards[slot1.id] ~= true)
	slot2.textCardName:text(slot1.cfg.name)
	slot2.iconRarity:texture(ui.RARITY_ICON[slot3.rarity])
	adapt.oneLinePos(slot2.textCardName, {
		slot2.iconRarity,
		slot2.textTip
	}, cc.p(8, 0), "right")
	adapt.oneLinePos(slot2.textCardName, {
		slot2.iconAttr1,
		slot2.iconAttr2
	}, cc.p(8, 0))
end

function slot2.onItemClick(slot0, slot1, slot2, slot3, slot4, slot5)
	function slot6(slot0, slot1)
		slot0 = slot0 or 1
		uv2 = "num"

		if slot2.num <= 0 then
			if not slot1 then
				uv7 = "num"

				gGameUI:stackUI("common.gain_way", nil, , slot7.key)
			end
		else
			uv2 = "gGameUI"

			if slot2:canLevelUp() then
				uv2 = "num"
				uv3 = "num"
				slot3 = slot3.num - slot0
				slot2.num = slot3
				uv2 = "stackUI"
				uv3 = "common.gain_way"
				uv4 = "key"
				uv5 = "num"

				slot2(slot3, slot4, slot5)

				uv2 = "gGameUI"
				slot2 = slot2.costData
				uv3 = "num"
				slot3 = slot3.key
				uv4 = "gGameUI"
				uv5 = "num"

				if slot4.costData[slot5.key] then
					uv4 = "gGameUI"
					uv5 = "num"

					if not (slot4.costData[slot5.key] + slot0) then
						slot4 = slot0
					end
				end

				slot2[slot3] = slot4
				uv2 = "gGameUI"
				slot2 = slot2.clientCurLvExp
				slot2 = slot2.modify

				slot2(slot2, function (slot0)
					uv2 = "cfg"

					return true, slot0 + slot2.cfg.specialArgsMap.feel_exp
				end)

				uv2 = "gGameUI"
				slot2 = slot2.textNum:show()
				slot2 = slot2.text
				uv5 = "gGameUI"
				uv6 = "num"
				slot5 = slot5.costData[slot6.key]
				slot4 = "x" .. slot5

				slot2(slot2, slot4)

				uv2 = "gGameUI"
				slot2 = slot2.checkCanLvUp
				uv4 = "canLevelUp"
				uv5 = "num"

				slot2(slot2, slot4, slot5)

				uv2 = "key"

				if not slot2.lvUpEffect then
					uv2 = "key"
					uv4 = "key"
					slot2.lvUpEffect = widget.addAnimation(slot4, "koudai_gonghuixunlian/gonghuixunlian.skel", "fangguang", 10):xy(81, 6):scale(0.8)
				else
					uv2 = "key"

					slot2.lvUpEffect:play("fangguang")
				end

				return true
			else
				gGameUI:showTip(gLanguageCsv.feelReachedFullLevel)
			end
		end
	end

	if slot5.name == "began" then
		slot0.lvTouchTimes = 0.3
		slot0.count = 1

		slot0:schedule(function ()
			uv0 = "lvTouchTimes"
			uv2 = "lvTouchTimes"
			slot2 = slot2.lvTouchTimes - 0.03
			slot1 = math.max(slot2, 0.05)
			slot0.lvTouchTimes = slot1
			uv0 = "math"
			uv1 = "lvTouchTimes"
			uv2 = "lvTouchTimes"

			if not slot0(slot1.count, slot2.lvTouchTimes ~= 0.27) then
				return false
			end
		end, 0.1, 0, "feelLvUp")
	elseif slot5.name == "moved" then
		if not slot0.lvTouchBeganPos then
			slot0.lvTouchBeganPos = slot2:getTouchBeganPosition()
		end

		if ui.TOUCH_MOVE_CANCAE_THRESHOLD <= math.abs(slot5.x - slot0.lvTouchBeganPos.x) or ui.TOUCH_MOVE_CANCAE_THRESHOLD <= math.abs(slot5.y - slot0.lvTouchBeganPos.y) then
			slot0:unSchedule("feelLvUp")
		end
	elseif slot5.name == "ended" or slot5.name == "cancelled" then
		slot0:unSchedule("feelLvUp")

		slot0.lvTouchBeganPos = nil

		slot0:sendRequeat()
		slot0.textNum:hide()
	end
end

function slot2.checkCanLvUp(slot0, slot1, slot2)
	slot4 = true

	while slot0.clientNextLvExp <= slot0.clientCurLvExp:read() do
		if slot0:canLevelUp() then
			slot0.showSuccessTip = slot4
			slot4 = false

			slot0.clientCurLvExp:set(slot3 - slot0.clientNextLvExp)
			slot0.clientLv:modify(function (slot0)
				return true, slot0 + 1
			end)
		else
			slot0.clientCurLvExp:modify(function (slot0)
				uv2 = "clientNextLvExp"

				return true, slot2.clientNextLvExp
			end)

			break
		end
	end
end

function slot2.canLevelUp(slot0)
	if slot0.clientLv:read() < slot0.maxLimitLv then
		return true
	end

	return false
end

function slot2.sendRequeat(slot0, slot1)
	if not itertools.isempty(slot0.costData) then
		slot0.costData = {}

		gGameApp:requestServer("/game/card/feel/use_items", function ()
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
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
			--     return _build_string_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
			--     node.value = state.constants.complex_constants[index]
			--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end, slot0.cardMarkID, slot0.costData)
	elseif slot1 then
		slot1()
	end
end

function slot2.onOneKeyClick(slot0)
	if not slot0:canLevelUp() then
		gGameUI:showTip(gLanguageCsv.feelReachedFullLevel)

		return
	end

	if not slot0.expEnough then
		gGameUI:showTip(gLanguageCsv.materialsNotEnough)

		return
	end

	gGameUI:showDialog({
		btnType = 2,
		content = gLanguageCsv.wantUpgradeWithOneClick,
		cb = function ()
			uv4 = "gGameApp"
			uv5 = "gGameApp"

			gGameApp:requestServer("/game/card/feel/tomax", function (slot0)
			end, slot4.cardMarkID, slot5.selectState)
		end
	})
end

function slot2.onLvUpEasyClick(slot0)
	if not slot0:canLevelUp() then
		gGameUI:showTip(gLanguageCsv.feelReachedFullLevel)

		return
	end

	if slot0.canOneUp then
		gGameUI:stackUI("city.card.feel.upgrade", nil, , {
			type = 2,
			cardMarkID = slot0.cardMarkID,
			cardId = slot0.cardId,
			selectState = slot0.selectState
		})
	else
		gGameUI:showTip(gLanguageCsv.materialsNotEnough)
	end
end

function slot2.onBtnSelectItem(slot0)
	slot1 = userDefault.getForeverLocalKey("CardFeelView", false)

	slot0.selectState:set(not slot1)
	userDefault.setForeverLocalKey("CardFeelView", not slot1)
end

function slot2.initPrivilegeListener(slot0)
	uiEasy.addTouchOneByOne(slot0.mask, {
		ended = function (slot0, slot1, slot2)
			if math.abs(slot1) > 100 and math.abs(slot2) < math.abs(slot1) then
				slot3 = slot1 > 0 and -1 or 1
				uv4 = "math"

				slot4.selectEvolution:modify(function (slot0)
					uv2 = "cc"
					uv4 = "clampf"

					return true, cc.clampf(slot0 + slot2, 1, slot4.evolutionDatas:size())
				end)
			end
		end
	})
end

function slot2.onBtnInfo(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 880
	})
end

function slot2.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.savorableOpinionStatement)
		end),
		slot2.noteText(61001, 61020)
	}
end

return slot2
