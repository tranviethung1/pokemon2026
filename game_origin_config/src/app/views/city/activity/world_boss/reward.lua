slot0 = class("WorldBossRewardView", Dialog)
slot0.RESOURCE_FILENAME = "activity_world_boss_reward.json"
slot0.RESOURCE_BINDING = {
	["panel.rankItem"] = "rankItem",
	["leftPanel.tabItem"] = "tabItem",
	panel = "panel",
	["leftPanel.tabList"] = {
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

					adapt.setAutoText(slot6:get("txt"), slot3.name)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabClick")
			}
		}
	},
	["panel.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				data = bindHelper.self("datas"),
				item = bindHelper.self("rankItem"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("imgBg", "rankIcon", "list", "txtRank")

					slot4.rankIcon:hide()
					slot4.txtRank:hide()

					if slot2 <= 3 then
						slot4.rankIcon:show():texture("activity/world_boss/img_rank" .. slot2 .. ".png")
					else
						slot4.txtRank:show():text(slot3.preRank < slot3.cfg.rank and slot5 .. "-" .. slot6 or slot6)
					end

					uiEasy.createItemsToList(slot0, slot4.list, slot3.cfg.award, {
						margin = 40,
						scale = 0.9
					})
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot3 = nil

	for slot7, slot8 in orderCsvPairs(csv.world_boss.base) do
		if slot8.huodongID == csv.yunying.yyhuodong[slot1].huodongID then
			slot3 = slot8

			break
		end
	end

	for slot9, slot10 in orderCsvPairs(csv.world_boss.role_rank_award) do
		if slot10.huodongID == slot2.huodongID then
			table.insert({}, {
				cfg = slot10,
				csvId = slot9,
				preRank = slot5[slot9 - 1] and slot5[slot9 - 1].rank + 1 or 1
			})
		end
	end

	for slot11, slot12 in orderCsvPairs(csv.world_boss.union_rank_award) do
		if slot12.huodongID == slot2.huodongID then
			table.insert({}, {
				cfg = slot12,
				csvId = slot11,
				preRank = slot7[slot11 - 1] and slot7[slot11 - 1].rank + 1 or 1
			})
		end
	end

	slot0.tabDatas = idlers.newWithMap({
		{
			name = gLanguageCsv.role
		},
		{
			name = gLanguageCsv.guild
		}
	})
	slot0.showTab = idler.new(1)
	slot0.datas = idlers.new()

	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot0)
		slot2.select = true
		uv2 = "tabDatas"
		slot2 = slot2.datas
		slot3 = slot2
		slot2 = slot2.update

		if slot0 == 1 then
			uv4 = "atproxy"

			if not slot4 then
				uv4 = "select"
			end
		end

		slot2(slot3, slot4)
	end)
	Dialog.onCreate(slot0)
end

function slot0.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

return slot0
