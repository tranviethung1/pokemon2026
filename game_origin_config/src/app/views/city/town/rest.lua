slot0 = 2
slot1 = 6
slot2 = {
	event = "effect",
	data = {
		outline = {
			size = 4,
			color = cc.c4b(91, 84, 91, 255)
		}
	}
}
slot3 = {
	hide = -1,
	show = 1
}
slot4 = game.TOWN_CARD_STATE
slot5 = {
	{
		x = 280,
		y = 700
	},
	{
		x = 740,
		y = 490
	},
	{
		x = 1020,
		y = 960
	},
	{
		x = 1180,
		y = 610
	},
	{
		x = 1630,
		y = 890
	},
	{
		x = 1680,
		y = 490
	},
	{
		x = 2070,
		y = 640
	},
	{
		x = 2260,
		y = 380
	},
	{
		x = 2650,
		y = 710
	},
	{
		x = 2920,
		y = 340
	},
	{
		x = 3360,
		y = 380
	},
	{
		x = 3270,
		y = 660
	},
	{
		x = 3930,
		y = 540
	},
	{
		x = 4220,
		y = 860
	},
	{
		x = 4410,
		y = 340
	},
	{
		x = 4670,
		y = 700
	},
	{
		x = 5160,
		y = 580
	},
	{
		x = 5330,
		y = 850
	},
	{
		x = 5600,
		y = 500
	},
	{
		x = 5960,
		y = 750
	}
}
slot7 = class("TownRestView", cc.load("mvc").ViewBase)
slot7.RESOURCE_FILENAME = "town_rest.json"
slot7.RESOURCE_BINDING = {
	["rightPanel.noData"] = "noData",
	topPanel = "topPanel",
	["rightPanel.item"] = "item",
	["scrollView.bgPanel"] = "bgPanel",
	spinePanel = "spinePanel",
	rightPanel = "rightPanel",
	scrollView = {
		varname = "scrollView",
		binds = {
			event = "scrollBarEnabled",
			data = false
		}
	},
	gotoTown = {
		varname = "btnGotoTown",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("gotoTownClick")
			}
		}
	},
	["topPanel.text1"] = {
		binds = slot2
	},
	["topPanel.num1"] = {
		varname = "positionNum",
		binds = slot2
	},
	["topPanel.text2"] = {
		binds = slot2
	},
	["topPanel.num2"] = {
		varname = "timeNum",
		binds = slot2
	},
	["topPanel.rule"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	["rightPanel.handlePanel"] = {
		varname = "btnHandle",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onStateClick")
			}
		}
	},
	["rightPanel.btnRest"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRestClick")
			}
		}
	},
	["rightPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 10,
				padding = 20,
				data = bindHelper.self("restCardDatas"),
				item = bindHelper.self("item"),
				reply = bindHelper.self("reply"),
				spineNode = bindHelper.self("spinePanel"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1:multiget("icon", "full", "resting", "time", "restNum", "select", "deletePanel", "timeImg", "restText").icon, {
						class = "card_icon",
						props = {
							unitId = slot3.unitId,
							dbid = slot3.dbID,
							rarity = slot3.rarity,
							advance = slot3.advance,
							star = slot3.star,
							levelProps = {
								data = slot3.level
							}
						}
					})

					if time.getTime() < slot3.energyRefreshTime + (slot3.energyMax - slot3.energy) / slot0.reply * 60 * 60 then
						slot4.restNum:text(slot3.energy + math.floor((time.getTime() - slot3.energyRefreshTime < 0 and 0 or time.getTime() - slot3.energyRefreshTime) / 3600 * slot0.reply) .. "/" .. slot3.energyMax)
						slot4.select:hide()
						slot4.full:hide()
						bind.extend(slot0, slot4.time, {
							class = "cutdown_label",
							props = {
								endTime = slot6,
								endFunc = function ()
									uv0 = "full"
									slot0 = slot0.full
									slot0 = slot0.show

									slot0(slot0)

									uv0 = "full"
									slot0 = slot0.resting
									slot0 = slot0.hide

									slot0(slot0)

									uv0 = "full"
									slot0 = slot0.select
									slot0 = slot0.show

									slot0(slot0)

									uv0 = "full"
									slot0 = slot0.deletePanel
									slot0 = slot0.hide

									slot0(slot0)

									uv0 = "full"
									uv2 = "show"
									uv4 = "show"

									slot0.restNum:text(slot2.energyMax .. "/" .. slot4.energyMax)
								end
							}
						})
						text.addEffect(slot4.restNum, {
							color = cc.c4b(247, 107, 69, 255)
						})
						adapt.oneLinePos(slot4.time, slot4.timeImg, cc.p(5, 0), "right")
					else
						slot4.full:show()
						slot4.resting:hide()
						slot4.select:show()
						slot4.deletePanel:hide()
						slot4.restNum:text(slot3.energy .. "/" .. slot3.energyMax)
						slot0.spineNode:get("btnDown"):hide()
						slot0.spineNode:get("circle"):hide()
					end

					adapt.oneLinePos(slot4.restNum, slot4.restText, cc.p(5, 0), "right")
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCellItem, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCellItem = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot7.onCreate(slot0)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "POKEMON REST",
		title = gLanguageCsv.townRest
	})
	slot0:enableSchedule()
	slot0:initModel()
	slot0:initScrollView()
	slot0:initTopPanel()
	slot0:initCards()
	slot0:updateDatas()
	slot0:updateSpinePanelZ()
	slot0:firstTime()
	slot0.btnGotoTown:hide()

	slot1 = slot0.rightPanel:x()
	slot2 = slot0.rightPanel:y()
	slot3 = slot0.rightPanel:width()

	idlereasy.when(slot0.state, function (slot0, slot1)
		uv2 = "list"
		slot2 = slot2.list
		slot2 = slot2.visible
		uv4 = "visible"

		slot2(slot2, slot1 == slot4.show)

		uv2 = "list"
		slot4 = "imgK"
		slot2 = slot2.rightPanel:get(slot4)
		slot3 = slot2
		uv4 = "visible"

		slot2.visible(slot3, slot1 == slot4.hide)

		slot2 = nil
		uv3 = "visible"

		if slot1 == slot3.show then
			uv4 = "show"
			uv5 = "rightPanel"
			uv5 = "get"
			slot3 = cc.p(slot4 - slot5, slot5)
			slot2 = slot3
			uv3 = "list"

			slot3:resetCardClickState()
		else
			uv4 = "show"
			uv5 = "get"
			slot2 = cc.p(slot4, slot5)
		end

		slot3 = cc.Sequence
		slot4 = slot3
		uv4 = "list"
		slot4 = slot4.rightPanel
		slot4 = slot4.stopAllActions

		slot4(slot4)

		uv4 = "list"

		slot4.rightPanel:runAction(slot3.create(slot4, cc.MoveTo:create(0.3, slot2), cc.CallFunc:create(function ()
			uv0 = "btnHandle"
			slot2 = "icon"
			uv2 = "get"

			slot0.btnHandle:get(slot2):setRotation(90 * slot2)
		end)))
	end)
	idlereasy.when(slot0.restCardDatas, function (slot0, slot1)
		uv2 = "positionNum"
		uv4 = "positionNum"
		uv6 = "positionNum"

		slot2.positionNum:text(slot4.restCardDatas:size() .. "/" .. slot6.maxNum)
	end)
	slot0.scrollView:get("bgPanel"):addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv2 = "ccui"
			slot2 = slot2.state
			slot2 = slot2.set
			uv4 = "TouchEventType"

			slot2(slot2, slot4.hide)

			uv2 = "ccui"

			slot2:resetCardClickState()
		end
	end)
