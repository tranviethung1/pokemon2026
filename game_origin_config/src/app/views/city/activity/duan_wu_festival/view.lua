slot0 = require("app.views.city.activity.view")
slot1 = {
	"shicai_move_2",
	"shicai_move_3",
	"shicai_move_1"
}
slot2 = {
	"shicai_move_6",
	"shicai_move_5",
	"shicai_move_4"
}
slot4 = class("DuanWuView", cc.load("mvc").ViewBase)
slot4.RESOURCE_FILENAME = "activity_duanwu.json"
slot4.RESOURCE_BINDING = {
	["panel.icon1"] = "icon1",
	["panel.plate"] = "plate",
	["panel.hintTxt"] = "hintTxt",
	panel = "panel",
	["panel.item1"] = "item1",
	["panel.panel"] = "animaPanel",
	["panel.icon3"] = "icon3",
	["panel.item3"] = "item3",
	["panel.item2"] = "item2",
	["panel.icon2"] = "icon2",
	["panel.achievement"] = {
		varname = "achievement",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("achievementFunc")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "zongZiAward",
					listenData = {
						activityId = bindHelper.self("activityID")
					}
				}
			}
		}
	},
	["panel.rule"] = {
		varname = "rule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("ruleFunc")
			}
		}
	},
	["panel.use"] = {
		varname = "use",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("zongZiUse")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "zongziUnused",
					activityId = bindHelper.self("activityID"),
					onNode = function (slot0)
						slot0:xy(100, 105)
					end
				}
			}
		}
	},
	["panel.btn"] = {
		varname = "zongZiBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnClick")
			}
		}
	},
	["panel.make"] = {
		varname = "speedUse",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("speedUseClick")
			}
		}
	},
	["panel.timeTxt"] = {
		varname = "timeTxt",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	["panel.time"] = {
		varname = "time",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	}
}
slot4.RESOURCE_STYLES = {
	full = true
}

