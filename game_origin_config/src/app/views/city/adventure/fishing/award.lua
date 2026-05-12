slot0 = require("app.views.city.adventure.fishing.tools")
slot2 = class("FishingAwardView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "fishing_award.json"
slot2.RESOURCE_BINDING = {
	point = "point",
	award = "award",
	fishItem = "fishItem",
	list = "list",
	fishList = "fishList"
}

function slot2.onCreate(slot0, slot1, slot2, slot3)
	slot0:initSkel()
	slot0:initModel()
	slot0.list:setScrollBarEnabled(false)
	slot0.fishList:setScrollBarEnabled(false)

	slot4 = 0

	if slot2 == game.FISHING_GAME then
		for slot8, slot9 in pairs(slot1.fish) do
			slot4 = slot4 + csv.fishing.fish[slot8].point * slot9
		end
	end

	slot0.point:get("txt2"):text(slot1.win + slot1.fail)
	slot0.point:get("txt4"):text(slot1.win)
	slot0.point:get("txt6"):text(slot1.fail)
	slot0.point:get("txt8"):text(slot4)

	slot10 = 0

	adapt.oneLinePos(slot0.point:get("txt1"), {
		slot0.point:get("txt2"),
		slot0.point:get("txt3"),
		slot0.point:get("txt4"),
		slot0.point:get("txt5"),
		slot0.point:get("txt6"),
		slot0.point:get("txt7"),
		slot0.point:get("txt8"),
		slot0.point:get("txt9")
	}, cc.p(5, slot10), "left")
	idlereasy.any({
		slot0.fishLevel,
		slot0.fishCounter,
		slot0.targetCounter
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "point"
		slot4 = slot4.point:get("lv")
		slot4 = slot4.text

		slot4(slot4, string.format(gLanguageCsv.fishingLv, slot1))

		uv4 = "get"
		slot4, slot5 = slot4.getExp(slot1, slot2, slot3)

		if slot1 == table.length(csv.fishing.level) then
			uv6 = "point"
			slot6 = slot6.point:get("num1")
			slot6 = slot6.text

			slot6(slot6, "Max")

			uv6 = "point"
			slot6 = slot6.point:get("num2")
			slot6 = slot6.hide

			slot6(slot6)

			uv6 = "point"

			slot6.point:get("bar"):setPercent(100)
		else
			uv6 = "point"
			slot6 = slot6.point:get("num1")
			slot6 = slot6.text

			slot6(slot6, slot4)

			uv6 = "point"
			slot6 = slot6.point:get("num2")
			slot6 = slot6.text

			slot6(slot6, "/" .. slot5)

			uv6 = "point"

			slot6.point:get("bar"):setPercent(cc.clampf(100 * slot4 / slot5, 0, 100))
		end

		uv7 = "point"
		slot7 = slot7.point
		slot8 = slot7
		slot7 = slot7.get(slot8, "lv")
		uv8 = "point"

		adapt.oneLinePos(slot7, slot8.point:get("barBg"), cc.p(15, 0), "left")

		uv7 = "point"
		slot7 = slot7.point
		slot8 = slot7
		slot7 = slot7.get(slot8, "lv")
		uv8 = "point"

		adapt.oneLinePos(slot7, slot8.point:get("bar"), cc.p(15, 0), "left")

		uv7 = "point"
		slot7 = slot7.point
		slot8 = slot7
		slot7 = slot7.get(slot8, "bar")
		uv8 = "point"

		adapt.oneLinePos(slot7, slot8.point:get("num1"), cc.p(15, 0), "left")

		uv7 = "point"
		slot7 = slot7.point
		slot8 = slot7
		uv8 = "point"

		adapt.oneLinePos(slot7.get(slot8, "num1"), slot8.point:get("num2"), cc.p(0, 0), "left")
	end)
	slot0.point:removeFromParent()
	slot0.list:pushBackCustomItem(slot0.point)

	slot5 = nil
	slot6 = 1

	for slot10, slot11 in pairs(slot1.fish) do
		if slot6 % 6 == 1 then
			slot5 = slot0.fishList:clone()

			slot5:show()
			slot0.list:pushBackCustomItem(slot5)
		end

		slot12 = slot0.fishItem:clone():show()

		bind.extend(slot0, slot12, {
			class = "fish_icon",
			props = {
				onNodeClick = true,
				data = {
					key = slot10,
					num = slot11
				},
				onNode = function (slot0)
					slot0:xy(10, 10)
				end
			}
		})
		slot5:pushBackCustomItem(slot12)

		slot6 = slot6 + 1
	end

	slot0.award:removeFromParent()
	slot0.list:pushBackCustomItem(slot0.award)

	slot7 = nil
	slot8 = {}

	for slot12, slot13 in pairs(slot1.award) do
		if slot12 == "cards" then
			for slot17, slot18 in pairs(slot1.award.cards) do
				table.insert(slot8, {
					key = "id",
					val = slot18.id
				})
			end
		elseif slot12 ~= "cards" and slot12 ~= "carddbIDs" and slot12 ~= "card2mailL" then
			table.insert(slot8, {
				key = slot12,
				val = slot13
			})
		end
	end

	slot6 = 1

	for slot12, slot13 in pairs(slot8) do
		if slot6 % 6 == 1 then
			slot7 = slot0.fishList:clone()

			slot7:show()
			slot0.list:pushBackCustomItem(slot7)
		end

		if slot13.key == "id" then
			slot15 = csv.cards[slot13.val].unitID

			bind.extend(slot0, slot0.fishItem:clone():show(), {
				class = "card_icon",
				props = {
					unitId = slot15,
					rarity = csv.unit[slot15].rarity,
					star = csv.cards[slot13.val].star,
					onNodeClick = function (slot0)
						uv1 = "onitemClick"
						uv4 = "val"

						slot1:onitemClick(slot0, slot4.val)
					end
				}
			})
		else
			bind.extend(slot0, slot14, {
				class = "icon_key",
				props = {
					data = {
						key = slot13.key,
						num = slot13.val
					}
				}
			})
		end

		slot7:pushBackCustomItem(slot14)

		slot6 = slot6 + 1
	end

	if slot3 < slot0.fishLevel:read() then
		gGameUI:stackUI("city.adventure.fishing.upgrade")
	end
end

function slot2.initSkel(slot0)
	slot1 = slot0:getResourceNode()

	widget.addAnimationByKey(slot1, "effect/gongxihuode.skel", "gongxihuode", "effect", 10):anchorPoint(cc.p(0.5, 0.5)):xy(slot1:width() / 2, slot1:height() - 300):addPlay("effect_loop")
end

function slot2.initModel(slot0)
	slot0.fishLevel = gGameModel.fishing:getIdler("level")
	slot0.fishCounter = gGameModel.fishing:getIdler("fish_counter")
	slot0.targetCounter = gGameModel.fishing:getIdler("target_counter")
end

function slot2.onitemClick(slot0, slot1, slot2)
	gGameUI:showItemDetail(slot1, {
		key = "card",
		num = slot2
	})
end

return slot2
