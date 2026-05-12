slot0 = class("PersonalSkillChooseView", Dialog)
slot1 = {
	ALL = 1,
	UNLOCKED = 2,
	NOT_UNLOCK = 4,
	CAN_UNLOCK = 3
}
slot0.RESOURCE_FILENAME = "personal_skill_choose.json"
slot0.RESOURCE_BINDING = {
	subList = "skillSubList",
	descList = "descList",
	itemSkill = "skillItem",
	conditionList = "conditionList",
	conditionRemove = "conditionRemove",
	skillPanel = "skillPanel",
	skillName = "skillName",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["btnSave.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	btnSave = {
		varname = "btnSave",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSaveClick")
			}
		}
	},
	["btnRemove.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	btnRemove = {
		varname = "btnRemove",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRemoveClick")
			}
		}
	},
	leftList = {
		varname = "skillList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 4,
				data = bindHelper.self("skillDatas"),
				item = bindHelper.self("skillSubList"),
				cell = bindHelper.self("skillItem"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(csv.skill[slot3.skillIdx].iconRes)
					slot1:get("selected"):hide()
					slot1:get("used"):visible(slot3.inUse or slot3.isUse)

					uv8 = "csv"

					slot1:get("locked"):visible(slot3.unlocked ~= slot8.UNLOCKED)

					if slot3.isUse then
						slot1:get("used"):get("txt"):text(gLanguageCsv.haveUse)
					end

					slot1:get("selected"):visible(slot3.selectSign or false)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onClickCell")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2, slot3)
	slot0.selectFigureId = slot1
	slot0.num = slot3
	slot0.selectSkill = idler.new(slot2)
	slot0.curfigureId = idler.new(slot2)
	slot0.skillDatas = idlers.new()

	slot0:initModel()
	idlereasy.any({
		slot0.figures,
		slot0.figure,
		slot0.skillFigure,
		slot0.curfigureId
	}, function (slot0, slot1, slot2, slot3, slot4)
		slot5 = {}
		slot6 = {}
		uv7 = "pairs"

		if not slot3[slot7] then
			slot7 = {
				slot8
			}
			uv8 = "pairs"
		end

		for slot11, slot12 in pairs(slot7) do
			slot6[slot12] = true
		end

		slot8 = true
		uv9 = "selectSkill"
		slot9 = slot9.selectSkill:read()

		for slot13, slot14 in csvPairs(gRoleFigureCsv) do
			if slot14.skills[1] and slot14.hide == 0 then
				if slot1[slot13] then
					uv15 = "read"

					if not slot15.UNLOCKED then
						uv15 = "read"
						slot15 = slot15.NOT_UNLOCK
					end
				end

				slot17 = slot6[slot13] or false

				if slot13 == slot4 then
					slot17 = false
				end

				if slot13 == slot9 then
					slot8 = false
				end

				table.insert(slot5, {
					id = slot13,
					unlocked = slot15,
					inUse = slot16,
					isUse = slot17,
					showIdx = slot14.showIdx,
					skillIdx = slot14.skills[1]
				})
			end
		end

		table.sort(slot5, function (slot0, slot1)
			if slot0.unlocked ~= slot1.unlocked then
				return slot0.unlocked < slot1.unlocked
			end

			if slot0.showIdx ~= slot1.showIdx then
				return slot1.showIdx < slot0.showIdx
			end

			return slot0.id < slot1.id
		end)

		if slot8 then
			uv10 = "selectSkill"

			slot10.selectSkill:set(slot5[1].id)
		end

		uv10 = "selectSkill"

		slot10.skillDatas:update(slot5)
	end)
	slot0.selectSkill:addListener(function (slot0, slot1)
		slot2 = nil
		uv3 = "skillDatas"

		for slot6, slot7 in slot3.skillDatas:ipairs() do
			if slot7:proxy().id == slot1 then
				slot8.selectSign = false
			end

			if slot8.id == slot0 then
				slot8.selectSign = true
				slot2 = slot8
			end
		end

		uv3 = "skillDatas"
		slot3 = slot3.skillDatas
		slot3 = slot3.notify

		slot3(slot3)

		uv3 = "skillDatas"

		slot3:setSkillInfo(slot2)
	end)
	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0)
	slot0.figure = gGameModel.role:getIdler("figure")
	slot0.figures = gGameModel.role:getIdler("figures")
	slot0.skillFigure = gGameModel.role:getIdler("skill_figures")
end

function slot0.setSkillInfo(slot0, slot1)
	slot3 = csv.skill[slot1.skillIdx]
	slot4 = gRoleFigureCsv[slot1.id].name
	slot5 = nil
	uv7 = "gRoleFigureCsv"

	slot0.skillName:text(slot3.skillName)
	beauty.textScroll({
		isRich = true,
		list = slot0.descList,
		strs = "#C0x5B545B#" .. dataEasy.getSkillDesc(slot3)
	})
	beauty.textScroll({
		isRich = true,
		align = "center",
		list = slot0.conditionList,
		strs = "#C0x5B545B#" .. ((slot1.unlocked ~= slot7.UNLOCKED or string.format(gLanguageCsv.skillUseTip, slot4)) and string.format(gLanguageCsv.skillActiveTip, slot4))
	})
	slot0.skillPanel:get("icon"):texture(slot3.iconRes)

	slot7 = slot0.btnSave
	slot8 = slot7
	slot7 = slot7.visible

	if not slot1.isUse then
		uv10 = "gRoleFigureCsv"

		if slot1.unlocked ~= slot10.UNLOCKED then
			slot9 = false
		else
			slot9 = true
		end
	end

	slot7(slot8, slot9)
	slot0.btnRemove:visible(slot1.inUse)
	slot0.conditionRemove:visible(false)
end

function slot0.onSaveClick(slot0)
	gGameApp:requestServer("/game/role/figure/skill/switch", function (slot0)
		if slot0 then
			uv1 = "curfigureId"
			uv3 = "set"

			slot1.curfigureId:set(slot3)
		end

		uv1 = "curfigureId"

		slot1:onClose()
	end, slot0.selectFigureId, slot0.selectSkill:read(), slot0.num - 1)
end

function slot0.onRemoveClick(slot0)
	gGameApp:requestServer("/game/role/figure/skill/switch", function (slot0)
		if slot0 then
			uv1 = "curfigureId"

			slot1.curfigureId:set(-1)
		end

		uv1 = "curfigureId"

		slot1:onClose()
	end, slot0.selectFigureId, -1, slot0.num - 1)
end

function slot0.onClickCell(slot0, slot1, slot2, slot3)
	slot0.selectSkill:set(slot3.id)
end

return slot0
