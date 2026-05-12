slot0 = class("YyBetView", cc.load("mvc").ViewBase)
slot1 = {
	binds = {
		event = "effect",
		data = {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		}
	}
}
slot2 = {
	OVER = 3,
	BATTLING = 2,
	BETTING = 1
}
slot0.RESOURCE_FILENAME = "yybet_view.json"
slot0.RESOURCE_BINDING = {
	spriteL = "spriteL",
	battlingPanel = "battlingPanel",
	infoPanel = "infoPanel",
	spriteR = "spriteR",
	["infoPanel.textNote"] = {
		varname = "textState",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["infoPanel.textTime"] = {
		varname = "textTime",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["btnMain.textNote"] = {
		varname = "subTitleText",
		binds = {
			event = "effect",
			data = {
				glow = {
					color = cc.c4b(255, 255, 255, 255)
				}
			}
		}
	},
	["downPanel.bet.name"] = slot1,
	["downPanel.bet"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onBet")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					listenData = {
						activityId = bindHelper.self("yyid")
					},
					specialTag = {
						"battleBet",
						"battleBetAward"
					},
					onNode = function (slot0)
						slot0:xy(150, 150)
					end
				}
			}
		}
	},
	["downPanel.shop.name"] = slot1,
	["downPanel.shop"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShop")
			}
		}
	},
	["downPanel.rank.name"] = slot1,
	["downPanel.rank"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRank")
			}
		}
	},
	["downPanel.award.name"] = slot1,
	["downPanel.award"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onAward")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "battleBetTaskAward",
					listenData = {
						activityId = bindHelper.self("yyid")
					},
					onNode = function (slot0)
						slot0:xy(150, 150)
					end
				}
			}
		}
	},
	["downPanel.rule.name"] = slot1,
	["downPanel.rule"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRule")
			}
		}
	},
	btnMain = {
		varname = "btnMain",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onMain")
			}
		}
	},
	rightPanel = {
		varname = "rightPanel",
		binds = {
			{
				event = "click",
				method = bindHelper.self("onGet")
			},
			{
				res = "koudai_miaomiao/hero_miaomiao.skel",
				action = "standby_loop",
				event = "animation",
				scale = {
					-2,
					2
				},
				pos = {
					x = 570,
					y = 120
				}
			}
		}
	},
	overPanel = {
		varname = "overPanel",
		binds = {
			res = "koudai_miaomiao/hero_miaomiao.skel",
			action = "win_loop",
			event = "animation",
			scale = 2,
			pos = {
				x = 100,
				y = 0
			}
		}
	},
	["overPanel.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	zhuchirenPanel = {
		varname = "comperePanel",
		binds = {
			{
				event = "click",
				method = bindHelper.self("onCompereTalk")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.tools = require("app.views.city.activity.yy_bet.tools")

	gGameModel.role:setYYCoin(slot1)
	slot0.tools.createTopui(slot0, slot1)

	slot0.yyid = slot1
	slot0.data = idlertable.new(slot2.view)
	slot0.talkIndex = 0

	slot0:initModel()
	slot0:initCompere()
	slot0:setCountdown()
	slot0:catTalk()
end

function slot0.setCountdown(slot0)
	slot1, slot2 = slot0.tools.getNextContestAndState(slot0.yyid)

	slot0.contestId:set(slot1)

	slot3 = slot0.state
	slot3 = slot3.set

	slot3(slot3, slot2)

	uv3 = "tools"

	if slot2 == slot3.OVER or slot1 == 0 then
		return
	end

	slot3 = slot0.tools.getCsv("contest")[slot1]
	slot4 = 0
	uv5 = "tools"

	if slot2 == slot5.BETTING then
		slot4 = time.getNumTimestamp(slot0.tools.getContestDate(slot0.yyid, slot3.contestDate), time.getHourAndMin(slot3.betEndTime, true))
	else
		uv5 = "tools"

		if slot2 == slot5.BATTLING then
			slot4 = time.getNumTimestamp(slot0.tools.getContestDate(slot0.yyid, slot3.contestDate), time.getHourAndMin(slot3.contestEndTime, true))
		end
	end

	bind.extend(slot0, slot0.textTime, {
		class = "cutdown_label",
		props = {
			endTime = slot4,
			endFunc = function ()
				uv1 = "performWithDelay"

				performWithDelay(slot1.textTime, function ()
					uv4 = "gGameApp"

					gGameApp:requestServer("/game/yy/battlebet/main", function (slot0)
						uv1 = "data"
						slot1 = slot1.data
						slot1 = slot1.set

						slot1(slot1, slot0.view)

						uv1 = "data"

						slot1:setCountdown()
					end, slot4.yyid)
				end, 3)
			end
		}
	})
end

function slot0.initModel(slot0)
	slot0.state = idler.new()
	slot0.contestId = idler.new()

	idlereasy.when(slot0.state, function (slot0, slot1)
		uv2 = "BETTING"

		if slot1 == slot2.BETTING then
			uv2 = "rightPanel"
			slot2 = slot2.rightPanel
			slot2 = slot2.show

			slot2(slot2)

			uv2 = "rightPanel"
			slot2 = slot2.overPanel
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "rightPanel"
			slot2 = slot2.infoPanel
			slot2 = slot2.show

			slot2(slot2)

			uv2 = "rightPanel"
			slot2 = slot2.btnMain
			slot2 = slot2.show

			slot2(slot2)

			uv2 = "rightPanel"
			slot2 = slot2.comperePanel
			slot2 = slot2.show

			slot2(slot2)

			uv2 = "rightPanel"

			slot2.textState:text(gLanguageCsv.yyBetNotStart)
		else
			uv2 = "BETTING"

			if slot1 == slot2.BATTLING then
				uv2 = "rightPanel"
				slot2 = slot2.rightPanel
				slot2 = slot2.show

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.btnMain
				slot2 = slot2.show

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.overPanel
				slot2 = slot2.hide

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.infoPanel
				slot2 = slot2.show

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.comperePanel
				slot2 = slot2.show

				slot2(slot2)

				uv2 = "rightPanel"

				slot2.textState:text(gLanguageCsv.yyBetBattling)
			else
				uv2 = "rightPanel"
				slot2 = slot2.rightPanel
				slot2 = slot2.hide

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.infoPanel
				slot2 = slot2.hide

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.btnMain
				slot2 = slot2.hide

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.overPanel
				slot2 = slot2.show

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.comperePanel
				slot2 = slot2.hide

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.textState
				slot2 = slot2.text

				slot2(slot2, gLanguageCsv.yyBetBattleEnd)

				uv2 = "rightPanel"

				slot2:updateCaptain(0)
			end
		end
	end)
	idlereasy.when(slot0.contestId, function (slot0, slot1)
		if slot1 == nil or slot1 == 0 then
			uv2 = "updateCaptain"

			slot2:updateCaptain(0)

			return
		end

		uv2 = "updateCaptain"
		slot2 = slot2.updateTeamInfo

		slot2(slot2, slot1)

		uv2 = "updateCaptain"

		slot2:updateCaptain(slot1)
	end)
end

function slot0.onMain(slot0)
	gGameApp:requestServer("/game/yy/battlebet/contest", function (slot0)
		uv6 = "gGameUI"
		uv8 = "gGameUI"
		uv11 = "stackUI"

		gGameUI:stackUI("city.activity.yy_bet.bet_view", nil, {
			full = true
		}, slot6.yyid, slot0.view, slot8:createHandler("getWiner", slot11))
	end, slot0.yyid, slot0.contestId:read())
end

function slot0.onBet(slot0)
	slot2 = slot0.data:read().rank or 0

	if slot1.rank ~= 0 then
		slot3 = slot1.total - 1
	else
		slot2 = slot1.total
	end

	gGameUI:stackUI("city.activity.yy_bet.record", nil, {
		clickClose = true
	}, slot0.yyid, slot3 <= 0 and 0 or math.floor((slot1.total - slot2) / slot3 * 100), slot0:createHandler("getData"))
end

function slot0.getData(slot0)
	return slot0.state, slot0.contestId, slot0.data
end

function slot0.onShop(slot0)
	gGameUI:stackUI("city.activity.yy_bet.shop", nil, {
		full = true
	}, slot0.yyid)
end

function slot0.onRank(slot0)
	gGameApp:requestServer("/game/yy/battlebet/rank", function (slot0)
		uv7 = "gGameUI"

		gGameUI:stackUI("city.activity.yy_bet.rank", nil, , slot0.view, slot7.yyid)
	end, slot0.yyid)
end

function slot0.onAward(slot0)
	gGameUI:stackUI("city.activity.yy_bet.award", nil, , slot0.yyid)
end

function slot0.onRule(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1500
	})
end

function slot0.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(127001, 127040)
	}
end

function slot0.onGet(slot0)
	gGameUI:stackUI("city.activity.yy_bet.prompt_box", nil, , slot0.yyid)
end

function slot0.initCompere(slot0)
	slot0.comperePanel:get("imgBg"):hide()

	slot0.compereSpine = widget.addAnimationByKey(slot0.comperePanel, "spine/battlebet/zhuchiren.skel", "compereSpine", "standby_loop", 20)

	slot0.compereSpine:xy(155, 50)
	widget.addAnimationByKey(slot0:getResourceNode(), "spine/battlebet/caidai.skel", "caidaiSpine", "caidai_loop", 20):xy(slot0:getResourceNode():width() / 2, slot0:getResourceNode():height() / 2)
end

function slot0.onCompereTalk(slot0)
	slot0.comperePanel:setTouchEnabled(false)
	slot0.comperePanel:get("imgBg"):show()
	slot0.compereSpine:play("effect")

	slot0.talkIndex = slot0.talkIndex + 1

	slot0:createFriendTalk(slot2[slot0.talkIndex % itertools.size(slot0.tools.getCsv("base")[csv.yunying.yyhuodong[slot0.yyid].paramMap.base].words) == 0 and itertools.size(slot2) or slot0.talkIndex % itertools.size(slot2)])
	slot0.compereSpine:setSpriteEventHandler(function (slot0, slot1)
		uv2 = "compereSpine"
		slot2 = slot2.compereSpine
		slot2 = slot2.play

		slot2(slot2, "standby_loop")

		uv2 = "compereSpine"
		slot2 = slot2.comperePanel
		slot2 = slot2.setTouchEnabled

		slot2(slot2, true)

		uv2 = "compereSpine"

		slot2.comperePanel:get("imgBg"):hide()
	end, sp.EventType.ANIMATION_COMPLETE)
end

function slot0.updateTeamInfo(slot0, slot1)
	slot0.infoPanel:get("textNameL"):text(slot0.tools.getCsv("teams")[slot0.tools.getCsv("contest")[slot1].leftTeam].name)
	slot0.infoPanel:get("textNameR"):text(slot0.tools.getCsv("teams")[slot0.tools.getCsv("contest")[slot1].rightTeam].name)
end

function slot0.updateCaptain(slot0, slot1)
	slot0.spriteR:removeChildByName("sprite")
	slot0.spriteL:removeChildByName("sprite")

	if slot1 == 0 then
		slot0.spriteL:hide()
		slot0.spriteR:hide()

		return
	end

	slot0.spriteL:show()
	slot0.spriteR:show()

	slot2 = slot0.tools.getCsv("contest")[slot1].leftTeam
	slot5 = slot0.tools.getCsv("cards")[slot0.tools.getCsv("teams")[slot2].team[slot0.tools.getCsv("teams")[slot2].captainID]].cardID
	slot6 = dataEasy.getUnitCsv(slot5, 0)
	slot8 = csv.unit[csv.cards[slot5].unitID]

	widget.addAnimation(slot0.spriteL, slot6.unitRes, "standby_loop", 11):scaleX(slot6.scale):scaleY(slot6.scale):xy(150, 0):z(0):name("sprite"):setSkin(slot6.skin)

	slot10 = slot0.tools.getCsv("contest")[slot1].rightTeam
	slot13 = slot0.tools.getCsv("cards")[slot0.tools.getCsv("teams")[slot10].team[slot0.tools.getCsv("teams")[slot10].captainID]].cardID
	slot14 = dataEasy.getUnitCsv(slot13, 0)
	slot16 = csv.unit[csv.cards[slot13].unitID]

	widget.addAnimation(slot0.spriteR, slot14.unitRes, "standby_loop", 11):scaleX(-slot14.scale):scaleY(slot14.scale):xy(150, 0):z(0):name("sprite"):setSkin(slot14.skin)
	slot0.spriteL:z(100)
	slot0.spriteR:z(100)
end

function slot0.createFriendTalk(slot0, slot1)
	slot2 = slot0.comperePanel:get("imgBg"):show()

	slot2:removeChildByName("richText")
	slot2:height(rich.createWithWidth("#C0x5B545B#" .. slot1, 40, nil, 350):align(cc.p(1, 0), 375, 40):addTo(slot2):z(3):name("richText"):height() + 60)
end

function slot0.catTalk(slot0)
	slot0.rightPanel:get("imgBg"):visible(not slot0.rightPanel:get("imgBg"):isVisible())
	performWithDelay(slot0.rightPanel:get("imgBg"), function ()
		uv0 = "catTalk"

		slot0:catTalk()
	end, 5)
end

function slot0.getWiner(slot0, slot1)
	if ((slot0.data:read().contests or {})[slot1] or {}).result == "win" then
		return 1
	elseif slot5 == "fail" then
		return 2
	end
end

return slot0
