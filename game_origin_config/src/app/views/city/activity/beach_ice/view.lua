slot0 = 1.5
slot1 = 12
slot2 = {
	quit = 4,
	start = 2,
	closed = 1,
	play = 3
}
slot3 = {
	perfect = 1,
	bad2 = 4,
	good = 2,
	bad1 = 3,
	bad3 = 5
}
slot4 = {
	[1.0] = "standby_loop",
	[2.0] = "run_loop"
}
slot5 = {
	left = -1,
	right = 1
}
slot6 = {
	"activity/beach_ice/img_bq_wm.png",
	"activity/beach_ice/img_bq_lh.png",
	"activity/beach_ice/img_bq_xc.png",
	"activity/beach_ice/img_bq_xc.png",
	"activity/beach_ice/img_bq_xc1.png"
}
slot8 = class("BeachIceView", cc.load("mvc").ViewBase)
slot9 = {
	event = "effect",
	data = {
		outline = {
			size = 4,
			color = cc.c4b(255, 252, 237, 255)
		}
	}
}
slot10 = {
	event = "effect",
	data = {
		outline = {
			size = 4,
			color = cc.c4b(91, 84, 91, 255)
		}
	}
}

function slot11(slot0, slot1)
	slot2, slot3 = time.getHourAndMin(slot1)

	return time.getNumTimestamp(slot0, slot2, slot3)
end

function slot12(slot0)
	return ({
		"Jan",
		"Feb",
		"Mar",
		"Apr",
		"May",
		"Jun",
		"Jul",
		"Aug",
		"Sept",
		"Oct",
		"Nov",
		"Dec"
	})[tonumber(slot0)]
end

slot8.RESOURCE_STYLES = {
	disableTimeSpeeder = true
}
slot8.RESOURCE_FILENAME = "beach_ice_view.json"
slot8.RESOURCE_BINDING = {
	gaizi = "gaizi",
	["demandPanel.bg"] = "demandPanelBg",
	["demandPanel.countDownBg"] = "countDownBg",
	demandPanel = "demandPanel",
	timeBg = "timeBg",
	foodPanel = "foodPanel",
	huodongTimePanel = "huodongTimePanel",
	["centerPanel.tipTime"] = "tipTime",
	leftDownPanel = "leftDownPanel",
	centerPanel = "centerPanel",
	mask = "mask",
	bg = "bg",
	["demandPanel.item"] = "demandItem",
	["centerPanel.textTipTime"] = "textTipTime",
	["huodongTimePanel.timeText"] = {
		varname = "timeText",
		binds = slot10
	},
	["huodongTimePanel.time"] = {
		varname = "showTime",
		binds = slot10
	},
	addTime = {
		varname = "addTimeText"
	},
	gameTime = {
		varname = "gameTimeText",
		binds = {
			event = "text",
			idler = bindHelper.self("gameTime")
		}
	},
	btnMaking = {
		varname = "btnMaking",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onMakingClick")
			}
		}
	},
	["centerPanel.btnGame"] = {
		varname = "btnGame",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlayGameClick")
			}
		}
	},
	["centerPanel.addPanel"] = {
		varname = "btnAdd",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAddClick")
			}
		}
	},
	["centerPanel.btnGame.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["btnMaking.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["leftDownPanel.rankPanel.txt"] = {
		binds = slot9
	},
	["leftDownPanel.rulePanel.txt"] = {
		binds = slot9
	},
	["leftDownPanel.rankPanel"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRankClick")
			}
		}
	},
	["leftDownPanel.rulePanel"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	["demandPanel.countDownBg.bar"] = {
		varname = "bar",
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				data = bindHelper.self("curPagePro")
			}
		}
	},
	["demandPanel.demandList"] = {
		varname = "demandList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("demandDatas"),
				item = bindHelper.self("demandItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.visible then
						slot1:get("img"):texture(slot3.icon)
						slot1:get("mask"):hide()
						slot1:get("bg"):hide()
					elseif slot3.sel > 0 then
						slot1:get("img"):texture(slot3.choose)
						slot1:get("mask"):hide()
						slot1:get("bg"):hide()
					else
						slot1:get("img"):hide()
						slot1:get("mask"):show()
						slot1:get("bg"):show()
					end
				end
			}
		}
	}
}

