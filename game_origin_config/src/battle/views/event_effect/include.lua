slot0 = {}
globals.battleEffect = slot0

require("battle.views.event_effect.effect")
require("battle.views.event_effect.effect1")
require("battle.views.event_effect.effect2")
require("battle.views.event_effect.callback_debug")

slot1 = {
	sound = slot0.Sound,
	damageSeg = slot0.SegShow,
	hpSeg = slot0.SegShow,
	shaker = slot0.Shaker,
	music = slot0.Music,
	move = slot0.Move,
	show = slot0.Show,
	effect = slot0.SpriteEffect,
	delay = slot0.Delay,
	zOrder = slot0.ZOrder,
	moveByDis = slot0.MoveByDis,
	moveByTime = slot0.MoveByTime,
	moveTo = slot0.MoveTo,
	comeBack = slot0.ComeBack,
	callback = slot0.Callback,
	follow = slot0.Follow,
	wait = slot0.Wait,
	jump = slot0.Jump,
	control = slot0.Control,
	onceEffect = slot0.OnceEffect,
	cutting = slot0.Cutting
}

function globals.newEventEffect(slot0, slot1, slot2, slot3)
	uv4 = "new"

	return slot4[slot0].new(slot1, slot2, slot3)
end

return slot0
