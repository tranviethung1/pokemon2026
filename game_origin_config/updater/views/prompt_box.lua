slot0 = {
	__index = slot0,
	RESOURCE_FILENAME = "common_prompt_box.json",
	RESOURCE_BINDING = {
		selectPanel = "selectPanel",
		["selectPanel.textTip"] = "textTip",
		title = "titleLabel",
		content = "contentLabel",
		btnOK = {
			varname = "btnOK"
		},
		btnCancel = {
			varname = "btnCancel"
		},
		btnOkCenter = {
			varname = "btnOkCenter"
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot1 = slot1 or {}
	slot2 = slot1.btnType or 1
	slot0._okcb = slot1.cb
	slot0._closecb = slot1.closeCb
	slot3, slot4 = slot0.btnOK:getPosition()

	slot0.titleLabel:setString(Language.tips)
	slot0.textTip:setString(Language.boxTextTip)
	slot0.btnOkCenter:getChildByName("title"):setString(Language.sure)
	slot0.selectPanel:setVisible(false)

	if slot1.title then
		slot0.titleLabel:setString(slot1.title)
	end

	slot5 = slot0.contentLabel:getContentSize()

	if slot2 == 1 then
		slot0.btnOK:setVisible(false)
		slot0.btnCancel:setVisible(false)
		slot0.btnOkCenter:setVisible(true)

		slot5.height = slot5.height - 70

		slot0.contentLabel:setContentSize(slot5)
	else
		slot0.btnOK:setVisible(true)
		slot0.btnCancel:setVisible(true)
		slot0.btnOkCenter:setVisible(false)
	end

	slot7, slot8 = beauty.textScroll({
		margin = 20,
		size = slot5,
		fontSize = slot1.fontSize or 50,
		effect = {
			color = ui.COLORS.NORMAL.DEFAULT
		},
		strs = slot1.content or slot1.strs,
		verticalSpace = slot1.verticalSpace or 10,
		isRich = slot1.isRich,
		align = slot1.align or "center"
	})
	slot9 = 0

	if slot8 < slot5.height then
		slot9 = -(slot5.height - slot8) / 2
	end

	slot7:setPositionY(slot9)
	slot0.contentLabel:addChild(slot7, 10)
end

function slot0.onClickOK(slot0)
	if slot0._okcb then
		slot0._okcb()
	end

	slot0.node:removeFromParent()

	return slot0
end

function slot0.onClose(slot0)
	if slot0._closecb then
		slot0._closecb()
	end

	slot0.node:removeFromParent()

	return slot0
end

return function (slot0)
	slot1 = {}
	uv4 = "setmetatable"

	setmetatable(slot1, slot4)

	slot1.node = ccs.GUIReader:getInstance():widgetFromJsonFile(slot1.RESOURCE_FILENAME)

	for slot6, slot7 in pairs(slot1.RESOURCE_BINDING) do
		if type(slot7) == "table" then
			if slot7.varname then
				slot1[slot7.varname] = nodetools.get(slot2, slot6)
			end
		else
			slot1[slot7] = nodetools.get(slot2, slot6)
		end
	end

	nodetools.get(slot2, "closeBtn"):onClick(function ()
		uv0 = "onClose"

		slot0:onClose()
	end)
	slot1.btnCancel:onClick(function ()
		uv0 = "onClose"

		slot0:onClose()
	end)
	slot1.btnOK:onClick(function ()
		uv0 = "onClickOK"

		slot0:onClickOK()
	end)
	slot1.btnOkCenter:onClick(function ()
		uv0 = "onClickOK"

		slot0:onClickOK()
	end)
	text.addEffect(nodetools.get(slot2, "btnOkCenter.title"), {
		glow = {
			color = ui.COLORS.GLOW.WHITE
		}
	})
	slot1:onCreate(slot0)

	return slot1
end
