slot0 = class("ActivitySeekpokemonDialog", Dialog)
slot0.RESOURCE_FILENAME = "activity_seekpokemon.json"
slot0.RESOURCE_BINDING = {
	passTitle = "passTitle",
	["awardPanel.subList"] = "itemList",
	listMask = "listMask",
	bg = "bg",
	awardPanel = "awardPanel",
	title = "title",
	time = "time",
	cardShow = "cardShow",
	text1 = "text1",
	txt2 = "txt2",
	text2 = "text2",
	subList = "subList",
	item = "item",
	hint = "hint",
	["awardPanel.itemTitle"] = "itemTitle",
	["drawPanel.btnDrawTen.textNote"] = "textNote",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "cardList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 4,
				data = bindHelper.self("pokemonData"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):visible(slot3.use)
					slot1:get("panel"):visible(not slot3.use)
					slot1:get("mask"):visible(not slot3.use)

					if slot3.use then
						slot1:get("icon"):texture(csv.unit[slot3.unitId].iconSimple)
						slot1:get("bg"):texture("activity/seekpokemon/btn_zm.png")
					else
						slot1:get("bg"):texture("activity/seekpokemon/" .. ("img_" .. slot3.key) .. ".png")
					end

					bind.click(slot0, slot1, {
						method = functools.partial(slot0.itemClick, slot1, slot3.key, slot3)
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	["awardPanel.list"] = {
		varname = "lsitAward",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("awardData"),
				item = bindHelper.self("itemList"),
				title = bindHelper.self("itemTitle"),
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.data then
						uiEasy.createItemsToList(slot0, slot1, slot3.data, {
							scale = 0.7
						})
					else
						slot4 = slot0.title:clone():show()

						slot4:get("title"):text(slot3.desc)
						slot1:height(slot4:height())
						slot4:get("title"):y(slot4:get("title"):y() + slot1:height() - slot4:height())
						slot1:pushBackCustomItem(slot4)
						slot1:setScrollBarEnabled(false)
					end
				end,
				onAfterBuild = function (slot0)
					slot0:setScrollBarEnabled(false)
				end
			}
		}
	},
	["awardPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:showHideAwardPanel(false)
				end)
			}
		}
	},
	drawPanel = {
		varname = "drawPanel",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("getdrawNum")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "seekpokemon",
					listenData = {
						activityId = bindHelper.self("id")
					},
					onNode = function (slot0)
						slot0:xy(400, 230)
					end
				}
			}
		}
	},
	award = {
		varname = "award",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:showHideAwardPanel(true)
				end)
			}
		}
	},
	rule = {
		varname = "rule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRules")
			}
		}
	},
	perview = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPerview")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.activityId = slot1
	slot0.id = idler.new(slot1)
	slot0.huodongID = csv.yunying.yyhuodong[slot0.activityId].huodongID
	slot0.timeout = false
	slot0.pokemonData = idlers.new()
	slot0.awardData = idlers.new()

	slot0:initModel()
	slot0:initData()
	slot0:setTimeLabel()
	text.addEffect(slot0.textNote, {
		outline = {
			size = 4,
			color = cc.c4b(204, 106, 8, 255)
		}
	})
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot0.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot0.initData(slot0)
	for slot6, slot7 in orderCsvPairs(csv.yunying.seekpokemon_award) do
		if slot0.huodongID == slot7.huodongID then
			slot2 = 0 + 1
		end
	end

	slot0.cfgAward = {
		[slot6] = slot7
	}
	slot0.cfgSize = slot2
	slot3 = nil

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityId"
		slot2 = slot1[slot2.activityId]
		uv3 = "activityId"
		slot3.data = slot2
		uv3 = "activityId"

		slot3.drawPanel:get("costInfo.textCost"):text(slot2.info.flop_times .. gLanguageCsv.times)

		slot6 = 30
		uv6 = "activityId"
		slot6 = slot6.drawPanel:get("costInfo.textNote")
		uv6 = "activityId"

		adapt.oneLineCenterPos(cc.p(120, slot6), {
			slot6,
			slot6.drawPanel:get("costInfo.textCost")
		}, cc.p(10, 0))

		uv4 = "activityId"
		slot4 = slot4.award:get("hint")
		slot4 = slot4.texture

		slot4(slot4, "activity/seekpokemon/" .. (itertools.size(slot2.seek_pokemon.flop) > 8 and "txt_8cyw" or "txt_8cyn") .. ".png")

		uv4 = "activityId"
		slot4.checkpoint = slot2.info.round_count
		uv4 = "activityId"
		uv5 = "activityId"
		slot5.pass = slot4.cfgSize == slot2.info.round_count
		uv5 = "data"

		if not slot5 then
			uv1 = true
			uv5 = "activityId"
			slot5 = slot5.initPolemon

			slot5(slot5, slot2)

			uv5 = "activityId"

			slot5:initCorrespondingAward()
		end
	end)
end

