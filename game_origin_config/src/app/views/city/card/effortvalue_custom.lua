slot0 = {
	ONE_AND_TEN = 1,
	ONE = 2,
	SAVE_AND_CANCEL = 3,
	SAVE = 4
}
slot1 = {
	ONE = 1,
	TEN = 2
}
slot2 = class("CardCustomEffortvalueView", Dialog)
slot2.RESOURCE_FILENAME = "card_effortvalue_custom.json"
slot2.RESOURCE_BINDING = {
	costNum = "costNum",
	costText = "costText",
	num = "num",
	slider = "slider",
	icon = "icon",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	sliderNum = {
		varname = "sliderNumber",
		binds = {
			event = "text",
			idler = bindHelper.self("sliderNum")
		}
	},
	btnSub = {
		varname = "subBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -1)
			end)
		}
	},
	btnAdd = {
		varname = "addBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 1)
			end)
		}
	},
	["sureBtn.txt"] = {
		varname = "costTxt",
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	sureBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSureClick")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.dbid = slot4
	slot0.idx = slot1
	slot0.cb = slot5
	slot0.times = slot3

	slot0:initModel()
	slot0:enableSchedule()
	slot0.icon:texture(dataEasy.getCfgByKey(slot2).icon)
	slot0.costNum:text(3 * (3 - slot1))
	slot0.costTxt:text(string.format(gLanguageCsv.customEffortTimes, slot0.selectNum:read()))
	slot0.slider:setPercent(0)
	adapt.oneLinePos(slot0.costText, {
		slot0.costNum,
		slot0.icon
	}, {
		cc.p(10, 0),
		cc.p(10, 0)
	})
	idlereasy.when(slot0.selectNum, function (slot0, slot1)
		uv2 = "sliderNum"

		if slot1 >= slot2 or not slot1 then
			uv1 = "sliderNum"
		end

		uv2 = "set"
		slot2 = slot2.sliderNum
		slot2 = slot2.set
		uv4 = "set"
		uv6 = "set"

		slot2(slot2, slot4.selectNum:read() .. "/" .. slot6.times)

		uv2 = "set"

		if not slot2.slider:isHighlighted() then
			uv3 = "sliderNum"
			slot3 = slot1 / slot3 * 100
			uv3 = "set"

			slot3.slider:setPercent(math.ceil(slot3))
		end

		uv3 = "set"
		slot3 = slot3.addBtn
		uv5 = "sliderNum"

		cache.setShader(slot3, false, slot5 <= slot1 and "hsl_gray" or "normal")

		slot2 = cache.setShader
		uv3 = "set"
		slot4 = false

		slot2(slot3.subBtn, slot4, slot1 <= 1 and "hsl_gray" or "normal")

		uv2 = "set"
		slot2 = slot2.addBtn
		slot2 = slot2.setTouchEnabled
		uv4 = "sliderNum"

		slot2(slot2, slot1 < slot4)

		uv2 = "set"
		slot2 = slot2.subBtn
		slot2 = slot2.setTouchEnabled
		slot4 = slot1 > 1

		slot2(slot2, slot4)

		uv2 = "set"
		slot2 = slot2.sliderNum
		slot2 = slot2.set
		uv4 = "set"
		slot5 = "/"
		uv6 = "set"
		slot4 = slot4.selectNum:read() .. slot5 .. slot6.times

		slot2(slot2, slot4)

		uv2 = "set"
		slot2 = slot2.costNum
		slot2 = slot2.text
		uv4 = "selectNum"
		uv5 = "set"
		slot5 = slot5.selectNum
		slot6 = slot5

		slot2(slot2, 3 * (3 - slot4) * slot5.read(slot6))

		uv2 = "set"
		slot2 = slot2.costTxt
		slot3 = slot2
		slot5 = gLanguageCsv.customEffortTimes
		uv6 = "set"

		slot2.text(slot3, string.format(slot5, slot6.selectNum:read()))

		uv3 = "set"
		uv5 = "set"
		slot5 = slot5.costNum
		uv5 = "set"

		adapt.oneLinePos(slot3.costText, {
			slot5,
			slot5.icon
		}, {
			cc.p(10, 0),
			cc.p(10, 0)
		})

		if slot1 == 1 then
			uv2 = "set"

			slot2:unScheduleAll()
		end

		uv3 = "set"
		uv4 = "set"

		adapt.oneLinePos(slot3.num, slot4.sliderNumber, cc.p(0, 0))
	end)
	slot0.slider:addEventListener(function (slot0, slot1)
		uv2 = "unScheduleAll"

		slot2:unScheduleAll()

		slot3 = slot0
		uv3 = "getPercent"
		slot6 = math.min(slot3, math.ceil(slot3 / 100 * slot0.getPercent(slot3)))
		uv6 = "unScheduleAll"

		slot6.selectNum:set(math.max(slot6, 1))
	end)
	Dialog.onCreate(slot0)
end

function slot2.initModel(slot0)
	slot0.selectNum = idler.new(1)
	slot0.sliderNum = idler.new(slot0.selectNum:read() .. "/" .. slot0.times)
end

function slot2.onClose(slot0)
	Dialog.onClose(slot0)
end

function slot2.onChangeNum(slot0, slot1, slot2, slot3)
	if slot2.name == "click" then
		slot0:unScheduleAll()
		slot0:onIncreaseNum(slot3)
	elseif slot2.name == "began" then
		slot0:schedule(function ()
			uv0 = "onIncreaseNum"
			uv2 = "onIncreaseNum"

			slot0:onIncreaseNum(slot2)
		end, 0.05, 0, 100)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot0:unScheduleAll()
	end
end

function slot2.onIncreaseNum(slot0, slot1)
	slot0.selectNum:modify(function (slot0)
		uv3 = "cc"
		uv5 = "clampf"

		return true, cc.clampf(slot0 + slot3, 0, slot5.times)
	end)
end

function slot2.onSureClick(slot0)
	if slot0.selectNum:read() == 0 then
		gGameUI:showTip(gLanguageCsv.pleaseSelectMaterials)

		return
	end

	gGameApp:requestServer("/game/card/effort/train", function (slot0)
		uv1 = "cb"

		if slot1.cb then
			uv1 = "cb"

			slot1.cb(slot0)
		end

		uv1 = "cb"

		slot1:onClose()
	end, slot0.dbid, slot0.idx, slot0.selectNum:read())
end

return slot2
