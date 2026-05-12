slot0 = class("YybetRank", Dialog)
slot0.RESOURCE_FILENAME = "yybet_rank.json"
slot0.RESOURCE_BINDING = {
	["content.rank.down.textWinNum"] = "myWinNum",
	["content.rank.down.Lv"] = "myLv",
	["content.rank.down.textWinRate"] = "myWinRate",
	["content.rank.down.name"] = "myName",
	["content.rank.down.Lv1"] = "myLv1",
	content = "content",
	["content.rank.down.rank"] = "myRank",
	["content.rank.down.spriteName"] = "mySpriteName",
	["content.rank.txtCount"] = "txtCount",
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
					slot4 = slot1:multiget("rank", "head", "name", "Lv", "Lv1", "txtRank", "textWinNum", "textWinRate", "textServer")

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
					slot4.rank:get("txt"):hide()
					slot4.rank:visible(slot2 <= 18)
					slot4.txtRank:visible(slot2 > 18)

					if slot2 > 18 then
						slot4.txtRank:text(slot2)
					else
						slot4.rank:texture(string.format("city/pvp/cross_mine/icon_kfzy_ph%d.png", slot2))
					end

					slot4.textServer:text(string.format(gLanguageCsv.brackets, getServerArea(slot3.game_key, true)))
					slot4.name:text(slot3.name)
					slot4.Lv1:text(slot3.level)
					adapt.oneLinePos(slot4.name, {
						slot4.Lv,
						slot4.Lv1
					}, {
						cc.p(10, 0),
						cc.p(2, 2)
					}, "left")

					slot6 = slot3.rank_data[1]

					slot4.textWinNum:text(slot6)
					slot4.textWinRate:text(math.floor(slot6 / math.abs(slot3.rank_data[2]) * 100) .. "%")
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.data = slot1

	slot0:resetShowPanel()
	slot0.rankList:setScrollBarEnabled(false)

	slot0.rankData = idlers.newWithMap(slot0.data.ranking or {})

	if slot1.rank and slot1.rank ~= 0 then
		slot0.myRank:text(slot1.rank)
	else
		slot0.myRank:text("--")
	end

	slot0.myName:text(gGameModel.role:read("name"))
	slot0.myLv1:text(gGameModel.role:read("level"))
	adapt.oneLinePos(slot0.myName, {
		slot0.myLv,
		slot0.myLv1
	}, {
		cc.p(10, 0),
		cc.p(2, 2)
	}, "left")
	idlereasy.when(gGameModel.role:getIdler("yyhuodongs"), function (slot0, slot1)
		uv2 = "info"
		slot3 = (slot1[slot2] or {}).info or {}
		uv6 = "total"

		slot6.myWinNum:text(slot3.win or 0)

		if (slot3.total or 0) == 0 then
			uv6 = "total"

			slot6.myWinRate:text("0%")
		else
			uv6 = "total"

			slot6.myWinRate:text(math.floor(slot5 / slot4 * 100) .. "%")
		end
	end)
	Dialog.onCreate(slot0)
end

function slot0.resetShowPanel(slot0)
	slot0.content:get("noRank"):visible(slot0.data.ranking[1] == nil)
	slot0.content:get("rank"):visible(slot0.data.ranking[1] ~= nil)
end

return slot0
