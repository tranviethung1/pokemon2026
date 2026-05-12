slot0 = class("BraveChallengeJumpView", Dialog)
slot1 = {
	ALL = "ALL",
	ONCE = "ONCE"
}
slot0.RESOURCE_FILENAME = "activity_brave_challenge_view_jump.json"
slot0.RESOURCE_BINDING = {
	["panel2.item"] = "item2",
	panel1 = "panel1",
	panel2 = "panel2",
	["panel1.subList"] = "awardList",
	["panel1.item"] = "awardItem",
	progressPanel = "progressPanel",
	["btnNext.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["panel2.subList"] = {
		varname = "list2",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 130,
				data = bindHelper.self("bufData"),
				item = bindHelper.self("item2"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot5 = slot1:get("normal")

					if csv.brave_challenge.badge[slot3].rarity == 2 then
						slot5 = slot1:get("rare")
					elseif slot4.rarity == 3 then
						slot5 = slot1:get("forever")
					end

					slot5:show()
					slot5:get("icon"):texture(slot4.iconResPath)
					slot5:get("title"):text(slot4.name)
					beauty.textScroll({
						align = "center",
						isRich = true,
						list = slot5:get("desc"),
						strs = "#C0x5B545B#" .. slot4.desc,
						fontSize = ui.FONT_SIZE
					})
					bind.touch(slot0, slot1, {
						methods = {
							ended = function ()
								uv4 = "gGameApp"

								gGameApp:requestServer("/game/brave_challenge/jump/choose", function (slot0)
								end, slot4)
							end
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	},
	btnNext = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("requestNext")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.award = slot1

	idlereasy.when(slot0.jumpInfo, function (slot0, slot1)
		slot2 = slot1.status
		uv3 = "status"
		slot3.jumpStep = slot2

		if slot2 == game.BRAVE_CHALLENGE_JUMP_STATE.POINT then
			uv3 = "status"

			slot3.panel1:show()
		elseif slot2 == game.BRAVE_CHALLENGE_JUMP_STATE.BUFF then
			uv3 = "status"
			slot3 = slot3.panel1
			slot3 = slot3.hide

			slot3(slot3)

			uv3 = "status"

			slot3.panel2:show()
		end

		if slot2 <= game.BRAVE_CHALLENGE_JUMP_STATE.BUFF then
			uv3 = "status"
			slot4 = "refreshPanel" .. slot2 .. "Data"
			slot3 = slot3[slot4]
			uv4 = "status"

			slot3(slot4, slot1)

			uv3 = "status"

			slot3:refreshProgressPanel(slot2)
		end

		if slot2 == game.BRAVE_CHALLENGE_JUMP_STATE.OVER then
			uv4 = "status"

			performWithDelay(slot4, function ()
				uv1 = "Dialog"

				Dialog.onClose(slot1)
			end, 0.016666666666666666)
		end
	end)
	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0)
	slot0.jumpInfo = gGameModel.brave_challenge:getIdler("jump_info")
	slot0.bufData = idlertable.new({})
	slot0.bufRoomIndex = idler.new(0)
end

function slot0.onClose(slot0)
end

function slot0.refreshPanel1Data(slot0)
	slot0.panel1:show()
	slot0:initRichPanel()
	slot0:initAward()
end

function slot0.refreshPanel2Data(slot0, slot1)
	slot0.panel1:hide()
	slot0.panel2:show()

	slot4 = slot1.total == slot1.floor and slot1.index or slot1.index + 1

	if gGameModel.brave_challenge:getIdler("game"):read().new_badges then
		for slot9 = 1, 3 do
		end

		slot0.bufData:set({
			[slot9] = slot3[slot9][1]
		})
		slot0.bufRoomIndex:set(slot4)
		slot0:refreshBuffIndex()
	else
		slot0.bufData:set({})
	end
end

function slot0.getPanel1Str(slot0)
	if slot0.jumpInfo:read().floor <= 1 then
		slot1[1] = ""
	else
		slot1[1] = string.format(gLanguageCsv.braveChallengeJumpTips1, slot3)
	end

	slot1[2] = string.format(gLanguageCsv.braveChallengeJumpTips2, slot3)
	slot1[3] = string.format(gLanguageCsv.braveChallengeJumpTips3, slot2.round)
	slot6 = gLanguageCsv.braveChallengeJumpTips4

	if not gGameModel.brave_challenge:getIdler("game"):read().new_badges then
		slot7 = slot2.total - 1
	end

	slot1[4] = string.format(slot6, slot7)

	return {
		"",
		"",
		"",
		"",
		""
	}
end

function slot0.initRichPanel(slot0)
	for slot5, slot6 in ipairs(slot0:getPanel1Str()) do
		slot7 = rich.createByStr(slot6, 50):addTo(slot0.panel1, 10):setAnchorPoint(cc.p(0, 0.5)):xy(cc.p(60, 1020 - 90 * slot5)):formatText()
	end
end

function slot0.initAward(slot0, slot1)
	bind.extend(slot0, slot0.awardList, {
		class = "listview",
		props = {
			data = dataEasy.getItemData(slot0.award),
			item = slot0.awardItem,
			dataOrderCmp = dataEasy.sortItemCmp,
			itemAction = {
				isAction = true
			},
			onAfterBuild = function ()
				uv0 = "awardList"

				slot0.awardList:adaptTouchEnabled()
			end,
			onItem = function (slot0, slot1, slot2, slot3)
				bind.extend(slot0, slot1, {
					class = "icon_key",
					props = {
						data = slot3,
						grayState = slot3.grayState,
						specialKey = {
							maxLimit = true
						}
					}
				})
			end
		}
	})
end

function slot0.requestNext(slot0)
	slot2 = slot0.jumpInfo:read()
	slot3 = ""

	if slot0.jumpStep == game.BRAVE_CHALLENGE_JUMP_STATE.BUFF and (slot2.total == slot2.floor and slot2.index or slot2.index + 1) < slot2.total then
		slot3 = gLanguageCsv.randomTowerJumpNextTips2
	end

	if slot3 ~= "" then
		gGameUI:showDialog({
			btnType = 2,
			title = gLanguageCsv.spaceTips,
			content = slot3,
			cb = function ()
				gGameApp:requestServer("/game/brave_challenge/jump/next", function (slot0)
				end)
			end
		})
	else
		gGameApp:requestServer("/game/brave_challenge/jump/next", function (slot0)
		end)
	end
end

function slot0.refreshProgressPanel(slot0, slot1)
	slot2 = {}
	slot3 = {}
	slot4 = {}

	for slot8 = 2, 2 do
		if slot8 <= slot1 then
			table.insert(slot2, "img" .. slot8)
			table.insert(slot3, "imgBar" .. slot8)
			table.insert(slot4, "text" .. slot8)
		end
	end

	slot5 = slot0.progressPanel

	nodetools.invoke(slot5, slot2, "texture", "city/adventure/random_tower/bar_d.png")
	nodetools.invoke(slot5, slot3, "texture", "city/adventure/random_tower/bar_dt.png")
	nodetools.invoke(slot5, slot4, "setTextColor", cc.c4b(247, 83, 100, 255))
end

function slot0.refreshBuffIndex(slot0)
	slot1 = slot0.bufRoomIndex:read() or 0
	slot2 = slot0.jumpInfo:read()

	slot0.panel2:removeChildByName("richTips")
	rich.createByStr(string.format("#Pfont/youmi1.ttf#" .. gLanguageCsv.braveChallengeJumpTips5, slot1, slot1, slot0.jumpInfo:read().total), 50):addTo(slot0.panel2, 10):setAnchorPoint(cc.p(0.5, 0.5)):xy(slot0.panel2:get("textTips"):hide():xy()):formatText():setName("richTips")
end

return slot0
