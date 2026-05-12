slot0 = {}
globals.autoChessEffect = slot0

require("lushi_battle.views.effects.effect")
require("lushi_battle.views.effects.effect1")
require("lushi_battle.views.effects.effect2")

slot1 = {
	shaker = slot0.Shaker,
	callback = slot0.Callback,
	wait = slot0.Wait,
	result = slot0.BattleResult,
	riseStar = slot0.RiseStar,
	shopRise = slot0.ShopRise,
	attackStars = slot0.AttackStars,
	getAward = slot0.GetAward,
	changeChapter = slot0.ChangeChapter
}

function slot0.newEventEffect(slot0, slot1, slot2, slot3)
	uv4 = "new"

	return slot4[slot0].new(slot1, slot2, slot3)
end

return slot0
