slot0 = require("app.views.city.activity.customize_gift_select")
slot1 = class("ContestBetBetView", slot0)

function slot2(slot0, slot1, slot2, slot3)
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

slot1.RESOURCE_FILENAME = "activity_preferential_goods_select.json"
slot1.RESOURCE_BINDING = clone(rawget(slot0, "RESOURCE_BINDING"))
slot1.RESOURCE_BINDING.tip1 = "tip1"
slot1.RESOURCE_BINDING.bg = "bg"
slot1.RESOURCE_BINDING.title = "title"

function slot1.onCreate(slot0, slot1)
	slot0.activityId = slot1.activityId
	slot2 = slot1.val

	slot0:initModel(slot1.data, slot1.slotNums, slot2.optionSlotNum, slot2.showAwards, slot1.choose)
	slot0:initUI()
	Dialog.onCreate(slot0)
end

function slot1.initUI(slot0)
	if csv.yunying.yyhuodong[slot0.activityId] and slot1.clientParam and slot1.clientParam.res then
		slot2 = slot1.clientParam.res

		slot0.bg:texture(string.format("%s/%s", slot2, "box_thwx.png"))
		slot0.title:texture(string.format("%s/%s", slot2, "txt_zxwp.png"))
	end
end

function slot1.btnState(slot0, slot1)
	slot0.btn:setTouchEnabled(not slot1)
	uiEasy.setBtnShader(slot0.btn, slot0.btn:get("label"), slot1 and 2 or 1)
end

return slot1
