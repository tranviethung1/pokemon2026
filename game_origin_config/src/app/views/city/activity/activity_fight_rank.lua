slot0 = {
	cc.c4b(255, 163, 43, 255),
	cc.c4b(153, 204, 102, 255),
	cc.c4b(229, 112, 103, 255),
	cc.c4b(143, 153, 204, 255)
}

function slot1(slot0)
	if slot0.sliderBg:visible() then
		slot1, slot2 = slot0:xy()
		slot3 = slot0:size()
		slot4, slot5 = slot0.sliderBg:xy()
		slot6 = slot0.sliderBg:size()

		slot0:setScrollBarEnabled(true)
		slot0:setScrollBarColor(cc.c3b(241, 59, 84))
		slot0:setScrollBarOpacity(255)
		slot0:setScrollBarAutoHideEnabled(false)
		slot0:setScrollBarPositionFromCorner(cc.p(slot1 + slot3.width - slot4, (slot3.height - slot6.height) / 2 + 5))
		slot0:setScrollBarWidth(slot6.width)
		slot0:refreshView()
	else
		slot0:setScrollBarEnabled(false)
	end
end

slot2 = class("ActivityFightRankView", Dialog)
slot2.RESOURCE_FILENAME = "activity_fight_rank.json"
slot2.RESOURCE_BINDING = {
	["leftPanel.item"] = "tabItem",
	["centerPanel.mainPanel.rankPanel.rankNumber"] = "rankNumber",
	topPanel = "topPanel",
	["centerPanel.mainPanel.fightAwardPanel.item"] = "itemFightAward",
	["centerPanel.spritePanel"] = "spritePanel",
	["centerPanel.spritePanel.sliderBg"] = "spriteSliderBg",
	["centerPanel.mainPanel.rankPanel.di"] = "rankFirst",
	["centerPanel.mainPanel.fightAwardPanel.sliderBg"] = "fightAwardSliderBg",
	["centerPanel.mainPanel.rankPanel"] = "rankPanel",
	["leftPanel.fightPoint"] = "curFightPoint",
	["centerPanel.mainPanel.rankAwardPanel"] = "rankAwardPanel",
	["centerPanel.mainPanel.rankPanel.richText"] = "richText",
	["centerPanel.spritePanel.item"] = "spriteItem",
	["centerPanel.spritePanel.spritePanel"] = "cardArea",
	["topPanel.time"] = "timeLabel",
	["centerPanel.mainPanel.rankPanel.sliderBg"] = "rankSliderBg",
	["centerPanel.mainPanel.rankPanel.item"] = "itemRank",
	["centerPanel.mainPanel.rankAwardPanel.sliderBg"] = "rankAwardSliderBg",
	["centerPanel.mainPanel.rankPanel.ming"] = "rankLast",
	["centerPanel.mainPanel.rankAwardPanel.item"] = "itemRankAward",
	["centerPanel.spritePanel.spritePanel.cardShow"] = "cardShow",
	["centerPanel.mainPanel.fightAwardPanel"] = "fightAwardPanel",
	["centerPanel.mainPanel"] = "mainPanel",
	["centerPanel.mainPanel.rankPanel.text1"] = "randHead",
	["topPanel.day"] = {
		varname = "dayLabel",
		binds = {
			event = "extend",
			class = "text_atlas",
			props = {
				isEqualDist = false,
				align = "right",
				pathName = "frhd",
				data = bindHelper.self("dayStr"),
				onNode = function (slot0)
					if not slot0.isFirstOver then
						slot0:x(slot0:x() + 185)
						slot0:y(slot0:y() + 85)

						slot0.isFirstOver = true
					end
				end
			}
		}
	},
	["topPanel.ruleBtn"] = {
		varname = "ruleBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShowRule")
			}
		}
	},
	closeBtn = {
		varname = "closeBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["leftPanel.list"] = {
		varname = "tabList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("tabItem"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					return slot0.id < slot1.id
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("name"):text(slot3.name)
					slot1:get("selected"):visible(slot3.selected)
					slot1:get("line"):visible(not slot3.isLast)

					if slot3.selected then
						text.addEffect(slot1:get("name"), {
							color = ui.COLORS.NORMAL.WHITE,
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
					else
						text.deleteAllEffect(slot1:get("name"))
						text.addEffect(slot1:get("name"), {
							color = ui.COLORS.NORMAL.DEFAULT
						})
					end

					bind.click(slot0, slot1, {
						method = functools.partial(slot0.clickCell, slot2, slot3)
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabClick")
			}
		}
	},
	["centerPanel.mainPanel.fightAwardPanel.list"] = {
		varname = "fightAwardList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("fightAward"),
				item = bindHelper.self("itemFightAward"),
				sliderBg = bindHelper.self("fightAwardSliderBg"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				onBeforeBuild = function ()
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
				end,
				dataOrderCmp = function (slot0, slot1)
					return slot1.fightPointRequire < slot0.fightPointRequire
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot9 = "fightText"
					slot4 = slot1:multiget("iconList", "bg", "fightPoint", slot9)

					slot4.fightPoint:text(slot3.fightPointRequire)

					uv9 = "multiget"

					text.addEffect(slot4.fightText, {
						outline = {
							color = slot9[math.min(slot2, 4)]
						}
					})
					text.addEffect(slot4.fightPoint, {
						outline = {
							color = cc.c4b(255, 255, 64, 255)
						}
					})

					if slot2 < 4 then
						slot4.bg:texture(string.format("activity/fight_rank/box_panel_no%d.png", slot2))
					else
						slot4.bg:texture("activity/fight_rank/box_panel_no4.png")
					end

					uiEasy.createItemsToList(slot0, slot4.iconList, slot3.award)
				end
			}
		}
	},
	["centerPanel.mainPanel.rankAwardPanel.list"] = {
		varname = "rankAwardList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("rankReward"),
				item = bindHelper.self("itemRankAward"),
				sliderBg = bindHelper.self("rankAwardSliderBg"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				onBeforeBuild = function ()
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
				end,
				dataOrderCmp = function (slot0, slot1)
					return slot0.rank < slot1.rank
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("iconList", "bg", "iconPanel")

					if slot3.rank < 4 then
						slot4.iconPanel:get("rankIcon"):texture(string.format("activity/fight_rank/icon_no%d.png", slot3.rank))
						slot4.bg:texture(string.format("activity/fight_rank/box_panel_no%d.png", slot3.rank))
					else
						slot4.iconPanel:get("rankIcon"):hide()
						slot4.bg:texture("activity/fight_rank/box_panel_no4.png")
						bind.extend(slot0, slot4.iconPanel, {
							class = "text_atlas",
							props = {
								isEqualDist = false,
								align = "center",
								pathName = "frhd_num",
								data = slot2,
								onNode = function (slot0)
									slot0:x(slot0:x() + 110)
									slot0:y(slot0:y() + 116)
								end
							}
						})
					end

					uiEasy.createItemsToList(slot0, slot4.iconList, slot3.award)
				end
			}
		}
	},
	["centerPanel.mainPanel.rankPanel.list"] = {
		varname = "rankList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("fightRank"),
				item = bindHelper.self("itemRank"),
				sliderBg = bindHelper.self("rankSliderBg"),
				selfId = bindHelper.self("id"),
				rankIdler = bindHelper.self("rankIdler"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				onBeforeBuild = function ()
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
				end,
				dataOrderCmp = function (slot0, slot1)
					return slot1.fighting_point < slot0.fighting_point
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("iconPanel", "icon", "name", "vipIcon", "lv", "level", "fightPoint", "bg")
					slot5 = slot3.role

					slot4.name:text(slot5.name)
					slot4.level:text(slot5.level)
					slot4.lv:x(slot4.name:x() + 50)
					adapt.oneLinePos(slot4.lv, slot4.level, cc.p(5, -3), "left")

					if slot5.vip_level == 0 then
						slot4.vipIcon:hide()
					else
						slot4.vipIcon:texture(ui.VIP_ICON[slot5.vip_level])
					end

					slot4.fightPoint:text(slot3.fighting_point)
					bind.extend(slot0, slot4.icon, {
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot5.logo,
							frameId = slot5.frame
						}
					})
					adapt.oneLinePos(slot4.name, slot4.vipIcon, cc.p(10, 0))

					if slot2 < 4 then
						slot4.iconPanel:get("rankIcon"):texture(string.format("activity/fight_rank/icon_no%d.png", slot2))
						slot4.bg:texture(string.format("activity/fight_rank/box_panel_no%d.png", slot2))
					else
						slot4.iconPanel:get("rankIcon"):hide()
						slot4.bg:texture("activity/fight_rank/box_panel_no4.png")
						bind.extend(slot0, slot4.iconPanel, {
							class = "text_atlas",
							props = {
								isEqualDist = false,
								align = "center",
								pathName = "frhd_num",
								data = slot2,
								onNode = function (slot0)
									slot0:x(slot0:x() + 110)
									slot0:y(slot0:y() + 116)
								end
							}
						})
					end

					if slot0.selfId == slot3.role.id then
						slot0.rankIdler:set(slot2)
					end
				end
			}
		}
	},
	["centerPanel.spritePanel.list"] = {
		varname = "spriteList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				backupCached = false,
				data = bindHelper.self("skillData"),
				item = bindHelper.self("spriteItem"),
				sliderBg = bindHelper.self("spriteSliderBg"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				onBeforeBuild = function ()
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
				end,
				dataOrderCmp = function (slot0, slot1)
					if slot0.skillType2 == battle.MainSkillType.BigSkill then
						return false
					elseif slot1.skillType2 == battle.MainSkillType.BigSkill then
						return true
					end
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("icon", "name", "type", "note", "targetType", "richList", "bg")

					uiEasy.setSkillInfoToItems({
						name = slot4.name,
						icon = slot4.icon,
						type1 = slot4.type,
						type2 = slot4.note,
						target = slot4.targetType
					}, slot3)

					slot6, slot7 = beauty.textScroll({
						fontSize = 40,
						isRich = true,
						list = slot4.richList,
						strs = "#C0x5B545B#" .. eval.doMixedFormula(dataEasy.getSkillDesc(slot3), {
							skillLevel = 1,
							math = math
						})
					})
					slot8 = slot7 - slot6:size().height

					slot6:size(slot6:size().width, slot7)
					slot6:y(slot6:y() - slot8)
					slot4.bg:size(slot4.bg:size().width, slot4.bg:size().height + slot8)

					slot13 = slot1
					slot12 = slot1.size(slot13).height + slot8

					slot1:size(slot1:size().width, slot12)

					for slot12, slot13 in pairs(slot4) do
						slot13:y(slot13:y() + slot8)
					end
				end
			}
		}
	}
}

