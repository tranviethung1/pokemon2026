slot0 = {
	"baoxiangzi_loop",
	"haohuabaoxiangzi_loop"
}
slot1 = {
	"baoxiang_loop",
	"haohuabaoxiang_loop"
}
slot2 = {
	"baoxiangkaixiang",
	"haohuabaoxiangkaixiang"
}
slot3 = require("app.views.city.adventure.random_tower.tools")
slot5 = class("RandomTowerOpenBoxView", cc.load("mvc").ViewBase)
slot5.RESOURCE_FILENAME = "random_tower_open_box.json"
slot5.RESOURCE_BINDING = {
	imgCost = "imgCost",
	titlePos = "titlePos",
	textOpenTimes = "textOpenTimes",
	boxPos = "boxPos",
	textNote = "textNote",
	textFree = "textFree",
	textCost = "textCost",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnNext = {
		varname = "btnNext",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnNext")
			}
		}
	},
	btnOpen = {
		varname = "btnOpen",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnOpen")
			}
		}
	}
}

function slot5.onCreate(slot0, slot1, slot2)
	slot0.boardID = slot1
	slot0.cb = slot2

	slot0:initModel()

	slot3 = csv.random_tower.board[slot1]
	slot6 = slot3.boxType
	slot0.boxLimit = gCommonConfigCsv["randomTowerBoxLimit" .. slot6] + 1
	slot4 = slot3.boxType
	slot0.boxType = slot4
	uv4 = "boardID"
	slot4 = slot4.setEffect
	uv6 = "cb"
	slot6 = slot6[slot3.boxType]

	slot4(slot0.titlePos, slot6, "random_tower/baoxiang.skel", 770)

	uv4 = "boardID"
	uv6 = "initModel"

	slot4.setEffect(slot0.boxPos, slot6[slot3.boxType], "random_tower/baoxiang.skel", 240)
	idlereasy.any({
		slot0.roomInfo,
		slot0.rmb
	}, function (slot0, slot1, slot2)
		slot3 = slot1.count or 0

		if not slot1.board_id then
			uv4 = "count"
			slot3 = slot4.boxLimit
		end

		uv6 = "count"
		slot6 = slot6.boxLimit
		slot4 = math.min(slot3 + 1, slot6)
		slot5 = "#C0xAEE97E#"
		uv6 = "count"

		if slot6.boxLimit <= slot3 then
			slot5 = "#C0xECB72A#"
		end

		slot6 = uiEasy.setBtnShader
		uv7 = "count"
		uv8 = "count"

		slot6(slot7.btnNext, slot8.btnNext:get("textNote"), slot3 ~= 0 and 1 or 2)

		uv6 = "count"
		slot6 = slot6.textOpenTimes:text("")
		slot6 = slot6.removeAllChildren

		slot6(slot6)

		uv6 = "count"
		slot11 = slot6.boxLimit - slot3
		uv11 = "count"
		slot9 = 0.5
		uv9 = "count"
		slot9 = slot9.textOpenTimes

		rich.createByStr(string.format(gLanguageCsv.canOpenTimes, slot5 .. slot11 .. "#C0xFFFCED#", slot11.boxLimit), 36):anchorPoint(slot9, 0.5):addTo(slot9, 6)

		uv9 = "board_id"
		slot8 = "random_tower_box_cost" .. slot9.boxType
		slot7 = gCostCsv[slot8]
		uv8 = "count"
		slot10 = slot4
		slot8.rmbCost = slot7[math.min(slot10, table.length(slot7))]
		uv8 = "count"
		slot8 = slot8.textCost
		slot9 = slot8
		uv10 = "count"

		slot8.text(slot9, slot10.rmbCost)

		slot8 = ui.COLORS.NORMAL.ALERT_YELLOW
		uv9 = "count"

		if slot9.rmbCost <= slot2 then
			slot8 = ui.COLORS.NORMAL.WHITE
		end

		uv9 = "count"
		slot9 = slot9.textFree
		slot10 = slot9
		slot9 = slot9.visible

		if slot4 == 1 then
			uv11 = "board_id"

			if slot11.boxType ~= 2 then
				slot11 = false
			else
				slot11 = true
			end
		end

		slot9(slot10, slot11)

		slot9 = itertools.invoke
		slot10 = {
			slot11,
			slot11,
			slot11.imgCost
		}
		uv11 = "count"
		uv11 = "count"
		slot11 = slot11.textNote.textCost
		uv11 = "count"

		if slot4 ~= 1 then
			uv11 = "count"

			if slot3 == slot11.boxLimit then
				slot11 = "hide"
			else
				slot11 = "show"
			end
		end

		slot9(slot10, slot11)

		uv10 = "count"
		slot11 = {
			color = slot8
		}

		text.addEffect(slot10.textCost, slot11)

		uv11 = "count"
		slot11 = slot11.btnOpen
		slot12 = slot11
		uv12 = "count"
		slot12 = slot12.textCost
		slot12 = slot12.y
		uv12 = "count"
		slot12 = slot12.textNote
		uv12 = "count"
		slot12 = slot12.textCost
		uv12 = "count"

		adapt.oneLineCenterPos(cc.p(slot11.x(slot12), slot12(slot12)), {
			slot12,
			slot12,
			slot12.imgCost
		}, cc.p(15, 0))
	end)
