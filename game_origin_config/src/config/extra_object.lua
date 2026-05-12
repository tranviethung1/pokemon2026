slot0 = {
	{
		4121650,
		2821147,
		7041000
	}
}
csv.extra_object = {
	{
		id = 1,
		bornAddBuffs = slot0[1]
	},
	{
		id = 2,
		dealGroup = 2,
		hideLifebar = 2,
		bornAddBuffs = slot0[1]
	},
	{
		dealGroup = 3,
		category = 1,
		hideLifebar = 1,
		id = 3,
		bornAddBuffs = slot0[1]
	},
	{
		id = 4,
		dealGroup = 4,
		hideLifebar = 1,
		bornAddBuffs = slot0[1]
	},
	{
		id = 5,
		dealGroup = 5,
		bornAddBuffs = {
			4121650,
			2821147,
			2421223,
			7041000
		}
	},
	{
		category = 1,
		dealGroup = 6,
		hideLifebar = 2,
		id = 6,
		bornAddBuffs = slot0[1],
		beAttackOffsetPos = {
			__size = 2,
			x = 300,
			y = -500
		}
	},
	{
		id = 7,
		dealGroup = 7,
		hideLifebar = 2,
		bornAddBuffs = slot0[1]
	},
	{
		dealGroup = 8,
		category = 1,
		hideLifebar = 2,
		id = 8,
		posZ = 1300,
		bornAddBuffs = slot0[1]
	},
	{
		id = 9,
		natureIncluded = true,
		dealGroup = 9,
		bornAddBuffs = slot0[1]
	},
	{
		dealGroup = 10,
		hideLifebar = 2,
		id = 10,
		lerpZ = -1,
		bornAddBuffs = slot0[1]
	},
	__size = 10,
	__default = {
		__index = {
			category = 0,
			deadDel = true,
			dealGroup = 1,
			battleTurnFollowMode = 1,
			triggerBattleTurn = true,
			hideLifebar = 0,
			lerpZ = 0,
			natureIncluded = false,
			bornAddBuffs = {},
			beAttackOffsetPos = {
				__size = 2,
				x = 0,
				y = 0
			}
		}
	}
}

return csv.extra_object
