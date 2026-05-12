slot0 = require("easy.bind.helper")
slot1 = class("drawAttr", cc.load("mvc").ViewBase)
slot2 = 31
slot1.defaultProps = {
	perfectShow = true,
	type = "small",
	lock = false,
	offsetPos = {
		{
			x = 0,
			y = 0
		},
		{
			x = 0,
			y = 0
		},
		{
			x = 0,
			y = 0
		},
		{
			x = 0,
			y = 0
		},
		{
			x = 0,
			y = 0
		},
		{
			x = 0,
			y = 0
		}
	},
	nvalue = {
		0,
		0,
		0,
		0,
		0,
		0
	}
}
slot3 = {
	RESOURCE_FILENAME = "common_hexagon_item.json",
	RESOURCE_BINDING = {
		txt = "panel.txt",
		panel = "panel",
		perfect = "panel.perfect",
		imgType = "panel.imgType",
		num = "panel.num",
		lock = "panel.lock"
	}
}

function slot1.refresh(slot0, slot1)
	slot2 = slot0.panel:get("img")
	slot3 = slot2:size()

	if not slot2:get("MyDrawNode") then
		cc.DrawNode:create():alignCenter(slot2:size()):addTo(slot2, 3, "MyDrawNode")
	end

	slot4:clear()

	slot5 = 0
	slot6 = 0
	slot7 = 220
	slot8 = math.sqrt(3)
	slot9 = {}

	for slot13, slot14 in ipairs(game.ATTRDEF_SIMPLE_TABLE) do
		uv18 = "panel"

		table.insert(slot9, slot7 * (slot1[slot14] or 0) / slot18)
	end

	slot10 = {
		cc.p(slot5, slot6 + slot9[1]),
		cc.p(slot5 + slot9[2] / 2 * slot8, slot6 + slot9[2] / 2),
		cc.p(slot5 + slot9[3] / 2 * slot8, slot6 - slot9[3] / 2),
		cc.p(slot5, slot6 - slot9[4]),
		cc.p(slot5 - slot9[5] / 2 * slot8, slot6 - slot9[5] / 2),
		cc.p(slot5 - slot9[6] / 2 * slot8, slot6 + slot9[6] / 2)
	}
	slot11 = slot0.item:size()
	slot12 = cc.p(slot3.width / 2 + 90, slot3.height - 50)
	slot13 = slot0.offsetPos
	slot14 = {
		cc.p(slot12.x + slot13[1].x, slot12.y + slot7 + slot13[1].y),
		cc.p(slot12.x + slot7 / 2 * slot8 + slot13[2].x, slot12.y + slot7 / 2 + slot13[2].y),
		cc.p(slot12.x + slot7 / 2 * slot8 + slot13[3].x, slot12.y - slot7 / 2 + slot13[3].y),
		cc.p(slot12.x + slot13[4].x, slot12.y - slot7 + slot13[4].y),
		cc.p(slot12.x - slot7 / 2 * slot8 + slot13[5].x, slot12.y - slot7 / 2 + slot13[5].y),
		cc.p(slot12.x - slot7 / 2 * slot8 + slot13[6].x, slot12.y + slot7 / 2 + slot13[6].y)
	}
	slot15 = arraytools.hash({
		3,
		4,
		5
	})

	for slot19, slot20 in ipairs(slot0.itemNodes) do
		slot22 = slot20:get("num")
		slot23 = slot20:get("txt")
		slot24 = slot20:get("zwake_add")
		slot25 = slot0.lock and 1 or 0.5
		slot26 = slot0.lock and slot20:get("lock"):x() - 30 or slot23:x() + slot23:width() / 2

		if slot0.numFontSize then
			slot22:setFontSize(slot0.numFontSize)
		end

		slot30 = 0.5

		slot22:text(slot1[game.ATTRDEF_SIMPLE_TABLE[slot19]]):anchorPoint(slot25, slot30)

		uv30 = "panel"

		slot20:get("perfect"):visible(slot1[game.ATTRDEF_SIMPLE_TABLE[slot19]] == slot30 and slot0.perfectShow)
		slot20:xy(slot14[slot19])
		adapt.oneLineCenterPos(cc.p(slot23:x() + 44, slot22:y()), {
			slot22,
			slot24,
			slot21
		}, {
			cc.p(0, 3),
			cc.p(5, 2)
		})
	end

	slot16 = 1

	for slot20 = 1, #slot10 do
		slot4:drawPolygon({
			slot10[slot16],
			slot10[slot16 + 1] or slot10[1],
			cc.p(slot5, slot6)
		}, 3, cc.c4f(0.9450980392156862, 0.3607843137254902, 0.3843137254901961, 0.6), 0.5, cc.c4f(0.9450980392156862, 0.3607843137254902, 0.3843137254901961, 0.6))

		slot16 = slot16 + 1
	end

	slot2:xy(slot0.offset.x, slot0.offset.y)
