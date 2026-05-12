globals.TestRecord = {
	addBuffToHero = 0
}
globals.TestStuck = {
	triggerPoint = 0,
	updateBuffByNodeTime = 0,
	toAttackTime = 0,
	triggerPointDispatch = 0,
	buffTakeEffect = 0,
	extraBattleTurn = 0,
	triggerPointIterTime = 0,
	dispelBuffTrueTotal = 0,
	checkBuffAddTime = 0,
	zeroProb = 0,
	normalBattleTurn = 0,
	buffAdd = 0,
	triggerPassive = 0,
	buffSuccessAdd = 0,
	dispelBuffTotal = 0,
	addBuffToHeroTime = 0,
	buffUpdateTime = 0,
	addBuffFrom = {},
	addBuffSuccessFrom = {},
	fromBuffOrigin = {},
	fromSkillOrigin = {},
	checkBuffConditionTime = {}
}

require("editor.builder"):loadAndPlayBattle("arena_625c017009582f58c88015d0.play", false)
dump(TestRecord)
print("!!! require(\"app.views.login.hwtest\")")

return true
