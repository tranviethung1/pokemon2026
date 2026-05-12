slot1 = class("AutoChessRankArrayDetailView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "auto_chess_rank_array_detail.json"
slot1.RESOURCE_BINDING = {
	trainerPanel = "trainerPanel",
	itemNode = "itemNode",
	["trainerPanel.textLevel"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	list = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("arrayData"),
				item = bindHelper.self("itemNode"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "auto_chess_card1",
						props = {
							id = slot3.unitID,
							star = slot3.star,
							onNode = function (slot0)
								slot3 = 0.6

								slot0:scale(slot3)

								uv3 = "scale"

								slot0:alignCenter(slot3:size())
							end
						}
					})
					slot1:setData({
						attack = slot3.attrs.attack,
						hp = slot3.attrs.hpMax,
						defence = slot3.attrs.defence,
						equips = slot3.equips
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				clickHead = bindHelper.self("onHeadClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.arrayData = slot1.deployments or {}
	slot2 = slot0.trainerPanel:multiget("rolePanel", "skillPanel", "textLevel")

	slot2.rolePanel:get("role"):texture(gRoleFigureCsv[csv.auto_chess.trainer[slot1.trainerID].figureID].logo):scale(2.3)
	slot2.skillPanel:get("skillIcon"):texture(csv.auto_chess.trainer_skills[slot1.skillID].skillIcon)
	slot2.textLevel:text(string.format(gLanguageCsv.autoChessTrainerLevel, slot1.trainerLv))
end

return slot1
