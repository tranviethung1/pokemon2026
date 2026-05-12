slot0 = class("ResonanceView", Dialog)
slot0.RESOURCE_FILENAME = "gem_resonance.json"
slot0.RESOURCE_BINDING = {
	name = "panelName",
	item = "item",
	suit1 = "suit1",
	suit2 = "suit2",
	suitList2 = "suitList2",
	suitList = "suitList",
	icon = "icon",
	suit3 = "suit3",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	downList = {
		varname = "downList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("suitData"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(slot3.icon)
					slot1:get("select"):visible(slot3.select)
					slot1:onTouch(functools.partial(slot0.clickCell, slot1, slot2, slot3))
				end
			},
			handlers = {
				clickCell = bindHelper.self("btnSuitFunc")
			}
		}
	},
	icon1 = {
		varname = "icon1",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:atrributeBtn(2)
				end)
			}
		}
	},
	icon2 = {
		varname = "icon2",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:atrributeBtn(3)
				end)
			}
		}
	},
	icon3 = {
		varname = "icon3",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:atrributeBtn(4)
				end)
			}
		}
	},
	icon4 = {
		varname = "icon4",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:atrributeBtn(5)
				end)
			}
		}
	},
	icon5 = {
		varname = "icon5",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:atrributeBtn(6)
				end)
			}
		}
	}
}

function slot0.onCreate(slot0)
	slot0.suit2:hide()
	slot0.suit1:hide()
	slot0.suit3:hide()
	slot0.suitList:setScrollBarEnabled(false)
	slot0.suitList2:setScrollBarEnabled(false)

	slot0.quality = 2
	slot0.suitId = 1
	slot0.btnTab = idler.new(1)
	slot0.suitData = idlers.new({})
	slot1 = {}

	for slot5 = 1, 9 do
		table.insert(slot1, {
			select = false,
			icon = ui.GEM_SUIT_ICON[slot5]
		})
	end

	slot0.suitData:update(slot1)
	slot0.btnTab:addListener(function (slot0, slot1)
		uv2 = "suitData"
		slot2 = slot2.suitData:atproxy(slot1)
		slot2.select = false
		uv2 = "suitData"
		slot2.suitData:atproxy(slot0).select = true
	end)
	slot0.icon:texture("city/card/gem/suit/icon_t1.png")
	slot0.icon1:get("select"):visible(true)
	slot0:suitUpdate(slot0.suitId, slot0.quality)
	slot0.item:visible(false)
	Dialog.onCreate(slot0)
end

function slot0.atrributeBtn(slot0, slot1)
	for slot5 = 2, 6 do
		slot0["icon" .. slot5 - 1]:get("select"):visible(slot5 == slot1)
	end

	if slot1 ~= slot0.quality then
		slot0:suitUpdate(slot0.suitId, slot1)

		slot0.quality = slot1
	end
end

function slot0.btnSuitFunc(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot5.name == "began" then
		slot0.touchBeganPos = slot2:getTouchBeganPosition()

		slot0.downList:setTouchEnabled(false)

		slot0.isClicked = true
	elseif slot5.name == "moved" then
		if ui.TOUCH_MOVED_THRESHOLD <= math.abs(slot5.x - slot0.touchBeganPos.x) then
			slot0.isClicked = false

			slot0.downList:setTouchEnabled(true)
		end
	elseif (slot5.name == "ended" or slot5.name == "cancelled") and slot0.isClicked then
		slot0.btnTab:set(slot3)
		slot0.icon:texture(ui.GEM_SUIT_ICON[slot3])

		if slot0.suitId ~= slot3 then
			slot0:suitUpdate(slot3, slot0.quality)

			slot0.suitId = slot3
		end
	end
end

function slot0.suitUpdate(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.suitList:removeAllChildren()
	slot0.suitList2:removeAllChildren()

	function slot3(slot0)
		uv1 = "suit1"
		slot1 = slot1.suit1:clone():show()
		slot2 = slot1:get("txt")
		slot2 = slot2.text

		slot2(slot2, gLanguageCsv["symbolNumber" .. slot0] .. gLanguageCsv.emboitement)

		uv2 = "suit1"

		slot2.suitList:pushBackCustomItem(slot1)
	end

	for slot8 = 1, 9 do
		if gGemSuitCsv[slot1][slot2][slot8] then
			if true then
				slot4 = false

				slot0.panelName:text(slot9.suitName)
				text.addEffect(slot0.panelName, {
					color = ui.COLORS.QUALITY[slot2]
				})
			end

			slot3(slot9.suitNum or 6)

			slot10 = nil

			for slot14 = 1, math.huge do
				if slot9["attrType" .. slot14] and slot9["attrType" .. slot14] ~= 0 then
					if slot14 % 3 == 1 then
						slot0.suitList:pushBackCustomItem(slot0.suitList2:clone())
					end

					slot17 = slot0.suit2:clone():show()

					slot17:get("txt"):text(gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot9["attrType" .. slot14]])])
					slot17:get("num"):x(slot17:get("txt"):width() + slot17:get("txt"):x())
					slot17:get("num"):text("+" .. dataEasy.getAttrValueString(slot9["attrType" .. slot14], slot9["attrNum" .. slot14]))
					slot10:pushBackCustomItem(slot17)
				else
					break
				end
			end

			slot0.suitList:pushBackCustomItem(slot0.suit3:clone():show())
		end
	end
end

return slot0
