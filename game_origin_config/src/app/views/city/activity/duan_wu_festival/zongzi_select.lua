slot0 = cc.load("mvc").ViewBase
slot1 = class("ZongziSelectView", Dialog)
slot2 = {
	[6358] = "effect_baoyu",
	[6362] = "effect_mizao",
	[6363] = "effect_mizao",
	[6360] = "effect_rou",
	[6361] = "effect_rou",
	[6359] = "effect_shuangpin"
}
slot1.RESOURCE_FILENAME = "activity_zongzi_select.json"
slot1.RESOURCE_BINDING = {
	imgBg1 = "imgBg1",
	item = "item",
	rightBg = "rightBg",
	["sliderPanel.slider"] = "slider",
	["open.textNum"] = "textNum",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnOpen = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOpen")
			}
		}
	},
	["btnSell.textNote"] = {
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
			class = "listview",
			props = {
				data = bindHelper.self("itemDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1:get("panel"), {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key,
								num = slot3.num
							},
							onNode = function (slot0)
								uv2 = "bind"
								uv6 = "bind"
								uv8 = "click"
								uv9 = "functools"

								bind.click(slot2, slot0, {
									method = functools.partial(slot6.itemClick, slot0, slot8, slot9)
								})
							end
						}
					})
					slot1:removeChildByName("label")
					text.addEffect(beauty.singleTextLimitWord(dataEasy.getCfgByKey(slot3.key).name, {
						fontSize = 40
					}, {
						width = 240
					}):xy(125, 26):addTo(slot1, 2, "label"), {
						color = ui.COLORS.NORMAL.DEFAULT
					})
					slot1:get("choose"):visible(slot3.isSel)
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
	["sliderPanel.subBtn"] = {
		varname = "sliderSubBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -1)
			end)
		}
	},
	["sliderPanel.addBtn"] = {
		varname = "sliderAddBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 1)
			end)
		}
	}
}

function slot1.initModel(slot0)
	slot0.itemModels = gGameModel.role:getIdler("items")
	slot0.choose = idler.new(1)
	slot0.itemDatas = idlers.new()
	slot0.num = idler.new(1)
	slot0.maxNum = 0
end

