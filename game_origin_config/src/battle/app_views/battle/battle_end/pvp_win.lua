slot0 = class("BattleEndPvpWinView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "battle_end_pvp_win.json"
slot0.RESOURCE_BINDING = {
	imgBestCard = "bestCard",
	awardsList = "awardsList",
	playBackPanel = "playBackPanel",
	textReward = "textReward",
	["imgRankBg.imgUp"] = "imgUp",
	imgNewRecord = "newRecord",
	cardItem = "awardsItem",
	sliderRankBg = "sliderRankPanel",
	["imgRankBg.bg"] = "imgRankBg",
	sharePanel = "sharePanel",
	imgRankBg = "imgRankPanel",
	["imgBestBg.bestName"] = {
		varname = "bestName",
		binds = {
			event = "effect",
			data = {
				italic = true,
				outline = {
					color = ui.COLORS.NORMAL.RED
				}
			}
		}
	},
	["playBackPanel.playBackBg"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlayBackBtnClick")
			}
		}
	},
	["playBackPanel.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["sharePanel.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["sharePanel.shareBg"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShareBtnClick")
			}
		}
	},
	imgBg = {
		binds = {
			event = "click",
			method = bindHelper.self("onCloseClick")
		}
	},
	["sliderRankBg.head"] = {
		binds = {
			event = "effect",
			data = {
				italic = true,
				outline = {
					color = ui.COLORS.NORMAL.BLACK
				}
			}
		}
	},
	["sliderRankBg.rankUp"] = {
		binds = {
			event = "effect",
			data = {
				italic = true,
				outline = {
					color = ui.COLORS.NORMAL.BLACK
				}
			}
		}
	},
	["sliderRankBg.score"] = {
		binds = {
			event = "effect",
			data = {
				italic = true,
				outline = {
					color = ui.COLORS.NORMAL.BLACK
				}
			}
		}
	},
	["sliderRankBg.teamScoreBg.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.RED
				}
			}
		}
	},
	["imgRankBg.rank"] = {
		varname = "rank",
		binds = {
			event = "effect",
			data = {
				italic = true,
				outline = {
					color = ui.COLORS.NORMAL.RED
				}
			}
		}
	},
	["imgRankBg.rankUp"] = {
		varname = "rankUp",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(235, 99, 54, 255)
				}
			}
		}
	}
}
slot1 = {
	default = function (slot0, slot1, slot2, slot3)
		slot0.rank:text(slot1)
		slot0.rankUp:text(slot3.rank_move)
		adapt.oneLineCenterPos(cc.p(400, 80), {
			slot0.rank,
			slot0.imgUp,
			slot0.rankUp
		}, cc.p(20, 0))
	end,
	crossArena = function (slot0, slot1, slot2, slot3)
		slot4 = slot0.results.curData
		slot5 = slot0.results.preData

		slot0.rank:text(slot5.stageName .. " " .. slot5.rank)
		slot0.rankUp:text(slot4.stageName .. " " .. slot4.rank)
		slot0.rankUp:setRotationSkewX(12)
		adapt.oneLineCenterPos(cc.p(550, 80), {
			slot0.rank,
			slot0.imgUp,
			slot0.rankUp
		}, cc.p(40, 0))
		slot0.newRecord:y(900)

		slot8 = slot0.rank:x() - slot0.rank:anchorPoint().x * slot0.rank:width()
		slot10 = 240

		slot0.imgRankBg:x(slot8 - slot10):width(slot0.rankUp:x() + (1 - slot0.rankUp:anchorPoint().x) * slot0.rankUp:width() - slot8 + slot10)

		slot0.crossData = table.deepcopy(gGameModel.cross_arena:read("record").history, true)

		table.sort(slot0.crossData, function (slot0, slot1)
			return slot1.time < slot0.time
		end)
	end,
	onlineFight = function (slot0, slot1, slot2, slot3)
		if slot0.results.serverData.view.pattern == 1 then
			slot0.crossData = table.deepcopy(gGameModel.cross_online_fight:read("unlimited_history"), true)
		else
			slot0.crossData = table.deepcopy(gGameModel.cross_online_fight:read("limited_history"), true)
		end

		table.sort(slot0.crossData, function (slot0, slot1)
			return slot1.time < slot0.time
		end)
		slot0.rank:text(slot1)
		slot0.rankUp:text(slot3.rank_move)
		adapt.oneLineCenterPos(cc.p(400, 80), {
			slot0.rank,
			slot0.imgUp,
			slot0.rankUp
		}, cc.p(20, 0))
	end,
	gymLeader = function (slot0, slot1, slot2, slot3)
		slot0.newRecord:loadTexture("city/pvp/reward/panle_gx.png"):scale(1):visible(true):xy(slot0.imgRankPanel:x(), slot0.imgRankPanel:y())
		rich.createByStr(slot0.results.gymMember and gLanguageCsv.gymMemberBattleWin or string.format(gLanguageCsv.gymLeaderBattleWin, slot0.results.gymName), matchLanguage({
			"kr",
			"en"
		}) and 65 or 80):anchorPoint(0.5, 0.5):xy(slot4, slot5 + 22):addTo(slot0.newRecord:parent()):z(10)
		slot0.imgRankPanel:hide()
		slot0.sharePanel:hide()
	end,
	crossMine = function (slot0, slot1, slot2, slot3)
		slot0.imgRankPanel:xy(slot0.imgRankPanel:x(), slot0.imgRankPanel:y() + 150)

		if slot3.speed then
			rich.createByStr(string.format(gLanguageCsv.crossMinePVPSpeed, slot3.speed), 50):anchorPoint(0, 0.5):xy(slot4 - 290, slot5 + 50):addTo(slot0.imgRankPanel:parent()):z(10)
		end

		if slot3.robNum then
			slot6 = ccui.ImageView:create():anchorPoint(0.5, 0.5):xy(slot4 - 200, slot5 - 50):addTo(slot0.imgRankPanel:parent()):texture("city/pvp/cross_mine/icon_kfzy.png"):show()

			rich.createByStr(string.format(gLanguageCsv.crossMinePVPRob, slot3.robNum), 60):anchorPoint(0, 0.5):xy(slot4 - 120, slot5 - 50):addTo(slot0.imgRankPanel:parent()):z(10)
		end

		slot0.rank:text(slot1)
		slot0.rankUp:text(slot3.rank_move)

		slot0.crossData = table.deepcopy(gGameModel.cross_mine:read("record").history, true)
	end,
	crossSupremacy = function (slot0, slot1, slot2, slot3)
		slot0.sliderRankPanel:visible(true)
		slot0.imgRankPanel:visible(false)

		slot4 = slot0.sliderRankPanel
		slot6 = slot0.results.preData

		slot4:get("head"):text(gLanguageCsv.winPoint .. ":")
		slot0:getResourceNode():get("title"):y(slot0:getResourceNode():get("title"):y() - 50)
		slot4:get("rankBar.rankNew"):setPercent(slot6.lerp / slot6.limit * 100)

		if slot0.results.curData.score ~= slot6.score then
			slot8 = 1

			if slot5.rankScore < slot6.rankScore then
				transition.executeSequence(slot7):progressTo(slot8, 0):func(function ()
					uv0 = "setPercent"

					slot0:setPercent(100)
				end):progressTo(slot8, slot5.lerp / slot5.limit * 100)
			elseif slot6.rankScore < slot5.rankScore then
				slot9:progressTo(slot8, 100):func(function ()
					uv0 = "setPercent"

					slot0:setPercent(0)
				end):progressTo(slot8, slot5.lerp / slot5.limit * 100)
			else
				slot9:progressTo(slot8, slot5.lerp / slot5.limit * 100)
			end

			slot9:done()
		end

		slot4:get("rankUp"):text(slot3.score_move)

		if slot3.score_move < 0 then
			slot4:get("imgUp"):texture("common/icon/logo_arrow_red.png")
		end

		if slot5.limit <= 0 then
			slot4:get("score"):text(slot5.lerp)
		else
			slot4:get("score"):text(slot5.lerp .. "/" .. slot5.limit)
		end

		slot0.textReward:x(slot0.awardsList:getPosition() + slot0.awardsList:size().width / 2)
		slot0.textReward:show()

		if next(slot3.award) ~= nil then
			slot0.awardsList:show()

			slot10 = {}

			for slot14, slot15 in pairs(slot3.award) do
				table.insert(slot10, {
					key = slot14,
					num = slot15
				})
			end

			uiEasy.createItemsToList(slot0, slot0.awardsList, slot10, {
				margin = 50,
				onAfterBuild = function ()
					uv0 = "awardsList"

					slot0.awardsList:setItemAlignCenter()
				end
			})

			if slot2 > 0 then
				slot4:get("teamScoreBg"):x(slot4:get("teamScoreBg"):x() - 270)
				slot0.newRecord:xy(slot0.newRecord:x() + 270, slot0.newRecord:y() + 365)
			end
		end

		slot4:get("teamScoreBg.text"):text(string.format("%s  :  %s", slot0.results.teamScore[1], slot0.results.teamScore[2]))

		slot0.crossData = table.deepcopy(gGameModel.cross_supremacy:read("record").history, true)
	end
}