function slot0.initPolemon(slot0, slot1)
	slot0.passTitle:visible(slot0.pass)
	slot0.listMask:visible(not slot0.pass)
	slot0.txt2:text(gLanguageCsv.seekpokemonRule)
	slot0.passTitle:text(gLanguageCsv.seekpokemonFinish)

	if slot0.pass then
		slot0.drawPanel:hide()
		slot0.text1:hide()
		slot0.text2:hide()
		slot0.txt2:hide()
		slot0.award:hide()
		slot0.cardList:removeAllChildren()
		slot0.cardShow:texture("activity/seekpokemon/icon.png")
		slot0.cardShow:scale(2)
		slot0.cardShow:y(389)

		return
	end

	slot3 = csv.unit[slot1.info.target_pokemon]

	slot0.cardShow:texture(slot3.cardShow)
	slot0.cardShow:scale(2)
	slot0.cardShow:y(250)
	slot0.text1:text(string.format(gLanguageCsv.roundNumber, math.min(slot1.info.round_count + 1, slot0.cfgSize)) .. ":")
	slot0.text2:text("[" .. slot3.name .. "]")

	slot9 = 20
	slot10 = 0

	adapt.oneLineCenterPos(cc.p(slot0.title:x(), slot0.text1:y()), {
		slot0.text1,
		slot0.text2
	}, cc.p(slot9, slot10))

	slot5 = {
		[slot10] = true
	}

	for slot9, slot10 in ipairs(slot1.seek_pokemon.flop) do
		-- Nothing
	end

	for slot10 = 1, 16 do
	end

	slot0.pokemonData:update({
		[slot10] = {
			use = slot5[slot10] or false,
			unitId = slot1.seek_pokemon.pokemon_random[slot10],
			key = slot10
		}
	})
end

function slot0.setTimeLabel(slot0)
	slot0.endTime = gGameModel.role:read("yy_endtime")[slot0.activityId]

	if slot0.endTime - time.getTime() < 0 then
		slot0.timeLabel:text(gLanguageCsv.activityOver)
	end

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
	end, 1, 0)
end

function slot0.onItemClick(slot0, slot1, slot2, slot3, slot4)
	if slot4.use then
		return
	end

	if slot0.data.info.flop_times <= 0 then
		gGameUI:showTip(gLanguageCsv.seekpokemonNotNumber)

		return
	end

	gGameApp:requestServerCustom("/game/yy/seekpokemon/flop"):params(slot0.activityId, slot3):onResponse(function (slot0)
		uv1 = "runActionFunc"
		uv3 = "unitId"
		uv4 = "itertools"
		uv5 = "size"

		slot1:runActionFunc(slot3, slot4.unitId, slot5)

		if itertools.size(slot0.view.award) > 0 then
			uv2 = "runActionFunc"

			performWithDelay(slot2, function ()
				uv0 = "gGameUI"
				slot0[1] = true
				uv2 = "showGainDisplay"

				gGameUI:showGainDisplay(slot2, {
					cb = function ()
						uv0 = "yyhuodongs"
						slot0 = slot0.yyhuodongs
						slot1 = slot0
						uv1 = "yyhuodongs"
						slot1 = slot1.activityId
						uv1 = "yyhuodongs"
						slot1 = slot1.initPolemon

						slot1(slot1, slot0.read(slot1)[slot1])

						uv1 = "yyhuodongs"

						slot1:initCorrespondingAward()
					end
				})
			end, 0.6)
		else
			uv1 = "view"
			slot1[1] = true
		end
	end):wait({
		false
	}):doit(function (slot0)
	end)
end

function slot0.runActionFunc(slot0, slot1, slot2, slot3)
	slot1:runAction(cc.Sequence:create(cc.ScaleTo:create(0.15, 0.01, 1), cc.CallFunc:create(function ()
		uv0 = "get"
		slot0 = slot0:get("icon")
		slot0 = slot0.show

		slot0(slot0)

		uv0 = "get"
		slot0 = slot0:get("panel")
		slot0 = slot0.hide

		slot0(slot0)

		uv0 = "get"
		slot0 = slot0:get("mask")
		slot0 = slot0.hide

		slot0(slot0)

		uv0 = "get"
		slot0 = slot0:get("icon")
		slot0 = slot0.texture
		uv3 = "icon"

		slot0(slot0, csv.unit[slot3].iconSimple)

		uv0 = "get"

		slot0:get("bg"):texture("activity/seekpokemon/btn_zm.png")
	end), cc.ScaleTo:create(0.15, 1, 1), cc.CallFunc:create(function ()
		uv0 = "pokemonData"
		uv2 = "atproxy"
		slot0.pokemonData:atproxy(slot2).use = true
	end)))
end

function slot0.initCorrespondingAward(slot0)
	if not slot0.cfgAward[math.min(slot0.checkpoint + 1, slot0.cfgSize)] then
		return
	end

	slot0.awardData:update({
		{
			desc = gLanguageCsv.seekpokemonNumberWithin
		},
		{
			data = slot0.cfgAward[slot1].extraAward1
		},
		{
			desc = gLanguageCsv.seekpokemonNumberOutside
		},
		{
			data = slot0.cfgAward[slot1].extraAward2
		}
	})
end

function slot0.showHideAwardPanel(slot0, slot1)
	slot0.awardPanel:visible(slot1)
end

function slot0.getdrawNum(slot0)
	gGameUI:stackUI("city.activity.seekpokemon.task", nil, , slot0.activityId)
end

function slot0.onPerview(slot0)
	gGameUI:stackUI("city.activity.seekpokemon.browse_reward", nil, , slot0.cfgAward, slot0.pass and slot0.cfgSize + 1 or slot0.checkpoint + 1)
end

function slot0.onRules(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot0.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.noteText(127110),
		slot2.noteText(127111, 127114)
	}
end

return slot0
