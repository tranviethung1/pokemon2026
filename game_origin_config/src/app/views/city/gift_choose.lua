slot0 = cc.load("mvc").ViewBase
slot1 = class("GiftChooseView", Dialog)
slot1.RESOURCE_FILENAME = "gift_choose.json"
slot1.RESOURCE_BINDING = {
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

					slot4 = {}

					text.addEffect(beauty.singleTextLimitWord(((slot3.key ~= "card" or csv.unit[csv.cards[slot3.num].unitID]) and dataEasy.getCfgByKey(slot3.key)).name, {
						fontSize = 40
					}, {
						width = 240
					}):xy(125, 26):addTo(slot1, 2, "label"), {
						color = ui.COLORS.NORMAL.DEFAULT
					})
					slot1:get("choose"):visible(slot3.isSel)
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

function slot1.onCreate(slot0, slot1, slot2, slot3)
	slot0.itemDatasId = slot1
	slot0.itemDatas = idlers.new()

	slot0:enableSchedule()

	slot4 = {}
	slot6 = 0

	for slot10, slot11 in csvMapPairs(dataEasy.getCfgByKey(slot1).specialArgsMap) do
		if not slot11.card then
			for slot15, slot16 in csvMapPairs(slot11) do
				table.insert(slot4, {
					isSel = false,
					key = slot15,
					num = slot16,
					choose = slot10
				})
			end
		end

		if slot11.card then
			for slot15, slot16 in csvMapPairs(slot11.card) do
				table.insert(slot4, {
					isSel = false,
					key = "card",
					num = slot16,
					choose = slot10
				})
			end
		end

		slot6 = slot6 + 1
	end

	if slot6 <= 5 then
		slot0.rightBg:hide()
	end

	table.sort(slot4, dataEasy.sortItemCmp)
	slot0.itemDatas:update(slot4)

	slot0.choose = idler.new(1)

	slot0.choose:addListener(function (slot0, slot1)
		uv2 = "itemDatas"

		if slot2.itemDatas:atproxy(slot1) then
			uv2 = "itemDatas"
			slot2.itemDatas:atproxy(slot1).isSel = false
		end

		uv2 = "itemDatas"
		slot4 = slot0
		slot2 = slot2.itemDatas:atproxy(slot4)
		slot2.isSel = true
		uv2 = "itemDatas"
		uv4 = "atproxy"
		slot4 = slot4[slot0].key
		uv4 = "atproxy"
		slot2.params = {
			key = slot4,
			num = slot4[slot0].num
		}
	end)

	slot0.cb = slot3

	slot0.slider:setPercent(0.5 * 100)

	slot0.num = slot2.num and slot2.num() or idler.new(1)
	slot0.maxNum = slot2.maxNum or 1

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

		slot2 = cache.setShader
		uv3 = "sliderSubBtn"
		slot4 = false
		uv5 = "sliderSubBtn"

		slot2(slot3.sliderAddBtn, slot4, slot1 < slot5.maxNum and "normal" or "hsl_gray")

		uv2 = "sliderSubBtn"
		slot2 = slot2.textNum
		slot2 = slot2.text
		uv4 = "sliderSubBtn"
		uv6 = "sliderSubBtn"

		slot2(slot2, slot4.num:read() .. "/" .. slot6.maxNum)

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

	slot9 = #slot4
	slot10, slot11 = slot0.list:xy()

	slot0.list:size(slot0.list:width() < slot0.item:size().width * slot9 + (slot9 - 1) * slot0.list:getItemsMargin() and slot8 or slot0.item:size().width * slot9 + (slot9 - 1) * slot13, slot12.height)
	slot0.list:anchorPoint(0.5, 0.5)
	slot0.list:xy(display.sizeInView.width / 2, slot11 + slot0.list:size().height / 2)
	slot0.list:onScroll(function (slot0)
		uv1 = "list"
		slot1 = slot1.list
		slot2 = slot1
		uv3 = "list"
		uv2 = "list"
		slot2 = slot2.rightBg
		slot3 = slot2
		uv5 = "getIndex"

		slot2.visible(slot3, slot1.getIndex(slot2, slot3.list:getRightmostItemInCurrentView()) + 1 < slot5)
	end)
	Dialog.onCreate(slot0)
end

function slot1.onOpen(slot0)
	slot1 = slot0.num:read()
	slot2 = slot0.itemDatas:atproxy(slot0.choose:read()).choose
	slot4 = slot0.params.num

	if slot4 > 1 and slot3 ~= "card" and slot3 ~= "explore" then
		slot5 = gLanguageCsv.symbolBracketLeft .. uiEasy.setIconName(slot0.params.key, slot4) .. "x" .. slot4 .. gLanguageCsv.symbolBracketRight
	end

	gGameUI:showDialog({
		btnType = 2,
		isRich = true,
		strs = {
			string.format(gLanguageCsv.sureProp, slot5, slot1)
		},
		cb = function ()
			uv0 = "addCallbackOnExit"
			slot1 = slot0
			slot0 = slot0.addCallbackOnExit
			uv3 = "addCallbackOnExit"
			uv4 = "functools"
			uv5 = "partial"

			slot0(slot1, functools.partial(slot3.cb, slot4, slot5))

			uv0 = "cb"
			uv1 = "addCallbackOnExit"

			slot0.onClose(slot1)
		end
	})
end

function slot1.onItemClick(slot0, slot1, slot2, slot3, slot4)
	if slot0.choose:read() ~= slot3 then
		slot0.choose:set(slot3)
	else
		gGameUI:showItemDetail(slot2, slot0.params)
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
