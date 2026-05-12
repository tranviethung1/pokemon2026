slot1 = class("CloneBattleRoomView", cc.load("mvc").ViewBase)
slot2 = {
	binds = {
		event = "effect",
		data = {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		}
	}
}
slot1.RESOURCE_FILENAME = "clone_battle_room.json"
slot1.RESOURCE_BINDING = {
	["rightPanel.topPanel.textTime"] = "textCd",
	["leftPanel.spriteArea.item"] = "sprItem",
	["rightPanel.topPanel.textNote"] = "timeNote",
	["rightPanel.centerPanel.normalItem"] = "normalItem",
	["rightPanel.centerPanel"] = "centerPanel",
	["rightPanel.topPanel.list"] = "attrList",
	["rightPanel.topPanel.item"] = "attrItem",
	["leftPanel.awardArea.item"] = "awardItem",
	["leftPanel.textPanel"] = "textPanel",
	["rightPanel.topPanel.img"] = "topImg",
	["rightPanel.centerPanel.mainItem"] = "mainItem",
	["leftPanel.natureArea"] = "natureArea",
	["rightPanel.centerPanel.btnJoinItem"] = "btnJoinItem",
	["leftPanel.btnRule"] = {
		varname = "btnRule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRule")
			}
		}
	},
	["leftPanel.btnRule.text"] = slot2,
	["leftPanel.btnRecord"] = {
		varname = "btnRecord",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onRecord")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = {
						"cloneBattleHistory"
					}
				}
			}
		}
	},
	["leftPanel.btnRecord.text"] = slot2,
	["leftPanel.spriteArea.text"] = slot2,
	["leftPanel.spriteArea.list"] = {
		varname = "sprList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("monstersData"),
				item = bindHelper.self("sprItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.cfg
					slot6 = slot1:get("baseNode"):multiget("selected", "rarity", "bg", "text", "img", "maskLock", "maskOutBox")

					slot6.rarity:texture(ui.RARITY_ICON[slot4.rarity])
					adapt.setTextScaleWithWidth(slot6.text, slot4.name, 300)
					text.addEffect(slot6.text, {
						outline = {
							color = ui.COLORS.OUTLINE.WHITE
						}
					})
					slot6.img:texture(slot4.cardIcon2)
					slot6.selected:visible(slot3.selected)

					slot7 = slot3.selected and 1.1 or 1

					slot1:scale(slot7, 1)
					slot5:scale(1, slot7)

					if not slot3.selected then
						slot6.maskOutBox:visible(not slot3.inBox)
						slot6.maskLock:visible(slot3.inBox and slot3.locked)

						if slot3.inBox then
							bind.touch(slot0, slot1, {
								methods = {
									ended = functools.partial(slot0.clickCell, slot2, slot3)
								}
							})
						end
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTargetClick")
			}
		}
	},
	["leftPanel.awardArea.list"] = {
		varname = "awardList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("awardData"),
				item = bindHelper.self("awardItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							data = slot3
						}
					})
				end
			}
		}
	},
	["rightPanel.topPanel.attrText"] = {
		varname = "attrText",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["rightPanel.topPanel.text"] = {
		varname = "topText",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["rightPanel.bottomPanel.btnQuit"] = {
		varname = "btnQuit",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onQuitRoom")
			}
		}
	},
	["rightPanel.bottomPanel.btnRefresh"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRefresh")
			}
		}
	},
	["rightPanel.bottomPanel.btnKick"] = {
		varname = "btnKick",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onKick")
			}
		}
	},
	["rightPanel.bottomPanel.btnChallenge"] = {
		varname = "btnChallenge",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChallange")
			}
		}
	},
	["rightPanel.bottomPanel.btnQuit.text"] = slot2,
	["rightPanel.bottomPanel.btnRefresh.text"] = slot2,
	["rightPanel.bottomPanel.btnChallenge.text"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightPanel.bottomPanel.btnRobot"] = {
		varname = "btnRobot",
		binds = {
			event = "click",
			method = bindHelper.self("onRobotEnable")
		}
	}
}

