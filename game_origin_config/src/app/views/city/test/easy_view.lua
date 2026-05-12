slot1 = 700
slot2 = 300

return {
	CustomBtnType = {
		Center = 2,
		RightToLeft = 3,
		LeftToRight = 1
	},
	stage = {},
	btnItem = {},
	initBaseView = function (slot0)
		slot1 = {
			root = slot2
		}
		uv2 = "root"
		slot6 = slot0.stage:width() / 2
		uv6 = "root"

		ccui.Layout:create():size(slot0.stage:width(), slot0.stage:height()):setBackGroundColorType(ccui.LayoutBackGroundColorType.solid):color(cc.c3b(0, 0, 0)):opacity(200):addTo(slot0.stage, 9999, "baseView"):xy(0, 0):setTouchEnabled(true):setSwallowTouches(true).addBtnListToView(slot1, {
			"btnClose|关闭"
		}, cc.p(slot6, 100), slot6.CustomBtnType.Center)

		return slot1
	end,
	initScrollView = function (slot0, slot1, slot2)
		uv3 = "initBaseView"
		slot3 = slot3.initBaseView(slot0)
		slot3.scrollView = ccui.ScrollView:create():size(slot0.stage:width(), slot0.stage:height() - 200):setInnerContainerSize(cc.size(slot1 or slot0.stage:width() * 4, slot2 or slot0.stage:height() - 200)):setBackGroundColorType(ccui.LayoutBackGroundColorType.solid):color(cc.c3b(0, 255, 0)):opacity(100):xy(0, 200):setTouchEnabled(true):setSwallowTouches(true):addTo(slot3.root, 1, "scrollView"):setDirection(0)

		return slot3
	end,
	initForceScrollView = function (slot0, slot1)
		uv2 = "initBaseView"
		slot2 = slot2.initBaseView(slot0)
		uv5 = "leftFrontUnitScrollView"
		slot6 = (slot0.stage:height() - 200) / 2
		uv6 = "leftFrontUnitScrollView"
		slot5 = 1
		slot2.leftFrontUnitScrollView = ccui.ScrollView:create():size(slot5, slot6):setInnerContainerSize(cc.size(slot6, (slot0.stage:height() - 200) / 2 + 100)):setBackGroundColorType(ccui.LayoutBackGroundColorType.solid):color(cc.c3b(255, 0, 0)):opacity(100):xy(0, 200 + (slot0.stage:height() - 200) / 2):setTouchEnabled(true):setSwallowTouches(true):addTo(slot2.root, 1, "scrollView"):setDirection(slot5)
		uv5 = "leftFrontUnitScrollView"
		slot6 = (slot0.stage:height() - 200) / 2
		uv6 = "leftFrontUnitScrollView"
		slot5 = 1
		slot2.leftBackUnitScrollView = ccui.ScrollView:create():size(slot5, slot6):setInnerContainerSize(cc.size(slot6, (slot0.stage:height() - 200) / 2 + 100)):setBackGroundColorType(ccui.LayoutBackGroundColorType.solid):color(cc.c3b(255, 0, 0)):opacity(100):xy(0, 200):setTouchEnabled(true):setSwallowTouches(true):addTo(slot2.root, 1, "scrollView"):setDirection(slot5)
		uv5 = "leftFrontUnitScrollView"
		slot6 = (slot0.stage:height() - 200) / 2
		uv6 = "leftFrontUnitScrollView"
		slot5 = 100
		uv5 = "leftFrontUnitScrollView"
		slot5 = 1
		slot2.rightFrontUnitScrollView = ccui.ScrollView:create():size(slot5, slot6):setInnerContainerSize(cc.size(slot6, (slot0.stage:height() - 200) / 2 + 100)):setBackGroundColorType(ccui.LayoutBackGroundColorType.solid):color(cc.c3b(0, 0, 255)):opacity(slot5):xy(slot5, 200 + (slot0.stage:height() - 200) / 2):setTouchEnabled(true):setSwallowTouches(true):addTo(slot2.root, 1, "scrollView"):setDirection(slot5)
		uv5 = "leftFrontUnitScrollView"
		slot6 = (slot0.stage:height() - 200) / 2
		uv6 = "leftFrontUnitScrollView"
		slot5 = 100
		uv5 = "leftFrontUnitScrollView"
		slot2.rightBackUnitScrollView = ccui.ScrollView:create():size(slot5, slot6):setInnerContainerSize(cc.size(slot6, (slot0.stage:height() - 200) / 2 + 100)):setBackGroundColorType(ccui.LayoutBackGroundColorType.solid):color(cc.c3b(0, 0, 255)):opacity(slot5):xy(slot5, 200):setTouchEnabled(true):setSwallowTouches(true):addTo(slot2.root, 1, "scrollView"):setDirection(1)
		slot5 = slot0.stage
		slot6 = slot5
		uv6 = "ccui"
		uv6 = "leftFrontUnitScrollView"
		slot5 = cc.size
		slot5 = 100
		uv5 = "leftFrontUnitScrollView"
		slot5 = 2
		slot2.scrollForceView = ccui.ScrollView:create():size(slot5.width(slot6) - slot6 - 2 * slot6, slot0.stage:height() - 200):setInnerContainerSize(slot5(slot1 or slot0.stage:width() * 4, slot0.stage:height() - 200)):setBackGroundColorType(ccui.LayoutBackGroundColorType.solid):color(cc.c3b(0, 255, 0)):opacity(slot5):xy(slot5 * 2, 200):setTouchEnabled(true):setSwallowTouches(true):addTo(slot2.root, 1, "scrollView"):setDirection(slot5)
		uv5 = "ccui"
		slot6 = slot0.stage:height() - 200
		uv6 = "ccui"
		slot5 = slot0.stage
		slot6 = slot5
		uv6 = "ccui"
		slot2.attrView = ccui.ListView:create():size(slot5, slot6):setInnerContainerSize(cc.size(slot6, slot0.stage:height() * 2)):setBackGroundColorType(ccui.LayoutBackGroundColorType.solid):color(cc.c3b(123, 123, 123)):opacity(100):addTo(slot2.root, 1, "attrView"):xy(slot5.width(slot6) - slot6, 200):setTouchEnabled(true):setSwallowTouches(true):setItemsMargin(5)

		return slot2
	end,
	initForceAttrView = function (slot0, slot1)
	end,
	initListView = function (slot0)
		uv1 = "initBaseView"
		slot1 = slot1.initBaseView(slot0)
		slot1.listView = ccui.ListView:create():size(slot0.stage:width(), slot0.stage:height() - 200):setInnerContainerSize(cc.size(slot0.stage:width(), slot0.stage:height() * 2)):setBackGroundColorType(ccui.LayoutBackGroundColorType.solid):color(cc.c3b(0, 255, 0)):opacity(100):xy(0, 200):setTouchEnabled(true):setSwallowTouches(true):addTo(slot1.root, 1, "listView"):setItemsMargin(5)

		return slot1
	end,
	addTextListView = function (slot0, slot1, slot2)
		if slot0.listView then
			slot0.listView:removeAllItems()

			return
		end

		slot0.listView = ccui.ListView:create():size(slot2):setInnerContainerSize(slot2):setBackGroundColorType(ccui.LayoutBackGroundColorType.solid):color(cc.c3b(0, 255, 0)):opacity(100):xy(slot1):setTouchEnabled(true):setSwallowTouches(true):addTo(slot0.root, 1, "listView"):setItemsMargin(5)
	end,
	addInputControl = function (slot0, slot1, slot2, slot3, slot4)
		if slot4 then
			slot0.editBox = slot0.editBox or {}
			slot0.editBox[slot4] = ccui.EditBox:create(cc.size(600, 100), "img/editor/input.png"):addTo(slot0.root, 1, "input"):setFontSize(72):setFontColor(ui.COLORS.NORMAL.DEFAULT):xy(slot1):setInputMode(slot2):setPlaceHolder(slot3)
		else
			slot0.editBox = slot5
		end
	end,
	addBtnListToView = function (slot0, slot1, slot2, slot3)
		slot4, slot5 = nil
		slot6 = 10

		if slot0.btnClose then
			slot0.btnClose:removeSelf()

			slot0.btnClose = nil
		end

		uv7 = "btnClose"

		if slot3 == slot7.CustomBtnType.Center then
			uv9 = "btnClose"
			slot8 = slot2.x - (slot9.btnItem:width() / 3 + slot6) * (#slot1 - 1)
			slot4 = cc.p(slot8, slot2.y)
			uv8 = "btnClose"
			slot5 = cc.p(slot8.btnItem:width() / 3 * 2 + 2 * slot6, 0)
		end

		slot7, slot8, slot9 = nil

		for slot13, slot14 in ipairs(slot1) do
			slot7 = slot13 - 1
			slot15 = string.split(slot14, "|")
			slot8 = slot15
			uv15 = "btnClose"
			slot9 = slot15.btnItem:clone()

			slot9:get("label"):text(slot8[2])
			slot9:addTo(slot0.root, 1, slot8[1]):xy(slot4.x + slot5.x * slot7, slot4.y + slot5.y * slot7)

			if slot8[1] == "btnClose" then
				slot9:addClickEventListener(function ()
					uv0 = "root"

					slot0.root:removeSelf()
				end)
			end

			slot0[slot8[1]] = slot9
		end
	end
}
