globals.ConstSaltNumbers = table.salttable({
	zero = 0,
	wan = 10000,
	dot96 = 0.96,
	one = 1,
	dot01 = 0.01,
	neg1 = -1,
	dot1 = 0.1,
	one15 = 1.15,
	dot05 = 0.05
})
slot0 = {}
globals.battle = slot0
slot0.SpeedTimeScale = {
	1,
	1.6,
	2.5,
	double = 1.6,
	single = 1,
	ultAcc = 10,
	triple = 2.5
}
slot1 = {
	{
		x = 956,
		y = 826 - display.fightLower
	},
	{
		x = 792,
		y = 592 - display.fightLower
	},
	{
		x = 640,
		y = 348 - display.fightLower
	},
	{
		x = 600,
		y = 826 - display.fightLower
	},
	{
		x = 430,
		y = 592 - display.fightLower
	},
	{
		x = 244,
		y = 348 - display.fightLower
	},
	[13] = {
		x = display.width / 2,
		y = 826 - display.fightLower
	},
	[14] = {
		x = display.width / 2,
		y = 826 - display.fightLower
	},
	[99] = {
		x = 0,
		y = 9999
	}
}
slot0.StandingPos = slot1
slot0.PauseNoShowStarConditionsGateType = {
	[game.GATE_TYPE.endlessTower] = true,
	[game.GATE_TYPE.test] = true,
	[game.GATE_TYPE.arena] = true,
	[game.GATE_TYPE.crossArena] = true,
	[game.GATE_TYPE.randomTower] = true,
	[game.GATE_TYPE.crossOnlineFight] = true,
	[game.GATE_TYPE.gym] = true,
	[game.GATE_TYPE.gymLeader] = true,
	[game.GATE_TYPE.crossMine] = true,
	[game.GATE_TYPE.crossMineBoss] = true,
	[game.GATE_TYPE.braveChallenge] = true,
	[game.GATE_TYPE.hunting] = true,
	[game.GATE_TYPE.summerChallenge] = true,
	[game.GATE_TYPE.crossSupremacy] = true
}
slot0.EndSpecialCheck = {
	HpRatioCheck = 2,
	LastWaveTotalDamage = 8,
	SoloSpecialRule = 7,
	AllHpRatioCheck = 4,
	DirectWin = 9,
	EnemyOnlySummonOrAllDead = 10,
	BothDead = 11,
	TotalHpCheck = 3,
	CumulativeSpeedSum = 6,
	ForceNum = 1,
	FightPoint = 5
}
slot0.MainSkillType = {
	NormalSkill = 0,
	BigSkill = 2,
	PassiveSkill = 3,
	SmallSkill = 1,
	TagSkill = 99
}
slot0.SkillType = {
	PassiveAdd = 1,
	PassiveSkill = 3,
	NormalSkill = 0,
	PassiveAura = 2,
	PassiveSummon = 4,
	PassiveCombine = 5
}
slot0.SkillAddBuffType = {
	Before = 1,
	After = 2,
	InPlay = 3
}
slot0.SkillFormulaType = {
	resumeHp = 2,
	damage = 1,
	fix = 3
}
slot0.SkillSegType = {
	resumeHp = "resumeHp",
	damage = "damage",
	buff = "buff"
}
slot0.AttackPosIndex = {
	center = 13,
	selfPos = 14
}
slot0.AttackPos = {
	{
		x = slot1[1].x + 200,
		y = slot1[1].y
	},
	{
		x = slot1[2].x + 200,
		y = slot1[2].y
	},
	{
		x = slot1[3].x + 200,
		y = slot1[3].y
	},
	{
		x = slot1[4].x + 200,
		y = slot1[4].y
	},
	{
		x = slot1[5].x + 200,
		y = slot1[5].y
	},
	{
		x = slot1[6].x + 200,
		y = slot1[6].y
	},
	[13] = {
		x = display.width / 2,
		y = slot1[2].y
	}
}
slot0.ProtectPosIdx = {
	centerRight = 14,
	centerLeft = 13
}
slot0.ProtectPos = {
	{
		x = slot1[1].x + 150,
		y = slot1[1].y
	},
	{
		x = slot1[2].x + 150,
		y = slot1[2].y
	},
	{
		x = slot1[3].x + 150,
		y = slot1[3].y
	},
	{
		x = slot1[4].x + 150,
		y = slot1[4].y
	},
	{
		x = slot1[5].x + 150,
		y = slot1[5].y
	},
	{
		x = slot1[6].x + 150,
		y = slot1[6].y
	},
	[13] = {
		x = display.width / 2 - 150,
		y = slot1[2].y
	},
	[14] = {
		x = display.width / 2 + 150,
		y = slot1[2].y
	}
}
slot0.SpriteRes = {
	natureQuan = "effect/xuanzhongkuang.skel",
	fireShield = "koudai_guladuomega/hero_guladuomega.skel",
	mainSkill = "effect/dz_ice.skel",
	groundRing = "effect/jiaodixzk.skel",
	natureQuanTxtDi = "battle/logo_gray.png"
}
slot0.SpecialObjectId = {
	teamShiled = 13
}
slot0.ShowHeadNumberRes = {
	txtBj = "battle/txt/txt_bj.png",
	txtWeak = "battle/txt/txt_sxsw.png",
	txtSpecialImmune = "battle/txt/txt_tgshmy.png",
	fontBj = "bj",
	fontZlsz = "zlsz",
	txtPhysicalImmune = "battle/txt/txt_wgshmy.png",
	txtKzDi = "battle/txt/bg_kz_di.png",
	txtFs = "battle/txt/txt_fs.png",
	txtSb = "battle/txt/txt_sb.png",
	txtXfzr = "battle/txt/txt_xfzr.png",
	fontPtsh = "ptsh",
	txtStrong = "battle/txt/txt_xgbq.png",
	txtZlszDi = "battle/txt/bg_zlsz_di.png",
	txtBjDyDi = "battle/txt/bg_bjdy_di.png",
	txtBjDy = "battle/txt/txt_bjdy.png",
	fontKz = "kz",
	txtFullweak = "battle/txt/txt_myxg.png",
	txtBjDi = "battle/txt/bg_bj_di.png",
	txtFj = "battle/txt/txt_fj.png",
	txtXx = "battle/txt/txt_xx.png",
	txtGd = "battle/txt/txt_gd.png",
	txtPtshDi = "battle/txt/bg_ptsh_di.png",
	txtAllImmune = "battle/txt/txt_mysh.png",
	txtTypeImmune = "battle/txt/txt_my%s.png"
}
slot0.MainAreaRes = {
	txtNqz = "battle/txt/txt_nqjl.png",
	fontNqz = "font/digital_nqjl.png",
	diZzl = "battle/txt/bg_zzl_di.png",
	txtZzl = "battle/txt/txt_zzl.png",
	txtZsh = "battle/txt/txt_zsh.png",
	fontZzl = "zzl",
	fontZsh = "zsh",
	waveDiTu = "battle/img_pc.png"
}
slot0.StageRes = {
	cutRes = "effect/cutscreen4.skel",
	daZhaoBJ = "effect/dazhao_bj.skel"
}
slot0.SpriteLayerZOrder = {
	ground = 9,
	qipao = 9500,
	selfSpr = 10,
	lifebar = 12,
	mainSkill = 15,
	quan = 14
}
slot0.GameLayerZOrder = {
	text = 9999,
	icon = 8000,
	overlay = 8500
}
slot0.AssignLayer = {
	stageLayer = 0,
	effectLayer = 4,
	effectLayerLower = 3,
	gameLayer = 2,
	frontStageLayer = 5,
	roleLayer = 1
}
slot0.EffectZOrder = {
	none = 0,
	dead = 9999
}
slot0.LoopActionMap = {
	stun_loop = true,
	run_loop = true,
	win_loop = true,
	standby_loop = true
}
slot0.EffectEventArgFields = {
	sound = {
		"sound"
	},
	shaker = {
		"shaker",
		"segInterval"
	},
	music = {
		"music"
	},
	move = {
		"move"
	},
	show = {
		"show"
	},
	damageSeg = {
		"damageSeg",
		"segInterval"
	},
	hpSeg = {
		"hpSeg",
		"segInterval"
	},
	effect = {
		"effectType",
		"effectRes",
		"effectArgs"
	},
	zOrder = {
		"zOrder"
	},
	follow = {
		"follow"
	},
	jump = {
		"jumpFlag"
	},
	control = {
		"control"
	},
	cutting = {
		"cutting"
	}
}
slot0.FilterDeferListTag = {
	none = 0,
	cantClean = 2,
	cantJump = 1
}
slot0.SpriteActionTable = {
	run = "run_loop",
	death = "death",
	standby = "standby_loop",
	attack = "attack",
	charging = "charging",
	hit = "hit"
}
slot0.OperateTable = {
	ultAcc = 15,
	helper = 10,
	noAttack = 11,
	autoFight = 6,
	pass = 12,
	ultAccEnd = 16,
	skill = 1,
	story = 7,
	runAway = 13,
	timeScale = 3,
	fullManual = 14,
	pause = 2,
	attack = 9,
	choose = 8,
	passOneWave = 17
}
slot0.DefaultModes = {}
slot0.PassiveSkillTypes = {
	round = 1,
	beDeathAttack = 5,
	beSpeciaSelfForce = 19,
	beAttack = 6,
	beSpecialDamage = 17,
	realDead = 3,
	kill = 10,
	beWeather = 20,
	cycleRound = 2,
	beDamageIfFullHp = 15,
	beNonNatureDamage = 14,
	beToolsComsumed = 22,
	attack = 8,
	roundStartAttack = 23,
	enter = 7,
	recoverHp = 26,
	teamHpLess = 25,
	dynamicTeamHpLess = 28,
	beNatureDamage = 13,
	hpLess = 18,
	create = 0,
	roundStart = 29,
	beDamage = 16,
	fakeDead = 4,
	beStrike = 12,
	roundEnd = 9,
	beSpeciaBuff = 21,
	dynamicHpLess = 24,
	beSpecialNatureDamage = 11,
	additional = 27
}
slot0.PassiveRoundEndFlag = {
	SelfBattleTurn = 0,
	Round = 1
}
slot0.ControllBuffType = {
	sleepy = true,
	stun = true,
	silence = true,
	changeImage = true,
	leave = true,
	sneer = true,
	freeze = true
}
slot0.RestraintTypeIcon = {
	weak = "battle/logo_dk.png",
	allimmune = "battle/txt_mysh.png",
	physical = "battle/txt_mywg.png",
	strong = "battle/logo_kz.png",
	fullweak = "battle/logo_myxg.png",
	special = "battle/txt_mytg.png"
}
slot0.BuffTriggerPoint = {
	onRunGameEnd = 45,
	onBattleTurnStart = 32,
	onBuffCreate = 1,
	onHolderLostHpBeforeCorrection = 154,
	onHolderReborn = 26,
	onHolderLethal = 39,
	onHolderBackStage = 35,
	onHolderCalcDamageProb = 40,
	onBuffOverDispel = 20,
	onHolderHpChange = 18,
	onHolderShieldChange = 41,
	onHolderBeForeSkillSpellTo = 25,
	onHolderBeforeBeHit = 14,
	onHolderMp1ChangeCorrection = 134,
	onFullShieldBreak = 52,
	onHolderAssimilateDamageBreak = 60,
	onHolderFakeDeath = 31,
	onBuffControlEnd = 22,
	onRoundEnd = 4,
	onBuffOverlay = 21,
	onHolderAfterEnter = 38,
	onHolderBeHit = 9,
	onHolderShieldBreak = 33,
	onHolderDeath = 12,
	onBuffTrigger = 28,
	onBuffOverNormal = 19,
	onNodeCall = 0,
	onHolderAttackEnd = 8,
	onHolderAfterRefreshTargets = 30,
	onBuffOverBefore = 51,
	onHolderAfterBeHit = 17,
	onHolderMp1OverflowCorrection = 144,
	onHolderToAttack = 24,
	onHolderAfterHit = 36,
	onHolderSummon = 58,
	onHolderAttackBefore = 7,
	onHolderCounterAttack = 23,
	onHolderLostHpBefore = 54,
	onHolderHpAdd = 27,
	onBuffCantAdd = 56,
	onHolderBeBuffSputterHit = 49,
	onHolderBattleTurnStartOther = 57,
	onHolderShiftChange = 47,
	onHolderMateKilledBySkill = 16,
	onHolderMakeTargetRealDeath = 37,
	onBuffOver = 2,
	onHolderRealDeath = 13,
	onHolderKillHandleChooseTarget = 15,
	onBuffOverlayRefresh = 46,
	onBattleTurnStartBefore = 59,
	onHolderFinallyBeHit = 10,
	onReflexDamage = 53,
	onHolderLostHpCorrection = 148,
	onRoundStart = 3,
	onHolderPreHeal = 55,
	onBuffBeAdd = 29,
	onHolderLostHp = 48,
	onHolderBuffOver = 50,
	onHolderKillTarget = 11,
	onChargeBeInterrupted = 43,
	onHolderBattleTurnEnd = 6,
	onHolderBattleTurnStart = 5,
	onHolderMp1Change = 34,
	onHolderMp1Overflow = 44,
	onBattleTurnEnd = 42
}
slot0.DamageFrom = {
	buff = 1,
	skill = 3,
	rebound = 2
}
slot0.DamageFromExtra = {
	protect = 203,
	allocate = 201,
	link = 202
}
slot0.DamageKind = {
	aoe = 2,
	single = 3,
	skill = 1,
	other = 4
}
slot0.ResumeHpFrom = {
	suckblood = 103,
	skill = 102,
	buff = 101
}
slot0.AddHpFrom = {
	setHpPer = 200,
	addHpMax = 201
}
slot0.BuffCantAddReason = {
	immune = 4,
	commandeer = 3,
	powerGroup = 1,
	powerFlag = 6,
	prob = 5,
	filter = 2
}
slot0.BuffExtraTargetType = {
	casterForce = 11,
	caster = 2,
	holder = 1,
	triggerObject = 20,
	killHolder = 16,
	holderBeAttackFrom = 7,
	casterEnemyForceRandom = 17,
	triggerAttacker = 23,
	surroundHolderNoDath = 4,
	segProcessTargetRandom = 21,
	skillAllDamageTargets = 8,
	holderForce = 5,
	segProcessTargets = 18,
	skillOwner = 15,
	mainTarget = 22,
	surroundHolderKill = 19,
	casterEnemyForce = 14,
	lastProcessTargets = 6,
	holderForceNoDeathRandom = 3,
	holderEnemyForce = 13,
	overLayBuffCaster = 12,
	casterForceNoDeathRandom = 9,
	surroundCasterNoDath = 10
}
slot0.copyOrTransferSpecType = {
	eachCaster = 100
}
slot0.UITag = {
	pvpOpening = 2,
	passCD = 1
}
slot0.SkillDamageType = {
	Special = 1,
	Physical = 0,
	True = 2
}
slot0.CounterAttackMode = {
	smallSkill = 2,
	bigSkill = 3,
	onlyAttack = 1
}
slot0.ValueType = {
	overFlow = 2,
	valid = 3,
	normal = 1
}
slot0.DamageProcess = {
	"damageHit",
	"nature",
	"damageAdd",
	"damageDeepen",
	"dmgDelta",
	"natureDelta",
	"gateDelta",
	"reduce",
	"strikeBlock",
	"strike",
	"block",
	"extraAdd",
	"fatal",
	"behead",
	"damageByHpRate",
	"finalSkillAdd",
	"ultimateAdd",
	"skillPower",
	"buffAdd",
	"randFix",
	"limit",
	"calcInternalDamageFinish",
	"reflexDamage",
	"ignoreRoundDamage",
	"immuneAllDamage",
	"immuneDamage",
	"immunePhysicalDamage",
	"immuneSpecialDamage",
	"invincible",
	"keepHpUnChanged",
	"groupShield",
	"assimilateDamage",
	"delayDamage",
	"damageCounteract",
	"damageAllocate",
	"damageLink",
	"protection",
	"shield",
	"freeze",
	"finalRate",
	"lockHp",
	"rebound",
	"suckblood",
	"result"
}
slot0.DamageProbProcessId = 18
slot0.ExtraAttackMode = {
	combo = 2,
	prophet = 6,
	assistAttack = 5,
	syncAttack = 3,
	duel = 8,
	counter = 1,
	brawl = 7,
	inviteAttack = 4,
	normal = 9
}
slot0.ExtraBattleRoundMode = {
	gemini = 3,
	normal = 0,
	reset = 1,
	atOnce = 2
}
slot0.JumpAllDamageProcessId = 9
slot0.BuffOverType = {
	clean = 0,
	dispel = 2,
	overlay = 3,
	normal = 1
}
slot0.SkillInterruptType = {
	charge = 1
}
slot0.OverlaySpecBuff = {
	changeBuffDamageArgs = "changeBuffDamageArgs",
	delayDamage = "delayDamage",
	atOnceBattleRound = "atOnceBattleRound",
	reflectBuffToOther = "reflectBuffToOther",
	changeSkillDamageTarget = "changeSkillDamageTarget",
	changeBuffLifeRound = "changeBuffLifeRound",
	forbiddenExtraAttack = "forbiddenExtraAttack",
	changeSkillNature = "changeSkillNature",
	syncAttack = "syncAttack",
	healTodamage = "healTodamage",
	lockHp = "lockHp",
	controlEnemy = "controlEnemy",
	needMoreDispel = "needMoreDispel",
	replaceTarget = "replaceTarget",
	inviteAttack = "inviteAttack",
	reflexDamage = "reflexDamage",
	changeObjNature = "changeObjNature",
	lethalProtect = "lethalProtect",
	forceSneer = "forceSneer",
	pauseBuffLifeRound = "pauseBuffLifeRound",
	allocate = "damageAllocate",
	opGameData = "opGameData",
	calDmgKeepDefence = "calDmgKeepDefence",
	applyCommandeer = "applyCommandeer",
	protection = "protection",
	extraSkillWeightValueFix = "extraSkillWeightValueFix",
	buffBattleRound = "buffBattleRound",
	counterAttack = "counterAttack",
	delayBuff = "delayBuff",
	transformAttrBuff = "transformAttrBuff",
	lockShield = "lockShield",
	pauseBuffEffect = "pauseBuffEffect",
	swapSpeed = "swapSpeed",
	cancelToAttack = "cancelToAttack",
	prophet = "prophet",
	reborn = "reborn",
	comboAttack = "comboAttack",
	healBoost = "healBoost",
	finalAttrLimit = "finalAttrLimit",
	forceMaxHpLimit = "forceMaxHpLimit",
	sleepy = "sleepy",
	cantDispelBuffRound = "cantDispelBuffRound",
	behead = "behead",
	buffSputtering = "buffSputtering",
	fatal = "fatal",
	reduceSkillDamageTarget = "reduceSkillDamageTarget",
	forbiddenAddHP = "forbiddenAddHP",
	transferMp = "transferMp",
	immuneDamage = "immuneDamage",
	commandeer = "commandeer",
	ignorePriorityBuff = "ignorePriorityBuff",
	ignoreSpecBuff = "ignoreSpecBuff",
	damageByHpRate = "damageByHpRate",
	reboundBuff = "reboundBuff",
	keepHp = "keepHpUnChanged",
	cantRecoverMp = "cantRecoverMp",
	sneer = "sneer",
	pausePassiveSkillEffect = "pausePassiveSkillEffect",
	addAttackRange = "addAttackRange",
	changeTreatment = "changeTreatment",
	secondAttack = "secondAttack",
	freeze = "freeze"
}
slot0.ObjectState = {
	normal = 2,
	none = 1,
	reborn = 5,
	realDead = 4,
	dead = 3
}
slot0.ObjectLogicState = {
	cantBeAttack = 4,
	cantAttack = 2,
	cantBeSelect = 1,
	cantUseSkill = 5,
	cantBeAddBuff = 3
}
slot0.ExRecordEvent = {
	effectHpMax = 1008,
	spellNormalSkill = 1,
	commandeerCaster = 35,
	soloTriggerBuffTime = 31,
	lockHpTotalDamage = 1015,
	lockHpTriggerTime = 1001,
	frontStage = 27,
	extraBattleRound = 24,
	totalHp = 15,
	comboProcessTotalNum = 9,
	replaceTarget = 1016,
	copyState = 1007,
	score = 17,
	buffRecord = 1012,
	unitsDamage = 13,
	momentBuffDamage = 19,
	copyOrTransferBuff = 1004,
	replaceTargetTime = 29,
	skillEffectLimit = 20,
	copySucessCount = 5,
	chargeStateBeforeWave = 22,
	sucessCount = 1005,
	lockHpDamage = 1000,
	killNumber = 16,
	lockHpTriggerState = 1010,
	brawlDuelist = 37,
	campDamage = 14,
	allocateOverflow = 41,
	possessTarget = 23,
	spellBigSkill = 3,
	campBuffAddByGroup = 1014,
	assimilateDamageAbsorbDamage = 43,
	dispelBuffCount = 1003,
	roundSyncAttackTime = 12,
	skillAddBuffIds = 26,
	spellSkillTotal = 21,
	dispelSuccessCount = 4,
	deadTakeDamage = 30,
	backStageRoundInfo = 1017,
	protectTarget = 25,
	immuneDamageVal = 42,
	transferState = 1006,
	correctCPCfg = 36,
	effectHp = 1009,
	BrawlDuelCd = 38,
	dispelSuccess = 1002,
	mpFromSuckMp = 32,
	attackState = 33,
	sputtering = 10,
	spellSmallSkill = 2,
	roundAttackTime = 18,
	commandeerAll = 34,
	shieldAbsorbDamage = 40,
	campBuffAddByCfgId = 1013,
	rebornRound = 7,
	extraAttackRoundLimit = 39,
	summoner = 28,
	transferSucessCount = 6,
	swapSpeedRefresh = 2000,
	lostHp = 8,
	keepHpUnChangedTriggerState = 1011,
	penetrate = 11
}
slot0.TimeIntervalType = {
	wave = 1,
	battleRound = 3,
	round = 2,
	mainSkillEnd = 4
}
slot0.FilterObjectType = {
	noAlreadyDead = 1,
	excludeEnvObj = 4,
	noBeSelectHint = 3,
	noRealDeath = 2,
	excludeObjLevel1 = 100
}
slot0.CombineSkillType = {
	smallRoundStart = 1,
	spellBigSkill = 4,
	bigRoundStart = 3,
	smallRoundEnd = 2
}
slot0.EffectPowerType = {
	triggerPoint = "triggerPoint",
	passiveSkill = "passiveSkill",
	canAsTurnTarget = "canAsTurnTarget",
	summonSpecialCheck = "summonSpecialCheck",
	normalSpecialCheck = "normalSpecialCheck",
	killAddMp1 = "killAddMp1",
	needUnitID = "needUnitID",
	hpFormulaDiscount = "hpFormulaDiscount",
	hpFixedDiscount = "hpFixedDiscount"
}
slot0.BuffOverlayType = {
	CoexistLifeRound = 8,
	Overlay = 2,
	Coexist = 6,
	CoverLifeRound = 4,
	OverlayDrop = 7,
	Normal = 0,
	Cover = 1,
	CoverValue = 3,
	IndeLifeRound = 5
}
slot0.BuffEffectOverlayType = {
	PopTop = 1,
	SameMode = 2,
	Normal = 0
}
slot0.BuffEffectAniType = {
	Normal = 0,
	OverlayCount = 1
}
slot0.SneerType = {
	Duel = 1,
	Normal = 0
}
slot0.SneerArgType = {
	NoSpread = 0,
	DamageSpread = 1,
	BuffSpread = 2,
	AllSpread = 3
}
slot0.lifeRoundType = {
	battleTurn = 1,
	pureBattleTurn = 3,
	roundNormal = 6,
	battleTurnNormal = 4,
	round = 2
}
slot0.ObjectType = {
	Summon = 1,
	Normal = 0
}
slot0.CsvStrToMap = {
	checkRealDeathIter = function (slot0)
		return slot0:isRealDeath()
	end
}
slot0.TriggerEnvType = {
	PassiveSkill = 1
}
slot0.GuideTriggerPoint = {
	End = 99,
	Fail = 97,
	Wave = 1000,
	Start = 0,
	Win = 98
}
slot0.GateAntiMode = {
	Operate = 1,
	Normal = 0
}
slot0.SpriteType = {
	Follower = 2,
	Normal = 0,
	Possess = 1
}
slot0.defaultExtraAttackCheckId = 1000
slot0.VariablePriorityTb = {
	posZ = {
		default = 1,
		setPosTo = 2,
		reset = 1
	},
	posAdjust = {
		default = 1,
		setPosTo = 2,
		init = 1
	},
	spriteVisible = {
		default = 1,
		hideSprite = 2,
		hide = 2,
		hideAdvanced = 2,
		changeImage = 2,
		reload = 1,
		brawl = 3,
		depart = 4
	},
	groundRingVisible = {
		default = 1,
		holderAction = 2
	},
	lifeBarVisible = {
		default = 1,
		hideAdvanced = 2,
		hide = 2,
		brawl = 3
	}
}
slot0.skillTargetChooseType = {
	Myself = 14,
	Single = 1,
	Column = 4,
	Random = 20,
	SelfColumn = 16,
	WhoKillMe = 19,
	FrontRowRandom = 21,
	Near = 15,
	All = 11,
	RowFront = 2,
	ObjectEx = 23,
	SelfRow = 17,
	Object = 13,
	EnemyNear = 18,
	BackRowRandom = 22,
	Spurt = 12,
	Special = 24,
	RowBack = 3,
	SelfAndEnemyRow1 = 25
}
slot0.SkillCostType = {
	IgnoreMpCd = 1,
	Normal = 0
}
slot0.specialChooseAttrTb = {
	"hpMax",
	"hpMin",
	"attackDamageMax",
	"attackDamageMin",
	"defenceMax",
	"defenceMin",
	"mp1Max",
	"mp1Min",
	"specialDamageMax",
	"specialDamageMin",
	"speedMax",
	"speedMin",
	"specialDefenceMax",
	"specialDefenceMin",
	"hpRatioMax",
	"hpRatioMin",
	"mp1RatioMax",
	"mp1RatioMin"
}
slot0.fullRoundInfoType = {
	soloTriggerTime = "soloTriggerTime",
	totalHp = "totalHp",
	damage = "damage",
	allHpRatio = "allHpRatio",
	hpRatio = "hpRatio",
	object = "object"
}
slot0.hpShowState = {
	always = 2,
	hide = 1,
	normal = 0
}
slot0.EffectResType = {
	BuffText = "BuffText",
	BuffEffectInForceSelf = "BuffEffectInForceSelf",
	BuffEffectInHolder = "BuffEffectInHolder",
	BuffEffectInNormal = "BuffEffectInNormal",
	FollowToScale = "FollowToScale",
	FollowSprite = "FollowSprite",
	BuffEffectToHide = "BuffEffectToHide",
	OnceEffect = "OnceEffect",
	BuffEffectInForceEnemy = "BuffEffectInForceEnemy"
}
slot0.iconBoxRes = {
	selectedBox = "battle/buff_icon/box_selected.png",
	commandeerBox = "battle/buff_icon/box_commandeer.png"
}
slot0.buffEffectTag = {
	play = "playBuffAniEffect",
	delete = "deleteBuffEffect"
}
slot0.result = {
	inconformity = "inconformity",
	fail = "fail",
	win = "win"
}
