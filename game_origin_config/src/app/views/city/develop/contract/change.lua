slot0 = class("ContractSelectView", Dialog)
slot1 = require("app.views.city.develop.contract.tools")
slot0.RESOURCE_FILENAME = "contract_change.json"
slot0.RESOURCE_BINDING = {
	leftEmptyPanel = "leftEmptyPanel",
	["leftPanel.attrPanel.subList"] = "attrSubList",
	["leftPanel.fetterPanel"] = "fetterPanel",
	["leftPanel.linkPanel"] = "linkPanel",
	emptyPanel = "emptyPanel",
	leftPanel = "leftPanel",
	["leftPanel.attrPanel"] = "attrPanel",
	subList = "subList",
	item = "item",
	["leftPanel.attrPanel.item"] = "attrItem",
	["leftPanel.tip"] = "tip",
	txtTips = "txtTips",
	["leftPanel.list"] = "list",
	imgVeticalLine = "imgVeticalLine",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 5,
				asyncPreload = 30,
				data = bindHelper.self("contractData"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("imgSel"):visible(slot3.isSel)

					slot4 = slot3.isSel and 1 or 0

					if slot3.canNotUse and not slot3.isDress then
						slot4 = 2
					end

					slot6 = nil

					if gGameModel.cards:find(slot3.cardDbID) then
						slot7 = slot5:read("card_id", "skin_id")
						slot6 = dataEasy.getUnitId(slot7.card_id, slot7.skin_id)
					end

					bind.extend(slot0, slot1:get("iconNode"), {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.key,
								num = slot3.num
							},
							grayState = slot4,
							specialKey = {
								unitId = slot6,
								lv = slot3.lv
							},
							onNode = function (slot0)
								slot0:get("contractType"):hide()
								slot0:setTouchEnabled(false)
							end
						}
					})
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot0:getIdx(slot2), slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onCellClick")
			}
		}
	},
	btnSure = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSure")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.list:setScrollBarEnabled(false)

	slot0.contractData = idlers.new()
	slot0.selectDBID = idler.new(slot1.dbid)
	slot0.lastContract = slot1.dbid
	slot0.selectCardDBID = slot1.selectCardDBID
	slot2 = slot1.idx
	slot0.idx = slot2
	uv2 = "list"
	slot0.idxData = slot2.getCardPlan(slot0.selectCardDBID, slot0.idx)
	slot0.fieldType = slot0.idxData.cfg.fieldType

	slot0:initData()
	slot0.selectDBID:addListener(function (slot0, slot1)
		uv2 = "updateData"

		slot2:updateData()
	end)
	slot0.txtTips:hide()
	rich.createWithWidth(string.format(gLanguageCsv.contractSelectTip1, string.format("city/develop/contract/log_type%s.png", slot0.fieldType)), 40, nil, 700):anchorPoint(0, 0.5):addTo(slot0.txtTips:parent(), 1, "richTip"):xy(slot0.txtTips:xy())
	Dialog.onCreate(slot0)
end

