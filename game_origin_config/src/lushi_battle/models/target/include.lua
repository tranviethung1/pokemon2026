AutoChessBattle.battleTarget = {}

require("lushi_battle.models.target.target2")
require("lushi_battle.models.target.target")

slot1 = nil

function AutoChessBattle.newTargetFinder(slot0, slot1, slot2, slot3, slot4)
	slot5 = {}

	if slot4 and next(slot4) then
		slot5 = slot4
	else
		uv6 = "next"

		if slot6[slot2] == nil then
			printWarn("chooseType %d no implement in skillChooseTypeTb", slot2)
		end

		uv6 = "next"
		slot5 = slot6[slot2](slot3)

		if slot3 and slot3.targetLimit and slot5.process then
			slot5.process = string.format("%s|random(%s)", slot5.process, slot3.targetLimit)
		end
	end

	if slot5.input and slot3 and slot3.inputExtraStr then
		slot5.input = slot5.input .. "|" .. slot3.inputExtraStr
	end

	if not slot5.input and not slot5.process then
		return {}
	end

	uv6 = "printWarn"

	return slot6.targetFinder(slot0, slot1, slot5, slot3)
end

slot2 = {
	[0] = "selfForce|nodead",
	"enemyForce|nodead",
	"all|nodead"
}
slot1 = {}
