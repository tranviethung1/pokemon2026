slot0 = {}
globals.game = slot0
slot0.TRIAL_MODEL = true
slot0.GAME_SYNC_TIME = 1500
slot0.VIP_LIMIT = 15
slot0.VIP_SUPREME = 19
slot0.STAMINA_LIMIT = 3000
slot0.STAMINA_COLD_TIME = 300
slot0.FRIEND_LIMIT = 60
slot0.FRIEND_STAMINA_GET_TIMES = 20
slot0.MAIL_LIMIT = 60
slot0.NVALUE_ATTR_LIMIT = 31
slot0.RACE_ATTR_LIMIT = 255
slot0.FRAME_TICK = 16.666666666666668
slot0.SERVER_OPENTIME = 0
slot0.FISHING_GAME = 999
slot0.WEATHER = true
slot0.SKIN_ADD_NUM = 100000
slot0.NATURE_ENUM_TABLE = {
	water = 3,
	fire = 2,
	normal = 1,
	combat = 7,
	poison = 8,
	ground = 9,
	worm = 12,
	fairy = 18,
	ice = 6,
	super = 11,
	evil = 16,
	grass = 4,
	ghost = 14,
	fly = 10,
	dragon = 15,
	rock = 13,
	electricity = 5,
	steel = 17
}
slot0.NATURE_TABLE = {}

for slot4, slot5 in pairs(slot0.NATURE_ENUM_TABLE) do
	slot0.NATURE_TABLE[slot5] = slot4
end

slot0.ONESELF_NATURE_ENUM_TABLE = {
	attrHp = 1,
	attrSpeed = 13,
	attrSpecialDamage = 8,
	attrDefence = 9,
	attrDamage = 7,
	attrSpecialDefence = 10
}
slot0.ATTRDEF_ENUM_TABLE = {
	specialDefence = 10,
	finalDamageReduce = 99,
	mp1Recover = 5,
	damageSub = 23,
	iceCure = 77,
	superDamageSub = 64,
	physicalDamageAdd = 32,
	immuneControl = 91,
	rockDamageSub = 66,
	controlPer = 90,
	mp2Recover = 6,
	combatCure = 78,
	specialDamageAdd = 34,
	electricityCure = 76,
	fireCure = 73,
	rebound = 27,
	defence = 9,
	pvpDamageSub = 93,
	evilDamageSub = 69,
	rockCure = 84,
	block = 17,
	normalDamageSub = 54,
	electricityDamageSub = 58,
	steelDamageAdd = 52,
	dragonCure = 86,
	fairyDamageSub = 71,
	grassDamageAdd = 39,
	grassDamageSub = 57,
	fairyCure = 89,
	iceDamageAdd = 41,
	superCure = 82,
	steelDamageSub = 70,
	hpRecover = 4,
	combatDamageSub = 60,
	finalDamageDeepen = 98,
	evilDamageAdd = 51,
	groundDamageSub = 62,
	wormDamageAdd = 47,
	wormCure = 83,
	poisonDamageSub = 61,
	specialDefenceIgnore = 12,
	normalDamageAdd = 36,
	flyDamageAdd = 45,
	fairyDamageAdd = 53,
	dragonDamageAdd = 50,
	rockDamageAdd = 48,
	initMp1 = 3,
	hit = 21,
	damageAdd = 22,
	combatDamageAdd = 42,
	wormDamageSub = 65,
	fireDamageAdd = 37,
	poisonCure = 79,
	groundCure = 80,
	waterCure = 74,
	superDamageAdd = 46,
	evilCure = 87,
	strikeDamage = 15,
	cure = 28,
	natureRestraint = 29,
	damageDeepen = 30,
	flyDamageSub = 63,
	flyCure = 81,
	poisonDamageAdd = 43,
	physicalDamageSub = 33,
	strikeResistance = 16,
	finalDamageSub = 97,
	damage = 7,
	grassCure = 75,
	strike = 14,
	steelCure = 88,
	speed = 13,
	dragonDamageSub = 68,
	hp = 1,
	damageHit = 94,
	suckBlood = 26,
	breakBlock = 18,
	damageReduce = 31,
	normalCure = 72,
	defenceIgnore = 11,
	ultimateAdd = 24,
	ultimateSub = 25,
	dodge = 20,
	fireDamageSub = 55,
	specialDamage = 8,
	pvpDamageAdd = 92,
	iceDamageSub = 59,
	damageDodge = 95,
	waterDamageAdd = 38,
	groundDamageAdd = 44,
	mp1 = 2,
	waterDamageSub = 56,
	ghostDamageSub = 67,
	electricityDamageAdd = 40,
	blockPower = 19,
	finalDamageAdd = 96,
	ghostCure = 85,
	ghostDamageAdd = 49,
	specialDamageSub = 35
}
slot0.ATTRDEF_TABLE = {}

