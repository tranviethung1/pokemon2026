slot0 = {
	nightmare = 525,
	hero = 524,
	normal = 523
}
slot1 = class("CaptureView", Dialog)
slot1.RESOURCE_FILENAME = "common_capture_popup.json"
slot1.RESOURCE_BINDING = {
	titleName = "titleName",
	titleBg1 = "bg1",
	txtTimeNumber = "txtTimeNumber",
	animain = "animain",
	attrTmp = "attrTmp",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	spritXq = {
		varname = "captureBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("captureMenuBtn")
			}
		}
	},
	returnBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	confirm = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onCaptureBtnClick")
			}
		}
	},
	["spritXq.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["titleName.name"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["icon.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["txtTimeNumber.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["txtTimeNumber.txtNumber"] = {
		varname = "txtNumber",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["txtTimeNumber.txt2"] = {
		varname = "txt2",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["txtTimeNumber.txtTime"] = {
		varname = "txtTime",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	upList = {
		varname = "upList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("cardAttrs"),
				item = bindHelper.self("attrTmp"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("imgIcon"):texture(ui.ATTR_ICON[slot3])
				end
			}
		}
	}
}

function slot1.initModel(slot0)
	slot0.cards = gGameModel.role:read("cards")
	slot0.cardCapacity = gGameModel.role:read("card_capacity")
	slot0.captureNumber = gGameModel.role:getIdler("items")
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.level = gGameModel.role:getIdler("level")
	slot0.limitSprites = gGameModel.capture:getIdler("limit_sprites")
end

function slot1.onCreate(slot0, slot1)
	slot0.item = slot1.node
	slot0.tabId = slot1.captureID
	slot0.captureData = slot1.captureData
	slot0.limitData = slot1.limitData

	uiEasy.setMaxStar(slot0.bg1, {
		cardId = slot1.captureData.cardID,
		position = {
			x = math.floor(slot0.bg1:width() / 3.1 + slot0.bg1:width() / 2),
			y = math.floor(slot0.bg1:height() / 3.5 + slot0.bg1:height() / 2)
		}
	})
	slot0:initModel()

	slot0.cardAttrs = idlertable.new({})
	slot4 = csv.unit[csv.cards[slot1.captureData.cardID].unitID]

	if slot0.limitData then
		slot0.txtTimeNumber:show()
		idlereasy.when(slot0.limitSprites, function (slot0, slot1)
			for slot5, slot6 in pairs(slot1) do
				uv7 = "pairs"

				if slot7.tabId == slot5 - 1 then
					uv7 = "pairs"
					uv9 = "pairs"
					slot9 = slot9.limitData.csv_id
					slot7.totalTimes = csv.capture.sprite[slot9].totalTimes
					uv7 = "pairs"
					slot7 = slot7.txtNumber
					slot7 = slot7.text
					uv9 = "pairs"
					uv11 = "pairs"

					slot7(slot7, slot9.totalTimes - slot6.total_times .. "/" .. slot11.totalTimes)

					uv7 = "pairs"
					slot7.limitData = slot6
				end
			end
		end)

		function slot5()
			uv0 = "limitData"
			uv2 = "limitData"
			slot0 = slot0.limitData.find_time + csv.capture.sprite[slot2.limitData.csv_id].time
			slot2 = slot0 - time.getTime()
			uv2 = "limitData"
			slot2 = slot2.txtTime
			slot2 = slot2.text
			slot4 = time.getCutDown(slot2).str

			slot2(slot2, slot4)

			uv2 = "limitData"
			uv4 = "limitData"
			slot4 = slot4.txtTime
			slot5 = slot4
			uv5 = "limitData"

			slot2.txt2:x(slot4.x(slot5) - slot5.txtTime:size().width - 10)

			if slot0 - time.getTime() <= 0 then
				uv2 = "limitData"

				slot2:onClose()

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
		end, 1, 0)
	else
		slot0.txtTimeNumber:hide()
	end

	widget.addAnimation(slot0.animain, slot4.unitRes, "standby_loop", 5):alignCenter(slot0.animain:size()):scale(slot4.scale * gCommonConfigCsv.captureSprite):setSkin(slot4.skin)
	slot0.animain:y(slot0.animain:y() - 180)
	table.insert({}, slot4.natureType)

	if slot4.natureType2 then
		table.insert(slot7, slot4.natureType2)
	end

	slot0.cardAttrs:set(slot7)
	slot0.titleName:get("name"):text(csv.cards[slot3].name)
	slot0.titleName:get("iconLeft"):texture(ui.RARITY_ICON[slot4.rarity])
	Dialog.onCreate(slot0)
end

function slot1.captureMenuBtn(slot0)
	gGameUI:stackUI("city.handbook.view", nil, , {
		cardId = slot0.captureData.cardID
	})
end

function slot1.onCaptureBtnClick(slot0)
	slot0:initModel()

	if slot0.captureData.type == 2 and slot0.totalTimes == slot0.limitData.total_times then
		gGameUI:showTip(gLanguageCsv.captureSceneTimesNotEnough)

		return
	end

	if slot0.cardCapacity - itertools.size(slot0.cards) <= 0 then
		gGameUI:showDialog({
			btnType = 2,
			clearFast = true,
			content = gLanguageCsv.cardBagHaveBeenFullDraw,
			cb = function ()
				gGameUI:stackUI("city.card.bag", nil, {
					full = true
				})
			end
		})

		return
	end

	uv3 = "initModel"

	for slot5, slot6 in pairs(slot3) do
		slot7 = slot0.captureNumber
		slot8 = slot7
		uv8 = "initModel"

		if slot7.read(slot8)[slot8[slot5]] then
			slot7 = slot0.captureNumber
			slot8 = slot7
			uv8 = "initModel"

			if slot7.read(slot8)[slot8[slot5]] <= 0 then
				slot1 = 0 + 1
			end
		end
	end

	if slot1 == 3 then
		slot2 = gGameUI
		slot3 = slot2

		slot2.showTip(slot3, gLanguageCsv.captureBallNotEnough)

		uv3 = "initModel"
		uv11 = "initModel"

		gGameUI:stackUI("common.buy_info", nil, , {
			gold = csv.items[slot3.normal].specialArgsMap.buy_gold
		}, {
			id = slot11.normal
		}, {
			contentType = "num",
			maxNum = 100
		}, slot0:createHandler("showBuyInfo"))

		return
	end

	gGameApp:requestServer("/game/capture/enter", function (slot0)
		uv6 = "gGameUI"
		uv7 = "gGameUI"
		uv8 = "gGameUI"

		gGameUI:stackUI("city.capture.capture_sprite", nil, , slot6.captureData, slot7.tabId, slot8:createHandler("captureReturnBtnView"))
	end, slot0.captureData.type, slot0.tabId)
end

function slot1.showBuyInfo(slot0, slot1)
	uv3 = "csv"
	slot3 = slot0.level

	if slot3:read() < csv.items[slot3.normal].specialArgsMap.buy_level then
		gGameUI:showTip(gLanguageCsv.buyItemLevelLimit)

		return
	else
		uv6 = "csv"

		gGameApp:requestServer("/game/ball/buy_item", function (slot0)
			gGameUI:showTip(gLanguageCsv.hasBuy)
		end, slot6.normal, slot1)
	end
end

function slot1.captureReturnBtnView(slot0, slot1)
	if slot0.item and not slot1 then
		slot0.item:removeFromParent()
	end

	slot0:onCloseFast()
end

return slot1
