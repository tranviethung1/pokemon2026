slot1 = class("ArmDetailView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.develop.arm.tools")
slot1.RESOURCE_FILENAME = "arm_detail.json"
slot1.RESOURCE_BINDING = {
	spineNode = "spineNode",
	["descPanel.unlockItem"] = "unlockItem",
	["descPanel.title1"] = "title1",
	descPanel = "descPanel",
	["descPanel.item"] = "descItem",
	["downPanel.spriteItem"] = "spriteItem",
	downPanel = "downPanel",
	btnLeftPage = {
		varname = "btnLeftPage",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onLeftPageClick")
			}
		}
	},
	["btnLeftPage.pageName"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(100, 100, 100, 255)
				}
			}
		}
	},
	btnRightPage = {
		varname = "btnRightPage",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRightPageClick")
			}
		}
	},
	["btnRightPage.pageName"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(100, 100, 100, 255)
				}
			}
		}
	},
	btnActiveBrowse = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBrowseClick")
			}
		}
	},
	["btnActiveBrowse.name"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	btnOneKey = {
		varname = "btnOneKey",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOneKeyClick")
			}
		}
	},
	["btnOneKey.name"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["descPanel.descList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 5,
				data = bindHelper.self("descData"),
				item = bindHelper.self("descItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("img", "textStage", "list")

					slot4.img:texture(slot3.cfg.stage <= slot3.armStage and "city/arms/main/img_reach.png" or "city/arms/main/img_not_reach.png")
					slot4.textStage:text(string.format(gLanguageCsv.armStageTitle, slot5.stage))

					slot7 = ""

					if slot5.skillID > 0 then
						slot7 = eval.doMixedFormula(dataEasy.getSkillDesc(csv.skill[slot5.skillID]), {
							skillLevel = 1,
							math = math
						})
					elseif csvSize(slot5.attrMap) > 0 then
						slot7 = string.format(gLanguageCsv.armStageDesc, gLanguageCsv[game.NATURE_TABLE[slot3.armID]], dataEasy.getAttrStr(slot5.attrMap))
					end

					uv8 = "multiget"

					if slot5.stage == slot8.getFirstSkillStage(slot3.armID) then
						slot7 = slot7 .. string.format(gLanguageCsv.armSkillTip, gLanguageCsv[game.NATURE_TABLE[slot3.armID]])
					end

					slot4.list:height(0)

					slot9, slot10 = beauty.textScroll({
						fontSize = 40,
						isRich = true,
						list = slot4.list,
						strs = "#C0x5b545b#" .. dataEasy.deleteStrFormat(slot7, "#([F][^#]+)#") .. " "
					})

					slot9:setTouchEnabled(false)
					slot9:height(slot10)
					slot9:y(slot1:height() - slot10 - 10)
					slot9:refreshView()
					slot1:anchorPoint(0.5, 1)
					setContentSizeOfAnchor(slot1, cc.size(slot1:width(), slot10 + 10))
				end
			}
		}
	},
	["descPanel.unlockList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 2,
				data = bindHelper.self("unlockData"),
				item = bindHelper.self("unlockItem"),
				armID = bindHelper.self("armID"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("imgPoint", "desc", "textNum")

					slot4.desc:text(string.format(gLanguageCsv.armStageUnlockDesc, gLanguageCsv[game.NATURE_TABLE[slot0.armID:read()]], slot3.needStar, gLanguageTxtRarity[slot3.needRarity]))
					adapt.setTextScaleWithWidth(slot4.desc, nil, 920)

					slot7 = slot4.desc:box().width
					slot9 = uiEasy.createTexParameters("city/arms/main/point.png", cc.rect(0, 0, 1000 - slot7 - 40, 0), {
						autoHeight = true
					})

					slot9:addTo(slot1, 100)
					slot9:anchorPoint(0, 0.5)
					slot9:xy(slot4.desc:x() + slot7 + 20, slot4.desc:y())
					slot4.textNum:text(string.format("%s/%s", slot3.hasNum, slot3.needNum)):setTextColor(slot3.hasNum < slot3.needNum and cc.c3b(241, 59, 84) or cc.c3b(0, 194, 32))
				end
			}
		}
	},
	["downPanel.spriteList"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("cardData"),
				item = bindHelper.self("spriteItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.unitID ~= -1 then
						bind.extend(slot0, slot1:multiget("spriteNode", "bg", "add").spriteNode, {
							class = "card_icon",
							props = {
								unitId = slot3.unitID,
								advance = slot3.advance,
								rarity = slot3.rarity,
								star = slot3.star,
								dbid = slot3.dbid,
								levelProps = {
									data = slot3.level
								},
								onNode = function (slot0)
								end
							}
						})
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "ARM",
		title = gLanguageCsv.arm
	})

	slot0.armID = idler.new(slot1.cfg.natureType)
	slot0.cardData = idlers.new()
	slot0.descData = idlers.new()
	slot0.unlockData = idlers.new()

	slot0:initModel()
	idlereasy.any({
		slot0.armMarkIDs,
		slot0.armStage,
		slot0.armID
	}, function ()
		uv0 = "updateData"

		slot0:updateData()
	end)
