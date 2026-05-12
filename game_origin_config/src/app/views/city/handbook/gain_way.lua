slot0 = {
	JUMP = 2,
	NORMAL = 3,
	UNLOCK = 1
}
slot1 = game.SHOP_UNLOCK_KEY
slot2 = require("app.views.common.gain_way").WAY_TITLE
slot4 = class("HandbookGainWayView", cc.load("mvc").ViewBase)
slot4.RESOURCE_FILENAME = "handbook_from.json"
slot4.RESOURCE_BINDING = {
	item = "item",
	["panel.tip"] = "tip",
	["panel.imgBG"] = "imgBG",
	item1 = "item1",
	["panel.head"] = {
		binds = {
			event = "extend",
			class = "card_icon",
			props = {
				cardId = bindHelper.self("cardIdIdler"),
				onNode = function (slot0)
				end
			}
		}
	},
	["panel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("gainWayDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					if not slot3.text1 then
						slot4 = string.split(slot3.target, "-")
						slot6 = slot4[1]
						slot5 = gLanguageCsv[slot6]
						uv6 = "text1"
						slot7 = (slot6[slot4[1]] or {})[tonumber(slot4[2]) or slot4[2]] or ""

						if tonumber(slot4[1]) then
							slot9, slot10, slot11, slot12 = dataEasy.getChapterInfoByGateID(slot8)

							if slot10 == 0 then
								if slot9 == 1 then
									slot7 = string.format("%s%s", gLanguageCsv.gateStory, gLanguageCsv.gate)
								else
									slot7 = string.format("%s%s", gLanguageCsv.gateDifficult, gLanguageCsv.gate)
								end
							else
								slot7 = csv.scene_conf[tonumber(slot4[1])].sceneName .. " " .. slot10 .. "-" .. slot11
							end
						elseif slot4[1] == "activity" then
							slot7 = ""
						end

						slot1:get("textNote1"):text(slot5 or gLanguageCsv.mainline)
						slot1:get("textInfo"):text(slot7)

						slot14 = 0

						adapt.oneLinePos(slot1:get("textNote1"), slot1:get("textInfo"), cc.p(15, slot14), "left")

						slot9 = slot1:get("btnJump")
						slot10 = slot9:get("textNote")
						slot12 = slot9
						uv14 = "string"

						slot9.visible(slot12, slot3.state == slot14.JUMP)

						uv12 = "string"

						if slot3.state ~= slot12.JUMP then
							return
						end

						slot11 = jumpEasy.isJumpUnlock(slot3.target, false)

						if slot4[1] == "shop" then
							uv13 = "split"

							if slot13[tonumber(slot4[2]) or 1].mustHaveUion == true and gGameModel.role:read("union_db_id") == nil then
								slot11 = false
							end
						end

						cache.setShader(slot9, false, slot11 and "normal" or "hsl_gray")
						text.deleteAllEffect(slot10)
						text.addEffect(slot10, {
							color = slot11 and cc.c4b(255, 252, 237, 255) or ui.COLORS.DISABLED.WHITE
						})
						slot10:text(slot11 and gLanguageCsv.leaveFor or gLanguageCsv.notOpen)
						slot9:setTouchEnabled(slot11)

						if slot11 then
							bind.touch(slot0, slot9, {
								methods = {
									ended = functools.partial(slot0.clickItem, slot3)
								}
							})
						end
					else
						slot1:get("textNote1"):text(slot3.text1)
						slot1:get("textInfo"):text(slot3.text2)
						adapt.oneLinePos(slot1:get("textNote1"), slot1:get("textInfo"), cc.p(15, 0), "left")
						bind.touch(slot0, slot1:get("btnJump"), {
							methods = {
								ended = functools.partial(slot0.clickItem, slot3)
							}
						})
					end
				end
			},
			handlers = {
				clickItem = bindHelper.self("onClick")
			}
		}
	},
	["panel.upList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("cardAttrs"),
				item = bindHelper.self("item1"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("imgIcon"):texture(ui.ATTR_ICON[slot3])
				end
			}
		}
	},
	["panel.textName"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("textName")
		}
	},
	["panel.tip.textNode"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("tipText")
		}
	}
}

