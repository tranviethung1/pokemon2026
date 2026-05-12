slot1 = class("SpriteJumpView", cc.load("mvc").ViewBase)
slot2 = {
	[1.0] = "tiao_loop",
	[2.0] = "standby_loop"
}
slot1.RESOURCE_FILENAME = "sprite_jump_main.json"
slot1.RESOURCE_BINDING = {
	anima = "anima",
	ruleItem = "ruleItem",
	timePanel = "timePanel",
	["timePanel.txtTime"] = "textTipTime",
	btnRank = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRankClick")
			}
		}
	},
	btnTask = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onTaskClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "spritejumpTask",
					listenData = {
						activityId = bindHelper.self("activityId")
					},
					onNode = function (slot0)
						slot0:xy(160, 220)
					end
				}
			}
		}
	},
	btnRule = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	btnPrePlay = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPrePlayClick")
			}
		}
	},
	openBtn = {
		varname = "openBtn",
		binds = {
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "spritejumpGame",
					listenData = {
						activityId = bindHelper.self("activityId")
					},
					onNode = function (slot0)
						slot0:xy(385, 235)
					end
				}
			}
		}
	},
	addBtn = {
		varname = "addBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAddClick")
			}
		}
	},
	["btnRank.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(55, 52, 49, 255)
				}
			}
		}
	},
	["btnTask.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(55, 52, 49, 255)
				}
			}
		}
	},
	["btnRule.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(55, 52, 49, 255)
				}
			}
		}
	},
	["btnPrePlay.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(55, 52, 49, 255)
				}
			}
		}
	},
	score = {
		varname = "score",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	scoreNum = {
		varname = "scoreNum",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	historyScore = {
		varname = "historyScore",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	historyScoreNum = {
		varname = "historyScoreNum",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	timeTxt = {
		varname = "timeTxt",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	myTime = {
		varname = "myTime",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "SPRITE JUMP",
		title = gLanguageCsv.spriteJump
	})

	slot0.activityId = slot1

	slot0:enableSchedule()
	slot0:initCutDown()
	slot0:initModel()

	slot0.openBtnY = slot0.openBtn:get("icon"):y()

	slot0.openBtn:onTouch(functools.partial(slot0.openPlayingBtn, slot0))
	uiEasy.sweepingEffect(slot0.openBtn, {
		delayTime = 0,
		scaleX = 4,
		angle = 20,
		speedTime = 2
	})
	uiEasy.sweepingEffect(slot0.addBtn, {
		delayTime = 0,
		scaleX = 4,
		angle = 20,
		speedTime = 2
	})

	slot0.aniX, slot0.aniY = slot0.anima:xy()

	slot0.anima:y(slot0.aniY - slot0.anima:height() / 2 + 30)

	slot0.aniY = slot0.aniY - slot0.anima:height() / 2 + 30
	slot0.isAniFlip = true
	slot4 = slot0.isAniFlip

	slot0.anima:setFlippedX(slot4)

	uv4 = "gGameUI"

	slot0:playAni(slot4[1])
	slot0:schedule(function ()
		uv0 = "playForeverAnimate"

		slot0:playForeverAnimate()
	end, 2.6, 0, "jumpAnimate")
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.times = 0
	slot0.totalPoints = 0
	slot1 = csv.yunying.yyhuodong[slot0.activityId].paramMap

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityId"
		slot3 = (slot1[slot2.activityId] or {}).info or {
			challenge_buy_times = 0,
			history_points = 0,
			challenge_times = 0,
			total_points = 0,
			start_time = 0
		}
		uv4 = "activityId"
		slot4.infoData = slot3
		uv4 = "activityId"
		slot5 = slot3.total_points
		slot4.totalPoints = slot5
		uv4 = "activityId"
		uv5 = "info"
		slot6 = slot3.challenge_times
		slot4.times = slot5.freeChallengeTimes + slot3.challenge_buy_times - slot6
		uv4 = "activityId"
		slot4 = slot4.textTipTime
		slot5 = slot4
		uv6 = "activityId"

		slot4.text(slot5, slot6.times)

		slot4 = adapt.oneLinePos
		uv5 = "activityId"
		slot5 = slot5.timePanel
		slot6 = slot5
		uv6 = "activityId"

		slot4(slot5.get(slot6, "txt"), slot6.textTipTime, cc.p(10, 0), "left")

		uv4 = "activityId"
		slot6 = "bg"
		slot4 = slot4.timePanel:get(slot6)
		slot4 = slot4.width
		uv6 = "activityId"
		slot6 = slot6.timePanel:get("txt")
		slot7 = slot6
		uv7 = "activityId"

		slot4(slot4, slot6.width(slot7) + slot7.textTipTime:width() + 160)

		uv4 = "activityId"
		slot4 = slot4.scoreNum
		slot4 = slot4.text

		slot4(slot4, slot3.total_points)

		uv4 = "activityId"

		slot4.historyScoreNum:text(slot3.history_points)
	end)
end

function slot1.playForeverAnimate(slot0)
	slot0.anima:runAction(cc.Sequence:create(cc.JumpTo:create(0.8, cc.p(slot0.aniX + 800, slot0.aniY), 200, 1), cc.CallFunc:create(function ()
		uv0 = "playAni"
		uv2 = "playAni"

		slot0:playAni(slot2[2])
	end), cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
		uv0 = "playAni"
		slot1 = slot0
		slot0 = slot0.playAni
		uv2 = "isAniFlip"
		slot2 = slot2[1]

		slot0(slot1, slot2)

		uv0 = "playAni"
		uv1 = "playAni"
		slot0.isAniFlip = not slot1.isAniFlip
		uv0 = "playAni"
		uv2 = "playAni"

		slot0.anima:setFlippedX(slot2.isAniFlip)
	end), cc.JumpTo:create(0.8, cc.p(slot0.aniX, slot0.aniY), 200, 1), cc.CallFunc:create(function ()
		uv0 = "playAni"
		uv2 = "playAni"

		slot0:playAni(slot2[2])
	end), cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
		uv0 = "isAniFlip"
		uv1 = "isAniFlip"
		slot0.isAniFlip = not slot1.isAniFlip
		uv0 = "isAniFlip"
		slot0 = slot0.anima
		slot0 = slot0.setFlippedX
		uv2 = "isAniFlip"
		slot2 = slot2.isAniFlip

		slot0(slot0, slot2)

		uv0 = "isAniFlip"
		uv2 = "anima"

		slot0:playAni(slot2[1])
	end)))
end

function slot1.playAni(slot0, slot1)
	slot0.anima:removeChildByName("spineXiemi")

	if slot0.anima:get("spineXiemi") then
		slot0.anima:get("spineXiemi"):play(slot1 or "effect")

		return
	end

	widget.addAnimationByKey(slot0.anima, "sprite_jump/xiemi.skel", "spineXiemi", slot1, 5):xy(slot0.anima:width() / 2, slot0.anima:height() / 2):scale(1)
end

function slot1.openPlayingBtn(slot0, slot1)
	slot2 = slot0.openBtn:convertToNodeSpace(cc.p(slot1.x, slot1.y))

	if slot1.name == "began" then
		slot0.openBtn:get("icon"):y(slot0.openBtnY - 40)
	elseif slot1.name == "moved" then
		if slot2.x > 0 and slot2.x < slot0.openBtn:width() and slot2.y > 0 and slot2.y < slot0.openBtn:height() then
			slot0.openBtn:get("icon"):y(slot0.openBtnY - 40)
		else
			slot0.openBtn:get("icon"):y(slot0.openBtnY)
		end
	elseif slot1.name == "cancelled" then
		slot0.openBtn:get("icon"):y(slot0.openBtnY)
	elseif slot1.name == "ended" then
		slot0.openBtn:get("icon"):y(slot0.openBtnY)

		if slot0.times <= 0 then
			gGameUI:showTip(gLanguageCsv.gameTimesLimit)

			return
		end

		if slot0.totalPoints == 0 and userDefault.getForeverLocalKey("spriteJumpPlayed", false) == false then
			gGameUI:showDialog({
				fontSize = 50,
				clearFast = true,
				btnType = 2,
				title = gLanguageCsv.spaceTips,
				content = gLanguageCsv.spriteJumpTry,
				cb = function ()
					uv4 = "gGameApp"

					gGameApp:requestServer("/game/yy/sprite_jump/start", function (slot0)
						uv6 = "gGameUI"

						gGameUI:stackUI("city.activity.sprite_jump.game", nil, {
							full = true
						}, slot6.activityId)
					end, slot4.activityId)
				end,
				cancelCb = function ()
					gGameUI:stackUI("city.activity.sprite_jump.game", nil, {
						full = true
					}, nil)
				end
			})
		else
			slot3()
		end
	end
end

function slot1.onPrePlayClick(slot0)
	gGameUI:stackUI("city.activity.sprite_jump.game", nil, {
		full = true
	}, nil)
end

function slot1.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext
	slot3 = csv.yunying.yyhuodong[slot0.activityId].paramMap
	slot5 = {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(128901, 128902),
		string.format(csv.note[128903].fmt, slot3.freeChallengeTimes + #slot3.buyChallengeTimesRMBCost),
		slot2.noteText(128904, 128912)
	}
	slot7 = {
		"tanhuang.png",
		"chibang.png",
		"shijianhuoqu.png",
		"shijianjianshao.png",
		"hudun.png",
		"ci.png",
		"txt_over.png",
		"txt_over.png"
	}
	slot8 = {
		{
			action = "run_loop",
			res = "sprite_jump/miaomiao.skel",
			scale = 1,
			monsterID = 2
		},
		{
			action = "standby_loop",
			res = "sprite_jump/ggbianfu.skel",
			scale = 1,
			monsterID = 1
		}
	}

	for slot12, slot13 in pairs({
		"board1.png",
		"board2.png",
		"board3.png"
	}) do
		table.insert(slot5, slot2.clone(slot0.ruleItem, function (slot0)
			uv5 = "get"

			slot0:get("item"):texture("activity/sprite_jump/" .. slot5):scale(0.8)

			uv5 = "item"

			rich.createWithWidth(gLanguageCsv["spriteJumpBoard" .. slot5], 40, nil, 800, 0):anchorPoint(0, 0.5):addTo(slot0):y(slot0:height() / 2):x(700)
		end))
	end

	slot13 = 128915

	table.insert(slot5, slot2.noteText(128913, slot13))

	slot12 = 128916

	table.insert(slot5, slot2.noteText(slot12))

	for slot12, slot13 in pairs(slot7) do
		table.insert(slot5, slot2.clone(slot0.ruleItem, function (slot0)
			slot1 = slot0:get("item")
			slot3 = slot1
			uv5 = "get"

			slot1.texture(slot3, "activity/sprite_jump/" .. slot5)

			slot2 = nil
			uv3 = "item"

			if slot3 ~= 3 then
				uv3 = "item"

				if slot3 ~= 4 then
					uv5 = "item"
					slot2 = gLanguageCsv["spriteJumpProp" .. slot5]
				end
			else
				uv4 = "item"

				if csv.sprite_jump.prop[slot4].params.time > 0 then
					uv7 = "item"
					slot2 = string.format(gLanguageCsv["spriteJumpProp" .. slot7], "+" .. slot3)
				else
					uv7 = "item"
					slot2 = string.format(gLanguageCsv["spriteJumpProp" .. slot7], slot3)
				end
			end

			slot4 = rich.createWithWidth(slot2, 40, nil, 800, 0):anchorPoint(0, 0.5):addTo(slot0):y(slot0:height() / 2)
			slot4 = slot4.x

			slot4(slot4, 700)

			uv4 = "item"

			if slot4 == 7 then
				slot1:hide()
				widget.addAnimationByKey(slot0:get("aniNode"), "sprite_jump/jinglingtiaoyue.skel", "guladuo", "guladuo_penhuo_loop", 5):xy(0, slot0:height() / 2):scale(0.8)
			end

			uv4 = "item"

			if slot4 == 8 then
				slot1:hide()
				widget.addAnimationByKey(slot0:get("aniNode"), "sprite_jump/tiaoyuedaoju.skel", "yin", "qianyin_dian_loop", 5):xy(120, slot0:height() / 2):scale(1.2)
			end

			slot1:scale(0.8)
		end))
	end

	slot13 = 128924

	table.insert(slot5, slot2.noteText(128917, slot13))

	slot12 = 128925

	table.insert(slot5, slot2.noteText(slot12))

	for slot12, slot13 in pairs(slot8) do
		table.insert(slot5, slot2.clone(slot0.ruleItem, function (slot0)
			slot4 = "item"

			slot0:get(slot4):hide()

			uv4 = "get"
			uv6 = "aniNode"
			slot5 = "monsterAni" .. slot6
			uv6 = "get"
			slot2 = widget.addAnimationByKey(slot0:get("aniNode"), slot4.res, slot5, slot6.action, 5)
			uv5 = "get"

			slot2:scale(slot5.scale)
			slot2:anchorPoint(0.5, 0.5)

			slot3 = slot2:box()
			slot6 = 140
			slot4 = slot2:xy(slot6, slot0:height() / 2 - slot3.y - slot3.height / 2)
			slot5 = slot4
			uv6 = "get"

			slot4.scale(slot5, slot6.scale)

			uv5 = "get"
			slot4 = csv.sprite_jump.monster[slot5.monsterID]
			uv9 = "aniNode"

			rich.createWithWidth(string.format(gLanguageCsv["spriteJumpMonster" .. slot9], slot4.params.times, slot4.score), 40, nil, 800, 0):anchorPoint(0, 0.5):addTo(slot0):y(slot0:height() / 2):x(700)
		end))
	end

	table.insert(slot5, slot2.noteText(128926, 128927))

	return slot5
end

function slot1.onTaskClick(slot0)
	gGameUI:stackUI("city.activity.sprite_jump.task", nil, , slot0.activityId)
end

function slot1.onRankClick(slot0)
	gGameApp:requestServer("/game/yy/sprite_jump/rank", function (slot0)
		uv7 = "gGameUI"

		gGameUI:stackUI("city.activity.sprite_jump.rank", nil, , slot0.view, slot7.activityId)
	end, slot0.activityId, 100)
end

function slot1.onAddClick(slot0)
	if slot0.infoData.challenge_buy_times < #csv.yunying.yyhuodong[slot0.activityId].paramMap.buyChallengeTimesRMBCost == false then
		gGameUI:showTip(gLanguageCsv.buyTimesLimit)

		return
	end

	gGameUI:showDialog({
		isRich = true,
		btnType = 2,
		clearFast = true,
		cb = function ()
			uv0 = "gGameModel"

			if gGameModel.role:read("rmb") < slot0 then
				uiEasy.showDialog("rmb")
			else
				uv4 = "role"

				gGameApp:requestServer("/game/yy/sprite_jump/buy_challenge_times", function (slot0)
					gGameUI:showTip(gLanguageCsv.buySuccess)
				end, slot4.activityId)
			end
		end,
		title = gLanguageCsv.spaceTips,
		content = string.format(gLanguageCsv.spriteJumpBuyTimes, slot0.infoData.challenge_buy_times + 1 <= itertools.size(slot1.buyChallengeTimesRMBCost) and slot3[slot0.infoData.challenge_buy_times + 1] or slot3[itertools.size(slot3)], itertools.size(slot3) - slot0.infoData.challenge_buy_times),
		dialogParams = {
			clickClose = false
		}
	})
end

function slot1.initCutDown(slot0)
	slot1 = csv.yunying.yyhuodong[slot0.activityId]
	slot3 = gGameModel.role:read("yy_endtime")[slot0.activityId] or 0

	slot0:schedule(function ()
		uv1 = "math"
		slot1 = slot1 - time.getTime()
		slot0 = math.max(slot1, 0)
		uv1 = "max"
		slot1 = slot1.myTime
		slot2 = slot1
		slot3 = time.getCutDown(slot0).str

		slot1.text(slot2, slot3)

		uv2 = "max"
		uv3 = "max"

		adapt.oneLinePos(slot2.timeTxt, slot3.myTime, cc.p(5, 0))

		if slot0 <= 0 then
			uv1 = "max"

			slot1.myTime:text(gLanguageCsv.activityOver)

			return false
		end
	end, 1, 0, "SpriteJumpCutDown")
end

return slot1
