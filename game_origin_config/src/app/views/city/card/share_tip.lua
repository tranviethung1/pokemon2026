slot0 = {
	world = "world",
	union = "union"
}
slot1 = class("CardShareTipView", Dialog)
slot1.RESOURCE_FILENAME = "card_share_tip.json"
slot1.RESOURCE_BINDING = {
	content = "content",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnCancel = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnSure = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShare")
			}
		}
	},
	textLeftNum = {
		binds = {
			event = "text",
			idler = bindHelper.self("shareTimes"),
			method = function (slot0)
				return string.format("%s/%s", gCommonConfigCsv.shareTimesLimit - slot0, gCommonConfigCsv.shareTimesLimit)
			end
		}
	},
	checkBox1 = {
		varname = "checkBox1",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					uv3 = "onSelTargetPos"

					slot0:onSelTargetPos(slot3.world)
				end)
			}
		}
	},
	checkBox2 = {
		varname = "checkBox2",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					uv3 = "onSelTargetPos"

					slot0:onSelTargetPos(slot3.union)
				end)
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot3 = slot0

	slot0.initModel(slot3)

	slot0.dbId = slot1
	uv3 = "initModel"
	slot0.from = idler.new(slot3.world)

	idlereasy.when(slot0.from, function (slot0, slot1)
		uv2 = "checkBox1"
		slot4 = "checkBox"
		slot2 = slot2.checkBox1:get(slot4)
		slot2 = slot2.setSelectedState
		uv4 = "get"

		slot2(slot2, slot1 == slot4.world)

		uv2 = "checkBox1"
		slot4 = "checkBox"
		uv4 = "get"

		slot2.checkBox2:get(slot4):setSelectedState(slot1 == slot4.union)
	end)

	slot2 = gGameModel.cards:find(slot1)
	slot6, slot7 = dataEasy.getQuality(slot2:read("advance"))
	slot10 = slot0.content:size()
	slot11 = rich.createWithWidth("#C0x5B545B#" .. string.format(gLanguageCsv.shareCardTo, ui.QUALITY_OUTLINE_COLOR[slot6] .. csv.cards[slot2:read("card_id")].name .. slot7 .. "#C0x5B545B#"), 50, nil, slot10.width)

	slot11:alignCenter(slot10)
	slot11:addTo(slot0.content, 2)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.shareTimes = gGameModel.daily_record:getIdler("card_share_times")
	slot0.unionId = gGameModel.role:getIdler("union_db_id")
end

function slot1.onSelTargetPos(slot0, slot1, slot2, slot3)
	slot0.from:set(slot1)
end

function slot1.onShare(slot0)
	if gCommonConfigCsv.shareTimesLimit <= gGameModel.daily_record:read("card_share_times") then
		gGameUI:showTip(gLanguageCsv.shareTimesNotEnough)

		return
	end

	slot2 = slot0.from
	slot3 = slot2
	uv3 = "gGameModel"

	if slot2.read(slot3) == slot3.union and not slot0.unionId:read() then
		gGameUI:showTip(gLanguageCsv.notUnionCantShare)

		return
	end

	gGameApp:requestServer("/game/card/share", function ()
		slot0 = gGameUI
		slot0 = slot0.showTip

		slot0(slot0, gLanguageCsv.recordShareSuccess)

		uv0 = "gGameUI"

		slot0:onClose()
	end, slot0.dbId, slot0.from)
end

return slot1
