slot0 = class("SnowBallRank", Dialog)
slot0.RESOURCE_FILENAME = "snow_ball_rank.json"
slot0.RESOURCE_BINDING = {
	["right.rank.down.time"] = "myTime",
	["right.rank.down.rank"] = "myRank",
	["right.rank.item"] = "rankItem",
	["right.rank.down.score"] = "myScore",
	["right.rank.down.spriteName"] = "mySpriteName",
	["right.rank.txtCount"] = "txtCount",
	["right.rank.down.name"] = "myName",
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
					slot4 = slot1:multiget("rank", "head", "name", "Lv", "Lv1", "score", "count", "txtRank", "time", "imgSprite")

					bind.extend(slot0, slot4.head, {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.role.logo,
							frameId = slot3.role.frame,
							onNode = function (slot0)
								slot0:xy(104, 95):z(6):scale(0.9)
							end
						}
					})
					slot4.rank:get("txt"):visible(slot2 > 3)
					slot4.rank:visible(slot2 <= 10)
					slot4.txtRank:visible(slot2 > 10)

					if slot2 == 1 then
						slot4.rank:texture("city/rank/icon_jp.png")
					elseif slot2 == 2 then
						slot4.rank:texture("city/rank/icon_yp.png")
					elseif slot2 == 3 then
						slot4.rank:texture("city/rank/icon_tp.png")
					elseif slot2 >= 4 and slot2 <= 10 then
						slot4.rank:texture("common/icon/icon_four.png")
						slot4.rank:get("txt"):text(slot2)
					elseif slot2 > 10 then
						slot4.txtRank:text(slot2)
					end

					slot4.imgSprite:texture(csv.unit[csv.cards[csv.yunying.snowball_element[slot3.snowball.role == 0 and 4 or slot3.snowball.role].attr.cardId].unitID].iconSimple)
					slot4.name:text(slot3.role.name)
					slot4.Lv1:text(slot3.role.level)
					adapt.oneLinePos(slot4.Lv, slot4.Lv1, cc.p(2, 0), "left")
					slot4.score:text(slot3.snowball.point)
					slot4.time:text(string.format("%02d:%02d", math.floor(slot3.snowball.time % 3600 / 60), math.floor(slot3.snowball.time % 60)))
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.data = slot1

	slot0:resetShowPanel()

	slot0.rightColumnSize = 10

	slot0.rankList:setScrollBarEnabled(false)

	slot0.rankData = idlers.newWithMap(slot0.data.rank or {})

	if slot2.rank and slot2.rank ~= 0 then
		slot0.myRank:text(slot2.rank)
	else
		slot0.myRank:text("--")
	end

	slot0.myName:text(gGameModel.role:read("name"))
	slot0.myScore:text(slot2.top_point == 0 and "--" or slot2.top_point)

	if slot2.top_time and slot2.top_time == 0 then
		slot0.myTime:text("--:--")
	else
		slot0.myTime:text(string.format("%02d:%02d", math.floor(slot2.top_time % 3600 / 60), math.floor(slot2.top_time % 60)))
	end

	if slot2.top_role and slot2.top_role ~= 0 then
		slot0.mySpriteName:text(csv.unit[csv.cards[csv.yunying.snowball_element[slot2.top_role].attr.cardId].unitID].name)
	else
		slot0.mySpriteName:text("")
	end

	Dialog.onCreate(slot0)
end

function slot0.resetShowPanel(slot0)
	slot0.right:get("noRank"):visible(slot0.data.rank[1] == nil)
	slot0.right:get("rank"):visible(slot0.data.rank[1] ~= nil)
end

return slot0