function slot2.initInfo(slot0)
	slot0.cfg = csv.yunying.yyhuodong[slot0.activityId]
	slot1 = slot0.cfg.paramMap.card
	slot0.cardInfo = csv.cards[slot1]
	slot0.unitCsv = csv.unit[slot0.cardInfo.unitID]
	slot3 = {}

	for slot7, slot8 in ipairs(dataEasy.getSortCardSkillList(slot1)) do
		table.insert(slot3, csv.skill[slot8])
	end

	slot0.skillData = slot3
	slot4 = slot0.cardArea:size()

	slot0.cardShow:texture(slot0.unitCsv.cardShow)

	slot6 = slot0.cardShow:size()

	slot0.cardShow:scale(math.min(slot4.width / slot6.width, slot4.height / slot6.height))
end

function slot2.onCreate(slot0, slot1, slot2)
	slot0.activityId = slot1
	slot0.yyEndtime = gGameModel.role:read("yy_endtime")
	slot0.id = gGameModel.role:read("id")
	slot0.dayStr = idler.new("00")

	slot0:initInfo()

	if slot2 then
		slot0.endTime = slot2.view.end_time
	end

	slot3 = {
		{
			id = 1,
			showRightIndex = true,
			name = gLanguageCsv.rankAward,
			view = slot0.rankAwardPanel
		},
		{
			id = 2,
			showRightIndex = true,
			name = gLanguageCsv.fightAward,
			view = slot0.fightAwardPanel
		},
		{
			id = 3,
			showRightIndex = true,
			name = gLanguageCsv.fightRankItem,
			view = slot0.rankPanel
		},
		{
			id = 4,
			showRightIndex = false,
			name = gLanguageCsv.spriteShow
		}
	}

	for slot8, slot9 in orderCsvPairs(csv.yunying.fightrankaward) do
		if slot9.huodongID == slot0.cfg.huodongID then
			table.insert({}, slot8, slot9)
		end
	end

	slot5 = {}

	for slot9, slot10 in orderCsvPairs(csv.yunying.fightpointaward) do
		if slot10.huodongID == slot0.cfg.huodongID then
			table.insert(slot5, slot9, slot10)
		end
	end

	slot0.subViews = {}
	slot0.tabDatas = idlers.newWithMap(slot3)
	slot0.rankReward = slot4
	slot0.fightAward = slot5
	slot0.fightRank = idlers.new()
	slot0.tabChooseId = idler.new(1)
	slot0.rankIdler = idler.new()
	slot0.fightPoint = gGameModel.role:getIdler("top6_fighting_point")

	slot0:resetTimeLabel()
	idlereasy.when(slot0.fightPoint, function (slot0, slot1)
		uv2 = "curFightPoint"

		slot2.curFightPoint:text(slot1)
	end)
	idlereasy.when(slot0.rankIdler, function (slot0, slot1)
		slot2 = slot1 and true or false
		uv3 = "rankFirst"
		slot3 = slot3.rankFirst
		slot3 = slot3.visible

		slot3(slot3, slot2)

		uv3 = "rankFirst"

		slot3.rankLast:visible(slot2)

		if not slot2 then
			uv3 = "rankFirst"
			slot3 = slot3.rankNumber
			slot4 = slot3
			slot5 = gLanguageCsv.noRank

			slot3.text(slot4, slot5)

			uv4 = "rankFirst"
			uv5 = "rankFirst"

			adapt.oneLinePos(slot4.randHead, slot5.rankNumber, cc.p(20, 0))
		else
			uv3 = "rankFirst"
			slot3 = slot3.rankNumber
			slot4 = slot3

			slot3.text(slot4, slot1)

			uv4 = "rankFirst"
			uv6 = "rankFirst"
			slot6 = slot6.rankFirst
			uv6 = "rankFirst"
			slot6 = slot6.rankNumber
			uv6 = "rankFirst"

			adapt.oneLinePos(slot4.randHead, {
				slot6,
				slot6,
				slot6.rankLast
			}, {
				cc.p(20, 0),
				cc.p(0, 0),
				cc.p(0, 0)
			})
		end
	end)
	slot0.tabChooseId:addListener(function (slot0, slot1)
		if slot1 then
			uv2 = "tabDatas"
			slot2 = slot2.tabDatas:atproxy(slot1)
			slot2.selected = false
			uv2 = "atproxy"

			if slot2[slot1].view then
				uv2 = "atproxy"

				slot2[slot1].view:hide()
			end
		end

		if slot0 then
			uv2 = "tabDatas"
			slot2 = slot2.tabDatas:atproxy(slot0)
			slot2.selected = true
			uv2 = "atproxy"

			if slot2[slot0] then
				if slot2.view then
					slot2.view:show()
				end

				slot3 = slot2.showRightIndex
				uv4 = "tabDatas"
				slot4 = slot4.spritePanel
				slot4 = slot4.visible

				slot4(slot4, not slot3)

				uv4 = "tabDatas"

				slot4.mainPanel:visible(slot3)
			end
		end
	end)
	text.addEffect(slot0.ruleBtn:get("text"), {
		outline = {
			color = cc.c4b(46, 168, 229, 255)
		}
	})

	slot8 = rich.createByStr(string.format(gLanguageCsv.fightRankBottomRichText, "#C0x5b545b#", "#C0x0f9932#", "#C0x5b545b#", "#C0xff794c#", "#C0x5b545b#"), 32)

	slot0.richText:add(slot8):text("")
	slot8:anchorPoint(0, 0.5):xy(0, 0)
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot2.updateRankData(slot0, slot1)
	gGameApp:requestServer("/game/yy/fightrank/get", function (slot0)
		uv1 = "fightRank"
		slot1 = slot1.fightRank
		slot1 = slot1.update

		slot1(slot1, slot0.view.rank)

		uv1 = "fightRank"
		slot1.endTime = slot0.view.end_time
		uv1 = "fightRank"
		slot1 = slot1.resetTimeLabel

		slot1(slot1)

		uv1 = "update"

		if slot1 then
			uv1 = "update"

			slot1()
		end
	end, slot0.activityId)
