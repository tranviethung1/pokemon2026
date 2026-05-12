slot1 = class("AutoChessEndDetailView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.adventure.auto_chess.tools")
slot3 = 15

function slot4(slot0, slot1, slot2)
	slot4 = cc.size(0, 0)

	if slot1 == "line" then
		slot5 = ccui.Scale9Sprite:create()

		slot5:initWithFile(cc.rect(3, 25, 1, 1), "city/adventure/auto_chess/box_zzq_js5.png")
		slot5:setScale9Enabled(true):size(cc.size(50, 50)):addTo(ccui.Layout:create():anchorPoint(0.5, 0.5))
	else
		slot5 = nil
		slot6 = false

		if slot1 == "mid" then
			slot5 = slot0 == 3 and "box_zzq_js3" or "box_zzq_js2"
		elseif slot1 == "head" then
			slot5 = slot0 == 3 and "box_zzq_js4" or "box_zzq_js1"
			slot6 = slot0 == 3
		elseif slot1 == "tail" then
			slot5 = slot0 == 3 and "box_zzq_js4" or "box_zzq_js1"
			slot6 = slot0 ~= 3
		end

		if slot5 then
			slot4 = ccui.ImageView:create("city/adventure/auto_chess/" .. slot5 .. ".png"):setFlippedX(slot6):addTo(slot3, 0):size()
		end

		if not slot2 then
			label.create("?", {
				fontPath = "font/youmi1.ttf",
				color = cc.c4b(204, 203, 197, 255),
				fontSize = slot0 == 3 and 100 or 70
			}):addTo(slot3, 2)
		else
			slot7 = nil

			if slot0 == 1 then
				slot7 = slot2 == "win" and "icon_zzq_zd4" or "icon_zzq_zd3"
			elseif slot0 == 2 then
				slot7 = slot2 == "win" and "icon_zzq_zd2" or "icon_zzq_zd1"
			elseif slot0 == 3 then
				slot7 = slot2 == "win" and "icon_zzq_boss2" or "icon_zzq_boss1"
			end

			if slot7 then
				ccui.ImageView:create("city/adventure/auto_chess/" .. slot7 .. ".png"):addTo(slot3, 1)
			end
		end
	end

	setContentSizeOfAnchor(slot3, slot4)

	return slot3
end

function slot5(slot0, slot1)
	slot2 = ccui.Layout:create():anchorPoint(0.5, 0.5)
	slot3 = slot1 == "win" and #slot0 or math.max(#slot0, 15)
	slot4 = 0

	for slot8 = 1, slot3 do
		if slot8 ~= 1 then
			uv10 = "ccui"
			slot10 = slot10(nil, "line", (slot0[slot8] or {}).result):addTo(slot2)

			slot10:x(slot4 + slot10:width() / 2)

			slot4 = slot4 + slot10:width()
		end

		slot11 = "mid"

		if slot8 == 1 then
			slot11 = "head"
			slot10 = slot9.id and csv.auto_chess.encounter[slot9.id].battleType or nil or 3
		end

		if slot8 == slot3 then
			slot11 = "tail"
			slot10 = slot10 or 3
		end

		uv12 = "ccui"
		slot12 = slot12(slot10, slot11, slot9.result):name("item" .. slot8):addTo(slot2)

		slot12:x(slot4 + slot12:width() / 2)

		slot4 = slot4 + slot12:width()
	end

	slot2:size(slot4, 0)

	return slot2
end

slot1.RESOURCE_FILENAME = "auto_chess_end_detail.json"
slot1.RESOURCE_BINDING = {
	aniNode = "aniNode",
	["progressPanel.trainerPanel"] = "trainerPanel",
	boxPanel = "boxPanel",
	progressPanel = "progressPanel",
	["progressPanel.trainerPanel.txtProgress"] = {
		varname = "txtProgress",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(90, 94, 89, 255)
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.data = slot1
	slot2 = {}

	for slot6, slot7 in ipairs(slot1.monsters) do
		if csv.auto_chess.encounter[slot7.id] and slot8.isEndShow then
			table.insert(slot2, {
				id = slot7.id,
				result = slot7.result
			})
		end
	end

	slot0.monsters = slot2
	uv3 = "data"
	slot0.result = slot3.getBattleResult(slot1)
	slot0.nodeCount = slot0.result == "win" and #slot0.monsters or math.max(#slot0.monsters, 15)
	slot3 = slot0.progressPanel
	slot3 = slot3.setTouchEnabled

	slot3(slot3, false)

	uv3 = "ipairs"

	slot3(slot0.monsters, slot0.result):xy(slot0.progressPanel:width() / 2, 80):addTo(slot0.progressPanel, 1, "panel")

	if (gGameModel.battle and gGameModel.battle:getData()).typ ~= 2 then
		slot0.boxPanel:hide()
	end

	slot0:initProgress()
end

function slot1.initProgress(slot0)
	slot0.trainerPanel:get("role"):texture(gRoleFigureCsv[csv.auto_chess.trainer[slot0.data.trainer].figureID].logo)

	slot1 = math.max(#slot0.monsters, 1)

	slot0.txtProgress:text(string.format("%d/%d", #slot0.monsters, slot0.nodeCount))

	if slot0.progressPanel:get("panel.item1") then
		slot2 = slot0.trainerPanel:y()

		slot0.trainerPanel:xy(gGameUI:getConvertPos(slot0.progressPanel:get("panel.item1"), slot0.progressPanel).x, slot2)
		transition.executeSequence(slot0.trainerPanel):easeBegin("EaseOut"):moveTo(0.1 * slot1, gGameUI:getConvertPos(slot0.progressPanel:get("panel.item" .. slot1), slot0.progressPanel).x, slot2):easeEnd():done()
	end
end

function slot1.onClose(slot0)
	slot1 = slot0.data
	slot2 = gGameModel.battle and gGameModel.battle:getData()
	slot3 = slot0.addCallbackOnExit

	slot3(slot0, function ()
		uv0 = "typ"

		if slot0.typ == 2 then
			uv5 = "gGameUI"

			gGameUI:stackUI("city.adventure.auto_chess.end_accounts", nil, {
				clickClose = true,
				blackLayer = true
			}, slot5)
		else
			gGameUI:switchUI("city.view")
		end
	end)

	uv3 = "data"

	slot3.onClose(slot0)
end

return slot1
