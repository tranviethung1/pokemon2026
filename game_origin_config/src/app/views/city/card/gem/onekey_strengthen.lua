slot0 = cc.load("mvc").ViewBase
slot1 = class("GemOneKeyStrengthenView", Dialog)
slot2 = table.insert
slot1.RESOURCE_FILENAME = "gem_onekey_strengthen.json"
slot1.RESOURCE_BINDING = {
	txtCost = "txtCost",
	["sliderPanel.slider"] = "slider",
	level = "txtLevel",
	["sliderPanel.subBtn"] = {
		varname = "sliderSubBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -1)
			end)
		}
	},
	["sliderPanel.addBtn"] = {
		varname = "sliderAddBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 1)
			end)
		}
	},
	btnSure = {
		varname = "btnSure",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickBtnSure")
			}
		}
	},
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0:enableSchedule()
	slot0:initModel()

	slot0.gemdbid = slot1

	slot0.slider:setPercent(50)

	slot0.curLv = gGameModel.gems:find(slot1):read("level")
	slot0.levelMax = dataEasy.getCfgByKey(gGameModel.gems:find(slot1):read("gem_id")).strengthMax
	slot0.costNodes = {}
	slot0.levelCosts = {}
	slot3 = {}

	for slot7 = slot0.curLv, slot0.levelMax do
		for slot12, slot13 in csvMapPairs(csv.gem.cost[slot7]["costItemMap" .. slot2.strengthCostSeq]) do
			slot3[slot12] = (slot3[slot12] or 0) + slot13
		end

		slot0.levelCosts[slot7] = {}

		for slot12, slot13 in pairs(slot3) do
			slot0.levelCosts[slot7][slot12] = slot13
		end
	end

	slot0:calculateLvUpMax()

	slot0.level = idler.new(slot0.curLv + 1)

	idlereasy.when(slot0.level, function (slot0, slot1)
		uv2 = "setDetail"

		slot2:setDetail()
	end)
	idlereasy.when(slot0.gold, function ()
		uv0 = "calculateLvUpMax"
		slot0 = slot0.calculateLvUpMax

		slot0(slot0)

		uv0 = "calculateLvUpMax"

		slot0:setDetail()
	end)
	slot0.slider:addEventListener(function (slot0, slot1)
		uv2 = "unScheduleAll"

		slot2:unScheduleAll()

		uv4 = "unScheduleAll"
		uv6 = "unScheduleAll"
		uv7 = "unScheduleAll"
		slot6 = (slot6.levelMax - slot7.curLv) * slot0:getPercent() * 0.01
		slot5 = math.ceil(slot6)
		slot4 = slot4.curLv + slot5
		uv5 = "unScheduleAll"
		uv6 = "unScheduleAll"
		slot3 = cc.clampf(slot4, slot5.curLv + 1, slot6.canLvUpMax)
		uv4 = "unScheduleAll"
		slot4 = slot4.level
		slot4 = slot4.set

		slot4(slot4, slot3)

		uv4 = "unScheduleAll"

		if slot4.canLvUpMax <= slot3 then
			uv5 = "unScheduleAll"
			uv6 = "unScheduleAll"
			uv7 = "unScheduleAll"
			slot5 = (slot3 - slot5.curLv) / (slot6.levelMax - slot7.curLv) * 100
			uv5 = "unScheduleAll"

			slot5.slider:setPercent(math.ceil(slot5))
		end
	end)
	Dialog.onCreate(slot0)
end

function slot1.calculateLvUpMax(slot0)
	slot0.canLvUpMax = slot0.levelMax

	for slot4 = slot0.curLv, slot0.levelMax do
		for slot9, slot10 in pairs(slot0.levelCosts[slot4]) do
			if dataEasy.getNumByKey(slot9) < slot10 and slot4 >= slot0.curLv + 1 then
				slot0.canLvUpMax = slot4

				return
			end
		end
	end
end

function slot1.setDetail(slot0)
	slot0.txtLevel:setString(slot0.level:read() .. "/" .. slot0.levelMax)

	if not slot0.slider:isHighlighted() then
		slot0.slider:setPercent(math.ceil((slot1 - slot0.curLv) / (slot0.levelMax - slot0.curLv) * 100))
	end

	slot2 = slot0.levelCosts[slot1 - 1]

	for slot6, slot7 in pairs(slot0.costNodes) do
		slot7:removeSelf()
	end

	slot3 = {
		slot0.txtCost
	}
	slot0.costNodes = {}
	slot0.costNeed = nil

	for slot7, slot8 in pairs(slot2) do
		slot9 = cc.Label:createWithTTF(slot8, ui.FONT_PATH, 40):addTo(slot0:getResourceNode(), 100):setTextColor(ui.COLORS.NORMAL.BLACK)
		slot10 = ccui.ImageView:create(dataEasy.getIconResByKey(slot7)):addTo(slot0:getResourceNode(), 100)
		slot11 = slot10
		slot10 = slot10.scale(slot11, 0.8)
		uv11 = "level"

		slot11(slot0.costNodes, slot9)

		uv11 = "level"

		slot11(slot0.costNodes, slot10)

		uv11 = "level"

		slot11(slot3, slot9)

		uv11 = "level"

		slot11(slot3, slot10)

		if dataEasy.getNumByKey(slot7) < slot8 then
			text.addEffect(slot9, {
				color = ui.COLORS.NORMAL.RED
			})

			slot0.costNeed = slot7
		end
	end

	slot4 = {}
	slot5 = true

	for slot9 = 1, #slot3 do
		uv10 = "level"

		slot10(slot4, slot5 and cc.p(15, 0) or cc.p(0, 0))

		slot5 = not slot5
	end

	adapt.oneLineCenterPos(cc.p(slot0.btnSure:x(), slot0.txtCost:y()), slot3, slot4)
	cache.setShader(slot0.sliderAddBtn, false, slot0.canLvUpMax <= slot1 and "hsl_gray" or "normal")
	cache.setShader(slot0.sliderSubBtn, false, slot1 <= slot0.curLv + 1 and "hsl_gray" or "normal")
end

function slot1.onIncreaseNum(slot0, slot1)
	slot0.level:modify(function (slot0)
		uv3 = "cc"
		uv4 = "clampf"
		uv5 = "clampf"

		return true, cc.clampf(slot0 + slot3, slot4.curLv + 1, slot5.canLvUpMax)
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
		end, 0.05, 0, 100)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot0:unScheduleAll()
	end
end

function slot1.onClickBtnSure(slot0)
	if slot0.costNeed then
		if slot0.costNeed == "gold" then
			uiEasy.showDialog("gold")
		else
			gGameUI:showTip(gLanguageCsv.materialsNotEnough)
		end

		return
	end

	slot2 = slot0.level
	slot3 = slot2
	uv3 = "costNeed"

	slot3.onClose(slot0)
	gGameApp:requestServer("/game/gem/strength", nil, slot0.gemdbid, slot2.read(slot3))
end

function slot1.initModel(slot0)
	slot0.gold = gGameModel.role:getIdler("gold")
end

return slot1