end

function slot1.initModel(slot0)
	slot0.armMarkIDs = gGameModel.role:getIdler("arms")
	slot0.armStage = gGameModel.role:getIdler("arms_stage")
end

function slot1.updateData(slot0)
	uv4 = "armID"

	slot0.spineNode:removeAllChildren()

	slot6 = widget.addAnimation(slot0.spineNode, (csv.arms.arms[slot0.armID:read()] or {}).spine, string.format(slot4.getFirstSkillStage(slot1) <= (gGameModel.role:read("arms_stage")[slot1] or 0) and "effect2_%s_loop" or "effect_%s_loop", slot1), 1):scale(1):xy(slot0.spineNode:size().width / 2, 10)

	slot0.btnLeftPage:hide()
	slot0.btnRightPage:hide()
	slot0.descPanel:get("title"):setString(string.format(gLanguageCsv.armNameTitle, gLanguageCsv[game.NATURE_TABLE[slot1]]))

	slot8 = {}

	for slot12, slot13 in ipairs(gArmStage[slot1]) do
		table.insert(slot8, {
			armID = slot1,
			armStage = slot3,
			cfg = slot13
		})
	end

	slot9 = slot0.descData
	slot9 = slot9.update

	slot9(slot9, slot8)

	uv9 = "armID"

	slot0.unlockData:update(slot9.getNextStageUnlockData(slot1))

	slot10 = slot0.descPanel:get("unlockStage")
	slot10 = slot10.text
	uv16 = "armID"

	slot10(slot10, string.format(gLanguageCsv.armUnlockStageTip, math.min(slot3 + 1, slot16.getArmMaxStage(slot1))))

	uv10 = "armID"

	if slot3 == slot10.getArmMaxStage(slot1) then
		slot0.title1:text(gLanguageCsv.armUnlockTip)
	else
		slot0.title1:text(gLanguageCsv.armNextStageUnlockTitle)
	end

	slot10 = adapt.oneLinePos

	slot10(slot0.title1, slot0.descPanel:get("unlockStage"), cc.p(5, 0))

	uv10 = "armID"
	slot10, slot11 = slot10.getArmAllCards(slot1)
	slot12 = {}

	for slot16, slot17 in pairs(slot0.armMarkIDs:read()[slot1] or {}) do
		if slot11[slot17] then
			table.insert(slot12, slot11[slot17])
		end
	end

	slot13 = table.sort
	uv15 = "armID"

	slot13(slot12, slot15.sortCmp)

	uv13 = "armID"

	for slot17 = itertools.size(slot12) + 1, slot13.getArmMaxCardNum(slot1) do
		table.insert(slot12, {
			unitID = -1
		})
	end

	slot0.cardData:update(slot12)
end

function slot1.onLeftPageClick(slot0)
	slot0.armID:set(slot0.armID:read() - 1)
end

function slot1.onRightPageClick(slot0)
	slot0.armID:set(slot0.armID:read() + 1)
end

function slot1.onBrowseClick(slot0)
	gGameUI:stackUI("city.develop.arm.browse", nil, , slot0.armID:read())
end

function slot1.onOneKeyClick(slot0)
	slot1 = slot0.armID
	slot2 = slot1
	uv2 = "armID"
	uv3 = "armID"

	for slot7 = slot2.getArmMaxStage(slot1.read(slot2).getArmAllCards(slot0.armID:read())), 1, -1 do
		slot8 = {}

		for slot12, slot13 in csvPairs(gArmStage[slot1][slot7].activeCondition) do
			slot14 = slot13[1]

			for slot20, slot21 in pairs(slot3) do
				uv22 = "armID"
				slot22 = slot22.getSpriteArm(slot21.markID)

				if slot14 > 0 then
					if (not slot22 or slot22 == slot1) and slot13[2] <= slot21.star and slot21.rarity == slot13[3] and not slot8[slot21.markID] then
						slot8[slot21.markID] = true
						slot14 = slot14 - 1
					end
				else
					break
				end
			end
		end

		slot10 = slot8
		uv10 = "armID"

		if slot10.getArmMaxCardNum(slot1, slot7) <= itertools.size(slot10) then
			gGameApp:requestServer("/game/role/arms/cards/place", function (slot0)
				gGameUI:showTip(gLanguageCsv.armOneKeyTip)
			end, slot1, itertools.keys(slot8))

			return
		end
	end

	gGameUI:showTip(gLanguageCsv.armOneKeyDefaultTip)
end

function slot1.onItemClick(slot0, slot1, slot2)
	gGameUI:stackUI("city.develop.arm.card_select", nil, {
		clickClose = true
	}, slot0.armID:read())
end

return slot1