function slot4(slot0, slot1, slot2, slot3)
	slot4 = 0
	slot6 = function ()
		uv1 = "type"

		if type(slot1) == "string" then
			uv0 = "string"
			uv1 = "type"

			return slot0[slot1]
		else
			uv0 = "type"

			return slot0
		end
	end()
	slot7 = slot6:get("text"):text()

	slot0:enableSchedule():schedule(function ()
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
	end, 0.1, 0, slot6:name() .. slot6:tag())
end

function slot1.onCreate(slot0, slot1)
	slot0.cloneBattleWorningSee = userDefault.getForeverLocalKey("cloneBattleWorningSee", false)
	slot0.baseView = slot1
	slot0.manberCount = 1

	gGameModel.forever_dispatch:getIdlerOrigin("cloneBattleLookHistory"):set(0)
	slot0:initModel()

	slot2 = rich.createByStr(gLanguageCsv.elementChallengeTips, 40):addTo(slot0.textPanel, 10):anchorPoint(cc.p(0.5, 0.5))

	slot0:initCountDown()
end

function slot1.initModel(slot0)
	slot0.beasIdler = {
		natureId = gGameModel.clone_room:getIdler("nature_id"),
		roomLeader = gGameModel.clone_room:getIdler("leader"),
		roomId = gGameModel.clone_room:getIdler("id"),
		date = gGameModel.clone_room:getIdler("date"),
		finishNum = gGameModel.clone_room:getIdler("finish_num"),
		monsters = gGameModel.clone_room:getIdler("monsters"),
		places = gGameModel.clone_room:getIdler("places"),
		fast = gGameModel.clone_room:getIdler("fast"),
		discard = gGameModel.clone_room:getIdler("discard"),
		createTime = gGameModel.clone_room:getIdler("create_time"),
		voteRound = gGameModel.clone_room:getIdler("vote_round")
	}
	slot0.pokedex = gGameModel.role:getIdler("pokedex")
	slot0.monstersData = idlertable.new({})
	slot0.monsterCur = idler.new(1)
	slot0.awardData = idlertable.new({})

	idlereasy.when(slot0.beasIdler.natureId, function (slot0, slot1)
		slot2 = game.NATURE_TABLE[slot1]
		slot4 = gLanguageCsv.natureRoom
		uv4 = "game"
		slot4 = slot4.topText
		slot4 = slot4.text

		slot4(slot4, gLanguageCsv[slot2] .. slot4)

		uv4 = "game"
		slot4 = slot4.topImg
		slot4 = slot4.texture

		slot4(slot4, string.format("city/adventure/clone_battle/bg_yuansu_%s.png", slot2))

		uv4 = "game"
		slot4 = slot4.topText
		slot5 = slot4
		slot4 = slot4.size(slot5)
		uv5 = "game"
		slot5 = slot5.topImg
		slot6 = slot5
		slot8 = slot4.width + 40

		slot5.size(slot6, cc.size(slot8, slot4.height + 13))

		slot5 = adapt.oneLinePos
		uv6 = "game"
		uv8 = "game"
		slot8 = slot8.timeNote
		uv8 = "game"
		slot9 = "left"

		slot5(slot6.topImg, {
			slot8,
			slot8.textCd
		}, cc.p(5, 0), slot9)

		uv5 = "game"
		slot5 = slot5.natureArea:size()
		slot6 = csv.clone.nature[slot1]
		uv9 = "game"
		slot8 = widget.addAnimation(slot9.natureArea, slot6.spine, "effect2_" .. slot1 .. "_loop", 1):scale(3)
		slot8 = slot8.xy

		slot8(slot8, slot5.width / 2, slot5.height / 2 + 40)

		uv8 = "game"

		slot8:resetAttrList(slot6.recommendAttr)
	end)
	idlereasy.when(slot0.beasIdler.roomLeader, function (slot0, slot1)
		uv2 = "isLeader"
		slot2.isLeader = slot1 == gGameModel.role:read("id")
	end)
	idlereasy.any({
		slot0.beasIdler.places,
		slot0.beasIdler.voteRound,
		slot0.beasIdler.fast
	}, function (slot0, slot1, slot2, slot3)
		slot6 = "id"
		slot5 = {}
		uv6 = "gGameModel"
		slot6.battleCards = {}
		uv6 = "gGameModel"
		slot6.manberCount = 0

		for slot9 = 1, 5 do
			uv10 = "gGameModel"

			slot10.centerPanel:get("pleace" .. slot9):removeAllChildren()

			if slot1[slot9] then
				slot13 = gGameModel.role:read(slot6) == slot11.id

				if slot9 == 1 then
					uv14 = "gGameModel"

					if not slot14.mainItem then
						uv14 = "gGameModel"
						slot14 = slot14.normalItem
					end
				end

				uv15 = "gGameModel"
				uv16 = "gGameModel"
				slot15.manberCount = slot16.manberCount + 1
				slot5[slot11.id] = true
				slot15 = slot14:clone()
				slot14 = slot15
				uv15 = "gGameModel"

				slot15:setItem(slot10, slot14, slot9, slot11, slot13)
				slot14:get("selfCheck"):visible(slot13)

				if slot13 then
					uv15 = "gGameModel"

					slot15:initSelfInfo(slot11)
				end

				if slot12 then
					uv15 = "gGameModel"
					slot15.radioJoin = slot14:get("radioJoin")
					uv15 = "gGameModel"
					slot15.btnUnionInvited = slot14:get("btnUnionInvited")
					uv15 = "gGameModel"
					slot17 = slot14
					slot16 = slot14.get(slot17, "btnWorldInvited")
					slot15.btnWorldInvited = slot16
					uv16 = "gGameModel"
					uv17 = "gGameModel"
					slot17 = slot17.radioJoin
					uv21 = "gGameModel"
					slot21 = slot21.onFastJoin
					uv22 = "gGameModel"

					bind.touch(slot16, slot17, {
						methods = {
							ended = functools.partial(slot21, slot22)
						}
					})

					uv16 = "gGameModel"
					uv17 = "gGameModel"
					slot17 = slot17.btnWorldInvited
					uv21 = "gGameModel"
					slot21 = slot21.onWorldInvite
					uv22 = "gGameModel"

					bind.touch(slot16, slot17, {
						methods = {
							ended = functools.partial(slot21, slot22, "btnWorldInvited")
						}
					})

					uv16 = "gGameModel"
					uv17 = "gGameModel"
					uv21 = "gGameModel"
					uv22 = "gGameModel"

					bind.touch(slot16, slot17.btnUnionInvited, {
						methods = {
							ended = functools.partial(slot21.onUnionInvite, slot22, "btnUnionInvited")
						}
					})

					if slot2 == "start" then
						uv15 = "gGameModel"

						if slot15.isLeader then
							slot14:get("warnIcon1"):show()
							slot14:get("warnIcon2"):show()
							slot14:get("warnIcon"):show()
							slot14:get("icon"):hide()
						end
					else
						slot14:get("warnIcon1"):hide()
						slot14:get("warnIcon2"):hide()
						slot14:get("warnIcon"):hide()
						slot14:get("icon"):show()
					end
				end
			else
				uv12 = "gGameModel"
				slot12 = slot12.btnJoinItem:clone()
				slot13 = slot10:size()

				slot12:show()

				slot14 = slot12:addTo(slot10)
				slot15 = slot14

				slot14.xy(slot15, slot13.width / 2, slot13.height / 2)

				uv15 = "gGameModel"
				uv20 = "gGameModel"
				uv21 = "gGameModel"

				bind.touch(slot15, slot12, {
					methods = {
						ended = functools.partial(slot20.onPosItemClick, slot21, slot12, data)
					}
				})
			end
		end

		uv6 = "gGameModel"
		slot6 = slot6.refreshTimeLabel

		slot6(slot6)

		uv6 = "gGameModel"
		slot6.roleIdInRoom = slot5
		uv6 = "gGameModel"

		slot6.radioJoin:get("radio.img"):visible(not slot3)
	end)
	idlereasy.when(slot0.beasIdler.voteRound, function (slot0, slot1)
		uv2 = "isLeader"

		if slot2.isLeader then
			if slot1 == "start" then
				uv2 = "isLeader"

				if slot2.cloneBattleWorningSee == false then
					gGameUI:showDialog({
						btnType = 1,
						title = "",
						isRich = true,
						content = "#C0x5b545b#" .. gLanguageCsv.cloneBattleKickWorningTip
					})
					userDefault.setForeverLocalKey("cloneBattleWorningSee", true)
				end
			elseif slot1 ~= "start" then
				userDefault.setForeverLocalKey("cloneBattleWorningSee", false)
			end
		end
	end)
	idlereasy.any({
		slot0.pokedex,
		slot0.beasIdler.monsters,
		slot0.monsterCur
	}, function (slot0, slot1, slot2, slot3)
		slot4 = {
			[csv.cards[slot8].cardMarkID] = true
		}

		for slot8, slot9 in pairs(slot1) do
			-- Nothing
		end

		slot5 = {
			[slot9] = {
				selected = false,
				unitId = slot13,
				cardId = slot11,
				inBox = slot17,
				cfg = csv.unit[slot12.unitID] or csv.unit[1],
				locked = slot17.curMonsterLock
			}
		}

		for slot9, slot10 in pairs(slot2) do
			slot17 = slot4[csv.cards[csv.clone.monster[slot10].cardID].cardMarkID] and true or false
			uv17 = "pairs"

			if slot3 == slot9 and slot4[slot14] then
				slot16 = slot5[slot9]
				slot16.selected = true
				uv16 = "pairs"
				slot16.cardName = slot15.name
			elseif slot3 == slot9 then
				slot3 = math.min(slot3 + 1, #slot2)
			end
		end

		uv6 = "pairs"
		slot6 = slot6.monsterCur
		slot6 = slot6.set

		slot6(slot6, slot3)

		uv6 = "pairs"

		slot6.monstersData:set(slot5)
	end)
	idlereasy.when(slot0.monsterCur, function (slot0, slot1)
		uv2 = "beasIdler"
		slot3 = dataEasy.getItemData(csv.clone.monster[slot2.beasIdler.monsters:read()[slot1]].extraAward) or {}
		uv4 = "beasIdler"
		slot4 = slot4.awardData
		slot5 = slot4

		slot4.set(slot5, slot3)

		slot4 = #slot3
		uv5 = "beasIdler"
		slot5 = slot5.awardItem
		slot6 = slot5
		slot5 = slot5.size(slot6)
		uv6 = "beasIdler"
		slot9 = (slot4 - 1) * 20
		slot8 = slot4 * slot5.width + slot9
		uv9 = "beasIdler"
		slot9 = slot9.awardList
		slot9 = slot9.size
		slot11 = slot8

		slot9(slot9, slot11, slot5.height)

		uv9 = "beasIdler"
		uv11 = "beasIdler"

		slot9.awardList:x(slot11.awardList:x() - (slot8 - slot6.awardList:size().width) / 2)
	end)
	idlereasy.any({
		slot0.beasIdler.places,
		slot0.beasIdler.voteRound
	}, function (slot0, slot1, slot2)
		slot4 = 0

		for slot8, slot9 in pairs(slot1) do
			if slot9.id == gGameModel.role:read("id") then
				slot4 = slot9.play
			end
		end

		if slot2 == "start" and slot4 >= 3 then
			uv5 = "gGameModel"

			slot5.btnKick:show()
		else
			uv5 = "gGameModel"

			slot5.btnKick:hide()
		end
	end)
	slot0:enableSchedule():schedule(function (slot0)
		uv1 = "refreshTimeLabel"

		if slot1:refreshTimeLabel() then
			uv1 = "refreshTimeLabel"
			uv3 = "enableSchedule"

			slot1:enableSchedule():unSchedule(slot3)
		end
	end, 1, nil, "Time_Robot_Schedule")
end

function slot1.refreshTimeLabel(slot0)
	slot2 = time.getTime()
	slot3 = slot2 - slot0.beasIdler.createTime:read()

	if time.getNumTimestamp(time.getTodayStrInClock(), 12, 0) - slot2 < 0 then
		slot5 = slot5 + 86400
	end

	slot8 = slot0.manberCount >= 5
	slot9 = slot3 >= gCommonConfigCsv.cloneRobotTime * 60 or slot5 <= gCommonConfigCsv.cloneRobotRefreshTime * 60

	slot0.btnRobot:visible(slot9 and not slot8)
	gGameModel.forever_dispatch:getIdlerOrigin("cloneBattleLookRobot"):set(slot9 or slot8)

	return slot9
end

function slot1.setItem(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot1:size()

	slot2:addTo(slot1):xy(slot6.width / 2, slot6.height / 2)
	slot2:show()
	slot2:get("name"):text(slot4.name)

	if slot4.monster == -1 then
		slot2:get("playPanel.ready"):show()
	elseif slot4.play >= 3 then
		slot2:get("playPanel.complete"):show()
	else
		slot2:get("playPanel.fighting"):show()
		slot2:get("playPanel.fighting.text"):text(string.format(gLanguageCsv.challengeTime, slot4.play, 3))
		adapt.setTextScaleWithWidth(slot2:get("playPanel.fighting.text"), nil, 290)
	end

	slot7 = slot4.card
	slot8 = slot4.time
	slot9 = slot4.play

	bind.extend(slot0, slot2:get("sprImg"), {
		class = "card_icon",
		props = {
			unitId = dataEasy.getUnitId(slot7.card_id, slot7.skin_id),
			star = slot7.star,
			rarity = csv.unit[csv.cards[slot7.card_id].unitID].rarity,
			dbid = slot4.card.id,
			onNodeClick = function ()
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
			onNode = function (slot0)
				slot3 = 0.5

				slot0:anchorPoint(slot3, 0.5)

				uv3 = "anchorPoint"
				slot3 = slot3:get("sprImg")
				slot4 = slot3
				uv4 = "anchorPoint"

				slot0:xy(slot3.width(slot4) / 2, slot4:get("sprImg"):height() / 2)
			end
		}
	})

	slot13 = slot2:get("text1")
	slot14 = slot2:get("text2")

	slot14:text(slot7.fighting_point)

	slot15, slot16 = slot13:xy()
	slot17, slot18 = slot14:xy()

	adapt.oneLineCenterPos(cc.p(slot6.width / 2, (slot16 + slot18) / 2), {
		slot13,
		slot14
	}, cc.p(10, 0))

	slot0.battleCards[slot7.id] = slot7
end

function slot1.initSelfInfo(slot0, slot1)
	slot2 = slot1.play < 3

	cache.setShader(slot0.btnChallenge, false, slot2 and "normal" or "hsl_gray")
	slot0.btnChallenge:setTouchEnabled(slot2)
	slot0.btnChallenge:get("text"):text(slot2 and gLanguageCsv.startChallenge or gLanguageCsv.complete)
	adapt.setTextScaleWithWidth(slot0.btnChallenge:get("text"), nil, 280)

	if slot1.monster ~= -1 then
		for slot7, slot8 in pairs(slot0.beasIdler.monsters:read()) do
			if slot8 == slot1.monster then
				slot0.monsterCur:set(slot7)

				break
			end
		end

		slot0.btnQuit:visible(false)

		slot0.curMonsterLock = true
	end

	slot0.canBattle = slot2
	slot0.monster = slot1.monster
	slot0.curCardId = slot1.card.id
	slot0.battle_deploy = {}

	for slot6, slot7 in pairs(slot1.battle_deploy or {}) do
		slot0.battle_deploy[slot7] = slot6
	end

	slot0.need_robot = slot1.need_robot

	slot0.btnRobot:get("img"):visible(slot1.need_robot == true)
end

function slot1.onQuitRoom(slot0)
	gGameApp:requestServer("/game/clone/room/quit", function (slot0)
		uv1 = "baseView"

		slot1.baseView:refreshView(slot0.view)
	end)
end

function slot1.onRefresh(slot0)
	slot0.baseView:refresh()
end

function slot1.onChallange(slot0)
	function slot1()
		slot0 = {
			[slot7] = slot6
		}
		slot1 = {
			[slot8.id] = slot8
		}
		uv3 = "clone"
		slot2 = clone(slot3.battleCards)
		uv4 = "clone"

		for slot6, slot7 in pairs(slot4.battle_deploy) do
			if slot2[slot6] then
				slot2[slot6] = nil
			end
		end

		function slot3(slot0)
			for slot4 = 1, 6 do
				uv5 = "next"

				if not slot5[slot4] then
					slot5, slot6 = next(slot0)

					if slot5 and slot6 then
						uv7 = "next"
						slot7[slot4] = slot5
						uv7 = "id"
						slot7[slot6.id] = slot6
						slot0[slot5] = nil
					end
				end
			end
		end

		uv4 = "clone"

		slot4:sendServerRequest("/game/clone/battle/deploy/enter", nil, function (slot0)
			slot2 = slot0.robots
			uv2 = "clone"
			uv3 = "robots"

			slot2(slot3)

			uv2 = "clone"

			slot2(clone(slot2))

			uv8 = "gGameUI"
			slot9 = slot8
			uv9 = "stackUI"
			uv9 = "city.card.embattle.clone_battle"

			gGameUI:stackUI("city.card.embattle.clone_battle", nil, {
				full = true
			}, {
				fightCb = slot8.createHandler(slot9, "startFighting"),
				inputCards = idlertable.new(slot9),
				inputCardAttrs = idlertable.new(slot9)
			})
		end)
	end

	if not slot0.curMonsterLock then
		gGameUI:showDialog({
			btnType = 2,
			clearFast = true,
			strs = string.format(gLanguageCsv.cloneBattleFightTip, slot0.cardName),
			cb = function ()
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
			end
		})
	else
		slot1()
	end
end

function slot1.startFighting(slot0, slot1, slot2)
	slot3 = slot0.beasIdler.monsters:read()[slot0.monsterCur:read()]
	slot4 = slot2:read() or {}

	if not slot2 then
		for slot8 = 1, 6 do
			slot4[slot8] = slot0.battleCards[slot8] and slot0.battleCards[slot8].id or ""
		end
	end

	slot0:disableSchedule()
	battleEntrance.battleRequest("/game/clone/battle/start", slot3, slot4):onStartOK(function (slot0)
		uv1 = "onClose"

		if slot1 then
			uv1 = "onClose"

			slot1:onClose(false)

			uv0 = nil
		end
	end):onRequestCustom(function (slot0)
		slot0:onErrClose(function ()
			uv0 = "onClose"

			if slot0 then
				uv0 = "onClose"

				slot0:onClose()

				uv0 = nil
			end

			uv0 = "safeCall"
			uv1 = "onRefresh"

			slot0.safeCall(slot1, "onRefresh")
		end)
	end):show()
end

function slot1.resetAttrList(slot0, slot1)
	slot0.attrList:removeAllChildren()

	slot2 = csvSize(slot1)
	slot3 = slot0.attrItem:size().width
	slot4 = slot0.attrItem:size().height

	for slot8, slot9 in orderCsvPairs(slot1) do
		slot10 = slot0.attrItem:clone()

		slot10:get("img"):texture(ui.ATTR_ICON[slot9])
		slot0.attrList:insertCustomItem(slot10, 0)
	end

	slot0.attrList:size(cc.size(slot3 * slot2, slot4))
	adapt.oneLinePos(slot0.attrList, slot0.attrText, cc.p(10, 0), "right")
end

function slot1.onFastJoin(slot0)
	if not slot0.isLeader then
		gGameUI:showTip(gLanguageCsv.isNotLeader)

		return
	end

	slot0:sendServerRequest("/game/clone/room/join/fast/enable", nil, function (slot0)
	end, not slot0.beasIdler.fast:read())
end

function slot1.onWorldInvite(slot0, slot1)
	if not slot0.isLeader then
		gGameUI:showTip(gLanguageCsv.isNotLeader)

		return
	end

	slot0:sendServerRequest("/game/clone/invite", nil, function ()
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
	end, "world")
end

function slot1.onUnionInvite(slot0, slot1)
	if not slot0.isLeader then
		gGameUI:showTip(gLanguageCsv.isNotLeader)

		return
	end

	slot0:sendServerRequest("/game/clone/invite", nil, function ()
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
	end, "union")
end

function slot1.onPosItemClick(slot0, slot1, slot2)
	if not slot0.isLeader then
		gGameUI:showTip(gLanguageCsv.isNotLeader)

		return
	end

	slot0:sendServerRequest("/game/clone/friend/online/list", nil, function (slot0)
		slot1 = clone(slot0.view.roles)

		for slot6 = 1, slot0.view.size do
			uv8 = "clone"

			if slot8.roleIdInRoom[slot1[slot6].id] then
				slot1[slot6] = nil
				slot2 = slot2 - 1
			end
		end

		uv9 = "clone"

		gGameUI:stackUI("city.adventure.clone_battle.invite", nil, , {
			roles = slot1,
			size = slot2
		}, slot9:createHandler("inviteFunc"))
	end)
end

function slot1.inviteFunc(slot0, slot1, slot2, slot3)
	slot0:sendServerRequest("/game/clone/invite", function ()
		uv0 = "onCloseFast"

		if slot0 then
			uv0 = "onCloseFast"

			slot0:onCloseFast()
		end

		uv0 = "onRefresh"

		slot0:onRefresh()
	end, function ()
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
	end, "friend", {
		id = slot1.id,
		level = slot1.level,
		logo = slot1.logo,
		name = slot1.name,
		vip = slot1.vip_level,
		frame = slot1.frame
	})
end

function slot1.onRobotEnable(slot0)
	slot0:sendServerRequest("/game/clone/room/robot/enable", nil, function (slot0)
		uv1 = "gGameUI"

		if slot1 then
			gGameUI:showTip(gLanguageCsv.cloneRobotTextOn)
		else
			gGameUI:showTip(gLanguageCsv.cloneRobotTextOff)
		end
	end, not slot0.need_robot)
end

function slot1.onSpriteClick(slot0, slot1, slot2, slot3, slot4)
	if slot3 then
		gGameUI:createView("city.adventure.clone_battle.choose", slot0):init(slot0.curCardId)

		return
	end

	slot5, slot6 = slot1:xy()
	slot7 = slot1:getParent():convertToWorldSpace(cc.p(slot5, slot6))
	slot7.x = slot7.x - 1000
	slot8 = 0

	if slot4 == 1 or slot0.isLeader then
		slot8 = slot4
	end

	gGameUI:stackUI("city.chat.personal_info", nil, , slot7, {
		role = slot2
	}, {
		isKickNum = slot8,
		isLeader = slot0.isLeader
	})
end

function slot1.onTargetClick(slot0, slot1, slot2, slot3)
	if slot0.curMonsterLock then
		gGameUI:showTip(gLanguageCsv.cloneMonsterCannotChoose)

		return
	end

	if slot0.monsterCur:read() ~= slot2 and slot3.inBox then
		slot0.monsterCur:set(slot2)
	end
end

function slot1.onRule(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext
	slot3 = {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.cloneBattleRuleTitle)
		end),
		slot2.noteText(111),
		slot2.noteText(62001, 62010)
	}

	if dataEasy.isUnlock(gUnlockCsv.cloneBattleKick) then
		table.insert(slot3, slot2.noteText(150))
		table.insert(slot3, slot2.noteText(105001, 105010))
	end

	return slot3
end

function slot1.sendServerRequest(slot0, slot1, slot2, slot3, ...)
	gGameApp:requestServerCustom(slot1):onErrClose(slot2 or function ()
		uv0 = "onRefresh"

		slot0:onRefresh()
	end):params(...):doit(slot3)
end

function slot1.onRecord(slot0)
	slot2 = {}

	for slot6, slot7 in ipairs(gGameModel.clone_room:read("history") or {}) do
		table.insert(slot2, {
			time = slot7.time,
			name = slot7.name,
			type = slot7.type % 7 == 0 and 7 or slot7.type % 7
		})
	end

	gGameUI:stackUI("city.adventure.clone_battle.history", nil, , {
		historyTab = slot2,
		refreshNumber = slot0.refreshNumber
	})
end

function slot1.initCountDown(slot0)
	slot1 = slot0.textCd
	slot3 = time.getNumTimestamp(time.getTodayStrInClock(12), 12) + 86400

	function slot4()
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
	end

	slot0:enableSchedule()
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
	end, 1, 0, 1)
end

function slot1.onKick(slot0)
	gGameUI:stackUI("city.adventure.clone_battle.vote", nil, {
		clickClose = true
	})
end

return slot1
