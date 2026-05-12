slot0 = class("WorldCupRankView", Dialog)
slot0.RESOURCE_FILENAME = "worldcup_rank.json"
slot0.RESOURCE_BINDING = {
	noData = "noData",
	["down.textName"] = "myName",
	item = "item",
	["down.textRank"] = "myRanking",
	["down.textProgress"] = "myScore",
	down = "myRankPanel",
	textProgress = "textProgress",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 15,
				asyncPreload = 10,
				padding = 10,
				data = bindHelper.self("showData"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("imgBg", "textRank", "head", "imgIcon", "textName", "textLvNote", "textLv", "txtScore", "area")

					bind.extend(slot0, slot4.head, {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.logo,
							frameId = slot3.frame,
							onNode = function (slot0)
								slot0:xy(104, 95):z(6):scale(0.9)
							end
						}
					})
					slot4.textName:text(slot3.name)
					slot4.area:text(string.format(gLanguageCsv.brackets, getServerArea(slot3.game_key, true)))
					slot4.textLv:text(slot3.level)
					adapt.oneLinePos(slot4.textName, {
						slot4.textLvNote,
						slot4.textLv
					}, {
						cc.p(20, 0),
						cc.p(0, 0)
					})
					slot4.textRank:visible(slot2 > 3)
					slot4.textRank:text(slot6)
					slot4.imgIcon:visible(slot6 < 4)

					if slot6 <= 3 then
						slot4.imgBg:texture("city/pvp/craft/dialog_icon/iten_" .. slot6 .. ".png")
						slot4.imgIcon:texture("city/pvp/craft/img_xz" .. slot6 .. ".png")
					end

					slot4.txtScore:text(slot3.rank_data[1])
				end
			},
			handlers = {
				clickHead = bindHelper.self("onHeadClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.showData = idlers.newWithMap(slot1.ranking or {})

	slot0.noData:visible(itertools.size(slot1.ranking) == 0)
	slot0.myRanking:text(slot1.rank > 0 and slot1.rank or gLanguageCsv.craftNoRank)
	slot0.myRanking:setFontSize(slot1.rank > 0 and 70 or 50)
	slot0.myName:text(slot0.roleName:read())
	slot0.myScore:text(slot0.worldCupdata:read().score or 0)
	adapt.setTextScaleWithWidth(slot0.noData:get("txt"), nil, 500)
	slot0.textProgress:text(gLanguageCsv.worldcupRankCoin)
	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0)
	slot1 = gGameModel.daily_record
	slot2 = gGameModel.craft
	slot0.roleName = gGameModel.role:getIdler("name")
	slot0.worldCupdata = gGameModel.role:getIdler("worldcup")
end

return slot0
