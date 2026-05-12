slot0 = class("ContractChooseView", Dialog)
slot0.RESOURCE_FILENAME = "contract_choose.json"
slot0.RESOURCE_BINDING = {
	empty = "empty",
	subList = "subList",
	item = "item",
	tip = "tip",
	btnSure = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSureCb")
			}
		}
	},
	["btnSure.text"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 5,
				asyncPreload = 20,
				data = bindHelper.self("contractDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("mask"):visible(slot3.isSel)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.csvId
							},
							grayState = slot3.isSel and 1 or 0,
							specialKey = {
								lvDir = "rightDown",
								unitId = slot3.unitID,
								lv = slot3.lv
							},
							onNode = function (slot0)
								slot0:setTouchEnabled(false)
							end
						}
					})
					bind.click(slot0, slot1, {
						method = functools.partial(slot0.clickCell, slot0:getIdx(slot2), slot3)
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onCellClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	Dialog.onCreate(slot0)
	slot0:initModel()
	slot0.tip:hide()

	slot0.cb = slot1
	slot0.params = slot2
	slot0.isRefresh = idler.new(false)
	slot0.contractDatas = idlers.new()

	idlereasy.when(slot0.contractDatas, function ()
		uv0 = "getResourceNode"
		slot0 = slot0:getResourceNode()
		slot1 = slot0

		slot0.removeChildByName(slot1, "textRichText")

		slot0 = nil
		uv1 = "removeChildByName"

		if slot1.id then
			uv2 = "removeChildByName"
			slot1 = dataEasy.getCfgByKey(slot2.id)
			slot0 = string.format(gLanguageCsv.contractChoose1, ui.QUALITYCOLOR[slot1.quality], slot1.name)
		else
			uv5 = "removeChildByName"
			slot0 = string.format(gLanguageCsv.contractChoose2, gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot5.quality]])
		end

		uv4 = "getResourceNode"
		slot5 = slot4
		uv5 = "removeChildByName"
		slot3 = 40
		uv3 = "getResourceNode"
		slot3 = slot3:getResourceNode()
		uv3 = "getResourceNode"
		slot1 = rich.createByStr(slot0 .. string.format("%s/%s", slot4.getCount(slot5), slot5.num), slot3):addTo(slot3, 10, "textRichText"):xy(slot3.tip:xy())
		slot1 = slot1.anchorPoint
		slot3 = 0

		slot1(slot1, slot3, 0.5)

		uv1 = "getResourceNode"
		uv3 = "getResourceNode"

		slot1.empty:visible(slot3.contractDatas:size() == 0)
	end)
	idlereasy.when(slot0.isRefresh, function ()
		uv0 = "updateData"

		slot0:updateData()
	end)
end

function slot0.initModel(slot0)
	slot0.contracts = gGameModel.role:getIdler("contracts")
end

function slot0.updateData(slot0)
	slot1 = slot0.params.ignoreDBIDs or {}
	slot3 = {}

	for slot7, slot8 in pairs(slot0.contracts:read()) do
		if function (slot0)
			if slot0.locked or slot0.card_db_id then
				return false
			end

			uv1 = "locked"

			if slot1[slot0.id] then
				return false
			end

			uv1 = "card_db_id"

			if slot1.params.id then
				uv1 = "card_db_id"

				return slot1.params.id == slot0.contract_id
			end

			if not dataEasy.getCfgByKey(slot0.contract_id).canExpend then
				return false
			end

			uv3 = "card_db_id"

			return slot1.quality == slot3.params.quality
		end(gGameModel.contracts:find(slot8):read("id", "card_db_id", "locked", "contract_id", "level", "sum_exp")) then
			table.insert(slot3, {
				isSel = false,
				dbid = slot10.id,
				csvId = slot10.contract_id,
				cardDbID = slot10.card_db_id,
				lv = slot10.level,
				sumExp = slot10.sum_exp
			})
		end
	end

	table.sort(slot3, function (slot0, slot1)
		if slot0.csvId ~= slot1.csvId then
			return slot1.csvId < slot0.csvId
		end

		return slot0.sumExp < slot1.sumExp
	end)
	slot0.contractDatas:update(slot3)
end

function slot0.getCount(slot0)
	for slot5, slot6 in slot0.contractDatas:pairs() do
		if slot6:proxy().isSel then
			slot1 = 0 + 1
		end
	end

	return slot1
end

function slot0.onSureCb(slot0)
	slot1 = {}

	for slot5, slot6 in slot0.contractDatas:pairs() do
		if slot6:proxy().isSel then
			table.insert(slot1, slot7.dbid)
		end
	end

	slot0:addCallbackOnExit(functools.partial(slot0.cb, slot1))
	Dialog.onClose(slot0)
end

function slot0.onCellClick(slot0, slot1, slot2, slot3)
	if not slot0.contractDatas:atproxy(slot2.k).isSel and slot0.params.num <= slot0:getCount() then
		gGameUI:showTip(gLanguageCsv.bcSelectCardTip02)

		return
	end

	if slot3.sumExp == 0 then
		function ()
			uv0 = "contractDatas"
			slot0 = slot0.contractDatas
			slot1 = slot0
			uv2 = "atproxy"
			uv1 = "contractDatas"
			uv3 = "atproxy"
			slot0.atproxy(slot1, slot2.k).isSel = not slot1.contractDatas:atproxy(slot3.k).isSel
		end()
	else
		gGameUI:showDialog({
			isRich = true,
			btnType = 2,
			cb = function ()
				uv9 = "gGameUI"
				slot9 = slot9.dbid
				uv9 = "stackUI"

				gGameUI:stackUI("city.card.rebirth.view", nil, {
					full = true
				}, 6, nil, , {
					contractDBID = slot9,
					cb = slot9:createHandler("onRebirthBack")
				})
			end,
			content = gLanguageCsv.contractNeedRebirth
		})
	end
end

function slot0.onRebirthBack(slot0)
	slot0.isRefresh:notify()
end

return slot0
