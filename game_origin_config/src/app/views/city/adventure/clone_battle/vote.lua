slot0 = cc.load("mvc").ViewBase
slot1 = class("CloneBattleVoteView", Dialog)
slot1.RESOURCE_FILENAME = "clone_battle_kick_note.json"
slot1.RESOURCE_BINDING = {
	txt3 = "txt3",
	name3 = "name3",
	name4 = "name4",
	content = "contentLabel",
	txt4 = "txt4",
	name2 = "name2",
	txt1 = "txt1",
	name1 = "name1",
	txt2 = "txt2",
	closeBtn = {
		varname = "closeBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	leaveBtn = {
		varname = "leaveBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onLeaveBtn")
			}
		}
	},
	stayBtn = {
		varname = "stayBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onStayBtn")
			}
		}
	},
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0:initModel()

	slot2 = slot1

	idlereasy.any({
		slot0.beasIdler.finishNum,
		slot0.beasIdler.places,
		slot0.beasIdler.voteRound
	}, function (slot0, slot1, slot2, slot3)
		if slot3 == "start" then
			slot4 = {}
			slot5 = 0
			slot6 = 0
			slot7 = 0
			slot8 = gGameModel.role
			slot9 = slot8
			slot8 = slot8.read(slot9, "id")
			uv9 = "start"
			slot10 = slot2[1].name
			slot9.name = slot10
			uv10 = "start"
			slot10 = slot10.contentLabel:size()
			slot15 = gLanguageCsv.cloneBattleKickText
			uv15 = "start"
			slot11, slot12 = beauty.textScroll({
				fontSize = 50,
				verticalSpace = 10,
				isRich = true,
				margin = 20,
				size = slot10,
				effect = {
					color = ui.COLORS.NORMAL.DEFAULT
				},
				strs = string.format("#C0x5b545b#" .. slot15, slot15.name),
				align = "center"
			})
			slot13 = 0

			if slot12 < slot10.height then
				slot13 = -(slot10.height - slot12) / 2
			end

			uv16 = "start"
			slot17 = 10

			slot11:addTo(slot16.contentLabel, slot17):y(slot13)

			for slot17, slot18 in pairs(slot2) do
				if slot18.kick_leader ~= 0 then
					table.insert(slot4, slot18.name)

					if slot18.kick_leader < 0 then
						slot6 = slot6 + 1
					else
						slot5 = slot5 + 1
					end

					if slot18.id == slot8 then
						slot7 = slot18.kick_leader
					end
				end
			end

			for slot17 = 1, 4 do
				if slot4[slot17] then
					uv18 = "start"
					slot18 = slot18["name" .. slot17]
					slot18 = slot18.text

					slot18(slot18, slot4[slot17])

					uv18 = "start"

					slot18["name" .. slot17]:show()
				else
					uv18 = "start"

					slot18["name" .. slot17]:hide()
				end
			end

			if slot7 ~= 0 then
				uv15 = "start"
				slot15 = slot15.leaveBtn

				cache.setShader(slot15, false, "hsl_gray")

				uv15 = "start"

				cache.setShader(slot15.stayBtn, false, "hsl_gray")

				if slot7 == 1 then
					uv14 = "start"

					slot14.leaveBtn:get("gou"):show()
				else
					uv14 = "start"

					slot14.stayBtn:get("gou"):show()
				end

				slot17 = 60
				uv17 = "start"
				slot17 = slot17.leaveBtn:get("gou")
				uv17 = "start"

				adapt.oneLineCenterPos(cc.p(140, slot17), {
					slot17,
					slot17.leaveBtn:get("txt")
				}, cc.p(0, 0))

				slot14 = adapt.oneLineCenterPos
				slot17 = 60
				uv17 = "start"
				slot17 = slot17.stayBtn:get("gou")
				uv17 = "start"

				slot14(cc.p(140, slot17), {
					slot17,
					slot17.stayBtn:get("txt")
				}, cc.p(0, 0))

				uv14 = "start"
				slot14 = slot14.leaveBtn
				slot14 = slot14.setTouchEnabled

				slot14(slot14, false)

				uv14 = "start"
				slot14 = slot14.stayBtn
				slot14 = slot14.setTouchEnabled

				slot14(slot14, false)

				uv14 = "start"
				slot14 = slot14.txt3
				slot14 = slot14.text

				slot14(slot14, string.format(gLanguageCsv.cloneBattleVote, slot5))

				uv14 = "start"
				slot14 = slot14.txt3
				slot14 = slot14.show

				slot14(slot14)

				uv14 = "start"
				slot14 = slot14.txt4
				slot14 = slot14.text

				slot14(slot14, string.format(gLanguageCsv.cloneBattleVote, slot6))

				uv14 = "start"

				slot14.txt4:show()
			end

			uv1 = false
		else
			uv4 = "gGameModel"

			if slot4 == false then
				uv4 = "role"
				uv5 = "start"

				slot4.onClose(slot5)

				return
			end
		end
	end)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.beasIdler = {
		date = gGameModel.clone_room:getIdler("date"),
		finishNum = gGameModel.clone_room:getIdler("finish_num"),
		monsters = gGameModel.clone_room:getIdler("monsters"),
		places = gGameModel.clone_room:getIdler("places"),
		voteRound = gGameModel.clone_room:getIdler("vote_round")
	}
end

function slot1.onLeaveBtn(slot0)
	slot1 = slot0.name

	gGameUI:showDialog({
		btnType = 2,
		isRich = true,
		content = "#C0x5b545b#" .. gLanguageCsv.cloneBattleKickVoteTipLeave,
		cb = function ()
			gGameApp:requestServer("/game/clone/room/vote", function (slot0)
				if slot0.view.result == "win" then
					uv5 = "view"

					gGameUI:showTip(string.format(gLanguageCsv.cloneBattleKickVoteResultTipLeave, slot5))
				elseif slot0.view.result == "fail" then
					uv5 = "view"

					gGameUI:showTip(string.format(gLanguageCsv.cloneBattleKickVoteResultTipStay, slot5))
				end
			end, 1)
		end,
		dialogParams = {
			clickClose = false
		}
	})
end

function slot1.onStayBtn(slot0)
	slot1 = slot0.name

	gGameUI:showDialog({
		btnType = 2,
		isRich = true,
		content = "#C0x5b545b#" .. gLanguageCsv.cloneBattleKickVoteTipStay,
		cb = function ()
			gGameApp:requestServer("/game/clone/room/vote", function (slot0)
				if slot0.view.result == "win" then
					uv5 = "view"

					gGameUI:showTip(string.format(gLanguageCsv.cloneBattleKickVoteResultTipLeave, slot5))
				elseif slot0.view.result == "fail" then
					uv5 = "view"

					gGameUI:showTip(string.format(gLanguageCsv.cloneBattleKickVoteResultTipStay, slot5))
				end
			end, -1)
		end,
		dialogParams = {
			clickClose = false
		}
	})
end

return slot1
