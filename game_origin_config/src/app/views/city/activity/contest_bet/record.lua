slot0 = {
	open = 2,
	mine = 3,
	all = 1,
	group = 4,
	eliminate = 5
}
slot1 = require("app.views.city.activity.yy_bet.record")
slot2 = class("ContestBetRecord", slot1)
slot2.RESOURCE_FILENAME = rawget(slot1, "RESOURCE_FILENAME")
slot2.RESOURCE_BINDING = clone(rawget(slot1, "RESOURCE_BINDING"))
slot2.RESOURCE_BINDING.btnChampion = {
	varname = "btnChampion",
	binds = {
		{
			event = "touch",
			methods = {
				ended = bindHelper.self("onChampionClick")
			}
		},
		{
			event = "extend",
			class = "red_hint",
			props = {
				specialTag = "contestBetChampionBet",
				listenData = {
					activityId = bindHelper.self("activityId")
				},
				onNode = function (slot0)
					slot0:xy(180, 200)
				end
			}
		}
	}
}
slot2.RESOURCE_BINDING["btnChampion.txt"] = {
	binds = {
		event = "effect",
		data = {
			outline = {
				size = 3,
				color = cc.c4b(69, 42, 0, 255)
			}
		}
	}
}

function slot2.initTools(slot0)
	slot0.tools = require("app.views.city.activity.contest_bet.tools")
end

function slot2.initModel(slot0)
	slot0.items = gGameModel.role:read("items")
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.showTab = idler.new(slot0.nowTab or 1)
	slot0.tabDatas = idlers.newWithMap({
		{
			fontSize = 50,
			name = gLanguageCsv.yyBetAllMatch,
			redHint = {
				"contestBetAllContestBet",
				"contestBetAward"
			}
		},
		{
			fontSize = 50,
			redHint = "contestBetAllContestBet",
			name = gLanguageCsv.yyBetOpenMatch
		},
		{
			fontSize = 50,
			redHint = "contestBetAward",
			name = gLanguageCsv.yyBetMyMatch
		},
		{
			fontSize = 50,
			type = 1,
			name = gLanguageCsv.worldcupGroupStage,
			redHint = {
				"contestBetAllContestBet",
				"contestBetAward"
			}
		},
		{
			fontSize = 50,
			type = 2,
			name = gLanguageCsv.worldcupElimation,
			redHint = {
				"contestBetAllContestBet",
				"contestBetAward"
			}
		}
	})
	slot0.matchData = idlers.new({})

	slot0.tableList:width(1700)
	slot0.btnChampion:show()
end

function slot2.onChampionClick(slot0)
	gGameUI:stackUI("city.activity.contest_bet.champion_bet_view", nil, , slot0.activityId, slot0.data:read().teams)
end

function slot2.getTeamId(slot0, slot1)
	if slot0.data:read().contests[slot1] == nil then
		return 0, 0
	end

	return slot2.left_team, slot2.right_team
end

function slot2.onTabClick(slot0, slot1, slot2)
	slot5 = false

	for slot9, slot10 in ipairs(slot0.tools.getCsv("base")[csv.yunying.yyhuodong[slot0.activityId].paramMap.base].contestIDs) do
		slot11, slot12 = slot0:getTeamId(slot10)

		if slot0.tools.getCsv("contest")[slot10].type == 2 and slot11 > 0 and slot12 > 0 then
			slot5 = true

			break
		end
	end

	uv6 = "csv"

	if slot2 == slot6.eliminate and not slot5 then
		gGameUI:showTip(gLanguageCsv.contestBetNoElimation)
	else
		slot0.list1:jumpToTop()
		slot0.showTab:set(slot2)
	end
end

function slot2.getData(slot0, slot1, slot2)
	slot5 = {}
	slot6 = time.getTime()
	slot7 = 1

	for slot11, slot12 in ipairs(slot0.tools.getCsv("base")[csv.yunying.yyhuodong[slot0.activityId].paramMap.base].contestIDs) do
		slot13, slot14 = slot0:getTeamId(slot12)

		if slot13 > 0 and slot14 > 0 then
			slot16, slot17, slot18 = slot0.tools.getContestBetTime(slot0.activityId, slot12)
			slot19 = slot1[slot12]
			slot20 = slot0.result[slot12] or {}
			slot21 = false

			if #slot5 == 0 or slot0.tools.getCsv("contest")[slot12].contestDate ~= slot0.tools.getCsv("contest")[slot5[#slot5].csvId].contestDate then
				slot21 = true
			end

			uv23 = "csv"

			if slot2 == slot20.battle_id.all then
				table.insert(slot5, {
					activityid = slot0.activityId,
					csvId = slot12,
					betInfo = slot1[slot12],
					result = slot20.result,
					showDate = slot21,
					battleId = slot23
				})
			else
				uv23 = "csv"

				if slot2 == slot23.group and slot15.type == 1 then
					table.insert(slot5, slot22)
				else
					uv23 = "csv"

					if slot2 == slot23.eliminate and slot15.type >= 2 then
						table.insert(slot5, slot22)
					else
						uv23 = "csv"

						if slot2 == slot23.open and slot16 < slot6 and slot6 < slot17 then
							table.insert(slot5, slot22)
						else
							uv23 = "csv"

							if slot2 == slot23.mine and not itertools.isempty(slot19) then
								table.insert(slot5, slot22)
							end
						end
					end
				end
			end
		end

		slot7 = slot12
	end

	return slot5
end

function slot2.onJumpClick(slot0, slot1, slot2, slot3)
	gGameApp:requestServer(slot0.tools.getProtocol("contest"), function (slot0)
		uv6 = "gGameUI"
		uv8 = "gGameUI"
		uv11 = "stackUI"

		gGameUI:stackUI("city.activity.contest_bet.bet_view", nil, {
			full = true
		}, slot6.activityId, slot0.view, slot8:createHandler("getWiner", slot11.csvId))
	end, slot0.activityId, slot3.csvId)
end

function slot2.getItemRedHintTag(slot0)
	return "contestBetOneContestBet"
end

return slot2
