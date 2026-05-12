slot0 = {
	__size = 0
}
csv.town.adventure_area = {
	{
		areaType = 1,
		name = "Volcano Path",
		res = "city/town/exploration/map/img_cj1.png",
		id = 1,
		desc = "It crosses the path of an active volcano and is so hot that few Pokémon live here."
	},
	{
		areaType = 2,
		name = "Humilau City",
		res = "city/town/exploration/map/img_cj2.png",
		id = 2,
		unlockType1 = 3,
		desc = "The buildings float between the waves. It is the famous city that looks like an island.",
		unlockParams1 = {
			1,
			2
		}
	},
	{
		areaType = 3,
		name = "Resort Area",
		res = "city/town/exploration/map/img_cj5.png",
		id = 3,
		unlockType1 = 3,
		desc = "A gathering place for those who appreciate the pleasures of training beyond sparring.",
		unlockParams1 = {
			2,
			2
		}
	},
	{
		areaType = 4,
		name = "Big Wave Beach",
		res = "city/town/exploration/map/img_cj6.png",
		id = 4,
		unlockType1 = 3,
		desc = "Near the motel is the rough beach. It is one of Mantine's surfing spots.",
		unlockParams1 = {
			3,
			2
		}
	},
	__size = 4,
	__default = {
		__index = {
			res = "",
			name = "",
			areaType = 0,
			unlockType1 = 0,
			desc = "",
			unlockParams1 = {}
		}
	}
}

return csv.town.adventure_area
