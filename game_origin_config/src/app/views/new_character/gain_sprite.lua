slot0 = class("CharacterGainSpriteView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "character_gain_sprite.json"
slot0.RESOURCE_BINDING = {
	txt = "txt",
	pos = "pos",
	btnBegin = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBegin")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.cb = slot2

	audio.playEffectWithWeekBGM("card_gain.mp3")

	slot3 = widget.addAnimationByKey(slot0.pos, "effect/gongxihuode.skel", "titleEft", "effect")

	slot3:xy(slot0.pos:size().width / 2, 580)
	slot3:setSpriteEventHandler(function (slot0, slot1)
		uv2 = "play"

		slot2:play("effect_loop")
	end, sp.EventType.ANIMATION_COMPLETE)

	slot4 = csv.unit[csv.cards[slot1].unitID]
	slot6 = widget.addAnimationByKey(slot0.pos, slot4.unitRes, "effect", "standby_loop")

	slot6:xy(slot0.pos:size().width / 2, 0):scale(3)
	slot6:setSkin(slot4.skin)
	slot0.txt:text(string.format(gLanguageCsv.congratulationGetCard, csv.cards[slot1].name))
end

function slot0.onBegin(slot0)
	slot0.cb()
end

return slot0