end

function slot1.baseShow(slot0)
	slot0.itemNodes = {}

	if slot0.panel then
		slot0.panel:removeFromParent()
	end

	slot1 = ccui.Layout:create():size(198, 198):alignCenter(slot0:size()):addTo(slot0, 1, "_draw_")
	slot6 = slot1
	slot3 = ccui.ImageView:create("city/card/system/nvalue/bg_individual.png"):scale(slot0.bgScale or slot0.type == "small" and 1.8 or 1):addTo(slot1, 2, "img"):alignCenter(slot1.size(slot6))
	slot0.panel = slot1
	uv6 = "itemNodes"
	slot4 = gGameUI:createSimpleView(slot6, slot0):init()

	slot4:hide()

	slot0.item = slot4.panel

	slot0.item:hide()

	slot5 = slot0.item:multiget("perfect", "txt", "lock", "imgType", "num")

	if slot0.type == "small" then
		itertools.invoke({
			slot5.txt,
			slot5.num
		}, "setFontSize", 45)
		slot5.txt:y(slot5.txt:y() - 10)
		slot5.lock:hide()
	elseif slot0.lock == false then
		slot5.lock:hide()
	end

	slot6 = arraytools.hash({
		1
	})
	slot7 = arraytools.hash({
		2,
		6
	})
	slot8 = arraytools.hash({
		3,
		4,
		5
	})

	for slot12 = 1, 6 do
		slot13 = slot0.item:clone():tag(slot12):scale(slot0.type == "small" and 0.68 or 1)

		table.insert(slot0.itemNodes, slot13)
		slot13:multiget("perfect", "txt", "lock", "imgType", "num", "zwake_add").txt:text(getLanguageAttr(game.ATTRDEF_SIMPLE_TABLE[slot12]))

		if slot0.textFontSize then
			slot14.txt:setFontSize(slot0.textFontSize)
		end

		slot14.imgType:texture(ui.ATTR_LOGO[game.ATTRDEF_SIMPLE_TABLE[slot12]])
		slot13:show()
		slot13:addTo(slot0.panel, 5, "tag" .. slot12)

		if slot8[slot12] then
			slot15 = slot14.num:y()

			slot14.perfect:y(slot15 - 55)
			itertools.invoke({
				slot14.imgType,
				slot14.txt
			}, "y", slot15 + 50)
		end

		if slot7[slot12] then
			slot14.perfect:y(slot14.txt:y() - 60)
		end

		slot14.zwake_add:hide()
	end
end

