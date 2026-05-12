slot0 = {
	__size = 16,
	[2] = {
		gold = 15000,
		__size = 1
	},
	[4] = {
		gold = 40000,
		coin14 = 100,
		__size = 2
	},
	[5] = {
		gold = 0,
		coin14 = 0,
		__size = 2
	},
	[6] = {
		101,
		201
	},
	[8] = {
		__size = 5,
		[123.0] = 0,
		coin14 = 0,
		gold = 0,
		[122.0] = 0,
		[7201.0] = 0
	},
	[10] = {
		201,
		301
	},
	[12] = {
		__size = 6,
		[123.0] = 0,
		[7201.0] = 0,
		coin14 = 0,
		gold = 0,
		[122.0] = 0,
		[7202.0] = 0
	},
	[14] = {
		__size = 8,
		[122.0] = 0,
		[7203.0] = 0,
		[7202.0] = 0,
		gold = 0,
		[124.0] = 0,
		[123.0] = 0,
		coin14 = 0,
		[7201.0] = 0
	},
	[16] = {
		__size = 4,
		[7202.0] = 0,
		gold = 0,
		coin14 = 0,
		[7201.0] = 0
	},
	[17] = {
		301
	},
	[23] = {
		gold = 45000,
		coin14 = 150,
		__size = 2
	},
	[24] = {
		101,
		1101,
		201,
		1201,
		1001
	},
	[27] = {
		coin14 = 300,
		gold = 65000,
		__size = 3,
		libs = {
			22102,
			22106,
			22115,
			22116
		}
	},
	[28] = {
		201,
		1201,
		301,
		1301,
		1001
	},
	[30] = {
		__size = 9,
		[7204.0] = 0,
		[122.0] = 0,
		[7203.0] = 0,
		gold = 0,
		[124.0] = 0,
		[7201.0] = 0,
		[123.0] = 0,
		coin14 = 0,
		[7202.0] = 0
	},
	[34] = {
		301,
		1301,
		1001
	}
}
slot1 = {
	[102011] = slot0[24],
	[102012] = slot0[24],
	[102013] = slot0[28],
	[102014] = slot0[28],
	[102007] = slot0[34],
	[102006] = slot0[28],
	[102021] = slot0[34],
	[101008] = slot0[17],
	[101006] = slot0[10],
	[101014] = slot0[17],
	[101011] = slot0[6],
	[101013] = slot0[10],
	[101012] = slot0[6]
}
slot2 = {
	[102021] = slot0[30],
	[102022] = slot0[30],
	[102007] = slot0[12],
	[102006] = slot0[30],
	[102005] = slot0[5],
	[102004] = slot0[16],
	[102003] = slot0[5],
	[102002] = slot0[5],
	[102001] = slot0[5],
	default = slot0[2],
	[101014] = slot0[14],
	[101011] = slot0[8],
	[101013] = slot0[14],
	[101012] = slot0[8],
	[102011] = slot0[8],
	[102012] = slot0[12],
	[102013] = slot0[30],
	[101007] = slot0[16],
	[101006] = slot0[12],
	[101021] = slot0[14],
	[101004] = slot0[5],
	[101005] = slot0[5],
	[101002] = slot0[5],
	[101003] = slot0[5],
	[101001] = slot0[5]
}
slot3 = {
	[102012] = slot0[27],
	[102007] = slot0[27],
	[102005] = slot0[23],
	[102003] = slot0[23],
	[102002] = slot0[23],
	[102001] = slot0[23],
	default = slot0[2],
	[101004] = slot0[4],
	[101005] = slot0[4],
	[101002] = slot0[4],
	[101003] = slot0[4],
	[101001] = slot0[4]
}
csv.cross.hunting.gate = {
	__size = 37,
	[101001] = {
		isBuff = 1,
		id = 101001,
		fightingPointC = 0.33,
		backGround = "csv.stage.green",
		buffType = {
			101
		},
		drops = slot3[101001],
		dropsView = slot2[101001]
	},
	[101002] = {
		backGround = "csv.stage.green",
		id = 101002,
		fightingPointC = 0.39,
		drops = slot3[101002],
		dropsView = slot2[101002]
	},
	[101011] = {
		damageC = 1.1,
		defenceC = 1.1,
		type = 2,
		specialDamageC = 1.1,
		fightingPointC = 0.46,
		speedC = 1.05,
		hpC = 1.1,
		isBuff = 1,
		backGround = "csv.stage.green",
		id = 101011,
		specialDefenceC = 1.1,
		buffType = slot1[101011],
		drops = {
			coin14 = 200,
			gold = 50000,
			__size = 3,
			libs = {
				22101,
				22106,
				22115
			}
		},
		dropsView = slot2[101011]
	},
	[101003] = {
		backGround = "csv.stage.green",
		id = 101003,
		fightingPointC = 0.52,
		drops = slot3[101003],
		dropsView = slot2[101003]
	},
	[11] = {
		id = 11,
		backGround = "csv.stage.green"
	},
	[12] = {
		id = 12,
		backGround = "csv.stage.green"
	},
	[101004] = {
		backGround = "csv.stage.green",
		id = 101004,
		fightingPointC = 0.55,
		drops = slot3[101004],
		dropsView = slot2[101004]
	},
	[101012] = {
		damageC = 1.1,
		defenceC = 1.1,
		type = 2,
		specialDamageC = 1.1,
		fightingPointC = 0.61,
		speedC = 1.05,
		hpC = 1.1,
		isBuff = 1,
		backGround = "csv.stage.green",
		id = 101012,
		specialDefenceC = 1.1,
		buffType = slot1[101012],
		drops = {
			coin14 = 200,
			gold = 50000,
			__size = 3,
			libs = {
				22101,
				22106,
				22115,
				22115
			}
		},
		dropsView = slot2[101012]
	},
	[13] = {
		id = 13,
		backGround = "csv.stage.green"
	},
	[101005] = {
		backGround = "csv.stage.green",
		id = 101005,
		fightingPointC = 0.66,
		drops = slot3[101005],
		dropsView = slot2[101005]
	},
	[14] = {
		id = 14,
		backGround = "csv.stage.green"
	},
	[101006] = {
		isBuff = 1,
		id = 101006,
		fightingPointC = 0.68,
		backGround = "csv.stage.green",
		buffType = slot1[101006],
		drops = {
			coin14 = 200,
			gold = 50000,
			__size = 3,
			libs = {
				22102,
				22106,
				22115,
				22116
			}
		},
		dropsView = slot2[101006]
	},
	[101013] = {
		damageC = 1.05,
		defenceC = 1.05,
		type = 2,
		specialDamageC = 1.05,
		fightingPointC = 0.73,
		backGround = "csv.stage.green",
		hpC = 1.05,
		isBuff = 1,
		id = 101013,
		specialDefenceC = 1.05,
		buffType = slot1[101013],
		drops = {
			coin14 = 200,
			gold = 75000,
			__size = 3,
			libs = {
				22103,
				22107,
				22115,
				22116
			}
		},
		dropsView = slot2[101013]
	},
	[101007] = {
		backGround = "csv.stage.green",
		id = 101007,
		fightingPointC = 0.77,
		drops = {
			coin14 = 100,
			gold = 40000,
			__size = 3,
			libs = {
				22102
			}
		},
		dropsView = slot2[101007]
	},
	[101008] = {
		damageC = 1.07,
		defenceC = 1.07,
		type = 2,
		specialDamageC = 1.07,
		fightingPointC = 0.84,
		backGround = "csv.stage.green",
		hpC = 1.07,
		isBuff = 1,
		id = 101008,
		specialDefenceC = 1.07,
		buffType = slot1[101008],
		drops = {
			coin14 = 200,
			gold = 50000,
			__size = 3,
			libs = {
				22102,
				22107,
				22115,
				22116
			}
		},
		dropsView = {
			__size = 7,
			[123.0] = 0,
			[7201.0] = 0,
			[124.0] = 0,
			gold = 0,
			[122.0] = 0,
			[7202.0] = 0,
			coin14 = 0
		}
	},
	[15] = {
		id = 15,
		backGround = "csv.stage.green"
	},
	[101014] = {
		damageC = 1.07,
		defenceC = 1.07,
		type = 2,
		specialDamageC = 1.07,
		fightingPointC = 0.93,
		backGround = "csv.stage.green",
		hpC = 1.07,
		isBuff = 1,
		id = 101014,
		specialDefenceC = 1.07,
		buffType = slot1[101014],
		drops = {
			coin14 = 200,
			gold = 50000,
			__size = 3,
			libs = {
				22103,
				22107,
				22115,
				22116
			}
		},
		dropsView = slot2[101014]
	},
	[16] = {
		id = 16,
		backGround = "csv.stage.green"
	},
	[101021] = {
		damageC = 1.13,
		fightingPointC = 1.05,
		defenceC = 1.13,
		type = 3,
		specialDamageC = 1.13,
		speedC = 1.05,
		backGround = "csv.stage.green",
		hpC = 1.13,
		id = 101021,
		specialDefenceC = 1.13,
		drops = {
			coin14 = 350,
			gold = 75000,
			__size = 3,
			libs = {
				22103,
				22107,
				22116,
				22116
			}
		},
		dropsView = slot2[101021]
	},
	[102001] = {
		isBuff = 1,
		id = 102001,
		fightingPointC = 0.44,
		buffType = {
			101,
			1101
		},
		drops = slot3[102001],
		dropsView = slot2[102001]
	},
	[102002] = {
		id = 102002,
		fightingPointC = 0.55,
		drops = slot3[102002],
		dropsView = slot2[102002]
	},
	[102011] = {
		damageC = 1.07,
		defenceC = 1.07,
		type = 2,
		specialDamageC = 1.07,
		fightingPointC = 0.61,
		hpC = 1.07,
		isBuff = 1,
		id = 102011,
		specialDefenceC = 1.07,
		buffType = slot1[102011],
		drops = {
			coin14 = 300,
			gold = 65000,
			__size = 3,
			libs = {
				22101,
				22106,
				22115,
				22115
			}
		},
		dropsView = slot2[102011]
	},
	[102003] = {
		id = 102003,
		fightingPointC = 0.66,
		drops = slot3[102003],
		dropsView = slot2[102003]
	},
	[21] = {
		id = 21
	},
	[102004] = {
		id = 102004,
		fightingPointC = 0.61,
		drops = {
			coin14 = 150,
			gold = 45000,
			__size = 3,
			libs = {
				22102
			}
		},
		dropsView = slot2[102004]
	},
	[102012] = {
		damageC = 1.07,
		defenceC = 1.07,
		type = 2,
		specialDamageC = 1.07,
		fightingPointC = 0.66,
		hpC = 1.07,
		isBuff = 1,
		id = 102012,
		specialDefenceC = 1.07,
		buffType = slot1[102012],
		drops = slot3[102012],
		dropsView = slot2[102012]
	},
	[102005] = {
		id = 102005,
		fightingPointC = 0.72,
		drops = slot3[102005],
		dropsView = slot2[102005]
	},
	[22] = {
		id = 22
	},
	[23] = {
		id = 23
	},
	[102006] = {
		damageC = 1.07,
		defenceC = 1.07,
		specialDamageC = 1.07,
		fightingPointC = 0.75,
		hpC = 1.07,
		isBuff = 1,
		id = 102006,
		specialDefenceC = 1.07,
		buffType = slot1[102006],
		drops = {
			coin14 = 300,
			gold = 65000,
			__size = 3,
			libs = {
				22104,
				22107,
				22116,
				22116
			}
		},
		dropsView = slot2[102006]
	},
	[102013] = {
		damageC = 1.13,
		defenceC = 1.13,
		type = 2,
		specialDamageC = 1.13,
		fightingPointC = 0.83,
		speedC = 1.05,
		hpC = 1.13,
		isBuff = 1,
		id = 102013,
		specialDefenceC = 1.13,
		buffType = slot1[102013],
		drops = {
			coin14 = 500,
			gold = 120000,
			__size = 3,
			libs = {
				22104,
				22107,
				22116,
				22116
			}
		},
		dropsView = slot2[102013]
	},
	[102014] = {
		damageC = 1.13,
		defenceC = 1.13,
		type = 2,
		specialDamageC = 1.13,
		fightingPointC = 0.91,
		speedC = 1.05,
		hpC = 1.13,
		isBuff = 1,
		id = 102014,
		specialDefenceC = 1.13,
		buffType = slot1[102014],
		drops = {
			coin14 = 300,
			gold = 65000,
			__size = 3,
			libs = {
				22103,
				22106,
				22115,
				22116
			}
		},
		dropsView = {
			__size = 6,
			[7202.0] = 0,
			[122.0] = 0,
			[7203.0] = 0,
			gold = 0,
			coin14 = 0,
			[7201.0] = 0
		}
	},
	[102007] = {
		damageC = 1.13,
		defenceC = 1.13,
		type = 2,
		specialDamageC = 1.13,
		fightingPointC = 0.99,
		speedC = 1.05,
		hpC = 1.13,
		isBuff = 1,
		id = 102007,
		specialDefenceC = 1.13,
		buffType = slot1[102007],
		drops = slot3[102007],
		dropsView = slot2[102007]
	},
	[24] = {
		id = 24
	},
	[102021] = {
		damageC = 1.15,
		defenceC = 1.15,
		type = 2,
		specialDamageC = 1.15,
		fightingPointC = 1.07,
		speedC = 1.05,
		hpC = 1.15,
		isBuff = 1,
		id = 102021,
		specialDefenceC = 1.15,
		buffType = slot1[102021],
		drops = {
			coin14 = 300,
			gold = 65000,
			__size = 3,
			libs = {
				22104,
				22107,
				22116,
				22117
			}
		},
		dropsView = slot2[102021]
	},
	[25] = {
		id = 25
	},
	[102022] = {
		damageC = 1.18,
		fightingPointC = 1.16,
		defenceC = 1.18,
		type = 3,
		specialDamageC = 1.18,
		speedC = 1.1,
		hpC = 1.18,
		id = 102022,
		specialDefenceC = 1.18,
		drops = {
			coin14 = 500,
			gold = 120000,
			__size = 3,
			libs = {
				22104,
				22107,
				22117,
				22117
			}
		},
		dropsView = slot2[102022]
	},
	__default = {
		__index = {
			damageC = 1,
			defenceC = 1,
			type = 1,
			specialDamageC = 1,
			fightingPointC = 1,
			speedC = 1,
			hpC = 1,
			isBuff = 0,
			recoverMp = 50,
			backGround = "csv.stage.night",
			specialDefenceC = 1,
			buffType = {},
			drops = slot3.default,
			dropsView = slot2.default
		}
	}
}

return csv.cross.hunting.gate