function slot4.onCreate(slot0, slot1)
	slot8 = slot0
	slot7 = slot0.createHandler(slot8, "onClose")

	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot7
	}):init({
		subTitle = "ACTIVITY",
		title = gLanguageCsv.duanWuheadline
	})

	slot0.animaBg = widget.addAnimation(slot0.panel, "duanwuzongzi/dwj_bzz.skel", "effect_loop", 1):alignCenter(slot0.panel:size()):scale(2)
	slot2 = {}
	slot0.zongziDataId = {}

	for slot7, slot8 in orderCsvPairs(csv.yunying.bao_zongzi_recipe) do
		if slot8.huodongID == csv.yunying.yyhuodong[slot1].huodongID then
			slot9, slot10 = csvNext(slot8.mainItem)
			slot11, slot12 = csvNext(slot8.minorItem)
			slot13, slot14 = csvNext(slot8.compoundItem)

			if not slot2[slot9] then
				slot2[slot9] = {}
			end

			if not slot0.zongziDataId[slot9] then
				slot0.zongziDataId[slot9] = {}
			end

			slot0.zongziDataId[slot9][slot11] = slot7
			slot2[slot9][slot11] = slot13
		end
	end

	slot0.activityID = slot1
	slot0.zongziData = {}
	slot4 = {
		6352,
		6353,
		6354
	}
	slot5 = {
		6355,
		6356,
		6357
	}

	for slot9 = 1, 3 do
		text.addEffect(slot0["item" .. slot9]:get("itemTxt"), {
			outline = {
				color = cc.c4b(129, 75, 36, 255)
			}
		})
		text.addEffect(slot0["icon" .. slot9]:get("iconTxt"), {
			outline = {
				color = cc.c4b(129, 75, 36, 255)
			}
		})
	end

	text.addEffect(slot0.achievement:get("txt"), {
		outline = {
			color = cc.c4b(129, 75, 36, 255)
		}
	})
	text.addEffect(slot0.rule:get("txt"), {
		outline = {
			color = cc.c4b(129, 75, 36, 255)
		}
	})
	text.addEffect(slot0.use:get("txt"), {
		outline = {
			color = cc.c4b(129, 75, 36, 255)
		}
	})
	text.addEffect(slot0.speedUse:get("txt"), {
		outline = {
			color = cc.c4b(129, 75, 36, 255)
		}
	})
	text.addEffect(slot0.hintTxt, {
		outline = {
			color = cc.c4b(129, 75, 36, 255)
		}
	})

	slot0.timeOver = true

	slot0:timeUpdata(slot1)
	slot0.timeTxt:x(slot0.time:x() - slot0.time:width() - 25)
	slot0.plate:get("icon"):visible(false)
	slot0.plate:get("item"):visible(false)

	slot6 = cc.c4b(255, 79, 100, 255)
	slot10 = "items"

	idlereasy.when(gGameModel.role:getIdler(slot10), function (slot0, slot1)
		for slot5 = 1, 3 do
			slot6 = string.format(gLanguageCsv.possessIngredient, 0)
			slot7 = string.format(gLanguageCsv.possessIngredient, 0)
			uv8 = "string"
			uv9 = "string"
			slot10 = false
			slot11 = false
			uv12 = "format"

			if slot1[slot12[slot5]] then
				uv14 = "format"
				slot6 = string.format(gLanguageCsv.possessIngredient, slot1[slot14[slot5]])
				slot8 = ui.COLORS.NORMAL.WHITE
				slot10 = true
			end

			uv12 = "gLanguageCsv"
			slot12 = slot12["icon" .. slot5]:get("iconTxt")
			slot12 = slot12.text

			slot12(slot12, slot6)

			uv12 = "gLanguageCsv"
			slot12 = slot12["icon" .. slot5]:get("iconTxt")
			slot12 = slot12.color

			slot12(slot12, slot8)

			uv12 = "gLanguageCsv"
			slot12 = slot12["icon" .. slot5]:get("icon")
			slot12 = slot12.visible

			slot12(slot12, slot10)

			uv12 = "possessIngredient"

			if slot1[slot12[slot5]] then
				uv14 = "possessIngredient"
				slot7 = string.format(gLanguageCsv.possessIngredient, slot1[slot14[slot5]])
				slot9 = ui.COLORS.NORMAL.WHITE
				slot11 = true
			end

			uv12 = "gLanguageCsv"
			slot12 = slot12["item" .. slot5]:get("itemTxt")
			slot12 = slot12.text

			slot12(slot12, slot7)

			uv12 = "gLanguageCsv"
			slot12 = slot12["item" .. slot5]:get("itemTxt")
			slot12 = slot12.color

			slot12(slot12, slot9)

			uv12 = "gLanguageCsv"

			slot12["item" .. slot5]:get("item"):visible(slot11)
		end
	end)
	slot0.hintTxt:text(gLanguageCsv.clickAddZongzi)

	slot0.itemPostion1 = {}
	slot0.itemPostion2 = {}
	slot0.itemAnimaData = {}

	for slot10 = 1, 3 do
		slot0.itemPostion1[slot10] = {
			x = slot0["icon" .. slot10]:get("icon"):x(),
			y = slot0["icon" .. slot10]:get("icon"):y()
		}
		slot0.itemPostion2[slot10] = {
			x = slot0["item" .. slot10]:get("item"):x(),
			y = slot0["item" .. slot10]:get("item"):y()
		}

		slot0["icon" .. slot10]:onClick(function ()
			uv0 = "timeOver"

			if not slot0.timeOver then
				gGameUI:showTip(gLanguageCsv.activityOver)

				return
			end

			slot0 = gGameModel.role
			slot1 = slot0
			slot2 = "items"
			uv1 = "gGameUI"
			uv2 = "showTip"

			if slot0.read(slot1, slot2)[slot1[slot2]] then
				uv1 = "timeOver"
				slot1 = slot1.zongziData
				uv2 = "gGameUI"
				uv3 = "showTip"
				slot1[1] = slot2[slot3]
				uv1 = "timeOver"

				slot1.plate:get("icon"):visible(false)
			else
				uv6 = "gGameUI"
				uv7 = "showTip"

				gGameUI:showTip(string.format(gLanguageCsv.noItems, csv.items[slot6[slot7]].name))
			end

			slot1 = false
			uv2 = "timeOver"

			if slot2.zongziData[1] then
				uv2 = "timeOver"
				slot2 = slot2.plate:get("icon")
				slot2 = slot2.texture
				uv5 = "timeOver"

				slot2(slot2, csv.items[slot5.zongziData[1]].icon)

				uv2 = "timeOver"

				if slot2.itemAnimaData[2] then
					uv2 = "timeOver"
					slot2 = slot2.itemAnimaData[2]
					slot2 = slot2.removeFromParent

					slot2(slot2)

					uv2 = "timeOver"
					slot2.itemAnimaData[2] = nil
				end

				uv2 = "timeOver"
				slot2 = slot2.itemAnimaData
				uv3 = "timeOver"
				uv5 = "timeOver"
				uv7 = "showTip"
				slot7 = "icon"
				uv7 = "timeOver"
				slot2[2] = slot3:animaFunc(slot5["icon" .. slot7]:get(slot7), "xian_move_1", slot7.zongziData[1])
				slot1 = true
				uv2 = "timeOver"

				if slot2.zongziData[2] then
					uv2 = "gLanguageCsv"
					uv3 = "timeOver"
					slot3 = slot3.zongziData[1]
					uv3 = "timeOver"
					slot3 = slot3.zongziData[2]
					uv3 = "timeOver"

					slot3.hintTxt:text(string.format(gLanguageCsv.obtainZongZi, csv.items[slot2[slot3][slot3]].name))
				end
			end
		end)
		slot0["item" .. slot10]:onClick(function ()
			uv0 = "timeOver"

			if not slot0.timeOver then
				gGameUI:showTip(gLanguageCsv.activityOver)

				return
			end

			slot0 = gGameModel.role
			slot1 = slot0
			slot2 = "items"
			uv1 = "gGameUI"
			uv2 = "showTip"

			if slot0.read(slot1, slot2)[slot1[slot2]] then
				uv1 = "timeOver"
				slot1 = slot1.zongziData
				uv2 = "gGameUI"
				uv3 = "showTip"
				slot1[2] = slot2[slot3]
				uv1 = "timeOver"

				slot1.plate:get("item"):visible(false)
			else
				uv6 = "gGameUI"
				uv7 = "showTip"

				gGameUI:showTip(string.format(gLanguageCsv.noItems, csv.items[slot6[slot7]].name))
			end

			slot1 = false
			uv2 = "timeOver"

			if slot2.zongziData[2] then
				uv2 = "timeOver"

				if slot2.itemAnimaData[1] then
					uv2 = "timeOver"
					slot2 = slot2.itemAnimaData[1]
					slot2 = slot2.removeFromParent

					slot2(slot2)

					uv2 = "timeOver"
					slot2.itemAnimaData[1] = nil
				end

				uv2 = "timeOver"
				slot2 = slot2.itemAnimaData
				uv3 = "timeOver"
				uv5 = "timeOver"
				uv7 = "showTip"
				slot7 = "item"
				slot5 = slot5["item" .. slot7]:get(slot7)
				uv7 = "timeOver"
				slot2[1] = slot3:animaFunc(slot5, "xian_move_2", slot7.zongziData[2])
				uv2 = "timeOver"
				slot2 = slot2.plate:get("item")
				slot2 = slot2.texture
				uv5 = "timeOver"

				slot2(slot2, csv.items[slot5.zongziData[2]].icon)

				slot1 = true
				uv2 = "timeOver"

				if slot2.zongziData[1] then
					uv2 = "gLanguageCsv"
					uv3 = "timeOver"
					slot3 = slot3.zongziData[1]
					uv3 = "timeOver"
					slot3 = slot3.zongziData[2]
					uv3 = "timeOver"

					slot3.hintTxt:text(string.format(gLanguageCsv.obtainZongZi, csv.items[slot2[slot3][slot3]].name))
				end
			end
		end)
	end
