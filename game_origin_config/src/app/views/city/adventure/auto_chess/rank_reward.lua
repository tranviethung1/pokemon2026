slot1 = class("AutoChessRankRewardView", cc.load("mvc").ViewBase)
slot2 = {
	"activity/world_boss/img_rank1.png",
	"activity/world_boss/img_rank2.png",
	"activity/world_boss/img_rank3.png"
}
slot1.RESOURCE_FILENAME = "auto_chess_rank_reward.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	["leftPanel.tabItem"] = "tabItem",
	desc = "desc",
	["leftPanel.tabList"] = {
		varname = "tabList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("tabItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("selected"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					slot6:get("txt"):text(slot3.name):getVirtualRenderer():setLineSpacing(-10)
					adapt.setAutoText(slot6:get("txt"), slot3.name, slot6:size().height - 40)
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onLeftItemClick")
			}
		}
	},
	["rightPanel.tips"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(153, 107, 0, 255)
				}
			}
		}
	},
	["rightPanel.btnReward"] = {
		varname = "btnReward",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRewardClick")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("rightData"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("imgRank", "txtRank", "list")

					if slot3.maxRank <= 3 then
						uv7 = "multiget"

						slot4.imgRank:show():texture(slot7[slot2])
						slot4.txtRank:hide()
					else
						slot4.imgRank:hide()
						slot4.txtRank:show()

						if slot3.maxRank > slot3.lastRankMax + 1 then
							slot4.txtRank:text(slot3.lastRankMax + 1 .. "-" .. slot3.maxRank)
						else
							slot4.txtRank:text(slot3.maxRank)
						end
					end

					uiEasy.createItemsToList(slot0, slot4.list, slot3.awards, {
						margin = 20,
						scale = 0.9,
						onAfterBuild = function ()
							uv0 = "list"

							slot0.list:setItemAlignCenter()
						end
					})
				end
			}
		}
	}
}

function slot1.onCreate(slot0)
	slot0:getResourceNode("leftPanel"):scale(1, 1)

	slot0.tabDatas = {}
	slot0.tabDatas = idlers.newWithMap({
		{
			name = gLanguageCsv.autoChessAllRank
		},
		{
			name = gLanguageCsv.autoChessTrainerRank
		}
	})
	slot0.showTab = idler.new(1)
	slot0.rightData = idlers.newWithMap({})

	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot0)
		slot2.select = true
		uv2 = "tabDatas"

		slot2:initData()
	end)
	slot0.desc:text(gLanguageCsv.autoChessRankAwardTips)
end

function slot1.onLeftItemClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot1.initData(slot0)
	slot1 = {}

	for slot7, slot8 in orderCsvPairs(csv.auto_chess.rank_award) do
		if slot8.type == slot0.showTab:read() - 1 then
			table.insert(slot1, {
				maxRank = slot8.rankMax,
				awards = slot8.awards,
				lastRankMax = nil
			})

			slot3 = slot8.rankMax
		end
	end

	slot0.rightData:update(slot1)
end

return slot1
