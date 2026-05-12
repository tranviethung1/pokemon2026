slot0 = class("GymMasterInfoView", Dialog)
slot0.RESOURCE_FILENAME = "gym_master_info.json"
slot0.RESOURCE_BINDING = {
	["top.textFightPoint"] = "textFightPoint",
	imgBG = "bg",
	["top.textNoteServer"] = "textNoteServer",
	["top.textServer"] = "textServer",
	["top.imgVipInfo"] = "imgVipInfo",
	["top.textUnionNote"] = "textUnionNote",
	["top.textName"] = "textName",
	["top.textUnion"] = "textUnion",
	["imgBG.down.list"] = {
		varname = "battleArrayList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 65,
				data = bindHelper.self("battleData"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							unitId = slot3.unitId,
							advance = slot3.advance,
							rarity = slot3.rarity,
							star = slot3.star,
							dbid = slot3.id,
							levelProps = {
								data = slot3.level
							},
							onNode = function (slot0)
								slot0:scale(1.2)
								slot0:xy(-10, -30)
							end
						}
					})
				end
			}
		}
	},
	["top.head"] = {
		varname = "headImg",
		binds = {
			event = "extend",
			class = "role_logo",
			props = {
				vip = false,
				level = false,
				logoId = bindHelper.self("logoId"),
				frameId = bindHelper.self("frameId"),
				onNode = function (slot0)
					slot0:scale(1.1)
				end
			}
		}
	},
	["top.textLevel1"] = {
		varname = "textLevel1",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = cc.c3b(91, 84, 91)
					}
				}
			}
		}
	},
	["top.textLevel2"] = {
		varname = "textLevel2",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = cc.c3b(91, 84, 91)
					}
				}
			},
			{
				event = "text",
				idler = bindHelper.self("levelId")
			}
		}
	},
	["top.btnTake"] = {
		varname = "btnChat",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPrivateChat")
			}
		}
	},
	["top.btnTake.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["top.btnChallenge.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["top.btnChallenge"] = {
		varname = "btnChallenge",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChallenge")
			}
		}
	},
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.masterData = slot1
	slot0.friendMessage = gGameModel.messages:getIdler("private")

	slot0.textName:text(slot1.role_name)

	slot0.logoId = idler.new(slot1.role_logo)
	slot0.frameId = idler.new(slot1.role_frame)
	slot0.levelId = idler.new(slot1.role_level)

	if slot1.role_vip == 0 then
		slot0.imgVipInfo:hide()
	else
		slot0.imgVipInfo:texture("common/icon/vip/icon_vip" .. slot1.role_vip .. ".png")
	end

	slot0.isCross = slot3
	slot0.unlocked = slot4
	slot0.id = slot2
	slot0.pos = slot5

	if slot3 == true then
		slot0.textUnionNote:hide()
		slot0.textUnion:hide()
		slot0.textNoteServer:show()
		slot0.textServer:text(getServerArea(slot1.game_key, true))
		slot0.textServer:show()
		slot0.btnChat:hide()
		slot0.btnChallenge:y(slot0.btnChat:y())
	else
		slot0.textUnionNote:show()
		slot0.textUnion:text(slot1.union_name)
		slot0.textUnion:show()
		slot0.textNoteServer:hide()
		slot0.textServer:hide()
	end

	slot6 = gGameModel.role:read("gym_record_db_id")
	slot7 = slot0.masterData.id

	if slot0.masterData.id == gGameModel.role:read("gym_record_db_id") then
		slot0.btnChallenge:hide()
		slot0.btnChat:hide()
	end

	if not slot4 then
		uiEasy.setBtnShader(slot0.btnChallenge, slot0.btnChallenge:get("textNote"), 2)
	end

	adapt.oneLinePos(slot0.textLevel1, slot0.textLevel2, cc.p(-5, 0))
	adapt.oneLinePos(slot0.textName, slot0.imgVipInfo, cc.p(10, 0))
	slot0:initSprites(slot1)
	Dialog.onCreate(slot0)
end

