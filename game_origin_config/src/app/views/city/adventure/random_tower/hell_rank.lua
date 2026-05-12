slot0 = {
	"common/icon/logo_yellow.png",
	"common/icon/logo_blue.png",
	"common/icon/logo_green.png",
	"common/icon/logo_gray.png"
}
slot1 = class("HellRandomTowerRankView", Dialog)
slot1.RESOURCE_FILENAME = "random_tower_rank.json"
slot1.RESOURCE_BINDING = {
	["down.textProgressNote"] = "textProgressNote",
	["down.textRank"] = "textRank",
	item = "item",
	textPoint = "titleTextPoint",
	["down.textProgress"] = "textProgress",
	["title.textTitle1"] = "textTitle1",
	["down.textPoint"] = "textPoint",
	["title.textTitle2"] = "textTitle2",
	textProgress = "titleTextProgress",
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
					slot1:multiget("imgIcon", "textRank1", "textRank2", "head", "textName", "imgVip", "textLv", "textPoint", "textProgress", "textProgressNote").textName:text(slot3.name)

					if slot3.vip_level then
						slot4.imgVip:texture(ui.VIP_ICON[slot3.vip_level]):visible(slot3.vip_level > 0)
					else
						slot4.imgVip:hide()
					end

					adapt.oneLinePos(slot4.textName, slot4.imgVip, cc.p(5, 0))
					slot4.textLv:text(slot3.level)
					label.create(string.format(gLanguageCsv.brackets, getServerArea(slot3.game_key, true)), {
						fontSize = 40,
						color = ui.COLORS.NORMAL.DEFAULT
					}):anchorPoint(0, 0.5):xy(slot4.textLv:x() + slot4.textLv:width() + 10, slot4.textLv:height()):addTo(slot1, 2)
					uiEasy.setRankIcon(slot2, slot4.imgIcon, slot4.textRank1, slot4.textRank2)
					bind.extend(slot0, slot4.head, {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.logo,
							frameId = slot3.frame
						}
					})
					slot4.textPoint:text(string.format(gLanguageCsv.randomTowerSomeFloor, slot3.floor)):setFontSize(40)
					slot4.textProgress:hide()
					slot4.textProgressNote:x((slot4.textProgressNote:x() + slot4.textProgress:x()) / 2):text(slot3.point):setFontSize(60)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.rankDatas = slot1.ranks

	slot0.titleTextPoint:text(gLanguageCsv.hellRandomTowerRankFloor)
	slot0.titleTextProgress:text(gLanguageCsv.hellRandomTowerRankPoint)
	slot0.textRank:text((slot1.rank or 0) > 0 and slot1.rank or gLanguageCsv.noRank)
	slot0.textPoint:text(string.format(gLanguageCsv.randomTowerSomeFloor, slot1.floor or 0)):setFontSize(40)
	slot0.textProgress:hide()
	slot0.textProgressNote:x((slot0.textProgressNote:x() + slot0.textProgress:x()) / 2):text(slot1.point or 0):setFontSize(60)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.roleName = gGameModel.role:getIdler("name")
end

return slot1
