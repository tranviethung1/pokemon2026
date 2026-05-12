slot0 = require("app.views.city.activity.view")
slot1 = class("ActivityWorldBossView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "activity_world_boss.json"
slot1.RESOURCE_BINDING = {
	["centerPanel.title.txt1"] = "bosslevel",
	["centerPanel.num"] = "num",
	["centerPanel.num1"] = "num1",
	["rightPanel.timesPanel.times"] = "times",
	["rightPanel.timesPanel.timesLabel"] = "timesLabel",
	["centerPanel.title.txt2"] = "bossAllDamage",
	centerPanel = "centerPanel",
	["centerPanel.barBg"] = "barBg",
	["centerPanel.countdownBg"] = "countdownBg",
	bgPanel = "bgPanel",
	["centerPanel.skillItem"] = "skillItem",
	["centerPanel.title"] = "title",
	["centerPanel.nameBg.name"] = "bossName",
	["leftPanel.rule"] = {
		varname = "ruleBtn",
		binds = {
			event = "touch",
			scaletype = 0,
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	["leftPanel.rank"] = {
		varname = "rankBtn",
		binds = {
			event = "touch",
			scaletype = 0,
			methods = {
				ended = bindHelper.self("onRankClick")
			}
		}
	},
	["leftPanel.award"] = {
		varname = "awardBtn",
		binds = {
			event = "touch",
			scaletype = 0,
			methods = {
				ended = bindHelper.self("onAwardClick")
			}
		}
	},
	["centerPanel.countdownBg.label"] = {
		varname = "countdownLabel",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(66, 59, 66, 255)
				}
			}
		}
	},
	["centerPanel.countdownBg.time"] = {
		varname = "countdown",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(66, 59, 66, 255)
				}
			}
		}
	},
	["centerPanel.skillList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("skillDatas"),
				item = bindHelper.self("skillItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.skillId == 0 then
						slot1:get("icon"):hide()
						slot1:get("frame"):hide()
					else
						slot1:get("icon"):show():texture(slot3.icon)
						slot1:get("frame"):show()
						bind.touch(slot0, slot1, {
							methods = {
								ended = functools.partial(slot0.clickCell, slot1, slot3)
							}
						})
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onSkillClick")
			}
		}
	},
	["centerPanel.bar"] = {
		varname = "bar",
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				maskImg = "activity/world_boss/main/jdt_1.png",
				data = bindHelper.self("barPoint")
			}
		}
	},
	["centerPanel.title.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(254, 253, 236, 255)
				}
			}
		}
	},
	["centerPanel.gift"] = {
		varname = "gift",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBoxClick")
			}
		}
	},
	["rightPanel.startBtn"] = {
		binds = {
			event = "touch",
			scaletype = 0,
			methods = {
				ended = bindHelper.self("onStartClick")
			}
		}
	},
	["rightPanel.timesBuyBtn"] = {
		binds = {
			event = "touch",
			scaletype = 0,
			methods = {
				ended = bindHelper.self("onTimesBuyClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot9 = slot0

	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0.createHandler(slot9, "onClose")
	}):init({
		subTitle = "WORLD BOSS",
		title = gLanguageCsv.worldBoss
	})
	slot0:initModel()

	slot8 = 1

	widget.addAnimationByKey(slot0.bgPanel, "worldboss/shijiebossbeijing.skel", "effect", "effect_loop", slot8):xy(1560, 720):scale(2)
	slot0.ruleBtn:xy(125, 398)
	slot0.rankBtn:xy(185, 254)
	slot0.awardBtn:xy(235, 104)

	slot0.activityID = slot1
	slot4 = nil

	for slot8, slot9 in orderCsvPairs(csv.world_boss.base) do
		if slot9.huodongID == csv.yunying.yyhuodong[slot1].huodongID then
			slot4 = slot9

			break
		end
	end

	slot0.baseCfg = slot4
	slot0.level = slot2.view.bossLevel

	slot0.bosslevel:text(slot0.level)
	slot0.bossAllDamage:text(gLanguageCsv.worldBossServerDamageTip)

	slot0.barPoint = idler.new(0)
	slot0.bossHp = math.floor(slot4.baseHP * csv.world_boss.hp_fix[slot0.level].hpFix / 100)

	text.addEffect(slot0.num, {
		outline = {
			size = 2,
			color = cc.c4b(254, 253, 236, 255)
		}
	})
	text.addEffect(slot0.num1, {
		outline = {
			size = 2,
			color = cc.c4b(209, 128, 0, 255)
		}
	})
	text.addEffect(slot0.bosslevel, {
		outline = {
			size = 3,
			color = cc.c4b(254, 253, 236, 255)
		}
	})

	slot7 = csv.unit[slot4.bossID]

	slot0.bossName:text(slot7.name)
	widget.addAnimation(slot0.centerPanel, slot7.unitRes, "standby_loop", 0):scale(slot7.scale * 2 * slot4.bossScale):xy(960 + (slot4.bossPos.x or 0), 500 + (slot4.bossPos.y or 0)):setSkin(slot7.skin)

	slot0.skillDatas = {}

	for slot12, slot13 in ipairs(slot7.skillList) do
		slot0.skillDatas[slot12] = {
			skillId = slot13,
			icon = slot4.skillIcon[slot12]
		}
	end

	for slot12 = #slot0.skillDatas + 1, 4 do
		slot0.skillDatas[slot12] = {
			skillId = 0
		}
	end

	slot9 = idlereasy.any({
		slot0.bossGatePlay,
		slot0.bossGateBuy
	}, function (slot0, slot1, slot2)
		uv3 = "paramMap"
		slot3 = slot3.paramMap.freeCount
		slot4 = slot3 + slot2 - slot1
		uv5 = "freeCount"

		slot5.times:text(string.format("%d/%d", slot4, slot3))

		return true, slot4
	end)
	slot0.leftTimes = slot9
	uv9 = "gGameUI"

	slot9.setCountdown(slot0, slot1, slot0.countdownLabel, slot0.countdown, {
		labelChangeCb = function ()
			slot3 = 50
			uv3 = "adapt"
			slot3 = slot3.countdownLabel
			uv3 = "adapt"

			adapt.oneLineCenterPos(cc.p(210, slot3), {
				slot3,
				slot3.countdown
			}, cc.p(15, 0))
		end
	})
	slot0.gift:texture(slot4.serverTargetRes)

	slot9 = slot0.damageSum and 0 or 10
	slot0.damageSum = slot0.damageSum or slot2.view.damageSum

	slot0:refreshDamage()

	slot10 = socket.gettime()

	slot0:scheduleUpdate(function ()
		uv1 = "socket"
		uv1 = "gettime"

		if slot1 < socket.gettime() - slot1 then
			uv4 = "requestServer"

			gGameApp:requestServer("/game/yy/world/boss/main", function (slot0)
				uv1 = "damageSum"
				slot1.damageSum = slot0.view.damageSum
				uv1 = "damageSum"

				slot1:refreshDamage()
			end, slot4)

			uv0 = 10
			uv1 = socket.gettime()
		end
	end)
	adapt.oneLinePos(slot0.title:get("txt"), {
		slot0.bosslevel,
		slot0.bossAllDamage
	}, cc.p(10, 0), "left")
	adapt.oneLinePos(slot0.bosslevel, slot0.bossAllDamage, cc.p(36, 0), "left")
	slot0.title:size(slot0.title:size().width + slot0.bosslevel:size().width, slot0.title:size().height)
end

function slot1.refreshDamage(slot0)
	slot1 = slot0.damageSum or 0

	slot0.num:text(mathEasy.getShortNumber(slot1, 2))
	slot0.num1:text("/" .. mathEasy.getShortNumber(slot0.bossHp, 2))
	adapt.oneLineCenterPos(cc.p(903, 410), {
		slot0.num,
		slot0.num1
	}, cc.p(10, 0))

	if slot0.bossHp <= slot1 then
		slot1 = slot0.bossHp

		widget.addAnimationByKey(slot0.gift, "effect/jiedianjiangli.skel", "rewardEffect", "effect_loop", -1):xy(85, 50):scale(0.45)
	end

	slot0.barPoint:set(slot1 / slot0.bossHp * 100)
end

function slot1.initModel(slot0)
	slot0.bossGatePlay = gGameModel.daily_record:getIdler("boss_gate")
	slot0.bossGateBuy = gGameModel.daily_record:getIdler("boss_gate_buy")
	slot0.vip = gGameModel.role:getIdler("vip_level")
end

function slot1.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1500
	})
