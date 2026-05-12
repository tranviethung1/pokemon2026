slot0 = {
	S = 1,
	SSS = 3,
	SS = 2
}
slot3 = class("ActivityBossView", cc.load("mvc").ViewBase)
slot3.RESOURCE_FILENAME = "activity_boss.json"
slot3.RESOURCE_BINDING = {
	["leftPanel.item"] = "bossItem",
	title = "title",
	["rightPanel.drop.item"] = "dropItem",
	["centerPanel.discover"] = "discover",
	["centerPanel.escapeTime"] = "escapeTime",
	["centerPanel.escapeTip"] = "escapeTip",
	["noBoss.noBossImg"] = "noBossImg",
	["rightPanel.enemy.subList"] = "subList",
	centerPanel = "centerPanel",
	["leftPanel.myChallengeTimesNum"] = "myChallengeTimesNum",
	["centerPanel.escapeTip2"] = "escapeTip2",
	bg = "bg",
	["rightPanel.hasChallenged"] = "hasChallenged",
	["rightPanel.effect.textList"] = "effectText",
	noBoss = "noBoss",
	["rightPanel.timesNum"] = "timesNum",
	["leftPanel.item.pos"] = "pos",
	leftPanel = "leftPanel",
	["centerPanel.spine"] = "cardSpine",
	["rightPanel.enemy.item"] = "enemyItem",
	["leftPanel.item.challenged"] = "challenged",
	["centerPanel.bossAppearText"] = "bossAppearText",
	rightPanel = "rightPanel",
	btnRule = {
		varname = "rule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRule")
			}
		}
	},
	["leftPanel.myChallengeTimesText"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(58, 31, 47, 255)
				}
			}
		}
	},
	["leftPanel.item.ChallengeTimesText"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(96, 86, 94, 255)
				}
			}
		}
	},
	["leftPanel.item.timeText"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(96, 86, 94, 255)
				}
			}
		}
	},
	["leftPanel.item.discover"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(96, 86, 94, 255)
				}
			}
		}
	},
	["leftPanel.item.discoverName"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(96, 86, 94, 255)
				}
			}
		}
	},
	["leftPanel.item.myBoss"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(241, 62, 86, 255)
				}
			}
		}
	},
	["leftPanel.bossList"] = {
		varname = "bossList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("bossDatas"),
				item = bindHelper.self("bossItem"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0:setRenderHint(0)
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("bgK"):visible(slot3.isSel == true)
					slot1:get("new"):visible(false)
					slot1:get("myBoss"):visible(slot3.myBoss)
					slot1:get("challenged"):visible(slot3.myBoss == true and slot3.ownerWin == true)
					slot1:get("discoverName"):text(getServerArea(slot3.gameKey) .. " " .. slot3.discoverName)
					slot1:get("ChallengeTimesNum"):text(slot3.remainTime .. "/" .. slot3.maxTimes)
					slot1:get("pos"):get("img"):xy(slot1:get("pos"):get("img"):x() + slot3.posX, slot1:get("pos"):get("img"):y() + slot3.posY)
					slot1:get("pos"):get("img"):scale(slot3.scale)

					slot5 = slot1:get("discoverName")

					adapt.oneLinePos(slot5, slot1:get("discover"), cc.p(5, 0))

					uv5 = "get"

					if slot3.hardDegree == slot5.S then
						slot1:get("degreeImg"):texture("activity/activity_boss/icon_wsj_s.png")
					else
						uv5 = "get"

						if slot3.hardDegree == slot5.SS then
							slot1:get("degreeImg"):texture("activity/activity_boss/icon_wsj_ss.png")
						else
							uv5 = "get"

							if slot3.hardDegree == slot5.SSS then
								slot1:get("degreeImg"):texture("activity/activity_boss/icon_wsj_sss.png")
							end
						end
					end

					slot1:get("degreeImg"):x(slot1:get("degreeImg"):x() + slot3.hardDegree * 10)
					bind.extend(slot0, slot1:get("timeNum"), {
						class = "cutdown_label",
						props = {
							endTime = slot3.endTime,
							endFunc = function ()
							end
						}
					})
					adapt.oneLinePos(slot1:get("ChallengeTimesNum"), slot1:get("ChallengeTimesText"), nil, "right")
					adapt.oneLinePos(slot1:get("timeNum"), slot1:get("timeText"), nil, "right")
					slot1:get("pos"):get("img"):texture(csv.unit[csv.scene_conf[slot3.gateId].boss[1].unitId].cardShow)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBossItemClick")
			}
		}
	},
	["leftPanel.btnRefresh"] = {
		varname = "btnRefresh",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRefresh")
			}
		}
	},
	["rightPanel.effect.titleBg.titleText"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(54, 0, 0, 255)
				}
			}
		}
	},
	["rightPanel.enemy.titleText"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(54, 0, 0, 255)
				}
			}
		}
	},
	["rightPanel.enemy.list"] = {
		varname = "enemyList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				topPadding = 20,
				data = bindHelper.self("enemyData"),
				columnSize = 3,
				item = bindHelper.self("subList"),
				cell = bindHelper.self("enemyItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							showAttribute = true,
							unitId = slot3.id,
							advance = slot3.advance,
							rarity = slot3.rarity,
							levelProps = {
								data = slot3.level
							},
							isBoss = slot3.isBoss,
							onNode = function (slot0)
								uv1 = "scale"

								slot1:scale(0.9)
							end
						}
					})
				end
			}
		}
	},
	["rightPanel.drop.titleText"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(54, 0, 0, 255)
				}
			}
		}
	},
	["rightPanel.drop.list"] = {
		varname = "dropList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("dropDatas"),
				item = bindHelper.self("dropItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key,
								num = slot3.num
							},
							onNode = function (slot0)
								slot0:scale(0.7)
							end
						}
					})
				end
			}
		}
	},
	["rightPanel.btnPlayer"] = {
		varname = "btnPlayer",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClearance")
			}
		}
	},
	["rightPanel.btnChallenge"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChallenge")
			}
		}
	},
	["rightPanel.btnChallenge.text"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot3.onCreate(slot0, slot1, slot2)
	slot0.data = slot0.data or slot2
	slot0.activityId = slot1

	slot0:initModel()

	slot0.topView = gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "ACTIVITYBOSS",
		title = gLanguageCsv.huodongBoss
	})
	slot0.huodongID = csv.yunying.yyhuodong[slot1].huodongID
	slot0.yyData = slot0.yyhuodongs[slot1] or {}
	slot0.yyCfg = slot3
	slot0.selIdx = idler.new(1)
	slot0.bossDatas = idlers.newWithMap({})
	slot0.dropDatas = idlers.newWithMap({})
	slot0.enemyData = idlers.newWithMap({})
	slot0.minTime = idler.new(0)

	slot0:initBossList(slot0.data)
	slot0.selIdx:addListener(function (slot0, slot1)
		uv2 = "bossDatas"

		if slot2.bossDatas:atproxy(slot1) then
			uv2 = "bossDatas"
			slot2.bossDatas:atproxy(slot1).isSel = false
		end

		uv2 = "bossDatas"

		if slot2.bossDatas:atproxy(slot0) then
			uv2 = "bossDatas"
			slot2 = slot2.bossDatas:atproxy(slot0)
			slot2.isSel = true
			uv2 = "bossDatas"

			slot2:initRightPanel(slot0)
		end
	end)

	if slot0.count ~= 0 then
		slot0.selIdx:set(math.min(slot0.count, slot0.selIdx:read()), true)
	end

	slot0.minTime:addListener(function (slot0, slot1)
		uv2 = "enableSchedule"
		slot2 = slot2:enableSchedule()
		slot2 = slot2.unSchedule

		slot2(slot2, 100)

		uv2 = "enableSchedule"
		slot3 = time.getTime()
		slot2 = slot2.minTime:read() - slot3
		uv3 = "enableSchedule"

		slot3:schedule(function ()
			uv0 = "onRefresh"
			uv0 = 1
			uv0 = "onRefresh"

			if slot0 - 1 <= 0 then
				uv0 = "onRefresh"

				slot0:onRefresh()

				return false
			end
		end, 1, 1, 100)
	end)

	if slot0.challenge == true then
		slot0.challenge = false

		slot0:onRefresh(function ()
			uv0 = "selIdx"
			slot0 = slot0.selIdx
			slot1 = slot0
			uv1 = "selIdx"

			if slot1.bossDatas:atproxy(slot0.read(slot1)) then
				uv1 = "selIdx"
				uv3 = "selIdx"

				slot1:initRightPanel(slot3.selIdx:read())
			end
		end)
	end