end

function slot7.firstTime(slot0)
	if userDefault.getForeverLocalKey("townRestFirst", false) then
		return
	end

	uv4 = "userDefault"

	slot0.state:set(slot4.show)
	slot0.rightPanel:get("noData.tipBg.tipText"):text(gLanguageCsv.townRestFirstCome)
	userDefault.setForeverLocalKey("townRestFirst", true)
end

function slot7.updateDatas(slot0)
	slot0:unSchedule(66)

	slot1 = time.getTime() + 1 / slot0.reply * 3600

	slot0:schedule(function (slot0)
		uv2 = "time"

		if slot2 <= time.getTime() then
			uv1 = "getTime"
			slot1 = slot1.initCards

			slot1(slot1)

			uv1 = "getTime"

			slot1:updateDatas()

			return false
		end
	end, 1, 0, 66)
end

function slot7.initModel(slot0)
	slot1 = gGameModel.town
	slot2 = slot1
	uv2 = "level"
	slot0.level = slot1.read(slot2, "buildings")[slot2].level
	uv2 = "gGameModel"
	slot0.state = idler.new(slot2.hide)
	slot0.restCardDatas = idlers.newWithMap({})
	slot0.maxNum = csv.town.home[slot0.level].cardNum
	slot0.reply = csv.town.home[slot0.level].reply
	slot0.showCards = {}
	slot0.usedPos = {}
end