function slot4.onCreate(slot0, slot1)
	slot0.cardIdIdler = slot1.selCardId()

	slot0:initModel()

	slot0.isShowTip = idler.new(true)
	slot0.gainWayDatas = idlers.newWithMap({})
	slot0.textName = idler.new("")
	slot0.cardAttrs = idlers.newWithMap({})
	slot0.tipText = idler.new("")

	slot0.list:y(slot0.list:y() - 20)

	slot3 = {}

	for slot7, slot8 in csvPairs(csv.world_map) do
		slot9 = {}

		if slot8.chapterType and slot8.openLevel <= table.length(gRoleLevelCsv) then
			if not slot3[slot8.chapterType] then
				slot3[slot8.chapterType] = {}
			end

			slot9.sortIndex = slot7

			table.insert(slot3[slot8.chapterType], slot9)
		end
	end

	for slot7, slot8 in pairs(slot3) do
		table.sort(slot8, function (slot0, slot1)
			return slot0.sortIndex < slot1.sortIndex
		end)
	end

	idlereasy.when(slot0.cardIdIdler, function (slot0, slot1)
		slot2 = csv.cards[slot1]
		slot4 = slot2.unitID
		uv4 = "csv"
		slot4.rarity = csv.unit[slot4].rarity
		slot4 = {}

		if slot2.megaIndex <= 0 then
			slot5 = csv.fragments[slot2.fragID]

			for slot9 = 1, math.huge do
				if not slot5["produceGate" .. slot9] or slot10 == "" then
					break
				end

				slot12 = true

				if tonumber(slot10) then
					slot13, slot14, slot15, slot16 = dataEasy.getChapterInfoByGateID(slot11)
					uv17 = "cards"
					slot12 = slot17[slot13][slot14] ~= nil
				end

				if string.find(slot10, "^shop-") then
					uv14 = "unit"

					if slot14[tonumber(string.sub(slot10, 6)) or 1].unlockKey and not dataEasy.isUnlock(slot14) then
						slot12 = false
					end

					if not gShopGainMap[slot2.fragID] then
						printWarn("!!![%s]没有商店固定产出，来源获得商店去除", slot2.fragID)

						slot12 = false
					end
				elseif slot10 == "townSupermarket" then
					slot12 = dataEasy.isTownBuildingUnlock(game.TOWN_BUILDING_ID.SUPERSHOP)
				end

				if string.find(slot10, "^drawCard-") and not gDrawPreviewMap[slot2.fragID] then
					slot12 = false
				end

				if slot12 then
					uv16 = "unitID"

					table.insert(slot4, {
						target = slot10,
						state = slot16.JUMP
					})
				end
			end

			uv6 = "csv"

			slot6.tipText:set(slot5.produceDesc)
		else
			table.insert(slot4, {
				text1 = gLanguageCsv.megaTitle,
				text2 = gLanguageCsv.megaHouse,
				cardId = slot1,
				target = "cardMega-" .. slot1
			})
		end

		uv6 = "csv"
		slot6 = slot6.isShowTip
		slot6 = slot6.set

		slot6(slot6, #slot4 == 0)

		uv6 = "csv"

		slot6.gainWayDatas:update(slot4)
		table.insert({}, slot3.natureType)

		if slot3.natureType2 then
			table.insert(slot6, slot3.natureType2)
		end

		uv7 = "csv"
		slot7 = slot7.cardAttrs
		slot7 = slot7.update

		slot7(slot7, slot6)

		uv7 = "csv"

		slot7.textName:set(slot2.name or "")
	end)
	idlereasy.when(slot0.isShowTip, function (slot0, slot1)
		uv2 = "tip"
		slot2 = slot2.tip
		slot2 = slot2.visible

		slot2(slot2, slot1)

		uv2 = "tip"

		slot2.imgBG:visible(slot1)
	end)
end

function slot4.initModel(slot0)
	slot0.gateOpen = gGameModel.role:getIdler("gate_open")
	slot0.cards = gGameModel.role:getIdler("pokedex")
end

function slot4.onClick(slot0, slot1, slot2)
	jumpEasy.jumpTo(slot2.target)
end

return slot4