end

function slot3.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:read("yyhuodongs")
	slot0.id = gGameModel.role:read("id")
end

function slot3.initBossList(slot0, slot1)
	slot0.data = slot1
	slot0.count = #slot1.view.huodongboss

	slot0.noBoss:visible(true)
	slot0.leftPanel:visible(false)
	slot0.centerPanel:visible(false)
	slot0.rightPanel:visible(false)

	if #slot1.view.huodongboss > 0 then
		slot2 = {}

		for slot6, slot7 in ipairs(slot1.view.huodongboss) do
			slot9 = 0
			slot10 = nil
			slot11 = {}

			if not slot7.win_roles then
				slot9 = csv.yunying.huodongboss[slot7.gate_id].times
				slot10 = false
			else
				slot10 = true
				slot9 = slot8.times - #slot7.win_roles
				slot11 = slot7.win_roles
			end

			if slot7.owner.role_id == slot0.id and slot7.owner_win then
				table.insert(slot11, {
					name = gGameModel.role:read("name"),
					level = gGameModel.role:read("level"),
					frame = gGameModel.role:read("frame"),
					logo = gGameModel.role:read("logo"),
					fight_point = gGameModel.role:read("top6_fighting_point"),
					game_key = gGameApp.serverInfo.key
				})
			end

			slot12 = false

			if #slot7.win_roles > 0 then
				for slot16, slot17 in ipairs(slot7.win_roles) do
					if slot17.role_id == slot0.id then
						slot12 = true
					end
				end
			end

			if slot9 == 0 and slot7.owner.role_id ~= slot0.id then
				slot12 = true
			end

			function slot13(slot0, slot1)
				slot2 = {}

				for slot6, slot7 in ipairs(slot0) do
					table.insert(slot2, {
						id = slot7.unitId,
						level = slot7.level,
						advance = slot7.advance,
						rarity = csv.unit[slot7.unitId].rarity,
						isBoss = slot1
					})
				end

				table.sort(slot2, function (slot0, slot1)
					return slot1.advance < slot0.advance
				end)

				return slot2
			end

			slot14 = csv.scene_conf[slot7.gate_id]

			if slot12 == false then
				table.insert(slot2, {
					gateId = slot7.gate_id,
					uId = slot7.uid,
					startTime = slot7.start_time,
					endTime = slot7.start_time + slot8.timeLimit * 60,
					maxTimes = slot8.times,
					remainTime = slot9,
					hardDegree = slot8.hardDegree,
					posX = slot8.posX,
					posY = slot8.posY,
					scale = slot8.scale,
					myBoss = slot7.owner.role_id == slot0.id,
					discoverName = slot7.owner.name,
					haveWinRole = slot10,
					winRoles = slot11,
					ownerWin = slot7.owner_win,
					hasChallenge = slot12,
					enemyData = arraytools.merge({
						slot13(slot14.boss, true),
						slot13(slot14.monsters, false)
					}),
					new = time.getTime() - slot7.start_time < gCommonConfigCsv.huodongbossNewTimes * 60,
					posX = slot8.posX,
					posY = slot8.posY,
					scale = slot8.scale,
					gameKey = slot7.owner.game_key
				})
			end
		end

		if #slot2 <= 0 then
			slot0.bossDatas:update(slot2)

			return
		end

		slot0.noBoss:visible(false)
		slot0.leftPanel:visible(true)
		slot0.centerPanel:visible(true)
		slot0.rightPanel:visible(true)

		for slot7 = 1, #slot2 do
			slot3 = math.min(slot2[1].endTime, slot2[slot7].endTime)
		end

		slot0.minTime:set(slot3)
		table.sort(slot2, function (slot0, slot1)
			if slot0.myBoss ~= slot1.myBoss then
				return slot0.myBoss == true
			end

			if slot0.startTime ~= slot1.startTime then
				return slot0.startTime < slot1.startTime
			end

			if slot0.remainTime ~= slot1.remainTime then
				return slot1.remainTime < slot0.remainTime
			end

			return slot1.gateId < slot0.gateId
		end)
		dataEasy.tryCallFunc(slot0.bossList, "updatePreloadCenterIndex")
		slot0.bossDatas:update(slot2)
		slot0.selIdx:set(math.min(slot0.count, slot0.selIdx:read()), true)

		slot6 = csv.yunying.huodongboss_config[slot1.view.csv_id].dailyChallengeLimit

		slot0.myChallengeTimesNum:text(slot6 - gGameModel.daily_record:read("huodong_boss_times") .. "/" .. slot6)
	end