end

function slot4.timeUpdata(slot0, slot1)
	slot0:enableSchedule():unSchedule(1)

	slot3 = ""

	if csv.yunying.yyhuodong[slot1].countType == 0 then
		slot3 = gLanguageCsv.activityDaily
	end

	slot4 = 0

	if gGameModel.role:read("yy_endtime")[slot1] then
		slot4 = slot5[slot1] - time.getTime()
	end

	function ()
		uv0 = "timeOver"

		if slot0 <= 0 then
			uv0 = "timeTxt"
			slot0.timeOver = false
			uv0 = "timeTxt"
			slot0 = slot0.timeTxt
			slot0 = slot0.text

			slot0(slot0, gLanguageCsv.activityOver)

			uv0 = "timeTxt"

			slot0.time:text("")
		else
			uv0 = "timeTxt"
			slot0 = slot0.timeTxt
			slot0 = slot0.text

			slot0(slot0, gLanguageCsv.activityLeftTime)

			uv0 = "timeTxt"
			uv3 = "timeOver"
			uv3 = "text"

			slot0.time:text(time.getCutDown(slot3).str .. slot3)
		end
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
	end, 1, 1, 1)
end

function slot4.achievementFunc(slot0)
	if not slot0.timeOver then
		gGameUI:showTip(gLanguageCsv.activityOver)

		return
	end

	gGameUI:stackUI("city.activity.duan_wu_festival.proficiency_award", nil, , slot0.activityID)