function slot0.initSprites(slot0, slot1)
	slot0.item = ccui.Layout:create():size(180, 180):show():setTouchEnabled(false):retain():scale(0.8)
	slot2 = {}
	slot4 = {}

	for slot8, slot9 in pairs((not slot0.isCross or slot1.cross_card_attrs) and slot1.card_attrs) do
		table.insert(slot2, {
			cardId = slot9.card_id == 0 and 11 or slot9.card_id,
			advance = slot9.advance,
			unitId = dataEasy.getUnitId(slot9.card_id, slot9.skin_id),
			star = slot9.star,
			level = slot9.level,
			rarity = csv.unit[csv.cards[slot9.card_id == 0 and 11 or slot9.card_id].unitID].rarity,
			id = slot9.id
		})

		slot3 = 0 + slot9.fighting_point
	end

	if #slot2 < 6 then
		for slot9 = #slot2 + 1, 6 do
			table.insert(slot2, {
				unitId = -1
			})
		end
	end

	slot0.battleData = idlertable.new(slot2)

	slot0.textFightPoint:text(slot3)
end

function slot0.onPrivateChat(slot0)
	gGameUI:stackUI("city.chat.privataly", nil, , {
		isMine = false,
		role = {
			level = slot0.masterData.role_level,
			id = slot0.masterData.role_id,
			logo = slot0.masterData.role_logo,
			name = slot0.masterData.role_name,
			vip = slot0.masterData.role_vip,
			frame = slot0.masterData.role_frame
		}
	})
end

function slot0.onChallenge(slot0)
	if slot0:getChallengeState() == false then
		gGameUI:showTip(gLanguageCsv.gymTimeOut)

		return
	end

	if slot0.isCross then
		if time.getTime() < gGameModel.role:read("gym_datas").cross_gym_pw_last_time + gCommonConfigCsv.gymPwCD then
			gGameUI:showTip(gLanguageCsv.gymInCd)

			return
		end
	elseif time.getTime() < gGameModel.role:read("gym_datas").gym_pw_last_time + gCommonConfigCsv.gymPwCD then
		gGameUI:showTip(gLanguageCsv.gymInCd)

		return
	end

	if not slot0.unlocked then
		if slot0.isCross then
			gGameUI:showTip(gLanguageCsv.gymCrossTips1)
		else
			gGameUI:showTip(gLanguageCsv.gymTips1)
		end

		return
	end

	if #dataEasy.getNatureSprite(csv.gym.gym[slot0.id].limitAttribute) == 0 then
		gGameUI:showTip(gLanguageCsv.gymNoSptire1)

		return
	end

	slot2 = slot0.id
	slot3 = slot0.pos
	slot4 = slot0.masterData
	slot5 = slot0.isCross

	gGameUI:stackUI("city.adventure.gym_challenge.embattle1", nil, {
		full = true
	}, {
		fightCb = function (slot0, slot1, slot2)
			if time.getNumTimestamp(gGameModel.gym:read("date"), 21, 45) + 518400 <= time.getTime() then
				gGameUI:showTip(gLanguageCsv.gymTimeOut)

				return
			end

			slot5 = slot1
			uv5 = "time"

			if not slot5 then
				uv8 = "getNumTimestamp"
				uv9 = "gGameModel"

				battleEntrance.battleRequest("/game/gym/leader/battle/start", slot1.read(slot5), slot8, slot9.id, slot2):onStartOK(function (slot0)
					uv1 = "onClose"

					slot1:onClose(false)
				end):run():show()
			else
				uv8 = "getNumTimestamp"
				uv9 = "gym"
				uv10 = "gGameModel"
				uv11 = "gGameModel"

				battleEntrance.battleRequest("/game/cross/gym/battle/start", slot4, slot8, slot9, slot10.game_key, slot11.id, slot2):onStartOK(function (slot0)
					uv1 = "onClose"

					slot1:onClose(false)
				end):run():show()
			end
		end,
		limitInfo = csv.gym.gym[slot0.id].limitAttribute,
		from = game.EMBATTLE_FROM_TABLE.onekey
	})
	slot0:onClose()
end

function slot0.getChallengeState(slot0)
	if gGameModel.gym:read("round") == "closed" then
		return false
	end

	return time.getTime() < time.getNumTimestamp(gGameModel.gym:read("date"), 21, 45) + 518400
end

return slot0