end

function slot3.onRefresh(slot0, slot1)
	gGameApp:requestServer("/game/yy/huodongboss/list", function (slot0)
		uv1 = "initBossList"
		slot2 = slot1

		slot1.initBossList(slot2, slot0)

		uv2 = "type"

		if type(slot2) == "function" then
			uv1 = "type"

			slot1()
		end
	end, slot0.activityId, gCommonConfigCsv.huodongbossMaxNumber)
end

function slot3.onRule(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1000
	})
end

function slot3.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(151),
		slot2.noteText(107001, 107007)
	}
end

function slot3.onClearance(slot0)
	slot1 = {}

	if slot0.bossDatas:atproxy(slot0.selIdx:read()).haveWinRole then
		slot1 = slot0.bossDatas:atproxy(slot0.selIdx:read()).winRoles
	end

	gGameUI:stackUI("city.activity.activity_boss.clearance", nil, , table.shallowcopy(slot1))
end

function slot3.onChallenge(slot0)
	slot1 = gGameModel.daily_record:read("huodong_boss_times")
	slot2 = csv.yunying.huodongboss_config[slot0.data.view.csv_id].dailyChallengeLimit

	if slot0.bossDatas:atproxy(slot0.selIdx:read()).myBoss and slot4.ownerWin then
		gGameUI:showTip(gLanguageCsv.huoDongBossChallenged)

		return
	end

	if slot2 - slot1 == 0 and slot4.myBoss == false then
		gGameUI:showTip(gLanguageCsv.bossDailyChallengeLimit)

		return
	end

	slot5 = slot4.uId
	slot0.challenge = true

	gGameUI:stackUI("city.activity.activity_boss.embattle", nil, {
		full = true
	}, {
		from = game.EMBATTLE_FROM_TABLE.huodongBoss,
		fightCb = function (slot0, slot1, slot2)
			uv7 = "gGameApp"

			gGameApp:requestServer("/game/yy/huodongboss/list", function (slot0)
				uv1 = "initBossList"
				slot1 = slot1.initBossList

				slot1(slot1, slot0)

				uv1 = "initBossList"

				for slot4, slot5 in slot1.bossDatas:ipairs() do
					uv6 = "bossDatas"

					if slot6 == slot5:read().uId then
						uv6 = "ipairs"
						slot7 = slot6
						uv7 = "initBossList"
						uv11 = "bossDatas"
						uv13 = "read"

						battleEntrance.battleRequest("/game/yy/huodongboss/battle/start", slot6.read(slot7), slot11, slot7.activityId, slot13):onStartOK(function (slot0)
							uv1 = "activityID"
							slot0.activityID = slot1
							uv1 = "idx"
							slot0.idx = slot1
							uv1 = "onClose"

							if slot1 then
								uv1 = "onClose"

								slot1:onClose(false)

								uv2 = nil
							end
						end):show()

						return
					end
				end

				uv1 = "uId"

				slot1:onClose(false)
				gGameUI:showTip(gLanguageCsv.huoDongBossNotExist)
			end, slot7.activityId, gCommonConfigCsv.huodongbossMaxNumber)
		end
	})