end

function slot5.initModel(slot0)
	slot0.roomInfo = gGameModel.random_tower:getIdler("room_info")
	slot0.rmb = gGameModel.role:getIdler("rmb")
end

function slot5.onBtnOpen(slot0)
	if slot0.notClick == true then
		return
	end

	slot1 = slot0.roomInfo:read().count

	if slot0.rmb:read() < slot0.rmbCost and slot1 and slot1 > 0 then
		uiEasy.showDialog("rmb")

		return
	end

	if slot1 and slot1 > 0 then
		sdk.trackEvent("aether_chest")
		dataEasy.sureUsingDiamonds(function ()
			uv0 = "notClick"
			slot0.notClick = true

			gGameApp:requestServer("/game/random_tower/box/open", function (slot0)
				uv1 = "setEffect"
				uv2 = "boxPos"
				slot2 = slot2.boxPos
				uv3 = "boxType"
				uv4 = "boxPos"

				slot1.setEffect(slot2, slot3[slot4.boxType], "random_tower/baoxiang.skel", 240)

				uv2 = "boxPos"

				performWithDelay(slot2.boxPos, function ()
					uv2 = "gGameUI"

					gGameUI:showGainDisplay(slot2, {
						onlyGoldDouble = dataEasy.isDoubleHuodong("randomGold"),
						cb = function ()
							uv0 = "notClick"
							slot0.notClick = false
							uv0 = "boxLimit"

							if slot0 then
								uv0 = "boxLimit"
								uv1 = "notClick"

								if slot0 < slot1.boxLimit - 1 then
									uv0 = "notClick"

									if not slot0.roomInfo:read().board_id then
										uv0 = "notClick"
										slot1 = slot0
										slot0 = slot0.addCallbackOnExit
										uv2 = "notClick"

										slot0(slot1, slot2.cb)

										uv0 = "roomInfo"
										uv1 = "notClick"

										slot0.onClose(slot1)

										return
									end
								end
							end

							uv0 = "read"
							uv1 = "notClick"
							uv2 = "board_id"
							uv3 = "notClick"

							slot0.setEffect(slot1.boxPos, slot2[slot3.boxType], "random_tower/baoxiang.skel", 240)
						end
					})
				end, 1)
			end)
		end, slot0.rmbCost)
	else
		slot2()
	end
end

function slot5.onClose(slot0)
	if slot0.notClick == true then
		return
	end

	uv1 = "notClick"

	slot1.onClose(slot0)
end

function slot5.onBtnNext(slot0)
	if slot0.notClick == true then
		return
	end

	gGameApp:requestServer("/game/random_tower/next", function (slot0)
		uv1 = "addCallbackOnExit"
		slot2 = slot1
		slot1 = slot1.addCallbackOnExit
		uv3 = "addCallbackOnExit"

		slot1(slot2, slot3.cb)

		uv1 = "cb"
		uv2 = "addCallbackOnExit"

		slot1.onClose(slot2)
	end)
end

return slot5
