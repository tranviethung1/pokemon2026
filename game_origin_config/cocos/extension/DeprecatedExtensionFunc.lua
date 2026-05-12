if cc.Control == nil then
	return
end

function slot0(slot0, slot1)
end

CCControl.addHandleOfControlEvent = ({
	addHandleOfControlEvent = function (slot0, slot1, slot2)
		uv3 = "addHandleOfControlEvent"

		slot3("addHandleOfControlEvent", "registerControlEventHandler")
		print("come in addHandleOfControlEvent")
		slot0:registerControlEventHandler(slot1, slot2)
	end
}).addHandleOfControlEvent
CCTableView.kTableViewScroll = cc.SCROLLVIEW_SCRIPT_SCROLL
CCTableView.kTableViewZoom = cc.SCROLLVIEW_SCRIPT_ZOOM
CCTableView.kTableCellTouched = cc.TABLECELL_TOUCHED
CCTableView.kTableCellSizeForIndex = cc.TABLECELL_SIZE_FOR_INDEX
CCTableView.kTableCellSizeAtIndex = cc.TABLECELL_SIZE_AT_INDEX
CCTableView.kNumberOfCellsInTableView = cc.NUMBER_OF_CELLS_IN_TABLEVIEW
CCScrollView.kScrollViewScroll = cc.SCROLLVIEW_SCRIPT_SCROLL
CCScrollView.kScrollViewZoom = cc.SCROLLVIEW_SCRIPT_ZOOM
