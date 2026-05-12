slot0 = class("FishingLevelView", Dialog)
slot0.RESOURCE_FILENAME = "fishing_level.json"
slot0.RESOURCE_BINDING = {
	["right.now.attr.name"] = "attrName",
	["left.item"] = "leftItem",
	["right.now.fish.name"] = "fishName",
	["left.level"] = "level",
	["left.level1"] = "level1",
	["right.now.attr.subList"] = "subList",
	["right.now.fish.item"] = "fishItem",
	["right.now.attr.item"] = "attrItem",
	["left.nextLevel"] = "nextLevel",
	["right.now.text"] = "panelText",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["left.list"] = {
		varname = "leftList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("listDatas"),
				item = bindHelper.self("leftItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("name", "num", "bar")

					slot4.name:text(slot3.name)
					slot4.num:text(slot3.num .. "/" .. slot3.maxNum)
					slot4.bar:percent(cc.clampf(100 * slot3.num / slot3.maxNum, 0, 100))
				end
			}
		}
	},
	["right.now.fish.list"] = {
		varname = "fishList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("fishDatas"),
				item = bindHelper.self("fishItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("txt1", "num1").txt1:text(slot3.name)

					if slot2 == 1 then
						slot4.num1:text("-" .. slot3.num * 100 .. "%")
					elseif slot2 == 3 then
						slot4.num1:text("+" .. slot3.num * 100 .. "%")
					else
						slot4.num1:text("+" .. slot3.num * 100 .. "%")
					end

					adapt.oneLinePos(slot4.txt1, slot4.num1, cc.p(15, 0), "left")

					if not slot3.isLock then
						text.addEffect(slot4.txt1, {
							color = cc.c4b(183, 176, 158, 255)
						})
						text.addEffect(slot4.num1, {
							color = cc.c4b(183, 176, 158, 255)
						})
					end
				end
			}
		}
	},
	["right.now.attr.list"] = {
		varname = "attrList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("attrItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("txt1", "num1")

					slot4.txt1:text(slot3.name .. ":")
					slot4.num1:text(slot3.num)
					adapt.oneLinePos(slot4.txt1, slot4.num1, cc.p(20, 0), "left")

					if not slot3.isLock then
						text.addEffect(slot4.txt1, {
							color = cc.c4b(183, 176, 158, 255)
						})
						text.addEffect(slot4.num1, {
							color = cc.c4b(183, 176, 158, 255)
						})
					end
				end
			}
		}
	},
	["right.btnUp"] = {
		varname = "btnUp",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnUp")
			}
		}
	},
	["right.btnNext"] = {
		varname = "btnNext",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnNext")
			}
		}
	}
}

function slot0.onCreate(slot0)
	slot0:initModel()

	slot0.fishDatas = idlers.new({})
	slot0.attrDatas = idlers.new({})
	slot0.listDatas = idlers.new({})
	slot0.clientLevel = idler.new(1)
	slot1 = {
		"lowNum",
		"middleNum",
		"highNum",
		"totalNum",
		"targetNum"
	}

	idlereasy.any({
		slot0.fishLevel,
		slot0.fishCounter,
		slot0.targetCounter
	}, function (slot0, slot1, slot2, slot3)
		slot4 = csv.fishing.level[slot1]
		slot5 = {}
		slot6 = 0
		slot7 = 0
		slot8 = 0
		slot9 = 0
		slot10 = 0
		slot11 = 0

		if slot2 ~= nil then
			if slot2[1] ~= nil then
				slot6 = slot2[1] < slot4.lowNum and slot2[1] or slot4.lowNum
				slot9 = slot2[1]
			end

			if slot2[2] ~= nil then
				slot7 = slot2[2] < slot4.middleNum and slot2[2] or slot4.middleNum
				slot10 = slot2[2]
			end

			if slot2[3] ~= nil then
				slot8 = slot2[3] < slot4.highNum and slot2[3] or slot4.highNum
				slot11 = slot2[3]
			end
		end

		slot12 = {
			gLanguageCsv.lowFishNum,
			gLanguageCsv.middleFishNum,
			gLanguageCsv.highFishNum,
			gLanguageCsv.totalFishNum,
			""
		}

		if slot4.totalNum < slot9 + slot10 + slot11 then
			slot13 = slot4.totalNum
		end

		uv16 = "csv"

		for slot18, slot19 in ipairs(slot16) do
			if slot18 < 5 and slot4[slot19] ~= 0 then
				table.insert(slot5, {
					name = slot12[slot18],
					num = ({
						slot6,
						slot7,
						slot8,
						slot13,
						slot3
					})[slot18],
					maxNum = slot4[slot19]
				})
			end

			if slot18 == 5 and not itertools.isempty(slot4[slot19]) then
				slot20, slot21 = csvNext(slot4[slot19])

				if slot20 ~= nil then
					table.insert(slot5, {
						name = string.format(gLanguageCsv.targetFishNum, slot21, csv.fishing.fish[slot20].name),
						num = slot14[slot18],
						maxNum = slot21
					})
				end
			end
		end

		uv15 = "fishing"
		slot15 = slot15.listDatas
		slot15 = slot15.update

		slot15(slot15, slot5)

		uv15 = "fishing"
		slot15 = slot15.clientLevel
		slot15 = slot15.set

		slot15(slot15, slot1)

		uv15 = "fishing"
		slot15 = slot15.level1
		slot16 = slot15
		slot17 = slot1

		slot15.text(slot16, slot17)

		uv16 = "fishing"
		uv17 = "fishing"

		adapt.oneLinePos(slot16.level, slot17.level1, cc.p(5, 0), "left")

		slot16 = gLanguageCsv.completeLvUp
		uv16 = "fishing"

		slot16.nextLevel:text(slot1 == table.length(csv.fishing.level) and gLanguageCsv.lvIsMax or string.format(slot16, slot1 + 1))
	end)
	idlereasy.any({
		slot0.clientLevel,
		slot0.fishLevel
	}, function (slot0, slot1, slot2)
		uv3 = "setRightPanel"

		slot3:setRightPanel(slot1, slot2)
	end)
	Dialog.onCreate(slot0)
