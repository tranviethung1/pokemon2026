slot0 = AutoChessBattle.EncounterModel
slot0.IgnoreKeys = {
	__class = true,
	__cid = true,
	components_ = true,
	IgnoreKeys = true,
	funcs = true,
	lastFrame = true
}

function slot0.packInit(slot0)
	for slot4 = 1, 3 do
		if slot0.data:encounter(slot4) and slot5.refreshCsv then
			slot5:refreshCsv()
		end
	end

	slot0:createMenus(1, 2, 3)

	slot1 = false

	if slot0.data:encounter(slot0.modeIdx) and not csv.auto_chess.encounter[slot2.id].back then
		slot0:menuClick(slot0.modeIdx)

		slot1 = true
	end

	if not slot1 then
		gRootViewProxy:notify("showMenu", slot0.data:getLeftEncounterNum(), slot0.data.isFake)
	end

	if csv.auto_chess.chapter[slot0.data:chapter()] and slot3.bg and slot3.bg ~= "" then
		gRootViewProxy:proxy():changeMainBg(slot3.bg)
	end
end