end

function slot3.initRightPanel(slot0, slot1)
	slot2 = csv.scene_conf[slot0.bossDatas:atproxy(slot1).gateId]
	slot3 = csv.unit[slot2.boss[1].unitId]

	slot0.bossAppearText:text(slot2.sceneName .. gLanguageCsv.huodongBossAppear)
	beauty.textScroll({
		fontSize = 35,
		isRich = true,
		list = slot0.effectText,
		strs = {
			verticalSpace = 5,
			str = "#C0xFFFCED#" .. slot2.desc
		}
	})

	if matchLanguage({
		"kr",
		"en"
	}) then
		slot0.rightPanel:get("effect.titleBg"):size(250, 60)
		slot0.rightPanel:get("enemy.titleBg"):size(250, 60)
		slot0.rightPanel:get("drop.titleBg"):size(250, 60)
	end

	slot0.cardSpine:removeAllChildren()
	widget.addAnimation(slot0.cardSpine, slot3.unitRes, "standby_loop", 5):xy(slot0.cardSpine:size().width / 2, 100):scale(slot3.scaleU * 3):setSkin(slot3.skin)

	slot6 = {}
	slot10 = slot1

	for slot10, slot11 in ipairs(slot0.bossDatas:atproxy(slot10).enemyData) do
		table.insert(slot6, {
			id = slot11.id,
			level = slot11.level,
			advance = slot11.advance,
			rarity = slot11.rarity
		})
	end

	slot0.enemyData:update(slot6)

	slot7 = {}

	for slot11, slot12 in orderCsvPairs(slot2.dropIds) do
		table.insert(slot7, {
			key = slot11,
			num = slot12
		})
	end

	slot0.dropDatas:update(slot7)
	slot0.discover:text(getServerArea(slot0.bossDatas:atproxy(slot1).gameKey) .. " " .. slot0.bossDatas:atproxy(slot1).discoverName .. " " .. gLanguageCsv.huodongBossDiscover)
	bind.extend(slot0, slot0.escapeTime, {
		class = "cutdown_label",
		props = {
			endTime = slot0.bossDatas:atproxy(slot1).endTime,
			callFunc = function ()
				uv1 = "adapt"
				uv3 = "adapt"
				slot3 = slot3.escapeTime
				uv3 = "adapt"

				adapt.oneLinePos(slot1.escapeTip, {
					slot3,
					slot3.escapeTip2
				}, {
					cc.p(5, 0),
					cc.p(5, 0)
				})
			end
		}
	})

	if slot0.bossDatas:atproxy(slot1).myBoss and slot0.bossDatas:atproxy(slot1).ownerWin then
		slot0.hasChallenged:visible(true)
	else
		slot0.hasChallenged:visible(false)
	end

	slot0.timesNum:text(slot0.bossDatas:atproxy(slot1).remainTime .. "/" .. slot0.bossDatas:atproxy(slot1).maxTimes)
end

function slot3.onBossItemClick(slot0, slot1, slot2, slot3)
	slot0.selIdx:set(slot2)
end

return slot3