function slot7.initScrollView(slot0)
	slot0.mapScale = 1

	slot0.scrollView:getInnerContainer():scale(slot0.mapScale)
	slot0.scrollView:size(display.sizeInViewRect):xy(display.sizeInViewRect)
end

function slot7.initTopPanel(slot0)
	adapt.setTextScaleWithWidth(slot0.topPanel:get("text1"), nil, 160)
	adapt.oneLinePos(slot0.topPanel:get("text1"), slot0.positionNum, cc.p(5, 0))
	slot0.timeNum:text(slot0.reply .. gLanguageCsv.townRestHour)
	adapt.oneLinePos(slot0.topPanel:get("text2"), slot0.timeNum, cc.p(5, 0))
end

function slot7.initCards(slot0)
	slot1 = {}
	slot5 = "cards"

	for slot5, slot6 in pairs(gGameModel.town:read(slot5)) do
		if gGameModel.cards:find(slot5) then
			uv9 = "pairs"

			if slot6.status == slot9.REST then
				slot8 = slot7:read("card_id", "level", "star", "advance", "name")
				slot10 = csv.cards[slot8.card_id].unitID
				slot11 = csv.unit[slot10]

				table.insert(slot1, {
					select = false,
					speed = 200,
					dbID = slot5,
					unitId = slot10,
					name = slot11.name,
					status = slot6.status,
					energy = slot6.energy,
					energyMax = slot6.max_energy,
					energyRefreshTime = slot6.energy_refresh_time,
					rarity = slot11.rarity,
					advance = slot8.advance,
					star = slot8.star,
					level = slot8.level,
					needTime = (slot6.max_energy - slot6.energy) / slot0.reply * 3600 + slot6.energy_refresh_time - time.getTime()
				})
			end
		end
	end

	table.sort(slot1, function (slot0, slot1)
		return slot0.needTime < slot1.needTime
	end)
	slot0:initSpine(slot1)
	slot0.restCardDatas:update(slot1)
	slot0.noData:visible(itertools.size(slot1) == 0)
end