end

function slot4.zongZiUse(slot0)
	if not slot0.timeOver then
		gGameUI:showTip(gLanguageCsv.activityOver)

		return
	end

	gGameUI:stackUI("city.activity.duan_wu_festival.zongzi_select", nil, , slot0.activityID)
end

function slot4.animaFunc(slot0, slot1, slot2, slot3)
	slot1:clone():show():addTo(slot0.animaPanel, 10)

	if slot3 then
		slot4:texture(csv.items[slot3].icon)
	end

	slot4:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.CallFunc:create(function ()
		uv0 = "animaBg"
		slot0, slot1 = slot0.animaBg:getPosition()
		uv2 = "animaBg"
		slot2 = slot2.animaBg
		slot3 = slot2
		uv3 = "animaBg"
		slot3 = slot3.animaBg
		slot4 = slot3
		uv4 = "animaBg"
		slot4 = slot4.animaBg
		slot5 = slot4
		uv6 = "getPosition"
		slot4 = slot4.getBonePosition(slot5, slot6)
		uv5 = "animaBg"
		slot5 = slot5.animaBg
		slot6 = slot5
		uv7 = "getPosition"
		uv6 = "animaBg"
		slot6 = slot6.animaBg
		slot7 = slot6
		uv8 = "getPosition"
		uv7 = "animaBg"
		slot7 = slot7.animaBg
		slot8 = slot7
		uv9 = "getPosition"
		uv8 = "getScaleX"
		slot8 = slot8:rotate(-slot5.getBoneRotation(slot6, slot7))

		slot8:scaleX(slot6.getBoneScaleX(slot7, slot8)):scaleY(slot7.getBoneScaleY(slot8, slot9)):xy(cc.p(slot4.x * slot2.getScaleX(slot3) + slot0, slot4.y * slot3.getScaleY(slot4) + slot1))
	end))))

	if slot0.animaData then
		table.insert(slot0.animaData, slot4)
	end

	return slot4
end

