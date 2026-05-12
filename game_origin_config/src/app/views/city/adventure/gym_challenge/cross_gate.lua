slot0 = class("GymCrossGate", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "gym_cross_gate.json"
slot0.RESOURCE_BINDING = {
	panel2 = "panel2",
	panel6 = "panel6",
	panel3 = "panel3",
	panel5 = "panel5",
	panel4 = "panel4",
	panel1 = "panel1",
	imgFileter = "imgFileter",
	panel7 = "panel7",
	panel8 = "panel8",
	attrItem = "attrItem",
	btnRule = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnRuleClick")
			}
		}
	},
	["leftTop.arrList"] = {
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

function slot0.onCreate(slot0, slot1, slot2)
	slot0.id = slot1
	slot0.crossUnlock = slot2

	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "The Pavilion Challenge",
		title = gLanguageCsv.gymChallenge
	})
	slot0:initModel()
	slot0:initUI()
end

function slot0.initUI(slot0)
	slot1 = "city/adventure/gym_challenge/gate/"

	slot0.imgFileter:texture(slot1 .. "bg_" .. csv.gym.gym[slot0.id].texture):size(display.sizeInView)
	slot0.panel1:get("imgBgCircle"):texture(slot1 .. "icon_" .. csv.gym.gym[slot0.id].texture)
	slot0.panel1:get("imgBgCircle"):runAction(cc.RepeatForever:create(cc.RotateBy:create(90, 360)))
	slot0.panel1:get("imgOwner"):texture("city/adventure/gym_challenge/map/" .. csv.gym.gym[slot0.id].namePng)
	slot0:initMember()
end

function slot0.initModel(slot0)
	slot0.inCd = idler.new(false)
	slot0.gates = idlers.newWithMap({})
	slot0.gymDatas = gGameModel.role:getIdler("gym_datas")
	slot0.gatesDatas = gGameModel.gym:getIdler("GymCrossGates")
	slot0.crossAlGatesDatas = gGameModel.gym:getIdler("crossGymRoles")
	slot0.attrData = idlers.newWithMap(csv.gym.gym[slot0.id].limitAttribute)
	slot0.round = gGameModel.gym:getIdler("round")

	idlereasy.when(slot0.gymDatas, function (slot0, slot1)
		uv2 = "initCountDown"

		slot2:initCountDown()
	end)
end

