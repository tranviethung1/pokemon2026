slot0 = class("AchievementTipView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "common_achievement_tip.json"
slot0.RESOURCE_BINDING = {
	["panel.bg"] = "bg",
	["panel.icon"] = "icon",
	panel = "panel",
	["panel.text1"] = {
		varname = "text1",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(224, 106, 85, 255)
				}
			}
		}
	},
	["panel.text2"] = {
		varname = "text2",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(224, 106, 85, 255)
				}
			}
		}
	},
	["panel.text3"] = {
		varname = "text3",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(201, 140, 60, 255)
				}
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.csvId = slot1
	slot3 = csv.achievement.achievement[slot2.type].icon

	slot0.icon:texture(icon)
	slot0.text2:text(slot2.title)
	slot0.text3:text(slot2.point)

	slot4 = 3
	slot5 = 2
	slot6, slot7 = slot0:xy()

	slot0.panel:hide()
	transition.executeSequence(slot0.panel):delay(0.3):func(function ()
		uv0 = "panel"

		slot0.panel:show()
	end):delay(slot4):moveBy(slot5, 0, 100):func(functools.partial(slot0.onClose, slot0)):done()
	transition.executeSequence(slot0.icon):delay(slot4):fadeOut(slot5):done()
	transition.executeSequence(slot0.bg):delay(slot4):fadeOut(slot5):done()
	transition.executeSequence(slot0.text1):delay(slot4):fadeOut(slot5):done()
	transition.executeSequence(slot0.text2):delay(slot4):fadeOut(slot5):done()
	transition.executeSequence(slot0.text3):delay(slot4):fadeOut(slot5):done()

	if slot0.text1:width() < slot0.text2:width() then
		adapt.oneLinePos(slot0.text2, slot0.icon, cc.p(20, 15), "right")
		adapt.oneLinePos(slot0.text2, slot0.text3, cc.p(60, 0), "left")
	else
		adapt.oneLinePos(slot0.text1, slot0.icon, cc.p(20, 15), "right")
		adapt.oneLinePos(slot0.text1, slot0.text3, cc.p(60, 0), "left")
	end

	slot0.bg:x(slot0.text3:x() - 265)
	slot0.text3:y(slot0.bg:y())
end

function slot0.onClose(slot0)
	slot0.panel:stopAllActions()
	slot0:removeSelf()
end

function slot0.onMoveUp(slot0)
	slot1, slot2 = slot0.panel:xy()

	transition.executeSequence(slot0.panel):moveTo(0.3, slot1, slot2 + slot0.panel:height() + 20):done()
end

return slot0
