slot0 = {
	gLanguageCsv.contestBetFinalWinner,
	[6] = gLanguageCsv.contestBetMissingEight,
	[5] = gLanguageCsv.contestBetEight,
	[4] = gLanguageCsv.contestBetFinalFour,
	[3] = gLanguageCsv.contestBetFinalThird,
	[2] = gLanguageCsv.contestBetFinalSecond
}
slot1 = class("ContestBetChampionAward", Dialog)
slot1.RESOURCE_FILENAME = "contest_bet_award.json"
slot1.RESOURCE_BINDING = {
	name = "teamName",
	item = "item",
	list = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 7,
				data = bindHelper.self("awardData"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = "name"
					uv6 = "get"

					slot1:get(slot6):text(slot6[slot2])
					uiEasy.createItemsToList(slot0, slot1:get("list"), slot3, {
						scale = 0.9
					})
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.tools = require("app.views.city.activity.contest_bet.tools")

	for slot10, slot11 in orderCsvPairs(slot0.tools.getCsv("base")[(csv.yunying.yyhuodong[slot1].paramMap or {}).base].championBetAwards) do
		-- Nothing
	end

	slot0.awardData = idlers.newWithMap({
		[7 - slot10] = slot11
	})

	Dialog.onCreate(slot0)
end

return slot1