function slot7.initSpine(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		if not itertools.include(slot0.showCards, slot6.dbID) then
			slot7 = stringz.bintohex(slot6.dbID)
			slot13 = slot0.showCards
			uv13 = "ipairs"

			if slot0:initUnuesdPos()[math.random(1, math.max(itertools.size(slot13), slot13))] then
				slot0.usedPos[slot7] = slot9
				slot12 = slot0.bgPanel
				slot13 = 5
				uv12 = "itertools"
				uv13 = "itertools"
				slot10 = slot0.spinePanel:clone():addTo(slot12, slot13, slot7):xy(slot12[slot9].x, slot13[slot9].y)

				widget.addAnimationByKey(slot10:get("card"), csv.unit[slot6.unitId].unitRes, "spine", "standby_loop", 10):xy(slot10:get("card"):width() / 2, 0):anchorPoint(0.5, 0):scale(csv.unit[slot6.unitId].scale * 0.8):setSkin(csv.unit[slot6.unitId].skin)

				slot0.showCards[slot6.dbID] = slot6.dbID

				slot10:setTouchEnabled(true)
				bind.click(slot0, slot10, {
					method = function ()
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
				bind.touch(slot0, slot10:get("btnDown"), {
					methods = {
						ended = function ()
							uv0 = "onDownClick"
							uv2 = "onDownClick"

							slot0:onDownClick(slot2)
						end
					}
				})
				slot10:get("full"):hide()
				slot10:get("timePanel"):hide()
				slot10:get("circle"):hide()
				slot10:get("btnDown"):hide()

				if slot6.energyRefreshTime + (slot6.energyMax - slot6.energy) / slot0.reply * 60 * 60 <= time.getTime() then
					slot10:get("full"):y(slot10:get("card"):height() + (csv.unit[slot6.unitId].everyPos.headPos.y or 0) * csv.unit[slot6.unitId].scale * 0.3)
					slot10:get("full"):show()
				else
					slot0:schedule(function (slot0)
						uv2 = "time"

						if slot2 <= time.getTime() then
							uv1 = "getTime"

							slot1:get("full"):show()

							return false
						end
					end, 1, 0, "card" .. stringz.bintohex(slot6.dbID))
				end
			end
		end
	end

	for slot5, slot6 in ipairs(slot1) do
		if itertools.include(slot0.showCards, slot6.dbID) and slot0.bgPanel:get(stringz.bintohex(slot6.dbID)) then
			slot0:spineWalk(slot8, slot6)
		end
	end
end

function slot7.updateSpinePanelZ(slot0)
	slot0:scheduleUpdate(function ()
		uv1 = "pairs"

		for slot3, slot4 in pairs(slot1.usedPos) do
			uv5 = "pairs"

			if slot5.bgPanel:get(slot3) then
				uv5 = "pairs"
				uv8 = "pairs"

				slot5.bgPanel:get(slot3):z(display.sizeInView.width - slot8.bgPanel:get(slot3):y())
			end
		end
	end)
end

function slot7.onStateClick(slot0)
	slot0.state:modify(function (slot0)
		return true, slot0 * -1
	end)
end

function slot7.initUnuesdPos(slot0)
	slot1 = {}
	slot2 = {
		[slot7] = true
	}

	for slot6, slot7 in pairs(slot0.usedPos) do
		-- Nothing
	end

	uv4 = "pairs"

	for slot6, slot7 in ipairs(slot4) do
		if not slot2[slot6] then
			table.insert(slot1, slot6)
		end
	end

	return slot1
end

function slot7.spineWalk(slot0, slot1, slot2)
	slot0.walkingMap = slot0.walkingMap or {}

	if slot0.walkingMap[stringz.bintohex(slot2.dbID)] then
		return
	end

	slot0.walkingMap[slot3] = true
	slot5 = math.random(8, 15)
	slot6 = slot0:initUnuesdPos()
	slot7 = slot6[math.random(1, itertools.size(slot6))]

	if math.random(0, 1) == 0 and slot7 then
		uv8 = "stringz"
		slot8 = slot8[slot0.usedPos[slot3]]
		slot0.usedPos[slot3] = slot7
		uv11 = "stringz"
		slot12 = slot8.x
		uv12 = "stringz"
		slot12 = slot12[slot7].x - slot8.x
		uv12 = "stringz"
		slot13 = slot8.y
		uv13 = "stringz"
		slot14 = slot8.y
		slot11 = slot0.bgPanel
		slot13 = slot3
		uv13 = "stringz"
		uv14 = "stringz"

		transition.executeSequence(slot11:get(slot13), true):func(function ()
			uv0 = "x"
			uv1 = "get"
			uv1 = "card"

			if slot0[slot1].x - slot1.x < 0 then
				uv0 = "scaleX"
				uv3 = "scaleX"

				slot0:get("card"):scaleX(math.abs(slot3:get("card"):scaleX()) * -1)
			end

			uv0 = "scaleX"

			slot0:get("card.spine"):play("run_loop")
		end):moveTo(math.floor(math.sqrt((slot11[slot7].x - slot12) * slot12 + (slot12[slot7].y - slot13) * (slot13[slot7].y - slot14)) / slot2.speed), slot13[slot7].x, slot14[slot7].y):func(function ()
			uv0 = "x"
			uv1 = "get"
			uv1 = "card"

			if slot0[slot1].x - slot1.x < 0 then
				uv0 = "scaleX"
				uv3 = "scaleX"

				slot0:get("card"):scaleX(math.abs(slot3:get("card"):scaleX()))
			end

			uv0 = "scaleX"
			slot0 = slot0:get("card.spine")
			slot1 = slot0
			slot0 = slot0.play

			slot0(slot1, "standby_loop")

			uv0 = "math"
			slot0 = slot0.walkingMap
			uv1 = "abs"
			slot2 = false
			slot0[slot1] = slot2
			uv0 = "math"
			uv2 = "scaleX"
			uv3 = "card.spine"

			slot0:spineWalk(slot2, slot3)
		end):done()

		return
	end

	performWithDelay(slot1, function ()
		uv0 = "get"
		slot0 = slot0:get("card")
		slot1 = slot0
		slot0 = slot0.scaleX
		uv3 = "get"
		slot3 = slot3:get("card")
		slot3 = slot3.scaleX

		slot0(slot1, math.abs(slot3(slot3)))

		uv0 = "card"
		slot0 = slot0.walkingMap
		uv1 = "scaleX"
		slot2 = false
		slot0[slot1] = slot2
		uv0 = "card"
		uv2 = "get"
		uv3 = "math"

		slot0:spineWalk(slot2, slot3)
	end, slot5)
end

function slot7.clickSpinePanel(slot0, slot1, slot2)
	slot0:resetCardClickState()

	uv5 = "resetCardClickState"

	slot0.state:set(slot5.hide)

	slot3 = 1
	slot5 = cc.RepeatForever:create(cc.Sequence:create(cc.ScaleTo:create(slot3, 1.1), cc.ScaleTo:create(slot3, 0.9)))

	if slot2.energyRefreshTime + (slot2.energyMax - slot2.energy) / slot0.reply * 60 * 60 <= time.getTime() then
		slot0:onDownClick(slot2)
		slot1:get("circle"):hide()
		slot1:get("btnDown"):hide()
	else
		bind.extend(slot0, slot1:get("timePanel.time"), {
			class = "cutdown_label",
			props = {
				endTime = slot7,
				endFunc = function ()
					uv0 = "get"

					slot0:get("timePanel"):hide()
				end
			}
		})
		slot1:get("circle"):runAction(slot5)
		slot1:get("circle"):show()
		slot1:get("btnDown"):show()
		slot1:get("timePanel"):y(slot1:get("card"):height() + (csv.unit[slot2.unitId].everyPos.headPos.y or 0) * 0.8)
		adapt.oneLineCenterPos(cc.p(slot1:get("timePanel"):size().width / 2, slot1:get("timePanel.time"):y()), {
			slot1:get("timePanel.timeImg"),
			slot1:get("timePanel.time")
		}, cc.p(6, 0))
		slot1:get("full"):hide()
		slot1:get("timePanel"):show()
	end
end

function slot7.resetCardClickState(slot0)
	for slot4, slot5 in pairs(slot0.showCards) do
		slot6 = slot0.bgPanel:get(stringz.bintohex(slot4))

		slot6:get("timePanel"):hide()
		slot6:get("circle"):hide()
		slot6:get("btnDown"):hide()
	end
end

function slot7.onRestClick(slot0)
	gGameUI:stackUI("city.town.rest_detail", nil, , {
		cb = slot0:createHandler("initCards")
	})
end

function slot7.onDownClick(slot0, slot1)
	if slot1.energyRefreshTime + (slot1.energyMax - slot1.energy) / slot0.reply * 60 * 60 <= time.getTime() then
		function ()
			uv1 = "stringz"
			slot0 = stringz.bintohex(slot1.dbID)
			uv6 = "stringz"

			gGameApp:requestServer("/town/home/card/remove", function (slot0)
				uv1 = "initCards"
				slot1 = slot1.initCards

				slot1(slot1)

				uv1 = "initCards"
				uv3 = "bgPanel"

				if slot1.bgPanel:get(slot3) then
					uv1 = "initCards"

					if slot1.walkingMap then
						uv1 = "initCards"
						uv2 = "bgPanel"
						slot1.walkingMap[slot2] = false
					end

					uv1 = "initCards"
					uv3 = "bgPanel"

					slot1.bgPanel:get(slot3):removeSelf()
				end

				uv1 = "initCards"
				uv2 = "get"
				slot2 = slot2.dbID
				slot1.showCards[slot2] = nil
				uv2 = "get"
				slot2 = slot2.dbID
				slot1 = stringz.bintohex(slot2)
				uv2 = "initCards"
				slot2 = slot2.usedPos
				slot2[slot1] = nil
				uv2 = "initCards"

				slot2:unSchedule("card" .. slot1)
			end, {
				slot6.dbID
			})
		end()
		gGameUI:showTip(string.format(gLanguageCsv.townRestFullAndLeave, slot1.name))
	else
		gGameUI:showDialog({
			isRich = false,
			btnType = 2,
			clearFast = true,
			cb = slot4,
			title = gLanguageCsv.spaceTips,
			content = string.format(gLanguageCsv.townRestDownConfirm, slot1.name),
			size = {
				width = 850,
				height = 450
			},
			dialogParams = {
				clickClose = false
			}
		})
	end
end

function slot7.onItemClick(slot0, slot1, slot2, slot3, slot4)
	slot0:onDownClick(slot3)
end

function slot7.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1000
	})
end

function slot7.gotoTownClick(slot0)
	jumpEasy.jumpTo("town")
end

function slot7.getRuleContext(slot0, slot1)
	slot2 = slot0.level
	slot5 = csv.town.home[slot2 + 1]

	if csvSize(csv.town.home) < slot2 + 1 then
		table.insert({
			adaptContext.clone(slot1.title, function (slot0)
				slot0:get("text"):text(gLanguageCsv.levelIntro)
			end),
			string.format(gLanguageCsv.townHomeLvUpTip, slot2 + 1)
		}, gLanguageCsv.townRestLevelMax)
	else
		for slot9 = 1, math.huge do
			if not slot5["notice" .. slot9] or slot5["notice" .. slot9] == "" then
				break
			end

			table.insert(slot4, string.format("  %d.%s", slot9, slot5["notice" .. slot9]))
		end
	end

	return slot4
end

return slot7
