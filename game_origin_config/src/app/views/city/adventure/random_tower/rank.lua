slot0 = {
	"common/icon/logo_yellow.png",
	"common/icon/logo_blue.png",
	"common/icon/logo_green.png",
	"common/icon/logo_gray.png"
}

function slot1(slot0, slot1, slot2)
	slot3 = 0
	slot4 = 0
	slot5 = 0

	if slot0 then
		slot4 = csv.random_tower.tower[slot0].roomIdx
		slot5 = gRandomTowerFloorMax[csv.random_tower.tower[slot0].floor]
	end

	slot1:text(string.format(gLanguageCsv.randomTowerSomeFloor, slot3))
	slot2:text(slot4 .. "/" .. slot5)
	adapt.oneLinePos(slot1, slot2, cc.p(5, 0))
end

slot2 = class("RandomTowerRankView", Dialog)
slot2.RESOURCE_FILENAME = "random_tower_rank.json"
slot2.RESOURCE_BINDING = {
	["down.textProgress"] = "textProgress",
	item = "item",
	["down.textProgressNote"] = "textProgressNote",
	["title.textTitle1"] = "textTitle1",
	["title.textTitle2"] = "textTitle2",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["down.textName"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("roleName")
		}
	},
	["down.textRank"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("dayRank"),
			method = function (slot0)
				return slot0 > 0 and slot0 or gLanguageCsv.noRank
			end
		}
	},
	["down.textPoint"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("dayPoint")
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 12,
				asyncPreload = 4,
				data = bindHelper.self("rankDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("imgIcon", "textRank1", "textRank2", "head", "textName", "imgVip", "textLv", "textPoint", "textProgress", "textProgressNote")

					slot4.textName:text(slot3.role.name)
					slot4.imgVip:texture(ui.VIP_ICON[slot3.role.vip_level]):visible(slot3.role.vip_level > 0)

					slot5 = adapt.oneLinePos

					slot5(slot4.textName, slot4.imgVip, cc.p(5, 0))

					uv5 = "multiget"

					slot5(slot3.random_tower.room, slot4.textProgressNote, slot4.textProgress)
					slot4.textLv:text(slot3.role.level)
					uiEasy.setRankIcon(slot2, slot4.imgIcon, slot4.textRank1, slot4.textRank2)
					bind.extend(slot0, slot4.head, {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.role.logo,
							frameId = slot3.role.frame
						}
					})
					slot4.textPoint:text(slot3.random_tower.day_point)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0:initModel()

	slot2 = slot1.rank
	slot0.rankDatas = slot2
	uv2 = "initModel"

	slot2(slot0.room:read(), slot0.textProgressNote, slot0.textProgress)
	Dialog.onCreate(slot0)
end

function slot2.initModel(slot0)
	slot0.dayRank = gGameModel.random_tower:getIdler("day_rank")
	slot0.dayPoint = gGameModel.random_tower:getIdler("day_point")
	slot0.room = gGameModel.random_tower:getIdler("room")
	slot0.roleName = gGameModel.role:getIdler("name")
end

return slot2