for slot4, slot5 in pairs(slot0.ATTRDEF_ENUM_TABLE) do
	slot0.ATTRDEF_TABLE[slot5] = slot4
end

slot0.ATTRDEF_SHOW_NUMBER = {
	[slot0.ATTRDEF_ENUM_TABLE.hp] = true,
	[slot0.ATTRDEF_ENUM_TABLE.mp1] = true,
	[slot0.ATTRDEF_ENUM_TABLE.initMp1] = true,
	[slot0.ATTRDEF_ENUM_TABLE.hpRecover] = true,
	[slot0.ATTRDEF_ENUM_TABLE.damage] = true,
	[slot0.ATTRDEF_ENUM_TABLE.specialDamage] = true,
	[slot0.ATTRDEF_ENUM_TABLE.defence] = true,
	[slot0.ATTRDEF_ENUM_TABLE.specialDefence] = true,
	[slot0.ATTRDEF_ENUM_TABLE.speed] = true
}
slot0.ATTRDEF_SIMPLE_ENUM_TABLE = {
	speed = 2,
	specialDamage = 5,
	hp = 1,
	defence = 4,
	damage = 3,
	specialDefence = 6
}
slot0.ATTRDEF_SIMPLE_TABLE = {}

for slot4, slot5 in pairs(slot0.ATTRDEF_SIMPLE_ENUM_TABLE) do
	slot0.ATTRDEF_SIMPLE_TABLE[slot5] = slot4
end

slot0.GENDER_ENUM_TABLE = {
	female = 2,
	male = 1,
	none = 0
}
slot0.GENDER_TABLE = {}

for slot4, slot5 in pairs(slot0.GENDER_ENUM_TABLE) do
	slot0.GENDER_TABLE[slot5] = slot4
end

slot0.ITEM_STRING_ENUM_TABLE = {
	coin10 = 422,
	rmb = 402,
	coin19 = 433,
	vip = 404,
	role_exp = 400,
	coin18 = 432,
	stamina = 403,
	equip_awake_frag = 407,
	coin15 = 429,
	skill_point = 424,
	coin2 = 412,
	talent_point = 406,
	coin13 = 427,
	coin16 = 430,
	coin6 = 416,
	coin20 = 434,
	coin9 = 421,
	coin11 = 423,
	coin14 = 428,
	coin22 = 436,
	coin3 = 413,
	gold = 401,
	coin4 = 414,
	coin7 = 419,
	coin12 = 425,
	coin17 = 431,
	contrib = 408,
	vip_exp = 405,
	coin1 = 411,
	gym_talent_point = 426,
	coin21 = 435,
	coin5 = 415,
	coin8 = 420
}
slot0.ITEM_STRING_TABLE = {}

for slot4, slot5 in pairs(slot0.ITEM_STRING_ENUM_TABLE) do
	slot0.ITEM_STRING_TABLE[slot5] = slot4
end

