slot1 = {
	craft = {
		changeText = "-",
		height = 86,
		width = 57,
		rect = {
			["0"] = 47,
			["2"] = 47,
			["7"] = 47,
			["3"] = 47,
			["6"] = 47,
			["9"] = 47,
			["5"] = 47,
			["1"] = 36,
			["8"] = 47,
			["4"] = 47
		}
	},
	cross_craft = {
		changeText = "-",
		height = 79,
		width = 54,
		rect = {
			["1"] = 44
		}
	},
	worldcup = {
		changeText = ":",
		height = 64,
		width = 64,
		rect = {
			["1"] = 60
		}
	},
	bj = {
		changeText = "-",
		height = 61,
		width = 48,
		rect = {
			["0"] = 44,
			["2"] = 44,
			["7"] = 44,
			["3"] = 44,
			["6"] = 44,
			["9"] = 44,
			["5"] = 44,
			["1"] = 30,
			["8"] = 44,
			["4"] = 44
		}
	},
	kz = {
		changeText = ".(x)",
		height = 43,
		width = 30,
		rect = {
			["0"] = 26,
			["."] = 15,
			["("] = 17,
			["2"] = 26,
			["7"] = 26,
			["3"] = 26,
			x = 28,
			[")"] = 17,
			["6"] = 26,
			["9"] = 26,
			["5"] = 26,
			["1"] = 23,
			["8"] = 26,
			["4"] = 26
		}
	},
	nqjl = {
		changeText = "+",
		height = 43,
		width = 34,
		rect = {
			["0"] = 30,
			["2"] = 30,
			["7"] = 30,
			["3"] = 30,
			["6"] = 30,
			["9"] = 30,
			["5"] = 30,
			["1"] = 24,
			["8"] = 30,
			["4"] = 30
		}
	},
	ptsh = {
		changeText = "-",
		height = 45,
		width = 36,
		rect = {
			["0"] = 32,
			["2"] = 32,
			["7"] = 32,
			["3"] = 32,
			["6"] = 32,
			["9"] = 32,
			["5"] = 32,
			["1"] = 25,
			["8"] = 32,
			["4"] = 32
		}
	},
	zlsz = {
		changeText = "+",
		height = 45,
		width = 36,
		rect = {
			["0"] = 32,
			["2"] = 32,
			["7"] = 32,
			["3"] = 32,
			["6"] = 32,
			["9"] = 32,
			["5"] = 32,
			["1"] = 25,
			["8"] = 32,
			["4"] = 32
		}
	},
	zsh = {
		height = 61,
		width = 48,
		rect = {
			["0"] = 44,
			["2"] = 44,
			["7"] = 44,
			["3"] = 44,
			["6"] = 44,
			["9"] = 44,
			["5"] = 44,
			["1"] = 33,
			["8"] = 44,
			["4"] = 44
		}
	},
	zzl = {
		height = 61,
		width = 48,
		rect = {
			["0"] = 44,
			["2"] = 44,
			["7"] = 44,
			["3"] = 44,
			["6"] = 44,
			["9"] = 44,
			["5"] = 44,
			["1"] = 18,
			["8"] = 44,
			["4"] = 44
		}
	},
	boss = {
		changeText = "x",
		height = 39,
		width = 32,
		rect = {
			["0"] = 24,
			x = 26,
			["2"] = 24,
			["7"] = 24,
			["3"] = 24,
			["6"] = 24,
			["9"] = 24,
			["5"] = 24,
			["1"] = 18,
			["8"] = 24,
			["4"] = 24
		}
	},
	lv_big = {
		height = 125,
		width = 98,
		rect = {
			["0"] = 82,
			["2"] = 82,
			["7"] = 82,
			["3"] = 82,
			["6"] = 82,
			["9"] = 82,
			["5"] = 82,
			["1"] = 68,
			["8"] = 82,
			["4"] = 82
		}
	},
	frhd = {
		height = 165,
		width = 132,
		rect = {
			["1"] = 75
		}
	},
	frhd_num = {
		height = 78,
		width = 83,
		rect = {
			["1"] = 65
		}
	},
	online_fight_battle_cutdown = {
		width = 59,
		height = 91
	},
	txz = {
		height = 140,
		width = 116,
		rect = {
			["1"] = 60
		}
	},
	element = {
		height = 53,
		changeText = "+",
		width = 42
	},
	sprite_jump = {
		interval = -88,
		height = 106,
		changeText = ".",
		width = 96,
		rect = {
			["."] = 66,
			["1"] = 90
		}
	},
	sprite_jump_red = {
		interval = -88,
		height = 106,
		changeText = ".",
		width = 96,
		rect = {
			["."] = 66,
			["1"] = 90
		}
	},
	cross_union_adventure = {
		interval = -15,
		height = 59,
		width = 45,
		rect = {
			["1"] = 35
		}
	}
}

return {
	findFileInfoByPathName = function (slot0)
		if not slot0 then
			return
		end

		uv2 = "clone"

		return clone(slot2[slot0])
	end
}
