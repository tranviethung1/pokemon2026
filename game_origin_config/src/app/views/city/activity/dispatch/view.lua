slot1 = class("DispatchView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "activity_dispatch_main.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	["leftDownPanel.btnRule.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(90, 84, 91, 255)
				}
			}
		}
	},
	["leftDownPanel.btnRule"] = {
		varname = "btnRule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnRuleClick")
			}
		}
	},
	["leftDownPanel.btnTask"] = {
		varname = "btnTask",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onBtnTaskClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "dispatchTaskType",
					listenData = {
						activityId = bindHelper.self("activityId")
					},
					onNode = function (slot0)
						slot0:xy(120, 135)
					end
				}
			}
		}
	},
	["leftDownPanel.btnTask.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(90, 84, 91, 255)
				}
			}
		}
	},
	scrollView = {
		varname = "scrollView",
		binds = {
			event = "scrollBarEnabled",
			data = false
		}
	},
	["item.cdPanel.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(255, 252, 237, 255)
				}
			}
		}
	},
	["rightDownPanel.textCountDown"] = {
		varname = "textCountDown",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(91, 84, 91, 255)
				}
			}
		}
	},
	["rightDownPanel.textNote"] = {
		varname = "textCountDownNote",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(91, 84, 91, 255)
				}
			}
		}
	}
}

function slot2(slot0, slot1, slot2)
	function slot3(slot0, slot1)
		table.insert({}, {
			x = slot0.x,
			y = slot0.y
		})

		for slot10 = 1, math.max(0, math.floor(math.max(math.abs(slot1.x - slot0.x), math.abs(slot1.y - slot0.y)) / 45) - 1) do
			table.insert(slot2, {
				x = slot0.x + slot10 * slot3 / (slot6 + 1) * (slot0.x <= slot1.x and 1 or -1) + math.random(0, 8),
				y = slot0.y + slot10 * slot4 / (slot6 + 1) * (slot0.y <= slot1.y and 1 or -1) + math.random(0, 8)
			})
		end

		return slot2
	end

	slot4 = {}

	for slot8 = 2, itertools.size(slot1.frontWay or {}) do
		slot9 = slot1.frontWay[slot8 - 1]
		slot10 = slot1.frontWay[slot8]

		for slot15, slot16 in ipairs(slot3({
			x = slot9[1],
			y = slot9[2]
		}, {
			x = slot10[1],
			y = slot10[2]
		})) do
			slot17 = cc.Sprite:create("city/gate/logo_path.png")

			slot17:visible(false)
			slot17:xy(slot16.x + slot2, slot16.y)
			slot0:addChild(slot17, 9, "point")
			table.insert(slot4, slot17)
		end
	end

	return slot4
end

function slot1.onBtnRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, {}, slot0:createHandler("getRuleContext"), {
		width = 1000
	})
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(124201),
		slot2.noteText(124202, 124300)
	}
end

function slot1.onBtnTaskClick(slot0)
	gGameUI:stackUI("city.activity.dispatch.task", nil, {
		clickClose = true
	}, slot0.activityId)
end

