slot0 = {}
globals.lushi = slot0
slot0.ObjectState = {
	normal = 2,
	none = 1,
	reborn = 5,
	realDead = 4,
	dead = 3
}
slot0.ObjectReadyState = {
	hand = 3,
	shop = 2,
	none = 0,
	transform = 6,
	event = 4,
	find = 5,
	embattle = 1
}
slot0.ObjectType = {
	event = 3,
	equip = 2,
	normal = 1
}
slot0.TeamNumber = 6
slot0.ObjectNumber = 12
slot0.HandCardLimit = 20
slot0.HandCardBuyLimit = 10
slot0.CardWidth = 265
slot0.CardHeight = 350
slot0.FakeObjId = 99999
slot0.DamageFrom = {
	rebound = 3,
	physical = 1,
	buff = 4,
	magic = 2,
	penetrate = 5
}
slot0.DamageTextName = {
	storm = "zzq_bj",
	trainer = "shbj",
	[slot0.DamageFrom.physical] = "zzq_pg",
	[slot0.DamageFrom.magic] = "shxg",
	[slot0.DamageFrom.rebound] = "zzq_pg",
	[slot0.DamageFrom.buff] = "shxg",
	[slot0.DamageFrom.penetrate] = "zzq_pg"
}
slot0.HealTextName = "zl"
slot0.EventNameRichFormat = "#C0xfffced##Pfont/youmi1.ttf##LOC0x232121##L00100000##LOS4#"
slot0.SaleGoldNum = "#C0xFFDB60##Pfont/youmi1.ttf##LOC0xDD525F##L00100000##LOS4#+"
slot0.Color = {
	white = cc.c4b(255, 254, 249, 255),
	white2 = cc.c4b(255, 252, 237, 255),
	red = cc.c3b(255, 0, 0)
}
slot0.OutLineColor = {
	gold = cc.c4b(85, 51, 4, 255)
}
slot0.StarPos = {
	{
		{
			x = 0,
			y = 0
		}
	},
	{
		{
			x = -25,
			y = 0
		},
		{
			x = 25,
			y = 0
		}
	},
	{
		{
			x = 0,
			y = 14
		},
		{
			x = -25,
			y = -14
		},
		{
			x = 25,
			y = -14
		}
	},
	{
		{
			x = 20,
			y = 20
		},
		{
			x = -20,
			y = 20
		},
		{
			x = 20,
			y = -20
		},
		{
			x = -20,
			y = -20
		}
	}
}
slot0.TrainerStar = {
	odd = {
		{
			x = 0,
			y = -112
		},
		{
			x = -74,
			y = -91
		},
		{
			x = 74,
			y = -91
		},
		{
			x = -124,
			y = -44
		},
		{
			x = 124,
			y = -44
		}
	},
	even = {
		{
			x = -33,
			y = -112
		},
		{
			x = 33,
			y = -112
		},
		{
			x = -95,
			y = -70
		},
		{
			x = 95,
			y = -70
		},
		{
			x = -139,
			y = -15
		},
		{
			x = 139,
			y = -15
		}
	}
}
slot0.BuffExtraTargetType = {
	caster = 2,
	transformBase = 19,
	holder = 1,
	triggerObject = 18,
	killHolder = 10,
	nearHolderEnemy = 14,
	enemytrainer = 17,
	killTargetNear = 11,
	holderForce = 4,
	nearHolder = 13,
	casterForce = 5,
	attacker = 8,
	trainer = 3,
	casterEnemyForce = 7,
	target = 9,
	holderEnemyForce = 6,
	damageOrHealSource = 12,
	nearCasterEnemy = 16,
	nearCaster = 15
}
slot0.InitFromRecord = true
slot0.EncounterType = {
	shop = 2,
	battle = 1,
	pvp = 5,
	enhance = 4,
	story = 3
}
slot0.AwardListResName = {
	win = {
		bg = "common/bg/img_bg1.png",
		title = "lushi/pop/txt_zzq_sl.png"
	},
	fail = {
		bg = "lushi/pop/img_zzq_sbbg.png",
		title = "lushi/pop/txt_zzq_sb.png"
	}
}
slot0.goldRes = "lushi/event/icon_zzq_db1.png"
slot0.EncounterRes = {
	Bgs = {
		[slot0.EncounterType.battle] = "lushi/event/img_zzq_bg1.png",
		[slot0.EncounterType.shop] = "lushi/event/img_zzq_bg2.png",
		[slot0.EncounterType.story] = "lushi/event/img_zzq_bg3.png",
		[slot0.EncounterType.enhance] = "lushi/event/img_zzq_bg2.png",
		[slot0.EncounterType.pvp] = "lushi/event/img_zzq_bg3.png"
	},
	Titles = {
		[slot0.EncounterType.battle] = "lushi/event/bg_zzq_bt2.png",
		[slot0.EncounterType.shop] = "lushi/event/bg_zzq_bt3.png",
		[slot0.EncounterType.story] = "lushi/event/bg_zzq_bt4.png",
		[slot0.EncounterType.enhance] = "lushi/event/bg_zzq_bt3.png",
		[slot0.EncounterType.pvp] = "lushi/event/bg_zzq_bt4.png"
	},
	OriginBg = "lushi/event/img_zzq_bg1.png",
	OriginTitle = "lushi/event/bg_zzq_bt1.png",
	Events = {
		[slot0.EncounterType.battle] = "lushi/event/img_zzq_mx2.png",
		[slot0.EncounterType.shop] = "lushi/event/img_zzq_zy.png",
		[slot0.EncounterType.story] = "lushi/event/img_zzq_zj.png",
		[slot0.EncounterType.enhance] = "lushi/event/img_zzq_zy.png",
		[slot0.EncounterType.pvp] = "lushi/event/img_zzq_zj.png"
	},
	Color = {
		[slot0.EncounterType.battle] = cc.c4b(250, 190, 188, 255),
		[slot0.EncounterType.shop] = cc.c4b(200, 219, 235, 255),
		[slot0.EncounterType.story] = cc.c4b(209, 190, 228, 255),
		[slot0.EncounterType.enhance] = cc.c4b(200, 219, 235, 255),
		[slot0.EncounterType.pvp] = cc.c4b(209, 190, 228, 255)
	}
}
slot0.MenuPosFix = {
	[slot0.EncounterType.battle] = cc.p(0, 26),
	[slot0.EncounterType.shop] = cc.p(0, 0),
	[slot0.EncounterType.story] = cc.p(0, 15),
	[slot0.EncounterType.enhance] = cc.p(0, 0),
	[slot0.EncounterType.pvp] = cc.p(0, 15)
}
slot0.EncounterText = {
	confirm = {
		[slot0.EncounterType.battle] = gLanguageCsv.autoChessEncounterStart,
		[slot0.EncounterType.shop] = gLanguageCsv.autoChessEncounterBuy,
		[slot0.EncounterType.story] = gLanguageCsv.autoChessEncounterConfirm,
		[slot0.EncounterType.enhance] = gLanguageCsv.autoChessEncounterConfirm,
		[slot0.EncounterType.pvp] = gLanguageCsv.autoChessEncounterStart
	}
}
slot5 = 93
slot6 = 255
slot0.EncounterColor = {
	menu = cc.c4b(252, 252, 237, 255),
	info = cc.c4b(91, 84, 91, 255),
	price = cc.c4b(95, 84, slot5, slot6)
}
slot0.OperateTable = {
	startFight = 11,
	quitBattle = 18,
	pass = 1,
	handCardCancel = 15,
	findCardConfirm = 6,
	encounterConfirm = 2,
	handCardSelect = 14,
	getEnhancePrice = 20,
	embattleMoveBegin = 9,
	abandonGame = 19,
	handCardMove = 7,
	trainerSkillConfirm = 13,
	eventCardMove = 16,
	menuClick = 4,
	saleCard = 12,
	menuDelete = 5,
	embattleMoveEnd = 10,
	gotoBattle = 3,
	findSkillConfirm = 17,
	handEquipMove = 8
}
slot0.EquipBaseId = 100000
slot0.EventBaseId = 200000
slot0.ExtraBattleRoundMode = {
	normal = 0,
	atOnce = 1
}
slot0.ExRecordEvent = {
	effectHpMax = 1001,
	trainerWeight = 1004,
	trainerReduceDamage = 1003,
	effectHp = 1002
}

