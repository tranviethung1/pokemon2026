slot0 = class("PersonalOtherView", Dialog)
slot0.RESOURCE_FILENAME = "personal_other.json"
slot0.RESOURCE_BINDING = {
	["rightPanel.upPanel.namePanel.txtContent"] = "nameTxt",
	["rightPanel.centerPanel.battleArrayPanel.txt"] = "txt",
	["rightPanel.downPanel.text"] = "signTxt",
	["rightPanel.upPanel.guildPanel.txtContent"] = "unionTxt",
	["rightPanel.centerPanel.collectPanel.txtContent"] = "collectTxt",
	["rightPanel.upPanel.powerPanel.txtContent"] = "powerTxt",
	["rightPanel.upPanel.headImg.vip"] = "vip",
	["leftPanel.bg"] = "bg",
	["leftPanel.btnMedal.img"] = "medalIcon",
	["rightPanel.centerPanel.unlockPanel.txtContent"] = "unlockTxt",
	["rightPanel.upPanel.levelPanel.txtContent"] = "levelTxt",
	["leftPanel.cardImg"] = {
		binds = {
			event = "extend",
			class = "role_figure",
			props = {
				data = bindHelper.self("figureId"),
				onNode = function (slot0)
					slot0:z(7)
				end
			}
		}
	},
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["rightPanel.upPanel.headImg"] = {
		varname = "headImg",
		binds = {
			event = "extend",
			class = "role_logo",
			props = {
				level = false,
				logoId = bindHelper.self("logoId"),
				frameId = bindHelper.self("frameId"),
				vip = bindHelper.self("vipLv"),
				onNode = function (slot0)
					slot0:scale(0.9)
				end
			}
		}
	},
	["rightPanel.centerPanel.battleArrayPanel.list"] = {
		varname = "battleArrayList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("battleData"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							unitId = slot3.unitId,
							advance = slot3.advance,
							rarity = slot3.rarity,
							star = slot3.star,
							levelProps = {
								data = slot3.level
							},
							onNode = function (slot0)
								slot0:scale(0.9)
							end
						}
					})

					if slot3.unitId > 0 then
						bind.touch(slot0, slot1, {
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onClickItem")
			}
		}
	},
	["rightPanel.upPanel.titlePanel.panel"] = {
		binds = {
			event = "extend",
			class = "role_title",
			props = {
				data = bindHelper.self("titleId")
			}
		}
	},
	["leftPanel.btnMedal"] = {
		varname = "btnMedal",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("goMedal")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.personData = slot1
	slot2 = false

	if csv.unlock[gUnlockCsv.medalCollection] and dataEasy.isInServer(slot3.feature) and slot3.showLevel <= slot1.level then
		slot2 = true
	end

	if dataEasy.isUnlock(gUnlockCsv.medalCollection) and slot2 then
		slot0.btnMedal:show()
		slot0.medalIcon:show()

		if slot1.medal_show and slot1.medal_show > 0 then
			slot0.medalIcon:texture(gMedalCollectionCsv[slot1.medal_show][1].res):scale(1.3)
		else
			slot0.medalIcon:hide()
		end
	else
		slot0.btnMedal:hide()
		slot0.medalIcon:hide()
	end

	slot0.levelTxt:text(slot1.level)
	slot0.unionTxt:text(slot1.union_name ~= "" and slot1.union_name or gLanguageCsv.none)
	slot0.nameTxt:text(slot1.name)

	slot4 = gLanguageCsv.soLazy

	if gCommonConfigCsv.personalSignShowLevel < slot1.level and string.trim(slot1.personal_sign) ~= "" then
		slot4 = slot1.personal_sign
	end

	slot0.signTxt:text(slot4)
	slot0.powerTxt:text(slot1.battle_fighting_point)
	slot0.collectTxt:text(string.format("%.1f%%", slot1.collect_num * 100 / table.length(gHandbookArrayCsv)))
	slot0.unlockTxt:text(slot1.collect_num)

	slot0.figureId = idler.new(slot1.figure)

	if matchLanguage({
		"cn",
		"tw",
		"kr"
	}) then
		slot0.txt:getVirtualRenderer():setMaxLineWidth(60)
		slot0.txt:getVirtualRenderer():setLineSpacing(-10)
	elseif matchLanguage({
		"en"
	}) then
		adapt.setAutoText(slot0.txt, slot0.txt:text(), 300)
	end

	slot5 = slot0.headImg:size()
	slot0.logoId = idler.new(slot1.logo)
	slot0.frameId = idler.new(slot1.frame)
	slot0.vipLv = idler.new(slot1.vip_level)
	slot0.titleId = idler.new(slot1.title_id)
	slot0.item = ccui.Layout:create():size(180, 180):show():setTouchEnabled(true):retain()
	slot6 = {}

	for slot10, slot11 in ipairs(slot1.cards) do
		table.insert(slot6, {
			cardId = slot11.card_id == 0 and 11 or slot11.card_id,
			advance = slot11.advance,
			unitId = dataEasy.getUnitId(slot11.card_id, slot11.skin_id),
			star = slot11.star,
			level = slot11.level,
			rarity = csv.unit[csv.cards[slot11.card_id == 0 and 11 or slot11.card_id].unitID].rarity,
			id = slot11.id
		})
	end

	if #slot6 < 6 then
		for slot11 = #slot6 + 1, 6 do
			table.insert(slot6, {
				unitId = -1
			})
		end
	end

	slot0.battleData = idlertable.new(slot6)

	Dialog.onCreate(slot0)
end

function slot0.onCleanup(slot0)
	if slot0.item then
		slot0.item:release()

		slot0.item = nil
	end

	Dialog.onCleanup(slot0)
end

function slot0.onClickItem(slot0, slot1, slot2, slot3)
	if slot3.cardId == -1 then
		return
	end

	gGameApp:requestServer("/game/card_info", function (slot0)
		gGameUI:stackUI("city.card.info", nil, , slot0.view)
	end, slot3.id)
end

function slot0.goMedal(slot0)
	if not slot0.personData.medal or itertools.size(slot0.personData.medal) == 0 then
		gGameUI:showTip(gLanguageCsv.canNotShowMedal)
	else
		gGameUI:stackUI("city.medal_collection.view", nil, , true, slot0.personData)
	end
end

return slot0
