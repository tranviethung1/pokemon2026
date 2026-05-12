function slot0(slot0, slot1, slot2, slot3)
	bind.extend(slot0, slot1, {
		class = "icon_key",
		props = {
			data = {
				key = slot2,
				num = slot3
			}
		}
	})
end

slot1 = {
	{
		txt = gLanguageCsv.change,
		spaceTxt = gLanguageCsv.spaceChange,
		success = gLanguageCsv.advanceSuccess
	},
	{
		txt = gLanguageCsv.comb,
		spaceTxt = gLanguageCsv.spaceComb,
		success = gLanguageCsv.combSuccess
	}
}
slot2 = cc.load("mvc").ViewBase
slot3 = class("fragmentComposeView", Dialog)
slot3.RESOURCE_FILENAME = "card_fragment_compose.json"
slot3.RESOURCE_BINDING = {
	combTipPos = "combTipPos",
	["barPanel.needFrags"] = "needFrags",
	["barPanel.bar"] = "slider",
	titleTxt = "title",
	["cardPanel.card1"] = "card1",
	["cardPanel.card2"] = "card2",
	["cardPanel.textName1"] = "textName1",
	cardPanel = "cardPanel",
	["cardPanel.textName2"] = "textName2",
	barPanel = "barPanel",
	["barPanel.myFrags"] = "myFrags",
	note = "needNumNote",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
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
	changeBtn = {
		varname = "changeBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeClick")
			}
		}
	},
	["changeBtn.title"] = {
		varname = "btnTxt",
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0.selectDbId = slot1

	slot0:enableSchedule()

	slot0.selectNum = idler.new(0)
	slot2 = csv.fragments[slot0.selectDbId]

	idlereasy.when(slot0.selectNum, function (slot0, slot1)
		uv2 = "selectDbId"
		slot2 = slot2.selectDbId
		uv3 = "combID"
		slot3 = slot3.combID
		uv4 = "selectDbId"
		slot4.fragsId = slot3
		slot4 = dataEasy.getCfgByKey(slot2)
		slot5 = dataEasy.getCfgByKey(slot3)
		slot7 = slot2
		uv7 = "selectDbId"
		uv9 = "combID"
		slot9 = slot1 / slot9.combCount
		slot7.targetNum = math.modf(slot9)
		uv7 = "selectDbId"
		uv9 = "combID"
		slot7.canMaxNum = math.modf(dataEasy.getNumByKey(slot7) / slot9.combCount)
		uv7 = "selectDbId"

		if not slot7.slider:isHighlighted() then
			uv8 = "selectDbId"
			slot8 = slot1 / slot8.canMaxNum * 100
			uv8 = "selectDbId"

			slot8.slider:setPercent(math.ceil(slot8))
		end

		slot7 = csv.fragments[slot3]
		uv8 = "selectDbId"
		slot8 = slot8.needFrags
		slot8 = slot8.text
		uv11 = "selectDbId"

		slot8(slot8, "/" .. slot11.canMaxNum)

		uv8 = "selectDbId"
		slot10 = slot1

		slot8.myFrags:text(slot10)

		slot8 = adapt.oneLineCenterPos
		uv10 = "selectDbId"
		slot10 = slot10.barPanel
		slot11 = slot10
		uv11 = "selectDbId"
		slot11 = slot11.myFrags
		slot11 = slot11.y
		uv11 = "selectDbId"
		slot11 = slot11.myFrags
		uv11 = "selectDbId"

		slot8(cc.p(slot10.size(slot11).width / 2, slot11(slot11)), {
			slot11,
			slot11.needFrags
		})

		uv8 = "selectDbId"
		slot8 = slot8.textName1
		slot8 = slot8.text

		slot8(slot8, slot4.name)

		uv8 = "selectDbId"
		slot8 = slot8.textName2
		slot9 = slot8

		slot8.text(slot9, slot5.name)

		uv9 = "selectDbId"
		slot9 = slot9.textName1

		text.addEffect(slot9, {
			color = ui.COLORS.QUALITY[slot4.quality]
		})

		uv9 = "selectDbId"

		text.addEffect(slot9.textName2, {
			color = ui.COLORS.QUALITY[slot5.quality]
		})

		if matchLanguage({
			"en"
		}) then
			uv8 = "selectDbId"
			slot8 = slot8.textName1
			slot8 = slot8.setTextAreaSize

			slot8(slot8, cc.size(440, 100))

			uv8 = "selectDbId"
			slot8 = slot8.textName1
			slot8 = slot8.setAnchorPoint

			slot8(slot8, 0.5, 0.9)

			uv8 = "selectDbId"
			slot8 = slot8.textName2
			slot8 = slot8.setTextAreaSize

			slot8(slot8, cc.size(440, 100))

			uv8 = "selectDbId"
			slot8 = slot8.textName2
			slot8 = slot8.setAnchorPoint

			slot8(slot8, 0.5, 0.9)

			uv8 = "selectDbId"
			slot8 = slot8.textName1
			slot8 = slot8.setTextHorizontalAlignment

			slot8(slot8, cc.TEXT_ALIGNMENT_CENTER)

			uv8 = "selectDbId"

			slot8.textName2:setTextHorizontalAlignment(cc.TEXT_ALIGNMENT_CENTER)
		end

		uv9 = "selectDbId"
		slot9 = slot9.addBtn
		uv11 = "selectDbId"

		uiEasy.setBtnShader(slot9, nil, slot1 < slot11.canMaxNum and 1 or 2)

		slot8 = uiEasy.setBtnShader
		uv9 = "selectDbId"
		slot9 = slot9.subBtn
		slot10 = nil

		slot8(slot9, slot10, slot1 > 0 and 1 or 2)

		uv8 = "fragsId"
		uv9 = "selectDbId"
		uv10 = "selectDbId"
		slot10 = slot10.card1

		slot8(slot9, slot10, slot2, slot6)

		uv8 = "fragsId"
		uv9 = "selectDbId"
		uv10 = "selectDbId"

		slot8(slot9, slot10.card2, slot3, slot1)

		slot8 = ""
		uv9 = "combID"

		if slot9.type == 4 then
			slot8 = csv.held_item.items[slot3].name
		else
			uv9 = "combID"

			if slot9.type == 3 then
				slot8 = csv.items[slot3].name
			end
		end

		uv9 = "selectDbId"

		slot9.needNumNote:removeAllChildren()

		uv13 = "combID"
		slot15 = slot4.quality
		uv15 = "combID"
		slot12 = matchLanguage({
			"kr"
		}) and 30 or 34
		uv12 = "selectDbId"

		rich.createByStr(string.format(gLanguageCsv.fragmentComposeText, slot13.combCount, ui.QUALITYCOLOR[slot15] .. slot15.name, 1, ui.QUALITYCOLOR[slot5.quality] .. slot8), slot12, nil, ):addTo(slot12.needNumNote, 10):anchorPoint(cc.p(0.5, 0.5)):xy(0, 0):formatText()
	end)
	slot0.slider:setPercent(0)
	slot0.slider:addEventListener(function (slot0, slot1)
		uv2 = "unScheduleAll"

		slot2:unScheduleAll()

		uv5 = "unScheduleAll"
		slot4 = math.ceil(slot5.canMaxNum * slot0:getPercent() * 0.01)
		uv6 = "unScheduleAll"
		uv4 = "unScheduleAll"

		slot4.selectNum:set(cc.clampf(slot4, 0, slot6.canMaxNum))
	end)
	Dialog.onCreate(slot0)
end

function slot3.onChangeClick(slot0)
	if slot0.selectNum:read() == 0 then
		gGameUI:showTip(gLanguageCsv.pleaseSelectFragmentCombText)

		return
	end

	gGameApp:requestServer("/game/role/frag/comb/item", function (slot0)
		uv1 = "onClose"
		uv2 = "gGameUI"

		slot1.onClose(slot2)
		gGameUI:showGainDisplay(slot0)
	end, slot0.selectDbId, slot0.selectNum:read())
end

function slot3.onChangeNum(slot0, slot1, slot2, slot3)
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

function slot3.onIncreaseNum(slot0, slot1)
	slot0.selectNum:modify(function (slot0)
		uv3 = "cc"
		uv5 = "clampf"

		return true, cc.clampf(slot0 + slot3, 0, slot5.canMaxNum)
	end)
end

return slot3
