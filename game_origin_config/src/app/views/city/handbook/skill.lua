slot0 = class("HandbookSkillView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "handbook_skill.json"
slot0.RESOURCE_BINDING = {
	skillItem = "skillItem",
	panel = "panel",
	["panel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("skillDatas"),
				item = bindHelper.self("skillItem"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("textLV"):text(gLanguageCsv.textLv)
					slot1:get("textLVNum"):text(slot3.skillLevel)
					adapt.oneLinePos(slot1:get("textLVNum"), slot1:get("textLV"), cc.p(0, 0), "right")
					uiEasy.setSkillInfoToItems({
						name = slot1:get("textSkillName"),
						icon = slot1:get("imgIcon"),
						type1 = slot1:get("imgFlag")
					}, slot3.skillId)
					bind.touch(slot0, slot1:get("btnInfo"), {
						methods = {
							ended = functools.partial(slot0.clickItem, slot3)
						}
					})
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickItem, slot3)
						}
					})
				end
			},
			handlers = {
				clickItem = bindHelper.self("onShowSkillInfo")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.cardIdIdler = slot1.selCardId()
	slot0.skillDatas = idlertable.new({})

	idlereasy.when(slot0.cardIdIdler, function (slot0, slot1)
		if slot1 == 0 then
			return
		end

		slot2 = {}
		slot3 = csv.cards[slot1]

		for slot8, slot9 in ipairs(dataEasy.getSortCardSkillList(slot1)) do
			slot10 = 1

			if csv.skill[slot9].skillType2 == battle.MainSkillType.PassiveSkill then
				slot10 = 2
			end

			table.insert(slot2, {
				skillLevel = 1,
				skillId = slot9,
				skillPassive = slot10
			})
		end

		uv5 = "csv"

		slot5.skillDatas:set(slot2)

		slot5 = csv.unit[slot3.unitID]

		table.insert({}, slot5.natureType)

		if slot5.natureType2 then
			table.insert(slot6, slot5.natureType2)
		end
	end)
end

function slot0.onShowSkillInfo(slot0, slot1, slot2)
	if dataEasy.isSkillChange() then
		gGameUI:stackUI("common.skill_detail", nil, , {
			star = 1,
			skillId = slot2.skillId,
			skillLevel = slot2.skillLevel,
			cardId = slot0.cardIdIdler:read()
		})

		return
	end

	slot4 = gGameUI:stackUI("common.skill_detail", nil, {
		clickClose = true,
		dispatchNodes = slot0.list
	}, {
		skillId = slot2.skillId,
		skillLevel = slot2.skillLevel,
		cardId = slot0.cardIdIdler:read(),
		star = uiEasy.getMaxStar(slot0.cardIdIdler:read())
	}, "handbook"):getResourceNode()
	slot5, slot6 = slot4:xy()

	slot4:x(slot5 - 165)
end

return slot0
