slot0 = cc.load("mvc").ViewBase
slot1 = class("CardUpgradeView", Dialog)
slot1.RESOURCE_FILENAME = "card_upgrade.json"
slot1.RESOURCE_BINDING = {
	item = "upGradeItem",
	slider = "slider",
	btnSelectItem = "btnSelectItem",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "upGradeList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("upGradeData"),
				item = bindHelper.self("upGradeItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:get("icon"):size()

					bind.extend(slot0, slot1:get("icon"), {
						class = "icon_key",
						props = {
							data = {
								key = slot3.id
							},
							grayState = slot3.num <= 0 and 1 or 0,
							onNode = function (slot0)
								slot1 = slot0.setTouchEnabled

								slot1(slot0, false)

								uv1 = "setTouchEnabled"

								if slot1.state then
									uv1 = "setTouchEnabled"

									if slot1.num > 0 then
										uv1 = "setTouchEnabled"

										if slot1.selectEffect:parent() then
											uv1 = "setTouchEnabled"

											slot1.selectEffect:removeSelf()
										end

										uv3 = "setTouchEnabled"

										slot0:add(slot3.selectEffect, 10)
									end
								else
									uv1 = "setTouchEnabled"

									if slot1.selectEffect:parent() then
										uv1 = "setTouchEnabled"

										slot1.selectEffect:removeSelf()
									end
								end
							end
						}
					})
					slot1:get("txt"):setString((slot3.canUse or 0) .. "/" .. slot3.num)
					bind.touch(slot0, slot1:get("icon"), {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	},
	sliderNum = {
		binds = {
			event = "text",
			idler = bindHelper.self("sliderNum")
		}
	},
	["cancelBtn.title"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["sureBtn.title"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	subBtn = {
		varname = "subBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -1)
			end)
		}
	},
	addBtn = {
		varname = "addBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 1)
			end)
		}
	},
	sureBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSureClick")
			}
		}
	},
	cancelBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3)
	if slot1.type == 1 then
		slot0.btnSelectItem:hide()
	end

	slot0.selectDbId = slot1.selectDbId
	slot0.cb = slot2

	slot0:enableSchedule()
	slot0:initModel()

	slot0.selectItems = {}
	slot0.upGradeData1 = {
		{},
		{},
		{},
		{},
		{},
		{}
	}
	slot0.upGradeData = idlers.newWithMap(slot0.upGradeData1)

	idlereasy.when(slot0.items, function (slot0, slot1)
		for slot5, slot6 in ipairs(gCardExpItemCsv) do
			slot7 = slot6.id
			uv8 = "ipairs"

			slot8.upGradeData:at(slot5):modify(function (slot0)
				uv1 = "num"
				uv2 = "id"
				slot1 = slot1[slot2] or 0
				slot0.num = slot1
				uv1 = "id"
				slot0.id = slot1
				uv1 = "cfg"
				slot0.cfg = slot1
			end, true)
		end
	end)

	for slot7, slot8 in pairs(slot0.upGradeData1) do
		slot0.selectEffect = ccui.ImageView:create("common/icon/icon_selected_big.png")

		slot0.selectEffect:align(cc.p(1, 0), 180, 20)
		slot0.selectEffect:retain()

		slot0.upGradeData:atproxy(slot7).selectEffect = slot0.selectEffect
		slot0.upGradeData:atproxy(slot7).state = true
	end

	slot0.myAllExp = idler.new(0)
	slot0.selectState = idlertable.new({
		true,
		true,
		true,
		true,
		true,
		true
	})

	idlereasy.when(slot0.selectState, function (slot0, slot1)
		uv4 = "ipairs"

		for slot6, slot7 in ipairs(slot4.upGradeData1) do
			uv8 = "ipairs"
			slot8.upGradeData:atproxy(slot6).state = slot1[slot6]

			if slot1[slot6] then
				slot2 = 0 + slot7.cfg.specialArgsMap.exp * slot7.num
			end
		end

		uv3 = "ipairs"

		slot3.myAllExp:set(slot2)
	end)

	slot0.canMaxLv = idler.new(0)
	slot0.selectLevel = idler.new(0)
	slot0.sliderNum = idler.new("")

	idlereasy.any({
		slot0.roleLv,
		slot0.cardId,
		slot0.cardLv,
		slot0.currExp,
		slot0.myAllExp
	}, function (slot0, slot1, slot2, slot3, slot4, slot5)
		slot7 = 0

		for slot12 = slot3, csvSize(csv.base_attribute.card_level) do
			if 0 + csv.base_attribute.card_level[slot12]["levelExp" .. csv.cards[slot2].levelExpID] > slot5 + slot4 or slot8 == slot12 then
				slot7 = slot12

				break
			end
		end

		slot9 = math.min(slot7, slot1)
		slot7 = slot9
		uv9 = "csvSize"
		slot9 = slot9.canMaxLv
		slot10 = slot9

		slot9.set(slot10, slot7)

		uv10 = "csvSize"
		slot10 = slot10.selectLevel:read()
		uv10 = "csvSize"

		slot10.selectLevel:set(math.min(slot10, math.min(slot7, slot1) - slot3))
	end)
	idlereasy.any({
		slot0.selectLevel,
		slot0.roleLv,
		slot0.currExp,
		slot0.cardLv,
		slot0.canMaxLv,
		slot0.selectState
	}, function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		uv7 = "sliderNum"

		slot7.sliderNum:set(slot4 + (slot2 >= slot4 + slot1 and slot1 or slot5 - slot4) .. "/" .. slot2)

		for slot11 = slot4, slot4 + slot1 - 1 do
			uv15 = "sliderNum"
			slot7 = 0 + csv.base_attribute.card_level[slot11]["levelExp" .. csv.cards[slot15.cardId:read()].levelExpID]
		end

		slot8 = slot3
		slot9 = {}
		slot10 = false
		uv11 = "sliderNum"
		slot12 = {}
		slot11.selectItems = slot12
		uv12 = "sliderNum"

		for slot14, slot15 in ipairs(slot12.upGradeData1) do
			if slot6[slot14] then
				for slot19 = 1, slot15.num do
					if slot7 <= slot8 then
						slot10 = true

						break
					end

					if slot1 ~= 0 then
						slot9[slot14] = slot19
						uv20 = "sliderNum"
						slot20.selectItems[slot15.id] = slot19
					end

					slot8 = slot8 + slot15.cfg.specialArgsMap.exp
				end
			end

			if slot10 then
				break
			end
		end

		for slot14 = 1, 6 do
			uv15 = "sliderNum"
			slot15.upGradeData:atproxy(slot14).canUse = slot9[slot14] or 0
		end

		uv11 = "sliderNum"

		if not slot11.slider:isHighlighted() then
			slot12 = math.min(slot1, slot5 - slot4) / (slot2 - slot4) * 100
			uv12 = "sliderNum"

			slot12.slider:setPercent(math.ceil(slot12))
		end

		uv12 = "sliderNum"
		slot12 = slot12.addBtn

		cache.setShader(slot12, false, slot5 <= slot1 + slot4 and "hsl_gray" or "normal")

		slot11 = cache.setShader
		uv12 = "sliderNum"

		slot11(slot12.subBtn, false, slot1 <= 0 and "hsl_gray" or "normal")

		uv11 = "sliderNum"
		slot11 = slot11.addBtn
		slot11 = slot11.setTouchEnabled

		slot11(slot11, slot5 > slot1 + slot4)

		uv11 = "sliderNum"

		slot11.subBtn:setTouchEnabled(slot1 > 0)
	end)
	slot0.slider:setPercent(0)
	slot0.slider:addEventListener(function (slot0, slot1)
		uv2 = "unScheduleAll"

		slot2:unScheduleAll()

		slot3 = slot0
		uv3 = "unScheduleAll"
		slot3 = slot3.roleLv
		slot4 = slot3
		uv4 = "unScheduleAll"
		slot4 = slot4.canMaxLv
		slot5 = slot4
		uv5 = "unScheduleAll"
		slot5 = slot5.cardLv
		slot6 = slot5
		slot4 = slot4.read(slot5) - slot5.read(slot6)
		uv6 = "unScheduleAll"
		slot6 = (slot3.read(slot4) - slot6.cardLv:read()) / 100 * slot0.getPercent(slot3)
		slot5 = math.ceil(slot6)
		uv6 = "unScheduleAll"

		slot6.selectLevel:set(math.min(slot5, slot4))

		if slot4 <= slot5 then
			slot8 = slot5
			uv8 = "unScheduleAll"
			slot7 = math.min(slot8, slot4) / (slot3 - slot8.cardLv:read()) * 100
			uv7 = "unScheduleAll"

			slot7.slider:setPercent(math.ceil(slot7))
		end
	end)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.roleLv = gGameModel.role:getIdler("level")
	slot0.items = gGameModel.role:getIdler("items")
	slot1 = gGameModel.cards:find(slot0.selectDbId)
	slot0.cardId = slot1:getIdler("card_id")
	slot0.cardLv = slot1:getIdler("level")
	slot0.currExp = slot1:getIdler("level_exp")