slot0.ITEM_STRING_ENUM_TABLE.recharge_rmb = 402
slot0.ITEM_TICKET = {
	rmbCard = 519,
	goldCard = 518,
	passportVipCoin = 533,
	diamondUpCard = 527,
	card4 = 520,
	shopRefresh = 522,
	luckyEggScore = 6321,
	luckyEggCard = 6320,
	totemCard = 541,
	rmbGem = 531,
	goldGem = 530,
	passportCoin = 532,
	pvpTicket = 517,
	skinCard = 536,
	limitCard = 526,
	chipCard = 537,
	equipCard = 503
}
slot0.ITEM_EXP_HASH = arraytools.hash({
	399,
	"role_exp",
	"vip",
	"vip_exp",
	"contrib",
	417,
	437
})
slot0.QUALITY_TO_FITST_ADVANCE = {
	1,
	2,
	5,
	9,
	14,
	20,
	26
}
slot0.QUALITY_MAX = #slot0.QUALITY_TO_FITST_ADVANCE
slot0.ITEM_CSVID_LIMIT = 10000
slot0.EQUIP_CSVID_LIMIT = 20000
slot0.FRAGMENT_CSVID_LIMIT = 30000
slot0.HELD_ITEM_CSVID_LIMIT = 40000
slot0.GEM_CSVID_LIMIT = 50000
slot0.ZAWAKE_FRAGMENT_CSVID_LIMIT = 60000
slot0.CHIP_CSVID_LIMIT = 70000
slot0.FURNITURE_CSVID_LIMIT = 80000
slot0.CONTRACT_CSVID_LIMIT = 90000
slot0.ITEM_TYPE_ENUM_TABLE = {
	qixiType = 21,
	key = 6,
	equipStarUp = 8,
	cardExp = 1,
	material = 5,
	skin = 15,
	feelExp = 9,
	gift = 3,
	drawItemManualType = 23,
	chooseGift = 16,
	staminaRecover = 2,
	normal = 0,
	totemType = 20,
	equipExp = 4,
	drawItemAutoType = 22,
	characterType = 18,
	roleDisplayType = 17,
	randomGift = 7,
	randomGiftOpen = 10
}
slot0.ITEM_NUM_HIDE_TYPE_HASH = arraytools.hash({
	slot0.ITEM_TYPE_ENUM_TABLE.roleDisplayType,
	slot0.ITEM_TYPE_ENUM_TABLE.qixiType
})
slot0.SPRITE_BALL_ID = {
	nightmare = 525,
	hero = 524,
	normal = 523
}
slot0.BRAVE_CHALLENGE_TYPE = {
	anniversary = 1,
	common = 2
}
slot0.YYHUODONG_TYPE_ENUM_TABLE = {
	itemExchange = 12,
	luckyDraw = 84,
	loginWeal = 2,
	clientShow = 8,
	worldBoss = 26,
	huoDongBoss = 49,
	elementCrush = 74,
	dailyBuy = 19,
	rechargeReset = 31,
	vipAward = 10,
	weeklyCard = 43,
	contestBet = 78,
	luckyEgg = 40,
	worldcup = 77,
	vipGift2 = 82,
	onceRechageAward = 28,
	praise = 76,
	halloween = 50,
	seekpokemon = 71,
	rmbCost = 13,
	double11 = 51,
	itemBuy = 23,
	fightRank = 16,
	timeLimitBox = 20,
	passport = 35,
	volleyball = 68,
	monthlyCard = 6,
	qixi = 80,
	gridWalk = 60,
	limitDrop = -3,
	skyScraper = 55,
	qualityExchange = 47,
	gateAward = 9,
	game2048 = 29,
	flipCard = 48,
	serverOpen = 15,
	huodongCrossRedPacket = 57,
	dinnerTime = 7,
	everyDayLogin = -1,
	directBuyGift = 33,
	flipNewYear = 56,
	rechargeGift = 4,
	generalTask = 14,
	braveChallenge = 61,
	rmbgoldReward = 58,
	levelFund = 22,
	customizeGift = 70,
	vipBuy = 21,
	shavedIce = 66,
	Retrieve = 41,
	collectCard = 18,
	reunion = 46,
	doubleDrop = -2,
	summerChallenge = 67,
	livenessWheel = 39,
	horseRace = 62,
	timeLimitDraw = 5,
	spriteUnfreeze = 54,
	luckyCat = 17,
	gameEatGreenBlock = 30,
	baoZongzi = 45,
	dailyRandomGift = 85,
	levelAward = 3,
	timeLimitUpDraw = 36,
	festival = 42,
	rechargeWheel = 38,
	limitBuyGift = 34,
	gameGoDown100 = 32,
	firstRecharge = 1,
	lightingNewYear = 72,
	roleDayAward = 75,
	itemBuy2 = 63,
	exclusiveLimit = 64,
	LoginGift = 37,
	midAutumnDraw = 69,
	playPassport = 59,
	huoDongCloth = 52,
	yyClone = 24,
	mitu = 83,
	regainStamina = 27,
	breakEgg = 25,
	snowBall = 53,
	yyBet = 73,
	dispatch = 65,
	spritejump = 79,
	gemUp = 44
}
slot0.MESSAGE_TYPE_DEFS = {
	worldCardShare = 11,
	unionJoinUp = 1,
	roleChat = 8,
	worldCloneInvite = 12,
	worldChat = 6,
	breakEgg = 5,
	roleUnion = 3,
	news = 9,
	unionCardShare = 15,
	official = 20,
	cloneInvite = 2,
	battleShare = 10,
	normal = 0,
	friendCloneInvite = 14,
	unionChat = 7,
	yyHuoDongRedPacketType = 16,
	marqueeType = 17,
	recommendReunionInvite = 19,
	unionPlay = 4,
	worldReunionInvite = 18,
	unionCloneInvite = 13
}
slot0.MESSAGE_SHOW_TYPE = {
	[slot0.MESSAGE_TYPE_DEFS.normal] = {
		1
	},
	[slot0.MESSAGE_TYPE_DEFS.unionJoinUp] = {
		1
	},
	[slot0.MESSAGE_TYPE_DEFS.cloneInvite] = {
		1
	},
	[slot0.MESSAGE_TYPE_DEFS.roleUnion] = {
		1
	},
	[slot0.MESSAGE_TYPE_DEFS.unionPlay] = {
		1
	},
	[slot0.MESSAGE_TYPE_DEFS.breakEgg] = {
		1
	},
	[slot0.MESSAGE_TYPE_DEFS.worldChat] = {
		2,
		3
	},
	[slot0.MESSAGE_TYPE_DEFS.unionChat] = {
		2,
		3
	},
	[slot0.MESSAGE_TYPE_DEFS.roleChat] = {
		2,
		3
	},
	[slot0.MESSAGE_TYPE_DEFS.news] = {
		1
	},
	[slot0.MESSAGE_TYPE_DEFS.battleShare] = {
		4
	},
	[slot0.MESSAGE_TYPE_DEFS.worldCloneInvite] = {
		4
	},
	[slot0.MESSAGE_TYPE_DEFS.unionCloneInvite] = {
		4
	},
	[slot0.MESSAGE_TYPE_DEFS.friendCloneInvite] = {
		4
	},
	[slot0.MESSAGE_TYPE_DEFS.worldCardShare] = {
		4
	},
	[slot0.MESSAGE_TYPE_DEFS.unionCardShare] = {
		4
	},
	[slot0.MESSAGE_TYPE_DEFS.yyHuoDongRedPacketType] = {
		4
	},
	[slot0.MESSAGE_TYPE_DEFS.marqueeType] = {
		1
	},
	[slot0.MESSAGE_TYPE_DEFS.worldReunionInvite] = {
		4
	},
	[slot0.MESSAGE_TYPE_DEFS.recommendReunionInvite] = {
		4
	},
	[slot0.MESSAGE_TYPE_DEFS.official] = {
		4
	}
}
slot0.GATE_TYPE = {
	mimicry = 32,
	worldBoss = 15,
	fragment = 8,
	dailyGold = 3,
	battlebet = 30,
	gift = 7,
	crossUnionAdventure = 34,
	unionFight = 13,
	bondEvolution = 31,
	contestbet = 33,
	unionFuben = 6,
	crossArena = 17,
	clone = 12,
	crossMine = 23,
	crossOnlineFight = 21,
	huoDongBoss = 22,
	summerChallenge = 27,
	friendFight = 9,
	randomTower = 11,
	crossSupremacy = 29,
	hunting = 26,
	experience = 36,
	skillTest = 99,
	gym = 18,
	endlessTower = 5,
	simpleActivity = 16,
	newbie = 999,
	crossMineBoss = 24,
	crossUnionFight = 28,
	craft = 10,
	dailyContract = 35,
	normal = 1,
	crossCraft = 14,
	crossGym = 20,
	braveChallenge = 25,
	dailyExp = 4,
	test = 0,
	arena = 2,
	gymLeader = 19,
	hellRandomTower = 37
}
slot0.GATE_TYPE_STRING_TABLE = {}

