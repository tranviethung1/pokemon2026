slot0 = require("app.views.city.card.chip.tools")
slot1 = {
	90,
	615,
	1130,
	1640
}

function slot2(slot0, slot1, slot2, slot3)
	slot4 = slot0:size().width
	slot6 = slot0.item01:clone():anchorPoint(cc.p(0, 0.5)):xy(slot3, 36):addTo(slot1):show():multiget("txtTitle", "img01", "img02")

	slot6.txtTitle:text(slot2.title)
	adapt.oneLineCenterPos(cc.p(800, 50), {
		slot6.img02,
		slot6.txtTitle,
		slot6.img01
	}, cc.p(10, 0))
end

function slot3(slot0, slot1, slot2)
	slot1:size(cc.size(listW, 73))

	slot7 = 0.5

	for slot7 = 1, 3 do
		slot0.item02:clone():anchorPoint(cc.p(0, slot7)):xy(0, 36):addTo(slot1):show():get("item0" .. slot7):visible(false)
	end

	for slot7, slot8 in pairs(slot2) do
		slot9 = slot3:get("item0" .. slot7)

		slot9:visible(true)

		slot10 = slot9:multiget("imgAttr", "txtAttrName", "txtAttrCount")

		slot10.txtAttrCount:text("+" .. slot8.val)
		slot10.txtAttrName:text(getLanguageAttr(slot8.attr))

		if ui.ATTR_LOGO[slot8.attr] and not string.match(slot8.val, "%%") then
			slot10.imgAttr:texture(ui.ATTR_LOGO[slot8.attr])
			adapt.oneLinePos(slot10.imgAttr, {
				slot10.txtAttrName,
				slot10.txtAttrCount
			}, {
				cc.p(5, 0),
				cc.p(10, 0)
			})
		else
			slot10.imgAttr:visible(false)
			slot10.txtAttrName:xy(slot10.imgAttr:xy())
			text.addEffect(slot10.txtAttrCount, {
				color = cc.c3b(145, 225, 177)
			})
			adapt.oneLinePos(slot10.txtAttrName, slot10.txtAttrCount, cc.p(10, 0))
		end
	end
end

function slot4(slot0, slot1, slot2)
	slot1:size(cc.size(listW, 73))

	slot7 = 0.5

	for slot7 = 1, 3 do
		slot0.item02:clone():anchorPoint(cc.p(0, slot7)):xy(0, 36):addTo(slot1):show():get("item0" .. slot7):visible(false)
	end

	for slot7, slot8 in pairs(slot2) do
		slot9 = slot3:get("item0" .. slot7)

		slot9:visible(true)

		slot10 = slot9:multiget("icon", "text", "val", "up1", "upVal", "upIcon", "up2")

		if type(slot8.val) == "table" then
			itertools.invoke({
				slot10.up1,
				slot10.upVal,
				slot10.upIcon,
				slot10.up2
			}, "show")
			slot10.val:text(slot8.val[1])
			slot10.upVal:text(slot8.val[4])

			if slot8.val[3] == 0 then
				slot10.upIcon:hide()
				text.addEffect(slot10.upVal, {
					color = cc.c4b(183, 176, 158, 255)
				})
			elseif slot8.val[3] > 0 then
				slot10.upIcon:texture("common/icon/logo_arrow_green.png")
				text.addEffect(slot10.upVal, {
					color = ui.COLORS.QUALITY_DARK[2]
				})
			else
				slot10.upIcon:texture("common/icon/logo_arrow_red.png")
				text.addEffect(slot10.upVal, {
					color = ui.COLORS.QUALITY_DARK[6]
				})
			end
		end

		slot10.text:text(getLanguageAttr(slot8.attr))

		if ui.ATTR_LOGO[slot8.attr] and not string.match(slot8.val[1], "%%") and not string.match(slot8.val[4], "%%") then
			slot10.icon:texture(ui.ATTR_LOGO[slot8.attr])
			adapt.oneLinePos(slot10.icon, {
				slot10.text,
				slot10.val,
				slot10.up1,
				slot10.upVal,
				slot10.upIcon,
				slot10.up2
			}, cc.p(1, 0))
		else
			slot10.icon:visible(false)
			slot10.text:xy(slot10.icon:xy())
			adapt.oneLinePos(slot10.text, {
				slot10.val,
				slot10.up1,
				slot10.upVal,
				slot10.upIcon,
				slot10.up2
			}, cc.p(1, 0))
		end
	end
