slot0 = class("FishingRankView", Dialog)
slot0.RESOURCE_FILENAME = "fishing_rank.json"
slot0.RESOURCE_BINDING = {
	["right.rank.down.count"] = "myCount",
	["right.reward.reward.item"] = "rewardItem",
	["left.item"] = "btnItem",
	["right.rank.txtCount"] = "txtCount",
	["right.rank.down.rank"] = "myRank",
	["right.rank.down.name"] = "myName",
	["right.rank.down.score"] = "myScore",
	["right.reward.server.item"] = "serverItem",
	["right.rank.item"] = "rankItem",
	["right.reward.server.subList"] = "subList",
	right = "right",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["left.list"] = {
		varname = "btnList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("btnDatas"),
				item = bindHelper.self("btnItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:get("normal")
					slot5 = slot1:get("selected")

					slot5:visible(slot3.selected)
					slot4:visible(not slot3.selected)
					slot4:get("txt"):text(slot3.txt)
					adapt.setAutoText(slot5:get("txt"), slot3.txt, slot5:getSize().height - 40)

					if matchLanguage({
						"cn",
						"tw"
					}) then
						slot5:get("txt"):setFontSize(slot3.fontSize)
					end

					if matchLanguage({
						"en"
					}) then
						adapt.setAutoText(slot4:get("txt"), nil, 300)
					else
						slot4:get("txt"):getVirtualRenderer():setLineSpacing(-10)
					end

					slot5:get("txt"):getVirtualRenderer():setLineSpacing(-10)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onSelectClick")
			}
		}
	},
	["right.reward.reward.list"] = {
		varname = "rewardList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 10,
				padding = 10,
				data = bindHelper.self("showData"),
				item = bindHelper.self("rewardItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = csv.cross.fishing.rank

					slot1:multiget("bg", "icon", "txtRank", "list").txtRank:visible(slot2 > 4)

					if slot5 <= 3 then
						slot4.icon:show()
						slot4.txtRank:hide()
						slot4.bg:texture("city/pvp/cross_craft/rank/box_phb" .. slot5 .. ".png")
						slot4.icon:texture("city/pvp/cross_craft/icon_" .. slot5 .. ".png")
					elseif slot5 == 4 and slot6[4].rankMax == 10 then
						slot4.icon:show()
						slot4.txtRank:hide()
						slot4.bg:texture("city/pvp/cross_craft/rank/box_phb4.png")
						slot4.icon:texture("city/pvp/cross_craft/icon_4.png")
					elseif slot5 > 3 and slot6[4].rankMax ~= 10 then
						slot4.icon:hide()
						slot4.txtRank:show()
						slot4.txtRank:text(slot6[slot5 - 1].rankMax + 1 < slot6[slot5].rankMax and slot7 .. "-" .. slot8 or slot8)
					end

					uiEasy.createItemsToList(slot0, slot4.list, slot3.cfg.award, {
						margin = 11,
						scale = 0.9
					})
				end
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
					slot4 = slot1:multiget("rank", "head", "name", "Lv", "Lv1", "score", "count", "txtRank", "server")

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
					slot4.rank:visible(slot5 <= 10)
					slot4.txtRank:visible(slot5 > 10)

					if slot5 == 1 then
						slot4.rank:texture("city/rank/icon_jp.png")
					elseif slot5 == 2 then
						slot4.rank:texture("city/rank/icon_yp.png")
					elseif slot5 == 3 then
						slot4.rank:texture("city/rank/icon_tp.png")
					elseif slot5 >= 4 and slot5 <= 10 then
						slot4.rank:texture("common/icon/icon_four.png")
						slot4.rank:get("txt"):text(slot5)
					elseif slot5 > 10 then
						slot4.txtRank:text(slot5)
					end

					slot4.name:text(slot3.name)
					slot4.server:text(string.format(gLanguageCsv.brackets, getServerArea(slot3.game_key, true)))
					adapt.oneLinePos(slot4.name, slot4.server, cc.p(10, 0), "left")
					slot4.Lv1:text(slot3.level)
					adapt.oneLinePos(slot4.Lv, slot4.Lv1, cc.p(2, 0), "left")
					slot4.score:text(slot3.point)
					slot4.count:text(slot3.special_fish_num)
				end
			}
		}
	},
	["right.reward.server.list"] = {
		varname = "serverList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				xMargin = 22,
				columnSize = 9,
				data = bindHelper.self("serverData"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("serverItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:multiget("txt").txt:text(getServerArea(slot3, true, true))
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.data = slot1

	slot0:initModel()
	slot0.serverList:setScrollBarEnabled(false)
	slot0.subList:setScrollBarEnabled(false)
	slot0.rankList:setScrollBarEnabled(false)
	slot0.rewardList:setScrollBarEnabled(false)

	slot0.btnDatas = idlers.new(btnDatas)
	slot0.showTab = idler.new(1)
	slot0.rankData = idlers.newWithMap(slot0.data.ranks or {})
	slot0.serverData = idlers.newWithMap(getMergeServers(slot0.data.servers or {}))

	slot0.txtCount:text(string.format(gLanguageCsv.specialFishNum, csv.fishing.fish[csv.cross.fishing.base[1].specialFish].name))
	slot0.myRank:text(slot0.data.rank ~= 0 and slot0.data.rank or gLanguageCsv.noRank)
	slot0.myName:text(slot0.roleName)
	slot0.myScore:text(slot0.data.point)
	slot0.myCount:text(slot0.data.special_fish_num)
	slot0.btnDatas:update({
		{
			selected = false,
			fontSize = 50,
			txt = gLanguageCsv.rankList
		},
		{
			selected = false,
			fontSize = 45,
			txt = gLanguageCsv.craftRankReward
		}
	})

	slot4 = {}

	for slot8, slot9 in orderCsvPairs(csv.cross.fishing.rank) do
		table.insert(slot4, {
			cfg = slot9
		})
	end

	slot0.showData = idlers.newWithMap(slot4)

	slot0.showTab:addListener(function (slot0, slot1, slot2)
		uv3 = "btnDatas"
		slot3 = slot3.btnDatas:atproxy(slot1)
		slot3.selected = false
		uv3 = "btnDatas"
		slot3 = slot3.btnDatas:atproxy(slot0)
		slot3.selected = true
		uv3 = "btnDatas"

		slot3:resetShowPanel(slot0)
	end)
	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0)
	slot0.roleName = gGameModel.role:read("name")
end

function slot0.resetShowPanel(slot0, slot1)
	slot0.right:get("noRank"):visible(slot0.data.ranks[1] == nil and slot1 == 1)
	slot0.right:get("rank"):visible(slot0.data.ranks[1] ~= nil and slot1 == 1)
	slot0.right:get("reward"):visible(slot1 == 2)
end

function slot0.onSelectClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

return slot0
