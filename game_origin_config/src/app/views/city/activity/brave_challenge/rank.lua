slot0 = class("BraveChallengeRankView", Dialog)
slot0.RESOURCE_FILENAME = "activity_brave_challenge_rank.json"
slot0.RESOURCE_BINDING = {
	["content.rank.down.rank"] = "myRank",
	content = "content",
	["content.rank.down.fastRound"] = "myFastRound",
	["content.rank.down.name"] = "myName",
	["content.rank.item"] = "rankItem",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["content.rank.list"] = {
		{
			event = "touch",
			methods = {
				ended = bindHelper.self("btnrightClose")
			}
		},
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
					slot4 = slot1:multiget("rank", "txtRank", "head", "name", "Lv", "Lv1", "fastRound", "ordMedal", "ordMedalNum", "rareMedal", "rareMedalNum", "imgLineup")

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

					slot1:get("area"):text(getServerArea(slot3.game_key))

					slot5 = slot3.role == 0 and 4 or slot3.role

					slot4.name:text(slot3.name)
					slot4.Lv1:text(slot3.level)
					adapt.oneLinePos(slot4.Lv, slot4.Lv1, cc.p(2, 0), "left")
					slot4.fastRound:text(slot3.brave_challenge_rank_info.round)
					slot4.ordMedalNum:text(slot3.brave_challenge_rank_info.badge_num)
					adapt.oneLinePos(slot4.ordMedal, slot4.ordMedalNum, cc.p(2, 0), "left")
					slot4.rareMedalNum:text(slot3.brave_challenge_rank_info.rare_badge_num)
					adapt.oneLinePos(slot4.rareMedal, slot4.rareMedalNum, cc.p(2, 0), "left")
					bind.touch(slot0, slot4.imgLineup, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.data = slot1

	slot0:resetShowPanel()

	slot0.contentColumnSize = 10

	slot0.rankList:setScrollBarEnabled(false)

	slot0.rankData = idlers.newWithMap(slot0.data.ranking or {})
	slot2 = gGameModel.brave_challenge:read("rank")

	if slot1.rank and slot1.rank ~= 0 then
		slot0.myRank:text(slot1.rank)
	else
		slot0.myRank:text(gLanguageCsv.noRank)
	end

	slot0.myName:text(gGameModel.role:read("name"))

	if slot2.round and slot2.round ~= 0 then
		slot0.myFastRound:text(slot2.round)
	else
		slot0.myFastRound:text("--")
	end

	Dialog.onCreate(slot0)
end

function slot0.resetShowPanel(slot0)
	slot0.content:get("noRank"):visible(itertools.size(slot0.data.ranking) == 0)
	slot0.content:get("rank"):visible(itertools.size(slot0.data.ranking) ~= 0)
end

function slot0.onItemClick(slot0, slot1, slot2, slot3)
	gGameUI:showItemDetailCustom(slot2, slot3, "city.activity.brave_challenge.rank_detail", {
		tipParams = {
			dir = "right"
		}
	})
end

return slot0
