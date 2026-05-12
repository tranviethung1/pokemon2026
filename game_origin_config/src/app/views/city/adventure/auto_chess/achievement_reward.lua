slot1 = class("AutoChessAchievementRewardView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "auto_chess_achievement_reward.json"
slot1.RESOURCE_BINDING = {
	item = "item",
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
					slot4 = slot1:multiget("txtLevel", "list", "imgTick", "txtNotReach")

					slot4.txtLevel:text(string.format(gLanguageCsv.autoChessAchievementLevel, slot3.level))
					slot4.imgTick:visible(slot3.isRecieve)
					slot4.txtNotReach:visible(not slot3.isRecieve)
					uiEasy.createItemsToList(slot0, slot4.list, slot3.awards, {
						margin = 20,
						scale = 0.8,
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
	slot2 = {}

	for slot6, slot7 in pairs(gAutoChessAchievementLevelCsv) do
		table.insert(slot2, {
			level = slot7.level,
			awards = slot7.awards,
			point = slot7.point,
			isRecieve = (gGameModel.auto_chess:read("achievement_box_awards") or {})[slot7.id] == 0
		})
	end

	table.sort(slot2, function (slot0, slot1)
		if slot0.isRecieve ~= slot1.isRecieve then
			return slot0.isRecieve == false
		end

		return slot0.level < slot1.level
	end)

	slot0.rightData = slot2
end

return slot1