function slot8.onCreate(slot0, slot1)
	slot0:enableSchedule()

	slot0.activityID = slot1

	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "BEACH ICE",
		title = gLanguageCsv.beachIceShop
	})

	slot0.gameTime = idler.new(60)
	slot0.addTime = 0
	slot0.curPagePro = idler.new(0)
	slot0.demandDatas = idlers.newWithMap({})
	slot0.clickData = idlertable.new()
	slot0.canclick = idler.new(false)
	slot0.round = idler.new(0)
	slot0.oneTurnCostTime = 0

	slot0:initModel()
	slot0:initGameCount()

	slot3 = slot0

	slot0.initGameTime(slot3)

	uv3 = "enableSchedule"
	slot0.gameState = idler.new(slot3.closed)
	slot2 = widget.addAnimationByKey(slot0.gaizi, "effect/shatanbaobing.skel", "gaizi", "gaizi_loop", 10):xy(slot0.gaizi:width() / 2, slot0.gaizi:height() / 2 + 152):anchorPoint(0.5, 0.5)
	slot3 = widget.addAnimationByKey(slot0.bg, "effect/shatanbaobing.skel", "door", "che_guanbi_loop", 5):xy(slot0.bg:width() / 2, -20):anchorPoint(0.5, 0.5):scale(0.5)

	idlereasy.when(slot0.gameState, function (slot0, slot1)
		uv2 = "closed"

		if slot1 == slot2.closed then
			uv2 = "foodPanel"
			slot2 = slot2.foodPanel
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "foodPanel"
			slot2 = slot2.gaizi
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "foodPanel"
			slot2 = slot2.timeBg
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "foodPanel"
			slot2 = slot2.gaizi:get("gaizi")
			slot2 = slot2.play

			slot2(slot2, "gaizi_loop")

			uv2 = "foodPanel"
			slot2 = slot2.round
			slot2 = slot2.set

			slot2(slot2, -1)

			uv2 = "foodPanel"
			slot2 = slot2.mask
			slot2 = slot2.show

			slot2(slot2)

			uv2 = "foodPanel"

			if slot2.cardSpinePanel then
				uv2 = "foodPanel"
				slot2 = slot2.cardSpinePanel
				slot2 = slot2.removeSelf

				slot2(slot2)

				uv2 = "foodPanel"
				slot2.cardSpinePanel = nil
			end

			uv4 = "foodPanel"
			slot4 = slot4.btnMaking
			uv4 = "foodPanel"
			slot4 = slot4.demandPanel
			uv4 = "foodPanel"
			slot4 = slot4.gameTimeText
			uv4 = "foodPanel"
			slot4 = "hide"

			itertools.invoke({
				slot4,
				slot4,
				slot4,
				slot4.addTimeText
			}, slot4)

			slot2 = itertools.invoke
			uv4 = "foodPanel"
			slot4 = slot4.leftDownPanel
			uv4 = "foodPanel"
			slot4 = slot4.huodongTimePanel
			uv4 = "foodPanel"

			slot2({
				slot4,
				slot4,
				slot4.centerPanel
			}, "show")

			uv2 = "foodPanel"
			slot2 = slot2.resetClickData

			slot2(slot2)

			uv2 = "foodPanel"

			slot2:unSchedule(66)
		else
			uv2 = "closed"

			if slot1 == slot2.start then
				slot2 = itertools.invoke
				uv4 = "foodPanel"
				slot4 = slot4.leftDownPanel
				uv4 = "foodPanel"
				slot4 = slot4.huodongTimePanel
				uv4 = "foodPanel"

				slot2({
					slot4,
					slot4,
					slot4.centerPanel
				}, "hide")

				uv2 = "foodPanel"
				slot2 = slot2.btnMaking
				slot2 = slot2.show

				slot2(slot2)

				uv2 = "foodPanel"
				slot2 = slot2.btnMaking
				slot2 = slot2.setTouchEnabled

				slot2(slot2, false)

				uv2 = "foodPanel"

				slot2:resetClickData()
			else
				uv2 = "closed"

				if slot1 == slot2.play then
					uv2 = "foodPanel"

					slot2.btnMaking:hide()
				end
			end
		end
	end)
	idlereasy.when(slot0.canclick, function (slot0, slot1)
		uv2 = "mask"

		slot2.mask:visible(not slot1)
	end)
	idlereasy.when(slot0.clickData, function (slot0, slot1)
		for slot5 = 1, itertools.size(slot1) do
			uv6 = "itertools"

			slot6.foodPanel:get("sel" .. slot5):visible(slot1[slot5] ~= 0)
		end

		uv2 = "itertools"

		if not slot2:isClosedOrQuit() then
			uv4 = "itertools"
			uv5 = "itertools"
			slot5 = slot5.round:read()
			slot3 = csv.yunying.shaved_ice_demand[slot4.demandData[slot5].csvID].itemNum
			uv5 = "itertools"

			for slot7 = 1, slot5.demandDatas:size() do
				uv8 = "itertools"

				if slot8.demandDatas:atproxy(slot7).sel ~= 0 then
					slot2 = 0 + 1
				end
			end

			if slot2 == slot3 then
				uv4 = "itertools"

				if slot4.cancheck then
					uv4 = "itertools"
					slot4 = slot4.checkResult

					slot4(slot4)

					uv4 = "itertools"
					slot4.cancheck = false
					uv4 = "itertools"

					slot4.canclick:set(false)
				end
			end
		end
	end)
	idlereasy.when(slot0.round, function (slot0, slot1)
		if slot1 > 0 then
			uv2 = "isClosedOrQuit"

			if not slot2:isClosedOrQuit() then
				uv2 = "isClosedOrQuit"
				slot2 = slot2.resetClickData

				slot2(slot2)

				uv2 = "isClosedOrQuit"
				slot2 = slot2.gameState
				slot3 = slot2
				uv3 = "resetClickData"

				if slot2.read(slot3) == slot3.start then
					uv3 = "isClosedOrQuit"
					uv5 = "gameState"

					performWithDelay(slot3, function ()
						uv0 = "gameState"
						slot0 = slot0.gameState
						slot1 = slot0
						uv1 = "read"

						if slot0.read(slot1) == slot1.start then
							uv0 = "gameState"
							slot0 = slot0.timeBg
							slot0 = slot0.show

							slot0(slot0)

							uv0 = "gameState"
							slot0 = slot0.bg:get("door")
							slot0 = slot0.play

							slot0(slot0, "che_loop")

							uv0 = "gameState"
							slot0 = slot0.foodPanel
							slot0 = slot0.show

							slot0(slot0)

							uv0 = "gameState"
							slot0 = slot0.gaizi
							slot0 = slot0.show

							slot0(slot0)

							uv0 = "gameState"

							slot0:createCardSpine()
						end
					end, slot5)
				else
					uv3 = "isClosedOrQuit"

					performWithDelay(slot3, function ()
						uv0 = "createCardSpine"

						slot0:createCardSpine()
					end, 1)
				end

				uv2 = "isClosedOrQuit"
				slot2.cancheck = true
			end
		end
	end)
