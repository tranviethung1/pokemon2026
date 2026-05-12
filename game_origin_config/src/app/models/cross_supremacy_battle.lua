slot1 = class("CrossSupremacyBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.crossSupremacy
slot1.MultipGroup = true

function slot1.getData(slot0)
	uv1 = "getData"
	slot1 = slot1.getData(slot0)

	if slot0.stats and next(slot0.stats) then
		slot2 = {}

		for slot6, slot7 in pairs(slot0.stats) do
			if slot7 == "win" then
				table.insert(slot2, 1)
			else
				table.insert(slot2, 2)
			end
		end

		slot1.waveReusult = slot2
	end

	slot1.role_key = slot0.role_key
	slot1.defence_role_key = slot0.defence_role_key

	return slot1
end

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

return slot1
