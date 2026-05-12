slot0 = {
	received = 3,
	noReach = 2,
	canReceive = 1
}
slot1 = require("app.views.city.activity.view")
slot2 = class("ActivityRechargeGift", cc.load("mvc").ViewBase)
slot3 = matchLanguage({
	"cn"
}) and 10 or 1

function slot4(slot0, slot1)
	return cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(0.1), cc.MoveTo:create(0.3, cc.p(slot0, slot1 + 10)), cc.DelayTime:create(0.1), cc.MoveTo:create(0.3, cc.p(slot0, slot1))))
end

slot2.RESOURCE_FILENAME = "activity_recharge_gift.json"
slot2.RESOURCE_BINDING = {
	itemBox = "boxItem",
	item = "item",
	bigTarget = "icon",
	barBg = "barBg",
	rmb = "rmb",
	recievedBtn = "recievedBtn",
	txtBg = "txtBg",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("datas"),
				item = bindHelper.self("item"),
				dataOrderCmp = dataEasy.sortItemCmp,
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							data = slot3,
							onNode = function (slot0)
								slot0:y(185)
							end
						}
					})
					slot1:get("name"):text(uiEasy.setIconName(slot3.key, slot3.num))
					slot1:get("name"):getVirtualRenderer():setLineSpacing(-15)
					text.addEffect(slot1:get("name"), {
						outline = {
							color = ui.COLORS.OUTLINE.WHITE
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	},
	target = {
		binds = {
			event = "extend",
			class = "icon_key",
			props = {
				data = bindHelper.self("targetData")
			}
		}
	},
	boxList = {
		varname = "boxList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("boxData"),
				item = bindHelper.self("boxItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("icon", "select", "light").select:visible(slot3.selected == true)

					slot5 = slot4.icon
					slot6 = slot5
					uv9 = "multiget"

					slot5.texture(slot6, "common/icon/icon_signin_box2" .. (slot3.state == slot9.received and "_open.png" or ".png"))

					uv6 = "multiget"

					if slot3.state == slot6.canReceive then
						slot6 = widget.addAnimation(slot1, "effect/jiedianjiangli.skel", "effect_loop", slot4.icon:z() - 1)

						slot6:scale(0.5):x(slot4.icon:x() - slot4.icon:size().width / 2 + 35):y(slot4.icon:y() - 16)

						slot1.effectBox = slot6
					elseif not slot5 and slot1.effectBox then
						slot1.effectBox:hide()
						slot1.effectBox:removeFromParent()

						slot1.effectBox = nil
					end

					slot4.light:hide()
					bind.touch(slot0, slot4.icon, {
						methods = {
							ended = functools.partial(slot0.clickBox, slot2, slot3, slot1)
						}
					})

					if not slot3.originY then
						slot3.originX, slot3.originY = slot4.select:xy()
					end

					if not slot3.action then
						uv6 = "icon"
						slot6 = slot6(slot3.originX, slot3.originY)
					end

					slot3.action = slot6

					slot4.select:stopAction(slot3.action)

					if slot3.selected then
						uv6 = "icon"
						slot3.action = slot6(slot3.originX, slot3.originY)

						slot4.select:runAction(slot3.action)
					end
				end
			},
			handlers = {
				clickBox = bindHelper.self("onBoxClick")
			}
		}
	},
	timeTxt = {
		varname = "timeLabel",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = ui.COLORS.OUTLINE.WHITE
					}
				}
			}
		}
	},
	time = {
		varname = "time",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = ui.COLORS.OUTLINE.WHITE
					}
				}
			}
		}
	},
	bar = {
		varname = "bar",
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				maskImg = "common/icon/mask_bar_red.png",
				data = bindHelper.self("barPoint")
			}
		}
	},
	recieveBtn = {
		varname = "recieveBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRecieveClick")
			}
		}
	},
	rechargeBtn = {
		varname = "rechargeBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRechargeClick")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0.activityID = slot1
	slot4 = (gGameModel.role:read("yy_hdid") or {})[slot1] or csv.yunying.yyhuodong[slot1].huodongID
	slot0.originX = slot0.list:x()
	slot0.boxData = idlers.new()
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.boxIndex = idler.new(1)
	slot0.currDay = idler.new(0)
	slot0.rechargeNum = idler.new(0)
	slot5 = {
		15,
		35,
		55,
		75,
		100
	}
	slot0.barPoint = idler.new(0)

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "stamps"
		slot2 = slot1[slot2] or {}
		uv5 = "info"
		uv7 = "rechargesum"

		slot5.rechargeNum:set((slot2.info.rechargesum or 0) / slot7)

		slot5 = {}
		slot6 = 0
		slot7 = slot2.info.lastdaysum or 0
		slot8 = slot2.info.daysum or 0

		for slot12, slot13 in orderCsvPairs(csv.yunying.rechargegift) do
			uv15 = "rechargeNum"

			if slot13.huodongID == slot15 then
				uv14 = "set"
				slot14 = slot14.noReach

				if (slot2.stamps or {})[slot12] == 1 then
					uv15 = "set"
					slot14 = slot15.canReceive
				elseif slot3[slot12] == 0 then
					uv15 = "set"
					slot14 = slot15.received
				end

				uv15 = "info"
				uv17 = "rechargesum"
				slot15.money = slot13.amount / slot17

				if csvNext(slot13.special) then
					slot15, slot16 = csvNext(slot13.special)
					uv17 = "info"
					slot17.targetData = idlertable.new({
						key = slot15,
						num = slot16
					})
				end

				table.insert(slot5, {
					csvId = slot12,
					cfg = slot13,
					state = slot14
				})
			end
		end

		table.sort(slot5, function (slot0, slot1)
			return slot0.cfg.daySum < slot1.cfg.daySum
		end)

		uv11 = "info"

		slot11.currDay:set(math.min(slot7 ~= slot8 and slot8 or slot7 + 1, #slot5))

		if slot8 ~= slot7 then
			uv12 = "set"

			if slot5[slot8].state == slot12.noReach then
				uv11 = "info"
				uv14 = "lastdaysum"

				slot11.barPoint:set(mathEasy.showProgress(slot14, {
					1,
					2,
					3,
					4,
					5
				}, slot8 - 1))
			else
				uv11 = "info"
				uv14 = "lastdaysum"

				slot11.barPoint:set(mathEasy.showProgress(slot14, {
					1,
					2,
					3,
					4,
					5
				}, slot8))
			end
		else
			uv11 = "info"
			uv14 = "lastdaysum"

			slot11.barPoint:set(mathEasy.showProgress(slot14, {
				1,
				2,
				3,
				4,
				5
			}, slot8))
		end

		uv11 = "info"
		slot11 = slot11.boxData
		slot11 = slot11.update
		slot13 = slot5

		slot11(slot11, slot13)

		uv11 = "info"
		uv13 = "info"

		slot11.boxIndex:set(slot13.currDay:read(), true)
	end)
	slot0.boxIndex:addListener(function (slot0, slot1)
		uv2 = "boxData"
		slot2 = slot2.boxData:atproxy(slot1)
		slot2.selected = false
		uv2 = "boxData"
		slot2.boxData:atproxy(slot0).selected = true
	end)
	idlereasy.any({
		slot0.currDay,
		slot0.boxIndex
	}, function (slot0, slot1, slot2)
		slot3 = {}
		uv4 = "boxData"

		for slot8, slot9 in csvMapPairs(slot4.boxData:atproxy(slot2).cfg.award) do
			if slot8 == "cards" then
				for slot13, slot14 in ipairs(slot9) do
					table.insert(slot3, {
						key = "card",
						num = slot14
					})
				end
			else
				table.insert(slot3, {
					key = slot8,
					num = slot9
				})
			end
		end

		uv5 = "boxData"
		slot5 = slot5.list
		slot5 = slot5.setItemsMargin

		slot5(slot5, #slot3 == 3 and 50 or 20)

		uv5 = "boxData"

		if not slot5.datas then
			uv5 = "boxData"
			slot5.datas = idlers.newWithMap(slot3)
		else
			uv5 = "boxData"

			slot5.datas:update(slot3)
		end

		slot6 = {
			slot7,
			slot7,
			slot7.recievedBtn
		}
		uv7 = "boxData"
		uv7 = "boxData"
		slot7 = slot7.recieveBtn.rechargeBtn
		uv7 = "boxData"

		itertools.invoke(slot6, "hide")

		uv6 = "atproxy"

		if slot4.state == slot6.canReceive then
			uv5 = "boxData"
			slot5 = slot5.recieveBtn
			slot6 = slot5

			slot5.show(slot6)

			uv6 = "boxData"

			text.addEffect(slot6.recieveBtn:get("label"), {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			})
		else
			uv6 = "atproxy"

			if slot4.state == slot6.noReach then
				if slot2 == slot1 then
					uv5 = "boxData"
					slot5 = slot5.rechargeBtn
					slot6 = slot5

					slot5.show(slot6)

					uv6 = "boxData"

					text.addEffect(slot6.rechargeBtn:get("label"), {
						glow = {
							color = ui.COLORS.GLOW.WHITE
						}
					})
				else
					uv5 = "boxData"
					slot5 = slot5.recievedBtn
					slot5 = slot5.show

					slot5(slot5)

					uv5 = "boxData"
					slot5 = slot5.recievedBtn:get("label")
					slot6 = slot5

					slot5.text(slot6, gLanguageCsv.notOpen)

					uv6 = "boxData"

					text.addEffect(slot6.recievedBtn:get("label"), {
						color = cc.c4b(249, 159, 126, 255),
						outline = {
							size = 8,
							color = ui.COLORS.OUTLINE.WHITE
						}
					})
				end
			else
				uv5 = "boxData"
				slot5 = slot5.recievedBtn
				slot5 = slot5.show

				slot5(slot5)

				uv5 = "boxData"
				slot5 = slot5.recievedBtn:get("label")
				slot6 = slot5

				slot5.text(slot6, gLanguageCsv.received)

				uv6 = "boxData"

				text.addEffect(slot6.recievedBtn:get("label"), {
					color = cc.c4b(249, 159, 126, 255),
					outline = {
						size = 8,
						color = ui.COLORS.OUTLINE.WHITE
					}
				})
			end
		end
	end)
	idlereasy.when(slot0.rechargeNum, function (slot0, slot1)
		uv2 = "txtBg"

		if slot2.txtBg:get("txt") then
			uv2 = "txtBg"

			slot2.txtBg:get("txt"):removeFromParent()
		end

		slot2 = rich.createByStr
		slot3 = string.format
		slot4 = gLanguageCsv.activityRechargeGift
		uv5 = "txtBg"

		if slot5.money - slot1 >= 0 then
			uv5 = "txtBg"

			if not (slot5.money - slot1) then
				slot5 = 0
			end
		end

		slot4 = 40
		uv4 = "txtBg"
		slot4 = slot4.txtBg
		uv4 = "txtBg"
		slot2 = slot2(slot3(slot4, slot5), slot4):addTo(slot4, 10, "txt"):alignCenter(slot4.txtBg:size())
	end)

	if matchLanguage({
		"cn"
	}) then
		slot0.rmb:texture(string.format("activity/recharge_gift/txt_%dy.png", slot0.money))
	else
		slot0.rmb:texture(string.format("activity/recharge_gift/txt_%d.png", slot0.money)):scale(1.6)
	end

	slot6 = slot0.icon:texture(slot2.clientParam.hero)
	slot6 = slot6.scale

	slot6(slot6, 2)

	uv6 = "yunying"

	slot6.setCountdown(slot0, slot1, slot0.timeLabel, slot0.time, {
		labelChangeCb = function ()
			uv1 = "adapt"
			uv2 = "adapt"

			adapt.oneLinePos(slot1.timeLabel, slot2.time, cc.p(15, 0))
		end
	})
end

function slot2.onBoxClick(slot0, slot1, slot2, slot3)
	slot0.boxIndex:set(slot2)
end

function slot2.onRecieveClick(slot0)
	slot1 = slot0.boxIndex:read()

	gGameApp:requestServerCustom("/game/yy/award/get"):params(slot0.activityID, slot0.boxData:atproxy(slot0.boxIndex:read()).csvId):onResponse(function (slot0)
		uv1 = "boxList"
		slot1 = slot1.boxList
		slot2 = slot1
		uv2 = "getChildren"

		uiEasy.setBoxEffect(slot1.getChildren(slot2)[slot2], 1, function ()
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
		end, 35, 5)
	end):wait({
		false
	}):doit(function (slot0)
		gGameUI:showGainDisplay(slot0)
	end)
end

function slot2.onRechargeClick(slot0)
	gGameUI:stackUI("city.recharge", nil, {
		full = true
	})
end

return slot2