end

function slot0.setRightPanel(slot0, slot1, slot2)
	slot0.fishDatas:update({
		{
			name = gLanguageCsv.timeDown,
			num = csv.fishing.level[slot1].timeDown,
			isLock = slot1 <= slot0.fishLevel:read()
		},
		{
			name = gLanguageCsv.fasterSpeed,
			num = slot3.fasterSpeed,
			isLock = slot1 <= slot0.fishLevel:read()
		},
		{
			name = gLanguageCsv.extraProbability,
			num = slot3.extraProbability,
			isLock = slot1 <= slot0.fishLevel:read()
		}
	})

	slot5 = {}

	for slot9 = 1, 99 do
		if slot3["attrNum" .. slot9] and slot3["attrNum" .. slot9] ~= 0 then
			slot10 = slot3["attrNum" .. slot9]

			table.insert(slot5, {
				name = getLanguageAttr(slot3["attrType" .. slot9]),
				num = (slot3["attrType" .. slot9] == 22 or slot3["attrType" .. slot9] == 23) and "+" .. slot10 / 10000 * 100 .. "%" or "+" .. slot10,
				isLock = slot1 <= slot0.fishLevel:read()
			})
		end
	end

	slot0.attrDatas:update(slot5)
	slot0.panelText:text(slot1 ~= slot2 and string.format(gLanguageCsv.otherLevelBonuses, slot1) or gLanguageCsv.nowLevelBonuses)

	slot7 = cc.c4b(183, 176, 158, 255)
	slot8 = cc.c4b(91, 84, 91, 255)

	text.addEffect(slot0.panelText, {
		color = slot0.fishLevel:read() < slot1 and slot7 or slot8
	})
	text.addEffect(slot0.attrName, {
		color = slot0.fishLevel:read() < slot1 and slot7 or slot8
	})
	text.addEffect(slot0.fishName, {
		color = slot0.fishLevel:read() < slot1 and slot7 or slot8
	})
	slot0.btnNext:setTouchEnabled(slot1 < table.length(csv.fishing.level))
	cache.setShader(slot0.btnNext, false, slot1 < table.length(csv.fishing.level) and "normal" or "hsl_gray")
	slot0.btnUp:setTouchEnabled(slot1 ~= 1)
	cache.setShader(slot0.btnUp, false, slot1 ~= 1 and "normal" or "hsl_gray")
end

function slot0.onBtnUp(slot0)
	slot0.clientLevel:set(math.max(slot0.clientLevel:read() - 1, 1))
end

function slot0.onBtnNext(slot0)
	slot0.clientLevel:set(math.min(slot0.clientLevel:read() + 1, table.length(csv.fishing.level)))
end

function slot0.initModel(slot0)
	slot0.fishLevel = gGameModel.fishing:getIdler("level")
	slot0.fishCounter = gGameModel.fishing:getIdler("fish_counter")
	slot0.targetCounter = gGameModel.fishing:getIdler("target_counter")
end

return slot0
