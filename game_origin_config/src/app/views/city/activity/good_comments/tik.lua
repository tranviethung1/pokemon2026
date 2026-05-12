slot0 = {
	cn = {
		{
			link = "https://www.tiktok.com/@megamon_redfox",
			res = "tiktok.png"
		}
	},
	tw = {
		{
			link = "https://www.facebook.com/megamonglb",
			res = "youtube.png"
		},
		{
			link = "https://www.facebook.com/megamonglb",
			res = "facebook.png"
		},
		{
			link = "https://www.facebook.com/groups/megamonasian",
			res = "facebook_group.png"
		}
	},
	en_us = {
		{
			link = "https://www.facebook.com/megamonglb",
			res = "instagram.png"
		},
		{
			link = "https://www.facebook.com/megamonglb",
			res = "facebook.png"
		},
		{
			link = "https://www.facebook.com/groups/megamonasian",
			res = "youtube.png"
		},
		{
			link = "https://www.tiktok.com/@megamon_redfox",
			res = "tiktok.png"
		},
		{
			link = "https://discord.com/invite/DVmQR7nNZ8",
			res = "discord.png"
		},
		{
			link = "https://www.facebook.com/groups/megamonasian",
			res = "facebook_group.png"
		}
	}
}
slot1 = game.YYHUODONG_TYPE_ENUM_TABLE
slot2 = cc.load("mvc").ViewBase
slot3 = class("ActivityTik", Dialog)
slot5 = true
slot5 = userDefault.getForeverLocalKey("tiktokget", "", {
	rawKey = false
}) ~= true
slot3.RESOURCE_FILENAME = "activity_tiktok.json"
slot3.RESOURCE_BINDING = {
	bgIcon = "bgIcon",
	itemIcon = "itemIcon",
	list = "list",
	claimed = "claimed",
	listIcon = "listIcon",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot2 = userDefault.getForeverLocalKey("tiktokget", "", {
		rawKey = false
	})

	Dialog.onCreate(slot0, {
		blackType = 1
	})
	userDefault.setCurrDayKey("tiktokClick", true)

	slot0.isGain = false
	slot0.yyID = slot1
	slot0.award = csv.yunying.yyhuodong[slot1].paramMap.award

	for slot7, slot8 in csvPairs(csv.yunying.praise_tag) do
		if slot8.tag == "us_tiktok" then
			slot0.url = slot8.url

			break
		end
	end

	if gGameModel.role:getIdler("yyhuodongs"):read()[slot0.yyID] and slot5.info and slot5.info.us_tiktok or slot2 == true then
		slot0.isGain = true
	end

	slot0.claimed:visible(slot0.isGain)
	uiEasy.createItemsToList(slot0, slot0.list, slot0.award, {
		onAfterBuild = function ()
			uv0 = "list"

			slot0.list:setItemAlignCenter()
		end
	})

	slot6 = slot0.itemIcon
	slot6 = slot6.hide

	slot6(slot6)

	uv6 = "userDefault"

	if not slot6[LOCAL_LANGUAGE] then
		uv6 = "userDefault"
		slot6 = slot6.en_us
	end

	slot7 = itertools.size(slot6)

	slot0.bgIcon:width(math.max(slot0.itemIcon:width() * slot7 + slot0.listIcon:getItemsMargin() * (slot7 - 1) + 80, 400))
	bind.extend(slot0, slot0.bgIcon, {
		class = "red_hint",
		props = {
			specialTag = "tiktok",
			listenData = {
				activityId = slot0.yyID
			}
		}
	})
	bind.extend(slot0, slot0.listIcon, {
		class = "listview",
		props = {
			data = slot6,
			item = slot0.itemIcon,
			onAfterBuild = function (slot0)
				slot0:setItemAlignCenter()
			end,
			onItem = function (slot0, slot1, slot2, slot3)
				slot1:get("icon"):texture("activity/tiktok/icon/" .. slot3.res)
				bind.touch(slot0, slot1, {
					methods = {
						ended = function ()
							uv0 = "onGoClick"
							uv2 = "onGoClick"

							slot0:onGoClick(slot2)
						end
					}
				})
			end
		}
	})
end

function slot3.onGoClick(slot0, slot1)
	cc.Application:getInstance():openURL(slot1.link)

	if slot0.isGain then
		return
	end

	gGameApp:requestServer("/game/gift", function (slot0)
		uv1 = "isGain"
		slot1.isGain = true
		slot1 = userDefault.setForeverLocalKey

		slot1("tiktokget", true)

		uv1 = "isGain"

		slot1.claimed:show()
		gGameUI:showGainDisplay(slot0.view.award)
	end, "TIKTOKCODE")
end

return slot3
