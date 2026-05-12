slot0 = class("EndlessTowerBattleVideo", Dialog)
slot0.RESOURCE_FILENAME = "endless_tower_battle_video.json"
slot0.RESOURCE_BINDING = {
	icon = "icon",
	item = "item",
	btnClose = {
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
				asyncPreload = 4,
				data = bindHelper.self("combatDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("logo", "roleName", "vip", "battle", "rounds", "btn", "battleNote")

					bind.extend(slot0, slot4.logo, {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.logo,
							frameId = slot3.frame,
							onNode = function (slot0)
								slot0:scale(0.9)
							end
						}
					})
					slot4.roleName:text(slot3.name)
					slot4.vip:texture(ui.VIP_ICON[slot3.vip]):visible(slot3.vip > 0)
					slot4.battle:text(slot3.fighting_point)
					adapt.oneLinePos(slot4.battleNote, slot4.battle, cc.p(5, 0))
					slot4.rounds:text(slot3.round)

					if slot3.vip > 0 then
						slot4.vip:texture(ui.VIP_ICON[slot3.vip])
						adapt.oneLinePos(slot4.roleName, slot4.vip, cc.p(15, 0))
					end

					bind.touch(slot0, slot4.btn, {
						methods = {
							ended = functools.partial(slot0.playBtn, slot2, slot3)
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end
			},
			handlers = {
				playBtn = bindHelper.self("onPlayClick"),
				afterBuild = bindHelper.self("onAfterBuild")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.combatDatas = slot1

	Dialog.onCreate(slot0)
end

function slot0.onPlayClick(slot0, slot1, slot2, slot3)
	slot4 = nil

	function slot4(slot0, slot1, slot2)
		battleEntrance.battleRecord(slot1, slot0.result, {
			noShowEndRewards = true
		}):preCheck(nil, function ()
			uv0 = "pairs"

			if slot0 then
				for slot3, slot4 in pairs(game.ATTRDEF_ENUM_TABLE) do
					uv6 = "game"

					for slot8, slot9 in pairs(slot6.roleOut) do
						if slot9[slot3] then
							slot9[slot3] = slot9[slot3] * gCommonConfigCsv.preCheckFailAttrFix
						end
					end
				end

				uv0 = "game"
				slot1 = true
				slot0.endlessAttrFix = slot1
				uv0 = "ATTRDEF_ENUM_TABLE"
				uv1 = "roleOut"
				uv2 = "game"

				slot0(slot1, slot2)
			else
				gGameUI:showTip(gLanguageCsv.crossCraftPlayNotExisted)
			end
		end):show()
	end

	gGameApp:requestServer("/game/endless/play/detail", function (slot0)
		uv3 = "gGameModel"
		slot1 = gGameModel:getEndlessPlayRecord(slot3.play_id)
		slot3 = slot1
		uv3 = "getEndlessPlayRecord"

		slot3(slot1, slot1.getData(slot3), true)
	end, slot3.play_id)
end

function slot0.onAfterBuild(slot0)
	slot0.icon:visible(slot0.list:getChildrenCount() == 0)
	adapt.setTextScaleWithWidth(slot0.icon:get("note"), nil, 700)
end

return slot0