end

function slot8.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.yyEndtime = gGameModel.role:read("yy_endtime")
end

function slot8.initGameTime(slot0)
	slot2 = slot0.activityID
	slot1 = csv.yunying.yyhuodong[slot2]
	uv2 = "csv"
	slot2 = slot2(slot1.beginDate, slot1.beginTime)
	slot0.beginTime = slot2
	uv2 = "csv"
	slot0.endTime = slot2(slot1.endDate, slot1.endTime)

	if time.getTime() < slot0.beginTime or slot0.endTime < time.getTime() then
		slot0.centerPanel:hide()
	else
		slot0.centerPanel:show()
	end

	uv4 = "yunying"

	slot0:unSchedule(slot4)

	slot2 = 0

	if slot0.yyEndtime[slot0.activityID] then
		slot2 = slot0.yyEndtime[slot0.activityID] - time.getTime()
	end

	uv8 = "yunying"

	slot0:schedule(function ()
		uv0 = "showTime"
		uv0 = 1
		uv0 = "text"
		slot0 = (slot0 - 1).showTime
		slot1 = slot0
		uv3 = "showTime"
		slot2 = time.getCutDown(slot3, true).str

		slot0.text(slot1, slot2)

		slot0 = adapt.oneLinePos
		uv1 = "text"
		uv2 = "text"

		slot0(slot1.showTime, slot2.timeText, cc.p(5, 0), "right")

		uv0 = "showTime"

		if slot0 <= 0 then
			uv0 = "text"
			slot0 = slot0.showTime
			slot1 = slot0
			slot2 = gLanguageCsv.activityOver

			slot0.text(slot1, slot2)

			slot0 = adapt.oneLinePos
			uv1 = "text"
			uv2 = "text"
			slot2 = slot2.timeText

			slot0(slot1.showTime, slot2, cc.p(5, 0), "right")

			uv0 = "text"
			uv2 = "time"

			slot0:unSchedule(slot2)

			return false
		end
	end, 1, 0, slot8)
