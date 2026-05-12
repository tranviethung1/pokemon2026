slot0 = class("ChipSuitPreView", Dialog)
slot0.RESOURCE_FILENAME = "chip_suit_preview.json"
slot0.RESOURCE_BINDING = {
	name = "panelName",
	item = "item",
	suit1 = "suit1",
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
	},
	suitList = {
		varname = "suitList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("suitAttrDatas"),
				item = bindHelper.self("suit3"),
				item01 = bindHelper.self("suit1"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0:setRenderHint(0)
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:removeAllChildren()

					if slot3.sign == 1 then
						slot1:size(cc.size(slot0:width(), 80))
						slot0.item01:clone():anchorPoint(cc.p(0, 0.5)):xy(0, 40):addTo(slot1):show():get("txt"):text(slot3.str)
					else
						slot5, slot6 = beauty.textScroll({
							isRich = true,
							size = cc.size(slot4, 0),
							strs = slot3.str
						})

						slot5:height(math.min(150, slot6))
						slot5:addTo(slot1)
						slot1:size(cc.size(slot4, slot5:height()))
					end
				end
			}
		}
	}
}

function slot0.onCreate(slot0)
	slot0.suitID = idler.new(1)
	slot0.quality = idler.new(2)
	slot0.suitData = idlers.new({})
	slot0.suitAttrDatas = idlertable.new({})

	slot0:onSetSuitData()
	slot0.suitID:addListener(function (slot0, slot1)
		uv2 = "suitData"
		slot2 = slot2.suitData:atproxy(slot1)
		slot2.select = false
		uv2 = "suitData"
		slot2 = slot2.suitData:atproxy(slot0)
		slot2.select = true
		uv2 = "suitData"
		slot2 = slot2.initSelectUI

		slot2(slot2, slot0)

		uv2 = "suitData"

		slot2:updateSuitAttrs()
	end)
	slot0.quality:addListener(function (slot0, slot1)
		uv2 = "updateQualityBtn"
		slot2 = slot2.updateQualityBtn

		slot2(slot2, slot0)

		uv2 = "updateQualityBtn"

		slot2:updateSuitAttrs()
	end)
	Dialog.onCreate(slot0)
end

function slot0.onSetSuitData(slot0)
	slot2 = {}

	for slot6, slot7 in ipairs(csv.chip.suits) do
		if not slot2[slot7.suitID] then
			slot2[slot7.suitID] = {
				id = slot7.suitID,
				icon = slot7.suitIcon,
				name = slot7.suitName,
				select = slot0.suitID:read() == slot7.suitID
			}
		end
	end

	slot0.suitData:update(slot2)
end

function slot0.initSelectUI(slot0, slot1)
	slot2 = slot0.suitData:atproxy(slot1)

	slot0.panelName:text(slot2.name)
	slot0.icon:texture(slot2.icon)
end

function slot0.updateQualityBtn(slot0, slot1)
	for slot5 = 2, 6 do
		slot0["icon" .. slot5 - 1]:get("select"):visible(slot5 == slot1)
	end
end

function slot0.updateSuitAttrs(slot0)
	slot4 = {}

	for slot8, slot9 in pairs(gChipSuitCsv[slot0.suitID:read()][slot0.quality:read()]) do
		table.insert(slot4, {
			sign = 1,
			str = string.format("%s%s", gLanguageCsv["symbolNumber" .. slot8], gLanguageCsv.emboitement)
		})

		slot10 = ""

		if slot9.skillID and slot9.skillID ~= 0 then
			slot10 = "#C0x5B545B#" .. dataEasy.getSkillDesc(csv.skill[slot9.skillID])
		else
			for slot14 = 1, math.huge do
				if slot9["attrType" .. slot14] and slot15 ~= 0 then
					slot10 = slot10 .. string.format(gLanguageCsv.chipSuit02, getLanguageAttr(slot15), dataEasy.getAttrValueString(slot15, slot9["attrNum" .. slot14]))
				end

				if slot9["attrType" .. slot14 + 1] and slot16 ~= 0 then
					slot10 = slot10 .. "#C0x5B545B#, "
				else
					break
				end
			end
		end

		table.insert(slot4, {
			sign = 2,
			str = slot10
		})
	end

	slot0.suitAttrDatas:set(slot4)
end

function slot0.atrributeBtn(slot0, slot1)
	slot0.quality:set(slot1)
end

function slot0.btnSuitFunc(slot0, slot1, slot2, slot3, slot4)
	slot0.suitID:set(slot4.id)
end

return slot0