function slot1.onCreate(slot0, slot1, slot2)
	slot0.activityId = slot1

	slot0:enableSchedule()
	gGameUI.topuiManager:createView("activity_dispatch", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "DISPATCH",
		title = gLanguageCsv.activityDispatch,
		actionPointKey = csv.yunying.yyhuodong[slot0.activityId].paramMap.item
	})
	slot0:initMap()
	slot0:initModel()
	adapt.oneLinePos(slot0.textCountDownNote, slot0.textCountDown, cc.p(0, 0))
	slot0:endTimeCountDown()
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "unScheduleAll"
		slot2 = slot2.unScheduleAll

		slot2(slot2)

		uv2 = "unScheduleAll"
		slot3 = (slot1[slot2.activityId] or {}).dispatch or {}
		slot4 = 0

		for slot8, slot9 in pairs(slot3) do
			uv10 = "unScheduleAll"

			slot10.gameCfg[slot8].item:removeChildByName("rewardEffect")

			if csv.yunying.dispatch[slot8].times <= slot3[slot8].times then
				slot10:get("dispatchingPanel"):hide()
				slot10:get("completePanel"):show()
				slot10:get("cdPanel"):hide()
				slot10:get("lockPanel"):show()
				slot10:get("posIcon"):texture("activity/dispatch/51send_ywc.png"):scale(1):y(85)
				slot10:setTouchEnabled(false)
				slot10:get("canDispatchImg"):hide()
			elseif slot9.status == 1 then
				slot10:get("dispatchingPanel"):show()
				slot10:get("completePanel"):hide()
				slot10:get("cdPanel"):hide()
				slot10:get("lockPanel"):hide()
				slot10:get("canDispatchImg"):hide()

				if slot3[slot8].end_time < time.getTime() then
					slot10:get("dispatchingPanel.imgIcon"):texture("common/icon/icon_box4.png"):scale(1.5)
					widget.addAnimationByKey(slot10, "effect/guanqiabaoxiang.skel", "rewardEffect", "effect_loop", 2):xy(100, 200):scale(0.5)
				else
					slot12 = slot10:get("dispatchingPanel.imgIcon")
					slot12 = slot12.texture

					slot12(slot12, dataEasy.getUnitCsv(slot9.cards[1].card_id, slot9.cards[1].skin_id).iconSimple)

					uv12 = "unScheduleAll"

					slot12:schedule(function (slot0)
						uv2 = "time"
						uv3 = "getTime"

						if slot2[slot3].end_time < time.getTime() then
							uv1 = "end_time"
							slot1 = slot1:get("dispatchingPanel.imgIcon"):texture("common/icon/icon_box4.png")
							slot2 = slot1

							slot1.scale(slot2, 1.5)

							uv2 = "end_time"

							widget.addAnimationByKey(slot2, "effect/guanqiabaoxiang.skel", "rewardEffect", "effect_loop", 2):xy(100, 200):scale(0.5)

							return false
						end
					end, slot8)
				end
			elseif slot9.status == 2 then
				slot10:get("dispatchingPanel"):hide()
				slot10:get("completePanel"):hide()

				if slot3[slot8].cd_time and time.getTime() < slot3[slot8].cd_time then
					slot10:get("cdPanel"):show()

					slot11 = slot10:get("lockPanel")
					slot11 = slot11.hide

					slot11(slot11)

					uv11 = "unScheduleAll"

					slot11:countDown(slot10:get("cdPanel"), slot3[slot8].cd_time, slot8)
					slot10:get("canDispatchImg"):hide()
				else
					slot10:get("cdPanel"):hide()
					slot10:get("lockPanel"):show()
					slot10:get("canDispatchImg"):show()
					slot10:get("canDispatchImg"):stopAllActions()
				end
			end

			uv11 = "unScheduleAll"

			if slot11.gameCfg[slot8].data.type == 1 then
				slot4 = math.max(slot4, slot8)
			end
		end

		uv5 = "unScheduleAll"
		slot5 = slot5.moveToDispatch

		slot5(slot5, slot4)

		uv5 = "unScheduleAll"

		slot5:setSelEffect(slot4)
	end)
end

function slot1.initMap(slot0)
	slot0.gameCfg = {}

	for slot4, slot5 in orderCsvPairs(csv.yunying.dispatch) do
		if slot5.huodongID == csv.yunying.yyhuodong[slot0.activityId].huodongID then
			slot0.gameCfg[slot4] = {
				data = slot5,
				id = slot4
			}
		end
	end

	slot0.scrollView:size(display.sizeInViewRect):xy(display.sizeInViewRect)

	for slot4, slot5 in pairs(slot0.gameCfg) do
		slot6 = slot0.item:clone():addTo(slot0.scrollView):show():xy(slot5.data.position):z(10)
		slot0.gameCfg[slot4].item = slot6

		slot6:get("lockPanel"):show()
		slot6:get("lockPanel.text"):text(slot5.data.numText)
		bind.touch(slot0.scrollView, slot6, {
			methods = {
				ended = functools.partial(slot0.clickGateItem, slot0, slot5.id)
			}
		})
		slot6:get("posIcon"):texture(slot5.data.icon):scale(1):y(85)

		if slot5.data.type == 3 then
			slot6:get("posIcon"):scale(2):y(120)
		end

		uv7 = "gameCfg"

		for slot11, slot12 in ipairs(slot7(slot0.scrollView, slot5.data, 0)) do
			slot12:visible(true)
		end

		slot0.gameCfg[slot4].item:get("canDispatchImg"):hide()
	end
end

function slot1.moveToDispatch(slot0, slot1)
	slot2 = slot0.gameCfg[slot1].item
	slot3 = slot0.scrollView:size()

	slot0.scrollView:setInnerContainerPosition(cc.p(math.max(-slot0.scrollView:getInnerContainerSize().width + slot3.width, math.min(0, slot3.width / 2 - slot2:x())), math.max(-slot0.scrollView:getInnerContainerSize().height + slot3.height, math.min(0, slot3.height / 2 - slot2:y()))))
end