for slot4, slot5 in pairs(slot0.GATE_TYPE) do
	slot0.GATE_TYPE_STRING_TABLE[slot5] = slot4
end

slot0.SCENE_TYPE = {
	summerChallenge = 21,
	braveChallenge = 19,
	gymPvp = 16,
	crossMineBoss = 18,
	crossMine = 17,
	unionFight = 9,
	worldBoss = 11,
	unionFuben = 5,
	craft = 6,
	crossArena = 12,
	clone = 7,
	city = 0,
	crossCraft = 10,
	randomTower = 8,
	huoDongBoss = 15,
	gate = 1,
	hunting = 20,
	huodongFuben = 3,
	arena = 2,
	crossOnlineFight = 13,
	gym = 14,
	endlessTower = 4
}
slot0.TALENT_TYPE = {
	sceneType = 6,
	cardsAll = 3,
	battleBack = 2,
	battleFront = 1,
	cardNatureType = 4
}
slot0.EMBATTLE_FROM_TABLE = {
	mimicry = "mimicry",
	huodongBoss = "huodongBoss",
	gymChallenge = "gymChallenge",
	ready = "ready",
	default = "default",
	supermacyElite = "supermacyElite",
	strangeMeteor = "strangeMeteor",
	hunting = "hunting",
	hellRandomTowerReady = "hellRandomTowerReady",
	onekey = "onekey",
	arena = "arena",
	onlineFight = "onlineFight",
	huodong = "huodong",
	hellRandomTower = "hellRandomTower",
	input = "input"
}
slot0.EMBATTLE_GYMCHALLENGE_ID = {
	pve = "pve",
	pvp = "pvp"
}
slot0.SCENE_TYPE_STRING_TABLE = {}

