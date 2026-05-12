slot0 = class("CardDetailView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "common_card_detail.json"
slot0.RESOURCE_BINDING = {
	["baseCardNode.skillIcon"] = "skillIcon",
	["baseCardNode.raceNote"] = "raceNote",
	["baseCardNode.raceNum"] = "raceNum",
	["baseCardNode.skillDescribeList"] = "skillDescribeList",
	["baseCardNode.skillAttr"] = "skillAttr",
	["baseCardNode.attr1"] = "attr1",
	["baseCardNode.cardName"] = "cardName",
	["baseCardNode.attr2"] = "attr2",
	["baseCardNode.attrItem"] = "attrItem",
	baseCardNode = "baseCardNode",
	["baseCardNode.skillName"] = "skillName",
	["baseCardNode.cardIcon"] = {
		binds = {
			event = "extend",
			class = "card_icon",
			props = {
				cardId = bindHelper.self("cardId"),
				star = bindHelper.self("star"),
				rarity = bindHelper.self("rarity"),
				onNode = function (slot0)
					slot0:alignCenter(slot0:size())
				end
			}
		}
	},
	["baseCardNode.list"] = {
		varname = "attrList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("attrItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("icon", "note", "num", "bar")

					slot4.note:text(slot3.note)
					slot4.num:text(slot3.num)
					slot4.icon:texture(slot3.icon)
					slot4.bar:setPercent(slot3.num * 100 / game.RACE_ATTR_LIMIT)
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0:getResourceNode():setTouchEnabled(false)

	slot0.attrDatas = idlertable.new({})
	slot3, slot4 = dataEasy.getCardIdAndStar(slot1.num)
	slot5 = csv.cards[slot3]
	slot6 = csv.unit[slot5.unitID]
	slot0.cardId = idler.new(slot3)
	slot0.star = idler.new(slot4)
	slot0.rarity = idler.new(slot6.rarity)

	beauty.textScroll({
		isRich = true,
		fontSize = 40,
		list = slot0.skillDescribeList,
		strs = "#C0x5B545B#" .. csv.skill[slot5.innateSkillID].simDesc
	})
	slot0.cardName:text(slot5.name)
	slot0.attr1:texture(ui.ATTR_ICON[slot6.natureType])

	if slot6.natureType2 then
		slot0.attr2:texture(ui.ATTR_ICON[slot6.natureType2]):show()
	else
		slot0.attr2:hide()
	end

	slot0.skillName:text(slot7.skillName)

	slot8 = slot0.skillName:size().width

	if not slot7.skillNatureType then
		slot0.skillAttr:hide()
		slot0.skillIcon:hide()
	else
		slot0.skillAttr:texture(ui.SKILL_TEXT_ICON[slot7.skillNatureType]):show()
		slot0.skillIcon:texture(ui.SKILL_ICON[slot7.skillNatureType]):show()
	end

	slot0.raceNum:text(slot5.specValue[csvSize(slot5.specValue)])

	for slot14, slot15 in ipairs({
		{
			"hp",
			"sm"
		},
		{
			"speed",
			"sd"
		},
		{
			"damage",
			"wg"
		},
		{
			"defence",
			"wf"
		},
		{
			"specialDamage",
			"tg"
		},
		{
			"specialDefence",
			"tf"
		}
	}) do
		-- Nothing
	end

	slot0.attrDatas:set({
		[slot14] = {
			note = getLanguageAttr(slot15[1]),
			num = slot5.specValue[slot14],
			icon = ui.ATTR_LOGO[slot15[1]],
			barImg = "card_info/bar_" .. slot15[2] .. ".png"
		}
	})
end

function slot0.hitTestPanel(slot0, slot1)
	if slot0.skillDescribeList:isTouchEnabled() then
		slot2 = slot0.baseCardNode
		slot3 = slot2:box()
		slot4 = slot2:parent():convertToWorldSpace(cc.p(slot3.x, slot3.y))
		slot3.x = slot4.x
		slot3.y = slot4.y

		return cc.rectContainsPoint(slot3, slot1)
	end

	return false
end

return slot0
