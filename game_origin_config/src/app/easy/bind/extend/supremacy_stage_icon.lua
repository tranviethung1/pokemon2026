slot0 = require("easy.bind.helper")
slot1 = class("supremacyStageIcon", cc.load("mvc").ViewBase)
slot1.defaultProps = {
	showRank = false,
	showStageBg = false,
	showStage = true
}

function slot1.initExtend(slot0)
	if slot0.panel then
		slot0.panel:removeFromParent()
	end

	slot1 = cc.size(198, 198)
	slot2 = ccui.Layout:create():size(198, 198):alignCenter(slot0:size())
	slot3 = slot2
	slot0.panel = slot2.addTo(slot3, slot0, 1, "_stage_")
	uv3 = "panel"

	slot3.callOrWhen(slot0.rank, function (slot0)
		slot4 = dataEasy.getSupremacyStageByRank(slot0).icon
		uv4 = "dataEasy"
		slot4 = 2
		slot2 = ccui.ImageView:create(slot4):xy(slot4.width / 2, 118):scale(slot4)
		slot3 = slot2
		uv4 = "getSupremacyStageByRank"
		slot2 = slot2.addTo(slot3, slot4, 1, "icon")
		uv3 = "ccui"

		if slot3.showStageBg then
			slot5 = "city/pvp/cross_arena/dzqb_bg_dw.png"
			uv5 = "dataEasy"
			slot5 = slot5.width / 2
			uv5 = "getSupremacyStageByRank"

			ccui.ImageView:create(slot5):xy(slot5, 50):addTo(slot5, 5, "titleImgBg"):scale(1.3287671232876712)
		end

		uv3 = "ccui"

		if slot3.showStage then
			uv3 = "ccui"
			slot6 = {
				fontSize = 30,
				fontPath = "font/youmi1.ttf",
				color = ui.COLORS.NORMAL.WHITE
			}
			uv6 = "dataEasy"
			slot6 = slot6.width / 2
			uv6 = "ccui"
			slot6 = slot6.showStageBg == true and 50 or 19
			slot6 = cc.TEXT_ALIGNMENT_CENTER
			slot4 = label.create(slot3.showRank == false and slot1.stageName or slot1.stageName .. " " .. slot1.score, slot6):x(slot6):y(slot6):setHorizontalAlignment(slot6)
			slot5 = slot4
			uv6 = "getSupremacyStageByRank"
			uv5 = "ccui"
			slot6 = text.addEffect

			slot6(slot4.addTo(slot5, slot6, 6, "title"), {
				color = slot5.showStageBg == true and ui.COLORS.NORMAL.WHITE or ui.COLORS.NORMAL.BLACK
			})

			uv6 = "ccui"

			if slot6.showRank == true then
				text.addEffect(slot4, {
					outline = {
						size = 3,
						color = cc.c4b(216, 90, 104, 255)
					}
				})
				slot4:setBMFontSize(32)
				slot4:y(52)
			end
		end
	end)

	if slot0.onNode then
		slot0.onNode(slot2)
	end

	if slot0.onNodeClick then
		slot2:setTouchEnabled(true)
		bind.touch(slot0, slot2, {
			methods = {
				ended = function ()
					uv0 = "onNodeClick"
					uv1 = "onNodeClick"

					slot0.onNodeClick(slot1)
				end
			}
		})
	end

	return slot0
end

return slot1
