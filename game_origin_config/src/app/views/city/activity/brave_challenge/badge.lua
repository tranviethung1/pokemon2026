slot0 = {
	mine = 1,
	enemy = 2
}
slot1 = {
	forever = 3,
	rare = 2,
	normal = 1
}
slot2 = {
	"activity/brave_challenge/box_yztz_18.png",
	"activity/brave_challenge/box_yztz_17.png",
	"activity/brave_challenge/box_yztz_21.png"
}
slot3 = 8

function slot4(slot0, slot1, slot2, slot3)
	slot1:size(1900, 100)
	slot1:get("list"):hide()
	slot1:get("noItem"):hide()
	slot1:get("title"):y(50):show()

	slot4 = slot1:get("title.txt")
	slot7 = "title.bg"
	uv7 = "size"

	if slot3.data == slot7.rare then
		slot4:text(gLanguageCsv.braveChallengeRareBadge)
		slot1:get(slot7):texture("activity/brave_challenge/box_yztz_13.png")
		text.addEffect(slot4, {
			color = cc.c3b(253, 252, 159)
		})
		text.addEffect(slot4, {
			outline = {
				size = 4,
				color = cc.c4b(244, 144, 15, 255)
			}
		})
	else
		slot4:text(gLanguageCsv.braveChallengeNormalBadge)
		slot5:texture("activity/brave_challenge/box_yztz_14.png")
		text.addEffect(slot4, {
			color = cc.c3b(255, 251, 232)
		})
	end
end

function slot5(slot0, slot1, slot2, slot3)
	slot1:size(1900, 230)
	slot1:get("list"):hide()
	slot1:get("title"):hide()
	slot1:get("noItem"):y(115):show()
end

function slot6(slot0, slot1, slot2, slot3)
	slot1:get("title"):hide()
	slot1:get("noItem"):hide()
	slot1:size(cc.size(1900, 230))
	bind.extend(slot0, slot1:get("list"):y(0), {
		class = "listview",
		props = {
			data = slot3,
			item = slot0.spriteItem,
			onItem = function (slot0, slot1, slot2, slot3)
				slot7 = "icon"
				slot4 = slot1:multiget("select", slot7, "bg")
				uv7 = "multiget"

				slot4.bg:texture(slot7[slot3.rarity])
				slot4.icon:texture(slot3.res)
				slot4.select:visible(slot3.select)

				uv11 = "select"

				bind.touch(slot0, slot1, {
					methods = {
						ended = functools.partial(slot11.itemClick, slot0, slot1, slot3)
					}
				})
			end
		}
	})
	slot1:get("list"):setItemAlignCenter()
end

slot8 = class("BraveChallengeBadgeView", cc.load("mvc").ViewBase)
slot8.RESOURCE_FILENAME = "activity_brave_challenge_badge.json"
slot8.RESOURCE_BINDING = {
	noItem = "noItem",
	item = "item",
	titile = "titile",
	tip = "tip",
	iconPanel = "spriteItem",
	imgBg = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showDatas"),
				item = bindHelper.self("item"),
				spriteItem = bindHelper.self("spriteItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.type == "title" then
						uv4 = "type"

						slot4(slot0, slot1, slot2, slot3)
					elseif slot3.type == "noItem" then
						uv4 = "title"

						slot4(slot0, slot1, slot2, slot3)
					else
						uv4 = "noItem"

						slot4(slot0, slot1, slot2, slot3)
					end
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	}
}
slot8.RESOURCE_STYLES = {
	clickClose = true,
	blackLayer = true
}

function slot8.onCreate(slot0, slot1, slot2)
	slot3 = {}
	slot0.showDatas = slot3
	uv3 = "showDatas"

	if slot2 == slot3.mine then
		slot0.titile:texture("activity/brave_challenge/txt_yztz_5.png")
	else
		uv3 = "showDatas"

		if slot2 == slot3.enemy then
			slot0.titile:texture("activity/brave_challenge/txt_yztz_4.png")
		end
	end

	slot0.tip:text(gLanguageCsv.braveChallengeBadgeTip)
	slot0:initPanel(slot1)
end

function slot8.initPanel(slot0, slot1)
	slot2 = csv.brave_challenge.badge
	slot3 = {
		[slot4] = {},
		[slot4.normal] = {}
	}
	uv4 = "csv"
	slot4 = slot4.rare
	uv4 = "csv"

	for slot7, slot8 in ipairs(slot1) do
		if slot2[slot8] then
			uv10 = "csv"

			if slot10.rare < slot2[slot8].rarity then
				uv9 = "csv"

				if not slot9.rare then
					slot9 = slot2[slot8].rarity
				end
			end

			table.insert(slot3[slot9], {
				select = false,
				name = slot2[slot8].name,
				desc = slot2[slot8].desc,
				res = slot2[slot8].iconResPath,
				rarity = slot2[slot8].rarity
			})
		end
	end

	slot4 = 1

	for slot8 = itertools.size(slot3), 1, -1 do
		if itertools.size(slot3[slot8]) == 0 then
			slot0.showDatas[slot4] = {
				type = "title",
				data = slot8
			}
			slot4 = slot4 + 1
			slot0.showDatas[slot4] = {
				type = "noItem",
				data = slot8
			}
			slot4 = slot4 + 1
		else
			slot0.showDatas[slot4] = {
				type = "title",
				data = slot8
			}

			table.sort(slot9, function (slot0, slot1)
				return slot1.rarity < slot0.rarity
			end)

			for slot14, slot15 in ipairs(slot9) do
				uv17 = "brave_challenge"
				slot16 = math.ceil(slot14 / slot17)
				uv18 = "brave_challenge"
				slot0.showDatas[slot16 + slot4] = slot0.showDatas[slot16 + slot4] or {}
				slot0.showDatas[slot16 + slot4][(slot14 - 1) % slot18 + 1] = slot15
				slot10 = 0 + 1
			end

			uv12 = "brave_challenge"
			slot4 = math.ceil(slot10 / slot12) + slot4 + 1
		end
	end
end

function slot8.onItemClick(slot0, slot1, slot2, slot3, slot4)
	gGameUI:showItemDetailCustom(slot3, slot4, "city.activity.brave_challenge.badge_detail", {
		tipParams = {
			dir = "right"
		}
	})
end

return slot8
