slot0 = {
	{
		__size = 0
	},
	__size = 6,
	[4] = {
		[4.0] = 1,
		__size = 1
	},
	[7] = {
		__size = 4,
		rmb = 300,
		gold = 2000000,
		coin5 = 3600,
		[502.0] = 10
	},
	[9] = {
		[3.0] = 3,
		__size = 1
	},
	[13] = {
		[6.0] = 1,
		__size = 1
	},
	[54] = {
		__size = 1,
		[5.0] = 1
	}
}
slot2 = {
	default = slot0[1],
	[1102] = slot0[7],
	[1103] = slot0[7],
	[1101] = slot0[7]
}
slot5 = {
	[1628] = slot0[54],
	[1519] = slot0[13],
	default = slot0[1],
	[1606] = slot0[54],
	[1630] = slot0[54],
	[1631] = slot0[54],
	[1632] = slot0[54],
	[1618] = slot0[54],
	[1619] = slot0[54],
	[1616] = slot0[54],
	[1617] = slot0[54],
	[1614] = slot0[54],
	[1615] = slot0[54],
	[1612] = slot0[54],
	[1613] = slot0[54],
	[1610] = slot0[54],
	[1611] = slot0[54],
	[1502] = slot0[13],
	[1501] = slot0[13],
	[1520] = slot0[13],
	[1507] = slot0[13],
	[1504] = slot0[13],
	[1505] = slot0[13],
	[1403] = slot0[13],
	[1402] = slot0[13],
	[1508] = slot0[13],
	[1509] = slot0[13],
	[1518] = slot0[13],
	[1623] = slot0[54],
	[1622] = slot0[54],
	[1620] = slot0[54],
	[1006] = slot0[4],
	[1629] = slot0[54],
	[1401] = slot0[13],
	[1609] = slot0[54],
	[1608] = slot0[54],
	[1621] = slot0[54],
	[1516] = slot0[13],
	[1627] = slot0[54],
	[1626] = slot0[54],
	[1625] = slot0[54],
	[1624] = slot0[54],
	[1601] = slot0[54],
	[1603] = slot0[54],
	[1602] = slot0[54],
	[1605] = slot0[54],
	[1604] = slot0[54],
	[1607] = slot0[54],
	[1002] = slot0[4],
	[1102] = slot0[9],
	[1103] = slot0[9],
	[1101] = slot0[9],
	[1515] = slot0[13],
	[1514] = slot0[13],
	[1517] = slot0[13],
	[1004] = slot0[4],
	[1511] = slot0[13],
	[1510] = slot0[13],
	[1513] = slot0[13],
	[1512] = slot0[13]
}
csv.contract.activate_book = {
	__size = 59,
	[1002] = {
		targetType1 = 42,
		targetDesc1 = "养成开启后，竞技场累计胜利100次",
		id = 1002,
		exchangeTimes = 1,
		targetArg1 = 100,
		contractCsvID = 81403,
		costItems = {
			gold = 2000000,
			rmb = 500,
			coin1 = 48000,
			__size = 3
		},
		costContractMap = slot5[1002]
	},
	[1004] = {
		targetType1 = 130,
		targetDesc1 = "养成开启后，以太乐园累计通关10次",
		id = 1004,
		exchangeTimes = 1,
		targetArg1 = 10,
		contractCsvID = 82403,
		costItems = {
			gold = 2000000,
			rmb = 500,
			coin2 = 48000,
			__size = 3
		},
		costContractMap = slot5[1004]
	},
	[1006] = {
		targetType1 = 55,
		targetDesc1 = "养成开启后，公会捐献50次",
		id = 1006,
		exchangeTimes = 1,
		targetArg1 = 50,
		contractCsvID = 83404,
		costItems = {
			gold = 2000000,
			rmb = 500,
			coin3 = 24000,
			__size = 3
		},
		costContractMap = slot5[1006]
	},
	[1101] = {
		targetType1 = 128,
		targetDesc1 = "小火龙系列达到12星",
		id = 1101,
		exchangeTimes = 1,
		contractCsvID = 81401,
		costItems = slot2[1101],
		targetParam1 = {
			__size = 1,
			[12] = {
				11
			}
		},
		costContractMap = slot5[1101]
	},
	[1102] = {
		targetType1 = 128,
		targetDesc1 = "杰尼龟系列达到12星",
		id = 1102,
		exchangeTimes = 1,
		contractCsvID = 82402,
		costItems = slot2[1102],
		targetParam1 = {
			__size = 1,
			[12] = {
				21
			}
		},
		costContractMap = slot5[1102]
	},
	[1103] = {
		targetType1 = 128,
		targetDesc1 = "妙蛙种子系列达到12星",
		id = 1103,
		exchangeTimes = 1,
		contractCsvID = 83402,
		costItems = slot2[1103],
		targetParam1 = {
			__size = 1,
			[12] = {
				1
			}
		},
		costContractMap = slot5[1103]
	},
	[1401] = {
		targetType1 = 13,
		targetDesc1 = "拥有超级裂空座解锁",
		id = 1401,
		exchangeTimes = 1,
		targetArg1 = 1982,
		contractCsvID = 81601,
		costItems = {
			__size = 4,
			rmb = 2000,
			[521.0] = 10,
			gold = 8000000,
			[21981.0] = 30
		},
		costContractMap = slot5[1401]
	},
	[1402] = {
		targetType1 = 13,
		targetDesc1 = "拥有原始固拉多解锁",
		id = 1402,
		exchangeTimes = 1,
		targetArg1 = 1972,
		contractCsvID = 82603,
		costItems = {
			__size = 4,
			rmb = 2000,
			[521.0] = 10,
			gold = 8000000,
			[21971.0] = 30
		},
		costContractMap = slot5[1402]
	},
	[1403] = {
		targetType1 = 13,
		targetDesc1 = "拥有原始盖欧卡解锁",
		id = 1403,
		exchangeTimes = 1,
		targetArg1 = 1962,
		contractCsvID = 83603,
		costItems = {
			__size = 4,
			rmb = 2000,
			[521.0] = 10,
			gold = 8000000,
			[21961.0] = 30
		},
		costContractMap = slot5[1403]
	},
	[1501] = {
		targetType1 = 128,
		targetDesc1 = "帕路奇亚达到12星解锁",
		id = 1501,
		exchangeTimes = 1,
		contractCsvID = 81602,
		costItems = {
			__size = 4,
			rmb = 1500,
			[521.0] = 10,
			gold = 6000000,
			[22361.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				2361
			}
		},
		costContractMap = slot5[1501]
	},
	[1502] = {
		targetType1 = 128,
		targetDesc1 = "雷吉奇卡斯达到12星解锁",
		id = 1502,
		exchangeTimes = 1,
		contractCsvID = 81603,
		costItems = {
			__size = 4,
			rmb = 1500,
			[521.0] = 10,
			gold = 6000000,
			[22381.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				2381
			}
		},
		costContractMap = slot5[1502]
	},
	[1504] = {
		targetType1 = 128,
		targetDesc1 = "美录坦达到12星解锁",
		id = 1504,
		exchangeTimes = 1,
		contractCsvID = 82601,
		costItems = {
			__size = 4,
			rmb = 1500,
			gold = 6000000,
			[521.0] = 10,
			[24171.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				4171
			}
		},
		costContractMap = slot5[1504]
	},
	[1505] = {
		targetType1 = 128,
		targetDesc1 = "酋雷姆达到12星解锁",
		id = 1505,
		exchangeTimes = 1,
		contractCsvID = 82602,
		costItems = {
			__size = 4,
			rmb = 1500,
			[23241.0] = 30,
			[521.0] = 10,
			gold = 6000000
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3241
			}
		},
		costContractMap = slot5[1505]
	},
	[1507] = {
		targetType1 = 128,
		targetDesc1 = "谢米达到12星解锁",
		id = 1507,
		exchangeTimes = 1,
		contractCsvID = 83601,
		costItems = {
			[22441.0] = 30,
			rmb = 1500,
			__size = 4,
			[521.0] = 10,
			gold = 6000000
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				2441
			}
		},
		costContractMap = slot5[1507]
	},
	[1508] = {
		targetType1 = 128,
		targetDesc1 = "达克莱伊达到12星解锁",
		id = 1508,
		exchangeTimes = 1,
		contractCsvID = 83602,
		costItems = {
			[22431.0] = 30,
			rmb = 1500,
			__size = 4,
			[521.0] = 10,
			gold = 6000000
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				2431
			}
		},
		costContractMap = slot5[1508]
	},
	[1509] = {
		targetType1 = 128,
		targetDesc1 = "帝牙卢卡达到12星解锁",
		id = 1509,
		exchangeTimes = 1,
		contractCsvID = 81604,
		costItems = {
			__size = 4,
			rmb = 1500,
			[521.0] = 10,
			gold = 6000000,
			[22351.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				2351
			}
		},
		costContractMap = slot5[1509]
	},
	[1510] = {
		targetType1 = 128,
		targetDesc1 = "玛夏多达到12星解锁",
		id = 1510,
		exchangeTimes = 1,
		contractCsvID = 81605,
		costItems = {
			__size = 4,
			rmb = 1500,
			[521.0] = 10,
			[24121.0] = 30,
			gold = 6000000
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				4121
			}
		},
		costContractMap = slot5[1510]
	},
	[1511] = {
		targetType1 = 128,
		targetDesc1 = "骑拉帝纳达到12星解锁",
		id = 1511,
		exchangeTimes = 1,
		contractCsvID = 82604,
		costItems = {
			__size = 4,
			rmb = 1500,
			[521.0] = 10,
			gold = 6000000,
			[22391.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				2391
			}
		},
		costContractMap = slot5[1511]
	},
	[1512] = {
		targetType1 = 128,
		targetDesc1 = "捷克罗姆达到12星解锁",
		id = 1512,
		exchangeTimes = 1,
		contractCsvID = 81606,
		costItems = {
			__size = 4,
			rmb = 1500,
			[23221.0] = 30,
			[521.0] = 10,
			gold = 6000000
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3221
			}
		},
		costContractMap = slot5[1512]
	},
	[1513] = {
		targetType1 = 128,
		targetDesc1 = "莱希拉姆达到12星解锁",
		id = 1513,
		exchangeTimes = 1,
		contractCsvID = 82605,
		costItems = {
			__size = 4,
			[23211.0] = 30,
			rmb = 1500,
			[521.0] = 10,
			gold = 6000000
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3211
			}
		},
		costContractMap = slot5[1513]
	},
	[1514] = {
		targetType1 = 128,
		targetDesc1 = "玛纳霏达到12星解锁",
		id = 1514,
		exchangeTimes = 1,
		contractCsvID = 83604,
		costItems = {
			[22421.0] = 30,
			rmb = 1500,
			__size = 4,
			[521.0] = 10,
			gold = 6000000
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				2421
			}
		},
		costContractMap = slot5[1514]
	},
	[1515] = {
		targetType1 = 128,
		targetDesc1 = "美洛耶塔达到12星解锁",
		id = 1515,
		exchangeTimes = 1,
		contractCsvID = 81607,
		costItems = {
			__size = 4,
			rmb = 1500,
			[23261.0] = 30,
			[521.0] = 10,
			gold = 6000000
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3261
			}
		},
		costContractMap = slot5[1515]
	},
	[1516] = {
		targetType1 = 128,
		targetDesc1 = "盖诺赛克特达到12星解锁",
		id = 1516,
		exchangeTimes = 1,
		contractCsvID = 81608,
		costItems = {
			__size = 4,
			rmb = 1500,
			[23271.0] = 30,
			[521.0] = 10,
			gold = 6000000
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3271
			}
		},
		costContractMap = slot5[1516]
	},
	[1517] = {
		targetType1 = 128,
		targetDesc1 = "哲尔尼亚斯达到12星解锁",
		id = 1517,
		exchangeTimes = 1,
		contractCsvID = 83605,
		costItems = {
			__size = 4,
			rmb = 1500,
			[521.0] = 10,
			[23601.0] = 30,
			gold = 6000000
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3601
			}
		},
		costContractMap = slot5[1517]
	},
	[1518] = {
		targetType1 = 128,
		redPoint = 1,
		id = 1518,
		targetDesc1 = "超梦达到12星解锁",
		exchangeTimes = 1,
		contractCsvID = 81609,
		costItems = {
			__size = 4,
			rmb = 1500,
			[521.0] = 10,
			gold = 6000000,
			[20761.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				761
			}
		},
		costContractMap = slot5[1518]
	},
	[1519] = {
		targetType1 = 128,
		redPoint = 1,
		id = 1519,
		targetDesc1 = "凤王达到12星解锁",
		exchangeTimes = 1,
		contractCsvID = 83606,
		costItems = {
			__size = 4,
			rmb = 1500,
			[521.0] = 10,
			gold = 6000000,
			[21271.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				1271
			}
		},
		costContractMap = slot5[1519]
	},
	[1520] = {
		targetType1 = 128,
		redPoint = 1,
		id = 1520,
		targetDesc1 = "洛奇亚达到12星解锁",
		exchangeTimes = 1,
		contractCsvID = 83607,
		costItems = {
			__size = 4,
			rmb = 1500,
			[521.0] = 10,
			gold = 6000000,
			[21261.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				1261
			}
		},
		costContractMap = slot5[1520]
	},
	[1601] = {
		targetType1 = 128,
		targetDesc1 = "呱呱泡蛙达到12星解锁",
		id = 1601,
		exchangeTimes = 1,
		contractCsvID = 81501,
		costItems = {
			__size = 4,
			rmb = 1000,
			[502.0] = 30,
			gold = 3000000,
			[23301.0] = 150
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3301
			}
		},
		costContractMap = slot5[1601]
	},
	[1602] = {
		targetType1 = 128,
		targetDesc1 = "飞天螳螂达到12星解锁",
		id = 1602,
		exchangeTimes = 1,
		contractCsvID = 81504,
		costItems = {
			__size = 4,
			[20571.0] = 150,
			rmb = 1000,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				571
			}
		},
		costContractMap = slot5[1602]
	},
	[1603] = {
		targetType1 = 128,
		targetDesc1 = "懒人獭达到12星解锁",
		id = 1603,
		exchangeTimes = 1,
		contractCsvID = 81502,
		costItems = {
			[21421.0] = 150,
			rmb = 1000,
			__size = 4,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				1421
			}
		},
		costContractMap = slot5[1603]
	},
	[1604] = {
		targetType1 = 128,
		targetDesc1 = "火焰鸟达到12星解锁",
		id = 1604,
		exchangeTimes = 1,
		contractCsvID = 81507,
		costItems = {
			__size = 4,
			rmb = 1000,
			gold = 3000000,
			[20741.0] = 150,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				741
			}
		},
		costContractMap = slot5[1604]
	},
	[1605] = {
		targetType1 = 128,
		targetDesc1 = "宝贝龙达到12星解锁",
		id = 1605,
		exchangeTimes = 1,
		contractCsvID = 81508,
		costItems = {
			[21891.0] = 150,
			rmb = 1000,
			__size = 4,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				1891
			}
		},
		costContractMap = slot5[1605]
	},
	[1606] = {
		targetType1 = 128,
		targetDesc1 = "利欧路达到12星解锁",
		id = 1606,
		exchangeTimes = 1,
		contractCsvID = 81509,
		costItems = {
			__size = 4,
			rmb = 1000,
			[22241.0] = 150,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				2241
			}
		},
		costContractMap = slot5[1606]
	},
	[1607] = {
		targetType1 = 128,
		targetDesc1 = "可可多拉达到12星解锁",
		id = 1607,
		exchangeTimes = 1,
		contractCsvID = 82501,
		costItems = {
			__size = 4,
			rmb = 1000,
			[502.0] = 30,
			gold = 3000000,
			[21501.0] = 150
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				1501
			}
		},
		costContractMap = slot5[1607]
	},
	[1608] = {
		targetType1 = 128,
		targetDesc1 = "小卡比兽达到12星解锁",
		id = 1608,
		exchangeTimes = 1,
		contractCsvID = 82502,
		costItems = {
			__size = 4,
			rmb = 1000,
			[20711.0] = 150,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				711
			}
		},
		costContractMap = slot5[1608]
	},
	[1609] = {
		targetType1 = 128,
		targetDesc1 = "大舌贝达到12星解锁",
		id = 1609,
		exchangeTimes = 1,
		contractCsvID = 82506,
		costItems = {
			__size = 4,
			rmb = 1000,
			gold = 3000000,
			[20381.0] = 150,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				381
			}
		},
		costContractMap = slot5[1609]
	},
	[1610] = {
		targetType1 = 128,
		targetDesc1 = "独剑鞘达到12星解锁",
		id = 1610,
		exchangeTimes = 1,
		contractCsvID = 82507,
		costItems = {
			[23411.0] = 150,
			rmb = 1000,
			__size = 4,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3411
			}
		},
		costContractMap = slot5[1610]
	},
	[1611] = {
		targetType1 = 128,
		targetDesc1 = "土地云达到12星解锁",
		id = 1611,
		exchangeTimes = 1,
		contractCsvID = 82508,
		costItems = {
			__size = 4,
			rmb = 1000,
			[23231.0] = 150,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3231
			}
		},
		costContractMap = slot5[1611]
	},
	[1612] = {
		targetType1 = 128,
		targetDesc1 = "急冻鸟达到12星解锁",
		id = 1612,
		exchangeTimes = 1,
		contractCsvID = 82509,
		costItems = {
			__size = 4,
			rmb = 1000,
			[20721.0] = 150,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				721
			}
		},
		costContractMap = slot5[1612]
	},
	[1613] = {
		targetType1 = 128,
		targetDesc1 = "花蓓蓓达到12星解锁",
		id = 1613,
		exchangeTimes = 1,
		contractCsvID = 83504,
		costItems = {
			__size = 4,
			rmb = 1000,
			[23351.0] = 150,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3351
			}
		},
		costContractMap = slot5[1613]
	},
	[1614] = {
		targetType1 = 128,
		targetDesc1 = "克雷色利亚达到12星解锁",
		id = 1614,
		exchangeTimes = 1,
		contractCsvID = 83503,
		costItems = {
			[22401.0] = 150,
			rmb = 1000,
			__size = 4,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				2401
			}
		},
		costContractMap = slot5[1614]
	},
	[1615] = {
		targetType1 = 128,
		targetDesc1 = "闪电鸟达到12星解锁",
		id = 1615,
		exchangeTimes = 1,
		contractCsvID = 83502,
		costItems = {
			__size = 4,
			rmb = 1000,
			[20731.0] = 150,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				731
			}
		},
		costContractMap = slot5[1615]
	},
	[1616] = {
		targetType1 = 128,
		targetDesc1 = "龙卷云达到12星解锁",
		id = 1616,
		exchangeTimes = 1,
		contractCsvID = 83506,
		costItems = {
			__size = 4,
			[23191.0] = 150,
			rmb = 1000,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3191
			}
		},
		costContractMap = slot5[1616]
	},
	[1617] = {
		targetType1 = 128,
		targetDesc1 = "水君达到12星解锁",
		id = 1617,
		exchangeTimes = 1,
		contractCsvID = 83507,
		costItems = {
			__size = 4,
			rmb = 1000,
			[21241.0] = 150,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				1241
			}
		},
		costContractMap = slot5[1617]
	},
	[1618] = {
		targetType1 = 128,
		targetDesc1 = "藤藤蛇达到12星解锁",
		id = 1618,
		exchangeTimes = 1,
		contractCsvID = 83509,
		costItems = {
			__size = 4,
			rmb = 1000,
			[22471.0] = 150,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				2471
			}
		},
		costContractMap = slot5[1618]
	},
	[1619] = {
		targetType1 = 128,
		targetDesc1 = "雷吉斯奇鲁达到12星解锁",
		id = 1619,
		exchangeTimes = 1,
		contractCsvID = 81510,
		costItems = {
			[21931.0] = 150,
			rmb = 1000,
			__size = 4,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				1931
			}
		},
		costContractMap = slot5[1619]
	},
	[1620] = {
		targetType1 = 128,
		targetDesc1 = "雷吉洛克达到12星解锁",
		id = 1620,
		exchangeTimes = 1,
		contractCsvID = 82510,
		costItems = {
			[21911.0] = 150,
			rmb = 1000,
			__size = 4,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				1911
			}
		},
		costContractMap = slot5[1620]
	},
	[1621] = {
		targetType1 = 128,
		targetDesc1 = "雷吉艾斯达到12星解锁",
		id = 1621,
		exchangeTimes = 1,
		contractCsvID = 83510,
		costItems = {
			[21921.0] = 150,
			rmb = 1000,
			__size = 4,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				1921
			}
		},
		costContractMap = slot5[1621]
	},
	[1622] = {
		targetType1 = 128,
		targetDesc1 = "代拉基翁达到12星解锁",
		id = 1622,
		exchangeTimes = 1,
		contractCsvID = 81511,
		costItems = {
			__size = 4,
			[23171.0] = 150,
			rmb = 1000,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3171
			}
		},
		costContractMap = slot5[1622]
	},
	[1623] = {
		targetType1 = 128,
		targetDesc1 = "毕力吉翁达到12星解锁",
		id = 1623,
		exchangeTimes = 1,
		contractCsvID = 81512,
		costItems = {
			__size = 4,
			[23181.0] = 150,
			rmb = 1000,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3181
			}
		},
		costContractMap = slot5[1623]
	},
	[1624] = {
		targetType1 = 128,
		targetDesc1 = "勾帕路翁达到12星解锁",
		id = 1624,
		exchangeTimes = 1,
		contractCsvID = 82511,
		costItems = {
			__size = 4,
			rmb = 1000,
			[23161.0] = 150,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3161
			}
		},
		costContractMap = slot5[1624]
	},
	[1625] = {
		targetType1 = 128,
		targetDesc1 = "拉帝欧斯达到12星解锁",
		id = 1625,
		exchangeTimes = 1,
		contractCsvID = 81513,
		costItems = {
			[21951.0] = 150,
			rmb = 1000,
			__size = 4,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				1951
			}
		},
		costContractMap = slot5[1625]
	},
	[1626] = {
		targetType1 = 128,
		targetDesc1 = "拉帝亚斯达到12星解锁",
		id = 1626,
		exchangeTimes = 1,
		contractCsvID = 83511,
		costItems = {
			[21941.0] = 150,
			rmb = 1000,
			__size = 4,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				1941
			}
		},
		costContractMap = slot5[1626]
	},
	[1627] = {
		targetType1 = 128,
		targetDesc1 = "甜竹竹达到12星解锁",
		id = 1627,
		exchangeTimes = 1,
		contractCsvID = 81514,
		costItems = {
			__size = 4,
			rmb = 1000,
			[23841.0] = 150,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3841
			}
		},
		costContractMap = slot5[1627]
	},
	[1628] = {
		targetType1 = 128,
		targetDesc1 = "木木枭达到12星解锁",
		id = 1628,
		exchangeTimes = 1,
		contractCsvID = 81515,
		costItems = {
			__size = 4,
			rmb = 1000,
			gold = 3000000,
			[23661.0] = 150,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3661
			}
		},
		costContractMap = slot5[1628]
	},
	[1629] = {
		targetType1 = 128,
		targetDesc1 = "纸御剑达到12星解锁",
		id = 1629,
		exchangeTimes = 1,
		contractCsvID = 81516,
		costItems = {
			__size = 4,
			rmb = 1000,
			[24081.0] = 150,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				4081
			}
		},
		costContractMap = slot5[1629]
	},
	[1630] = {
		targetType1 = 128,
		targetDesc1 = "黏黏宝达到12星解锁",
		id = 1630,
		exchangeTimes = 1,
		contractCsvID = 82512,
		costItems = {
			__size = 4,
			rmb = 1000,
			gold = 3000000,
			[23541.0] = 150,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3541
			}
		},
		costContractMap = slot5[1630]
	},
	[1631] = {
		targetType1 = 128,
		targetDesc1 = "球球海狮达到12星解锁",
		id = 1631,
		exchangeTimes = 1,
		contractCsvID = 83512,
		costItems = {
			__size = 4,
			[23681.0] = 150,
			rmb = 1000,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3681
			}
		},
		costContractMap = slot5[1631]
	},
	[1632] = {
		targetType1 = 128,
		targetDesc1 = "雷电云达到12星解锁",
		id = 1632,
		exchangeTimes = 1,
		contractCsvID = 83513,
		costItems = {
			__size = 4,
			rmb = 1000,
			[23201.0] = 150,
			gold = 3000000,
			[502.0] = 30
		},
		targetParam1 = {
			__size = 1,
			[12] = {
				3201
			}
		},
		costContractMap = slot5[1632]
	},
	__default = {
		__index = {
			targetType1 = 0,
			exchangeTimes = 2,
			targetArg2 = 1,
			targetArg1 = 1,
			redPoint = 0,
			targetDesc3 = "",
			targetType2 = 0,
			contractCsvID = 0,
			targetDesc1 = "",
			targetType3 = 0,
			onlyShow = 0,
			targetArg3 = 1,
			targetDesc2 = "",
			targetParam3 = ({
				default = slot0[1]
			}).default,
			costItems = slot2.default,
			targetParam2 = ({
				default = slot0[1]
			}).default,
			targetParam1 = ({
				default = slot0[1]
			}).default,
			costContractMap = slot5.default,
			pos = {
				__size = 2,
				x = 0,
				y = 0
			}
		}
	}
}

return csv.contract.activate_book
