slot1 = class("BlockBlastView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "block_blast_main.json"
slot1.RESOURCE_BINDING = {
	bg = "bg",
	timePanel = "timePanel",
	["timePanel.txtTime"] = "textTipTime",
	spineNode = "spineNode",
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
					specialTag = "mituTask",
					listenData = {
						activityId = bindHelper.self("activityID")
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
					specialTag = "mituGame",
					listenData = {
						activityId = bindHelper.self("activityID")
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
					size = 6,
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
					size = 6,
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
					size = 6,
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
					size = 6,
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
slot1.RESOURCE_STYLES = {
	full = true
}

function slot1.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "BLOCKBLAST",
		title = gLanguageCsv.mitu
	})

	slot0.activityID = slot1

	slot0:enableSchedule()
	slot0:initCutDown()
	slot0:initModel()
	widget.addAnimationByKey(slot0.spineNode, "mitu1/sbjm.skel", "nodeEffect", "standby_loop", 100):xy(slot0.spineNode:getBoundingBox().width / 2, slot0.spineNode:getBoundingBox().height / 2):scale(2)
	slot0:refreshBtnTitle()

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
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.times = 0
	slot0.totalPoints = 0
	slot1 = csv.yunying.yyhuodong[slot0.activityID].paramMap

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityID"
		slot3 = (slot1[slot2.activityID] or {}).info or {
			challenge_buy_times = 0,
			history_points = 0,
			challenge_times = 0,
			total_points = 0,
			start_time = 0
		}
		uv4 = "activityID"
		slot4.infoData = slot3
		uv4 = "activityID"
		slot5 = slot3.total_points
		slot4.totalPoints = slot5
		uv4 = "activityID"
		uv5 = "info"
		slot6 = slot3.challenge_times
		slot4.times = slot5.freeChallengeTimes + slot3.challenge_buy_times - slot6
		uv4 = "activityID"
		slot4 = slot4.textTipTime
		slot5 = slot4
		uv6 = "activityID"

		slot4.text(slot5, slot6.times)

		slot4 = adapt.oneLinePos
		uv5 = "activityID"
		slot5 = slot5.timePanel
		slot6 = slot5
		uv6 = "activityID"

		slot4(slot5.get(slot6, "txt"), slot6.textTipTime, cc.p(10, 0), "left")

		uv4 = "activityID"
		slot6 = "bg"
		slot4 = slot4.timePanel:get(slot6)
		slot4 = slot4.width
		uv6 = "activityID"
		slot6 = slot6.timePanel:get("txt")
		slot7 = slot6
		uv7 = "activityID"

		slot4(slot4, slot6.width(slot7) + slot7.textTipTime:width() + 160)

		uv4 = "activityID"
		slot4 = slot4.scoreNum
		slot4 = slot4.text

		slot4(slot4, slot3.total_points)

		uv4 = "activityID"

		slot4.historyScoreNum:text(slot3.history_points)
	end)
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

		if slot0.times <= 0 and userDefault.getForeverLocalKey("mituGuideAsked", false) == true then
			gGameUI:showTip(gLanguageCsv.gameTimesLimit)

			return
		end

		function ()
			if userDefault.getForeverLocalKey("mituGuideAsked", false) == false then
				uv0 = "userDefault"

				slot0:onPrePlayClick()

				return
			end

			uv4 = "userDefault"

			gGameApp:requestServer("/game/yy/mi_tu/start", function (slot0)
				uv6 = "gGameUI"

				gGameUI:stackUI("city.activity.block_blast.game", nil, {
					full = true
				}, slot6.activityID)
			end, slot4.activityID)
		end()
	end
end

function slot1.onPrePlayClick(slot0)
	userDefault.setForeverLocalKey("mituGuideAsked", true)
	gGameUI:stackUI("city.activity.block_blast.game", nil, {
		full = true
	}, slot0.activityID, true, slot0:createHandler("refreshBtnTitle"))
end

function slot1.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(135801, 135900)
	}
end

function slot1.onTaskClick(slot0)
	gGameUI:stackUI("city.activity.block_blast.task", nil, {
		full = true
	}, slot0.activityID)
end

function slot1.onRankClick(slot0)
	gGameApp:requestServer("/game/yy/mi_tu/rank", function (slot0)
		uv7 = "gGameUI"

		gGameUI:stackUI("city.activity.block_blast.rank", nil, , slot0.view, slot7.activityID)
	end, slot0.activityID, 100)
end

function slot1.onAddClick(slot0)
	if slot0.infoData.challenge_buy_times < #csv.yunying.yyhuodong[slot0.activityID].paramMap.buyChallengeTimesRMBCost == false then
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

				gGameApp:requestServer("/game/yy/mi_tu/buy_challenge_times", function (slot0)
					gGameUI:showTip(gLanguageCsv.buySuccess)
				end, slot4.activityID)
			end
		end,
		title = gLanguageCsv.spaceTips,
		content = string.format(gLanguageCsv.mituBuyTimes, slot0.infoData.challenge_buy_times + 1 <= itertools.size(slot1.buyChallengeTimesRMBCost) and slot3[slot0.infoData.challenge_buy_times + 1] or slot3[itertools.size(slot3)], itertools.size(slot3) - slot0.infoData.challenge_buy_times),
		dialogParams = {
			clickClose = false
		}
	})
end

function slot1.initCutDown(slot0)
	slot1 = csv.yunying.yyhuodong[slot0.activityID]
	slot3 = gGameModel.role:read("yy_endtime")[slot0.activityID] or 0

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
	end, 1, 0, "blockBlastCutDown")
end

function slot1.refreshBtnTitle(slot0)
	slot0.openBtn:get("icon"):texture(userDefault.getForeverLocalKey("mituGuideAsked", false) == false and "activity/block_blast/title1.png" or "activity/element_crush/txt_xxl_ksyx.png")
end

return slot1
