slot1 = class("ChipItemDetailsView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "chip_item_details.json"
slot1.RESOURCE_BINDING = {
	["panel.sliderPanel.slider"] = "slider",
	["panel.sliderPanel"] = "sliderPanel",
	panel = "panel",
	["panel.btnReset"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onResetClick")
			}
		}
	},
	["panel.btnOK"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOKClick")
			}
		}
	},
	["panel.btnOK.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["panel.sliderPanel.subBtn"] = {
		varname = "sliderSubBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -1)
			end)
		}
	},
	["panel.sliderPanel.addBtn"] = {
		varname = "sliderAddBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 1)
			end)
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.params = slot1
	slot0.cb = slot1.cb
	slot0.changeCb = slot1.changeCb
	slot0.originNum = slot1.num
	slot0.maxNum = slot1.maxNum
	slot0.ownNum = dataEasy.getNumByKey(slot1.id)

	slot0:enableSchedule()
	slot0:initData()
	bind.extend(slot0, slot0.panel:get("icon"), {
		class = "icon_key",
		props = {
			noListener = true,
			data = {
				key = slot1.id
			}
		}
	})
	uiEasy.setIconName(slot1.id, nil, {
		node = slot0.panel:get("name")
	})
	adapt.oneLinePos(slot0.panel:get("gainExpText"), slot0.panel:get("gainExp"))

	slot0.num = idler.new(slot0.originNum)

	idlereasy.when(slot0.num, function (slot0, slot1)
		uv2 = "changeCb"
		slot2 = slot2.changeCb

		slot2(slot1)

		uv2 = "changeCb"
		slot2 = slot2.panel:get("gainExp")
		slot3 = slot2
		slot5 = slot1
		uv5 = "changeCb"

		slot2.text(slot3, math.max(slot5, 1) * slot5.singleItemExp)

		slot2 = text.addEffect
		uv3 = "changeCb"

		slot2(slot3.panel:get("gainExp"), {
			color = slot1 > 0 and cc.c4b(96, 196, 86, 255) or cc.c4b(183, 176, 158, 255)
		})

		uv2 = "changeCb"
		slot2 = slot2.panel:get("cost")
		slot3 = slot2
		uv8 = "changeCb"

		slot2.text(slot3, string.format("%s: %d/%d", gLanguageCsv.cost, slot1, slot8.ownNum))

		uv3 = "changeCb"
		slot3 = slot3.sliderSubBtn
		slot5 = slot1 > 0 and "normal" or "hsl_gray"

		cache.setShader(slot3, false, slot5)

		uv3 = "changeCb"
		slot3 = slot3.sliderAddBtn
		uv5 = "changeCb"

		cache.setShader(slot3, false, slot1 < slot5.maxNum and "normal" or "hsl_gray")

		uv3 = "changeCb"
		slot3 = slot1 / slot3.maxNum * 100
		uv3 = "changeCb"

		slot3.slider:setPercent(math.floor(slot3))
	end)

	slot0.showedTip = false

	slot0.slider:addEventListener(function (slot0, slot1)
		if slot1 == ccui.SliderEventType.percentChanged then
			uv2 = "ccui"

			slot2:unScheduleAll()

			uv4 = "ccui"
			slot4 = slot4.maxNum * slot0:getPercent() * 0.01
			slot3 = math.ceil(slot4)
			uv4 = "ccui"

			if not slot4.showedTip then
				uv4 = "ccui"

				if slot4.maxNum < slot3 then
					uv4 = "ccui"
					slot4.showedTip = true

					gGameUI:showTip(gLanguageCsv.chipExpMax)
				end
			end

			uv8 = "ccui"
			slot4 = cc.clampf(slot3, 0, math.max(slot8.maxNum, 0))
			uv4 = "ccui"

			slot4.num:set(slot4, true)
		end
	end)
end

function slot1.initData(slot0)
	slot1 = slot0.params
	slot0.baseCfg = csv.chip.chips[slot1.chipId]
	slot0.clientLevel = slot1.clientChipLevel
	slot0.clientLevelExp = slot1.clientChipLevelExp
	slot0.singleItemExp = csv.items[slot1.id].specialArgsMap.chipExp
end

function slot1.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

function slot1.onIncreaseNum(slot0, slot1)
	slot0.num:modify(function (slot0)
		uv3 = "cc"
		uv6 = "clampf"

		return true, cc.clampf(slot0 + slot3, 0, math.max(slot6.maxNum, 0))
	end)
end

function slot1.onChangeNum(slot0, slot1, slot2, slot3)
	if slot2.name == "click" then
		slot0:unScheduleAll()
		slot0:onIncreaseNum(slot3)
	elseif slot2.name == "began" then
		slot0:schedule(function ()
			uv0 = "onIncreaseNum"
			uv2 = "onIncreaseNum"

			slot0:onIncreaseNum(slot2)
		end, 0.05, 0, 1)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot0:unScheduleAll()
	end
end

function slot1.onResetClick(slot0)
	slot0.num:set(0)
end

function slot1.onOKClick(slot0)
	if slot0.baseCfg.maxLevel <= slot0.clientLevel:read() then
		gGameUI:showTip(gLanguageCsv.chipExpMax)

		return
	end

	if slot0.maxNum <= slot0.num:read() then
		gGameUI:showTip(gLanguageCsv.inadequateProps)

		return
	end

	slot0.num:set(math.min(slot0.num:read() + math.ceil((csv.chip.strength_cost[slot0.clientLevel:read()]["levelExp" .. slot0.baseCfg.strengthSeq] - slot0.clientLevelExp:read()) / slot0.singleItemExp), slot0.maxNum))
end

return slot1
