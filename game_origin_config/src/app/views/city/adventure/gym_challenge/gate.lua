slot0 = {
	"city/adventure/exp/icon_jd.png",
	"city/adventure/exp/icon_kn.png",
	"city/adventure/exp/icon_jj.png",
	"city/adventure/exp/icon_ds.png",
	"city/adventure/exp/icon_ly.png",
	"city/adventure/exp/icon_sy.png"
}
slot1 = {
	OVER = 1,
	LOCK = 3,
	UNLOCK = 2
}
slot2 = class("GymGate", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "gym_gate.json"
slot2.RESOURCE_BINDING = {
	["panelLeft.imgBgCircle"] = "imgBgCircle",
	panelRightDown = "rightDownPanel",
	["panelLeft.imgBg"] = "leftBg",
	item = "item",
	["panelRightDown.attrItem"] = "attrItem",
	panelLeft = "panelLeft",
	imgFileter = "imgFileter",
	["panelLeft.imgOwner"] = "imgOwner",
	["panelLeft.textNameNPC"] = {
		varname = "textNameNPC",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(255, 89, 24, 255)
				}
			}
		}
	},
	["panelLeft.textFight"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(90, 84, 91, 255)
				}
			}
		}
	},
	["panelLeft.textName"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(90, 84, 91, 255)
				}
			}
		}
	},
	["panelLeft.textFightNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(90, 84, 91, 255)
				}
			}
		}
	},
	["panelLeft.textLv"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(90, 84, 91, 255)
				}
			}
		}
	},
	["panelLeft.btnChallenge"] = {
		varname = "btnOwerChallenge",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnOwnerChallenge")
			}
		}
	},
	["panelLeft.figure"] = {
		varname = "figure",
		binds = {
			event = "extend",
			class = "role_figure",
			props = {
				spine = true,
				data = bindHelper.self("ownerFigure"),
				onNode = function (slot0)
				end,
				onSpine = function (slot0)
					slot0:scale(2)
				end
			}
		}
	},
	["panelLeft.textTime"] = {
		varname = "textTime",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(207, 207, 207, 255)
				}
			}
		}
	},
	["panelRightDown.btnBuf.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(90, 84, 91, 255)
				}
			}
		}
	},
	["panelRightDown.btnBuf"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onBtnBuf")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "gymBuff",
					listenData = {
						gymDatas = bindHelper.self("gymDatas"),
						round = bindHelper.self("round")
					},
					onNode = function (slot0)
						slot0:xy(120, 135)
					end
				}
			}
		}
	},
	["panelRightDown.btnAward.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(90, 84, 91, 255)
				}
			}
		}
	},
	["panelRightDown.btnAward"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onBtnAward")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "gymAward",
					listenData = {
						gymDatas = bindHelper.self("gymDatas"),
						id = bindHelper.self("id")
					},
					onNode = function (slot0)
						slot0:xy(120, 120)
					end
				}
			}
		}
	},
	listview = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 4,
				data = bindHelper.self("gates"),
				item = bindHelper.self("item"),
				id = bindHelper.self("id"),
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = "imgDiff"
					slot4 = slot1:get(slot6)
					slot5 = slot4
					uv6 = "get"

					slot4.texture(slot5, slot6[slot3.diff])

					uv5 = "imgDiff"

					if slot3.state == slot5.OVER then
						slot1:get("imgOver"):show()
						slot1:get("btnChallenge"):hide()
						slot1:get("btnChallenge2"):hide()
						slot1:get("btnPass"):hide()
					else
						uv5 = "imgDiff"

						if slot3.state == slot5.UNLOCK then
							slot1:get("imgOver"):hide()

							if slot3.canPass then
								slot1:get("btnChallenge"):hide()

								slot4 = slot1:get("btnChallenge2"):show()
								slot5 = slot1:get("btnPass"):show()

								uiEasy.setBtnShader(slot4, slot4:get("textNote"), 1)
								uiEasy.setBtnShader(slot5, slot5:get("textNote"), 1)
							else
								slot4 = slot1:get("btnChallenge"):show()

								uiEasy.setBtnShader(slot4, slot4:get("textNote"), 1)
								slot1:get("btnChallenge2"):hide()
								slot1:get("btnPass"):hide()
							end
						else
							slot1:get("btnChallenge2"):hide()
							slot1:get("btnPass"):hide()
							slot1:get("imgOver"):hide()

							slot4 = slot1:get("btnChallenge"):show()

							uiEasy.setBtnShader(slot4, slot4:get("textNote"), 2)
						end
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
					bind.touch(slot0, slot1:get("btnChallenge"), {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
					bind.touch(slot0, slot1:get("btnChallenge2"), {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
					bind.touch(slot0, slot1:get("btnPass"), {
						methods = {
							ended = functools.partial(slot0.clickPass, slot2, slot3)
						}
					})
					uiEasy.createItemsToList(slot0, slot1:get("subList"), slot3.award, {
						margin = 20,
						onNode = function (slot0, slot1)
							if slot1.key ~= "gold" then
								ccui.ImageView:create("city/adventure/endless_tower/icon_gl.png"):anchorPoint(1, 0.5):xy(slot0:width() - 5, slot0:height() - 25):addTo(slot0, 15)
							end
						end
					})
				end,
				preloadCenterIndex = bindHelper.self("curHardIndex")
			},
			handlers = {
				clickCell = bindHelper.self("onGateDetail"),
				clickPass = bindHelper.self("onGatePass")
			}
		}
	},
	["panelRightDown.arrList"] = {
		varname = "arrList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("attrData"),
				item = bindHelper.self("attrItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("imgIcon"):texture(ui.ATTR_ICON[slot3])
				end
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "The Pavilion Challenge",
		title = csv.gym.gym[slot1].name
	})

	slot0.id = slot1

	slot0:initModel()
	slot0:initUI()
end

function slot2.initModel(slot0)
	slot0.gates = idlers.newWithMap({})
	slot0.gymDatas = gGameModel.role:getIdler("gym_datas")
	slot0.gatesDatas = gGameModel.gym:getIdler("gymGates")
	slot0.round = gGameModel.gym:getIdler("round")
	slot0.inCd = idler.new(false)
	slot0.curHardIndex = 1

	idlereasy.any({
		slot0.gymDatas,
		slot0.gatesDatas,
		slot0.inCd
	}, function (slot0, slot1, slot2, slot3)
		uv5 = "csv"
		uv5 = "csv"
		slot5 = slot2[slot5.id.id]
		slot6 = {}

		for slot10, slot11 in orderCsvPairs(csv.gym.gym[slot5].hardDegreeID) do
			slot12 = nil
			uv14 = "csv"

			if slot1.gym_fuben[slot14.id] == nil then
				uv13 = "gym"
				slot12 = slot13.LOCK
			else
				uv14 = "csv"

				if slot1.gym_fuben[slot14.id] == slot11 then
					uv13 = "gym"
					slot12 = slot13.UNLOCK
				else
					uv14 = "csv"

					if slot11 < slot1.gym_fuben[slot14.id] then
						uv13 = "gym"
						slot12 = slot13.OVER
					else
						uv13 = "gym"
						slot12 = slot13.LOCK
					end
				end
			end

			slot13 = 0

			if dataEasy.isUnlock(gUnlockCsv.gymPass) then
				uv16 = "csv"
				uv17 = "csv"
				slot13 = math.max(slot1.last_jump[slot16.id] or 0, slot1.history_jump[slot17.id] or 0)
			end

			slot14 = slot5[slot11]
			slot6[slot10] = {
				diff = slot10,
				state = slot12,
				award = csv.scene_conf[slot14].dropIds,
				gateId = slot14,
				canPass = slot11 <= slot13
			}
			uv17 = "csv"
			slot17 = slot17.id
			uv17 = "csv"
			slot16 = csv.gym.gym[slot17.id].hardDegreeID[csvSize(csv.gym.gym[slot17].hardDegreeID)]
			uv18 = "csv"

			if slot1.gym_fuben[slot18.id] == slot11 then
				uv17 = "csv"
				slot17.curHardIndex = slot10 + 1
			end

			uv18 = "csv"

			if slot16 < slot1.gym_fuben[slot18.id] then
				if slot3 then
					uv18 = "csv"
					uv19 = "csv"

					uiEasy.setBtnShader(slot18.btnOwerChallenge, slot19.btnOwerChallenge:get("textNote"), 3)
				else
					uv18 = "csv"
					uv19 = "csv"

					uiEasy.setBtnShader(slot18.btnOwerChallenge, slot19.btnOwerChallenge:get("textNote"), 1)
				end

				uv17 = "csv"
				slot17.ownerUnlock = true
			else
				slot17 = uiEasy.setBtnShader
				uv18 = "csv"
				uv19 = "csv"

				slot17(slot18.btnOwerChallenge, slot19.btnOwerChallenge:get("textNote"), 3)

				uv17 = "csv"
				slot17.ownerUnlock = false
			end
		end

		uv7 = "csv"

		slot7.gates:update(slot6)
	end)

	slot0.attrData = idlers.newWithMap(csv.gym.gym[slot0.id].limitAttribute)

	idlereasy.when(slot0.gymDatas, function (slot0, slot1)
		uv2 = "initCountDown"

		slot2:initCountDown()
	end)
end

function slot2.initUI(slot0)
	slot1 = "city/adventure/gym_challenge/gate/"

	slot0.imgFileter:texture(slot1 .. "bg_" .. csv.gym.gym[slot0.id].texture):size(display.sizeInView)
	slot0.imgBgCircle:texture(slot1 .. "icon_" .. csv.gym.gym[slot0.id].texture)
	slot0.leftBg:texture(slot1 .. "lighting_" .. csv.gym.gym[slot0.id].texture)
	slot0.item:get("imgTexture"):texture(slot1 .. "logo_" .. csv.gym.gym[slot0.id].texture)
	slot0.imgBgCircle:runAction(cc.RepeatForever:create(cc.RotateBy:create(90, 360)))
	slot0:initOwner()

	slot0.richText = rich.createWithWidth(gLanguageCsv.gymGateDesc, 38, nil, 800, 38):addTo(slot0.rightDownPanel, 6):setAnchorPoint(0, 0.5):xy(5, 100)
end

function slot2.initOwner(slot0)
	slot0.gymOwners = gGameModel.gym:getIdler("leaderRoles")
	slot0.ownerFigure = idler.new(1)

	idlereasy.any({
		slot0.gymOwners,
		slot0.round
	}, function (slot0, slot1, slot2)
		slot3 = nil
		slot3 = slot2 == "start" and (slot1 or {}) or gGameModel.gym:read("lastLeaderRoles") or {}
		uv4 = "start"
		slot4 = slot3[slot4.id]

		if slot3 ~= nil then
			uv5 = "start"

			if slot3[slot5.id] == nil then
				uv6 = "start"
				slot6 = csv.gym.npc[csv.gym.gym[slot6.id].npcID]
				slot8 = slot6.figure
				uv8 = "start"
				slot8 = slot8.textNameNPC:text(csv.role_figure[slot8].name)
				slot8 = slot8.show

				slot8(slot8)

				uv8 = "start"
				slot8 = slot8.ownerFigure
				slot9 = slot8

				slot8.set(slot9, slot6.figure)

				slot8 = nodetools.invoke
				uv9 = "start"

				slot8(slot9.panelLeft, {
					"textFight",
					"textName",
					"textFightNote",
					"textLv"
				}, "hide")

				uv8 = "start"
				slot8 = slot8.btnOwerChallenge
				slot8 = slot8.show

				slot8(slot8)

				uv8 = "start"

				slot8.imgOwner:texture("city/adventure/gym_challenge/txt_gz.png")
			elseif gGameModel.role:read("id") == slot4.role_id then
				uv5 = "start"
				slot5 = slot5.textNameNPC
				slot5 = slot5.hide

				slot5(slot5)

				uv5 = "start"
				slot5 = slot5.ownerFigure
				slot6 = slot5

				slot5.set(slot6, gGameModel.role:read("figure"))

				slot5 = nodetools.invoke
				uv6 = "start"

				slot5(slot6.panelLeft, {
					"textFight",
					"textName",
					"textFightNote",
					"textLv"
				}, "show")

				uv5 = "start"
				slot5 = slot5.ownerFigure
				slot5 = slot5.set

				slot5(slot5, slot4.figure)

				uv5 = "start"
				slot5 = slot5.panelLeft:get("textLv")
				slot5 = slot5.text

				slot5(slot5, gLanguageCsv.textLv .. slot4.level)

				uv5 = "start"
				slot5 = slot5.panelLeft:get("textFight")
				slot5 = slot5.text

				slot5(slot5, slot4.fighting_point)

				uv5 = "start"
				slot5 = slot5.panelLeft:get("textName")
				slot5 = slot5.text

				slot5(slot5, slot4.name)

				uv5 = "start"
				slot5 = slot5.btnOwerChallenge
				slot5 = slot5.hide

				slot5(slot5)

				uv5 = "start"
				slot5 = slot5.textTime
				slot5 = slot5.hide

				slot5(slot5)

				uv5 = "start"

				slot5.imgOwner:texture("city/adventure/gym_challenge/txt_rygz.png")
			else
				uv5 = "start"
				slot5 = slot5.textNameNPC
				slot6 = slot5

				slot5.hide(slot6)

				slot5 = nodetools.invoke
				uv6 = "start"

				slot5(slot6.panelLeft, {
					"textFight",
					"textName",
					"textFightNote",
					"textLv"
				}, "show")

				uv5 = "start"
				slot5 = slot5.ownerFigure
				slot5 = slot5.set

				slot5(slot5, slot4.figure)

				uv5 = "start"
				slot5 = slot5.panelLeft:get("textLv")
				slot5 = slot5.text

				slot5(slot5, gLanguageCsv.textLv .. slot4.level)

				uv5 = "start"
				slot5 = slot5.panelLeft:get("textFight")
				slot5 = slot5.text

				slot5(slot5, slot4.fighting_point)

				uv5 = "start"
				slot5 = slot5.panelLeft:get("textName")
				slot5 = slot5.text

				slot5(slot5, slot4.name)

				uv5 = "start"

				slot5.btnOwerChallenge:show()

				slot6 = gCommonConfigCsv.gymPwCD
				uv6 = "start"
				slot6 = slot6.textTime
				slot6 = slot6.setVisible

				slot6(slot6, time.getTime() < gGameModel.role:read("gym_datas").gym_pw_last_time + slot6)

				uv6 = "start"

				slot6.imgOwner:texture("city/adventure/gym_challenge/txt_rygz.png")
			end
		end

		uv6 = "start"
		uv7 = "start"

		bind.touch(slot6, slot7.figure, {
			methods = {
				ended = function ()
					uv0 = "id"

					if slot0 ~= nil then
						uv0 = "id"
						uv1 = "gGameUI"

						if slot0[slot1.id] == nil then
							slot2 = "city.adventure.gym_challenge.npc_info"
							uv3 = "gGameUI"
							uv2 = "gGameUI"

							gGameUI:createView(slot2, slot3):init(slot2.id)
						else
							uv4 = "id"
							uv5 = "gGameUI"

							gGameApp:requestServer("/game/gym/role/info", function (slot0)
								uv3 = "csvSize"
								slot3 = slot3.id
								uv3 = "csvSize"
								slot3 = slot3.id
								uv3 = "csvSize"

								if slot3.ownerUnlock then
									uv3 = "csvSize"
									slot3 = slot3.gymDatas
									slot4 = slot3
									uv4 = "csvSize"
									slot3 = csv.gym.gym[slot3].hardDegreeID[csvSize(csv.gym.gym[slot3].hardDegreeID)] < slot3.read(slot4).gym_fuben[slot4.id]
								end

								uv7 = "csvSize"
								uv7 = "csvSize"

								gGameUI:createView("city.adventure.gym_challenge.master_info", slot7):init(slot0.view, slot7.id, false, slot3)
							end, slot4[slot5.id].record_id)
						end
					end
				end
			}
		})
	end)
	adapt.oneLineCenterPos(cc.p(443, slot0.panelLeft:get("textLv"):y()), {
		slot0.panelLeft:get("textLv"),
		slot0.panelLeft:get("textName")
	}, cc.p(5, 0))
	adapt.oneLineCenterPos(cc.p(443, slot0.panelLeft:get("textFightNote"):y()), {
		slot0.panelLeft:get("textFightNote"),
		slot0.panelLeft:get("textFight")
	})
end

function slot2.onGateDetail(slot0, slot1, slot2, slot3)
	uv5 = "state"

	gGameUI:createView("city.adventure.gym_challenge.gate_detail", slot0):init(slot3.gateId, slot2, slot1.id, slot3.state == slot5.UNLOCK)
end

function slot2.onGatePass(slot0, slot1, slot2, slot3)
	if gCommonConfigCsv.gymBattleTimes - gGameModel.daily_record:read("gym_battle_times") + gGameModel.daily_record:read("gym_battle_buy_times") <= 0 then
		gGameUI:showTip(gLanguageCsv.timesLimit2048)

		return
	end

	gGameApp:requestServer("/game/gym/gate/pass", function (slot0)
		gGameUI:showGainDisplay(slot0.view.drop)
	end, slot0.id, slot3.gateId)
end

function slot2.onBtnOwnerChallenge(slot0)
	if slot0:getChallengeState() == false then
		gGameUI:showTip(gLanguageCsv.gymTimeOut)

		return
	end

	if not slot0.ownerUnlock then
		gGameUI:showTip(gLanguageCsv.gymTips1)

		return
	end

	if slot0.inCd:read() then
		gGameUI:showTip(gLanguageCsv.gymInCd)

		return
	end

	if time.getTime() < gGameModel.role:read("gym_datas").gym_pw_last_time + gCommonConfigCsv.gymPwCD then
		return
	end

	if #dataEasy.getNatureSprite(csv.gym.gym[slot0.id].limitAttribute) == 0 then
		gGameUI:showTip(gLanguageCsv.gymNoSptire1)

		return
	end

	if slot0.gymOwners:read() == nil or slot3[slot0.id] == nil then
		for slot8, slot9 in csvPairs(csv.gym.gate) do
			if slot9.npc then
				-- Nothing
			end
		end

		function slot7(slot0, slot1, slot2)
			uv6 = "read"
			uv7 = "battleEntrance"

			battleEntrance.battleRequest("/game/gym/gate/start", slot6, slot7.id, slot1:read(), slot2):onStartOK(function (slot0)
				uv1 = "onClose"

				slot1:onClose(false)
			end):show()
		end

		if csv.gym.gate[({
			[slot9.gymID] = slot8
		})[slot0.id]].deployType == 1 then
			slot10 = game.EMBATTLE_FROM_TABLE.gymChallenge

			if itertools.size(csv.gym.gym[slot0.id].limitAttribute) ~= 0 or csv.gym.gate[slot5].deployCardNumLimit ~= 6 then
				slot10 = game.EMBATTLE_FROM_TABLE.onekey
			end

			gGameUI:stackUI("city.adventure.gym_challenge.embattle1", nil, {
				full = true
			}, {
				fightCb = slot7,
				limitInfo = csv.gym.gym[slot0.id].limitAttribute,
				gymId = slot0.id,
				from = slot10
			})
		elseif slot6 == 2 then
			gGameUI:stackUI("city.adventure.gym_challenge.embattle2", nil, {
				full = true
			}, {
				fightCb = slot7,
				limitInfo = csv.gym.gym[slot0.id].limitAttribute,
				gymId = slot0.id
			})
		else
			gGameUI:stackUI("city.adventure.gym_challenge.embattle3", nil, {
				full = true
			}, {
				fightCb = slot7,
				limitInfo = csv.gym.gym[slot0.id].limitAttribute,
				gymId = slot0.id
			})
		end

		return
	end

	gGameUI:stackUI("city.adventure.gym_challenge.embattle1", nil, {
		full = true
	}, {
		fightCb = function (slot0, slot1, slot2)
			uv7 = "read"
			uv8 = "battleEntrance"
			uv9 = "read"

			battleEntrance.battleRequest("/game/gym/leader/battle/start", slot1:read(), slot7.id, slot8[slot9.id].record_id, slot2):onStartOK(function (slot0)
				uv1 = "onClose"

				slot1:onClose()
			end):run():show()
		end,
		limitInfo = csv.gym.gym[slot0.id].limitAttribute,
		from = game.EMBATTLE_FROM_TABLE.onekey
	})
end

function slot2.onBtnBuf(slot0)
	if slot0:getChallengeState() then
		gGameUI:stackUI("city.adventure.gym_challenge.buff", nil, {
			full = true
		})
	else
		gGameUI:showTip(gLanguageCsv.gymEndTips)
	end
end

function slot2.onBtnAward(slot0)
	slot1 = {
		[slot5] = slot6
	}

	for slot5, slot6 in pairs(csv.gym.gym[slot0.id].gateAward) do
		if slot5 ~= "libs" then
			-- Nothing
		end
	end

	slot2 = 0
	slot3 = ""
	slot5 = nil

	if (slot0.gymDatas:read().gym_pass_awards or {})[slot0.id] == 0 then
		slot2 = 0
		slot3 = gLanguageCsv.received
	elseif slot4[slot0.id] == 1 then
		slot2 = 1
		slot3 = gLanguageCsv.spaceReceive

		function slot5()
			uv4 = "gGameApp"

			gGameApp:requestServer("/game/gym/gate/award", function (slot0)
				gGameUI:showGainDisplay(slot0)
			end, slot4.id)
		end
	else
		slot2 = 1
		slot3 = gLanguageCsv.commonTextOk
	end

	gGameUI:showBoxDetail({
		clearFast = true,
		data = slot1 or {},
		btnText = slot3,
		content = gLanguageCsv.gymAwardDesc,
		state = slot2,
		cb = slot5
	})
end

function slot2.getChallengeState(slot0)
	if slot0.round:read() == "closed" then
		return false
	end

	return time.getTime() < time.getNumTimestamp(gGameModel.gym:read("date"), 21, 45) + 518400
end

function slot2.initCountDown(slot0)
	if not slot0:getChallengeState() then
		slot0.textTime:text(gLanguageCsv.gymTimeOut)

		return
	end

	if gGameModel.role:read("gym_datas").gym_pw_last_time == 0 then
		slot0.textTime:hide()

		return
	end

	slot0:enableSchedule()
	function ()
		slot0 = gGameModel.role:read("gym_datas").gym_pw_last_time + gCommonConfigCsv.gymPwCD
		slot2 = slot0 - time.getTime()
		uv2 = "gGameModel"
		slot2 = slot2.textTime
		slot3 = slot2
		slot4 = time.getCutDown(slot2).short_date_str .. gLanguageCsv.gymTimeLimit

		slot2.text(slot3, slot4)

		uv3 = "gGameModel"
		uv4 = "gGameModel"

		adapt.oneLinePos(slot3.textTime, slot4.textNote1, cc.p(5, 0), "right")

		if slot0 - time.getTime() <= 0 then
			uv2 = "gGameModel"
			slot2 = slot2.inCd
			slot2 = slot2.set

			slot2(slot2, false)

			uv2 = "gGameModel"
			slot2 = slot2.textTime
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "gGameModel"

			slot2:unSchedule(1)

			return false
		else
			uv2 = "gGameModel"

			slot2.inCd:set(true)

			return true
		end
	end()
	slot0:schedule(function ()
		error("Decompilation failed")
		-- Exception in function building!
		-- Traceback (most recent call last):
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
		--     return _build_function_definition(prototype, state.header)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
		--     node.statements.contents = _build_function_blocks(state, instructions)
		--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
		--     statement, line_marked_elements = _build_statement(state, addr, instruction)
		--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
		--     return _build_var_assignment(state, addr, instruction)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
		--     assn = func(*args, **kwargs)
		--            ^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
		--     expression = _build_const_expression(state, addr, instruction)
		--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
		--     return _build_string_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
		--     node.value = state.constants.complex_constants[index]
		--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end, 1, 0, 1)
end

return slot2
