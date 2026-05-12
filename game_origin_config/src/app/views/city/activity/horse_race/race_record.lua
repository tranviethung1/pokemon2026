function slot0(slot0)
	return time.getCutDown(math.max(time.getTime() - slot0, 0), nil, true).short_date_str .. gLanguageCsv.before
end

slot1 = class("HorseRaceRecordView", Dialog)
slot1.RESOURCE_FILENAME = "horse_race_record.json"
slot1.RESOURCE_BINDING = {
	["rankPanel.recordItem"] = "recordItem",
	emptyPanel = "emptyPanel",
	rankPanel = "rankPanel",
	["topPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["rankPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 4,
				data = bindHelper.self("raceDatas"),
				item = bindHelper.self("recordItem"),
				dataOrderCmpGen = bindHelper.self("onSortRace", true),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("txtDay", "txtTurn", "horseList", "horseItem", "btnGet", "txtNoReward", "btnReplay")

					slot4.txtDay:text(string.format(gLanguageCsv.horseRaceRecordDay, slot3.day))
					slot4.txtTurn:text(string.format(gLanguageCsv.horseRaceRecordTurn, slot3.turn))
					slot4.txtNoReward:visible(slot3.rewardFlag < 0)

					slot5 = slot4.btnGet

					slot5:visible(slot3.rewardFlag >= 0)
					slot5:get("iconBox"):texture("other/gain_gold/icon_box" .. (slot3.rewardFlag < 1 and "_open5.png" or "5.png"))
					bind.touch(slot0, slot5, {
						methods = {
							ended = functools.partial(slot0.btnGet, slot2, slot3, slot1)
						}
					})

					if slot3.rewardFlag == 1 then
						slot7 = widget.addAnimation(slot5, "effect/jiedianjiangli.skel", "effect_loop", slot6:z() - 1)

						slot7:scale(0.35):x(slot6:x()):y(slot6:y() - 30)

						slot5.effectBox = slot7
					elseif slot5.effectBox then
						slot5.effectBox:hide()
						slot5.effectBox:removeFromParent()

						slot5.effectBox = nil
					end

					uiEasy.addVibrateToNode(slot0, slot6, slot3.rewardFlag == 1, slot1:getName() .. slot2 .. "vibrate")
					bind.touch(slot0, slot4.btnReplay, {
						methods = {
							ended = functools.partial(slot0.playbackBtn, slot2, slot3)
						}
					})

					slot7 = slot3.betIdx

					bind.extend(slot0, slot4.horseList, {
						class = "listview",
						props = {
							data = slot3.players,
							item = slot4.horseItem,
							onItem = function (slot0, slot1, slot2, slot3)
								ccui.ImageView:create(csv.unit[csv.cross.horse_race.horse_race_card[slot3.csv_id].unitID].cardIcon):addTo(slot1, 1, "img"):alignCenter(slot1:size()):scale(2)

								slot9 = slot1

								ccui.ImageView:create("common/icon/panel_icon.png"):addTo(slot1, 0, "imgBg"):alignCenter(slot1.size(slot9))

								uv9 = "multiget"

								slot1:multiget("betMark", "txtHorseRank").betMark:visible(slot3.idx == slot9)

								if matchLanguage({
									"en"
								}) then
									slot6 = ({
										"1st",
										"2nd",
										"3rd",
										"4th"
									})[slot3.result] or slot3.result
								end

								slot4.txtHorseRank:text(string.format(gLanguageCsv.horseRaceRecordRank, slot6))
							end
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end
			},
			handlers = {
				afterBuild = bindHelper.self("onAfterBuild"),
				playbackBtn = bindHelper.self("onPlaybackClick"),
				btnGet = bindHelper.self("onGetClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0:initModel()

	slot0.activityId = slot1

	slot0.emptyPanel:hide()

	slot4 = csv.yunying.yyhuodong[slot0.activityId].beginDate

	idlereasy.any({
		slot0.yyhuodongs,
		slot2()
	}, function (slot0, slot1, slot2)
		uv3 = "activityId"
		slot4 = {}

		if slot1[slot3.activityId] and slot3.horse_race and slot3.horse_race.bet_award then
			slot4 = slot3.horse_race.bet_award
		end

		slot5 = {}

		for slot9, slot10 in pairs(slot2.view.history) do
			for slot14, slot15 in pairs(slot10) do
				slot16 = {}

				if slot4[slot9] and slot4[slot9][slot14] then
					slot16 = slot4[slot9][slot14]
				end

				slot17 = {}

				for slot21, slot22 in ipairs(slot15) do
					table.insert(slot17, {
						idx = slot21,
						csv_id = slot22.csv_id,
						result = slot22.result,
						idx = slot21
					})
				end

				table.sort(slot17, function (slot0, slot1)
					return slot0.result < slot1.result
				end)

				uv22 = "horse_race"

				table.insert(slot5, {
					date = slot9,
					turn = slot14,
					day = math.floor((time.getNumTimestamp(slot9) - time.getNumTimestamp(slot22)) / 86400) + 1,
					players = slot17,
					betIdx = slot16[1] and slot16[1] + 1,
					rank = slot16[2],
					rewardFlag = slot16[3] or -2
				})
			end
		end

		uv6 = "activityId"

		slot6.raceDatas:update(slot5)
	end)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.raceDatas = idlers.new()
end

function slot1.onPlaybackClick(slot0, slot1, slot2, slot3)
	gGameApp:requestServer("/game/yy/horse/race/playback", function (slot0)
		uv6 = "gGameUI"
		slot8 = slot0.view
		uv8 = "stackUI"

		gGameUI:stackUI("city.activity.horse_race.match", nil, , slot6.activityId, {
			slot8,
			slot8.betIdx
		})
	end, slot0.activityId, slot3.date, slot3.turn)
end

function slot1.onGetClick(slot0, slot1, slot2, slot3, slot4)
	if slot3.rewardFlag == 1 then
		slot5 = slot4:get("btnGet"):get("iconBox")

		gGameApp:requestServerCustom("/game/yy/horse/race/bet/award"):params(slot0.activityId, slot3.date, slot3.turn):onResponse(function (slot0)
			uv1 = "raceDatas"
			uv3 = "atproxy"
			slot1.raceDatas:atproxy(slot3).rewardFlag = 0
			slot1 = uiEasy.addVibrateToNode
			uv2 = "rewardFlag"
			uv3 = "uiEasy"
			uv4 = "addVibrateToNode"
			uv5 = "getName"
			slot6 = slot5
			uv6 = "atproxy"

			slot1(slot2, slot3, slot4.rewardFlag == 1, slot5.getName(slot6) .. slot6 .. "vibrate")

			uv1 = "uiEasy"
			slot2 = slot1

			slot1.texture(slot2, "other/gain_gold/icon_box_open5.png")

			uv2 = "uiEasy"

			uiEasy.setBoxEffect(slot2, 0.5, function ()
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
			end, -15, 10)
		end):wait({
			false
		}):doit(function (slot0)
			gGameUI:showGainDisplay(slot0)
		end)

		return
	end

	slot5 = csv.yunying.horse_race_bet_award[1]

	for slot10, slot11 in csvPairs(csv.yunying.horse_race_bet_award) do
		if slot11.huodongID == csv.yunying.yyhuodong[slot0.activityId].huodongID and slot11.rank == slot3.rank then
			slot5 = slot11

			break
		end
	end

	gGameUI:showBoxDetail({
		content = "",
		state = 0,
		data = slot5.award
	})
end

function slot1.onAfterBuild(slot0)
	slot1 = slot0.list:getChildrenCount() == 0

	slot0.emptyPanel:visible(slot1)
	slot0.rankPanel:visible(not slot1)
end

function slot1.onSortRace(slot0, slot1)
	return function (slot0, slot1)
		if slot0.date == slot1.date then
			return slot1.turn < slot0.turn
		else
			return slot1.date < slot0.date
		end
	end
end

return slot1