end

function slot8.initGameCount(slot0)
	slot2 = csv.yunying.yyhuodong[slot0.activityID].paramMap or {}
	slot3 = slot2.buyTimes or 0
	slot4 = slot2.times or 0
	slot0.huodongID = slot1.huodongID
	slot0.cost = 0
	slot0.buyCost = slot2.buyCost or {}

	idlereasy.any({
		slot0.yyhuodongs
	}, function (slot0, slot1)
		uv2 = "activityID"
		slot3 = (slot1[slot2.activityID] or {}).info or {}
		slot4 = slot3.times or 0
		slot5 = slot3.buy_times or 0
		uv6 = "activityID"
		uv7 = "info"
		slot6.canBuy = slot5 < slot7
		uv8 = "activityID"

		if slot5 + 1 > itertools.size(slot8.buyCost) or not (slot5 + 1) then
			uv7 = "activityID"
			slot6 = itertools.size(slot7.buyCost)
		end

		uv7 = "activityID"
		uv8 = "activityID"
		slot9 = slot5 + 1
		slot7.cost = slot8.buyCost[slot9]
		uv7 = "activityID"
		slot7 = slot7.btnAdd
		slot8 = slot7
		slot7 = slot7.visible
		uv9 = "info"
		slot9 = slot9 ~= 0

		slot7(slot8, slot9)

		uv7 = "activityID"
		uv8 = "times"
		slot7.remainTimes = slot8 + slot5 - slot4
		uv7 = "activityID"
		uv9 = "activityID"
		uv11 = "times"

		slot7.tipTime:text(slot9.remainTimes .. "/" .. slot11)
	end)
end

function slot8.onMakingClick(slot0)
	slot0:updateGameTime()

	uv3 = "updateGameTime"

	slot0.gameState:set(slot3.play)
	slot0.canclick:set(true)
	gGameApp:requestServer("/game/yy/shaved_ice/start", function (slot0)
		uv1 = "startTime"
		slot1.startTime = socket.gettime()
		uv1 = "startTime"
		slot1.oneTurnCostTime = 0
		uv1 = "startTime"
		slot1 = slot1.createGameTime

		slot1(slot1)

		uv1 = "startTime"

		slot1:checkCheat()
	end, slot0.activityID, slot0.round:read())
end

function slot8.onPlayGameClick(slot0)
	if slot0.remainTimes == 0 then
		gGameUI:showTip(gLanguageCsv.gameTimesLimit)

		return
	end

	slot3 = 0

	if gGameModel.role:read("yy_endtime")[slot0.activityID] == nil or math.floor(slot2 - time.getTime()) <= 0 then
		gGameUI:showTip(gLanguageCsv.flipCardFinishedClickTip)

		return
	end

	slot0.perfectNum = 0
	slot0.goodNum = 0
	slot0.badNum = 0

	slot0.gameTime:set((csv.yunying.yyhuodong[slot0.activityID].paramMap or {}).playTime)
	gGameApp:requestServer("/game/yy/shaved_ice/prepare", function (slot0)
		uv1 = "choices"
		slot1.choices = slot0.view and slot0.view.choices or {}
		uv1 = "choices"
		slot1.demandData = slot0.view and slot0.view.demands or {}
		uv1 = "choices"
		slot1 = slot1.gameState
		slot1 = slot1.set
		uv3 = "view"

		slot1(slot1, slot3.start)

		uv1 = "choices"
		slot1 = slot1.bg:get("door")
		slot1 = slot1.play

		slot1(slot1, "che_effect")

		uv1 = "choices"
		slot1 = slot1.gaizi:get("gaizi")
		slot1 = slot1.play

		slot1(slot1, "gaizi_dakai")

		uv1 = "choices"
		slot1 = slot1.round
		slot1 = slot1.set

		slot1(slot1, 1, true)

		uv1 = "choices"

		slot1:createFood()
	end, slot0.activityID)