function slot0.initData(slot0)
	slot1 = gGameModel.role:read("contracts")
	slot2 = {}
	slot3 = {}
	slot6 = {
		[slot12:read("contract_id")] = slot10
	}

	for slot10, slot11 in pairs(gGameModel.cards:find(slot0.selectCardDBID):read("contracts") or {}) do
		if gGameModel.contracts:find(slot11.contract_db_id) then
			-- Nothing
		end
	end

	for slot11, slot12 in pairs(slot1) do
		if gGameModel.contracts:find(slot12) and slot0.fieldType == csv.contract.contract[slot13:read("id", "card_db_id", "contract_id", "locked", "sum_exp", "level", "advance").contract_id].type then
			slot7 = 0 + 1

			if slot14.sum_exp == 0 and not slot14.card_db_id then
				if not slot2[slot14.contract_id] then
					slot2[slot14.contract_id] = {
						num = 0,
						dbIds = {}
					}
				end

				slot2[slot14.contract_id].num = slot2[slot14.contract_id].num + 1
				slot16 = slot6[slot14.contract_id] ~= nil

				if slot6[slot14.contract_id] then
					slot2[slot14.contract_id].canNotUse = slot0.idx ~= slot6[slot14.contract_id]
				end

				slot2[slot14.contract_id].idx = slot7

				table.insert(slot2[slot14.contract_id].dbIds, slot12)
			else
				slot16 = {}
				slot17 = slot6[slot14.contract_id] ~= nil

				if slot6[slot14.contract_id] then
					slot17 = slot0.idx ~= slot6[slot14.contract_id]
				end

				slot16.cfg = slot15
				slot16.key = slot14.contract_id
				slot16.dbIds = {
					slot12
				}
				slot16.num = 1
				slot16.isSel = slot0.selectDBID:read() == slot12
				slot16.lv = slot14.level
				slot16.cardDbID = slot14.card_db_id
				slot18 = slot14.advance
				slot16.advance = slot18
				uv18 = "gGameModel"
				slot16.isDress = slot18.isDress(slot12)
				slot16.canNotUse = slot17
				slot16.idx = slot7

				table.insert(slot3, slot16)
			end
		end
	end

	for slot11, slot12 in pairs(slot2) do
		slot14 = slot12.dbIds
		uv14 = "gGameModel"

		table.insert(slot3, {
			cfg = csv.contract.contract[slot11],
			num = #slot12.dbIds,
			key = slot11,
			dbIds = slot14,
			isDress = slot14.isDress(slot12.dbIds),
			isSel = slot0.selectDBID:read() == slot12.dbIds[1],
			lv = 1,
			advance = 0,
			canNotUse = slot12.canNotUse or false,
			idx = slot12.idx
		})
	end

	table.sort(slot3, function (slot0, slot1)
		if slot0.canNotUse ~= slot1.canNotUse then
			return not slot0.canNotUse
		end

		if slot0.cfg.quality ~= slot1.cfg.quality then
			return slot1.cfg.quality < slot0.cfg.quality
		end

		if slot0.isDress ~= slot1.isDress then
			return slot0.isDress
		end

		if slot0.key ~= slot1.key then
			return slot0.key < slot1.key
		end

		if slot0.advance ~= slot1.advance then
			return slot1.advance < slot0.advance
		end

		if slot0.lv ~= slot1.lv then
			return slot1.lv < slot0.lv
		end

		if slot0.num ~= slot1.num then
			return slot0.num < slot1.num
		end

		return slot0.idx < slot1.idx
	end)
	slot0.contractData:update(slot3)
	slot0.emptyPanel:visible(slot0.contractData:size() == 0)
	slot0.imgVeticalLine:visible(slot0.contractData:size() ~= 0)
end

function slot0.updateData(slot0)
	for slot5, slot6 in slot0.contractData:pairs() do
		slot7.isSel = slot0.selectDBID:read() == slot6:proxy().dbIds[1]
	end

	slot0.leftEmptyPanel:hide()
	slot0.leftPanel:hide()

	if slot0.contractData:size() == 0 then
		return
	end

	if slot1 == nil then
		slot0.leftEmptyPanel:show()

		return
	end

	slot0.leftPanel:show()
	slot0.list:removeAllChildren()

	slot2 = gGameModel.contracts:find(slot1)
	slot3 = slot2:read("contract_id")
	slot4 = slot2:read("level")
	slot5 = slot2:read("advance")

	bind.extend(slot0, slot0.leftPanel:get("icon"), {
		class = "icon_key",
		props = {
			noListener = true,
			data = {
				key = slot3
			}
		}
	})
	uiEasy.setIconName(slot3, nil, {
		node = slot0.leftPanel:get("name"),
		advance = slot5
	})
	slot0.leftPanel:get("level"):text(slot4)

	slot6 = adapt.oneLinePos

	slot6(slot0.leftPanel:get("txtLevel"), slot0.leftPanel:get("level"), cc.p(5, 0))

	uv6 = "selectDBID"
	slot6 = slot6.getAttrData(slot3, {
		level = slot4,
		advance = slot5
	})

	slot0.attrPanel:hide()

	slot7 = slot0.attrPanel:clone():show()
	slot8 = slot7:get("list")

	bind.extend(slot0, slot8, {
		class = "tableview",
		props = {
			columnSize = 2,
			data = slot6,
			item = slot0.attrSubList,
			cell = slot0.attrItem,
			onCell = function (slot0, slot1, slot2, slot3)
				slot1:multiget("icon", "text").icon:visible(slot3.sortKey ~= nil)
				slot4.text:text(getLanguageAttr(slot3.attr) .. " +" .. dataEasy.getAttrValueString(slot3.attr, slot3.num))

				if slot3.sortKey ~= nil then
					slot4.icon:texture(ui.ATTR_LOGO[game.ATTRDEF_TABLE[slot3.attr]])
				else
					slot4.text:x(slot4.icon:box().x)
				end
			end
		}
	})

	slot9 = slot7:get("subList"):height() * math.ceil(itertools.size(slot6) / 2)
	slot10 = slot9 - slot8:height()

	slot8:height(slot9):y(slot8:y() - slot10)
	slot8:setTouchEnabled(false)
	setContentSizeOfAnchor(slot7, cc.size(slot7:width(), slot7:height() + slot10))
	slot0.list:pushBackCustomItem(slot7)
	slot0.linkPanel:hide()

	slot11 = slot0.linkPanel:clone()
	slot12 = slot11
	slot11 = slot11.show(slot12)
	uv12 = "selectDBID"

	if slot12.getLinkData(slot3, {
		advance = slot5
	}) then
		uv13 = "selectDBID"

		slot13.adaptPanel(slot11, slot12)
		slot0.list:pushBackCustomItem(slot11)
	end

	slot13 = slot0.fetterPanel
	slot13 = slot13.hide

	slot13(slot13)

	uv13 = "selectDBID"
	slot13, slot14 = slot13.getFetterData(slot3, {
		dbid = slot1
	})

	if slot13 then
		slot15 = slot0.fetterPanel:clone()
		slot16 = slot15
		slot15 = slot15.show(slot16)
		uv16 = "selectDBID"

		slot16.adaptPanel(slot15, slot13, slot14, slot0)
		slot0.list:pushBackCustomItem(slot15)
	end

	slot0.tip:visible(not dataEasy.getCfgByKey(slot3).canExpend)