function slot0.playEffect(slot0)
	slot1 = slot0:getResourceNode()

	widget.addAnimationByKey(slot1, "level/zhandoujiangli.skel", "selEffect", "zhandoushengli", 100):anchorPoint(cc.p(0.5, 0.5)):xy(slot1:get("title"):xy()):addPlay("zhandoushengli_loop")
end

function slot0.plsyBestEffect(slot0)
	widget.addAnimationByKey(slot0:getResourceNode(), "level/zhandoujiangli.skel", "selEffect2", "quanchangzuijia", 2):anchorPoint(cc.p(0.5, 0.5)):xy(slot0.bestCard:xy()):addPlay("quanchangzuijia_loop")
end

function slot0.onCreate(slot0, slot1, slot2, slot3)
	audio.playEffectWithWeekBGM("pvp_win.mp3")

	slot0.data = slot2
	slot0.results = slot3
	slot0.bestCardId = slot3.unitID
	slot6 = nil

	if gGameModel.cards:find(slot3.dbID) then
		slot6 = slot5:read("name")
	end

	if not slot5 or not slot6 or slot6 == "" then
		slot6 = csv.cards[csv.unit[slot0.bestCardId].cardID].name
	end

	if slot3.recordType and slot3.recordType == "jf" then
		slot0.imgRankBg:loadTexture("battle/end/win/img_jifen_bg.png")
	end

	slot0:cardPosCorrect()
	slot0.bestName:text(slot6)
	slot0:bestCardScale()
	slot0:plsyBestEffect()

	slot10 = nil
	slot10 = slot7.rank and slot9 + slot7.rank_move
	slot11 = slot0.newRecord
	slot11 = slot11.visible

	slot11(slot11, (slot3.serverData.view.top_move or 0) > 0)

	uv11 = "audio"

	if not slot11[slot3.flag] then
		uv11 = "audio"
		slot11 = slot11.default
	end

	slot11(slot0, slot9, slot8, slot7)
	slot0:playEffect()
