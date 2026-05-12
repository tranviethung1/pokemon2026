slot0 = require("app.views.city.develop.contract.tools")
slot1 = require("app.views.city.card.chip.item_details")
slot2 = class("ContractItemDetailsView", slot1)
slot2.RESOURCE_FILENAME = slot1.RESOURCE_FILENAME
slot2.RESOURCE_BINDING = slot1.RESOURCE_BINDING

function slot2.initData(slot0)
	slot1 = slot0.params
	slot0.dbid = slot1.dbid
	slot0.baseCfg = csv.contract.contract[gGameModel.contracts:find(slot0.dbid):read("contract_id")]
	slot0.clientExp = slot1.clientExp
	slot0.clientAddExp = slot1.clientAddExp
	slot0.singleItemExp = csv.items[slot1.id].specialArgsMap.contractExp
end

function slot2.onOKClick(slot0)
	slot2 = slot0.clientAddExp:read()
	uv2 = "clientExp"

	if slot2.getMaxAdvanceExp(slot0.dbid) <= slot0.clientExp:read() + slot2 then
		gGameUI:showTip(gLanguageCsv.contractExpMax)

		return
	end

	if slot0.maxNum <= slot0.num:read() then
		gGameUI:showTip(gLanguageCsv.inadequateProps)

		return
	end

	uv3 = "clientExp"
	slot3, slot4, slot5 = slot3.getLevel(slot0.dbid, slot1)

	slot0.num:set(math.min(slot0.num:read() + math.ceil((slot5 - slot4) / slot0.singleItemExp), slot0.maxNum))
end

return slot2
