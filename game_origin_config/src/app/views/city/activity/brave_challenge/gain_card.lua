slot1 = class("BraveChallengeGainCardView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "activity_brave_challenge_gain_card.json"
slot1.RESOURCE_BINDING = {
	rarityIcon = "rarityIcon",
	spine = "spine",
	condition = {
		varname = "condition",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						color = ui.COLORS.OUTLINE.DEFAULT
					}
				}
			}
		}
	},
	conditionTxt = {
		varname = "conditionTxt",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						color = ui.COLORS.OUTLINE.DEFAULT
					}
				}
			}
		}
	},
	imgBg = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	cardName = {
		varname = "cardName",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						color = ui.COLORS.OUTLINE.DEFAULT
					}
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.cb = slot2
	slot3 = csv.brave_challenge.cards[slot1]
	slot5 = csv.unit[csv.cards[slot3.cardID].unitID]

	widget.addAnimationByKey(slot0.spine, "effect/hd.skel", "bg", "effect", 10):xy(300, 300)

	slot7 = widget.addAnimationByKey(slot0.spine, slot5.unitRes, "spine", "standby_loop", 11):scale(slot5.scale * 1.5):xy(300, 50)

	slot0.rarityIcon:texture("common/icon/icon_rarity" .. slot3.rarity + 1 .. ".png")
	slot0.cardName:text(slot3.desc)
	slot0.conditionTxt:text(slot3.unlockdesc2)
	adapt.oneLineCenterPos(cc.p(1280, slot0.condition:y()), {
		slot0.condition,
		slot0.conditionTxt
	}, cc.p(0, 0))
end

function slot1.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot1
