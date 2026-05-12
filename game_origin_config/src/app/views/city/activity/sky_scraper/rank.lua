slot0 = class("SnowBallRank", Dialog)
slot0.RESOURCE_FILENAME = "sky_scraper_rank.json"
slot0.RESOURCE_BINDING = {
	["right.rank.down.floor"] = "myFloor",
	["right.rank.item"] = "rankItem",
	right = "right",
	["right.rank.down.name"] = "myName",
	["right.rank.down.spriteName"] = "mySpriteName",
	["right.rank.down.rank"] = "myRank",
	["right.rank.txtRank"] = "txtRank",
	["right.rank.down.score"] = "myScore",
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
				huodongId = bindHelper.self("huodongId"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("rank", "head", "name", "Lv", "Lv1", "score", "count", "txtRank", "floor", "imgSprite", "area")

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

					slot5 = 1
					slot6 = nil

					for slot10, slot11 in orderCsvPairs(csv.yunying.skyscraper_medals) do
						if slot11.huodongID == slot0.huodongId then
							if slot5 < slot11.medalLevel then
								slot5 = slot11.medalLevel or slot5
							end

							if slot11.medalLevel == slot5 then
								slot6 = slot11.rankRes or slot6
							end
						end
					end

					slot8 = csv.yunying.skyscraper_medals[slot3.medallvl] and csv.yunying.skyscraper_medals[slot7].medalLevel or 0

					for slot12, slot13 in orderCsvPairs(csv.yunying.skyscraper_medals) do
						if slot13.medalLevel == slot8 + 1 and slot13.huodongID == slot0.huodongId then
							slot4.imgSprite:texture(slot13.rankRes)

							break
						end
					end

					if slot8 == slot5 then
						slot4.imgSprite:texture(slot6)
					end

					slot4.name:text(slot3.name)
					adapt.setTextScaleWithWidth(slot4.name, nil, 200)
					slot4.Lv1:text(slot3.level)
					adapt.oneLinePos(slot4.Lv, slot4.Lv1, cc.p(2, 0), "left")
					slot4.score:text(slot3.high_score)
					slot4.floor:text(string.format(gLanguageCsv.randomTowerSomeFloor, slot3.high_floor))
					adapt.oneLinePos(slot4.name, {
						slot4.Lv,
						slot4.Lv1
					}, {
						cc.p(20, 0),
						cc.p(0, 0)
					})
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.data = slot2

	slot0:resetShowPanel()

	slot0.rightColumnSize = 10

	slot0.rankList:setScrollBarEnabled(false)

	slot0.rankData = idlers.newWithMap(slot0.data.top_scorers or {})
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.huodongId = csv.yunying.yyhuodong[slot1].huodongID

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "yydata"
		slot2 = slot1[slot2] or {}
		uv3 = "info"
		slot3.yydata = slot2

		if (slot2.info or {}).rank and slot3.rank > 0 then
			uv4 = "info"

			slot4.myRank:text(slot3.rank)
		else
			uv4 = "info"

			slot4.myRank:text(gLanguageCsv.noRank)
		end

		uv4 = "info"
		slot4 = slot4.myName
		slot4 = slot4.text

		slot4(slot4, gGameModel.role:read("name"))

		uv4 = "info"
		slot4 = slot4.myScore
		slot4 = slot4.text

		slot4(slot4, slot3.high_points == 0 and "--" or slot3.high_points)

		uv4 = "info"

		slot4.myFloor:text(slot3.high_floors == 0 and "--" or string.format(gLanguageCsv.randomTowerSomeFloor, slot3.high_floors))
	end)
	Dialog.onCreate(slot0)
end

function slot0.resetShowPanel(slot0)
	slot0.right:get("noRank"):visible(slot0.data.top_scorers[1] == nil)
	slot0.right:get("rank"):visible(slot0.data.top_scorers[1] ~= nil)
end

return slot0
