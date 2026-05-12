if ccui == nil then
	return
end

function slot0(slot0, slot1)
end

slot1 = {
	setText = function (slot0, slot1)
		uv2 = "ccui.Text:setText"

		slot2("ccui.Text:setText", "ccui.Text:setString")

		return slot0:setString(slot1)
	end
}
ccui.Text.setText = slot1.setText

function slot1.getStringValue(slot0)
	uv1 = "ccui.Text:getStringValue"

	slot1("ccui.Text:getStringValue", "ccui.Text:getString")

	return slot0:getString()
end

ccui.Text.getStringValue = slot1.getStringValue
slot2 = {
	setStringValue = function (slot0, slot1)
		uv2 = "ccui.TextAtlas:setStringValue"

		slot2("ccui.TextAtlas:setStringValue", "ccui.TextAtlas:setString")

		return slot0:setString(slot1)
	end
}
ccui.TextAtlas.setStringValue = slot2.setStringValue

function slot2.getStringValue(slot0)
	uv1 = "ccui.TextAtlas:getStringValue"

	slot1("ccui.TextAtlas:getStringValue", "ccui.TextAtlas:getString")

	return slot0:getString()
end

ccui.TextAtlas.getStringValue = slot2.getStringValue
slot3 = {
	setText = function (slot0, slot1)
		uv2 = "ccui.TextBMFont:setText"

		slot2("ccui.TextBMFont:setText", "ccui.TextBMFont:setString")

		return slot0:setString(slot1)
	end
}
ccui.TextBMFont.setText = slot3.setText

function slot3.getStringValue(slot0)
	uv1 = "ccui.Text:getStringValue"

	slot1("ccui.Text:getStringValue", "ccui.TextBMFont:getString")

	return slot0:getString()
end

ccui.Text.getStringValue = slot3.getStringValue
cc.ShaderCache.getProgram = ({
	getProgram = function (slot0, slot1)
		uv2 = "cc.ShaderCache:getProgram"

		slot2("cc.ShaderCache:getProgram", "cc.ShaderCache:getGLProgram")

		return slot0:getGLProgram(slot1)
	end
}).getProgram
slot5 = {
	getLeftInParent = function (slot0)
		uv1 = "ccui.Widget:getLeftInParent"

		slot1("ccui.Widget:getLeftInParent", "ccui.Widget:getLeftBoundary")

		return slot0:getLeftBoundary()
	end
}
ccui.Widget.getLeftInParent = slot5.getLeftInParent

function slot5.getBottomInParent(slot0)
	uv1 = "ccui.Widget:getBottomInParent"

	slot1("ccui.Widget:getBottomInParent", "ccui.Widget:getBottomBoundary")

	return slot0:getBottomBoundary()
end

ccui.Widget.getBottomInParent = slot5.getBottomInParent

function slot5.getRightInParent(slot0)
	uv1 = "ccui.Widget:getRightInParent"

	slot1("ccui.Widget:getRightInParent", "ccui.Widget:getRightBoundary")

	return slot0:getRightBoundary()
end

ccui.Widget.getRightInParent = slot5.getRightInParent

function slot5.getTopInParent(slot0)
	uv1 = "ccui.Widget:getTopInParent"

	slot1("ccui.Widget:getTopInParent", "ccui.Widget:getTopBoundary")

	return slot0:getTopBoundary()
end

ccui.Widget.getTopInParent = slot5.getTopInParent

function slot5.getSize(slot0)
	uv1 = "ccui.Widget:getSize"

	slot1("ccui.Widget:getSize", "ccui.Widget:getContentSize")

	return slot0:getContentSize()
end

ccui.Widget.getSize = slot5.getSize

function slot5.setSize(slot0, ...)
	uv1 = "ccui.Widget:setSize"

	slot1("ccui.Widget:setSize", "ccui.Widget:setContentSize")

	return slot0:setContentSize(...)
end

ccui.Widget.setSize = slot5.setSize
slot6 = {
	addEventListenerCheckBox = function (slot0, slot1)
		uv2 = "ccui.CheckBox:addEventListenerCheckBox"

		slot2("ccui.CheckBox:addEventListenerCheckBox", "ccui.CheckBox:addEventListener")

		return slot0:addEventListener(slot1)
	end
}
ccui.CheckBox.addEventListenerCheckBox = slot6.addEventListenerCheckBox

function slot6.setSelectedState(slot0, slot1)
	uv2 = "ccui.CheckBox:setSelectedState"

	slot2("ccui.CheckBox:setSelectedState", "ccui.CheckBox:setSelected")

	return slot0:setSelected(slot1)
end

ccui.CheckBox.setSelectedState = slot6.setSelectedState

function slot6.getSelectedState(slot0)
	uv1 = "ccui.CheckBox:getSelectedState"

	slot1("ccui.CheckBox:getSelectedState", "ccui.CheckBox:getSelected")

	return slot0:getSelected()
end