end

function slot2.onTabClick(slot0, slot1, slot2, slot3)
	if slot2 == 3 then
		sdk.trackEvent("event_powerrank")
		slot0:updateRankData(function ()
			uv0 = "tabChooseId"
			uv2 = "set"

			slot0.tabChooseId:set(slot2)
		end)
	else
		slot0.tabChooseId:set(slot2)
	end
end

function slot2.resetTimeLabel(slot0)
	slot2 = slot0.dayLabel

	text.addEffect(slot0.timeLabel, {
		outline = {
			color = cc.c4b(255, 129, 38, 255)
		}
	})

	if not slot0.endTime then
		slot0.endTime = time.getNumTimestamp(slot0.cfg.endDate, 21, 30) - 86400
	end

	function ()
		uv0 = "endTime"

		if slot0.endTime - time.getTime() <= 0 then
			uv1 = "time"
			slot1 = slot1.text

			slot1(slot1, gLanguageCsv.activityOver)

			uv1 = "endTime"

			slot1.dayStr:set("00")

			return false
		end

		if checkLanguage("cn") then
			uv2 = "endTime"

			slot2.dayStr:set(tostring(time.getCutDown(slot0).day))
		else
			uv2 = "endTime"

			slot2.dayStr:set("")
		end

		uv2 = "time"
		slot2 = slot2.text

		slot2(slot2, string.format(gLanguageCsv.fightRankTimeFMT, slot1.day, slot1.hour, slot1.min, slot1.sec))

		uv2 = "time"

		slot2:x(1950)

		return true
	end()

	slot4 = 1

	slot0:enableSchedule():unSchedule(slot4)
	slot0:schedule(function ()
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
	end, 1, 1, slot4)
end

function slot2.onShowRule(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot2.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.fightRankRuleTitle)
		end),
		slot2.noteText(55001, 55005)
	}
end

return slot2
