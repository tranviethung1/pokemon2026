slot0 = {
	{
		res = "city/medal/img_xunzhangkuang3.png",
		color = cc.c4b(103, 123, 89, 255)
	},
	{
		res = "city/medal/img_xunzhangkuang2.png",
		color = cc.c4b(91, 105, 152, 255)
	},
	{
		res = "city/medal/img_xunzhangkuang1.png",
		color = cc.c4b(159, 108, 70, 255)
	},
	{
		res = "city/medal/img_xunzhangkuang.png",
		color = cc.c4b(159, 108, 70, 255)
	}
}

function slot1(slot0, slot1)
	slot2 = cc.GLProgram:create("shader/ver_shader.vsh", "shader/glow_part.fsh")

	slot2:link()
	slot2:updateUniforms()

	slot3 = cc.GLProgramState:getOrCreateWithGLProgram(slot2)

	slot0:setGLProgramState(slot3)
	slot3:setUniformFloat("NUM", slot1)
end

slot2 = class("medalCollectionDetailView", Dialog)
slot2.RESOURCE_FILENAME = "medal_collection_detail.json"
slot2.RESOURCE_BINDING = {
	["normal.left.bg"] = "medalBg",
	["normal.right.descPanel.text"] = "descTitle",
	["normal.right.descPanel"] = "descPanel",
	["normal.right.iconPanel"] = "iconPanel",
	["normal.left.icon"] = "medalImg",
	["normal.right.attrPanel"] = "attrPanel",
	["normal.left.tag"] = "medalFlag",
	["normal.right.iconPanel.iconTitle"] = "iconTitle",
	["normal.right.attrPanel.attr"] = "attrItem",
	["normal.right.attrPanel.attrInnerList"] = "attrInnerList",
	["normal.right.attrPanel.attrTitle"] = "attrTitle",
	normal = "normalPanel",
	tips = "tipsPanel",
	["tips.title"] = "tipsTitle",
	["normal.bottom.item"] = "page",
	["tips.text"] = "tips",
	["tips.list"] = "tipsList",
	["normal.right.iconPanel.icon"] = "iconImg",
	["normal.left.name"] = "medalName",
	["normal.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["normal.bottom.list"] = {
		varname = "pageList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				data = bindHelper.self("pageData"),
				item = bindHelper.self("page"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:show()

					slot4 = slot1:get("selected")
					slot5 = slot1:get("normal")

					slot4:setVisible(slot3.select)
					slot4:get("text"):text("·" .. slot2 .. "·")
					slot5:setVisible(not slot3.select)
					slot5:get("text"):text("·" .. slot2 .. "·")
					slot4:setTouchEnabled(false)
					slot1:get("flag"):setVisible(slot3.state == 1)

					if slot3.state == 1 and not slot3.select then
						slot1:get("flag"):x(190)
					end

					bind.touch(slot0, slot5, {
						methods = {
							ended = functools.partial(slot0.clickCell, csv.medal[slot3.csvId].sort)
						}
					})
				end,
				preloadCenter = bindHelper.self("select")
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	},
	["normal.right.btnShow"] = {
		varname = "btnShow",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShow")
			}
		}
	},
	["normal.right.btnShow.text"] = {
		varname = "btnShowText",
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["normal.right.btn"] = {
		varname = "getBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onGet")
			}
		}
	},
	["normal.right.btn.text"] = {
		varname = "btnText",
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["normal.right.iconPanel.iconList"] = {
		varname = "iconList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("iconData"),
				item = bindHelper.self("iconImg"),
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3 ~= nil then
						bind.extend(slot0, slot1, {
							class = "icon_key",
							props = {
								data = {
									key = slot3.id,
									num = slot3.num
								}
							}
						})
					end
				end
			}
		}
	},
	["normal.right.attrPanel.attrList"] = {
		varname = "attrList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("attrData"),
				item = bindHelper.self("attrInnerList"),
				cell = bindHelper.self("attrItem"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot6 = slot1:get("img")

					if game.ATTRDEF_SIMPLE_TABLE[game.ATTRDEF_SIMPLE_ENUM_TABLE[game.ATTRDEF_TABLE[slot3.attrId]]] then
						slot6:texture(ui.ATTR_LOGO[slot5])
						adapt.oneLinePos(slot6, slot1:get("text"), cc.p(10, 0), "left")
					else
						slot6:hide()
						slot7:x(slot7:x() - 56)
					end

					slot7:text(getLanguageAttr(slot3.attrId) .. "：+" .. slot3.val)
				end
			}
		}
	},
	["tips.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0.iconPanel:show()
	slot0.attrPanel:show()
	Dialog.onCreate(slot0, {
		clickClose = true
	})
	slot0:initModel(slot1.csvId)
	slot0:initUI(slot1.colorNum)

	slot0.cb = slot1.cb
end

function slot2.initModel(slot0, slot1)
	slot0.task = gGameModel.role:getIdler("medal_task")
	slot0.medalShow = gGameModel.role:getIdler("medal_show")
	slot0.cfg = csv.medal[slot1]
	slot0.csvID = slot1
	slot0.nums = {}
	slot2 = {}

	for slot6, slot7 in orderCsvPairs(csv.medal) do
		if slot7.medalID == slot0.medalID then
			table.insert(slot2, {
				csvId = slot6,
				state = slot0.task:read()[slot6] or 0
			})
		end
	end

	slot0.select = idler.new(slot0.cfg.sort)
	slot0.iconData = idlertable.new({})
	slot0.attrData = idlertable.new({})
	slot0.pageData = idlers.newWithMap(slot2)

	slot0.select:addListener(function (slot0, slot1)
		uv2 = "pageData"

		if slot2.pageData:atproxy(slot1) ~= nil then
			uv2 = "pageData"
			slot2 = slot2.pageData:atproxy(slot1)
			slot2.select = false
			uv2 = "pageData"
			slot2 = slot2.pageData:atproxy(slot0)
			slot2.select = true
			uv2 = "pageData"

			slot2:changeData(slot0, true)
		end
	end)

	slot3 = slot0.iconPanel:y()
	slot4 = slot0.attrPanel:y()

	idlereasy.any({
		slot0.task,
		slot0.medalShow,
		slot0.select
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "changeData"
		slot6 = slot3

		slot4:changeData(slot6, false)

		slot4, slot5 = nil
		uv6 = "changeData"
		slot6 = slot6.getBtn
		slot6 = slot6.show

		slot6(slot6)

		uv6 = "changeData"
		slot6 = slot6.btnShow
		slot6 = slot6.hide

		slot6(slot6)

		uv6 = "changeData"

		if slot1[slot6.csvID] == 1 then
			uv6 = "changeData"
			slot4 = slot6.nums.canGetNum > 1 and gLanguageCsv.getAwardAll or gLanguageCsv.commonTextGet
			slot5 = true
		else
			uv6 = "changeData"

			if slot1[slot6.csvID] == 0 then
				uv6 = "changeData"
				uv7 = "changeData"

				if slot6.nums.maxNum == slot7.nums.finishNum then
					uv6 = "changeData"

					if slot6.nums.canGetNum > 0 then
						slot4 = gLanguageCsv.received
						slot5 = false
					else
						uv6 = "changeData"
						slot6 = slot6.btnShow
						slot6 = slot6.show

						slot6(slot6)

						uv6 = "changeData"
						slot6 = slot6.getBtn
						slot6 = slot6.hide

						slot6(slot6)

						uv6 = "changeData"
						slot4 = slot2 == slot6.cfg.medalID and gLanguageCsv.isShowMedal or gLanguageCsv.showMedal
						uv6 = "changeData"
						slot5 = slot2 ~= slot6.cfg.medalID
					end
				end
			else
				uv6 = "changeData"

				if not slot1[slot6.csvID] then
					slot4 = gLanguageCsv.unFinish
					slot5 = false
				end
			end
		end

		uv6 = "changeData"
		slot6 = slot6.getBtn
		slot6 = slot6.setTouchEnabled

		slot6(slot6, slot5)

		uv6 = "changeData"
		slot6 = slot6.btnShow
		slot7 = slot6

		slot6.setTouchEnabled(slot7, slot5)

		uv7 = "changeData"
		slot7 = slot7.btnShow

		cache.setShader(slot7, false, slot5 and "normal" or "hsl_gray")

		slot6 = cache.setShader
		uv7 = "changeData"

		slot6(slot7.getBtn, false, slot5 and "normal" or "hsl_gray")

		uv6 = "changeData"
		slot6 = slot6.btnText
		slot6 = slot6.text

		slot6(slot6, slot4)

		uv6 = "changeData"
		slot6 = slot6.btnShowText
		slot7 = slot6
		slot6 = slot6.text
		slot8 = slot4

		slot6(slot7, slot8)

		uv6 = "getBtn"
		uv7 = "changeData"
		slot7 = slot7.medalImg
		uv8 = "changeData"

		slot6(slot7, slot8.cfg.showShadow)

		uv7 = "changeData"
		slot7 = slot7.cfg.desc
		slot6 = "#C0x5B545B#" .. slot7
		uv7 = "changeData"
		slot7 = slot7.task
		slot8 = slot7
		uv8 = "changeData"
		slot7 = slot7.read(slot8)[slot8.csvID] and gLanguageCsv.complete or gLanguageCsv.unFinish
		uv8 = "changeData"

		if slot8.cfg.targetTextShow > 0 then
			uv8 = "changeData"

			if not slot8.cfg.targetTextShow then
				uv8 = "changeData"
				slot8 = slot8.cfg.targetArg
			end
		end

		uv12 = "changeData"
		slot11 = slot8
		slot9 = math.min(gGameModel.role:getMedal(slot12.csvID), slot11)
		slot10 = nil
		uv11 = "changeData"
		slot11 = slot11.task
		slot12 = slot11
		uv12 = "changeData"

		if slot11.read(slot12)[slot12.csvID] then
			uv11 = "changeData"
			slot10 = slot11.cfg.targetTextShow >= 0 and string.format("%d/%d", slot8, slot8) or slot7
		else
			uv11 = "changeData"
			slot10 = slot11.cfg.targetTextShow >= 0 and string.format("%d/%d", slot9, slot8) or slot7
		end

		slot12 = rich.createWithWidth(slot6 .. gLanguageCsv.symbolBracketLeft .. slot10 .. gLanguageCsv.symbolBracketRight, 40, nil, 950):align(cc.p(0, 1), 12, 100):name("richText")
		slot14 = slot12
		uv14 = "changeData"
		slot14 = slot14.descPanel
		slot14 = slot14.removeChildByName

		slot14(slot14, "richText")

		uv14 = "changeData"
		slot14 = slot14.descPanel
		slot14 = slot14.addChild

		slot14(slot14, slot12)

		uv14 = "changeData"
		slot14 = slot14.iconPanel
		slot14 = slot14.setVisible
		uv17 = "changeData"
		slot17 = slot17.iconData
		slot17 = slot17.read

		slot14(slot14, not itertools.isempty(slot17(slot17)))

		uv14 = "changeData"
		slot14 = slot14.attrPanel
		slot14 = slot14.setVisible
		uv17 = "changeData"
		slot16 = not itertools.isempty(slot17.attrData:read())

		slot14(slot14, slot16)

		uv14 = "changeData"
		uv16 = "show"
		slot16 = slot16 - math.max(slot12.height(slot14) - 90, 0)

		slot14.iconPanel:y(slot16)

		slot14 = nil
		uv16 = "changeData"

		if itertools.isempty(slot16.iconData:read()) then
			uv15 = "btnShow"
			slot14 = slot15 + 270 - math.max(slot13 - 90, 0)
		else
			uv15 = "btnShow"
			slot14 = slot15 - math.max(slot13 - 90, 0)
		end

		uv15 = "changeData"

		slot15.attrPanel:y(slot14)
	end)
	slot0:initAttrData()
end

function slot2.changeData(slot0, slot1, slot2)
	slot0.cfg = gMedalCollectionCsv[slot0.cfg.medalID][slot1]
	slot3 = slot0.task:read()
	slot4 = {}
	slot5 = 0
	slot6 = 0

	for slot10, slot11 in orderCsvPairs(csv.medal) do
		if slot11.medalID == slot0.cfg.medalID then
			if slot11.sort == slot1 then
				slot0.csvID = slot10

				if slot2 then
					slot0.select:set(slot1)
				end
			end

			if slot3[slot10] then
				slot6 = slot6 + 1
			end

			if slot3[slot10] == 1 then
				slot5 = slot5 + 1
			end

			table.insert(slot4, {
				csvId = slot10,
				state = slot3[slot10] or 0,
				select = slot11.sort == slot1
			})
		end
	end

	slot0.nums = {
		maxNum = #slot4,
		finishNum = slot6,
		canGetNum = slot5
	}

	slot0.pageData:update(slot4)

	slot0.tipsData = slot0.cfg.hidedesc
	slot7 = {}

	for slot11, slot12 in csvMapPairs(slot0.cfg.award) do
		if slot12 ~= nil then
			table.insert(slot7, {
				id = slot11,
				num = slot12
			})
		end
	end

	slot0.iconData:set(slot7)
	slot0:initAttrData()
end

function slot2.initAttrData(slot0)
	slot1 = {}
	slot2 = slot0.task:read()
	slot3 = {}
	slot4 = {}

	for slot8, slot9 in orderCsvPairs(csv.medal) do
		if slot9.medalID == slot0.cfg.medalID then
			for slot13 = 1, math.huge do
				slot15 = tonumber(slot9["attrNum" .. slot13])

				if tonumber(slot9["attrType" .. slot13]) and slot15 and slot15 > 0 then
					if slot8 == slot0.csvID then
						table.insert(slot1, {
							attrId = slot14,
							val = dataEasy.getAttrValueString(slot14, slot15)
						})
					end

					if slot2[slot8] == 1 then
						slot3[slot14] = (slot3[slot14] or 0) + slot15
					end
				else
					break
				end
			end
		end
	end

	slot0.attrData:set(slot1)

	slot0.allAttrData = slot3
end

function slot2.onItemClick(slot0, slot1, slot2)
	slot0.select:set(slot2)
end

function slot2.initUI(slot0, slot1)
	if slot0.cfg.type == 2 and slot0.nums.finishNum == 0 then
		slot0.tipsPanel:show()
		slot0.normalPanel:hide()
		slot0:initTips()
	else
		slot0.tipsPanel:hide()
		slot0.normalPanel:show()
		slot0:initNormal(slot1)
	end
end

function slot2.initTips(slot0)
	slot0.tipsList:removeAllChildren()

	slot3 = rich.createWithWidth("\t\t" .. "#C0x5B545B#" .. slot0.tipsData, 40, nil, 1180, 15):anchorPoint(0, 1):addTo(slot0.tipsList):getContentSize().height

	slot0.tipsList:y(math.min(480, 350 + math.max(0, (slot3 - 130) / 2)))
	slot0.tips:y(660 - math.max(0, (slot3 - 130) / 2))
	slot0.tipsTitle:text(slot0.cfg.medalName)
	adapt.setTextAdaptWithSize(slot0.tipsTitle, {
		maxLine = 2,
		vertical = "center",
		horizontal = "center",
		size = cc.size(400, 150)
	})
	slot0.tips:text(gLanguageCsv.tipsFromTLM)
end

function slot2.initNormal(slot0, slot1)
	slot4 = 3.4

	slot0.medalImg:texture(slot0.cfg.res):scale(slot4)

	uv4 = "medalImg"

	slot0.medalBg:texture(slot4[slot1].res)
	slot0.medalFlag:setVisible(slot0.cfg.type == 3)

	slot5 = 680

	adapt.setTextScaleWithWidth(slot0.medalName, slot0.cfg.medalName, slot5)

	uv5 = "medalImg"

	text.addEffect(slot0.medalName, {
		color = slot5[slot1].color
	})
	text.addEffect(slot0.medalFlag:get("text"), {
		outline = {
			size = 4,
			color = cc.c4b(207, 67, 54, 255)
		}
	})
	slot0.medalFlag:get("text"):text(gLanguageCsv.settingHide)
	slot0.descTitle:text(gLanguageCsv.needHave)
	slot0.iconTitle:text(gLanguageCsv.medalAward)
	slot0.attrTitle:get("text"):text(gLanguageCsv.randomTowerJumpBUff1 .. "：")
	slot0.attrTitle:get("img"):hide()
end

function slot2.onGet(slot0)
	slot1 = slot0.allAttrData

	if not itertools.isempty(slot0.iconData) and not itertools.isempty(slot0.allAttrData) then
		gGameApp:requestServer("/game/role/medal/award/get", function (slot0)
			gGameUI:showGainDisplay(slot0, {
				cb = function ()
					uv5 = "gGameUI"

					gGameUI:stackUI("city.medal_collection.activate", nil, {
						clickClose = true
					}, slot5)
				end
			})
		end, slot0.cfg.medalID)
	elseif not itertools.isempty(slot0.iconData) then
		gGameApp:requestServer("/game/role/medal/award/get", function (slot0)
			gGameUI:showGainDisplay(slot0)
		end, slot0.cfg.medalID)
	elseif not itertools.isempty(slot0.allAttrData) then
		gGameApp:requestServer("/game/role/medal/award/get", function ()
			uv5 = "gGameUI"

			gGameUI:stackUI("city.medal_collection.activate", nil, {
				clickClose = true
			}, slot5)
		end, slot0.cfg.medalID)
	end
end

function slot2.onShow(slot0)
	if slot0.medalShow:read() ~= slot0.cfg.medalID and slot0.medalShow:read() > 0 then
		gGameUI:showDialog({
			btnType = 2,
			isRich = true,
			clearFast = true,
			cb = function ()
				uv4 = "gGameApp"

				gGameApp:requestServer("/game/role/medal/show", function (slot0)
					gGameUI:showTip(gLanguageCsv.isShowNow)
				end, slot4.cfg.medalID)
			end,
			content = string.format(gLanguageCsv.ifChangeShow, gMedalCollectionCsv[slot0.medalShow:read()][1].medalName),
			dialogParams = {
				clickClose = false
			}
		})
	else
		gGameApp:requestServer("/game/role/medal/show", function (slot0)
			gGameUI:showTip(gLanguageCsv.isShowNow)
		end, slot0.cfg.medalID)
	end
end

function slot2.onClose(slot0)
	slot0.iconPanel:hide()
	slot0.attrPanel:hide()

	if slot0.cb then
		slot0:addCallbackOnExit(slot0.cb)
	end

	Dialog.onClose(slot0)
end

return slot2