end

function slot5(slot0, slot1, slot2, slot3)
	slot1:size(cc.size(slot0:size().width, 72))

	slot5 = csv.chip.resonance[slot2.id]
	slot6 = slot5.param
	slot7 = ""
	slot8 = checkLanguage("kr") and 200 or 0
	slot11 = cc.p
	uv11 = "size"
	slot9 = rich.createWithWidth((slot5.type ~= 1 or string.format(gLanguageCsv.chipAttr01, slot6[1], ui.QUALITY_DARK_COLOR[slot6[2]], gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot6[2]]])) and string.format(gLanguageCsv.chipAttr07, slot6[1], slot6[2]), 40, nil, 1000, nil, cc.p(0, 0.5)):anchorPoint(slot11(0, 0.5)):xy(slot11[1] + slot3, 36):addTo(slot1)
	slot10 = {}

	for slot14 = 1, math.huge do
		if slot5["attrType" .. slot14] and slot15 ~= 0 then
			table.insert(slot10, {
				key = slot15,
				val = dataEasy.getAttrValueString(slot15, slot5["attrNum" .. slot14])
			})
		else
			break
		end
	end

	uv11 = "width"
	slot11 = slot11.getBaseAttr(slot10)

	table.sort(slot11, function (slot0, slot1)
		return slot0.key < slot1.key
	end)

	for slot15, slot16 in ipairs(slot11) do
		uv17 = "width"
		slot20 = cc.p
		uv20 = "size"
		slot18 = rich.createWithWidth(string.format("#C0xFFFCED#%s #C0x91e1b1#+%s", slot17.getAttrName(slot16.key), slot16.val), 40, nil, 1000, nil, cc.p(0, 0.5)):anchorPoint(slot20(0, 0.5)):xy(slot20[slot15 + 1] + slot3 + slot8, 36):addTo(slot1)
	end
end

function slot6(slot0, slot1, slot2)
	slot1:size(cc.size(slot0:size().width, 300))

	slot5 = slot1:get("txtTip")

	slot5:text(slot2 == 1 and gLanguageCsv.chipHaveNot or gLanguageCsv.chipHaveNotResonance)
	slot5:visible(true)
	slot5:xy(slot3 / 2, 150)
end

slot8 = class("ChipTotalAttrView", cc.load("mvc").ViewBase)
slot8.RESOURCE_FILENAME = "chip_base_attr.json"
slot8.RESOURCE_BINDING = {
	item02 = "item02",
	item03 = "item03",
	item = "item",
	item04 = "item04",
	item01 = "item01",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showDatas"),
				item = bindHelper.self("item"),
				item01 = bindHelper.self("item01"),
				item02 = bindHelper.self("item02"),
				item03 = bindHelper.self("item03"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.sign == 1 then
						uv4 = "sign"

						slot4(slot0, slot1, slot3, 0)
					elseif slot3.sign == 2 then
						if slot3.id == 0 then
							uv4 = "id"

							slot4(slot0, slot1, 2)
						else
							uv4 = "sign"

							slot4(slot0, slot1, slot3, 0)
						end
					elseif #slot3 == 0 then
						uv4 = "id"

						slot4(slot0, slot1, 1)
					else
						uv4 = "id"

						slot4(slot0, slot1, slot3)
					end
				end,
				onAfterBuild = function (slot0)
					if slot0:getInnerContainerSize().height <= slot0:getContentSize().height then
						slot0:setTouchEnabled(false)
					end
				end
			}
		}
	},
	compareList = {
		varname = "compareList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showCompareDatas"),
				item = bindHelper.self("item03"),
				item01 = bindHelper.self("item01"),
				item02 = bindHelper.self("item04"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.sign == 1 then
						uv4 = "sign"

						slot4(slot0, slot1, slot3, 200)
					elseif slot3.sign == 2 then
						if slot3.id == 0 then
							uv4 = "id"

							slot4(slot0, slot1, 2)
						else
							uv4 = "sign"

							slot4(slot0, slot1, slot3, 200)
						end
					elseif #slot3 == 0 then
						uv4 = "id"

						slot4(slot0, slot1, 1)
					else
						uv4 = "id"

						slot4(slot0, slot1, slot3)
					end
				end,
				onAfterBuild = function (slot0)
					if slot0:getInnerContainerSize().height <= slot0:getContentSize().height then
						slot0:setTouchEnabled(false)
					end
				end
			}
		}
	},
	btnResonance = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnResonance")
			}
		}
	}
}
slot8.RESOURCE_STYLES = {
	clickClose = true,
	blackLayer = true,
	backGlass = true
}

