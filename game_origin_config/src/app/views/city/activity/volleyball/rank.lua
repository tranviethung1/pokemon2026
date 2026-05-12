slot0 = class("VolleyballRankView", Dialog)
slot0.RESOURCE_FILENAME = "volleyball_rank.json"
slot0.RESOURCE_BINDING = {
	["right.rank.down.rank"] = "myRank",
	["right.rank.item"] = "rankItem",
	["right.rank.down.name"] = "myName",
	["right.rank.down.times"] = "myTimes",
	["right.rank.down.spriteName"] = "mySpriteName",
	["right.rank.txtCount"] = "txtCount",
	["right.rank.down.areaSer"] = "myAreaSer",
	right = "right",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["right.rank.list"] = {
		varname = "rankList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 10,
				padding = 10,
				data = bindHelper.self("rankData"),
				item = bindHelper.self("rankItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("rank", "head", "name", "Lv", "Lv1", "areaSer", "txtRank", "times")

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
					slot4.rank:get("txt"):visible(slot2 > 3)
					slot4.rank:visible(slot2 <= 10)
					slot4.txtRank:visible(slot2 > 10)

					if slot2 < 4 then
						slot4.rank:texture(({
							"city/rank/icon_jp.png",
							"city/rank/icon_yp.png",
							"city/rank/icon_tp.png",
							"common/icon/icon_four.png"
						})[slot2])
					elseif slot2 >= 4 and slot2 <= 10 then
						slot4.rank:texture(slot5[4])
						slot4.rank:get("txt"):text(slot2)
					elseif slot2 > 10 then
						slot4.txtRank:text(slot2)
					end

					slot4.name:text(slot3.name)
					slot4.Lv1:text(slot3.level)
					adapt.oneLinePos(slot4.Lv, slot4.Lv1, cc.p(2, 0), "left")
					slot4.areaSer:text(getServerArea(slot3.game_key))
					slot4.times:text(slot3.rank_data[1])
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.data = slot1
	slot0.ranking = slot1.ranking or {}
	slot0.rightColumnSize = 10
	slot0.rankData = idlers.newWithMap(slot0.ranking)

	slot0.rankList:setScrollBarEnabled(false)
	slot0:resetShowPanel()
	slot0:showMyRank(slot2)
	Dialog.onCreate(slot0)
end

function slot0.resetShowPanel(slot0)
	slot0.right:get("noRank"):visible(slot0.ranking[1] == nil)
	slot0.right:get("rank"):visible(slot0.ranking[1] ~= nil)
end

function slot0.showMyRank(slot0, slot1)
	slot0.myRank:text(slot0.data.rank and slot2.rank ~= 0 and slot2.rank or gLanguageCsv.noRank)
	slot0.myName:text(gGameModel.role:read("name"))
	slot0.myAreaSer:text(getServerArea(userDefault.getForeverLocalKey("serverKey", nil, {
		rawKey = true
	})))
	slot0.myTimes:text(slot1 > 0 and slot1 or "--")
end

return slot0
