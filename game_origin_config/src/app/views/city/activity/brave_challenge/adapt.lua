slot1 = game.BRAVE_CHALLENGE_TYPE
slot2 = {
	main = {
		[slot1.anniversary] = "/game/yy/brave_challenge/main",
		[slot1.common] = "/game/brave_challenge/main"
	},
	preStart = {
		[slot1.anniversary] = "/game/yy/brave_challenge/prepare/start",
		[slot1.common] = "/game/brave_challenge/prepare/start"
	},
	preEnd = {
		[slot1.anniversary] = "/game/yy/brave_challenge/prepare/end",
		[slot1.common] = "/game/brave_challenge/prepare/end"
	},
	deploy = {
		[slot1.anniversary] = "/game/yy/brave_challenge/deploy",
		[slot1.common] = "/game/brave_challenge/deploy"
	},
	battleStart = {
		[slot1.anniversary] = "/game/yy/brave_challenge/battle/start",
		[slot1.common] = "/game/brave_challenge/battle/start"
	},
	battleEnd = {
		[slot1.anniversary] = "/game/yy/brave_challenge/battle/end",
		[slot1.common] = "/game/brave_challenge/battle/end"
	},
	choose = {
		[slot1.anniversary] = "/game/yy/brave_challenge/badge/choose",
		[slot1.common] = "/game/brave_challenge/badge/choose"
	},
	buy = {
		[slot1.anniversary] = "/game/yy/brave_challenge/buy",
		[slot1.common] = "/game/brave_challenge/buy"
	},
	quit = {
		[slot1.anniversary] = "/game/yy/brave_challenge/quit",
		[slot1.common] = "/game/brave_challenge/quit"
	},
	rank = {
		[slot1.anniversary] = "/game/yy/brave_challenge/rank",
		[slot1.common] = "/game/brave_challenge/rank"
	},
	award = {
		[slot1.anniversary] = "/game/yy/award/get",
		[slot1.common] = "/game/brave_challenge/award/get"
	}
}

return {
	set = function (slot0)
		uv1 = "typ"
		slot1.typ = slot0
	end,
	url = function (slot0)
		uv1 = "typ"
		uv2 = "typ"

		return slot1[slot0][slot2.typ]
	end
}
