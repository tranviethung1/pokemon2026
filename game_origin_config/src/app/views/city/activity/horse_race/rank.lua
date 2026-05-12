slot0 = {
	"common/icon/logo_yellow.png",
	"common/icon/logo_blue.png",
	"common/icon/logo_green.png",
	"common/icon/logo_gray.png"
}
slot1 = class("HorseRaceRankView", Dialog)
slot1.RESOURCE_FILENAME = "horse_race_rank.json"
slot1.RESOURCE_BINDING = {
	noRank = "noRank",
	down = "downPanel",
	item = "item",
	["title.textTitle2"] = "textTitle2",
	["title.textTitle1"] = "textTitle1",
	["title.btnClose"] = {
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
				margin = 12,
				asyncPreload = 4,
				padding = 20,
				data = bindHelper.self("rankDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					uiEasy.setRankIcon(slot2, slot1:get("baseNode.imgIcon"), slot1:get("baseNode.textRank1"), slot1:get("baseNode.textRank2"))
					slot1:get("baseNode.textFightPoint"):text(slot3.rank_data[1])
					slot1:get("baseNode.textServer"):text(string.format(gLanguageCsv.brackets, getServerArea(slot3.game_key, true)))
					adapt.oneLinePos(slot1:get("baseNode.textName"):text(slot3.name), {
						slot1:get("baseNode.textLvNote"),
						slot1:get("baseNode.textLv"):text(slot3.level)
					}, cc.p(10, 0), "left")
					bind.extend(slot0, slot1:get("baseNode.head"), {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.logo,
							frameId = slot3.frame
						}
					})
					slot1:get("baseNode.textFightPoint"):text(slot3.fighting_point)
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0:initModel()

	slot0.rankDatas = idlers.new()

	slot0.rankDatas:update(slot2.ranking)

	slot3 = slot0.yyhuodongs[slot1].horse_race.point

	if slot2.my_rank and slot2.my_rank ~= 0 then
		slot0.downPanel:get("textRank"):text(slot2.my_rank)
	else
		slot0.downPanel:get("textRank"):text(gLanguageCsv.noRank)
	end

	if itertools.size(slot2.ranking) <= 0 then
		slot0.noRank:setVisible(true)
		slot0.downPanel:setVisible(false)
	else
		slot0.noRank:setVisible(false)
		slot0.downPanel:setVisible(true)
	end

	slot0.downPanel:get("textName"):text(slot0.name)
	slot0.downPanel:get("textFightPoint"):text(slot3 or 0)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:read("yyhuodongs")
	slot0.name = gGameModel.role:read("name")
end

return slot1
