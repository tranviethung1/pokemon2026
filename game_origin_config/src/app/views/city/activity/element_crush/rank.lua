slot0 = class("ElementRankView", Dialog)
slot0.RESOURCE_FILENAME = "eliminate_rank.json"
slot0.RESOURCE_BINDING = {
	["down.textName"] = "textName",
	["down.textFightPoint"] = "textFightPoint",
	item = "item",
	["down.textRank"] = "textRank",
	emptyPanel = "emptyPanel",
	["title.textTitle1"] = "textTitle1",
	["title.textTitle2"] = "textTitle2",
	["down.textArea"] = "textArea",
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
				data = bindHelper.self("rankDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("baseNode.textName"):text(slot3.name)
					slot1:get("baseNode.textLv"):text(slot3.level)
					adapt.oneLinePos(slot1:get("baseNode.textLvNote"), slot1:get("baseNode.textLv"), cc.p(2, 0))
					uiEasy.setRankIcon(slot2, slot1:get("baseNode.imgIcon"), slot1:get("baseNode.textRank1"), slot1:get("baseNode.textRank2"))
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
					slot1:get("baseNode.textFightPoint"):text(slot3.rank_data[1])
					slot1:get("baseNode.textArea"):text(string.format(gLanguageCsv.brackets, getServerArea(slot3.game_key, true)))
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.rankDatas = idlers.newWithMap(slot1.ranking)
	slot2, slot3 = nil

	for slot7, slot8 in ipairs(slot1.ranking) do
		if slot8.role_id == slot0.roleId then
			slot2 = slot8
			slot3 = slot7

			break
		end
	end

	slot0.emptyPanel:visible(#slot1.ranking == 0)
	slot0:setRoleProper(slot2, slot3)
	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0)
	slot0.roleId = gGameModel.role:read("id")
end

function slot0.setRoleProper(slot0, slot1, slot2)
	if not slot2 then
		slot0.textRank:text(gLanguageCsv.noRank)
		slot0.textName:hide()
		slot0.textArea:hide()
		slot0.textFightPoint:hide()
	else
		slot0.textName:text(slot1.name)
		slot0.textRank:text(slot2)
		slot0.textArea:text(string.format(gLanguageCsv.brackets, getServerArea(slot1.game_key, true)))
		slot0.textFightPoint:text(slot1.rank_data[1])
	end
end

return slot0
