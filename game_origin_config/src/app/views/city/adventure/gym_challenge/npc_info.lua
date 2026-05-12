slot0 = class("GymNpcInfoView", Dialog)
slot0.RESOURCE_FILENAME = "gym_npc_info.json"
slot0.RESOURCE_BINDING = {
	["imgBG.textIntro2"] = "textIntro2",
	["imgBG.textName"] = "masterName",
	["imgBG.textIntro1"] = "textIntro1",
	["imgBG.bg"] = "bg",
	["imgBG.attrItem"] = "attrItem",
	["imgBG.arrList"] = {
		varname = "arrList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("attrData"),
				item = bindHelper.self("attrItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("imgIcon"):texture(ui.ATTR_ICON[slot3])
				end,
				onAfterBuild = function (slot0)
					slot2 = csvSize(slot0.data)

					slot0:setAnchorPoint(cc.p(1, 0.5))
					slot0:width(slot0.item:size().width * slot2 + slot0:getItemsMargin() * (slot2 - 1))
					slot0:xy(cc.p(1600, 950))
				end
			}
		}
	},
	["imgBG.figurePanel"] = {
		binds = {
			event = "extend",
			class = "role_figure",
			props = {
				spine = true,
				data = bindHelper.self("figureId"),
				onSpine = function (slot0)
					slot0:scale(2):y(140)
				end
			}
		}
	},
	["imgBG.list"] = {
		varname = "battleArrayList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 10,
				padding = 10,
				data = bindHelper.self("monsterDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							showAttribute = true,
							unitId = slot3.unitId,
							advance = slot3.advance,
							levelProps = {
								data = slot3.level
							},
							isBoss = slot3.isBoss,
							rarity = slot3.rarity,
							onNode = function (slot0)
								slot1, slot2 = slot0:xy()
								uv3 = "xy"
								uv5 = "scale"

								slot3:scale(slot5.isBoss and 0.72 or 0.7)
							end
						}
					})
				end
			}
		}
	},
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot1(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0) do
		slot8 = csv.unit[slot7.unitId]

		table.insert(slot2, {
			unitId = slot7.unitId,
			level = slot7.level,
			advance = slot7.advance,
			rarity = slot8.rarity,
			attr1 = slot8.natureType,
			attr2 = slot8.natureType2,
			isBoss = slot1
		})
	end

	table.sort(slot2, function (slot0, slot1)
		return slot1.advance < slot0.advance
	end)

	return slot2
end

function slot0.onCreate(slot0, slot1)
	slot0.id = slot1
	slot2 = csv.gym.gym[slot0.id].npcID
	slot3 = csv.gym.npc[slot2].figure
	slot0.figureId = idler.new(slot3)

	slot0.masterName:text(gRoleFigureCsv[slot3].name)

	slot0.attrData = idlers.newWithMap(csv.gym.gym[slot1].limitAttribute)

	beauty.textScroll({
		isRich = false,
		fontSize = 40,
		list = slot0.textIntro1,
		strs = csv.gym.npc[slot2].expertise
	})
	beauty.textScroll({
		isRich = false,
		fontSize = 40,
		list = slot0.textIntro2,
		strs = csv.gym.npc[slot2].desc
	})

	slot0.item = ccui.Layout:create():size(180, 180):show():setTouchEnabled(true):retain():scale(0.8)
	slot4 = 0

	for slot8, slot9 in csvPairs(csv.gym.gate) do
		if slot9.npc == true and slot9.gymID == slot0.id then
			slot4 = slot8
		end
	end

	slot5 = csv.scene_conf[slot4]
	uv6 = "id"
	slot7 = slot5.boss
	uv7 = "id"
	slot0.monsterDatas = arraytools.merge({
		slot6(slot7, true),
		slot7(slot5.monsters, false)
	})

	Dialog.onCreate(slot0)
end

return slot0
