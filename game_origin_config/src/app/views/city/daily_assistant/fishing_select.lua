slot0 = class("FishingSelectView", Dialog)
slot0.RESOURCE_FILENAME = "daily_assistant_fishing_select.json"
slot0.RESOURCE_BINDING = {
	subList = "subList",
	item = "item",
	["title.btnClose"] = {
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
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("itemDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("imgSelect", "pos", "maskPanel", "title")

					slot4.imgSelect:visible(slot3.selected)
					slot4.title:text(slot3.name)
					slot4.maskPanel:visible(slot3.myLv < slot3.needLv or slot3.lock == 0)
					slot4.pos:removeAllChildren()

					slot6 = ccui.Scale9Sprite:create()

					slot6:initWithFile(cc.rect(50, 50, 1, 1), "city/adventure/fishing/mask_dy_bgpre.png")
					slot6:size(cc.size(770, 410))
					widget.addAnimationByKey(cc.ClippingNode:create(slot6):setAlphaThreshold(0.1):addTo(slot4.pos, 1, "clippingNode"), slot3.res, "diaoyuBg", "effect_loop", 1):scale(0.6)
					bind.click(slot0, slot1, {
						method = functools.partial(slot0.itemClick, slot2, slot3)
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	btnBag = {
		varname = "btnBag",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnBagClick")
			}
		}
	}
}

function slot0.onCreate(slot0)
	Dialog.onCreate(slot0)
	slot0:initModel()

	for slot5, slot6 in csvPairs(csv.fishing.scene) do
		if slot6.type == 1 then
			-- Nothing
		end
	end

	slot0.itemDatas = idlers.newWithMap({
		[slot5] = {
			selected = false,
			sort = 0,
			csvId = slot5,
			name = slot6.name,
			res = slot6.res,
			needLv = slot6.needLv,
			lock = slot6.lock,
			myLv = slot0.fishLevel:read()
		}
	})
	slot0.selectScene = idler.new((slot0.fishingSelectScene:read() == 0 or slot0.fishingSelectScene:read() == 999) and 1 or slot0.fishingSelectScene:read())

	slot0.selectScene:addListener(function (slot0, slot1)
		if slot0 == nil then
			return
		end

		if slot1 then
			uv2 = "itemDatas"

			if slot2.itemDatas:atproxy(slot1) then
				uv2 = "itemDatas"
				slot2.itemDatas:atproxy(slot1).selected = false
			end
		end

		uv2 = "itemDatas"
		slot2.itemDatas:atproxy(slot0).selected = true

		gGameApp:requestServer("/game/fishing/prepare", function (slot0)
		end, "scene", slot0)
	end)
end

function slot0.initBgMask(slot0)
	slot0.mask1 = ccui.Scale9Sprite:create()

	slot0.mask1:initWithFile(cc.rect(50, 50, 1, 1), "city/adventure/fishing/mask_dy_bgpre.png")
	slot0.mask1:size(cc.size(1858, 888))

	slot1 = cc.ClippingNode:create(slot0.mask1):setAlphaThreshold(0.1):addTo(slot0.scenePanel:get("pos"), 1, "clippingNode")
end

function slot0.onItemClick(slot0, slot1, slot2, slot3)
	if slot3.lock == 0 then
		gGameUI:showTip(gLanguageCsv.pleaseWaitOpen)

		return
	end

	if slot3.myLv < slot3.needLv then
		gGameUI:showTip(string.format(gLanguageCsv.fishingLvNotEnoughEnterScene, slot3.needLv))

		return
	end

	slot0.selectScene:set(slot3.csvId)
end

function slot0.onBtnBagClick(slot0)
	gGameUI:stackUI("city.adventure.fishing.bag", nil, , 1, slot0.selectScene:read())
end

function slot0.initModel(slot0)
	slot0.fishingSelectScene = gGameModel.fishing:getIdler("select_scene")
	slot0.fishLevel = gGameModel.fishing:getIdler("level")
end

return slot0
