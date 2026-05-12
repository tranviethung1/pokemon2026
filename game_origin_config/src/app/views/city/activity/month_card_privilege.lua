slot0 = class("ActivityMonthCardPrivilegeView", Dialog)
slot0.RESOURCE_FILENAME = "activity_month_card_privilege.json"
slot0.RESOURCE_BINDING = {
	card1 = "card1",
	subList = "subList",
	item = "item",
	card2 = "card2",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("datas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("desc", "value")
					slot5 = slot1:size()
					slot6 = string.format("%d.%s", slot2, slot3.str)
					slot7 = ""

					if slot3.typ == "normal" then
						slot7 = slot3.val
					elseif slot3.typ == "percent" then
						slot7 = slot3.val * 100 .. "%"
					end

					slot4.desc:text(slot6)
					slot4.value:text(slot7)
					adapt.oneLinePos(slot4.desc, slot4.value, cc.p(0, 0), "left")
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot2 = {
		{
			typ = "percent",
			name = "lianjinRate",
			str = gLanguageCsv.monthCardPrivilege1
		},
		{
			typ = "normal",
			name = "staminaExtraMax",
			str = gLanguageCsv.monthCardPrivilege2
		},
		{
			typ = "normal",
			name = "skillPointExtraMax",
			str = gLanguageCsv.monthCardPrivilege3
		},
		{
			name = "pwNoCD",
			str = gLanguageCsv.monthCardPrivilege4
		},
		{
			typ = "normal",
			name = "lianjinFreeTimes",
			str = gLanguageCsv.monthCardPrivilege5
		},
		{
			typ = "normal",
			name = "staminaBuyFreeTimes",
			str = gLanguageCsv.monthCardPrivilege6
		},
		{
			name = "lianJinUpstart",
			str = gLanguageCsv.monthCardPrivilege7
		},
		{
			typ = "normal",
			name = "huodongFragTimes",
			str = gLanguageCsv.monthCardPrivilege8
		},
		{
			typ = "percent",
			name = "huodongFragDropRate",
			str = gLanguageCsv.monthCardPrivilege9
		},
		{
			typ = "normal",
			name = "huodongGiftTimes",
			str = gLanguageCsv.monthCardPrivilege10
		},
		{
			typ = "percent",
			name = "huodongGiftDropRate",
			str = gLanguageCsv.monthCardPrivilege11
		},
		{
			typ = "normal",
			name = "fragShopRefreshLimit",
			str = gLanguageCsv.monthCardPrivilege12
		},
		{
			typ = "percent",
			name = "mysteryShopDiscount",
			str = gLanguageCsv.monthCardPrivilege13
		},
		{
			typ = "percent",
			name = "fixShopDiscount",
			str = gLanguageCsv.monthCardPrivilege14
		},
		{
			typ = "normal",
			name = "huodongGoldTimes",
			str = gLanguageCsv.monthCardPrivilege15
		},
		{
			typ = "percent",
			name = "huodongGoldDropRate",
			str = gLanguageCsv.monthCardPrivilege16
		},
		{
			typ = "normal",
			name = "huodongExpTimes",
			str = gLanguageCsv.monthCardPrivilege17
		},
		{
			typ = "percent",
			name = "huodongExpDropRate",
			str = gLanguageCsv.monthCardPrivilege18
		},
		{
			typ = "normal",
			name = "huodongContractTimes",
			str = gLanguageCsv.monthCardPrivilege20
		},
		{
			typ = "percent",
			name = "huodongContractDropRate",
			str = gLanguageCsv.monthCardPrivilege21
		}
	}
	slot5 = csv.month_card_privilege[slot1.privilegeId]
	slot6 = slot0.list
	slot7 = slot6:size()

	slot6:setScrollBarEnabled(false)

	slot8 = 0
	slot0.datas = {}

	if csv.yunying.yyhuodong[slot1.activityId].paramMap.title then
		table.insert(slot0.datas, {
			typ = "normal",
			str = gLanguageCsv.monthCardPrivilege19,
			val = gTitleCsv[slot10].title
		})
	end

	for slot14, slot15 in ipairs(slot2) do
		if slot5[slot15.name] then
			slot15.val = slot16

			table.insert(slot0.datas, slot15)
		end
	end

	slot0.card1:visible(slot3 == 1)
	slot0.card2:visible(slot3 == 2)
	Dialog.onCreate(slot0)
end

return slot0