end

function slot8.createCardSpine(slot0)
	if slot0.cardSpinePanel then
		slot0.cardSpinePanel:scaleX(-1)
		slot0.cardSpinePanel:xy(-100, 200)
	else
		slot0.cardSpinePanel = ccui.Layout:create():size(500, 500):addTo(slot0.bg, 3, "spine"):anchorPoint(0.5, 0.5):xy(-100, 200)
	end

	slot0.cardSpinePanel:removeChildByName("card")
	slot0.cardSpinePanel:removeChildByName("iconBg")

	slot1 = slot0.demandData[slot0.round:read()].guest
	uv6 = "cardSpinePanel"
	slot5 = csv.unit[slot1].skin

	widget.addAnimationByKey(slot0.cardSpinePanel, csv.unit[slot1].unitRes, "card", slot6[2], 10):xy(300, 20):anchorPoint(0.5, 0.5):scale(2):setSkin(slot5)

	uv5 = "scaleX"

	slot0:moveCardSpine(slot5.right)
end

function slot8.resetClickData(slot0)
	for slot5 = 1, 9 do
	end

	slot0.clickData:set({
		[slot5] = 0
	})
end

function slot8.createFood(slot0)
	for slot5, slot6 in pairs(slot0.choices) do
		slot0.foodPanel:get("food" .. slot5):get("img"):texture(csv.yunying.shaved_ice_items[slot6].icon2)
		bind.touch(slot0, slot0.foodPanel:get("food" .. slot5), {
			methods = {
				ended = function ()
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
			}
		})
	end
end

function slot8.moveCardSpine(slot0, slot1, slot2)
	slot0.canclick:set(false)
	slot0.cardSpinePanel:scaleX(slot1)

	slot3 = slot0.cardSpinePanel
	slot3 = slot3.runAction
	uv9 = "canclick"

	slot3(slot3, cc.Sequence:create(cc.MoveBy:create(slot9, cc.p(580 * slot1, 0)), cc.CallFunc:create(function ()
		uv0 = "cardSpinePanel"
		slot2 = "card"
		uv2 = "get"

		slot0.cardSpinePanel:get(slot2):play(slot2[1])
	end)))

	uv3 = "cardSpinePanel"

	if slot1 == slot3.right then
		uv6 = "canclick"

		slot0:realCountDown(slot0.demandPanel, slot6, function ()
			uv0 = "gameState"
			slot0 = slot0.gameState
			slot1 = slot0
			uv1 = "read"

			if slot0.read(slot1) == slot1.start then
				uv0 = "gameState"
				slot0 = slot0.updateGameTime

				slot0(slot0)

				uv0 = "gameState"

				slot0.gameTimeText:show()
			else
				uv0 = "gameState"
				slot0 = slot0.gameState
				slot1 = slot0
				uv1 = "read"

				if slot0.read(slot1) == slot1.play then
					uv4 = "gameState"
					uv5 = "gameState"

					gGameApp:requestServer("/game/yy/shaved_ice/start", function (slot0)
						uv1 = "startTime"
						slot1.startTime = socket.gettime()
						uv1 = "startTime"
						slot1.oneTurnCostTime = 0
					end, slot4.activityID, slot5.round:read())
				end
			end

			uv0 = "gameState"
			slot0 = slot0.modelDemanPanel

			slot0(slot0)

			uv0 = "gameState"
			slot0 = slot0.updateTime

			slot0(slot0)

			uv0 = "gameState"

			slot0.canclick:set(false)
		end)
	else
		slot0:showEmoji(slot2)

		slot5 = "card"
		uv5 = "set"

		slot0.cardSpinePanel:get(slot5):play(slot5[2])
		slot0.demandPanel:hide()

		uv6 = "canclick"

		slot0:realCountDown(slot0.demandPanel, slot6, function ()
			uv0 = "round"
			uv2 = "round"

			slot0.round:set(slot2.round:read() + 1)
		end)
	end
end

