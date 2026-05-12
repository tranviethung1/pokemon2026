function slot0(slot0, slot1, slot2)
	return csv.online_gift[slot2 + 1].periods * 60 - (time.getTime() - slot1 + slot0)
end

slot1 = class("OnlineGiftView", Dialog)
slot1.RESOURCE_FILENAME = "online_gift.json"
slot1.RESOURCE_BINDING = {
	list = "list",
	labelTime = {
		varname = "labelTime",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(250, 240, 208, 255)
				}
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
	slot0.giftData = {}
	slot2 = gGameModel.daily_record:read("online_gift")

	uiEasy.createItemsToList(slot0, slot0.list, csv.online_gift[slot2.idx + 1].awardShow, {
		margin = 11,
		scale = 0.9,
		onAfterBuild = function ()
			uv0 = "list"

			slot0.list:setItemAlignCenter()
		end
	})

	slot4 = slot0.enableSchedule

	slot4(slot0)

	uv4 = "giftData"
	slot4 = slot4.setCountdown

	slot4(slot0, slot0.labelTime, {
		data = slot2
	})

	uv4 = "giftData"

	slot4.setCountdown(slot1.view, slot1.uiTime, {
		data = slot2,
		tag = slot1.tag,
		cb = slot1.cb
	})
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot1.setCountdown(slot0, slot1, slot2)
	slot3 = slot2.data
	slot8 = time.getTime()

	bind.extend(slot0, slot1, {
		class = "cutdown_label",
		props = {
			delay = 1,
			endTime = csv.online_gift[(slot3.idx or 0) + 1].periods * 60 + (slot3.starttime or 0) - (slot3.totaltime or 0) + 1,
			tag = slot2.tag or 1,
			endFunc = function ()
				uv0 = "cb"

				if slot0.cb then
					uv0 = "cb"

					slot0.cb()
				else
					uv0 = "text"

					slot0:text(time.getCutDown(0).str)
				end
			end
		}
	})
end

return slot1