end

function slot0.onCellClick(slot0, slot1, slot2, slot3)
	if slot3.canNotUse and not slot3.isSel and not slot3.isDress then
		gGameUI:showTip(gLanguageCsv.cardContractSame)

		return
	end

	if not slot3.isSel then
		slot0.contractData:atproxy(slot2.k).isSel = true

		slot0.selectDBID:set(slot3.dbIds[1])
	else
		slot0.contractData:atproxy(slot2.k).isSel = false

		slot0.selectDBID:set(nil)
	end
end

function slot0.onSure(slot0)
	slot2 = false
	slot3 = nil
	slot4 = {}

	for slot8, slot9 in slot0.contractData:pairs() do
		if slot0.selectDBID:read() == slot9:read().dbIds[1] then
			slot2 = slot10.isDress
			slot3 = slot10.cardDbID
			slot4 = slot10
		end
	end

	function slot5()
		uv0 = "gGameModel"

		if slot0 ~= nil then
			uv2 = "cards"

			if gGameModel.cards:find(slot2.selectCardDBID) then
				uv2 = "cards"

				if (slot0:read("contracts") or {})[slot2.idx] then
					uv2 = "cards"
					slot2 = slot1[slot2.idx].contract_db_id
				end

				if slot2 then
					if gGameModel.contracts:find(slot2) then
						uv4 = "gGameModel"

						if slot2 == slot4 then
							uv4 = "cards"

							slot4:onClose()
						else
							uv9 = "gGameModel"

							gGameApp:requestServer("/game/contract/swap", function (slot0)
								uv1 = "onClose"

								slot1:onClose()
							end, slot2, slot9)
						end
					end
				else
					uv7 = "cards"
					uv8 = "gGameModel"
					uv9 = "cards"

					gGameApp:requestServer("/game/contract/equip", function (slot0)
						uv1 = "onClose"

						slot1:onClose()
					end, slot7.selectCardDBID, slot8, slot9.idx)
				end
			end
		else
			uv0 = "cards"

			if slot0.lastContract ~= nil then
				uv4 = "cards"

				gGameApp:requestServer("/game/contract/unload", function (slot0)
					uv1 = "onClose"

					slot1:onClose()
				end, slot4.lastContract)
			else
				uv0 = "cards"

				slot0:onClose()
			end
		end
	end

	if slot2 and slot4.dbIds[1] ~= slot0.lastContract then
		slot6 = nil
		slot7 = ""

		if slot3 then
			slot7 = uiEasy.getCardName(slot3)
		end

		slot8 = string.format(gLanguageCsv.contractSelectTip2, slot7)

		if slot3 == slot0.selectCardDBID then
			slot8 = gLanguageCsv.contractChangeTip
		end

		gGameUI:showDialog({
			isRich = true,
			btnType = 2,
			clearFast = true,
			cb = slot5,
			title = gLanguageCsv.spaceTips,
			content = slot8,
			dialogParams = {
				clickClose = false
			}
		})
	else
		slot5()
	end
end

return slot0