for slot4, slot5 in pairs(slot0.SCENE_TYPE) do
	slot0.SCENE_TYPE_STRING_TABLE[slot5] = slot4
end

slot0.NUM_TYPE = {
	percent = 0,
	number = 1
}
slot0.SELL_TYPE = {
	auto = 1,
	hand = 0
}
slot0.TARGET_TYPE = {
	ArenaBattle = 41,
	ContractConvertCount = 135,
	NightmareGateChanllenge = 31,
	RandomTowerFloorTimes = 64,
	CardsTotal = 3,
	DispatchTaskDone = 85,
	CardSkillUp = 34,
	EquipStar = 40,
	TrainerLevel = 79,
	CardAdvance = 35,
	UnionContrib = 55,
	UnionContribSum = 75,
	EndlessChallenge = 93,
	EffortSeniorTrainTimes = 91,
	GainGold = 19,
	ArenaBattleWin = 42,
	DrawGemUp = 106,
	Friends = 78,
	ReunionFriend = 111,
	EquipAdvance = 39,
	DrawEquip = 52,
	ItemBuy = 72,
	CardLevelUp = 36,
	CaptureSuccessSum = 81,
	DrawCardUpAndRMB = 96,
	RandomTowerBoxOpen = 61,
	ExplorerComponentStrength = 83,
	ExplorerAdvance = 84,
	LianjinTimes = 18,
	CardAdvanceCount = 9,
	CardAdvanceTotalTimes = 7,
	DailyTaskAchieve = 71,
	UnionFuben = 59,
	HeldItemAdvance = 88,
	DrawCardGold1 = 49,
	UnlockPokedex = 76,
	ArenaPoint = 43,
	GateChanllenge = 29,
	EndlessPassed = 77,
	DailyTaskFinish = 70,
	RechargeRmb = 22,
	GiveStaminaTimes = 27,
	EquipStarCount = 12,
	HeldItemStrength = 87,
	ShareTimes = 23,
	CaptureLevel = 80,
	UnionSpeedup = 56,
	BuyStaminaTimes = 26,
	CostStamina = 28,
	FightingPoint = 6,
	HuodongChanllenge = 32,
	SigninTimes = 25,
	CloneBattleTimes = 66,
	DrawEquipRMB10 = 53,
	EffortGeneralTrainTimes = 90,
	WorldBossBattleTimes = 65,
	Top6FightingPoint = 97,
	UnionFragDonate = 98,
	ArenaRank = 44,
	TalentPointCost = 99,
	DrawGemGold = 104,
	DrawCardGold10 = 48,
	DrawGem = 105,
	RandomTowerTimes = 60,
	DrawCardRMB1 = 47,
	DrawCardRMB = 50,
	CooperateClone = 110,
	HadCard = 13,
	CardStar = 37,
	CraftSignup = 102,
	CardAbilityStrength = 92,
	DrawEquipRMB1 = 54,
	RandomTowerPointDaily = 62,
	DrawChip = 117,
	CompleteImmediate = 15,
	GateStar = 8,
	AutoChess = 124,
	DispatchTask = 101,
	GateSum = 33,
	CostRmb = 21,
	RandomTowerPoint = 63,
	UnionDailyGiftTimes = 74,
	RandomTowerBattle = 127,
	CardStarCount = 10,
	TotemCount = 134,
	RandomTowerBattleClearance = 130,
	MimicryBattle = 136,
	DrawCardUp = 95,
	DispatchTaskQualityDone = 86,
	UnionSendPacket = 57,
	EffortTrainTimes = 89,
	DailyAllOnlineGift = 126,
	DrawGemUpAndRMB = 107,
	MarkCardAdvanceCount = 129,
	DrawGemRMB = 103,
	GainCardTimes = 14,
	HuntingSpecialPass = 114,
	Explorer = 82,
	CostGold = 20,
	EquipStrength = 38,
	RandomTowerBattleWin = 100,
	RandomTowerFloorSum = 112,
	Level = 1,
	EquipAdvanceCount = 11,
	FishingTimes = 108,
	MedalGroupDone = 132,
	YYHuodongOpen = 73,
	HeroGateChanllenge = 30,
	GymPassCount = 133,
	MarkCardStarCount = 128,
	Gate = 2,
	RandomTowerFloorMax = 67,
	DrawChipRMB = 115,
	CardGainTotalTimes = 4,
	Vip = 5,
	FishingWinTimes = 109,
	DrawChipItem = 116,
	DrawTotem = 123,
	DrawCard = 45,
	HuntingPass = 113,
	DailyLivenessPoint = 125,
	CrossCraftSignup = 131,
	DrawItem = 94,
	DrawCardRMB10 = 46,
	OnlineDuration = 16,
	LoginDays = 17,
	DrawCardGold = 51,
	UnionRobPacket = 58
}
slot0.EMBATTLE_HOUDONG_ID = {
	nightmare = -2,
	randomTower = -1,
	unionGate = -3,
	crossMineBoss = -6,
	worldBoss = -4,
	endlessTower = -5
}
slot0.PRIVILEGE_TYPE = {
	HeroGateGoldDropRate = 19,
	DrawItemFreeTimes = 21,
	ExpItemCostFallRate = 9,
	TrainerAttrSkills = 10,
	HuodongTypeGoldTimes = 7,
	HuodongTypeFragTimes = 25,
	LianjinFreeTimes = 12,
	BattleSkip = 5,
	HuodongTypeGiftTimes = 23,
	GateGoldDropRate = 18,
	DailyTaskExpRate = 6,
	UnionContribCoinRate = 17,
	FreeGoldDrawCardTimes = 11,
	HuodongTypeGiftDropRate = 24,
	LianjinBuyTimes = 4,
	FirstRMBDrawItemHalf = 27,
	HuodongTypeContractTimes = 28,
	StaminaMax = 2,
	FirstRMBDrawCardHalf = 1,
	HuodongTypeExpDropRate = 16,
	DispatchTaskFreeRefreshTimes = 22,
	HuodongTypeContractDropRate = 29,
	HuodongTypeGoldDropRate = 15,
	HuodongTypeExpTimes = 8,
	StaminaBuyTimes = 3,
	StaminaGain = 14,
	HuodongTypeFragDropRate = 26,
	GateSaoDangTimes = 20,
	LianjinDropRate = 13
}
slot0.PRIVILEGE_TYPE_STRING_TABLE = {}

