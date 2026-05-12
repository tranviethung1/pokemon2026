slot0 = class("EndlessTowerRank", Dialog)
slot0.RESOURCE_FILENAME = "endless_tower_rank.json"
slot0.RESOURCE_BINDING = {
	item = "item",
	textPoint = "textPoint",
	rottomPanel = "rottomPanel",
	textLv = "textLv",
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
				endlessRank = bindHelper.self("endlessRank"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot0.endlessRank:read()
					slot5 = slot1:multiget("rankImg", "logo", "textRank1", "textRank2", "roleName", "vip", "battle", "levelNote", "level", "gate")

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
					uiEasy.setRankIcon(slot2, slot5.rankImg, slot5.textRank1, slot5.textRank2)
					slot5.roleName:text(slot3.role.name)
					slot5.vip:texture(ui.VIP_ICON[slot3.role.vip_level]):visible(slot3.role.vip_level > 0)
					slot5.battle:text(slot3.fighting_point)
					slot5.level:text(slot3.role.level)

					if slot3.endless ~= 0 then
						slot5.gate:text(csv.endless_tower_scene[slot3.endless].sceneName)
					end

					adapt.oneLinePos(slot5.roleName, slot5.vip, cc.p(15, 0))
					adapt.oneLinePos(slot5.levelNote, slot5.level, cc.p(0, slot5.levelNote:y() - slot5.level:y()))
					slot5.logo:setTouchEnabled(slot4 ~= slot2)
					slot5.logo:onClick(functools.partial(slot0.clickCell, slot2, slot3))
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.rankDatas = slot1

	slot0.textPoint:hide()
	slot0.textLv:hide()
	slot0.rottomPanel:get("rank"):text(slot0.endlessRank:read() == 0 and gLanguageCsv.notOnTheList or slot0.endlessRank:read())
	slot0.rottomPanel:get("roleName"):text(slot0.roleName:read())
	slot0.rottomPanel:get("battle"):text(slot0.fightingPoint:read())
	slot0.rottomPanel:get("gate"):text(slot0.maxGateId:read() == 0 and gLanguageCsv.notCleared or csv.endless_tower_scene[slot0.maxGateId:read()].sceneName)
	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0)
	slot0.endlessRank = gGameModel.role:getIdler("endless_rank")
	slot0.roleName = gGameModel.role:getIdler("name")
	slot0.fightingPoint = gGameModel.role:getIdler("top6_fighting_point")
	slot0.maxGateId = gGameModel.role:getIdler("endless_tower_max_gate")
end

function slot0.onItemClick(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot4.target
	slot6, slot7 = slot5:xy()

	gGameUI:stackUI("city.chat.personal_info", nil, , slot5:getParent():convertToWorldSpace(cc.p(slot6, slot7)), {
		role = slot3.role
	}, {
		speical = "rank",
		target = slot1.item:get("bg")
	})
end

return slot0