function slot0.initMember(slot0)
	slot1 = "city/adventure/gym_challenge/gate/"

	idlereasy.any({
		slot0.crossAlGatesDatas,
		slot0.inCd,
		slot0.round
	}, function (slot0, slot1, slot2, slot3)
		slot4 = nil
		slot4 = slot3 == "start" and (slot1 or {}) or gGameModel.gym:read("lastCrossGymRoles") or {}

		for slot8 = 1, 8 do
			uv9 = "start"
			slot9 = slot9["panel" .. slot8]
			slot10 = slot9:get("infoPanel")
			slot11 = slot9:get("emptyPanel")
			slot12 = slot9:get("btnChallenge")
			slot14 = slot12
			slot13 = slot12.get(slot14, "textNote")
			uv14 = "start"

			if slot4[slot14.id] then
				uv14 = "start"
				slot14 = slot4[slot14.id][slot8]
			end

			if slot8 == 1 then
				text.addEffect(slot9:get("textTime"), {
					outline = {
						size = 2,
						color = cc.c4b(255, 224, 171, 255)
					}
				})
			end

			if slot14 then
				slot10:show()
				slot11:hide()

				slot15 = slot10:multiget("textFight", "textName", "textLv", "textSever", "txt", "figurePanel", "figurePanel")

				text.addEffect(slot15.textFight, {
					outline = {
						size = 2,
						color = cc.c4b(255, 252, 237, 255)
					}
				})
				text.addEffect(slot15.textLv, {
					outline = {
						size = 2,
						color = cc.c4b(79, 72, 79, 255)
					}
				})
				text.addEffect(slot15.textName, {
					outline = {
						size = 2,
						color = cc.c4b(79, 72, 79, 255)
					}
				})
				text.addEffect(slot15.textSever, {
					outline = {
						size = 2,
						color = cc.c4b(79, 72, 79, 255)
					}
				})

				if slot8 ~= 1 then
					text.addEffect(slot15.txt, {
						outline = {
							size = 2,
							color = cc.c4b(79, 72, 79, 255)
						}
					})
				end

				slot15.textName:text(slot14.name)
				slot15.textLv:text(gLanguageCsv.textLv .. slot14.level)
				slot15.textFight:text(slot14.fighting_point)
				slot15.textSever:text(string.format(gLanguageCsv.brackets, getServerArea(slot14.game_key, true)))

				if slot8 == 1 then
					adapt.oneLineCenterPos(cc.p(150, slot15.textLv:y()), {
						slot15.textLv,
						slot15.textName
					}, cc.p(6, 8))
					adapt.oneLineCenterPos(cc.p(150, slot15.textSever:y()), {
						slot15.txt,
						slot15.textFight,
						slot15.textSever
					}, {
						cc.p(10, -5),
						cc.p(0, 0)
					})
				else
					adapt.oneLineCenterPos(cc.p(150, slot15.textLv:y()), {
						slot15.textLv,
						slot15.textName
					}, cc.p(5, 6))
					adapt.oneLineCenterPos(cc.p(150, slot15.textSever:y()), {
						slot15.txt,
						slot15.textFight,
						slot15.textSever
					}, {
						cc.p(10, 0),
						cc.p(0, 0)
					})
				end

				if slot14.figure ~= "" then
					slot18 = widget.addAnimationByKey(slot15.figurePanel, gRoleFigureCsv[slot14.figure].resSpine, "figure", "standby_loop1", 1):xy(slot10:size().width / 2, 0)
					slot19 = slot18

					slot18.scale(slot19, slot8 == 1 and 1 or 0.9)

					uv19 = "start"

					bind.touch(slot19, slot15.figurePanel, {
						methods = {
							ended = function ()
								uv4 = "/game/gym/role/info"
								uv5 = "/game/gym/role/info"

								gGameApp:requestServer("/game/gym/role/info", function (slot0)
									uv4 = "gGameUI"
									uv4 = "gGameUI"
									uv7 = "createView"

									gGameUI:createView("city.adventure.gym_challenge.master_info", slot4):init(slot0.view, slot4.id, true, true, slot7)
								end, slot4.record_id, slot5.game_key)
							end
						}
					})
				end

				slot9:get("btnChallenge.textNote"):text(gLanguageCsv.spaceChallenge)

				if slot8 == 1 then
					slot12:y(0)
					slot9:get("textTime"):y(-60)
				end

				if gGameModel.role:read("gym_record_db_id") == slot14.record_id then
					slot12:hide()
				else
					if slot2 then
						uiEasy.setBtnShader(slot12, slot13, 3)
					else
						uiEasy.setBtnShader(slot12, slot13, 1)
					end

					slot12:show()
				end
			else
				slot10:hide()
				slot11:show()

				if slot8 == 1 then
					slot9:get("btnChallenge.textNote"):text(gLanguageCsv.gymTobeOwner)
					slot12:y(50):show()
					slot9:get("textTime"):y(-10)
				else
					slot9:get("btnChallenge.textNote"):text(gLanguageCsv.gymTobeMember)
				end

				if slot2 then
					uiEasy.setBtnShader(slot12, slot13, 3)
				else
					uiEasy.setBtnShader(slot12, slot13, 1)
				end
			end

			slot15 = bind.touch
			uv16 = "start"

			slot15(slot16, slot12, {
				methods = {
					ended = function ()
						uv0 = "onBtnChallenge"

						if slot0 then
							uv0 = "onBtnOccupy"
							uv2 = "onBtnChallenge"
							uv3 = "onBtnChallenge"

							slot0:onBtnChallenge(slot2, slot3)
						else
							uv0 = "onBtnOccupy"
							uv2 = "onBtnChallenge"

							slot0:onBtnOccupy(slot2)
						end
					end
				}
			})

			uv15 = "start"

			if slot15:getChallengeState() ~= false then
				uv15 = "start"

				if not slot15.crossUnlock then
					uiEasy.setBtnShader(slot12, slot13, 3)
				end
			end
		end
	end)
end

function slot0.onBtnChallenge(slot0, slot1, slot2)
	if gGameModel.gym:read("crossKey") == "" then
		gGameUI:showTip(gLanguageCsv.crossGymNotOpen)

		return
	end

	if slot0:getChallengeState() == false then
		gGameUI:showTip(gLanguageCsv.gymTimeOut)

		return
	end

	if not slot0.crossUnlock then
		gGameUI:showTip(gLanguageCsv.gymCrossTips1)

		return
	end

	if slot0.inCd:read() then
		gGameUI:showTip(gLanguageCsv.gymInCd)

		return
	end

	if #dataEasy.getNatureSprite(csv.gym.gym[slot0.id].limitAttribute) == 0 then
		gGameUI:showTip(gLanguageCsv.gymNoSptire1)

		return
	end

	gGameUI:stackUI("city.adventure.gym_challenge.embattle1", nil, {
		full = true
	}, {
		fightCb = function (slot0, slot1, slot2)
			uv3 = "getChallengeState"

			if slot3:getChallengeState() == false then
				gGameUI:showTip(gLanguageCsv.gymTimeOut)

				return
			end

			uv7 = "getChallengeState"
			uv8 = "gGameUI"
			uv9 = "showTip"
			uv10 = "showTip"

			battleEntrance.battleRequest("/game/cross/gym/battle/start", slot1:read(), slot7.id, slot8, slot9.game_key, slot10.record_id, slot2):onStartOK(function (slot0)
				uv1 = "onClose"

				slot1:onClose(false)
			end):run():show()
		end,
		limitInfo = csv.gym.gym[slot0.id].limitAttribute,
		from = game.EMBATTLE_FROM_TABLE.onekey
	})
end