function slot8.realCountDown(slot0, slot1, slot2, slot3)
	slot4 = socket.gettime() + slot2

	slot1:scheduleUpdate(function ()
		uv1 = "socket"

		if slot1 <= socket.gettime() then
			uv0 = "gettime"
			slot0 = slot0.unscheduleUpdate

			slot0(slot0)

			uv0 = "unscheduleUpdate"

			slot0()

			return false
		end
	end)
end

function slot8.showEmoji(slot0, slot1)
	slot5 = 200
	slot2 = cc.Sprite:create("activity/beach_ice/box_qp.png"):anchorPoint(0.5, 0.5):addTo(slot0.cardSpinePanel, 10, "iconBg"):xy(150, 230):scale(0.5):scaleX(-0.5):size(202, slot5)
	uv5 = "cc"
	slot3 = cc.Sprite:create(slot5[slot1]):anchorPoint(0.5, 0.5):addTo(slot2, 10, "icon"):xy(slot2:width() / 2, slot2:height() / 2)
end

function slot8.modelDemanPanel(slot0)
	slot1 = itertools.size(slot0.demandData[slot0.round:read()].demand or {})

	slot0.demandPanel:get("bg"):width(78 + 190 * slot1)
	slot0.demandList:width(slot1 * 190)
	slot0.demandPanel:get("countDownBg"):x(slot1 * 90 + 100)

	slot7 = slot0.round

	for slot7, slot8 in ipairs(slot0.demandData[slot6.read(slot7)].demand) do
		-- Nothing
	end

	slot0.demandDatas:update({
		[slot7] = {
			visible = true,
			sel = 0,
			choose = " ",
			key = slot8,
			icon = csv.yunying.shaved_ice_items[slot8].icon1
		}
	})
	slot0.demandPanel:show()
end

function slot8.updateTime(slot0)
	slot3 = socket.gettime() + csv.yunying.shaved_ice_demand[slot0.demandData[slot0.round:read()].csvID].time

	slot0:unSchedule(100)
	slot0:schedule(function (slot0)
		uv2 = "socket"

		if slot2 <= socket.gettime() then
			uv2 = "gettime"

			for slot4 = 1, slot2.demandDatas:size() do
				uv5 = "gettime"
				slot5.demandDatas:atproxy(slot4).visible = false
			end

			uv1 = "gettime"
			slot1 = slot1.canclick
			slot1 = slot1.set

			slot1(slot1, true)

			uv1 = "gettime"
			slot1 = slot1.gameState
			slot2 = slot1
			uv2 = "demandDatas"

			if slot1.read(slot2) == slot2.start then
				uv1 = "gettime"
				slot1 = slot1.unSchedule

				slot1(slot1, 66)

				uv1 = "gettime"
				slot1 = slot1.btnMaking
				slot1 = slot1.setTouchEnabled

				slot1(slot1, true)

				uv1 = "gettime"

				slot1.canclick:set(false)
			end

			return false
		end

		uv1 = "gettime"
		uv4 = "socket"
		slot5 = socket.gettime()
		uv5 = "size"

		slot1.curPagePro:set(math.min((slot4 - slot5) / slot5 * 100, 100))
	end, 0.016666666666666666, 0, 100)
end

function slot8.updateGameTime(slot0)
	if slot0.addTime ~= 0 then
		slot1 = slot0.gameTime:read() + slot0.addTime
		slot5 = slot0.addTime

		slot0.addTimeText:text("+" .. slot5)
		slot0.addTimeText:show()

		uv5 = "gameTime"

		performWithDelay(slot0, function ()
			uv0 = "addTimeText"

			slot0.addTimeText:hide()
		end, slot5)
	end

	slot0.addTime = 0
	slot2 = time.getTime() + slot1

	slot0:unSchedule(66)
	slot0:schedule(function (slot0)
		uv2 = "time"

		if slot2 <= time.getTime() then
			uv1 = "getTime"

			slot1:gameover(1)

			return false
		end

		uv1 = "getTime"
		uv3 = "time"

		slot1.gameTime:set(slot3 - time.getTime())
	end, 1, 0, 66)
end

