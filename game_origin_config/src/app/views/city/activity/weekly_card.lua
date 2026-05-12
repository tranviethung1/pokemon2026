slot0 = {
	CAN_NOT_GOTTEN = 2,
	CAN_GOTTEN = 1,
	GOTTEN = 0
}
slot1 = {
	GET = 2,
	BUY = 1
}
slot2 = class("ActivityWeeklyCardDialog", Dialog)
slot2.RESOURCE_FILENAME = "activity_weekly_card.json"
slot2.RESOURCE_BINDING = {
	atlasLabel1 = "atlasLabel1",
	item = "item",
	imgAward2 = "imgAward2",
	imgAward1 = "imgAward1",
	iconItem = "iconItem",
	imgGift = "imgGift",
	atlasLabel2 = "atlasLabel2",
	imgTitle = "imgTitle",
	textTitle = "textTitle",
	btnBuy = {
		varname = "btnBuy",
		binds = {
			{
				clicksafe = true,
				event = "touch",
				methods = {
					ended = bindHelper.self("buyWeeklyCard")
				}
			},
			{
				event = "visible",
				idler = bindHelper.self("notbuy")
			}
		}
	},
	btnBought = {
		varname = "btnBought",
		binds = {
			event = "visible",
			idler = bindHelper.self("buy")
		}
	},
	text1 = {
		varname = "text1",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(230, 100, 80, 255)
				}
			}
		}
	},
	text2 = {
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 3,
						color = cc.c4b(230, 100, 80, 255)
					}
				}
			}
		}
	},
	textCountDown = {
		varname = "textCountDown",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 3,
						color = cc.c4b(230, 100, 80, 255)
					}
				}
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				data = bindHelper.self("itemsData"),
				item = bindHelper.self("item"),
				preloadCenter = bindHelper.self("preloadCenter"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot0.initItem(slot1, slot2, slot3)
				end
			},
			handlers = {
				initItem = bindHelper.self("initItem")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0.activityId = slot1

	slot0:initModel()
	slot0:initData()
	slot0:initTitle()
	gGameModel.currday_dispatch:getIdlerOrigin("newPlayerWeffare"):set(true)
end

function slot2.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.itemsData = idlertable.new({})
	slot0.date = idler.new("")
	slot0.buy = idler.new()
	slot0.notbuy = idler.new()
end

function slot2.initData(slot0)
	slot1 = {
		[slot8.day] = {
			award = slot8.award,
			id = slot7
		}
	}

	for slot7, slot8 in csvPairs(csv.yunying.weeklycard) do
		if slot8.huodongID == csv.yunying.yyhuodong[slot0.activityId].huodongID then
			-- Nothing
		end
	end

	slot0.clientBuyTimes = idler.new(true)

	idlereasy.any({
		slot0.yyhuodongs,
		slot0.clientBuyTimes
	}, function (slot0, slot1)
		uv2 = "activityId"
		slot2 = slot1[slot2.activityId] or {}
		uv5 = "pairs"

		for slot7, slot8 in pairs(slot5) do
			if slot2.stamps == nil then
				slot10 = slot8.id
				uv10 = "stamps"
			elseif slot2.stamps[slot8.id] == nil then
				slot10 = slot8.id
				uv10 = "stamps"
				slot3[slot7] = {
					award = slot8.award,
					id = slot10,
					getType = slot10.CAN_NOT_GOTTEN
				}
			else
				slot9 = {
					award = slot8.award,
					id = slot8.id,
					getType = slot2.stamps[slot8.id]
				}
				slot3[slot7] = slot9
				uv9 = "activityId"

				if not slot9.preloadCenter then
					uv10 = "stamps"

					if slot3[slot7].getType == slot10.CAN_GOTTEN then
						uv9 = "activityId"
						slot9.preloadCenter = slot7
					end
				end
			end
		end

		uv4 = "activityId"
		slot6 = {
			[slot7] = {
				award = slot8.award,
				id = slot10,
				getType = slot10.CAN_NOT_GOTTEN
			}
		}

		slot4.itemsData:set(slot6)

		uv6 = "activityId"

		if dataEasy.getPayClientBuyTimes("directBuyData", slot6.activityId, 0, 0) == 0 and slot2.buy == nil then
			uv5 = "activityId"
			slot5 = slot5.buy
			slot5 = slot5.set

			slot5(slot5, false)

			uv5 = "activityId"
			slot5 = slot5.notbuy
			slot5 = slot5.set
			slot7 = true

			slot5(slot5, slot7)

			uv5 = "activityId"
			uv7 = "award"

			slot5:initCountDown(slot7.BUY)
		else
			uv5 = "activityId"
			slot5 = slot5.buy
			slot5 = slot5.set

			slot5(slot5, true)

			uv5 = "activityId"
			slot5 = slot5.notbuy
			slot5 = slot5.set
			slot7 = false

			slot5(slot5, slot7)

			uv5 = "activityId"
			uv7 = "award"

			slot5:initCountDown(slot7.GET)
		end
	end)
end

function slot2.initTitle(slot0)
	slot1 = csv.yunying.yyhuodong[slot0.activityId]

	slot0.imgTitle:texture(slot1.clientParam.titleRes)

	if slot1.clientParam.iconRes then
		slot0.imgGift:texture(slot1.clientParam.iconRes)
	end

	if matchLanguage({
		"en"
	}) then
		adapt.setTextScaleWithWidth(slot0.textTitle, nil, 580)
		adapt.setTextScaleWithWidth(slot0.textCountDown, nil, 230)
	end

	slot0.imgAward1:texture(slot1.clientParam.award1.res)
	slot0.imgAward2:texture(slot1.clientParam.award2.res)
	slot0.atlasLabel1:text(slot1.clientParam.award1.count)
	slot0.atlasLabel2:text(slot1.clientParam.award2.count)
	slot0.atlasLabel1:scale(slot1.clientParam.award1.scale)
	slot0.atlasLabel2:scale(slot1.clientParam.award2.scale)
	slot0.btnBuy:get("textPrice"):text(string.format(gLanguageCsv.symbolMoney, csv.recharges[slot1.paramMap.recharge].rmbDisplay))
end

function slot2.initCountDown(slot0, slot1)
	slot2 = slot0.textCountDown
	slot3 = csv.yunying.yyhuodong[slot0.activityId]
	slot4 = 0
	uv5 = "textCountDown"

	if slot1 == slot5.BUY then
		slot0.text1:text(gLanguageCsv.sellCountDown)

		slot5, slot6 = time.getHourAndMin(slot3.beginTime)
		slot4 = time.getNumTimestamp(slot3.beginDate, slot5, slot6) + slot3.paramMap.buyDay * 24 * 60 * 60

		slot0.text1:show()
		slot0.textCountDown:show()
	else
		if slot3.clientParam.isShowCountDown == false then
			slot0.text1:hide()
			slot0.textCountDown:hide()
		end

		slot0.text1:text(gLanguageCsv.getCountDown)

		slot5, slot6 = time.getHourAndMin(slot3.endTime)
		slot4 = time.getNumTimestamp(slot3.endDate, slot5, slot6)
	end

	function slot5()
		uv1 = "time"
		slot1 = slot1 - time.getTime()
		uv1 = "getCutDown"
		slot1 = slot1.text

		slot1(slot1, time.getCutDown(slot1).str)

		uv1 = "time"

		if slot1 - time.getTime() <= 0 then
			uv1 = "getCutDown"
			slot1 = slot1.text

			slot1(slot1, gLanguageCsv.activityOver)

			uv1 = "getTime"

			slot1:unSchedule(1)

			return false
		end

		return true
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

function slot2.initItem(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot2:multiget("textDay", "btnGet", "list", "imgBg", "imgDayBg", "imgGotten")
	slot6 = slot5.textDay:setString(slot3)
	slot10 = slot1

	uiEasy.createItemsToList(slot10, slot5.list, slot4.award, {})

	uv10 = "multiget"

	if slot4.getType == slot10.CAN_NOT_GOTTEN then
		adapt.setTextScaleWithWidth(slot5.btnGet:get("textGet"), gLanguageCsv.notReach, 200)
		slot5.btnGet:setEnabled(false)
		cache.setShader(slot5.btnGet, false, "hsl_gray")
		slot5.btnGet:get("textGet"):setTextColor(cc.c4b(255, 252, 237, 255))
		slot5.textDay:setTextColor(ui.COLORS.WHITE)
		slot5.imgGotten:hide()
	else
		uv10 = "multiget"

		if slot4.getType == slot10.CAN_GOTTEN then
			adapt.setTextScaleWithWidth(slot5.btnGet:get("textGet"), gLanguageCsv.spaceReceive, 200)
			slot5.btnGet:get("textGet"):setTextColor(cc.c4b(255, 252, 237, 255))
			slot5.textDay:setTextColor(ui.COLORS.YELLOW)
			slot5.btnGet:setEnabled(true)
			slot5.imgGotten:hide()
		else
			uv10 = "multiget"

			if slot4.getType == slot10.GOTTEN then
				slot5.btnGet:hide()
				slot5.textDay:setTextColor(ui.COLORS.WHITE)
				slot5.imgGotten:show()
			end
		end
	end

	bind.touch(slot0, slot5.btnGet, {
		methods = {
			ended = functools.partial(slot0.sendGetAward, slot0, slot4.id)
		}
	})
end

function slot2.sendGetAward(slot0, slot1)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, slot1)
end

function slot2.buyWeeklyCard(slot0)
	gGameApp:payDirect(slot0, {
		csvID = 0,
		buyTimes = 0,
		rechargeId = csv.yunying.yyhuodong[slot0.activityId].paramMap.recharge,
		yyID = slot0.activityId
	}, slot0.clientBuyTimes):sdkLongTimeCb():serverCb(function ()
		uv0 = "buy"
		slot0 = slot0.buy
		slot0 = slot0.set

		slot0(slot0, true)

		uv0 = "buy"

		slot0.notbuy:set(false)
	end):doit()
end

return slot2
