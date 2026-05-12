slot0 = class("FishingBookView", Dialog)
slot0.RESOURCE_FILENAME = "fishing_book.json"
slot0.RESOURCE_BINDING = {
	["left.item"] = "item",
	["left.subList"] = "subList",
	right = "right",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["left.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 4,
				leftPadding = 10,
				data = bindHelper.self("itemDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "fish_icon",
						props = {
							data = {
								key = slot3.key
							},
							onNode = function (slot0)
								slot1 = slot0.align

								slot1(slot0, cc.p(0.5, 0.5), 85, 85)

								uv1 = "align"

								if slot1.selectEffect then
									uv1 = "align"
									slot1 = slot1.selectEffect
									slot1 = slot1.removeSelf

									slot1(slot1)

									uv1 = "align"
									slot3 = cc.p(0.5, 0.5)

									slot1.selectEffect:align(slot3, 90, 90)

									uv3 = "align"

									slot0:add(slot3.selectEffect, -1)
								end
							end
						}
					})
					bind.click(slot0, slot1, {
						method = functools.partial(slot0.itemClick, slot3)
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.selectEffect = ccui.ImageView:create("common/box/box_selected.png"):alignCenter(slot0.item:size()):retain()
	slot0.itemDatas = idlers.new({})
	slot0.selectItem = idler.new(1)

	idlereasy.when(slot0.fish, function (slot0, slot1)
		for slot6, slot7 in csvPairs(csv.fishing.fish) do
			if slot7.bookId ~= 0 then
				-- Nothing
			end
		end

		uv3 = "csvPairs"

		slot3.itemDatas:update({
			[slot6] = {
				key = slot6,
				name = slot7.name,
				point = slot7.point,
				needLv = slot7.needLv,
				desc = slot7.desc,
				rare = slot7.rare,
				bookId = slot7.bookId,
				counter = slot1[slot6] and slot1[slot6].counter or 0,
				bigCounter = slot1[slot6] and slot1[slot6].big_counter or 0,
				lenghtMax = slot1[slot6] and slot1[slot6].length_max or 0
			}
		})
	end)
	slot0.selectItem:addListener(function (slot0, slot1)
		uv2 = "itemDatas"

		if slot2.itemDatas:atproxy(slot0) then
			uv3 = "itemDatas"
			slot3 = slot3.selectEffect
			slot2.selectEffect = slot3
			uv3 = "itemDatas"

			slot3:resetShowPanel(slot2)
		end
	end)
	Dialog.onCreate(slot0)
end

function slot0.resetShowPanel(slot0, slot1)
	bind.extend(slot0, slot0.right, {
		class = "fish_icon",
		props = {
			data = {
				key = slot1.key
			},
			onNode = function (slot0)
				slot4 = 0.5
				uv4 = "align"
				slot4 = slot4.right:get("icon")
				slot5 = slot4
				uv5 = "align"

				slot0:align(cc.p(slot4, 0.5), slot4.x(slot5) - 20, slot5.right:get("icon"):y() - 15):scale(1.4)
			end
		}
	})
	slot0.right:get("name"):text(slot1.name)
	slot0.right:get("quality"):text(({
		gLanguageCsv.lowFish,
		gLanguageCsv.middleFish,
		gLanguageCsv.highFish
	})[slot1.rare])
	slot0.right:get("point1"):text(slot1.point)
	adapt.oneLinePos(slot0.right:get("point"), slot0.right:get("point1"), cc.p(15, 0), "left")
	slot0.right:get("level1"):text(slot1.needLv)
	adapt.oneLinePos(slot0.right:get("level"), slot0.right:get("level1"), cc.p(20, 0), "left")
	beauty.textScroll({
		isRich = true,
		list = slot0.right:get("list"),
		strs = "#C0x5B545B#" .. slot1.desc
	})
	slot0.right:get("totalNum"):text(string.format(gLanguageCsv.fishCounter, slot1.counter))
	slot0.right:get("bigFishNum"):text(string.format(gLanguageCsv.bigFishCounter, slot1.bigCounter))
	slot0.right:get("maxNum"):text(string.format(gLanguageCsv.fishLenghtMax, slot1.lenghtMax))
end

function slot0.onItemClick(slot0, slot1, slot2)
	slot0.selectItem:set(slot2.key)
end

function slot0.initModel(slot0)
	slot0.fish = gGameModel.fishing:getIdler("fish")
end

return slot0