end

function slot1.onItemClick(slot0, slot1, slot2, slot3)
	if slot3.num <= 0 then
		gGameUI:showTip(gLanguageCsv.selectedMaterialsNotEnough)

		return
	end

	slot0.selectState:proxy()[slot2] = not slot0.selectState:proxy()[slot2]
end

function slot1.onAddClick(slot0)
	slot0.selectLevel:set(slot0.selectLevel:read() + 1)
end

function slot1.onReduceClick(slot0)
	slot0.selectLevel:set(slot0.selectLevel:read() - 1)
end

function slot1.onIncreaseNum(slot0, slot1)
	slot0.selectLevel:modify(function (slot0)
		uv3 = "cc"
		uv5 = "clampf"
		slot5 = slot5.canMaxLv
		slot6 = slot5
		uv6 = "clampf"

		return true, cc.clampf(slot0 + slot3, 0, slot5.read(slot6) - slot6.cardLv:read())
	end)
end

function slot1.onChangeNum(slot0, slot1, slot2, slot3)
	if slot2.name == "click" then
		slot0:unScheduleAll()
		slot0:onIncreaseNum(slot3)
	elseif slot2.name == "began" then
		slot0:schedule(function ()
			uv0 = "onIncreaseNum"
			uv2 = "onIncreaseNum"

			slot0:onIncreaseNum(slot2)
		end, 0.05, 0, 100)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot0:unScheduleAll()
	end
end

function slot1.onClose(slot0)
	Dialog.onClose(slot0)
end

function slot1.onCleanup(slot0)
	if slot0.selectEffect then
		slot0.selectEffect:release()

		slot0.selectEffect = nil
	end

	Dialog.onCleanup(slot0)
end

function slot1.onSureClick(slot0)
	if slot0.myAllExp:read() == 0 then
		gGameUI:showTip(gLanguageCsv.pleaseSelectMaterials)

		return
	end

	if next(slot0.selectItems) == nil or slot0.selectLevel:read() <= 0 then
		gGameUI:showTip(gLanguageCsv.pleaseSelectTargetLevel)

		return
	end

	gGameApp:requestServer("/game/card/exp/use_items", function (slot0)
		uv1 = "selectLevel"
		slot1 = slot1.selectLevel
		slot1 = slot1.set
		slot3 = 0

		slot1(slot1, slot3)

		uv1 = "selectLevel"
		slot2 = slot1
		slot1 = slot1.addCallbackOnExit
		uv3 = "selectLevel"

		slot1(slot2, slot3.cb)

		uv1 = "set"
		uv2 = "selectLevel"

		slot1.onClose(slot2)
	end, slot0.selectDbId, slot0.selectItems)
end

return slot1
