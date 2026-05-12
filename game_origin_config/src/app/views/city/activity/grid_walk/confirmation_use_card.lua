slot0 = require("app.views.city.activity.grid_walk.tools")
slot2 = class("ConfirmationUseCard", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "grid_walk_use_card.json"
slot2.RESOURCE_BINDING = {
	cardPos = "cardPos",
	btnYes = {
		varname = "btnYes",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onYesClick")
			}
		}
	},
	btnNo = {
		varname = "btnNo",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	txt = {
		varname = "txt",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 6,
					color = cc.c3b(209, 52, 55)
				}
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0.callBack = slot1.callBack
	slot2 = slot1.card
	slot3 = slot1.itemID
	slot5 = csv.items[slot3].desc
	uv6 = "callBack"

	if slot3 == slot6.ITEMS.steeringCard then
		slot5 = string.format(gLanguageCsv.gridWalkSteerTips, slot1.steps)
	end

	slot0.txt:text(slot5)
	slot2:clone():anchorPoint(0.5, 0.5):xy(0, 0):scale(1.5):addTo(slot0.cardPos):get("txt"):hide()
	adapt.setTextScaleWithWidth(slot0.txt, nil, slot0.btnYes:x() - (slot0.btnNo:x() + slot0.btnNo:width()))
end

function slot2.onYesClick(slot0)
	slot0:addCallbackOnExit(slot0.callBack)
	slot0:onClose()
end

return slot2
