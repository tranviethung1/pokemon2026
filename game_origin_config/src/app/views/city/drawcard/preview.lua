slot0 = {
	card = gLanguageCsv.card,
	item = gLanguageCsv.res,
	desc = gLanguageCsv.probability,
	equip = gLanguageCsv.carryItem
}
slot1 = {
	diamond_up = 7,
	equip = 4,
	limit_sprite = 5,
	gold = 1,
	limit = 6,
	lucky_egg = 8,
	diamond = 2,
	component = 3,
	self_choose = 9
}
slot2 = class("DrawCardPreviewView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "drawcard_preview.json"
slot2.RESOURCE_BINDING = {
	textInnerList = "textInnerList",
	roleItem = "roleItem",
	item = "item",
	textItem = "textItem",
	innerList = "innerList",
	list = {
		varname = "listview",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 7,
				data = bindHelper.self("showDatas"),
				item = bindHelper.self("item"),
				roleItem = bindHelper.self("roleItem"),
				textItem = bindHelper.self("textItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.type == "title" then
						slot1:size(1950, 60)
						itertools.invoke({
							slot1:get("textNote"),
							slot1:get("list"),
							slot1:get("textInnerList")
						}, "hide")
						slot1:get("title"):y(30)

						slot6 = "title.textTitle"
						uv6 = "type"

						slot1:get(slot6):text(slot6[slot3.title])
						adapt.oneLineCenter(slot1:get("title.textTitle"), slot1:get("title.imgLeft"), slot1:get("title.imgRight"), cc.p(10, 0))
					else
						itertools.invoke({
							slot1:get("textNote"),
							slot1:get("title"),
							slot1:get("textInnerList")
						}, "hide")

						slot4 = cc.size(1950, 195)
						slot5 = slot1:get("list")
						slot6 = slot0.roleItem

						if slot3.type == "desc" then
							slot4 = cc.size(1950, 60)

							slot1:get("textInnerList"):visible(true)
							slot1:get("list"):visible(false)

							slot5 = slot1:get("textInnerList")
							slot6 = slot0.textItem
						end

						slot1:size(slot4)
						slot5:y(0)
						bind.extend(slot0, slot5, {
							class = "listview",
							props = {
								data = slot3.items,
								item = slot6,
								onItem = function (slot0, slot1, slot2, slot3)
									uv4 = "type"

									if slot4.type == "desc" then
										slot1:get("textName"):text(gLanguageCsv[slot3.text])
										adapt.setTextScaleWithWidth(slot1:get("textName"), nil, 380)
										slot1:get("textVal"):text(slot3.val .. "%")
										adapt.oneLinePos(slot1:get("textName"), slot1:get("textVal"), cc.p(10, 0), "left")
									else
										uv8 = "desc"
										uv9 = "type"

										bind.extend(slot0, slot1, {
											class = slot8[slot9.type] and "icon_key" or "explore_icon",
											props = {
												data = slot3
											}
										})
									end

									if slot3.up == true then
										cc.Sprite:create("city/drawcard/draw/txt_up.png"):addTo(slot1):xy(cc.p(slot1:size().width - 40, slot1:size().height - 17)):z(5)
									end

									slot1:visible(true)
								end
							}
						})
					end
				end
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2, slot3)
	uv4 = "showDatas"
	slot0.showDatas = {}

	if (({})[slot1] or 1) == 7 then
		sdk.trackEvent("preview_timedraw")
	elseif slot1 == 2 then
		sdk.trackEvent("preview_diadraw")
	elseif slot1 == 6 then
		sdk.trackEvent("preview_limitedraw")
	end

	slot0:initUI(slot1, slot0:initModel(slot1, slot2, slot3), slot2, slot3)
end

function slot2.initModel(slot0, slot1, slot2, slot3)
	slot4 = {}
	uv5 = "limit"

	if slot1 ~= slot5.limit then
		uv5 = "limit"

		if slot1 ~= slot5.diamond_up then
			uv5 = "limit"

			if slot1 ~= slot5.limit_sprite then
				uv5 = "limit"

				if slot1 == slot5.lucky_egg then
					if csv.yunying.yyhuodong[slot2].clientParam.priviewId and csv.draw_preview[slot5.priviewId] then
						slot4 = csv.draw_preview[slot5.priviewId]
					end
				else
					uv5 = "limit"
					slot4 = (slot1 ~= slot5.self_choose or csv.draw_preview[csv.draw_card_up_group[slot3].priviewId]) and gDrawPreviewCsv[slot1][1]
				end
			end
		end
	end

	return slot4
end

function slot2.initUI(slot0, slot1, slot2, slot3, slot4)
	slot0:card(slot1, slot2, slot3, slot4)
	slot0:heldItem(slot2)
	slot0:itemId(slot2)
	slot0:description(slot2)
end

function slot2.card(slot0, slot1, slot2, slot3, slot4)
	if slot2.card and csvSize(slot2.card) > 0 then
		slot5 = {}

		for slot9, slot10 in ipairs(slot2.card) do
			slot11 = false
			slot12 = false
			uv13 = "card"

			if slot1 == slot13.diamond_up then
				for slot17, slot18 in csvPairs(csv.yunying.yyhuodong[slot3].clientParam.up) do
					if slot10 == slot18 then
						slot11 = true

						break
					end
				end
			end

			uv13 = "card"

			if slot1 == slot13.self_choose and csv.unit[csv.cards[slot10].unitID].rarity == 3 then
				slot12 = true
			end

			if not slot12 then
				table.insert(slot5, {
					key = "card",
					num = slot10,
					up = slot11
				})
			end
		end

		uv6 = "card"

		if slot1 == slot6.self_choose then
			for slot10, slot11 in csvPairs(csv.draw_card_up_group[slot4].cards) do
				table.insert(slot5, {
					up = true,
					key = "card",
					num = slot11
				})
			end
		end

		uv6 = "card"

		if slot1 ~= slot6.diamond_up then
			uv6 = "card"

			if slot1 == slot6.self_choose then
				table.sort(slot5, function (slot0, slot1)
					slot2 = csv.unit[csv.cards[slot0.num].unitID]
					slot3 = csv.unit[csv.cards[slot1.num].unitID]

					if slot0.up == slot1.up then
						if slot2.rarity ~= slot3.rarity then
							return slot3.rarity <= slot2.rarity
						end

						return slot2.cardID < slot3.cardID
					elseif slot0.up == true and slot1.up == false then
						return true
					elseif slot0.up == false and slot1.up == true then
						return false
					end

					return false
				end)
			else
				table.sort(slot5, function (slot0, slot1)
					if csv.unit[csv.cards[slot0.num].unitID].rarity ~= csv.unit[csv.cards[slot1.num].unitID].rarity then
						return slot3.rarity < slot2.rarity
					end

					return slot2.cardID < slot3.cardID
				end)
			end
		end

		table.insert(slot0.showDatas, {
			type = "title",
			title = "card"
		})

		for slot10, slot11 in ipairs(slot5) do
			if slot10 % 9 == 1 and slot10 > 9 then
				table.insert(slot0.showDatas, {
					type = "card",
					items = {}
				})

				slot6 = {}
			end

			table.insert(slot6, slot11)
		end

		if #slot6 > 0 then
			table.insert(slot0.showDatas, {
				type = "card",
				items = slot6
			})
		end
	end
end

function slot2.heldItem(slot0, slot1)
	if slot1.helditem and csvSize(slot1.helditem) then
		slot2 = {}

		for slot6, slot7 in ipairs(slot1.helditem) do
			table.insert(slot2, {
				num = 0,
				key = slot7
			})
		end

		table.sort(slot2, dataEasy.sortItemCmp)
		table.insert(slot0.showDatas, {
			type = "title",
			title = "equip"
		})

		for slot7, slot8 in ipairs(slot2) do
			if slot7 % 9 == 1 and slot7 > 9 then
				table.insert(slot0.showDatas, {
					type = "equip",
					items = {}
				})

				slot3 = {}
			end

			table.insert(slot3, slot8)
		end

		if #slot3 > 0 then
			table.insert(slot0.showDatas, {
				type = "equip",
				items = slot3
			})
		end
	end
end

function slot2.itemId(slot0, slot1)
	if slot1.item and csvSize(slot1.item) > 0 then
		slot2 = {}

		for slot6, slot7 in ipairs(slot1.item) do
			table.insert(slot2, {
				num = 0,
				key = slot7
			})
		end

		table.sort(slot2, dataEasy.sortItemCmp)
		table.insert(slot0.showDatas, {
			type = "title",
			title = "item"
		})

		for slot7, slot8 in ipairs(slot2) do
			if slot7 % 9 == 1 and slot7 > 9 then
				table.insert(slot0.showDatas, {
					type = "item",
					items = {}
				})

				slot3 = {}
			end

			table.insert(slot3, slot8)
		end

		if #slot3 > 0 then
			table.insert(slot0.showDatas, {
				type = "item",
				items = slot3
			})
		end
	end
end

function slot2.description(slot0, slot1)
	if slot1.desc and csvSize(slot1.desc) then
		slot2 = {}

		for slot6, slot7 in ipairs(slot1.desc) do
			if not slot2[math.ceil(slot6 / 4)] then
				slot2[slot8] = {}
			end

			table.insert(slot2[slot8], {
				text = slot7[1],
				val = slot7[2]
			})
		end

		table.insert(slot0.showDatas, {
			type = "title",
			title = "desc"
		})

		for slot6, slot7 in ipairs(slot2) do
			table.insert(slot0.showDatas, {
				type = "desc",
				items = slot7
			})
		end
	end
end

return slot2
