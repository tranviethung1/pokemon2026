slot0 = class("AutoChessTestData")

function slot0.getNewbieData()
	return {
		trainer = 2,
		id = 1234,
		rand_seed = 1,
		level = 1,
		cards = {},
		skills = {},
		pvp_fights = {}
	}
end

function slot0.getData()
	slot0 = {
		trainer = 1,
		newbie_protect = false,
		fail_protect = false,
		rand_seed = 1,
		base_id = 1,
		id = 1234,
		level = 1,
		roleOut = {},
		cards = {
			1002,
			4007,
			1005
		},
		handCards = {},
		skills = {},
		pvp_fights = {}
	}

	for slot4, slot5 in csvPairs(csv.auto_chess.trainer[1].skills) do
		table.insert(slot0.skills, slot4)
	end

	slot1 = io.open("dev/pokemon_battle/lushi_battle/zzqbattle.rc", "rb")
	slot2 = slot1:read("*a")

	slot1:close()

	slot0.pvp_fights = {
		clone(slot2),
		clone(slot2),
		clone(slot2)
	}

	for slot6, slot7 in orderCsvPairs(csv.auto_chess.test_auto_chess) do
		slot8 = AutoChessEasy.getRoleDataFromCards(slot7.roleId)

		for slot12, slot13 in pairs(AutoChessAttrs.AttrsTable) do
			if slot12 == "hpMax" then
				slot12 = "hp"
			end

			slot8[slot12] = slot7[slot12] or slot8[slot12]
		end

		if slot7.buffid and csvSize(slot7.buffid) > 0 then
			slot8.initBuffs = csvClone(slot7.buffid)
		end

		if slot7.star then
			slot8.star = slot7.star
		end

		if slot6 < 10000 then
			slot0.roleOut[slot6] = slot8
		elseif slot6 < 20000 then
			table.insert(slot0.handCards, slot8)
		end
	end

	return slot0
end

return slot0
