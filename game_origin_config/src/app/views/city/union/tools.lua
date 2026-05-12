return {
	canEnterBuilding = function (slot0, slot1, slot2)
		slot3 = true

		if not slot0 or not gUnionFeatureCsv[slot0] or gGameModel.union:read("level") < gUnionFeatureCsv[slot0] then
			return false
		end

		if not slot1 and dataEasy.notUseUnionBuild() then
			slot3 = false

			if not slot2 then
				gGameUI:showTip(gLanguageCsv.cannotUseBuilding)
			end

			return slot3
		end

		return slot3
	end,
	currentOpenFuben = function ()
		if time.getTimeTable().wday == 1 then
			return "weekError"
		end

		if slot0.hour * 100 + slot0.min < 930 or slot1 > 2330 then
			return "timeError"
		end

		return "open"
	end
}
