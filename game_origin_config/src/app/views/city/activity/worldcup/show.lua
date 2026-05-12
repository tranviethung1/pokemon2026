slot0 = {
	ALL = 2,
	SINGLE = 1
}
slot1 = {
	AWARD = 2,
	TITLE = 1
}
slot2 = {
	{
		left = 1,
		right = 48,
		text = gLanguageCsv.worldcupGroupStage
	},
	{
		left = 49,
		right = 56,
		text = gLanguageCsv.worldcupGroupEight
	},
	{
		left = 57,
		right = 60,
		text = gLanguageCsv.worldcupGroupFour
	},
	{
		left = 61,
		right = 62,
		text = gLanguageCsv.worldcupGroupTwo
	},
	{
		left = 63,
		right = 63,
		text = gLanguageCsv.worldcupGroupThird
	},
	{
		left = 64,
		right = 64,
		text = gLanguageCsv.worldcupGroupFinal
	}
}
slot3 = class("WorldCupShowView", Dialog)
slot3.RESOURCE_FILENAME = "worldcup_show.json"
slot3.RESOURCE_BINDING = {
	item = "item",
	["topPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("areaDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					uv5 = "type"

					if slot3.type == slot5.TITLE then
						slot1:get("panel"):hide()
						slot1:get("title"):show():y(40)
						slot1:get("title.team"):text(slot3.text)
						slot1:get("title.text"):text(slot3.title)
						slot1:height(80)
					else
						slot1:get("title"):hide()
						slot1:get("panel"):show()
						slot1:get("panel.achvDesc"):text(slot3.str)
						uiEasy.createItemsToList(slot0, slot1:get("panel.list"), slot3.data, {
							scale = 0.8
						})
					end
				end
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0:initModel()
	slot0:initDatas(slot1.type, slot1.data, slot1.award)
	performWithDelay(slot0, function ()
		uv0 = "list"

		slot0.list:scrollToBottom(1, true)
	end, 0.016666666666666666)
	Dialog.onCreate(slot0)
end

function slot3.initModel(slot0)
	slot0.areaDatas = idlers.new()
end

function slot3.initDatas(slot0, slot1, slot2, slot3)
	slot4 = {}
	uv5 = "SINGLE"

	if slot1 == slot5.SINGLE then
		slot5 = csv.yunying.worldcup_match[slot2.matchId]
		uv9 = "csv"

		for slot11, slot12 in ipairs(slot9) do
			if slot12.left <= slot2.matchId and slot2.matchId <= slot12.right then
				uv16 = "yunying"

				table.insert(slot4, {
					type = slot16.TITLE,
					title = slot12.text,
					text = string.format(gLanguageCsv.worldcupVs, csv.yunying.worldcup_team[slot5.team1].teamName, csv.yunying.worldcup_team[slot5.team2].teamName)
				})

				break
			end
		end

		uv12 = "yunying"

		table.insert(slot4, {
			type = slot12.AWARD,
			data = slot3,
			str = slot0:getStrtext(slot2)
		})
	else
		for slot8, slot9 in pairs(slot2) do
			slot10 = csv.yunying.worldcup_match[slot8]
			uv14 = "csv"

			for slot16, slot17 in ipairs(slot14) do
				if slot17.left <= slot16 and slot16 <= slot17.right then
					uv21 = "yunying"

					table.insert(slot4, {
						type = slot21.TITLE,
						title = slot17.text,
						text = string.format(gLanguageCsv.worldcupVs, csv.yunying.worldcup_team[slot10.team1].teamName, csv.yunying.worldcup_team[slot10.team2].teamName)
					})

					break
				end
			end

			for slot16, slot17 in pairs(slot9) do
				uv22 = "yunying"

				table.insert(slot4, {
					type = slot22.AWARD,
					data = slot17.award,
					str = slot0:getStrtext(slot17)
				})
			end
		end
	end

	slot0.areaDatas:update(slot4)
end

function slot3.getStrtext(slot0, slot1)
	slot2 = gLanguageCsv.worldcupGuessWdlFalse

	if slot1.type == 1 then
		slot3 = csv.yunying.worldcup_match[slot1.matchId]

		if slot1.guess then
			slot2 = gLanguageCsv.worldcupGuessWdlTrue
		end
	else
		slot2 = gLanguageCsv.worldcupGuessScoreTrue
	end

	return slot2
end

return slot3