end

function slot0.showItem(slot0, slot1, slot2)
	function slot3(slot0, slot1)
		slot2 = slot0:size()
		slot3 = cc.Sprite:create(slot1):addTo(slot0, 999):anchorPoint(1, 1):xy(slot2.width, slot2.height)
	end

	slot4 = slot0.awardsItem:clone()

	slot4:show()

	slot5 = slot2[slot1]

	bind.extend(slot0, slot4, {
		class = "icon_key",
		props = {
			data = {
				key = slot5.key,
				num = slot5.num
			},
			specialKey = {
				maxLimit = true
			},
			onNode = function (slot0)
				slot1, slot2 = slot0:xy()

				slot0:xy(slot1, slot2 + 3)
				slot0:hide():z(2)
				transition.executeSequence(slot0, true):delay(0.5):func(function ()
					uv0 = "show"

					slot0:show()
				end):done()
			end
		}
	})
	slot0.awardsList:setItemsMargin(25)
	slot0.awardsList:pushBackCustomItem(slot4)
	slot0.awardsList:setScrollBarEnabled(false)
	transition.executeSequence(slot0.awardsList):delay(0.1):func(function ()
		uv0 = "table"
		uv2 = "length"

		if slot0 < table.length(slot2) then
			uv0 = "showItem"
			uv2 = "table"
			uv3 = "length"

			slot0:showItem(slot2 + 1, slot3)
		end
	end):done()
