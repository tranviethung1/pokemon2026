slot0 = class("OverflowExpView", Dialog)
slot0.RESOURCE_FILENAME = "personal_overflow_experience.json"
slot0.RESOURCE_BINDING = {
	centre = "centre",
	item = "item",
	["up.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 4,
				data = bindHelper.self("tableDat"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					slot2 = false
					slot3 = false

					if slot0.sum_exp and slot0.sum_exp[slot0.k] and slot0.limit - slot0.sum_exp[slot0.k] == 0 then
						slot2 = true
					end

					if slot1.sum_exp and slot1.sum_exp[slot1.k] and slot1.limit - slot1.sum_exp[slot1.k] == 0 then
						slot3 = true
					end

					if slot2 then
						return false
					elseif slot3 then
						return true
					else
						return slot0.sort < slot1.sort
					end
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("expNumber", "icon", "dhNumber", "dh", "dhBtn", "list")

					slot4.expNumber:text(slot3.needExp)
					slot4.icon:hide()
					uiEasy.createItemsToList(slot0, slot4.list, slot3.award)

					slot5 = false

					function slot6()
						uv0 = "dhNumber"
						slot0 = slot0.dhNumber
						slot1 = slot0
						slot2 = ui.COLORS.NORMAL.DEFAULT

						slot0.setTextColor(slot1, slot2)

						uv1 = "dhNumber"
						uv2 = "dhNumber"

						uiEasy.setBtnShader(slot1.dhBtn, slot2.dhBtn:get("textNote"), 2)
					end

					if slot3.limit == 0 then
						slot4.dhNumber:visible(false)
						slot4.dh:visible(false)
						slot4.dhBtn:y(122)
					else
						if slot3.sum_exp and slot3.sum_exp[slot2] then
							if slot3.limit - slot3.sum_exp[slot2] < 0 then
								slot7 = 0
							end

							slot4.dhNumber:text(slot7 .. "/" .. slot3.limit)

							if slot7 == 0 then
								slot6()

								slot5 = true
							end
						else
							slot4.dhNumber:text(slot3.limit .. "/" .. slot3.limit)
						end

						slot4.dh:x(slot4.dhNumber:x() - slot4.dhNumber:width() - 10)
					end

					if slot3.role_exp:read() < slot3.needExp and not slot5 then
						slot6()
					end

					bind.touch(slot0, slot4.dhBtn, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("btnClick")
			}
		}
	},
	["centre.title3"] = {
		binds = {
			event = "text",
			idler = bindHelper.model("role", "overflow_exp")
		}
	}
}

function slot0.onCreate(slot0)
	slot0:initModel()
	slot0.item:visible(false)
	slot0.list:setScrollBarEnabled(false)

	slot0.tableDat = idlers.newWithMap(slot0:filtrateData())

	adapt.oneLineCenterPos(cc.p(540, 31), {
		slot0.centre:get("title"),
		slot0.centre:get("icon"),
		slot0.centre:get("title4"),
		slot0.centre:get("title2"),
		slot0.centre:get("icon2"),
		slot0.centre:get("title5"),
		slot0.centre:get("title3")
	}, cc.p(6, 0))
	Dialog.onCreate(slot0)
end

function slot0.filtrateData(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(csv.overflow_exp_exchange) do
		table.insert(slot1, {
			needExp = slot6.needExp,
			limit = slot6.limit,
			sort = slot6.sort,
			award = slot6.award,
			sum_exp = slot0.sum_exp:read(),
			role_exp = slot0.role_exp,
			k = slot5
		})
	end

	return slot1
end

function slot0.initModel(slot0)
	slot0.sum_exp = gGameModel.role:getIdler("overflow_exp_exchanges")
	slot0.role_exp = gGameModel.role:getIdler("overflow_exp")
end

function slot0.btnClick(slot0, slot1, slot2, slot3)
	slot4, slot5 = csvNext(slot3.award)
	slot6 = slot3.limit

	if slot3.sum_exp and slot3.sum_exp[slot2] and slot3.limit - slot3.sum_exp[slot2] < 0 then
		slot6 = 0
	end

	slot0.csvId = slot2
	slot0.award = slot3.award

	gGameUI:stackUI("common.buy_info", nil, , {
		overflow_exp = slot3.needExp
	}, {
		id = slot4,
		num = slot5
	}, {
		contentType = "num",
		maxNum = slot6 ~= 0 and slot6 or nil
	}, slot0:createHandler("updateDate"))
end

function slot0.updateDate(slot0, slot1)
	gGameApp:requestServer("/game/role/overflow_exp_exchange", function (slot0)
		gGameUI:showGainDisplay(slot0.view, {
			raw = true,
			function ()
				uv0 = "filtrateData"
				slot1 = dataEasy.tryCallFunc
				uv2 = "filtrateData"

				slot1(slot2.list, "updatePreloadCenterIndex")

				uv1 = "filtrateData"

				slot1.tableDat:update(slot0:filtrateData())
			end()
		})
	end, slot0.csvId, slot1)
end

return slot0