function slot8.clickFood(slot0, slot1, slot2)
	if slot0:isClosedOrQuit() then
		return
	end

	slot3 = csv.yunying.shaved_ice_items

	if table.shallowcopy(slot0.clickData:read())[slot1] ~= 0 then
		slot0.demandDatas:atproxy(slot4[slot1]).sel = 0
		slot4[slot1] = 0
	else
		for slot8 = 1, slot0.demandDatas:size() do
			if slot0.demandDatas:atproxy(slot8).sel == 0 then
				slot0.demandDatas:atproxy(slot8).sel = slot1
				slot0.demandDatas:atproxy(slot8).choose = slot3[slot2].icon1
				slot4[slot1] = slot8

				break
			end
		end
	end

	slot0.clickData:set(slot4)
end

function slot8.isClosedOrQuit(slot0)
	slot1 = slot0.gameState
	slot2 = slot1
	uv2 = "gameState"

	if slot1.read(slot2) ~= slot2.closed then
		uv2 = "gameState"

		if slot1 ~= slot2.quit then
			slot2 = false
		end
	else
		slot2 = true
	end

	return slot2
end

function slot8.checkResult(slot0)
	slot1 = slot0.gameState
	slot2 = slot1
	uv2 = "gameState"

	if slot1.read(slot2) ~= slot2.play then
		return
	end

	slot2 = {
		[slot6] = slot0.demandDatas:atproxy(slot6).key
	}

	for slot6 = 1, slot0.demandDatas:size() do
	end

	gGameApp:requestServer("/game/yy/shaved_ice/end", function (slot0)
		if not slot0.view.result or not slot0.view.result.type then
			uv1 = "view"
			slot1 = slot1.bad3
		end

		slot2 = slot0.view.result and slot0.view.result.score or 0
		uv3 = "result"
		slot3.addTime = slot0.view.result.time
		uv3 = "view"

		if slot1 == slot3.perfect then
			uv3 = "result"
			uv4 = "result"
			slot3.perfectNum = slot4.perfectNum + 1
		else
			uv3 = "view"

			if slot1 == slot3.good then
				uv3 = "result"
				uv4 = "result"
				slot3.goodNum = slot4.goodNum + 1
			else
				uv3 = "result"
				uv4 = "result"
				slot3.badNum = slot4.badNum + 1
			end
		end

		uv3 = "result"
		slot3 = slot3.updateGameTime

		slot3(slot3)

		uv3 = "result"
		slot4 = gGameUI
		slot5 = slot4
		uv10 = "result"
		uv11 = "result"
		slot10 = slot10.demandData[slot11.round:read()].guest
		uv10 = "type"
		uv10 = "bad3"
		uv10 = "result"
		slot3.checkUi = slot4.stackUI(slot5, "city.activity.beach_ice.check", nil, {
			clickClose = true,
			blackLayer = true
		}, {
			unitID = slot10,
			type = slot1,
			mineChoose = slot10,
			demand = slot10,
			score = slot2,
			cb = slot10:createHandler("setCheckUi")
		})
		uv3 = "result"
		uv5 = "score"

		slot3:moveCardSpine(slot5.left, slot1)
	end, slot0.activityID, slot0.round:read(), {
		[slot6] = slot0.choices[slot0.demandDatas:atproxy(slot6).sel]
	}, slot0.oneTurnCostTime)
end

function slot8.setCheckUi(slot0)
	slot0.checkUi = nil
end

function slot8.onRankClick(slot0)
	if time.getTime() < slot0.beginTime or slot0.endTime < time.getTime() then
		gGameUI:showTip(gLanguageCsv.notRank)

		return
	end

	gGameApp:requestServer("/game/yy/shaved_ice/rank", function (slot0)
		uv7 = "gGameUI"

		gGameUI:stackUI("city.activity.beach_ice.rank", nil, , slot0.view, slot7.activityID)
	end, slot0.activityID)
end

function slot8.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1000
	})
end

function slot8.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(124801, 124820)
	}
end

