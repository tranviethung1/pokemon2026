slot1 = class("BlockBlastOverView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "block_blast_over.json"
slot1.RESOURCE_BINDING = {
	["rightPanel.txt"] = "txt",
	["rightPanel.imgNewRecord"] = "imgNewRecord",
	img3 = "img3",
	imgOver = "imgOver",
	["rightPanel.txtCutDown"] = "txtCutDown",
	rightPanel = "rightPanel",
	["rightPanel.awardPanel"] = {
		varname = "awardPanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAwardClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "BLOCKBLAST",
		title = gLanguageCsv.mitu
	})

	slot0.activityId = slot1
	slot0.score = slot2
	slot0.cb = slot4
	slot0.isTimeOut = slot6

	slot0:enableSchedule()

	slot0.award = slot5.view
	slot0.isOpen = false

	slot0.txt:hide()
	rich.createWithWidth(string.format(gLanguageCsv.mituScoreTip, slot2), 60, nil, 2000):anchorPoint(0, 0.5):setLocalZOrder(4):addTo(slot0.rightPanel):xy(slot0.txt:x(), slot0.txt:y())
	slot0.imgNewRecord:visible(slot3 < slot2)
	slot0.imgOver:scale(1.8)

	slot9 = time.getTime() + 5

	slot0:schedule(function ()
		uv1 = "math"
		slot1 = slot1 - time.getTime()
		slot0 = math.max(slot1, 0)
		uv1 = "max"

		slot1.txtCutDown:text(string.format(gLanguageCsv.spriteJumpCutDownTips, slot0))

		if slot0 <= 0 then
			uv1 = "max"

			slot1:onAwardClick()

			return false
		end
	end, 1, 0, "MituAwardCutDown")
end

function slot1.onAwardClick(slot0)
	if not slot0.isOpen then
		slot0.awardPanel:get("bg"):texture("activity/block_blast/award_box_opened.png")

		slot0.isOpen = true

		gGameUI:showGainDisplay(slot0.award, {
			cb = function ()
				uv0 = "onClose"

				slot0:onClose()
			end
		})
	else
		gGameUI:showTip(gLanguageCsv.mituAwardYet)
	end
end

function slot1.onClose(slot0)
	if not slot0.isOpen then
		gGameUI:showTip(gLanguageCsv.mituBoxNotGetTips)

		return
	end

	slot1 = slot0.addCallbackOnExit

	slot1(slot0, functools.partial(slot0.cb, slot0.isTimeOut))

	uv1 = "isOpen"

	slot1.onClose(slot0)
end

return slot1
