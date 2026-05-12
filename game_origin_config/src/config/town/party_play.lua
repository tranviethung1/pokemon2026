slot0 = {
	__size = 0
}
csv.town.party_play = {
	__size = 17,
	[101] = {
		id = 101,
		res = "city/town/home/party/icon_party1.png",
		name = "Brilliant Fireworks",
		type = 1
	},
	[102] = {
		id = 102,
		res = "city/town/home/party/icon_party2.png",
		name = "Disco ball",
		type = 1
	},
	[103] = {
		id = 103,
		res = "city/town/home/party/icon_party3.png",
		name = "Volume Boost！",
		type = 1
	},
	[104] = {
		id = 104,
		res = "city/town/home/party/icon_party4.png",
		name = "Dragon(s) Ahead",
		type = 1
	},
	[105] = {
		name = "Little Evil",
		res = "city/town/home/party/icon_party5.png",
		hold = 1,
		type = 1,
		id = 105,
		clientParam = {
			boneName = "bei_move",
			z = 0,
			x = 0,
			y = 0,
			__size = 6,
			scale = 1,
			spineName = "town/emweiba.skel"
		}
	},
	[106] = {
		name = "Character Shield",
		res = "city/town/home/party/icon_party6.png",
		hold = 2,
		type = 1,
		id = 106,
		clientParam = {
			boneName = "tou_move",
			z = 2,
			__size = 3,
			spineName = "town/guanghuan.skel"
		}
	},
	[107] = {
		name = "Fluttering Balloon",
		res = "city/town/home/party/icon_party7.png",
		hold = 2,
		type = 1,
		id = 107,
		clientParam = {
			boneName = "bei_move",
			z = 0,
			x = 0,
			y = 0,
			__size = 6,
			scale = 1.1,
			spineName = "town/qiqiu.skel"
		}
	},
	[201] = {
		id = 201,
		res = "config/partyemoji/icon_bq_hql.png",
		type = 2
	},
	[202] = {
		id = 202,
		res = "config/partyemoji/icon_bq_sn.png",
		type = 2
	},
	[203] = {
		id = 203,
		res = "config/partyemoji/icon_bq_tt.png",
		type = 2
	},
	[204] = {
		id = 204,
		res = "config/partyemoji/icon_bq_ttt.png",
		type = 2
	},
	[205] = {
		id = 205,
		res = "config/partyemoji/icon_bq_ym.png",
		type = 2
	},
	[301] = {
		id = 301,
		name = "Orange",
		type = 3,
		clientParam = {
			__size = 2,
			color = {
				g = 137,
				a = 255,
				__size = 4,
				r = 243,
				b = 91
			},
			outline = {
				g = 51,
				a = 255,
				__size = 4,
				r = 107,
				b = 26
			}
		}
	},
	[302] = {
		id = 302,
		name = "Green",
		type = 3,
		clientParam = {
			__size = 2,
			color = {
				g = 225,
				a = 255,
				__size = 4,
				r = 145,
				b = 177
			},
			outline = {
				g = 73,
				a = 255,
				__size = 4,
				r = 3,
				b = 37
			}
		}
	},
	[303] = {
		id = 303,
		name = "Blue",
		type = 3,
		clientParam = {
			__size = 2,
			color = {
				g = 175,
				a = 255,
				__size = 4,
				r = 139,
				b = 223
			},
			outline = {
				g = 45,
				a = 255,
				__size = 4,
				r = 0,
				b = 106
			}
		}
	},
	[304] = {
		id = 304,
		name = "Purple",
		type = 3,
		clientParam = {
			__size = 2,
			color = {
				g = 142,
				a = 255,
				__size = 4,
				r = 203,
				b = 222
			},
			outline = {
				g = 11,
				a = 255,
				__size = 4,
				r = 85,
				b = 104
			}
		}
	},
	[305] = {
		id = 305,
		name = "Pink",
		type = 3,
		clientParam = {
			__size = 2,
			color = {
				g = 115,
				a = 255,
				__size = 4,
				r = 238,
				b = 143
			},
			outline = {
				g = 15,
				a = 255,
				__size = 4,
				r = 104,
				b = 90
			}
		}
	},
	__default = {
		__index = {
			name = "",
			res = "",
			hold = 0,
			type = 0,
			clientParam = {
				__size = 0
			}
		}
	}
}

return csv.town.party_play