function slot8.onCreate(slot0, slot1)
	slot0.typ = slot1.typ
	slot0.curPlan = slot1.curPlan
	slot0.cardPlan = slot1.cardPlan
	slot0.showDatas = idlertable.new({})
	slot0.showCompareDatas = idlertable.new({})
	slot0.typeData = {
		{
			idler = slot0.showDatas,
			getAttrs = function ()
				uv0 = "getAttrs"
				uv1 = "cardPlan"
				slot0, slot1 = slot0.getAttrs(slot1.cardPlan)
				uv2 = "getAttrs"

				slot2.setAttrCollect(slot0, slot1)

				return slot0
			end,
			getResonanceAttr = function ()
				uv0 = "getResonanceAttr"
				uv1 = "cardPlan"

				return slot0.getResonanceAttr(slot1.cardPlan)
			end
		},
		{
			idler = slot0.showCompareDatas,
			getAttrs = function ()
				uv0 = "getAttrsValueCmp"
				uv1 = "curPlan"
				uv2 = "curPlan"

				return slot0.getAttrsValueCmp(slot1.curPlan, slot2.cardPlan)
			end,
			getResonanceAttr = function ()
				uv0 = "getResonanceAttr"
				uv1 = "curPlan"

				return slot0.getResonanceAttr(slot1.curPlan)
			end
		}
	}

	slot0.list:visible(slot0.typ == 1)
	slot0.compareList:visible(slot0.typ == 2)
	slot0:getTotalAttrs()
end

function slot8.arrangeData(slot0, slot1, slot2)
	for slot7, slot8 in pairs(slot2) do
		if slot7 % 3 == 1 and slot7 > 1 then
			table.insert(slot1, {})

			slot3 = {}
		end

		table.insert(slot3, slot8)
	end

	if #slot3 > 0 then
		table.insert(slot1, slot3)

		slot3 = {}
	end
end

function slot8.getTotalAttrs(slot0)
	table.insert({}, {
		sign = 1,
		title = gLanguageCsv.basicAttribute
	})

	slot2 = {}

	for slot7 = 1, math.huge do
		if not slot0.typeData[slot0.typ].getAttrs()[slot7] then
			break
		elseif table.nums(slot3[slot7]) > 0 then
			if slot2[slot7] == nil then
				slot2[slot7] = {}
			end

			for slot11, slot12 in ipairs(game.ATTRDEF_TABLE) do
				if slot3[slot7][game.ATTRDEF_ENUM_TABLE[slot12]] then
					table.insert(slot2[slot7], {
						attr = slot12,
						key = slot13,
						val = slot3[slot7][slot13]
					})
				end
			end
		end
	end

	if table.nums(slot2) == 0 then
		table.insert(slot1, {})
	else
		for slot7, slot8 in pairs(slot2) do
			slot0:arrangeData(slot1, slot8)
		end
	end

	table.insert(slot1, {
		sign = 1,
		title = gLanguageCsv.chipResonance
	})

	if #slot0.typeData[slot0.typ].getResonanceAttr() == 0 then
		table.insert(slot1, {
			sign = 2,
			id = 0
		})
	else
		table.sort(slot4, function (slot0, slot1)
			return slot0[2] < slot1[2]
		end)

		for slot8, slot9 in ipairs(slot4) do
			table.insert(slot1, {
				sign = 2,
				id = slot9[1]
			})
		end
	end

	slot0.typeData[slot0.typ].idler:set(slot1)
end

function slot8.onBtnResonance(slot0)
	gGameUI:stackUI("city.card.chip.resonance_preview")
end

return slot8