for slot5, slot6 in pairs(slot0.ExRecordEvent) do
	slot0.ExRecordEvent[slot5] = slot6 + 2000000000
end

slot0.ValueType = {
	overFlow = 2,
	valid = 3,
	normal = 1
}
slot0.BuffOverType = {
	clean = 0,
	dispel = 2,
	overlay = 3,
	normal = 1
}
slot0.BuffTriggerPoint = {
	onHolderGainShield = 27,
	onBattleTurnStart = 20,
	onKillTarget = 19,
	onHolderBeforeBeAttack = 12,
	onHolderFightFailKey = 208,
	onHolderNormalAttackBefore = 31,
	onHolderFightWin = 7,
	onHolderAfterEnterKey = 205,
	onBuffTrigger = 99,
	onHolderLeaveField = 24,
	onBuffOver = 2,
	onObjSell = 30,
	onHolderFromEmbattleIntoHand = 23,
	onHolderAfterBeAttack = 13,
	onAttackKillTarget = 6,
	onReadStateOver = 9,
	onNodeCall = 0,
	onBuffCreate = 1,
	onHolderNormalAttackEnd = 32,
	onHolderNormalAttackBeforeKey = 231,
	onHolderAfterEnter = 5,
	onTrainerTakeDamage = 29,
	onHolderBattleTurnStart = 10,
	onBattleTurnEnd = 21,
	onHolderDeath = 4,
	onObjFromHandIntoEmbattle = 28,
	onHolderBeforeBeAttackKey = 212,
	onBattleOverReset = 33,
	onHolderFightFail = 8,
	onHolderAttackEnd = 18,
	onHolderLostShield = 26,
	onBuffBeAdd = 16,
	onHolderFromHandIntoEmbattle = 3,
	onHolderFightWinKey = 207,
	onHolderEnterField = 22,
	onHolderDeathKey = 204,
	onHolderBattleEnd = 25,
	onHolderTakeDamageBefore = 35,
	onHolderTakeDamage = 14,
	onHolderTakeHealing = 15,
	onHolderBattleTurnEnd = 11,
	onHolderAttackBefore = 17,
	onHolderSpecBuffOver = 34
}
slot0.BuffOverlayType = {
	Coexist = 2,
	Cover = 1,
	Normal = 0
}
slot0.BuffEffectOverlayType = {
	PopTop = 1,
	SameMode = 2,
	Normal = 0
}
slot0.EffectZOrder = {
	none = 0,
	dead = 9999
}
slot0.SkillAddBuffType = {
	Before = 1,
	After = 2,
	InPlay = 3
}
slot0.EncounterShowNum = 3
slot0.VariablePriorityTb = {
	shopVisible = {
		default = 1,
		test = 3,
		sale = 1,
		fight = 2
	},
	equipBgVisible = {
		default = 1,
		equip = 2,
		point = 3
	},
	holdingHaloVisible = {
		default = 1,
		info = 3,
		shop = 4,
		move = 2
	},
	trainerVisible = {
		default = 1,
		stageAction = 3,
		dead = 2
	},
	fightBtnTouchEnable = {
		default = 1,
		stageAction = 2,
		allDisable = 3
	},
	allTouchDisable = {
		riseStar = 3,
		default = 1,
		find = 2
	}
}
slot0.ImmotalBuffTime = 99
slot0.TrainerSKillType = {
	selectSkill = 2,
	passiveSkill = 3,
	buttonSkill = 1
}
slot0.CardBgRes = "lushi/icon_zzqbg_"
slot0.CardDmgRes = "lushi/icon_zzqgj_"
slot0.CardShaderRes = "lushi/icon_zzqkp_"
slot0.CardStarRes = "lushi/icon_zzqxj_"
slot0.CardHpRes = "lushi/icon_zzqxl_"
slot0.EventTypeBgRes = "lushi/icon_zzqsj_"
slot0.CardRarityRes = {
	"hui.png",
	"lv.png",
	"lan.png",
	"zi.png",
	"huang.png"
}
slot0.PointToType = {
	event = 2,
	trainer = 3,
	equip = 1
}
slot0.EventCardType = {
	once = 1,
	continuous = 2,
	field = 3
}
slot0.EventCardRes = {
	[slot0.EventCardType.once] = "lushi/icon_zzq_dc.png",
	[slot0.EventCardType.continuous] = "lushi/icon_zzq_cxx.png",
	[slot0.EventCardType.field] = "lushi/icon_zzq_cd.png"
}
slot0.DamageProcess = {
	"oneHitKill",
	"kill",
	"divineShield",
	"quickStrike",
	"storm",
	"thorn",
	"immuneDamage",
	"shield",
	"broken",
	"strike",
	"reduce",
	"result"
}
slot0.DamageProcessId = {
	attack = 1,
	buff = 4,
	rebound = 2,
	penetrate = 3
}
slot0.OverlaySpecBuff = {
	storm = "storm",
	ignoreShield = "ignoreShield",
	kill = "kill",
	stealth = "stealth",
	stun = "stun",
	thorn = "thorn",
	specialAction = "specialAction",
	beHealAdd = "beHealAdd",
	shieldEX = "shieldEX",
	battleTemporaryTransform = "battleTemporaryTransform",
	control = "control",
	strike = "strike",
	temporaryTransform = "temporaryTransform",
	reduceTakeDamage = "reduceTakeDamage",
	changeAttackTarget = "changeAttackTarget",
	protector = "protector",
	immuneDamage = "immuneDamage",
	addTriggerTimes = "addTriggerTimes",
	oneHitKill = "oneHitKill",
	quickStrike = "quickStrike",
	divineShield = "divineShield",
	penetrate = "penetrate"
}
slot0.OverlaySpecBuffCfg = {}
slot0.StarLimit = 4
slot0.PageNames = {
	selectList = "selectList",
	awardlist = "awardlist",
	eventlist = "eventlist",
	findlist = "findlist",
	cardInfo = "cardInfo",
	findskill = "findskill"
}
slot0.PageOrder = {
	slot0.PageNames.selectList,
	slot0.PageNames.findskill,
	slot0.PageNames.findlist,
	slot0.PageNames.eventlist,
	slot0.PageNames.awardlist,
	slot0.PageNames.cardInfo
}
slot0.Pages = {
	[slot0.PageNames.cardInfo] = {
		viewName = "lushi_battle.card_info"
	},
	[slot0.PageNames.selectList] = {
		viewName = "lushi_battle.selectlist"
	},
	[slot0.PageNames.findskill] = {
		viewName = "lushi_battle.findskill"
	},
	[slot0.PageNames.findlist] = {
		viewName = "lushi_battle.findlist"
	},
	[slot0.PageNames.eventlist] = {
		viewName = "lushi_battle.eventlist"
	},
	[slot0.PageNames.awardlist] = {
		viewName = "lushi_battle.award_list"
	}
}
slot0.AttrToName = {
	hpMax = gLanguageCsv.autoChessHpMax,
	attack = gLanguageCsv.autoChessAttack,
	defence = gLanguageCsv.autoChessDefence,
	enhancement = gLanguageCsv.autoChessEnhancement
}
slot0.SpeedTimeScale = {
	1.1,
	1.6,
	2.5
}
slot0.GuideCountExclude = {
	[slot0.OperateTable.embattleMoveBegin] = true
}
slot0.PreLoadSpireRes = {
	"lushi/zizouqi_cj.skel",
	"lushi/zizouqi_jl1.skel",
	"lushi/zizouqi_jl2.skel"
}
slot0.PreloadCsv = {
	"csv.auto_chess.buff",
	"csv.auto_chess.chapter",
	"csv.auto_chess.encounter",
	"csv.auto_chess.monster",
	"csv.auto_chess.monster_fix",
	"csv.auto_chess.story",
	"csv.auto_chess.choose",
	"csv.auto_chess.game_shop",
	"csv.auto_chess.trainer",
	"csv.auto_chess.trainer_skills",
	"csv.auto_chess.cards",
	"csv.auto_chess.equip",
	"csv.auto_chess.event"
}
slot0.SkillCheck = {
	CD = 1,
	gold = 2
}
slot0.ShopGoldKey = "gameGold"
slot0.TrackingEvents = {
	AllRiseStar = "AllRiseStar",
	GainGold = "GainGold",
	ShopRiseStar = "ShopRiseStar",
	PVEEndHP = "PVEEndHP",
	AllAchievement = "AllAchievement",
	PVEEndGold = "PVEEndGold",
	SellCardByID = "SellCardByID",
	PVPLose = "PVPLose",
	PVPWin = "PVPWin",
	TrainerCauseDmg = "TrainerCauseDmg",
	ShopBuyByID = "ShopBuyByID",
	ChooseSkill = "ChooseSkill",
	PVPDamage = "PVPDamage",
	ShopRiseByID = "ShopRiseByID",
	PVEResult = "PVEResult",
	TrainerTakeDmgAndLive = "TrainerTakeDmgAndLive",
	SpecialScore = "SpecialScore",
	ShopCostHP = "ShopCostHP"
}
slot0.PVPRobots = {
	101,
	102,
	103
}
