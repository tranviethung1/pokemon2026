slot0 = gCommonConfigCsv.chipUpLimit
slot2 = class("ChipSelectSuitView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "chip_select_suit.json"
slot2.RESOURCE_BINDING = {
	item02 = "item02",
	slider = "slider",
	txtVal = "txtVal",
	item01 = "item01",
	btnDelete = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnDelete")
			}
		}
	},
	btnSure = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnSure")
			}
		}
	},
	listView = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				leftPadding = 5,
				columnSize = 2,
				data = bindHelper.self("suitData"),
				item = bindHelper.self("item01"),
				cell = bindHelper.self("item02"),
				sliderBg = bindHelper.self("slider"),
				dataOrderCmp = function (slot0, slot1)
					return slot0.id < slot1.id
				end,
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot10 = "panelInfo"
					slot4 = slot1:multiget("imgSuit", "txtSuitName", "txtSuitVal", "suitStatus", slot10)

					slot4.imgSuit:texture(slot3.icon)
					slot4.txtSuitName:text(slot3.name)
					slot4.txtSuitVal:text(string.format(gLanguageCsv.chipSuitHaveNum, slot3.count))
					slot4.suitStatus:setSelectedState(slot3.select)
					slot4.panelInfo:removeAllChildren()

					slot5 = slot4.panelInfo:size().height

					for slot10, slot11 in pairs(slot3.str) do
						slot6 = "" .. slot11 .. "\n"
					end

					slot7 = rich.createWithWidth(slot6, 40, nil, 900, nil, cc.p(0, 0.5)):anchorPoint(cc.p(0, 1)):xy(10, slot5 + 20):addTo(slot4.panelInfo)

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end,
				onBeforeBuild = function (slot0)
					slot1, slot2 = slot0:xy()
					slot3 = slot0:size()
					slot4, slot5 = slot0.sliderBg:xy()
					slot6 = slot0.sliderBg:size()

					slot0:setScrollBarEnabled(true)
					slot0:setScrollBarColor(cc.c3b(241, 59, 84))
					slot0:setScrollBarOpacity(255)
					slot0:setScrollBarAutoHideEnabled(false)
					slot0:setScrollBarPositionFromCorner(cc.p(slot1 + slot3.width - slot4, (slot3.height - slot6.height) / 2 + 5))
					slot0:setScrollBarWidth(slot6.width)
					slot0:refreshView()
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	}
}
slot2.RESOURCE_STYLES = {
	backGlass = true
}

function slot2.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.suitData = idlers.new({})
	slot0.selectUpSuitID = {}
	slot0.callBack = slot1.callBack
	slot0.suitCount = {}

	slot0:getSelectSuitID()
	slot0:calculateSuitCount()
	slot0:onSetSuitData()

	slot2 = ccui.Layout:create():size(display.sizeInView):xy(display.board_left, 0):addTo(slot0, -99, "__black_")

	slot2:setBackGroundColorType(1)
	slot2:setBackGroundColor(cc.c3b(0, 0, 0))
	slot2:setBackGroundColorOpacity(204)
	slot2:setTouchEnabled(true)
end

function slot2.initModel(slot0)
	slot0.roleChips = gGameModel.role:getIdler("chips")
end

function slot2.getSelectSuitID(slot0)
	for slot5, slot6 in ipairs(userDefault.getForeverLocalKey("selectUpSuitID", {})) do
		if slot6 ~= 0 then
			table.insert(slot0.selectUpSuitID, slot6)
		end
	end

	slot0:setSelectUI()
end

function slot2.calculateSuitCount(slot0)
	for slot5, slot6 in pairs(slot0.roleChips:read()) do
		slot8 = csv.chip.chips[gGameModel.chips:find(slot6):read("chip_id")]
		slot0.suitCount[slot8.suitID] = (slot0.suitCount[slot8.suitID] or 0) + 1
	end
end

function slot2.onSetSuitData(slot0)
	slot1 = {
		[slot6] = true
	}

	for slot5, slot6 in ipairs(slot0.selectUpSuitID) do
		-- Nothing
	end

	slot2 = {}

	for slot6, slot7 in ipairs(csv.chip.suits) do
		if not slot2[slot7.suitID] then
			slot10 = {}
			slot11 = 1

			for slot15, slot16 in pairs(gChipSuitCsv[slot7.suitID][6]) do
				if slot16.skillID and slot16.skillID ~= 0 then
					slot17 = string.gsub(string.format(gLanguageCsv.chipSuitCount, slot15, "") .. "#C0xFFFCED#" .. string.gsub(dataEasy.getSkillDesc(csv.skill[slot16.skillID]), "#C0x5B545B#", "#C0xFFFCED#"), "#C0x5c9970#", "#C0x91e1b1#")
				else
					for slot21 = 1, math.huge do
						if slot16["attrType" .. slot21] and slot22 ~= 0 then
							slot17 = slot17 .. string.format(gLanguageCsv.chipSuit01, getLanguageAttr(slot22), dataEasy.getAttrValueString(slot22, slot16["attrNum" .. slot21]))
						end

						if slot16["attrType" .. slot21 + 1] and slot23 ~= 0 then
							slot17 = slot17 .. "#C0xFFFCED#, "
						else
							break
						end
					end
				end

				slot8.str = slot8.str or {}
				slot8.str[slot11] = slot17
				slot11 = slot11 + 1
			end

			slot2[slot7.suitID] = {
				id = slot7.suitID,
				icon = slot7.suitIcon,
				name = slot7.suitName,
				select = slot1[slot7.suitID] or false,
				count = slot0.suitCount[slot7.suitID] or 0
			}
		end
	end

	slot0.suitData:update(slot2)
end

function slot2.onBtnDelete(slot0)
	uv1 = "onClose"

	slot1.onClose(slot0)
end

function slot2.onBtnSure(slot0)
	uv3 = "selectUpSuitID"

	for slot5 = 1, slot3 do
	end

	userDefault.setForeverLocalKey("selectUpSuitID", {
		[slot5] = slot0.selectUpSuitID[slot5] or 0
	})

	if slot0.callBack then
		slot0.callBack()
	end

	uv2 = "userDefault"

	slot2.onClose(slot0)
end

function slot2.setSelectUI(slot0)
	slot1, slot2 = slot0.txtVal:xy()

	slot0.txtVal:visible(false)

	uv8 = "txtVal"
	slot5 = string.format(gLanguageCsv.chipSuitHasSelect, #slot0.selectUpSuitID, slot8)

	if slot0.txtVal:parent():get("txtval2") then
		slot4:removeFromParent()
	end

	slot4 = rich.createWithWidth(slot5, 40, nil, 1039, nil, cc.p(0, 0.5)):anchorPoint(cc.p(0, 0.5)):xy(slot1, slot2):addTo(slot3, 10, "txtval2")
end

function slot2.onItemClick(slot0, slot1, slot2, slot3)
	slot4 = 0

	for slot8, slot9 in ipairs(slot0.selectUpSuitID) do
		if slot9 == slot3.id then
			slot4 = slot8
		end
	end

	if slot4 > 0 then
		table.remove(slot0.selectUpSuitID, slot4)

		slot0.suitData:atproxy(slot3.id).select = false
	else
		uv6 = "ipairs"

		if slot6 <= #slot0.selectUpSuitID then
			gGameUI:showTip(gLanguageCsv.chipSuitTip01)
		else
			table.insert(slot0.selectUpSuitID, slot3.id)

			slot0.suitData:atproxy(slot3.id).select = true
		end
	end

	slot0:setSelectUI()
end

return slot2
