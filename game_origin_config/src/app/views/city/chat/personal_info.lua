slot1 = class("ChatPersonalInfoView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "chat_personal_info.json"
slot1.RESOURCE_BINDING = {
	["baseNode.vip"] = "vip",
	["baseNode.txt"] = "txt",
	baseNode = "baseNode",
	["baseNode.name"] = "nodeName",
	["baseNode.bg"] = "bg",
	["baseNode.level"] = "level",
	["baseNode.iconBg"] = {
		varname = "iconBg",
		binds = {
			event = "extend",
			class = "role_logo",
			props = {
				vip = false,
				level = false,
				logoId = bindHelper.self("logoId"),
				frameId = bindHelper.self("frameId"),
				onNode = function (slot0)
					slot0:y(80)
				end
			}
		}
	},
	touchPanel = {
		varname = "touchPanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["baseNode.btnDetail"] = {
		varname = "btnDetail",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShowInfo")
			}
		}
	},
	["baseNode.btnDetail.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["baseNode.btnAdd"] = {
		varname = "btnAdd",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAddFirend")
			}
		}
	},
	["baseNode.btnAdd.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["baseNode.btnBlack"] = {
		varname = "btnBlack",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onDefriend")
			}
		}
	},
	["baseNode.btnBlack.txt"] = {
		varname = "defriend",
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["baseNode.btnChat"] = {
		varname = "btnChat",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPrivateChat")
			}
		}
	},
	["baseNode.btnKick"] = {
		varname = "btnKick",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnKick")
			}
		}
	},
	["baseNode.btnChat.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3)
	if (slot3 or {}).disableTouch then
		slot0.touchPanel:setTouchEnabled(false)
	end

	slot0.params = slot3.params
	slot0.state = slot3.state
	slot0.cb = slot3.cb
	slot0.blackCb = slot3.blackCb

	if slot0.params then
		slot0.btnChat:get("txt"):text(gLanguageCsv.delete)
	end

	slot0.personData = slot2

	slot0:initModel()

	slot0.vipLv = slot2.role.vip or slot2.role.vip_level or 0

	slot0.nodeName:text(slot2.role.name)

	slot0.logoId = slot2.role.logo
	slot0.frameId = slot2.role.frame or 1

	slot0.level:text(slot2.role.level)

	if slot0.vipLv == 0 then
		slot0.vip:hide()
	else
		slot0.vip:texture(ui.VIP_ICON[slot0.vipLv])
		adapt.oneLinePos(slot0.nodeName, slot0.vip)
	end

	if slot3.isKickNum and slot3.isKickNum ~= 0 and dataEasy.isUnlock(gUnlockCsv.cloneBattleKick) then
		slot0.places = gGameModel.clone_room:getIdler("places")
		slot0.voteRound = gGameModel.clone_room:getIdler("vote_round")
		slot4 = (533 - slot0.bg:height()) / 2

		slot0.bg:height(533)
		slot0.iconBg:y(slot0.iconBg:y() + slot4)
		slot0.level:y(slot0.level:y() + slot4)
		slot0.nodeName:y(slot0.nodeName:y() + slot4)
		slot0.btnDetail:y(slot0.btnDetail:y() + slot4 + 20)
		slot0.btnAdd:y(slot0.btnAdd:y() + slot4 + 20)
		slot0.btnBlack:y(slot0.btnBlack:y() + slot4 + 20)
		slot0.btnChat:y(slot0.btnChat:y() + slot4 + 20)
		slot0.txt:y(slot0.txt:y() + slot4)
		slot0.vip:y(slot0.vip:y() + slot4)
		slot0.btnKick:show()
		slot0.btnKick:y(slot0.btnKick:y() + slot4 + 20)
		idlereasy.when(slot0.places, function (slot0, slot1)
			uv2 = "isLeader"
			uv3 = "isKickNum"
			slot2.isLeader = slot3.isLeader
			uv2 = "isKickNum"

			if not slot1[slot2.isKickNum] then
				uv3 = "onClose"
				uv4 = "isLeader"

				slot3.onClose(slot4)

				return
			end

			uv3 = "isLeader"
			slot3.id = slot2.id
			uv3 = "isLeader"
			slot3.canKick = false
			uv3 = "isLeader"
			slot3.name = slot2.name

			for slot7, slot8 in pairs(slot1) do
				if slot8.play >= 3 then
					slot3 = 0 + 1
				end
			end

			uv6 = "isLeader"

			if slot6.isLeader then
				if time.getTime() - slot2.time > gCommonConfigCsv.cloneCanKickTime * 60 and slot2.play <= 0 and gCommonConfigCsv.cloneCanKickFinishNum <= slot3 then
					uv6 = "isLeader"
					slot6.canKick = true
				end
			elseif slot5 <= 0 and time.getTime() - slot4 > gCommonConfigCsv.cloneCanKickTime * 60 and gCommonConfigCsv.cloneCanKickFinishNum <= slot3 then
				uv6 = "isLeader"
				slot6.canKick = true
			end

			uv6 = "isLeader"

			if slot6.canKick then
				uv7 = "isLeader"

				cache.setShader(slot7.btnKick, false, "normal")
			else
				uv7 = "isLeader"
				slot7 = slot7.btnKick

				cache.setShader(slot7, false, "hsl_gray")

				uv7 = "isLeader"

				text.addEffect(slot7.btnKick:get("txt"), {
					color = ui.COLORS.GLOW.WHITE
				})
			end
		end)
	else
		slot0.btnKick:hide()
	end

	adapt.oneLinePos(slot0.txt, slot0.level, cc.p(0, slot0.txt:y() - slot0.level:y()))

	slot4 = slot0.baseNode:size()

	if slot3.speical and itertools.include({
		"rank",
		"friend"
	}, slot5) then
		slot6 = slot3.target:size()
		slot9 = nil

		slot0.baseNode:xy(slot1.x - 200, slot1.y >= display.height / 2 and slot1.y - slot4.height / 2 - slot6.height / 2 or slot1.y + slot4.height / 2 + slot6.height / 2)
	else
		slot8 = slot0.baseNode:size()

		slot0.baseNode:xy(slot1.x + slot4.width / 2 + 200, math.min(math.max(slot8.height / 2, slot1.y - slot4.height / 2), display.height - slot8.height / 2))
	end

	if slot5 == "friend" and dataEasy.isTownVisitUnlock() and gGameModel.role:read("town_home_visit") and slot2.role.town_home_visit then
		slot6 = 105

		slot0.baseNode:anchorPoint(0.5, 1)
		slot0.baseNode:y(slot0.baseNode:y() + slot0.baseNode:height() / 2)
		setContentSizeOfAnchor(slot0.baseNode, cc.size(slot0.baseNode:width(), slot0.baseNode:height() + slot6))
		slot0.baseNode:get("bg"):height(slot0.baseNode:get("bg"):height() + slot6):y(slot0.baseNode:get("bg"):y() - slot6 / 2)

		slot0.btnTownHome = slot0.btnBlack:clone():addTo(slot0.baseNode, 1):xy(slot0.btnBlack:x(), slot0.btnBlack:y() - slot6)

		slot0.btnTownHome:get("txt"):text(gLanguageCsv.townHomeVisit)
		text.addEffect(slot0.btnTownHome:get("txt"), {
			glow = {
				color = ui.COLORS.GLOW.WHITE
			}
		})
		bind.touch(slot0, slot0.btnTownHome, {
			methods = {
				ended = functools.partial(uiEasy.onTownHomeClick, {
					name = slot2.role.name,
					roleID = slot2.role.id,
					townDBID = slot2.role.town_home_visit
				})
			}
		})
	end
end

function slot1.initModel(slot0)
	slot0.myFriend = gGameModel.society:getIdler("friends")
	slot0.blackList = gGameModel.society:getIdler("black_list")
	slot0.friendMessage = gGameModel.messages:getIdler("private")
	slot0.isBlack = false

	idlereasy.when(slot0.blackList, function (slot0, slot1)
		slot3 = slot1
		uv4 = "itertools"
		uv3 = "itertools"
		slot3 = slot3.defriend
		slot4 = slot3
		slot3 = slot3.text

		slot3(slot4, itertools.include(slot3, slot4.personData.role.id) and gLanguageCsv.unBlackList or gLanguageCsv.spaceBlackList)

		uv3 = "itertools"
		slot3.isBlack = slot2
	end)
end

function slot1.onDefriend(slot0, slot1, slot2)
	slot4 = slot0.isBlack and gLanguageCsv.removeBlackListSuccess or gLanguageCsv.addBlackListSuccess

	gGameApp:requestServer(slot0.isBlack and "/game/society/blacklist/remove" or "/game/society/blacklist/add", function (slot0)
		slot1 = gGameUI
		slot1 = slot1.showTip
		uv3 = "gGameUI"

		slot1(slot1, slot3)

		uv1 = "showTip"

		if slot1.blackCb then
			uv1 = "showTip"
			uv2 = "showTip"

			slot1.blackCb(slot2)
		end
	end, slot0.personData.role.id)
end

function slot1.onShowInfo(slot0, slot1, slot2)
	gGameApp:requestServer("/game/role_info", function (slot0)
		gGameUI:stackUI("city.personal.other", nil, , slot0.view)
	end, slot0.personData.role.id)
end

function slot1.onAddFirend(slot0, slot1, slot2)
	idlereasy.do_(function (slot0)
		uv3 = "itertools"

		if itertools.include(slot0, slot3.personData.role.id) then
			gGameUI:showTip(gLanguageCsv.friendAlready)
		else
			uv7 = "itertools"

			gGameApp:requestServer("/game/society/friend/askfor", function (slot0)
				gGameUI:showTip(gLanguageCsv.addFriendWait)
			end, {
				slot7.personData.role.id
			})
		end
	end, slot0.myFriend)
end

function slot1.onPrivateChat(slot0)
	if slot0.params then
		slot1 = slot0.personData.role.id
		slot2 = false

		for slot6, slot7 in ipairs(slot0.friendMessage:read()) do
			if slot7.args and slot7.args.id == slot1 then
				slot2 = true
			end
		end

		gGameApp:requestServer("/game/chat/del", function (slot0)
			uv3 = "gGameModel"

			gGameModel.messages:delRoleChatMsg(slot3)

			slot1 = gGameModel.messages
			slot2 = slot1
			slot3 = "private"
			uv2 = "messages"
			uv3 = "messages"
			slot3 = slot3.state
			uv4 = "delRoleChatMsg"
			uv5 = "messages"

			slot4.onClose(slot5)

			if slot2.cb then
				if itertools.isempty(slot1.read(slot2, slot3)) then
					uv6 = "read"

					slot2(false, slot6)
				elseif slot3 then
					uv6 = "read"

					slot2(true, slot6)
				end
			end
		end, slot1)

		return
	end

	gGameUI:stackUI("city.chat.privataly", nil, , slot0.personData)
end

function slot1.onBtnKick(slot0)
	if slot0.canKick and slot0.isLeader then
		if slot0.places:read()[1].play > 0 then
			gGameUI:showDialog({
				btnType = 2,
				isRich = true,
				content = string.format("#C0x5b545b#" .. gLanguageCsv.cloneBattleKickTip3, slot0.name),
				cb = function ()
					uv4 = "gGameApp"
					slot4 = slot4.id

					gGameApp:requestServer("/game/clone/room/kick", nil, slot4)

					slot0 = gGameUI
					slot1 = slot0
					slot0 = slot0.showTip
					uv4 = "gGameApp"

					slot0(slot1, string.format(gLanguageCsv.cloneBattleKickTip4, slot4.name))

					uv0 = "requestServer"
					uv1 = "gGameApp"

					slot0.onClose(slot1)
				end,
				dialogParams = {
					clickClose = false
				}
			})
		else
			gGameUI:showTip(gLanguageCsv.cloneBattleKickTip2)
		end
	elseif slot0.canKick then
		if slot0.voteRound:read() == "start" then
			gGameUI:showTip(gLanguageCsv.cloneBattleKickVoteTip)

			return
		end

		for slot5, slot6 in ipairs(slot0.places:read()) do
			if slot6.id == gGameModel.role:read("id") then
				if gCommonConfigCsv.cloneCanKickFinishNum <= slot6.play then
					slot7 = gGameApp
					slot7 = slot7.requestServer

					slot7(slot7, "/game/clone/room/vote", nil, 1)

					uv7 = "canKick"

					slot7.onClose(slot0)
					gGameUI:stackUI("city.adventure.clone_battle.vote", nil, {
						clickClose = true
					}, true)

					break
				end

				gGameUI:showTip(gLanguageCsv.cloneBattleKickTipThreeTimes)

				break
			end
		end
	else
		gGameUI:showTip(gLanguageCsv.cloneBattleKickTip1)
	end
end

return slot1