end

function slot1.onAwardClick(slot0)
	gGameUI:stackUI("city.activity.world_boss.reward", nil, , slot0.activityID)
end

function slot1.onRankClick(slot0)
	gGameApp:requestServer("/game/yy/world/boss/rank", function (slot0)
		uv6 = "gGameUI"

		gGameUI:stackUI("city.activity.world_boss.rank", nil, , slot6.activityID, slot0.view)
	end)
end

function slot1.onStartClick(slot0)
	if slot0.leftTimes:read() > 0 then
		gGameUI:stackUI("city.card.embattle.base", nil, {
			full = true
		}, {
			fightCb = slot0:createHandler("startFighting"),
			from = game.EMBATTLE_FROM_TABLE.huodong,
			fromId = game.EMBATTLE_HOUDONG_ID.worldBoss
		})
	else
		slot0:onTimesBuyClick(gLanguageCsv.yyWorldBossCountLimit)
	end
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(143),
		slot2.noteText(85001, 85099)
	}
end

function slot1.onTimesBuyClick(slot0, slot1)
	if gVipCsv[slot0.vip:read()].bossTimeBuyLimit <= slot0.bossGateBuy:read() then
		if type(slot1) ~= "string" then
			slot1 = gLanguageCsv.yyWorldBossBuyMax
		end

		gGameUI:showTip(slot1)

		return
	end

	slot4 = gCostCsv.world_boss_buy_cost

	gGameUI:showDialog({
		isRich = true,
		btnType = 2,
		clearFast = true,
		cb = function ()
			slot0 = gGameModel.role
			slot1 = slot0
			slot2 = "rmb"
			uv1 = "gGameModel"
			uv2 = "role"

			if slot0.read(slot1, slot2) < slot1[slot2] then
				uiEasy.showDialog("rmb")
			else
				gGameApp:requestServer("/game/yy/world/boss/buy")
			end
		end,
		title = gLanguageCsv.spaceTips,
		content = string.format(gLanguageCsv.worldBossBuyTip, slot4[math.min(slot3 + 1, table.length(slot4))]),
		dialogParams = {
			clickClose = false
		}
	})
