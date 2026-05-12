function slot0(slot0)
	slot2 = slot0:size()

	if not slot0:get("effect") then
		slot1 = widget.addAnimationByKey(slot0, "effect/shengjitiao.skel", "effect", "effect", 10):xy(slot2.width / 2 + 0, slot2.height / 2 + 0):scale(1)
	else
		slot1:play("effect")
	end
end

slot1 = class("CardAttributeView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "card_attribute.json"
slot1.RESOURCE_BINDING = {
	["center.levelupPanel.textExp"] = "textExp",
	trammelItem = "fetterItem",
	["center.levelupPanel.textNum"] = "textNum",
	["center.medLvUp.textNote"] = "medLvUpTextNote",
	["center.levelupPanel"] = "levelupPanel",
	["center.top.textEnergy"] = "townEnergyTxt",
	medItem = "medItem",
	["center.top"] = "topPanel",
	innerList = "fetterSubList",
	attrItem = "attrItem",
	["center.top.textTypeNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("raceTxt")
		}
	},
	["center.top.btnInfo"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onCharacterClick")
			}
		}
	},
	["center.top.btnEnergyInfo"] = {
		varname = "btnEnergyInfo",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onTownEnergyClick")
			}
		}
	},
	["center.top.btnAttrInfo"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShowAtrtInfo")
			}
		}
	},
	["center.top.btnChooseAttr"] = {
		varname = "btnChooseAttr"
	},
	["center.top.btnShare"] = {
		varname = "btnShare",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShareCard")
			}
		}
	},
	["center.top.btnComment"] = {
		varname = "btnComment",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnComment")
			}
		}
	},
	["center.top.btnComment.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["center.top.attrList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("attrItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("imgIcon"):texture(ui.ATTR_ICON[slot3[1]])
					slot1:get("bg"):hide()
				end
			}
		}
	},
	["center.top.textSexVal"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("gender"),
			method = function (slot0)
				return getLanguageGender(slot0)
			end
		}
	},
	["center.top.textNature"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("currSelect"),
			method = function (slot0)
				return csv.character[slot0].name
			end
		}
	},
	["center.levelupPanel.textLv"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("clientLv"),
			method = function (slot0)
				return gLanguageCsv.textLv .. slot0
			end
		}
	},
	["center.center.btnInfo"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAttrDetail")
			}
		}
	},
	["center.down"] = {
		binds = {
			event = "visible",
			idler = bindHelper.self("trammelsPanel")
		}
	},
	["center.medLvUp"] = {
		binds = {
			event = "visible",
			idler = bindHelper.self("gradePanel")
		}
	},
	["center.levelupPanel.progressBar"] = {
		varname = "progressBar"
	},
	["center.levelupPanel.btnOneKeyLvUp"] = {
		varname = "btnOneKeyLvUp",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onUpGradePanelClick")
			}
		}
	},
	["center.levelupPanel.btnLvUp"] = {
		varname = "btnLvUp",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShowGradeClick")
			}
		}
	},
	["center.center.textLifeNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("hpVal")
		}
	},
	["center.center.textSpeedVal"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("speedVal")
		}
	},
	["center.center.textAttackNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("damageVal")
		}
	},
	["center.center.textDefNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("defenceVal")
		}
	},
	["center.center.textSpeAttackNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("specialDamageVal")
		}
	},
	["center.center.textSpeDefNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("specialDefenceVal")
		}
	},
	["center.medLvUp.list"] = {
		varname = "gradelist",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("itemData"),
				item = bindHelper.self("medItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:name("item" .. slot2)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							data = slot3,
							grayState = slot3.num <= 0 and 1 or 0,
							onNode = function (slot0)
								slot0:scale(0.7)
								slot0:setTouchEnabled(false)
							end
						}
					})

					slot1.num = slot3.num

					function slot1.resetState()
						uv0 = "get"
						slot3 = "num"
						slot1 = slot0:get("_icon_"):get(slot3)
						slot1 = slot1.text
						uv3 = "get"

						slot1(slot1, slot3.num)

						uv1 = "get"
						slot2 = slot1
						slot1 = slot1.get(slot2, "btnAdd")
						uv2 = "get"
						slot5 = false

						slot2:get("imgMask"):hide(slot5)

						slot3 = slot1.visible
						uv5 = "get"

						slot3(slot1, slot5.num <= 0)

						uv3 = "get"
						slot3 = slot3.num <= 0 and cc.c3b(128, 128, 128) or cc.c3b(255, 255, 255)

						slot0:get("box"):color(slot3)
						slot0:get("icon"):color(slot3)
					end

					slot1.resetState()
					slot1:get("textAddVal"):text(slot3.cfg.specialArgsMap.exp)
					slot1:onTouch(functools.partial(slot0.itemClick, slot1, slot2, slot3))
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	["center.down.list"] = {
		varname = "fetterList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 3,
				asyncPreload = 6,
				data = bindHelper.self("fetterData"),
				item = bindHelper.self("fetterSubList"),
				cell = bindHelper.self("fetterItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("textNote"):text(csv.fetter[slot3.id].name)

					if slot3.isShow then
						text.addEffect(slot1:get("textNote"), {
							color = ui.COLORS.NORMAL.DEFAULT
						})
					else
						text.addEffect(slot1:get("textNote"), {
							color = ui.COLORS.NORMAL.GRAY
						})
					end
				end
			}
		}
	},
	["center.down.btnInfo"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("showFetterClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.selectDbId = slot1()
	slot0.costData = {}

	slot0:initModel()
	slot0:enableSchedule()

	slot8 = 80

	adapt.setTextAdaptWithSize(slot0.medLvUpTextNote, {
		margin = -8,
		vertical = "center",
		horizontal = "center",
		size = cc.size(835, slot8)
	})
	slot0.medLvUpTextNote:y(slot0.medLvUpTextNote:y() + 5)
	idlereasy.any({
		gGameModel.role:getIdler("level"),
		gGameModel.role:getIdler("vip_level")
	}, function ()
		uv0 = "btnShare"

		slot0.btnShare:visible(dataEasy.isChatOpen(gUnlockCsv.cardShare, true))
	end)
	dataEasy.getListenUnlock(gUnlockCsv.cardComment, function (slot0)
		uv1 = "btnComment"

		slot1.btnComment:visible(slot0)
	end)
	dataEasy.getListenUnlock(gUnlockCsv.town, function (slot0)
		uv2 = "nodetools"

		nodetools.invoke(slot2.topPanel, {
			"textEnergyNote",
			"textEnergy",
			"btnEnergyInfo"
		}, "visible", slot0)
	end)

	slot0.clientCurLvExp = idler.new(slot0.levelExp:read())
	slot0.clientLv = idler.new(slot0.cardLevel:read())
	slot0.clickLevelUpdata = idler.new(false)

	idlereasy.when(slot0.cardLevel, function (slot0, slot1)
		uv2 = "clientLv"

		slot2.clientLv:set(slot1)
	end, true)
	idlereasy.when(slot0.levelExp, function (slot0, slot1)
		uv2 = "clientCurLvExp"

		slot2.clientCurLvExp:set(slot1)
	end, true)

	slot0.showSuccessTip = false
	slot3 = table.length(gRoleLevelCsv)

	idlereasy.any({
		slot0.clientLv,
		slot0.clientCurLvExp
	}, function (slot0, slot1, slot2)
		uv3 = "showSuccessTip"

		if slot3.showSuccessTip then
			uv3 = "progressBar"

			slot3(false, true)

			uv3 = "showSuccessTip"
			slot3.showSuccessTip = false
			uv3 = "showSuccessTip"
			slot3 = slot3.progressBar
			slot4 = slot3
			slot3 = slot3.setPercent

			slot3(slot4, 0)

			uv3 = "setPercent"
			uv4 = "showSuccessTip"

			slot3(slot4.progressBar)
		end

		uv4 = "showSuccessTip"
		slot4 = slot4.cardId
		slot5 = slot4
		uv5 = "showSuccessTip"
		slot8 = csv.cards[slot4.read(slot5)].levelExpID
		slot6 = csv.base_attribute.card_level[slot1]["levelExp" .. slot8]
		slot5.clientNextLvExp = slot6
		uv5 = "showSuccessTip"
		uv6 = "showSuccessTip"
		slot6 = slot6.clientNextLvExp - slot2
		slot5.clientMaxLvNeedExp = slot6
		uv6 = "showSuccessTip"

		for slot8 = slot1 + 1, slot6.roleLv:read() do
			uv9 = "showSuccessTip"
			uv10 = "showSuccessTip"
			slot9.clientMaxLvNeedExp = slot10.clientMaxLvNeedExp + slot4[slot8]["levelExp" .. slot3.levelExpID]
		end

		uv5 = "showSuccessTip"
		slot5 = slot5.textExp
		slot6 = slot5
		uv9 = "showSuccessTip"

		slot5.text(slot6, slot2 .. "/" .. slot9.clientNextLvExp)

		uv6 = "showSuccessTip"
		slot6 = slot2 / slot6.clientNextLvExp * 100
		slot5 = cc.clampf(slot6, 0, 100)
		uv6 = "showSuccessTip"
		slot6 = slot6.roleLv
		slot7 = slot6
		uv7 = "csv"

		if slot6.read(slot7) == slot7 then
			uv6 = "csv"

			if slot1 == slot6 then
				slot5 = 100
				uv6 = "csv"
				slot7 = "levelExp" .. slot3.levelExpID
				slot6 = slot4[slot6 - 1][slot7]
				uv7 = "showSuccessTip"

				slot7.textExp:text(slot6 .. "/" .. slot6)
			end
		end

		uv6 = "showSuccessTip"

		if slot5 >= slot6.progressBar:getPercent() then
			uv6 = "showSuccessTip"

			if slot6.selectDbIdChange then
				uv6 = "showSuccessTip"

				slot6.progressBar:setPercent(slot5)
			else
				uv7 = "showSuccessTip"
				uv8 = "showSuccessTip"

				transition.executeSequence(slot7.progressBar):progressTo(slot8.lvTouchTimes - 0.01, slot5):done()
			end
		end

		uv6 = "showSuccessTip"

		slot6.clickLevelUpdata:set(true, true)
	end)

	slot0.raceTxt = idler.new()
	slot0.hpVal = idler.new(0)
	slot0.speedVal = idler.new(0)
	slot0.damageVal = idler.new(0)
	slot0.defenceVal = idler.new(0)
	slot0.specialDamageVal = idler.new(0)
	slot0.specialDefenceVal = idler.new(0)

	idlereasy.when(slot0.attrs, function (slot0, slot1)
		for slot5, slot6 in ipairs(game.ATTRDEF_SIMPLE_TABLE) do
			uv7 = "ipairs"

			slot7[slot6 .. "Val"]:set(math.floor(slot1[slot6]))
		end
	end)

	slot4 = {}

	for slot8, slot9 in ipairs(gCardExpItemCsv) do
		table.insert(slot4, {
			num = idler.new(0),
			key = slot9.id,
			y = y,
			cfg = slot9
		})
	end

	slot0.itemData = idlers.newWithMap(slot4)
	slot0.showOneKeyUpgrade = false

	idlereasy.any({
		slot0.items,
		slot0.clickLevelUpdata
	}, function (slot0, slot1)
		uv3 = "levelExp"
		slot3 = slot3.levelExp:read()

		for slot7, slot8 in ipairs(gCardExpItemCsv) do
			uv10 = "levelExp"
			uv14 = "levelExp"
			slot10.itemData:atproxy(slot7).num = math.max(0, (slot1[slot8.id] or 0) - (slot14.costData[slot8.id] or 0))
			slot2 = 0 + slot8.specialArgsMap.exp * (slot1[slot8.id] or 0)
		end

		uv4 = "levelExp"
		uv6 = "levelExp"
		slot4.showOneKeyUpgrade = slot6.clientNextLvExp <= slot2 + slot3
	end)

	slot0.fetterData = idlertable.new({})
	slot0.attrDatas = idlers.newWithMap({})

	idlereasy.any({
		slot0.cardDatas,
		slot0.fetters,
		slot0.cardId
	}, function (slot0, slot1, slot2, slot3)
		slot4 = csv.cards[slot3]
		uv5 = "csv"

		slot5.raceTxt:set(slot4.specValue[csvSize(slot4.specValue)])

		slot5 = {}
		slot6 = {}
		slot7 = {}

		for slot11, slot12 in ipairs(slot1) do
			if gGameModel.cards:find(slot12) then
				if not slot7[csv.cards[slot13:read("card_id")].cardMarkID] then
					slot7[slot15] = slot14
				elseif slot7[slot15] < slot14 then
					slot7[slot15] = slot14
				end
			end
		end

		for slot13 = 1, csvSize(slot4.fetterList) do
			slot5[slot13] = {
				id = slot14,
				cardDatas = slot7,
				isShow = itertools.map(itertools.ivalues(slot2), function (slot0, slot1)
					return slot1, slot0
				end)[slot4.fetterList[slot13]] ~= nil
			}
		end

		uv10 = "csv"

		slot10.fetterData:set(slot5)

		slot11 = csv.unit[slot4.unitID]
		slot12 = table.insert

		slot12({}, {
			slot11.natureType,
			true
		})

		uv12 = "csv"

		slot12.btnChooseAttr:hide()

		if slot11.natureType2 then
			table.insert(slot10, {
				slot11.natureType2,
				true
			})
		end

		uv12 = "csv"

		slot12.attrDatas:update(slot10)
	end)

	slot0.trammelsPanel = idler.new(false)
	slot0.gradePanel = idler.new(false)
	slot0.showGradePanel = idler.new(true)

	idlereasy.when(slot0.showGradePanel, function (slot0, slot1)
		uv2 = "trammelsPanel"
		slot2 = slot2.trammelsPanel
		slot2 = slot2.set

		slot2(slot2, slot1)

		uv2 = "trammelsPanel"

		slot2.gradePanel:set(not slot1)

		slot2 = "city/card/system/attribute/btn_upgrade.png"

		if not slot1 then
			slot2 = "common/btn/btn_cancel.png"
		end

		uv3 = "trammelsPanel"

		slot3.btnLvUp:loadTextureNormal(slot2)
	end)
	dataEasy.getListenUnlock(gUnlockCsv.onekeyLevelup, function (slot0)
		if not slot0 then
			uv1 = "btnOneKeyLvUp"
			slot1 = slot1.btnOneKeyLvUp
			slot1 = slot1.hide

			slot1(slot1)

			uv1 = "btnOneKeyLvUp"
			slot1 = slot1.btnOneKeyLvUp
			slot2 = slot1
			uv2 = "btnOneKeyLvUp"
			slot2 = slot2.btnOneKeyLvUp:size().width / 2
			uv2 = "btnOneKeyLvUp"
			slot2 = slot2.btnLvUp:size().width / 2
			uv2 = "btnOneKeyLvUp"

			slot2.btnLvUp:x(slot1.x(slot2) + slot2 - slot2)
		end
	end)
	slot0.textNum:hide()
end

function slot1.initModel(slot0)
	idlereasy.when(slot0.selectDbId, function (slot0, slot1)
		uv2 = "selectDbIdChange"
		slot2.selectDbIdChange = true
		slot2 = gGameModel.cards
		slot3 = slot2
		slot2 = slot2.find(slot3, slot1)
		uv3 = "selectDbIdChange"
		slot6 = slot2
		uv6 = "selectDbIdChange"
		slot3.gender = idlereasy.assign(slot2.getIdler(slot6, "gender"), slot6.gender)
		uv3 = "selectDbIdChange"
		slot6 = slot2
		uv6 = "selectDbIdChange"
		slot3.cardId = idlereasy.assign(slot2.getIdler(slot6, "card_id"), slot6.cardId)
		uv3 = "selectDbIdChange"
		slot6 = slot2
		uv6 = "selectDbIdChange"
		slot3.cardLevel = idlereasy.assign(slot2.getIdler(slot6, "level"), slot6.cardLevel)
		uv3 = "selectDbIdChange"
		slot6 = slot2
		uv6 = "selectDbIdChange"
		slot3.attrs = idlereasy.assign(slot2.getIdler(slot6, "attrs"), slot6.attrs)
		uv3 = "selectDbIdChange"
		slot6 = slot2
		uv6 = "selectDbIdChange"
		slot3.fetters = idlereasy.assign(slot2.getIdler(slot6, "fetters"), slot6.fetters)
		uv3 = "selectDbIdChange"
		slot6 = slot2
		uv6 = "selectDbIdChange"
		slot3.currSelect = idlereasy.assign(slot2.getIdler(slot6, "character"), slot6.currSelect)
		uv3 = "selectDbIdChange"
		slot6 = slot2
		uv6 = "selectDbIdChange"
		slot3.levelExp = idlereasy.assign(slot2.getIdler(slot6, "level_exp"), slot6.levelExp)

		if dataEasy.isUnlock(gUnlockCsv.town) then
			uv3 = "selectDbIdChange"

			slot3:updateTownEnergy(slot1)
		end
	end)

	slot0.cardDatas = gGameModel.role:getIdler("cards")
	slot0.items = gGameModel.role:getIdler("items")
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.roleLv = gGameModel.role:getIdler("level")
	slot0.shareTimes = gGameModel.daily_record:getIdler("card_share_times")
end

function slot1.onCharacterClick(slot0)
	gGameUI:stackUI("city.card.character", nil, , slot0.cardId:read(), slot0.currSelect:read())
end

function slot1.updateTownEnergy(slot0, slot1)
	slot3 = gGameModel.cards:find(slot1):read("card_id", "level", "star", "advance", "name")
	slot4 = nil
	slot6, slot7 = townDataEasy.getSkillCfg(csv.cards[slot3.card_id].townSkill, slot3.advance, slot3.star)
	slot8 = ""

	if slot7 == 0 then
		slot8 = gLanguageCsv.none
	elseif not slot6 then
		slot8 = gLanguageCsv.notUnlock
	else
		if gGameModel.town then
			slot9 = gGameModel.town:read("cards")[slot1] or {}
			slot4 = slot9.energy

			if slot9.energy_refresh_time then
				slot4 = slot9.energy + math.max(math.floor((time.getTime() - slot9.energy_refresh_time) / 3600 * gCommonConfigCsv.townHomeEnergyRecovery), 0)
			end
		end

		slot10 = gTwonEnergyCsv[csv.unit[slot5.unitID].rarity]
		slot11 = math.floor(slot5.energy + (slot10.advanceAdd * slot3.advance + slot10.starAdd * slot3.star) * slot5.energyCorrection)
		slot8 = string.format("%s/%s", slot4 and math.min(slot4, slot11) or slot11, slot11)

		if gGameModel.town and (gGameModel.town:read("cards")[slot1] or {}).energy and slot12.max_energy and slot12.max_energy < slot12.energy then
			slot8 = string.format("%s/%s", slot12.energy, slot12.max_energy)
		end
	end

	slot0.townEnergyTxt:text(slot8)
	adapt.oneLinePos(slot0.townEnergyTxt, slot0.btnEnergyInfo, cc.p(5, 0), "left")
end

function slot1.onTownEnergyClick(slot0)
	gGameUI:showItemDetailCustom(slot0.btnEnergyInfo, slot0.selectDbId:read(), "city.card.energy_detail", {
		canvasDir = "horizontal",
		tipParams = {
			dir = "right",
			offy = 30,
			offx = -slot0.btnEnergyInfo:x() - 40
		}
	})
end

function slot1.onAttrDetail(slot0)
	gGameUI:stackUI("city.card.attrdetail", nil, , slot0.selectDbId:read())
end

function slot1.onShowGradeClick(slot0)
	slot0.showGradePanel:modify(function (slot0)
		return true, not slot0
	end)
end

function slot1.onUpGradePanelClick(slot0)
	if slot0.roleLv:read() <= slot0.cardLevel:read() then
		gGameUI:showTip(gLanguageCsv.cardLevelReachedLimit)

		return
	end

	if not slot0.showOneKeyUpgrade then
		gGameUI:showTip(gLanguageCsv.levelUpNoEnough)

		return
	end

	gGameUI:stackUI("city.card.upgrade", nil, , {
		type = 1,
		selectDbId = slot0.selectDbId:read()
	}, slot0:createHandler("isSuccess"))
end

function slot1.isSuccess(slot0)
	slot0.showSuccessTip = true

	slot0.clientLv:notify()
end

function slot1.showFetterClick(slot0)
	gGameUI:stackUI("city.card.fetter", nil, , slot0.fetterData:read(), slot0.cardId:read())
end

function slot1.checkCanLvUp(slot0, slot1, slot2)
	slot4 = true

	while slot0.clientNextLvExp <= slot0.clientCurLvExp:read() do
		if slot0:canLevelUp() then
			slot0.showSuccessTip = slot4
			slot4 = false

			slot0.clientCurLvExp:set(slot3 - slot0.clientNextLvExp)
			slot0.clientLv:modify(function (slot0)
				return true, slot0 + 1
			end)
		else
			slot0.clientCurLvExp:modify(function (slot0)
				uv2 = "clientNextLvExp"

				return true, slot2.clientNextLvExp
			end)

			break
		end
	end
end

function slot1.onItemClick(slot0, slot1, slot2, slot3, slot4, slot5)
	function slot6(slot0, slot1)
		slot0 = slot0 or 1
		uv2 = "num"

		if slot2.num <= 0 then
			if not slot1 then
				uv2 = "roleLv"
				slot2 = slot2.roleLv
				slot3 = slot2
				uv3 = "read"

				if slot2.read(slot3) < slot3.cfg.specialArgsMap.buy_level then
					uv6 = "read"

					gGameUI:showTip(string.format(gLanguageCsv.buyInfoTip, slot6.cfg.specialArgsMap.buy_level))

					return
				end

				slot3 = game.PRIVILEGE_TYPE.ExpItemCostFallRate
				slot2 = 1 - dataEasy.getPrivilegeVal(slot3)
				uv3 = "read"
				uv5 = "read"
				slot6 = 0
				slot7 = true
				slot4 = mathEasy.getPreciseDecimal(slot5.cfg.specialArgsMap.buy_rmb * slot2, slot6, slot7)
				uv6 = "roleLv"
				uv7 = "read"
				slot6.key = slot7.key
				uv13 = "read"
				uv14 = "roleLv"

				gGameUI:stackUI("common.buy_info", nil, , {
					rmb = slot3.cfg.specialArgsMap.buy_rmb
				}, {
					id = slot13.key
				}, {
					contentType = "num",
					maxNum = 100,
					discount = slot2
				}, slot14:createHandler("showBuyInfo"))
			end
		else
			uv2 = "roleLv"

			if slot2:canLevelUp() then
				uv2 = "num"
				uv3 = "num"
				slot3 = slot3.num - slot0
				slot2.num = slot3
				uv2 = "num"
				slot2 = slot2.resetState

				slot2()

				uv2 = "roleLv"
				slot2 = slot2.costData
				uv3 = "read"
				slot3 = slot3.key
				uv4 = "roleLv"
				uv5 = "read"

				if slot4.costData[slot5.key] then
					uv4 = "roleLv"
					uv5 = "read"

					if not (slot4.costData[slot5.key] + slot0) then
						slot4 = slot0
					end
				end

				slot2[slot3] = slot4
				uv2 = "roleLv"
				slot2 = slot2.clientCurLvExp
				slot2 = slot2.modify

				slot2(slot2, function (slot0)
					uv2 = "cfg"
					uv3 = "specialArgsMap"

					return true, slot0 + slot2.cfg.specialArgsMap.exp * slot3
				end)

				uv2 = "roleLv"
				slot2 = slot2.textNum:show()
				slot2 = slot2.text
				uv5 = "roleLv"
				uv6 = "read"
				slot5 = slot5.costData[slot6.key]
				slot4 = "x" .. slot5

				slot2(slot2, slot4)

				uv2 = "roleLv"
				slot2 = slot2.checkCanLvUp
				uv4 = "cfg"
				uv5 = "read"

				slot2(slot2, slot4, slot5)

				uv2 = "num"

				if not slot2.lvUpEffect then
					uv2 = "num"
					uv4 = "num"
					slot2.lvUpEffect = widget.addAnimation(slot4, "koudai_gonghuixunlian/gonghuixunlian.skel", "fangguang", 10):xy(65, 0):scale(0.8)
				else
					uv2 = "num"

					slot2.lvUpEffect:play("fangguang")
				end

				audio.playEffectWithWeekBGM("square.mp3")

				return true
			else
				gGameUI:showTip(gLanguageCsv.cardLevelReachedLimit)
			end
		end
	end

	if slot5.name == "began" then
		slot0.selectDbIdChange = false
		slot0.lvTouchTimes = 0.5
		slot0.count = 1
		slot7 = 0.5

		if function ()
			uv0 = "lvTouchTimes"
			uv2 = "lvTouchTimes"
			slot1 = math.max(slot2.lvTouchTimes - 0.03, 0.05)
			slot0.lvTouchTimes = slot1
			uv0 = "math"
			uv1 = 0.03
			uv0 = "math"
			uv1 = "lvTouchTimes"

			if slot1.lvTouchTimes <= slot0 + 0.1 then
				uv1 = slot3
				uv0 = "lvTouchTimes"
				uv2 = "lvTouchTimes"
				slot2 = slot2.count
				uv5 = "lvTouchTimes"
				uv6 = "max"
				slot1 = cc.clampf(slot2, 1, math.floor(slot5.clientMaxLvNeedExp / slot6.cfg.specialArgsMap.exp))
				slot0.count = slot1
				uv0 = "count"
				uv1 = "lvTouchTimes"
				uv2 = "lvTouchTimes"

				if not slot0(slot1.count, slot2.lvTouchTimes ~= 0.47) then
					return false
				end
			end
		end() ~= false then
			slot0:schedule(slot8, 0.05, 0.05, "attrLvUp")
		end

		return
	end

	if slot5.name == "moved" then
		if not slot0.lvTouchBeganPos then
			slot0.lvTouchBeganPos = slot2:getTouchBeganPosition()
		end

		if ui.TOUCH_MOVE_CANCAE_THRESHOLD <= math.abs(slot5.x - slot0.lvTouchBeganPos.x) or ui.TOUCH_MOVE_CANCAE_THRESHOLD <= math.abs(slot5.y - slot0.lvTouchBeganPos.y) then
			slot0:unSchedule("attrLvUp")
		end
	elseif slot5.name == "ended" or slot5.name == "cancelled" then
		slot0:unSchedule("attrLvUp")

		slot0.lvTouchBeganPos = nil

		slot0:sendRequeat()
		slot0.textNum:hide()
	end
end

function slot1.showBuyInfo(slot0, slot1)
	gGameApp:requestServer("/game/exp/buy_item", function (slot0)
		gGameUI:showTip(gLanguageCsv.hasBuy)
	end, slot0.key, slot1)
end

function slot1.upgradeFloatingWord(slot0, slot1)
	slot2, slot3 = slot0.progressBar:xy()
	slot4 = cc.Label:createWithTTF("exp+" .. slot1, ui.FONT_PATH, 54):align(cc.p(0.5, 0.5), slot2, slot3 + 40):addTo(slot0.levelupPanel, 11)

	text.addEffect(slot4, {
		color = cc.c4b(0, 255, 0, 255),
		outline = {
			size = 3,
			color = cc.c4b(44, 44, 44, 255)
		}
	})
	transition.executeSequence(slot4):moveBy(0.4, 0, 50):fadeOut(0.1):func(function ()
		uv0 = "removeSelf"

		slot0:removeSelf()
	end):done()
end

function slot1.canLevelUp(slot0)
	if slot0.clientLv:read() < slot0.roleLv:read() then
		return true
	end

	return false
end

function slot1.sendRequeat(slot0, slot1)
	if not itertools.isempty(slot0.costData) then
		slot0.costData = {}

		gGameApp:requestServer("/game/card/exp/use_items", function ()
			error("Decompilation failed")
			-- Exception in function building!
			-- Traceback (most recent call last):
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
			--     return _build_function_definition(prototype, state.header)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
			--     node.statements.contents = _build_function_blocks(state, instructions)
			--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
			--     statement, line_marked_elements = _build_statement(state, addr, instruction)
			--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
			--     return _build_var_assignment(state, addr, instruction)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
			--     assn = func(*args, **kwargs)
			--            ^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
			--     expression = _build_const_expression(state, addr, instruction)
			--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
			--     return _build_string_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
			--     node.value = state.constants.complex_constants[index]
			--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end, slot0.selectDbId, slot0.costData)
	elseif slot1 then
		slot1()
	end
end

function slot1.onShowAtrtInfo(slot0)
	gGameUI:stackUI("city.card.nature_attr_info", nil, , slot0.selectDbId:read())
end

function slot1.onBtnComment(slot0)
	gGameApp:requestServer("/game/card/comment/list", function (slot0)
		uv5 = "gGameApp"

		gGameApp:requestServer("/game/card/score/get", function (slot0)
			uv6 = "gGameUI"
			slot6 = slot6.cardId
			slot7 = slot6
			uv7 = "stackUI"

			gGameUI:stackUI("city.card.comment", nil, {
				full = true
			}, slot6.read(slot7), slot7.view, slot0.view)
		end, slot5.cardId:read())
	end, slot0.cardId:read(), 0, 20)
end

function slot1.onShareCard(slot0)
	if not dataEasy.isChatOpen(gUnlockCsv.cardShare) then
		return
	end

	if gCommonConfigCsv.shareTimesLimit <= slot0.shareTimes:read() then
		gGameUI:showTip(gLanguageCsv.shareTimesNotEnough)

		return
	end

	gGameUI:stackUI("city.card.share_tip", nil, , slot0.selectDbId:read())
end

return slot1
