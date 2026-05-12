slot0 = class("TimeSpeederView", Dialog)
slot0.RESOURCE_FILENAME = "common_time_speeder.json"
slot0.RESOURCE_BINDING = {
	["barPanel.bar"] = "slider",
	barPanel = "barPanel",
	combTipPos = "combTipPos",
	note = "needNumNote",
	textTip = "textTip",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnRule = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRule")
			}
		}
	},
	["barPanel.current"] = {
		varname = "currentText",
		binds = {
			event = "text",
			idler = bindHelper.self("current"),
			method = function (slot0)
				return "x" .. slot0
			end
		}
	},
	["barPanel.subBtn"] = {
		varname = "subBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -1)
			end)
		}
	},
	["barPanel.addBtn"] = {
		varname = "addBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 1)
			end)
		}
	},
	sureBtn = {
		varname = "sureBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onEnbaleClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0:enableSchedule()

	slot0.max = slot0:getMaxSpeed()
	slot0.current = idler.new(cc.clampf(userDefault.getForeverLocalKey("timeSpeederViewSpeeed", 1), 1, slot0.max))
	slot0.enabled = idler.new(gGameUI.timeSpeederManager.getTimeSpeedEnabled())

	slot0.textTip:text(string.format(gLanguageCsv.speedText, slot0.max))
	idlereasy.when(slot0.current, function (slot0, slot1)
		slot3 = slot1
		uv5 = "cc"
		uv3 = "cc"
		slot3 = slot3.subBtn
		slot5 = cc.clampf(slot3, 1, slot5.max) > 1 and "normal" or "hsl_gray"

		cache.setShader(slot3, false, slot5)

		uv3 = "cc"
		uv5 = "cc"

		cache.setShader(slot3.addBtn, false, slot1 < slot5.max and "normal" or "hsl_gray")
		gGameUI.timeSpeederManager.setTimeSpeed(slot1)
	end)
	idlereasy.when(slot0.enabled, function (slot0, slot1)
		userDefault.setForeverLocalKey("timeSpeederViewEnabled", slot1)
		gGameUI.timeSpeederManager.setTimeSpeedEnabled(slot1)

		if slot1 then
			uv2 = "userDefault"

			slot2.sureBtn:loadTextureNormal("city/setting/btn_bf.png")
		else
			uv2 = "userDefault"

			slot2.sureBtn:loadTextureNormal("city/setting/btn_zt.png")
		end
	end)
	Dialog.onCreate(slot0)
end

function slot0.getMaxSpeed(slot0)
	slot1 = gGameModel.role:read("vip_level")
	slot4 = 0

	for slot8, slot9 in orderCsvPairs(csv.time_speeder) do
		if slot9.type == 1 and slot9.arg <= gGameModel.role:read("level") then
			slot3 = math.max(0, slot9.speedAdd)
		end

		if slot9.type == 2 and slot9.arg <= slot1 then
			slot4 = math.max(slot4, slot9.speedAdd)
		end
	end

	return slot3 + slot4 + 1
end

function slot0.onEnbaleClick(slot0)
	slot0.enabled:set(not slot0.enabled:read())
end

function slot0.onChangeNum(slot0, slot1, slot2, slot3)
	if slot2.name == "click" then
		slot0:unscheduleUpdate()
		slot0:onIncreaseNum(slot3)
	else
		if slot2.name == "began" then
			slot4 = socket.gettime()

			slot0:onIncreaseNum(slot3)
			slot0:scheduleUpdate(function ()
				uv1 = "socket"

				if socket.gettime() - slot1 > 0.1 then
					uv0 = "gettime"
					uv2 = "onIncreaseNum"

					slot0:onIncreaseNum(slot2)

					slot0 = socket.gettime()
					uv0 = 0.1
				end
			end)

			return
		end

		if slot2.name == "ended" or slot2.name == "cancelled" then
			slot0:unscheduleUpdate()
		end
	end
end

function slot0.onIncreaseNum(slot0, slot1)
	slot0.current:modify(function (slot0)
		uv3 = "cc"
		uv5 = "clampf"

		return true, cc.clampf(slot0 + slot3, 1, slot5.max)
	end)
end

function slot0.onClose(slot0, slot1)
	userDefault.setForeverLocalKey("timeSpeederViewSpeeed", slot0.current:read())
	Dialog.onClose(slot0)
end

function slot0.onRule(slot0)
	gGameUI:createView("common.rule", gGameUI.timeSpeederLayer):init(slot0:createHandler("getRuleContext"))
end

function slot0.getRuleContext(slot0, slot1)
	slot2 = adaptContext
	slot3 = {
		slot2.noteText(166),
		slot2.noteText(135401, 135450)
	}

	for slot7, slot8 in orderCsvPairs(csv.time_speeder) do
		table.insert(slot3, string.format(gLanguageCsv["speederRule" .. slot8.type], slot8.arg, slot8.speedAdd))
	end

	return slot3
end

return slot0