function slot4.btnClick(slot0, slot1, slot2)
	if not slot0.timeOver then
		gGameUI:showTip(gLanguageCsv.activityOver)

		return
	end

	slot3 = {}
	slot0.animaData = {}

	if slot1 ~= "speedMake" then
		if csvSize(slot0.zongziData) ~= 2 then
			gGameUI:showTip(gLanguageCsv.zongZiFabrication)

			return
		end

		slot0.hintTxt:visible(false)

		slot3[slot0.zongziDataId[slot0.zongziData[1]][slot0.zongziData[2]]] = 1

		slot0.animaBg:play("effect_solo_hou")

		slot0.anima = widget.addAnimation(slot0.animaPanel, "duanwuzongzi/dwj_bzz.skel", "effect_solo_qian", 3):alignCenter(slot0.animaPanel:size()):scale(2)
	else
		slot0.hintTxt:visible(false)

		slot3 = slot2

		slot0.animaBg:play("kuaisu_effect")
		performWithDelay(slot0, function ()
			for slot3 = 1, 3 do
				uv4 = "item"
				slot4 = slot4["item" .. slot3]:get("item")
				slot4 = slot4.runAction
				uv12 = "item"
				slot12 = slot12["item" .. slot3]:get("item")
				slot13 = slot12
				uv13 = "item"
				slot13 = slot13["item" .. slot3]:get("item"):y() + 750
				slot12 = cc.p
				uv13 = "item"
				slot13 = slot13["item" .. slot3]:get("item")
				slot14 = slot13
				uv14 = "item"

				slot4(slot4, cc.Sequence:create(cc.MoveTo:create(0.5, cc.p(slot12.x(slot13), slot13)), cc.MoveTo:create(0.6, slot12(slot13.x(slot14), slot14["item" .. slot3]:get("item"):y() - 50))))

				uv4 = "item"
				uv12 = "item"
				slot12 = slot12["icon" .. slot3]:get("icon")
				slot13 = slot12
				uv13 = "item"
				slot13 = slot13["icon" .. slot3]:get("icon"):y() + 750
				uv13 = "item"
				slot13 = slot13["icon" .. slot3]:get("icon")
				slot14 = slot13
				uv14 = "item"

				slot4["icon" .. slot3]:get("icon"):runAction(cc.Sequence:create(cc.MoveTo:create(0.5, cc.p(slot12.x(slot13), slot13)), cc.MoveTo:create(0.6, cc.p(slot13.x(slot14), slot14["icon" .. slot3]:get("icon"):y() - 50))))
			end

			uv1 = "item"

			performWithDelay(slot1, function ()
				slot0, slot1 = nil

				for slot5 = 1, 3 do
					uv6 = "animaFunc"
					slot6 = slot6.animaFunc
					uv8 = "animaFunc"
					slot8 = slot8["item" .. slot5]
					slot9 = slot8
					slot8 = slot8.get(slot9, "item")
					uv9 = "item"

					slot6(slot6, slot8, slot9[slot5])

					uv6 = "animaFunc"
					slot6 = slot6.animaFunc
					uv8 = "animaFunc"
					slot8 = slot8["icon" .. slot5]
					slot9 = slot8
					uv9 = "get"

					slot6(slot6, slot8.get(slot9, "icon"), slot9[slot5])

					uv6 = "animaFunc"
					slot6 = slot6["item" .. slot5]
					slot6 = slot6.visible

					slot6(slot6, false)

					uv6 = "animaFunc"

					slot6["icon" .. slot5]:visible(false)
				end
			end, 0.9)
		end, 0.8)
	end

	slot0.zongZiBtn:visible(false)
	gGameUI:goBackInStackUI("city.activity.duan_wu_festival.view")
	gGameApp:requestServerCustom("/game/yy/bao/zongzi"):params(slot0.activityID, slot3):onResponse(function (slot0)
		uv2 = "performWithDelay"

		performWithDelay(slot2, function ()
			uv0 = "zongziData"
			slot0[1] = true
			uv0 = "hintTxt"
			slot0.zongziData = {}
			uv0 = "hintTxt"
			slot0 = slot0.hintTxt
			slot0 = slot0.text

			slot0(slot0, gLanguageCsv.clickAddZongzi)

			uv0 = "hintTxt"
			slot0 = slot0.animaBg
			slot0 = slot0.play

			slot0(slot0, "effect_loop")

			uv0 = "hintTxt"
			slot0 = slot0.hintTxt
			slot0 = slot0.visible

			slot0(slot0, true)

			uv0 = "hintTxt"

			if slot0.anima then
				uv0 = "hintTxt"
				slot0 = slot0.anima
				slot0 = slot0.removeFromParent

				slot0(slot0)

				uv0 = "hintTxt"
				slot0.anima = nil
				uv0 = "hintTxt"

				if slot0.itemAnimaData[1] then
					uv0 = "hintTxt"

					slot0.itemAnimaData[1]:removeFromParent()
				end

				uv0 = "hintTxt"

				if slot0.itemAnimaData[2] then
					uv0 = "hintTxt"

					slot0.itemAnimaData[2]:removeFromParent()
				end

				uv0 = "hintTxt"
				slot0.itemAnimaData = {}
			else
				for slot3 = 1, 3 do
					uv4 = "hintTxt"
					slot4 = slot4["item" .. slot3]
					slot4 = slot4.visible

					slot4(slot4, true)

					uv4 = "hintTxt"
					slot4 = slot4["item" .. slot3]:get("item")
					slot4 = slot4.xy
					uv7 = "hintTxt"
					slot7 = slot7.itemPostion2[slot3].x
					uv8 = "hintTxt"
					slot8 = slot8.itemPostion2[slot3].y

					slot4(slot4, cc.p(slot7, slot8))

					uv4 = "hintTxt"
					slot4 = slot4["icon" .. slot3]
					slot4 = slot4.visible

					slot4(slot4, true)

					uv4 = "hintTxt"
					uv7 = "hintTxt"
					uv8 = "hintTxt"

					slot4["icon" .. slot3]:get("icon"):xy(cc.p(slot7.itemPostion1[slot3].x, slot8.itemPostion1[slot3].y))
				end
			end

			uv1 = "hintTxt"

			for slot3, slot4 in pairs(slot1.animaData) do
				if slot4 then
					slot4:removeFromParent()
				end
			end

			uv0 = "hintTxt"

			slot0.zongZiBtn:visible(true)
		end, 3.7)
	end):wait({
		false
	}):doit(function (slot0)
		gGameUI:showGainDisplay(slot0)
	end)
end

function slot4.speedUseClick(slot0)
	if not slot0.timeOver then
		gGameUI:showTip(gLanguageCsv.activityOver)

		return
	end

	slot0.plate:get("icon"):visible(false)
	slot0.plate:get("item"):visible(false)

	if slot0.itemAnimaData[1] then
		slot0.itemAnimaData[1]:removeFromParent()

		slot0.itemAnimaData[1] = nil
	end

	if slot0.itemAnimaData[2] then
		slot0.itemAnimaData[2]:removeFromParent()

		slot0.itemAnimaData[2] = nil
	end

	slot0.hintTxt:text(gLanguageCsv.clickAddZongzi)

	slot0.zongziData = {}

	gGameUI:stackUI("city.activity.duan_wu_festival.speed_fabrication", nil, , slot0.activityID, slot0:createHandler("btnClick"))
end

function slot4.ruleFunc(slot0)
	if not slot0.timeOver then
		gGameUI:showTip(gLanguageCsv.activityOver)

		return
	end

	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1300
	})
end

function slot4.getRuleContext(slot0, slot1)
	slot3 = adaptContext

	return {
		slot3.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.duanWuheadline)
		end),
		slot3.noteText(unpack({
			92001,
			92005
		}))
	}
end

return slot4
