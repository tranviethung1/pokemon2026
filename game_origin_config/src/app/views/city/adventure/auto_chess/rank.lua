slot1 = class("AutoChessRankView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.adventure.auto_chess.tools")
slot1.RESOURCE_FILENAME = "auto_chess_rank.json"
slot1.RESOURCE_BINDING = {
	["rightPanel.item"] = "item",
	["leftPanel.leftItem"] = "leftItem",
	emptyPanel = "emptyPanel",
	["rightPanel.down"] = "downPanel",
	["leftPanel.leftList"] = {
		varname = "leftList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("leftDatas"),
				item = bindHelper.self("leftItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("btnNormal"):hide()

						slot6 = slot1:get("btnSelected"):show()
					else
						slot5:hide()
						slot4:show():get("textNote1"):text(slot3.subName)
					end

					if matchLanguageForce({
						"en",
						"en_us",
						"en_eu"
					}) then
						slot1:get("normal"):get("textNote1"):hide()
						slot1:get("normal"):get("textNote"):y(slot1:height() / 2 - 2)
					end

					slot6:get("textNote"):text(slot3.name)
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
	["rightPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				data = bindHelper.self("rightData"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("btnLook", "imgIcon", "textRank1", "textRank2", "roleBg", "name", "txtService", "txtScore")

					uiEasy.setRankIcon(slot2, slot4.imgIcon, slot4.textRank1, slot4.textRank2)
					slot4.name:text(slot3.name)
					slot4.txtService:text(string.format(gLanguageCsv.brackets, getServerArea(slot3.game_key, true)))
					slot4.txtScore:text(slot3.points)
					bind.extend(slot0, slot4.roleBg, {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.logo,
							frameId = slot3.frame
						}
					})
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onAttrBtnClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot8 = slot0
	slot7 = slot0.createHandler(slot8, "onClose")

	gGameUI.topuiManager:createView("auto_chess", slot0, {
		onClose = slot7
	}):init({
		subTitle = "RANKING LIST",
		title = gLanguageCsv.rankList
	})

	slot2 = {}
	slot0.trainers = slot2
	uv2 = "gGameUI"
	slot0.trainers = slot2.getBaseCfg().trainers
	slot0.showTab = idler.new(-1)

	for slot7, slot8 in ipairs(slot0.trainers) do
		slot9 = csv.auto_chess.trainer[slot8]
	end

	slot0.leftDatas = idlers.newWithMap({
		[-1] = {
			id = -1,
			select = true,
			subName = "ALL",
			name = gLanguageCsv.autoChessAllRank
		},
		[slot8] = {
			name = string.format(gLanguageCsv.autoChessSubRank, slot9.name),
			subName = slot9.rankSubName,
			id = slot8
		}
	})
	slot0.rightData = idlers.newWithMap({})

	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "leftDatas"
		slot2 = slot2.leftDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "leftDatas"
		slot2 = slot2.leftDatas:atproxy(slot0)
		slot2.select = true
		uv2 = "leftDatas"

		slot2:onChangeTab()
	end, true)
	slot0:updateData(slot1)
end

function slot1.onLeftItemClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot1.updateData(slot0, slot1)
	if slot1 then
		slot3 = slot1[slot0.showTab:read()] or {}
		slot4 = slot3.ranking or {}

		slot0.emptyPanel:visible(itertools.size(slot4) == 0)
		slot0.rightData:update(slot4)
		slot0:setDownPanel(slot3)
	else
		slot0.emptyPanel:show()
	end
end

function slot1.setDownPanel(slot0, slot1)
	slot2 = slot0.downPanel:multiget("textRank", "textName", "textScore")

	slot2.textName:text(gGameModel.role:read("name"))
	slot2.textRank:text(slot1.rank and slot1.rank > 0 and slot1.rank or gLanguageCsv.craftNoRank)
	slot2.textScore:text(slot1.point or 0)
end

function slot1.onRewardClick(slot0)
	gGameUI:stackUI("city.adventure.auto_chess.rank_reward", nil, {
		clickClose = true,
		blackLayer = true
	})
end

function slot1.onAttrBtnClick(slot0, slot1, slot2, slot3, slot4)
	slot5 = {
		deployments = slot4.deployments,
		trainerID = slot4.trainer,
		trainerLv = slot4.trainer_level,
		skillID = slot4.trainer_skill
	}

	if not csv.auto_chess.trainer[slot4.trainer] then
		return
	end

	gGameUI:stackUI("city.adventure.auto_chess.rank_array_detail", nil, {
		clickClose = true,
		blackLayer = true
	}, slot5)
end

function slot1.onChangeTab(slot0)
	gGameApp:requestServer("/game/auto_chess/rank", function (slot0)
		uv1 = "updateData"

		slot1:updateData(slot0.view.ranks)
	end)
end

return slot1
