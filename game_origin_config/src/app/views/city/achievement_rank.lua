function slot0(slot0, slot1, slot2)
	if slot2 == 0 then
		return 0
	end

	slot3 = 1

	for slot8, slot9 in ipairs(slot0) do
		slot4 = 0 + 1

		if slot2 < slot9 then
			slot3 = slot8 - 1

			break
		end

		if slot1 == slot4 then
			slot3 = slot1
		end
	end

	return slot3
end

slot1 = class("AchievementRankView", Dialog)
slot1.RESOURCE_FILENAME = "endless_tower_rank.json"
slot1.RESOURCE_BINDING = {
	fightNote = "fightNote",
	achievementItem = "item",
	gateNote = "gateNote",
	rottomPanel = "rottomPanel",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("rankDatas"),
				item = bindHelper.self("item"),
				achievementRank = bindHelper.self("rank"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot5 = slot1:multiget("rankImg", "logo", "textRank1", "textRank2", "roleName", "vip", "battle", "level", "levelNote", "textLv", "imgLvBg")

					bind.extend(slot0, slot5.logo, {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.role.logo,
							frameId = slot3.role.frame
						}
					})
					slot5.imgLvBg:texture(gAchievementLevelCsv[0][slot3.achievementLv].icon)
					uiEasy.setRankIcon(slot3.index or slot2, slot5.rankImg, slot5.textRank1, slot5.textRank2)
					slot5.roleName:text(slot3.role.name)

					slot6 = slot3.role.vip_level

					slot5.vip:texture(ui.VIP_ICON[slot6]):visible(slot6 > 0)
					slot5.battle:text(slot3.achievement)
					slot5.level:text(slot3.role.level)
					adapt.oneLinePos(slot5.levelNote, slot5.level, cc.p(0, slot5.levelNote:y() - slot5.level:y()))
					slot5.textLv:text(slot3.achievementLv)
					adapt.oneLinePos(slot5.roleName, slot5.vip, cc.p(15, 0))
					slot5.logo:setTouchEnabled(slot0.achievementRank:read() ~= slot2)
					slot5.logo:onClick(functools.partial(slot0.clickCell, slot2, slot3))
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot2 = {
		[slot7] = slot8.point
	}

	for slot7, slot8 in pairs(gAchievementLevelCsv[0]) do
		if slot7 > 0 then
			slot3 = 0 + 1
		end
	end

	slot0:initModel()
	mathEasy.setRankIndex(slot1, "achievement")

	for slot7 = 1, #slot1 do
		slot8 = slot1[slot7]
		uv9 = "pairs"
		slot8.achievementLv = slot9(slot2, slot3, slot8.achievement)
	end

	slot0.rankDatas = slot1

	slot0.fightNote:hide()
	slot0.gateNote:hide()
	slot0.rottomPanel:get("rank"):text(slot0.rank:read() == 0 and gLanguageCsv.notOnTheList or slot0.rank:read())
	slot0.rottomPanel:get("roleName"):text(slot0.roleName:read())

	for slot9, slot10 in pairs(slot0.points:read()) do
		slot5 = 0 + slot10
	end

	slot0.rottomPanel:get("battle"):text(slot5)

	slot6 = -1

	for slot10, slot11 in ipairs(gAchievementLevelCsv[0]) do
		if slot5 < slot11.point then
			slot6 = slot10 - 1

			break
		end
	end

	if slot6 == -1 then
		slot6 = itertools.size(gAchievementLevelCsv[0]) - 1
	end

	slot0.rottomPanel:get("gate"):text(slot6)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.roleName = gGameModel.role:getIdler("name")
	slot0.points = gGameModel.role:getIdler("achievement_points")
	slot0.rank = gGameModel.role:getIdler("achievement_rank")
end

function slot1.onItemClick(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot4.target
	slot6, slot7 = slot5:xy()

	gGameUI:stackUI("city.chat.personal_info", nil, , slot5:getParent():convertToWorldSpace(cc.p(slot6, slot7)), {
		role = slot3.role
	}, {
		speical = "rank",
		target = slot1.item:get("bg")
	})
end

return slot1