for slot4, slot5 in pairs(slot0.PRIVILEGE_TYPE) do
	slot0.PRIVILEGE_TYPE_STRING_TABLE[slot5] = slot4
end

slot0.DOUBLE_HUODONG = {
	gateDrop = 1,
	giftActivity = 4,
	randomGold = 10,
	buyStamina = 7,
	endlessSaodang = 9,
	fragActivity = 5,
	contractActivity = 11,
	heroGateTimes = 8,
	expActivity = 3,
	buyGold = 6,
	goldActivity = 2
}
slot0.REUNION_DOUBLE = {
	doubleBuyStamina = 4,
	endlessSaodang = 2,
	huodongCount = 1,
	doubleDropGate = 3,
	doubleLianjin = 5
}
slot0.NORMAL_TO_REUNION = {
	[slot0.DOUBLE_HUODONG.gateDrop] = slot0.REUNION_DOUBLE.doubleDropGate,
	[slot0.DOUBLE_HUODONG.endlessSaodang] = slot0.REUNION_DOUBLE.endlessSaodang,
	[slot0.DOUBLE_HUODONG.goldActivity] = slot0.REUNION_DOUBLE.huodongCount,
	[slot0.DOUBLE_HUODONG.expActivity] = slot0.REUNION_DOUBLE.huodongCount,
	[slot0.DOUBLE_HUODONG.giftActivity] = slot0.REUNION_DOUBLE.huodongCount,
	[slot0.DOUBLE_HUODONG.fragActivity] = slot0.REUNION_DOUBLE.huodongCount,
	[slot0.DOUBLE_HUODONG.buyStamina] = slot0.REUNION_DOUBLE.doubleBuyStamina,
	[slot0.DOUBLE_HUODONG.buyGold] = slot0.REUNION_DOUBLE.doubleLianjin
}
slot0.CROSS_CRAFT_ROUNDS = {
	"closed",
	"signup",
	"prepare",
	"pre11",
	"pre11_lock",
	"pre12",
	"pre12_lock",
	"pre13",
	"pre13_lock",
	"pre14",
	"pre14_lock",
	"pre21",
	"pre21_lock",
	"pre22",
	"pre22_lock",
	"pre23",
	"pre23_lock",
	"pre24",
	"pre24_lock",
	"halftime",
	"prepare2",
	"pre31",
	"pre31_lock",
	"pre32",
	"pre32_lock",
	"pre33",
	"pre33_lock",
	"pre34",
	"pre34_lock",
	"top64",
	"top64_lock",
	"top32",
	"top32_lock",
	"top16",
	"top16_lock",
	"final1",
	"final1_lock",
	"final2",
	"final2_lock",
	"final3",
	"final3_lock"
}
slot0.CROSS_CRAFT_ROUND_STATE = {
	closed = {},
	signup = {
		time = 31800
	},
	prepare = {
		time = 600
	},
	pre11 = {
		time = 180
	},
	pre11_lock = {
		time = 60
	},
	pre12 = {
		time = 180
	},
	pre12_lock = {
		time = 60
	},
	pre13 = {
		time = 180
	},
	pre13_lock = {
		time = 60
	},
	pre14 = {
		time = 180
	},
	pre14_lock = {
		time = 60
	},
	pre21 = {
		time = 180
	},
	pre21_lock = {
		time = 60
	},
	pre22 = {
		time = 180
	},
	pre22_lock = {
		time = 60
	},
	pre23 = {
		time = 180
	},
	pre23_lock = {
		time = 60
	},
	pre24 = {
		time = 180
	},
	pre24_lock = {
		time = 60
	},
	halftime = {
		time = 83880
	},
	prepare2 = {
		time = 600
	},
	pre31 = {
		time = 180
	},
	pre31_lock = {
		time = 60
	},
	pre32 = {
		time = 180
	},
	pre32_lock = {
		time = 60
	},
	pre33 = {
		time = 180
	},
	pre33_lock = {
		time = 60
	},
	pre34 = {
		time = 180
	},
	pre34_lock = {
		time = 60
	},
	top64 = {
		time = 240
	},
	top64_lock = {
		time = 60
	},
	top32 = {
		time = 240
	},
	top32_lock = {
		time = 60
	},
	top16 = {
		time = 240
	},
	top16_lock = {
		time = 60
	},
	final1 = {
		time = 240
	},
	final1_lock = {
		time = 60
	},
	final2 = {
		time = 240
	},
	final2_lock = {
		time = 60
	},
	final3 = {
		time = 240
	},
	final3_lock = {
		time = 60
	}
}
slot0.RANDOM_TOWER_JUMP_STATE = {
	POINT = 1,
	EVENT = 4,
	BOX = 2,
	BUFF = 3,
	BEGIN = 0,
	OVER = 5
}
slot0.HUNTING_JUMP_STATE = {
	POINT = 1,
	BEGIN = 0,
	BOX = 2,
	BUFF = 3,
	OVER = 4
}
slot0.BRAVE_CHALLENGE_JUMP_STATE = {
	OVER = 3,
	BEGIN = 0,
	POINT = 1,
	BUFF = 2
}
slot0.DEPLOY_TYPE = {
	WheelType = 3,
	OneByOneType = 2,
	GeneralType = 1
}
slot0.SYNC_SCENE_STATE = {
	deploy = 3,
	unknown = 0,
	banpick = 2,
	waitloading = 4,
	attack = 5,
	start = 1,
	waitresult = 6,
	battleover = 7
}
slot0.TOWN_COIN = {
	GANGJIEGOU = 8203,
	MUCAI = 8202,
	TIANDIAN = 8201
}
slot0.SHOP_INIT = {
	UNION_FIGHT_SHOP = 9,
	CROSS_SUPREMACY_SHOP = 17,
	CROSS_UNION_ADVENTURE_SHOP = 21,
	FIX_SHOP = 1,
	SIGNIN_SHOP = 20,
	HUNTING_SHOP = 16,
	ONLINE_FIGHT_SHOP = 13,
	CRAFT_SHOP = 7,
	EQUIP_SHOP = 8,
	AUTO_CHESS_SHOP = 19,
	SKIN_SHOP = 14,
	UNION_SHOP = 2,
	TOTEM_SHOP = 18,
	RANDOM_TOWER_SHOP = 6,
	CROSS_ARENA_SHOP = 11,
	CROSS_CRAFT_SHOP = 10,
	FISHING_SHOP = 12,
	EXPLORER_SHOP = 5,
	CROSS_MINE_SHOP = 15,
	FRAG_SHOP = 3,
	PVP_SHOP = 4
}
slot0.SHOP_GET_PROTOL = {
	"/game/fixshop/get",
	"/game/union/shop/get",
	"/game/frag/shop/get",
	nil,
	"/game/explorer/shop/get",
	"/game/random_tower/shop/get",
	nil,
	"/game/equipshop/get",
	nil,
	nil,
	nil,
	"/game/fishing/shop/get",
	[18.0] = "/game/totem/shop/get"
}
slot0.SHOP_UNLOCK_KEY = {
	{},
	{
		unlockKey = "unionShop",
		mustHaveUion = true
	},
	{
		unlockKey = "fragmentShop"
	},
	{
		unlockKey = "arenaShop"
	},
	{
		unlockKey = "explorer"
	},
	{
		unlockKey = "randomTower"
	},
	{
		unlockKey = "craft"
	},
	{
		unlockKey = "drawEquip"
	},
	{
		unlockKey = "unionFight",
		mustHaveUion = true
	},
	{
		unlockKey = "crossCraft"
	},
	[12] = {
		unlockKey = "fishing"
	},
	[13] = {
		unlockKey = "onlineFight"
	},
	[14] = {
		unlockKey = "skinShop"
	},
	[15] = {
		unlockKey = "crossMine"
	},
	[16] = {
		unlockKey = "hunting"
	},
	[17] = {
		unlockKey = "crossSupremacy"
	},
	[18] = {
		unlockKey = "totem"
	},
	[19] = {
		unlockKey = "autoChess"
	},
	[20] = {
		unlockKey = "signInShop"
	},
	[21] = {
		unlockKey = "crossUnionAdventure",
		mustHaveUion = true
	}
}
slot0.TOWN_CARD_STATE = {
	PARTYRECOVERED = 101,
	PRODUCTION_THREE1 = 9,
	PRODUCTION_THREE = 4,
	ANENERGIA = 100,
	PRODUCTION_FOUR = 5,
	FINANCIAL_CENTER = 6,
	TOWN = 1,
	REST = 2,
	ADVENTURE = 7,
	IDLE = 0,
	TEAM = 102,
	CARDFULL = 99,
	ALCHEMYFACTORY1 = 8,
	ALCHEMYFACTORY = 3,
	NONE = -1
}
slot0.TOWN_SKILL_EFFECT = {
	C_ENERGY_SUB = 9,
	B_TIME_COST_SUB = 5,
	C_AWARD_ADD = 6,
	C_ACTION_SUB = 8,
	B_ENERGY_COST_SUB = 4,
	A_ENERGY_COST_SUB = 3,
	A_SPEED_UP = 1,
	A_INVEOTORY_ADD = 2,
	C_TIME_SUB = 7
}
slot0.TOWN_BUILDING_ID = {
	CUTTINGHOUSE = 4,
	CENTER = 1,
	GOLDHOUSE = 3,
	BANKHOUSE = 6,
	WISH = 12,
	TERMINAL = 11,
	EXPLORATION = 7,
	SNOW_RELIC = 16,
	REST = 101,
	GOLDHOUSE1 = 8,
	MOUNTAINOUS_RELIC = 15,
	HOME = 2,
	PARTY = 13,
	DESERT_RELIC = 14,
	DESSERTHOUSE = 5,
	LAVA_RELIC = 17,
	CUTTINGHOUSE1 = 9,
	SUPERSHOP = 10
}
slot0.UNLOCK_TYPE = {
	WISH_TIMES = 4,
	HOME_FURN_COUNT = 2,
	BUILDING_LEVEL = 1,
	EXPLORATION_STAGE = 3
}
slot0.SERVER_RAW_MODEL_KEY = {
	"carddbIDs",
	"card2fragL",
	"card2mailL",
	"chipdbIDs",
	"cards",
	"heldItemdbIDs",
	"gemdbIDs",
	"contractdbIDs"
}
slot0.RELIC_BUFF = {
	BUY_STAMINA = 7,
	DISPATCH = 6,
	CONTRACT_ECTYPAL = 13,
	TOWN_DISPATCH = 9,
	EXP_ECTYPAL = 2,
	GOLD_ECTYPAL = 1,
	LIANJIN = 8,
	FRAGMENT_ECTYPAL = 4,
	GIFT_ECTYPAL = 3,
	TOWN_DESSERT_SHOP = 12,
	TOWN_LIANJIN = 11,
	TOWN_FELLING = 10,
	ENDLESSTOWER = 5
}
slot0.TOWN_BUFF_TYPE = {
	[slot0.RELIC_BUFF.TOWN_FELLING] = {
		slot0.TOWN_BUILDING_ID.CUTTINGHOUSE,
		slot0.TOWN_BUILDING_ID.CUTTINGHOUSE1
	},
	[slot0.RELIC_BUFF.TOWN_LIANJIN] = {
		slot0.TOWN_BUILDING_ID.GOLDHOUSE,
		slot0.TOWN_BUILDING_ID.GOLDHOUSE1
	},
	[slot0.RELIC_BUFF.TOWN_DESSERT_SHOP] = {
		slot0.TOWN_BUILDING_ID.DESSERTHOUSE
	}
}
slot0.SKIN_GIVE = false
slot0.AID_FIRST_STAGE = {
	1,
	2,
	3,
	4,
	5,
	6,
	7
}
slot0.AID_SCENE_ID = {
	default = 1,
	arena = 3,
	cross_mine = 7,
	hunting = 2,
	cross_arena = 5,
	gymChallengePvp = 101,
	onlineFight = 6,
	supermacy = 8
}
