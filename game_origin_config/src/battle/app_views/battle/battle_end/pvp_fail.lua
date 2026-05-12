slot0 = class("BattleEndPvpFailView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "battle_end_pvp_fail.json"
slot0.RESOURCE_BINDING = {
	quitPanel = "quitPanel",
	awardsList = "awardsList",
	playBackPanel = "playBackPanel",
	textReward = "textReward",
	sliderRankBg = "sliderRankPanel",
	cardItem = "awardsItem",
	txt = {
		varname = "txt",
		binds = {
			event = "effect",
			data = {
				italic = true,
				outline = {
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	["playBackPanel.playBackBg"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlayBackClick")
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
	["quitPanel.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["quitPanel.quitBg"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onQuitClick")
			}
		}
	},
	imgBg = {
		varname = "imgBg",
		binds = {
			event = "click",
			method = bindHelper.self("onQuitClick")
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
					color = cc.c4b(97, 117, 156, 255)
				}
			}
		}
	}
}
slot1 = {
	[game.GATE_TYPE.summerChallenge] = function (slot0)
		slot0.quitPanel:y(slot0.quitPanel:y() + 200)
		slot0.quitPanel:x(slot0.quitPanel:x() - (slot0.quitPanel:x() - slot0.playBackPanel:x()) / 2)
		slot0.playBackPanel:hide()
		slot0.txt:hide()
	end
}

function slot0.playEffect(slot0)
	slot2 = slot0:getResourceNode()
	slot3, slot4 = slot2:get("title"):xy()

	widget.addAnimation(slot2, "level/zhandoujiangli.skel", slot0.isFail and "zhandoushibai" or "zhandoushengli", 100):anchorPoint(cc.p(0.5, 1)):xy(slot3, slot4 + 300):addPlay(slot1 and "zhandoushibai_loop" or "zhandoushengli_loop")
end

function slot0.onCreate(slot0, slot1, slot2, slot3)
	slot0.data = slot2
	slot0.results = slot3
	slot0.isFail = slot0.results.result ~= "win"

	if slot0.isFail then
		slot0.imgBg:texture("city/pvp/reward/bg_pvp_lose.png")
	else
		slot0.imgBg:texture("city/pvp/reward/bg_pvp_win.png")
	end

	if slot0.data.gateType == game.GATE_TYPE.gymLeader or slot0.data.gateType == game.GATE_TYPE.gym or slot0.data.gateType == game.GATE_TYPE.crossGym then
		slot0:getResourceNode():get("txt"):text(gLanguageCsv.gymLeaderBattleFail)
	end

	slot0:playEffect()
end

function slot0.initModes(slot0, slot1)
	slot0.modes = slot1
	uv2 = "modes"

	if slot2[slot0.data.gateType] then
		uv2 = "modes"

		slot2[slot0.data.gateType](slot0)
	end

	if slot0.modes.isRecord or not slot0.isFail or slot0.data.gateType == game.GATE_TYPE.friendFight then
		slot2 = slot0.quitPanel:y() + 200

		slot0.quitPanel:y(slot2)
		slot0.playBackPanel:y(slot2)
		slot0.txt:hide()
		slot0.textReward:hide()
	elseif slot0.results.flag == "crossSupremacy" then
		slot3 = slot2.serverData.view

		slot0.sliderRankPanel:visible(true)
		slot0.txt:hide()

		slot5 = slot2.preData
		slot6 = slot0.sliderRankPanel

		slot6:get("head"):text(gLanguageCsv.winPoint .. ":")
		slot6:get("rankBar.rankNew"):setPercent(slot5.lerp / slot5.limit * 100)

		if slot2.curData.score ~= slot5.score then
			slot8 = 1

			if slot4.rankScore < slot5.rankScore then
				transition.executeSequence(slot7):progressTo(slot8, 0):func(function ()
					uv0 = "setPercent"

					slot0:setPercent(100)
				end):progressTo(slot8, slot4.lerp / slot4.limit * 100)
			elseif slot5.rankScore < slot4.rankScore then
				slot9:progressTo(slot8, 100):func(function ()
					uv0 = "setPercent"

					slot0:setPercent(0)
				end):progressTo(slot8, slot4.lerp / slot4.limit * 100)
			else
				slot9:progressTo(slot8, slot4.lerp / slot4.limit * 100)
			end

			slot9:done()
		end

		slot6:get("rankUp"):text(slot3.score_move)

		if slot3.score_move < 0 then
			slot6:get("imgUp"):texture("common/icon/logo_arrow_red.png")
		end

		slot6:get("score"):text(slot4.lerp .. "/" .. slot4.limit)
		slot6:get("teamScoreBg.text"):text(string.format("%s  :  %s", slot2.teamScore[1], slot2.teamScore[2]))
		slot0.textReward:show()

		if next(slot3.award) ~= nil then
			slot0.awardsList:show()

			slot8 = {}

			for slot12, slot13 in pairs(slot3.award) do
				table.insert(slot8, {
					key = slot12,
					num = slot13
				})
			end

			uiEasy.createItemsToList(slot0, slot0.awardsList, slot8, {
				margin = 50,
				onAfterBuild = function ()
					uv0 = "awardsList"

					slot0.awardsList:setItemAlignCenter()
				end
			})
			slot0.quitPanel:y(slot0.quitPanel:y() - 125)
			slot0.playBackPanel:y(slot0.playBackPanel:y() - 125)
		end
	end
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

function slot0.onPlayBackClick(slot0)
	battleEntrance.battleRecord(slot0.data, slot0.results):show()
end

function slot0.onQuitClick(slot0)
	gGameUI:switchUI("city.view")
end

return slot0