function slot1.setSelEffect(slot0, slot1)
	slot0.selEffectId = slot1

	if not slot0.selEffect then
		slot0.selEffect = CSprite.new("level/xuanguan.skel")

		slot0.selEffect:play("effect_loop")
		slot0.selEffect:visible(true)
		slot0.selEffect:retain()
	end

	slot3 = cc.p(100, -80)

	if slot0.gameCfg[slot1].item:get("dispatchingPanel"):isVisible() then
		slot3 = cc.p(100, 120)
	elseif slot2:get("completePanel"):isVisible() then
		slot0.selEffect:hide()

		return
	elseif slot2:get("cdPanel"):isVisible() then
		slot3 = cc.p(100, 10)
	elseif slot2:get("lockPanel"):isVisible() then
		slot3 = (csv.yunying.dispatch[slot1].type ~= 3 or cc.p(100, 0)) and cc.p(100, -80)
	end

	if slot2 and slot0.selEffect then
		slot0.selEffect:removeFromParent()
		slot0.selEffect:addTo(slot2, 100, "selEffect")
		slot0.selEffect:xy(slot3)
		slot0.selEffect:retain()

		return slot0.selEffect
	end
end

function slot1.clickGateItem(slot0, slot1)
	if csv.yunying.dispatch[slot1].type == 3 then
		slot5 = csv.yunying.dispatch[slot1].award

		if ((slot0.yyhuodongs:read()[slot0.activityId] or {}).dispatch or {})[slot1] and slot4[slot1].status == 2 then
			gGameUI:showDialog({
				btnType = 2,
				content = string.format(gLanguageCsv.dispatchBoxTip1, csv.yunying.dispatch[slot1].cost[csv.yunying.yyhuodong[slot0.activityId].paramMap.item]),
				cb = function ()
					uv1 = "csv"
					slot2 = csv.yunying.yyhuodong[slot1.activityId].paramMap.item
					uv2 = "yunying"

					if dataEasy.getNumByKey(slot2) < slot2 then
						gGameUI:showTip(gLanguageCsv.actionPointNotEnough)

						return
					end

					uv6 = "csv"
					uv7 = "yyhuodong"

					gGameApp:requestServer("/game/yy/dispatch/begin", function (slot0)
						gGameUI:showGainDisplay(slot0)
					end, slot6.activityId, slot7)
				end
			})
		else
			gGameUI:showBoxDetail({
				state = 1,
				data = slot5,
				content = string.format(gLanguageCsv.dispatchBoxTip2, slot7)
			})
		end
	else
		gGameUI:stackUI("city.activity.dispatch.sprite_select", nil, {
			clickClose = true,
			blackLayer = true
		}, slot0.activityId, slot1)
	end

	slot0:setSelEffect(slot1)
end

function slot1.countDown(slot0, slot1, slot2, slot3)
	function ()
		uv0 = "get"
		slot1 = slot0
		slot0 = slot0.get(slot1, "text")
		uv1 = "get"
		slot1, slot2 = slot1:getPosition()
		uv4 = "text"
		slot4 = slot0.text

		slot4(slot0, time.getCutDown(slot4 - time.getTime()).str)

		uv4 = "get"
		slot4 = slot4:get("imgBg")
		slot4 = slot4.width

		slot4(slot4, slot0:width() + 20)

		uv4 = "text"

		if slot4 - time.getTime() <= 0 then
			uv4 = "getPosition"
			uv5 = "time"
			slot4 = slot4.gameCfg[slot5].item:get("cdPanel")
			slot5 = slot4
			slot4 = slot4.hide

			slot4(slot5)

			uv4 = "getPosition"
			uv5 = "time"
			slot6 = "lockPanel"
			slot4 = slot4.gameCfg[slot5].item:get(slot6)
			slot4 = slot4.show

			slot4(slot4)

			uv4 = "getPosition"
			uv6 = "getPosition"

			slot4:selEffect(slot6.selEffectId)

			return false
		end

		return true
	end()
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
	end, 1, 0, slot3)
end

function slot1.endTimeCountDown(slot0)
	slot0:enableSchedule():unSchedule(99)

	if gGameModel.role:read("yy_endtime")[slot0.activityId] - time.getTime() <= 0 then
		slot0.textCountDownNote:text(gLanguageCsv.activityOver)
		slot0.textCountDown:text("")

		return
	end

	bind.extend(slot0, slot0.textCountDown, {
		class = "cutdown_label",
		props = {
			tag = 99,
			endTime = slot2,
			strFunc = function (slot0)
				return slot0.str
			end,
			endFunc = function ()
				uv0 = "endTimeCountDown"

				slot0:endTimeCountDown()
			end
		}
	})
end

return slot1
