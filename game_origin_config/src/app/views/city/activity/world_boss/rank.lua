slot0 = class("WorldBossRankView", Dialog)
slot0.RESOURCE_FILENAME = "activity_world_boss_rank.json"
slot0.RESOURCE_BINDING = {
	unionPanel = "unionPanel",
	["trainerPanel.myRankPanel.txtName"] = "myName",
	["unionPanel.myRankPanel.txtRank"] = "myUnionRank",
	trainerPanel = "trainerPanel",
	noRankPanel = "noRankPanel",
	["trainerPanel.rankItem"] = "trainerRankItem",
	["unionPanel.myRankPanel.txtDamage"] = "myUnionDamage",
	["unionPanel.rankItem"] = "unionRankItem",
	["leftPanel.tabItem"] = "tabItem",
	["unionPanel.myRankPanel.txtName"] = "myUnionName",
	rightPanel = "rightPanel",
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
	["trainerPanel.list"] = {
		{
			event = "touch",
			methods = {
				ended = bindHelper.self("btnrightClose")
			}
		},
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				data = bindHelper.self("showData1"),
				item = bindHelper.self("trainerRankItem"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("txtRank", "headPanel", "rankIcon", "txtName", "txtDamage", "txt", "level")

					bind.extend(slot0, slot4.headPanel, {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.role.logo,
							frameId = slot3.role.frame,
							onNode = function (slot0)
								slot0:xy(104, 95):z(6):scale(0.9)
							end
						}
					})
					slot4.txtName:text(slot3.role.name)
					slot4.level:text(slot3.role.level)
					text.addEffect(slot4.txt, {
						outline = {
							color = ui.COLORS.OUTLINE.DEFAULT
						}
					})
					text.addEffect(slot4.level, {
						outline = {
							color = ui.COLORS.OUTLINE.DEFAULT
						}
					})
					adapt.oneLineCenterPos(cc.p(385, 5), {
						slot4.txt,
						slot4.level
					}, cc.p(2, 0))
					slot4.txtRank:visible(slot2 > 3):text(slot2)
					slot4.rankIcon:hide()

					if slot2 <= 3 then
						slot4.rankIcon:show():texture("activity/world_boss/img_rank" .. slot2 .. ".png")
					end

					slot4.txtDamage:text(slot3.boss_damage)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	},
	["unionPanel.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				data = bindHelper.self("showData2"),
				item = bindHelper.self("unionRankItem"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("txtRank", "headPanel", "rankIcon", "txtName", "txtDamage", "icon", "txt", "level")

					slot4.txtName:text(slot3.name)
					slot4.level:text(slot3.level)
					text.addEffect(slot4.txt, {
						outline = {
							color = ui.COLORS.OUTLINE.DEFAULT
						}
					})
					text.addEffect(slot4.level, {
						outline = {
							color = ui.COLORS.OUTLINE.DEFAULT
						}
					})
					adapt.oneLineCenterPos(cc.p(385, 5), {
						slot4.txt,
						slot4.level
					}, cc.p(2, 0))
					slot4.icon:texture(csv.union.union_logo[slot3.logo].icon)
					slot4.txtRank:visible(slot2 > 3):text(slot2)
					slot4.rankIcon:hide()

					if slot2 <= 3 then
						slot4.rankIcon:show():texture("activity/world_boss/img_rank" .. slot2 .. ".png")
					end

					slot4.txtDamage:text(slot3.damage)
				end
			}
		}
	},
	["rightPanel.title1.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = cc.c4b(212, 86, 95, 255)
				}
			}
		}
	},
	["rightPanel.title2.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = cc.c4b(212, 86, 95, 255)
				}
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.trainerPanel:hide()
	slot0.unionPanel:hide()
	slot0.noRankPanel:hide()
	slot0.rightPanel:get("list1"):setScrollBarEnabled(false)
	slot0.rightPanel:get("list2"):setScrollBarEnabled(false)

	slot0.showData1 = idlers.newWithMap(slot2.roleRank.ranks or {})
	slot0.showData2 = idlers.newWithMap(slot2.unionRank.ranks or {})
	slot0.panel = {
		{
			node = slot0.trainerPanel,
			data = slot2.roleRank
		},
		{
			node = slot0.unionPanel,
			data = slot2.unionRank
		}
	}
	slot0.tabDatas = idlers.newWithMap({
		{
			name = gLanguageCsv.role
		},
		{
			name = gLanguageCsv.guild
		}
	})
	slot0.showTab = idler.new(1)

	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot0)
		slot2.select = true
		uv2 = "tabDatas"
		slot2 = slot2.rightPanel
		slot2 = slot2.hide

		slot2(slot2)

		uv2 = "tabDatas"
		slot2 = slot2.panel[slot1].node
		slot2 = slot2.hide

		slot2(slot2)

		uv2 = "tabDatas"
		slot2 = slot2.panel[slot0].node
		slot3 = slot2

		slot2.show(slot3)

		uv3 = "tabDatas"
		slot3 = slot3.panel[slot0].data.ranks
		slot2 = itertools.isempty(slot3)
		uv3 = "tabDatas"
		slot3 = slot3.noRankPanel
		slot3 = slot3.visible

		slot3(slot3, slot2)

		uv3 = "tabDatas"
		slot3 = slot3.panel[slot0].node:get("myRankPanel")
		slot4 = slot3.visible

		slot4(slot3, not slot2)

		uv4 = "tabDatas"

		slot3:get("txtRank"):text(slot4.panel[slot0].data.selfRank == 0 and gLanguageCsv.notOnTheList or slot4.selfRank)

		slot5 = slot3:get("txtDamage")
		slot5 = slot5.text

		slot5(slot5, slot4.selfDamage)

		uv5 = "tabDatas"

		slot5.myName:text(gGameModel.role:read("name"))

		if gGameModel.role:read("union_db_id") then
			uv5 = "tabDatas"

			slot5.myUnionName:text(gGameModel.union:read("name"))
		else
			uv5 = "tabDatas"
			slot5 = slot5.myUnionName
			slot5 = slot5.text

			slot5(slot5, gLanguageCsv.nonunion)

			uv5 = "tabDatas"
			slot5 = slot5.myUnionDamage
			slot5 = slot5.hide

			slot5(slot5)

			uv5 = "tabDatas"

			slot5.myUnionRank:hide()
		end
	end)
	Dialog.onCreate(slot0)
end

function slot0.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot0.onItemClick(slot0, slot1, slot2, slot3)
	slot0.rightPanel:show()

	slot4 = slot0.rightPanel:get("item")

	function slot5(slot0, slot1, slot2)
		slot0:removeAllChildren()

		for slot6 = slot1, slot2 do
			uv7 = "removeAllChildren"
			slot8 = slot0.pushBackCustomItem

			slot8(slot0, slot7:clone())

			uv8 = "clone"

			if slot8.boss_battle_cards[slot6] then
				slot13 = slot8.skin_id
				uv13 = "pushBackCustomItem"

				bind.extend(slot13, slot7, {
					class = "card_icon",
					props = {
						unitId = dataEasy.getUnitId(slot8.card_id, slot13),
						advance = slot8.advance,
						star = slot8.star,
						dbid = slot8.id,
						rarity = csv.unit[csv.cards[slot8.card_id].unitID].rarity,
						levelProps = {
							data = slot8.level
						}
					}
				})
			else
				slot7:get("emptyPanel"):show()
			end
		end
	end

	slot5(slot0.rightPanel:get("list1"), 1, 3)
	slot5(slot0.rightPanel:get("list2"), 4, 6)
end

return slot0