function slot1.zwakeAdd(slot0, slot1)
	slot2 = slot0.panel:get("img")

	slot2:removeChildByName("zwake")

	slot7 = "zwake"
	slot0.zwakeImg = ccui.ImageView:create("city/zawake/logo_z.png"):scale(1):addTo(slot2, 10, slot7):alignCenter(slot2:size())

	slot0.zwakeImg:visible(not itertools.isempty(slot1))

	slot3 = {
		[slot7] = slot1[slot8]
	}

	for slot7, slot8 in ipairs(game.ATTRDEF_SIMPLE_TABLE) do
		-- Nothing
	end

	for slot7 = 1, 6 do
		slot9 = slot0.panel:getChildByName("tag" .. slot7):get("zwake_add")

		if slot3[slot7] then
			slot9:show()
			slot9:text(string.format("(+%d)", slot3[slot7]))
		else
			slot9:hide()
		end

		adapt.oneLineCenterPos(cc.p(slot8:get("txt"):x() + 44, slot8:get("num"):y()), {
			slot8:get("num"),
			slot8:get("zwake_add"),
			slot8:get("lock")
		}, {
			cc.p(0, 3),
			cc.p(5, 2)
		})
	end
end

function slot1.initExtend(slot0)
	slot1 = slot0.baseShow

	slot1(slot0)

	uv1 = "baseShow"

	slot1.callOrWhen(slot0.nvalue, functools.partial(slot0.refresh, slot0))

	if slot0.nvalueLocked then
		idlereasy.when(slot0.nvalueLocked, function (slot0, slot1)
			for slot5, slot6 in ipairs(game.ATTRDEF_SIMPLE_TABLE) do
				slot8 = "common/btn/btn_unlock_big.png"

				if slot1[slot6] or false then
					slot8 = "common/btn/btn_lock_big.png"
				end

				uv9 = "ipairs"
				slot9 = slot9.itemNodes[slot5]
				uv10 = "ipairs"
				slot10 = slot10.itemNodes[slot5]
				slot11 = slot10
				slot10 = slot10.get(slot11, "lock")
				uv11 = "ipairs"
				slot11 = slot11.itemNodes[slot5]
				slot12 = slot11
				uv12 = "ipairs"

				slot10:show()

				slot13 = slot10.texture

				slot13(slot10, slot8)

				uv13 = "ipairs"
				slot13 = slot13.itemNodes[slot5]:get("txt")
				slot14 = slot13
				uv14 = "ipairs"

				adapt.oneLineCenterPos(cc.p(slot13.x(slot14) + 44, slot14.itemNodes[slot5]:get("num"):y()), {
					slot11.get(slot12, "num"),
					slot12.itemNodes[slot5]:get("zwake_add"),
					slot10
				}, {
					cc.p(0, 3),
					cc.p(5, 2)
				})
			end
		end)

		function slot1()
			uv0 = "nvalueLocked"
			slot0 = slot0.nvalueLocked:read()

			for slot5, slot6 in ipairs(game.ATTRDEF_SIMPLE_TABLE) do
				if slot0[slot6] then
					slot1 = 0 + 1
				end
			end

			return slot1, slot0[v] or false
		end

		for slot5, slot6 in ipairs(game.ATTRDEF_SIMPLE_TABLE) do
			if slot0.itemNodes[slot5]:get("lock") and slot0.lockCb then
				bind.touch(slot0, slot0.itemNodes[slot5], {
					methods = {
						ended = function ()
							uv0 = "lockCb"
							slot0, slot1 = slot0()
							uv2 = "selectDbId"
							uv3 = "selectDbId"
							uv4 = "lockCb"
							uv5 = "selectDbId"

							slot2.lockCb(slot3, slot4, slot5.selectDbId, slot0, slot1)
						end
					}
				})
				slot8:setTouchEnabled(true)
				bind.touch(slot0, slot8, {
					methods = {
						ended = function ()
							uv0 = "lockCb"
							slot0, slot1 = slot0()
							uv2 = "selectDbId"
							uv3 = "selectDbId"
							uv4 = "lockCb"
							uv5 = "selectDbId"

							slot2.lockCb(slot3, slot4, slot5.selectDbId, slot0, slot1)
						end
					}
				})
			end
		end
	end

	if slot0.onNode then
		slot0.onNode(slot0.panel)
	end

	return slot0
end

return slot1