function slot1.onCreate(slot0)
	slot0:initModel()
	slot0:enableSchedule()
	slot0.list:y(670)
	idlereasy.when(slot0.itemModels, function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in pairs(slot1) do
			if slot6 >= 6358 and slot6 <= 6363 then
				table.insert(slot2, {
					isSel = false,
					key = slot6,
					num = slot7,
					quality = csv.items[slot6].quality
				})
			end
		end

		if #slot2 > 0 then
			uv3 = "pairs"

			slot3.imgBg1:hide()

			slot3 = table.sort

			slot3(slot2, function (slot0, slot1)
				return slot1.quality < slot0.quality
			end)

			uv3 = "pairs"

			if slot2[slot3.choose:read()] then
				uv5 = "pairs"

				if slot2[slot3].key ~= slot5.lastChooseKey then
					slot3 = 1
				end
			end

			uv4 = "pairs"

			slot4.choose:set(slot3)

			slot4 = slot2[slot3]
			slot4.isSel = true
			uv4 = "pairs"
			slot4 = slot4.itemDatas
			slot4 = slot4.update

			slot4(slot4, slot2)

			uv4 = "pairs"
			slot4.maxNum = slot2[slot3].num
			uv4 = "pairs"
			slot4 = slot4.num
			slot4 = slot4.modify

			function slot6(slot0)
				uv2 = "maxNum"

				return true, slot2.maxNum
			end

			slot4(slot4, slot6, true)

			uv4 = "pairs"
			uv6 = "pairs"
			uv8 = "pairs"

			slot4.textNum:text(slot6.num:read() .. "/" .. slot8.maxNum)
		else
			uv3 = "pairs"

			slot3.imgBg1:show()
		end

		uv4 = "pairs"
		slot4 = slot4.rightBg
		slot4 = slot4.visible

		slot4(slot4, #slot2 > 5)

		uv4 = "pairs"

		slot4.list:onScroll(function (slot0)
			uv1 = "list"
			slot1 = slot1.list
			slot2 = slot1
			uv3 = "list"
			uv2 = "list"
			slot2 = slot2.rightBg
			slot2 = slot2.visible

			if slot1.getIndex(slot2, slot2.list:getRightmostItemInCurrentView()) == 4 then
				uv4 = "getIndex"

				if slot4 ~= 6 then
					slot4 = false
				else
					slot4 = true
				end
			end

			slot2(slot3, slot4)
		end)
	end)
	slot0.choose:addListener(function (slot0, slot1)
		uv2 = "itemDatas"

		if slot2.itemDatas:atproxy(slot1) then
			uv2 = "itemDatas"
			slot2.itemDatas:atproxy(slot1).isSel = false
		end

		uv2 = "itemDatas"

		if slot2.itemDatas:atproxy(slot0) then
			uv2 = "itemDatas"
			slot2 = slot2.itemDatas:atproxy(slot0)
			slot3 = true
			slot2.isSel = slot3
			uv2 = "itemDatas"
			uv3 = "itemDatas"
			slot2.maxNum = slot3.itemDatas:atproxy(slot0).num
		end

		uv2 = "itemDatas"
		slot2 = slot2.num
		slot2 = slot2.modify

		function slot4(slot0)
			uv2 = "maxNum"

			return true, slot2.maxNum
		end

		slot2(slot2, slot4, true)

		uv2 = "itemDatas"
		slot2 = slot2.textNum
		slot2 = slot2.text
		uv4 = "itemDatas"
		uv6 = "itemDatas"

		slot2(slot2, slot4.num:read() .. "/" .. slot6.maxNum)

		uv2 = "itemDatas"

		if not slot2.slider:isHighlighted() then
			uv2 = "itemDatas"
			slot2 = slot2.num
			slot3 = slot2
			uv3 = "itemDatas"
			slot3 = slot3.maxNum
			uv3 = "itemDatas"

			slot3.slider:setPercent(slot2.read(slot3) / slot3 * 100)
		end
	end)
	slot0.slider:setPercent(0)
	idlereasy.when(slot0.num, function (slot0, slot1)
		uv2 = "sliderSubBtn"
		slot2 = slot2.sliderSubBtn
		slot2 = slot2.setTouchEnabled
		slot4 = slot1 > 1

		slot2(slot2, slot4)

		uv2 = "sliderSubBtn"
		slot2 = slot2.sliderAddBtn
		slot3 = slot2
		uv4 = "sliderSubBtn"

		slot2.setTouchEnabled(slot3, slot1 < slot4.maxNum)

		uv3 = "sliderSubBtn"
		slot3 = slot3.sliderSubBtn
		slot5 = slot1 > 1 and "normal" or "hsl_gray"

		cache.setShader(slot3, false, slot5)

		uv3 = "sliderSubBtn"
		uv5 = "sliderSubBtn"

		cache.setShader(slot3.sliderAddBtn, false, slot1 < slot5.maxNum and "normal" or "hsl_gray")

		if slot1 > 1 then
			uv2 = "sliderSubBtn"

			if slot2.maxNum <= slot1 then
				uv2 = "sliderSubBtn"

				slot2:unScheduleAll()
			end
		end

		uv2 = "sliderSubBtn"
		slot2 = slot2.textNum
		slot2 = slot2.text
		uv6 = "sliderSubBtn"

		slot2(slot2, slot1 .. "/" .. slot6.maxNum)

		uv2 = "sliderSubBtn"

		if not slot2.slider:isHighlighted() then
			uv2 = "sliderSubBtn"
			uv3 = "sliderSubBtn"

			slot3.slider:setPercent(slot1 / slot2.maxNum * 100)
		end
	end)
	slot0.slider:addEventListener(function (slot0, slot1)
		uv2 = "unScheduleAll"

		slot2:unScheduleAll()

		uv5 = "unScheduleAll"
		slot4 = math.ceil(slot5.maxNum * slot0:getPercent() * 0.01)
		uv6 = "unScheduleAll"
		uv4 = "unScheduleAll"

		slot4.num:set(cc.clampf(slot4, 1, slot6.maxNum))
	end)
	Dialog.onCreate(slot0)
end

function slot1.onOpen(slot0)
	gGameApp:requestServerCustom("/game/role/item/use"):params({
		[slot0.itemDatas:atproxy(slot0.choose:read()).key] = slot0.num:read()
	}):onResponse(function (slot0)
		uv1 = "lastChooseKey"
		uv2 = "animaBa"
		slot1.lastChooseKey = slot2
		uv1 = "lastChooseKey"
		uv3 = "lastChooseKey"
		uv5 = "widget"
		uv6 = "animaBa"
		slot2 = widget.addAnimation(slot3, "duanwuzongzi/chizongzi.skel", slot5[slot6], 1):xy(cc.p(1280, 720)):scale(3)
		slot1.animaBa = slot2
		uv2 = "lastChooseKey"

		performWithDelay(slot2, function ()
			uv0 = "animaBa"
			slot0[1] = true
			uv0 = "removeFromParent"
			slot0 = slot0.animaBa
			slot0 = slot0.removeFromParent

			slot0(slot0)

			uv0 = "removeFromParent"
			slot0.animaBa = nil
			uv2 = "gGameUI"

			gGameUI:showGainDisplay(slot2)
		end, 4)
	end):wait({
		false
	}):doit(function (slot0)
	end)
end

function slot1.onItemClick(slot0, slot1, slot2, slot3, slot4)
	if slot0.choose:read() ~= slot3 then
		slot0.choose:set(slot3)
	else
		gGameUI:showItemDetail(slot2, slot4)
	end
end

function slot1.onIncreaseNum(slot0, slot1)
	slot0.num:modify(function (slot0)
		uv3 = "cc"
		uv5 = "clampf"

		return true, cc.clampf(slot0 + slot3, 1, slot5.maxNum)
	end)
end

function slot1.onChangeNum(slot0, slot1, slot2, slot3)
	if slot2.name == "click" then
		slot0:unScheduleAll()
		slot0:onIncreaseNum(slot3)
	elseif slot2.name == "began" then
		slot0:schedule(function ()
			uv0 = "onIncreaseNum"
			uv2 = "onIncreaseNum"

			slot0:onIncreaseNum(slot2)
		end, 0.05, 0, 100)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot0:unScheduleAll()
	end
end

return slot1