end

function slot1.onSkillClick(slot0, slot1, slot2, slot3)
	if slot3.skillId == 0 then
		return
	end

	slot4 = gGameUI:stackUI("common.skill_detail", nil, {
		clickClose = true,
		dispatchNodes = slot1
	}, {
		ignoreStar = true,
		hideSkillLevel = false,
		skillLevel = slot0.level,
		skillId = slot3.skillId,
		skillIcon = slot3.icon
	})

	if not dataEasy.isSkillChange() then
		slot5 = slot4:getResourceNode()
		slot6, slot7 = slot5:xy()

		slot5:xy(slot6 + slot2:x() + 65, slot4.panel:y() - 25)
	end
end

function slot1.startFighting(slot0, slot1, slot2, slot3)
	slot0:disableSchedule()
	battleEntrance.battleRequest("/game/yy/world/boss/start", slot2, slot0.activityID, slot3):onStartOK(function (slot0)
		uv1 = "activityID"
		slot1 = slot1.activityID
		slot0.activityID = slot1
		uv1 = "onClose"

		if slot1 then
			uv1 = "onClose"

			slot1:onClose(false)

			uv1 = nil
		end
	end):show()
end

function slot1.onBoxClick(slot0, slot1)
	gGameUI:showBoxDetail({
		state = 1,
		data = slot0.baseCfg.serverTargetAward,
		content = string.format(gLanguageCsv.allDamageGet, time.getRefreshHour())
	})
end

return slot1
