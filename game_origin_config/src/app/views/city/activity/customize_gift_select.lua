slot0 = class("ActivityCustomizeGiftSelectDialog", Dialog)

function slot1(slot0, slot1, slot2, slot3)
	bind.extend(slot0, slot1, {
		class = "icon_key",
		props = {
			data = slot2,
			onNode = function (slot0)
				uv3 = "setTouchEnabled"

				slot0:setTouchEnabled(slot3)
			end
		}
	})
end

slot0.RESOURCE_FILENAME = "activity_customize_gift_select.json"
slot0.RESOURCE_BINDING = {
	subList = "subList",
	slotIcon = "slotIcon",
	title = "title",
	iconItem = "iconItem",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				yMargin = 0,
				xMargin = 20,
				topPadding = 20,
				leftPadding = 0,
				data = bindHelper.self("selectListData"),
				columnSize = bindHelper.self("midColumnSize"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("iconItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot5 = slot1:multiget("pic", "select").select
					slot5 = slot5.visible

					slot5(slot5, slot3.choose)

					uv5 = "multiget"

					slot5(slot0, slot1:get("pic"), dataEasy.getItemData(slot3.detail)[1], slot3.choose)

					if not slot3.choose then
						bind.touch(slot0, slot1:get("pic"), {
							clicksafe = false,
							methods = {
								ended = functools.partial(slot0.clickSelectIcon, slot3.num, slot3)
							}
						})
					end
				end
			},
			handlers = {
				clickSelectIcon = bindHelper.self("clickSelectIcon")
			}
		}
	},
	slotList = {
		varname = "slotList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 30,
				data = bindHelper.self("slotListData"),
				item = bindHelper.self("slotIcon"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("pic", "select", "add")

					slot4.select:visible(slot3.select)
					slot4.add:visible(not slot3.detail)

					if slot3.detail then
						uv5 = "multiget"

						slot5(slot0, slot1:get("pic"), dataEasy.getItemData(slot3.detail)[1], false)
					end

					bind.touch(slot0, slot1:get("pic"), {
						clicksafe = false,
						methods = {
							ended = functools.partial(slot0.clickSlotIcon, slot2, slot3)
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				clickSlotIcon = bindHelper.self("clickSlotIcon")
			}
		}
	},
	tip1 = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(239, 97, 97, 255)
				}
			}
		}
	},
	tip2 = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(239, 133, 97, 255)
				}
			}
		}
	},
	btn = {
		varname = "btn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("clickSureBtn")
			}
		}
	},
	close = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.activityId = slot1

	slot0:initModel(slot2, slot3, slot4, slot5, slot6)
	Dialog.onCreate(slot0)
end

function slot0.calcuteSelectState(slot0, slot1)
	slot2 = true
	slot4 = 0

	for slot8, slot9 in ipairs(slot1) do
		if slot9 == 0 then
			slot2 = false
			slot3 = 0 + 1
			slot4 = slot8
		end
	end

	slot0.selectState = {
		slot2,
		slot3,
		slot4
	}

	return slot2, slot3, slot4
end

