slot0 = class("BeachIceRankView", Dialog)
slot0.RESOURCE_FILENAME = "beach_ice_rank.json"
slot0.RESOURCE_BINDING = {
	["right.rank.down.name"] = "myName",
	["right.rank.item"] = "rankItem",
	["right.rank.down.area"] = "myArea",
	["right.rank.down.high"] = "myHigh",
	["right.rank.down.rank"] = "myRank",
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
					slot4 = slot1:multiget("rank", "head", "name", "Lv", "Lv1", "score", "txtRank", "score", "area", "vip")

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
					slot4.area:text(getServerArea(slot3.game_key))
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

					slot4.name:text(slot3.name)

					if slot3.vip > 0 then
						slot4.vip:texture("common/icon/vip/icon_vip" .. slot3.vip .. ".png"):show()
						adapt.oneLinePos(slot4.name, slot4.vip, cc.p(10, 0))
					else
						slot4.vip:hide()
					end

					slot4.Lv1:text(slot3.level)
					slot4.score:text(slot3.rank_data[1])
					adapt.oneLinePos(slot4.Lv, slot4.Lv1, cc.p(20, 0))
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.yyhuodongs = gGameModel.role:read("yyhuodongs")
	slot0.rankData = idlers.newWithMap(slot1.ranking or {})

	if itertools.size(slot1.ranking) ~= 0 then
		slot0.right:get("rank"):show()
		slot0.right:get("noRank"):hide()

		if slot1.rank and slot1.rank ~= 0 then
			slot0.myRank:text(slot1.rank)
			slot0.myHigh:text(((slot0.yyhuodongs[slot2] or {}).info or {}).score or 0)
		else
			slot0.myRank:text("--")
			slot0.myHigh:text("--")
		end

		slot0.myName:text(gGameModel.role:read("name"))
		slot0.myArea:text(getServerArea(userDefault.getForeverLocalKey("serverKey", nil, {
			rawKey = true
		})))
	else
		slot0.right:get("rank"):hide()
		slot0.right:get("noRank"):show()
	end

	Dialog.onCreate(slot0)
end

return slot0