function slot0.onBtnOccupy(slot0, slot1)
	if gGameModel.gym:read("crossKey") == "" then
		gGameUI:showTip(gLanguageCsv.crossGymNotOpen)

		return
	end

	if slot0:getChallengeState() == false then
		gGameUI:showTip(gLanguageCsv.gymTimeOut)

		return
	end

	if not slot0.crossUnlock then
		gGameUI:showTip(gLanguageCsv.gymCrossTips1)

		return
	end

	if slot0.inCd:read() then
		gGameUI:showTip(gLanguageCsv.gymInCd)

		return
	end

	if #dataEasy.getNatureSprite(csv.gym.gym[slot0.id].limitAttribute) == 0 then
		gGameUI:showTip(gLanguageCsv.gymNoSptire2)

		return
	end

	gGameUI:stackUI("city.adventure.gym_challenge.embattle1", nil, {
		full = true
	}, {
		saveCb = function (slot0, slot1, slot2, slot3, slot4)
			uv11 = "read"
			uv12 = "gGameApp"

			gGameApp:requestServer("/game/cross/gym/battle/occupy", function (slot0)
				uv1 = "set"
				slot1 = slot1.set
				uv3 = "haveSaved"

				slot1(slot1, slot3)

				uv1 = "onClose"
				slot1.haveSaved = true
				uv1 = "gGameUI"

				if slot1 then
					uv1 = "onClose"

					slot1:onClose(false)
				else
					gGameUI:showTip(gLanguageCsv.positionSave)
				end
			end, slot1:read(), slot11.id, slot12, slot4)
		end,
		limitInfo = csv.gym.gym[slot0.id].limitAttribute,
		from = game.EMBATTLE_FROM_TABLE.onekey
	})
end

function slot0.getChallengeState(slot0)
	if slot0.round:read() == "closed" then
		return false
	end

	return time.getTime() < time.getNumTimestamp(gGameModel.gym:read("date"), 21, 45) + 518400
end

function slot0.initCountDown(slot0)
	if not slot0:getChallengeState() then
		slot0.panel1:get("textTime"):show():hide()

		return
	end

	slot0:enableSchedule()
	function ()
		slot0 = gGameModel.role:read("gym_datas").cross_gym_pw_last_time + gCommonConfigCsv.gymPwCD
		slot2 = slot0 - time.getTime()
		uv2 = "gGameModel"
		slot3 = slot2
		slot4 = time.getCutDown(slot2).short_date_str .. gLanguageCsv.gymTimeLimit

		slot2.text(slot3, slot4)

		uv3 = "gGameModel"
		uv4 = "role"

		adapt.oneLinePos(slot3, slot4.textNote1, cc.p(5, 0), "right")

		if slot0 - time.getTime() <= 0 then
			uv2 = "gGameModel"
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "role"
			slot2 = slot2.unSchedule

			slot2(slot2, 1)

			uv2 = "role"

			slot2.inCd:set(false)

			return false
		else
			uv2 = "role"

			slot2.inCd:set(true)

			return true
		end
	end()
	slot0:unScheduleAll()
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

function slot0.onBtnRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1500
	})
end

function slot0.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	if slot0.round:read() == "start" and gGameModel.gym:read("servers") then
		table.insert({
			slot2.clone(slot1.title, function (slot0)
				slot0:get("text"):text(gLanguageCsv.rules)
			end),
			slot2.noteText(103001, 103100)
		}, 2, "#C0x5B545B#" .. gLanguageCsv.currentServers .. table.concat(arraytools.map(getMergeServers(slot4), function (slot0, slot1)
			return string.format(gLanguageCsv.brackets, getServerArea(slot1, nil, true))
		end), ","))
	end

	for slot7, slot8 in orderCsvPairs(csv.gym.gym) do
		table.insert(slot3, slot2.clone(slot1.awardItem, function (slot0)
			slot1 = slot0:multiget("text", "list")
			slot4 = ""

			slot1.text:text(slot4)

			uv4 = "multiget"
			slot2 = rich.createByStr("#C0x5b545b#" .. slot4.crossLeaderAwardDesc, 40):anchorPoint(1, 0.5):xy(260, 100)
			slot3 = slot2
			slot5 = 6

			slot2.addTo(slot3, slot1.text, slot5)

			uv3 = "text"
			uv5 = "multiget"

			uiEasy.createItemsToList(slot3, slot1.list, slot5.crossLeaderAward)
		end))
		table.insert(slot3, slot2.clone(slot1.awardItem, function (slot0)
			slot1 = slot0:multiget("text", "list")
			slot4 = ""

			slot1.text:text(slot4)

			uv4 = "multiget"
			slot2 = rich.createByStr("#C0x5b545b#" .. slot4.crossSubAwardDesc, 40):anchorPoint(1, 0.5):xy(260, 100)
			slot3 = slot2
			slot5 = 6

			slot2.addTo(slot3, slot1.text, slot5)

			uv3 = "text"
			uv5 = "multiget"

			uiEasy.createItemsToList(slot3, slot1.list, slot5.crossSubAward)
		end))
	end

	return slot3
end

return slot0