function slot8.onAddClick(slot0)
	slot3 = 0

	if gGameModel.role:read("yy_endtime")[slot0.activityID] == nil or math.floor(slot2 - time.getTime()) <= 0 then
		gGameUI:showTip(gLanguageCsv.flipCardFinishedClickTip)

		return
	end

	if slot0.canBuy == false then
		gGameUI:showTip(gLanguageCsv.buyTimesLimit)

		return
	end

	gGameUI:showDialog({
		isRich = true,
		btnType = 2,
		clearFast = true,
		cb = function ()
			uv0 = "cost"

			if gGameModel.role:read("rmb") < slot0.cost then
				uiEasy.showDialog("rmb")
			else
				uv4 = "cost"

				gGameApp:requestServer("/game/yy/shaved_ice/buy", function (slot0)
					gGameUI:showTip(gLanguageCsv.buySuccess)
				end, slot4.activityID)
			end
		end,
		title = gLanguageCsv.spaceTips,
		content = string.format(gLanguageCsv.purchaseTimesTip, slot0.cost),
		size = {
			width = 850,
			height = 450
		},
		dialogParams = {
			clickClose = false
		}
	})
end

function slot8.gameover(slot0, slot1)
	slot0:unScheduleAll()
	slot0.demandPanel:unscheduleUpdate()
	slot0:stopAllActions()
	slot0.canclick:set(false)
	slot0.gaizi:get("gaizi"):play("gaizi_guanbi")

	if not slot0:isClosedOrQuit() then
		uv4 = "unScheduleAll"

		slot0.gameState:set(slot4.quit)
		gGameApp:requestServer("/game/yy/shaved_ice/quit", function (slot0)
			uv1 = "changeGameState"
			slot1 = slot1.changeGameState

			slot1(slot1, false)

			uv1 = "perfectNum"

			if slot1 == 2 then
				uv1 = "changeGameState"
				uv2 = "changeGameState"
				slot2 = slot2.goodNum
				uv2 = "changeGameState"

				if slot1.perfectNum + slot2 + slot2.badNum == 0 then
					uv1 = "changeGameState"

					slot1.bg:get("door"):play("che_guanbi_loop")
				end
			else
				uv7 = "changeGameState"
				uv7 = "changeGameState"
				uv7 = "changeGameState"
				slot7 = slot7.perfectNum.goodNum.badNum
				uv7 = "changeGameState"
				slot7 = slot0.view.result or {}
				uv7 = "changeGameState"

				gGameUI:stackUI("city.activity.beach_ice.game_over", nil, {
					blackLayer = true
				}, {
					perfectNum = slot7,
					goodNum = slot7,
					badNum = slot7,
					huodongID = slot7.huodongID,
					award = slot7,
					cb = slot7:createHandler("changeGameState", true)
				})
			end
		end, slot0.activityID)
	end
end

function slot8.changeGameState(slot0, slot1)
	if slot1 then
		slot0.bg:get("door"):play("che_guanbi_loop")
	end

	uv4 = "bg"

	slot0.gameState:set(slot4.closed)

	if slot0.checkUi then
		slot0.checkUi:onClose()

		slot0.checkUi = nil
	end

	slot0:initGameTime()
end

function slot8.onClose(slot0)
	slot1 = slot0.gameState
	slot2 = slot1
	uv2 = "gameState"

	if slot1.read(slot2) == slot2.closed then
		uv1 = "read"

		slot1.onClose(slot0)

		return
	end

	slot1 = "#C0x5b545b#" .. gLanguageCsv.exitDuringProductionTip
	slot2 = slot0.gameState
	slot3 = slot2
	uv3 = "gameState"

	if slot2.read(slot3) == slot3.start then
		slot1 = "#C0x5b545b#" .. gLanguageCsv.firstExit
	end

	gGameUI:stackUI("city.activity.beach_ice.tips", nil, , {
		clearFast = true,
		content = slot1,
		state = slot0.gameState:read(),
		cb = function ()
			uv0 = "gameover"

			slot0:gameover(2)
		end,
		time = slot0.gameTime:read() - 1
	})
end

function slot8.checkCheat(slot0)
	slot2 = 5
	slot3 = socket.gettime()

	slot0:unSchedule(718)
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
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
		--     return _build_numeric_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
		--     number = state.constants.numeric_constants[index]
		--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end, 1, 0, 718)
end

function slot8.createGameTime(slot0)
	slot0:schedule(function (slot0)
		uv1 = "oneTurnCostTime"
		uv2 = "oneTurnCostTime"
		slot1.oneTurnCostTime = slot2.oneTurnCostTime + 0.1
	end, 0.1, 0, 111111)
end

return slot8