function slot0.initModel(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.midColumnSize = 5
	slot0.selectPanelData = {}
	slot0.originalSelectPanelChooseData = {}
	slot0.selectPanelChooseData = idlertable.new({})
	slot0.selectState = {
		false,
		0,
		0
	}
	slot0.slotListData = idlertable.new({})
	slot0.selectListData = idlers.new()
	slot0.chooseIconNum = idler.new(0)
	slot0.chooseSlotNum = idler.new(1)
	slot0.csvId = slot1.csvId

	slot0:initData(slot1, slot4, slot3, slot5)
	slot0.chooseSlotNum:set(slot3)
	slot0.chooseIconNum:set(slot5)
	idlereasy.when(slot0.selectPanelChooseData, function (slot0, slot1)
		uv2 = "calcuteSelectState"
		slot2, slot3, slot4 = slot2:calcuteSelectState(slot1)

		if slot3 == 1 then
			uv5 = "calcuteSelectState"

			if slot4 ~= slot5.chooseSlotNum:read() then
				slot5 = false
			else
				slot5 = true
			end
		end

		uv6 = "calcuteSelectState"

		slot6:btnState(slot5)

		if slot3 <= 1 and slot3 == 1 then
			uv6 = "calcuteSelectState"

			if slot4 ~= slot6.chooseSlotNum:read() then
				uv6 = "calcuteSelectState"

				slot6.btn:get("label"):text(gLanguageCsv.nextOneChoose)
			end
		else
			uv6 = "calcuteSelectState"

			slot6.btn:get("label"):text(gLanguageCsv.chooseLock)
		end
	end)
	slot0.chooseSlotNum:addListener(function (slot0, slot1)
		if slot0 ~= slot1 and slot0 > 0 then
			if slot1 > 0 then
				uv2 = "slotListData"
				slot2.slotListData:proxy()[slot1].select = false
			end

			uv2 = "slotListData"
			slot2.slotListData:proxy()[slot0].select = true
		end

		uv2 = "slotListData"
		slot2 = slot2.selectListData
		slot2 = slot2.update
		uv4 = "slotListData"
		slot4 = slot4.selectPanelData[slot0]

		slot2(slot2, slot4)

		uv2 = "slotListData"
		uv4 = "slotListData"

		slot2.chooseIconNum:set(slot4.selectPanelChooseData:proxy()[slot0])
	end)
	slot0.chooseIconNum:addListener(function (slot0, slot1)
		uv2 = "chooseSlotNum"
		slot2 = slot2.chooseSlotNum:read()

		if slot0 > 0 then
			if slot1 > 0 then
				uv3 = "chooseSlotNum"

				if slot3.selectListData:atproxy(slot1) then
					uv3 = "chooseSlotNum"
					slot3.selectListData:atproxy(slot1).choose = false
				end
			end

			uv3 = "chooseSlotNum"
			slot3 = slot3.selectListData:atproxy(slot0)
			slot3.choose = true
			uv3 = "chooseSlotNum"

			if slot3.selectPanelData[slot2][slot0] then
				uv3 = "chooseSlotNum"
				slot3 = slot3.slotListData
				slot4 = slot3
				uv4 = "chooseSlotNum"
				slot3.proxy(slot4)[slot2].detail = slot4.selectPanelData[slot2][slot0].detail
			end
		end

		uv4 = "chooseSlotNum"

		for slot6, slot7 in ipairs(slot4.selectPanelData[slot2]) do
			slot7.choose = slot6 == slot0
		end

		uv3 = "chooseSlotNum"
		slot3.selectPanelChooseData:proxy()[slot2] = slot0
	end)
end

function slot0.btnState(slot0, slot1)
	slot0.btn:setTouchEnabled(not slot1)

	if slot1 then
		cache.setShader(slot0.btn, false, "hsl_gray")
		text.deleteEffect(slot0.btn:get("label"), {
			"outline"
		})
		text.addEffect(slot0.btn:get("label"), {
			color = cc.c4b(222, 218, 209, 255)
		})
		cache.setShader(slot0.btn:get("label"), false, "hsl_gray")
	else
		cache.setShader(slot0.btn, false, "normal")
		text.addEffect(slot0.btn:get("label"), {
			color = ui.COLORS.WHITE,
			outline = {
				size = 4,
				color = cc.c4b(239, 133, 97, 255)
			}
		})
	end
end

function slot0.initData(slot0, slot1, slot2, slot3)
	slot4 = {}
	slot5 = {}
	slot6 = {}
	slot7 = {}

	for slot11, slot12 in ipairs(slot1.awards) do
		slot13 = {}

		if not slot12.isFisAwards then
			slot14 = 0

			for slot18, slot19 in ipairs(slot12.showAwards) do
				slot20 = false

				if slot12.choose ~= nil then
					slot20 = slot12.choose == slot18
				end

				if slot20 then
					slot14 = slot18
				end

				table.insert(slot13, {
					num = slot18,
					detail = slot19,
					choose = slot20
				})
			end

			table.insert(slot6, {
				detail = slot12.showAwards[slot14],
				select = slot3 == slot12.optionSlotNum
			})
			table.insert(slot5, slot14)
			table.insert(slot4, slot13)
		end
	end

	for slot11, slot12 in ipairs(slot2) do
		table.insert(slot7, {
			num = slot11,
			detail = slot12,
			choose = slot11 == choose
		})
	end

	slot0.originalSelectPanelChooseData = table.deepcopy(slot5, true)

	slot0.selectPanelChooseData:set(slot5)

	slot0.selectPanelData = slot4

	slot0.slotListData:set(slot6)
	slot0.selectListData:update(slot7)
end

function slot0.findNextZeroValue(slot0)
	for slot4, slot5 in slot0.selectPanelChooseData:ipairs() do
		if slot0.chooseSlotNum:read() < slot4 and slot5 == 0 then
			return slot4
		end
	end

	for slot4, slot5 in slot0.selectPanelChooseData:ipairs() do
		if slot5 == 0 then
			return slot4
		end
	end
end

function slot0.clickSureBtn(slot0)
	if slot0.selectState[1] then
		slot0:onClose()
	end

	if slot0.selectState[2] > 1 or slot0.selectState[2] == 1 and slot0.selectState[3] ~= slot0.chooseSlotNum:read() then
		slot0.chooseSlotNum:set(slot0:findNextZeroValue())
	end
end

function slot0.clickSlotIcon(slot0, slot1, slot2)
	slot0.chooseSlotNum:set(slot2)
end

function slot0.clickSelectIcon(slot0, slot1, slot2)
	slot0.chooseIconNum:set(slot2)
end

function slot0.isDataChange(slot0)
	slot1 = {}
	slot2 = false

	for slot6, slot7 in slot0.selectPanelChooseData:ipairs() do
		if slot0.originalSelectPanelChooseData[slot6] ~= slot7 then
			slot2 = true
		end

		slot1[slot6] = slot7
	end

	return slot2, slot1
end

function slot0.onClose(slot0)
	slot1, slot2 = slot0:isDataChange()

	if not slot1 then
		Dialog.onClose(slot0)

		return
	end

	gGameApp:requestServer("/game/yy/customize/gift", function (slot0)
		uv2 = "Dialog"

		Dialog.onClose(slot2)
	end, slot0.activityId, slot0.csvId, slot2)
end

return slot0