end

function slot0.onPlayBackBtnClick(slot0)
	sdk.trackEvent("arenawin_replay")

	if slot0.results.flag == "onlineFight" then
		slot1 = slot0.data

		if not slot0.data.play_record_id or not slot0.data.cross_key then
			slot2 = nil
			slot2 = (slot0.results.serverData.view.pattern ~= 1 or table.deepcopy(gGameModel.cross_online_fight:read("unlimited_history"), true)) and table.deepcopy(gGameModel.cross_online_fight:read("limited_history"), true)

			table.sort(slot2, function (slot0, slot1)
				return slot1.time < slot0.time
			end)

			slot1 = slot2[1]
		end

		gGameModel:playRecordBattle(slot1.play_record_id, slot1.cross_key, "/game/cross/online/playrecord/get", 0)

		return
	end

	battleEntrance.battleRecord(slot0.data, slot0.results):show()
end

function slot0.onShareBtnClick(slot0)
	slot1 = ""
	slot2 = ""
	slot3 = slot0.data

	if slot0.results.flag == "crossArena" then
		slot1 = "cross_arena_battle_share_times"
		slot2 = "crossArena"
		slot3 = slot0.crossData[1]
	elseif slot0.results.flag == "onlineFight" then
		slot1 = "cross_online_fight_share_times"
		slot2 = "onlineFight"
		slot3 = slot0.crossData[1]
		slot3.enemy_name = slot3.enemy.name
	elseif slot0.results.flag == "crossMine" then
		slot1 = "cross_mine_share_times"
		slot2 = "crossMine"
		slot3 = slot0.crossData[1]
	elseif slot0.results.flag == "crossSupremacy" then
		slot1 = "cross_supremacy_share_times"
		slot2 = "crossSupremacy"
		slot3 = slot0.crossData[1]
	end

	if slot1 ~= "" and slot2 ~= "" then
		if gCommonConfigCsv.shareTimesLimit <= gGameModel.daily_record:getIdler(slot1):read() then
			gGameUI:showTip(gLanguageCsv.shareTimesNotEnough)

			return
		end

		gGameUI:showDialog({
			btnType = 2,
			isRich = false,
			cb = function ()
				uv4 = "gGameApp"
				uv5 = "gGameApp"
				uv6 = "requestServer"
				uv7 = "gGameApp"

				gGameApp:requestServer("/game/battle/share", function (slot0)
					gGameUI:showTip(gLanguageCsv.recordShareSuccess)
					sdk.trackEvent("share_arenawin")
				end, slot4.play_record_id, slot5.enemy_name, slot6, slot7.cross_key)
			end,
			content = string.format(gLanguageCsv.shareBattleNote, gCommonConfigCsv.shareTimesLimit - slot4 .. "/" .. gCommonConfigCsv.shareTimesLimit)
		})
	else
		slot4 = slot0.data

		uiEasy.shareBattleToChat(slot4.battleID, slot4.names[2])
	end
end

function slot0.onCloseClick(slot0)
	if slot0.results.backCity == true then
		gGameUI:switchUI("city.view")
	elseif slot0.results.flag == "crossArena" or slot0.results.flag == "crossSupremacy" then
		slot0:onClose()
		slot0.showEndView()
	else
		gGameUI:switchUI("city.view")
	end
end

function slot0.cardPosCorrect(slot0)
	slot1, slot2 = slot0.bestCard:getPosition()
	slot3 = csv.unit[slot0.bestCardId].cardShowPosC

	slot0.bestCard:setPosition(slot1 + slot3.x, slot2 + slot3.y)
end

function slot0.bestCardScale(slot0)
	slot0.bestCard:scale(csv.unit[slot0.bestCardId].cardShowScale * gCommonConfigCsv.pvpCardShowScale)
	slot0.bestCard:texture(csv.unit[slot0.bestCardId].cardShow)
end

return slot0
