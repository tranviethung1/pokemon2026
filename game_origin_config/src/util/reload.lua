function reload_require()
	slot0 = {
		["util%."] = true,
		game_S = true,
		["view%."] = true,
		game_ui = true,
		["game_model%."] = true,
		["ui%."] = true,
		["luastl%."] = true,
		["config%."] = true,
		game_C = true,
		["model%."] = true,
		["algorithm%."] = true,
		["base%."] = true
	}

	for slot4, slot5 in pairs(package.loaded) do
		slot6 = false

		for slot10, slot11 in pairs(slot0) do
			if string.find(slot4, slot10) then
				slot6 = true

				break
			end
		end

		if slot6 then
			package.loaded[slot4] = nil

			require(slot4)
			print("SUCCESS REQUIRED:  " .. slot4)
		end
	end
end
