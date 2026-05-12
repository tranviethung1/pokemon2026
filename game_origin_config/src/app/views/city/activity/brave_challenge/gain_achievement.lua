slot1 = class("BraveChallengeGainAchievementView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "activity_brave_challenge_gain_achievement.json"
slot1.RESOURCE_STYLES = {
	clickClose = true,
	blackLayer = true
}
slot1.RESOURCE_BINDING = {
	icon = "icon",
	item = "item",
	imgBg = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	gain = {
		varname = "gain",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = cc.c4b(91, 84, 91, 255)
					}
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.sendQuit = slot1.sendQuit
	slot0.got = slot1.got
	slot2 = {}

	for slot6, slot7 in csvPairs(slot1.itemData) do
		slot8 = slot0.item:clone():show()

		slot8:addTo(slot0.item:parent(), 2)
		bind.extend(slot0, slot8, {
			class = "icon_key",
			props = {
				data = {
					key = slot6,
					num = slot7
				}
			}
		})
		table.insert(slot2, slot8)
		slot8:get("got"):visible(not slot1.got)
	end

	adapt.oneLineCenterPos(cc.p(slot0.gain:x(), 280), slot2, cc.p(5, 0))
	slot0.gain:visible(false)

	slot3 = widget.addAnimationByKey(slot0.icon, slot1.lastAnimation, "bg", "effect_loop", 10):xy(100, 0):scale(2)
	slot4 = widget.addAnimationByKey(slot0.icon, "effect/hd.skel", "wutai", "effect", 0):xy(100, 0)
end

function slot1.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, functools.partial(slot0.sendQuit, true))

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot1