ccui.CheckBox.getSelectedState = slot6.setSelectedState
ccui.Slider.addEventListenerSlider = ({
	addEventListenerSlider = function (slot0, slot1)
		uv2 = "ccui.Slider:addEventListenerSlider"

		slot2("ccui.Slider:addEventListenerSlider", "ccui.Slider:addEventListener")

		return slot0:addEventListener(slot1)
	end
}).addEventListenerSlider
slot8 = {
	addEventListenerTextField = function (slot0, slot1)
		uv2 = "ccui.TextField:addEventListenerTextField"

		slot2("ccui.TextField:addEventListenerTextField", "ccui.TextField:addEventListener")

		return slot0:addEventListener(slot1)
	end
}
ccui.TextField.addEventListenerTextField = slot8.addEventListenerTextField

function slot8.setText(slot0, slot1)
	uv2 = "ccui.TextField:setText"

	slot2("ccui.TextField:setText", "ccui.TextField:setString")

	return slot0:setString(slot1)
end

ccui.TextField.setText = slot8.setText

function slot8.getStringValue(slot0)
	uv1 = "ccui.TextField:getStringValue"

	slot1("ccui.TextField:getStringValue", "ccui.TextField:getString")

	return slot0:getString()
end

ccui.TextField.getStringValue = slot8.getStringValue
slot9 = {
	addEventListenerPageView = function (slot0, slot1)
		uv2 = "ccui.PageView:addEventListenerPageView"

		slot2("ccui.PageView:addEventListenerPageView", "ccui.PageView:addEventListener")

		return slot0:addEventListener(slot1)
	end
}
ccui.PageView.addEventListenerPageView = slot9.addEventListenerPageView

function slot9.addWidgetToPage(slot0, slot1, slot2)
	uv3 = "ccui.PageView:addWidgetToPage"

	slot3("ccui.PageView:addWidgetToPage", "ccui.PageView:insertPage")

	return slot0:insertPage(slot1, slot2)
end

ccui.PageView.addWidgetToPage = slot9.addWidgetToPage

function slot9.getCurPageIndex(slot0)
	uv1 = "ccui.PageView:getCurPageIndex"

	slot1("ccui.PageView:getCurPageIndex", "ccui.PageView:getCurrentPageIndex")

	return slot0:getCurrentPageIndex()
end

ccui.PageView.getCurPageIndex = slot9.getCurPageIndex

function slot9.setCurPageIndex(slot0, slot1)
	uv2 = "ccui.PageView:setCurPageIndex"

	slot2("ccui.PageView:setCurPageIndex", "ccui.PageView:setCurrentPageIndex")

	return slot0:setCurrentPageIndex(slot1)
end

ccui.PageView.setCurPageIndex = slot9.setCurPageIndex

function slot9.getPages(slot0)
	uv1 = "ccui.PageView:getPages"

	slot1("ccui.PageView:getPages", "ccui.PageView:getItems")

	return slot0:getItems()
end

ccui.PageView.getPages = slot9.getPages

function slot9.getPage(slot0, slot1)
	uv2 = "ccui.PageView:getPage"

	slot2("ccui.PageView:getPage", "ccui.PageView:getItem")

	return slot0:getItem(slot1)
end

ccui.PageView.getPage = slot9.getPage

function slot9.setCustomScrollThreshold(slot0)
	print("Since v3.9, this method has no effect.")
end

ccui.PageView.setCustomScrollThreshold = slot9.setCustomScrollThreshold

function slot9.getCustomScrollThreshold(slot0)
	print("Since v3.9, this method has no effect.")
end

ccui.PageView.getCustomScrollThreshold = slot9.getCustomScrollThreshold

function slot9.isUsingCustomScrollThreshold(slot0)
	print("Since v3.9, this method has no effect.")
end

ccui.PageView.isUsingCustomScrollThreshold = slot9.isUsingCustomScrollThreshold

function slot9.setUsingCustomScrollThreshold(slot0)
	print("Since v3.9, this method has no effect.")
end

ccui.PageView.setUsingCustomScrollThreshold = slot9.setUsingCustomScrollThreshold
ccui.ScrollView.addEventListenerScrollView = ({
	addEventListenerScrollView = function (slot0, slot1)
		uv2 = "ccui.ScrollView:addEventListenerScrollView"

		slot2("ccui.ScrollView:addEventListenerScrollView", "ccui.ScrollView:addEventListener")

		return slot0:addEventListener(slot1)
	end
}).addEventListenerScrollView
slot11 = {
	addEventListenerListView = function (slot0, slot1)
		uv2 = "ccui.ListView:addEventListenerListView"

		slot2("ccui.ListView:addEventListenerListView", "ccui.ListView:addEventListener")

		return slot0:addEventListener(slot1)
	end
}
ccui.ListView.addEventListenerListView = slot11.addEventListenerListView

function slot11.requestRefreshView(slot0)
	uv1 = "ccui.ListView:requestRefreshView"

	slot1("ccui.ListView:requestRefreshView", "ccui.ListView:forceDoLayout")

	return slot0:forceDoLayout()
end

ccui.ListView.requestRefreshView = slot11.requestRefreshView

function slot11.refreshView(slot0)
	uv1 = "ccui.ListView:refreshView"

	slot1("ccui.ListView:refreshView", "ccui.ListView:refreshView")

	return slot0:forceDoLayout()
end

ccui.ListView.refreshView = slot11.refreshView
