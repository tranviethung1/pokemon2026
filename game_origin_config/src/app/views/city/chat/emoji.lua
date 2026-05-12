slot0 = 10
slot1 = class("ChatEmojiView", Dialog)
slot1.RESOURCE_FILENAME = "chat_emoji.json"
slot1.RESOURCE_BINDING = {
	dot = "dot",
	pagePanel = "pagePanel",
	btnItem = "btnItem",
	bg1 = "bg1",
	bg = "bg",
	btnList = {
		varname = "btnList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("btnDatas"),
				item = bindHelper.self("btnItem"),
				showTab = bindHelper.self("showTab"),
				onItem = function (slot0, slot1, slot2, slot3)
					idlereasy.when(slot0.showTab, function (slot0, slot1)
						uv2 = "size"
						slot3 = slot2
						slot2 = slot2.size(slot3)
						uv3 = "get"

						if slot1 == slot3 then
							uv3 = "size"
							slot3 = slot3:get("normal")
							slot3 = slot3.hide

							slot3(slot3)

							uv3 = "size"
							slot3 = slot3:get("selected")
							slot3 = slot3.show

							slot3(slot3)

							uv3 = "size"
							slot5 = "selected.txt"
							uv5 = "normal"

							slot3:get(slot5):text(slot5)

							slot6 = slot2.height / 2 - 10
							uv6 = "size"
							slot6 = slot6:get("selected.logo")
							uv6 = "size"

							adapt.oneLineCenterPos(cc.p(slot2.width / 2, slot6), {
								slot6,
								slot6:get("selected.txt")
							}, cc.p(10, 0))
						else
							uv3 = "size"
							slot3 = slot3:get("normal")
							slot3 = slot3.show

							slot3(slot3)

							uv3 = "size"
							slot3 = slot3:get("selected")
							slot3 = slot3.hide

							slot3(slot3)

							uv3 = "size"
							slot5 = "normal.txt"
							uv5 = "normal"

							slot3:get(slot5):text(slot5)

							slot6 = slot2.height / 2 - 10
							slot4 = cc.p(slot2.width / 2, slot6)
							slot5 = {
								slot6,
								slot6:get("normal.txt")
							}
							uv6 = "size"
							slot6 = slot6:get("normal.logo")
							uv6 = "size"

							adapt.oneLineCenterPos(slot4, slot5, cc.p(10, 0))

							uv4 = "hide"
							uv5 = "size"
							uv9 = "hide"
							uv10 = "get"

							bind.touch(slot4, slot5:get("normal"), {
								methods = {
									ended = functools.partial(slot9.clickCell, slot10)
								}
							})
						end
					end)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBtnItemClick")
			}
		}
	},
	pageview = {
		varname = "pageview",
		binds = {
			event = "extend",
			class = "pageview",
			props = {
				data = bindHelper.self("pageDatas"),
				item = bindHelper.self("pagePanel"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot0:setClippingEnabled(true)

					slot4 = slot1:multiget("list", "subList", "item")

					slot4.list:setScrollBarEnabled(false)
					slot4.subList:setScrollBarEnabled(false)

					slot6, slot7 = mathEasy.getRowCol(#slot3, 5)

					for slot11 = 1, slot6 do
						slot4.list:pushBackCustomItem(slot4.subList:clone():show())

						for slot17 = 1, slot11 == slot6 and slot7 or 5 do
							slot18 = slot17 + (slot11 - 1) * 5
							slot19 = slot4.item:clone():show()

							slot19:get("icon"):texture(gEmojiCsv[slot3[slot18].key].resource)
							bind.click(self, slot19, {
								method = functools.partial(slot0.itemClick, slot2, slot3[slot18])
							})
							slot12:pushBackCustomItem(slot19)
						end
					end
				end
			},
			handlers = {
				itemClick = bindHelper.self("onSelPicture")
			}
		}
	},
	dotList = {
		varname = "dotList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("pointDatas"),
				item = bindHelper.self("dot"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:texture(string.format("common/icon/logo_%s_fy.png", slot3.isCur == true and "highlight" or "normal"))
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3, slot4)
	slot0.sendData = slot1
	slot0.channel = slot2
	slot0.cb = slot4
	slot0.freshList = slot3
	slot5 = gGameUI:getConvertPos(slot0.freshList)
	slot0.unlockKey = gUnlockCsv.roleChat

	if slot2 == "role" then
		slot0:getResourceNode():xy(slot5.x + slot0.bg:size().width / 2 - 15, slot5.y + slot0.bg:size().height / 2 - 50)
	else
		slot0.unlockKey = gUnlockCsv.worldChat
		slot6 = 120

		slot0.bg:width(slot0.bg:width() - slot6)
		slot0.bg1:width(slot0.bg1:width() - slot6)
		slot0.btnList:width(slot0.btnList:width() - slot6):x(slot0.btnList:x() + slot6 / 2)

		slot6 = math.min(slot6, 80)

		slot0.pageview:width(slot0.pageview:width() - slot6):x(slot0.pageview:x() + slot6 / 2)
		slot0.pagePanel:width(slot0.pagePanel:width() - slot6)

		slot7 = slot0.pagePanel:get("list")
		slot8 = slot0.pagePanel:get("subList")

		slot7:width(slot7:width() - slot6)
		slot8:width(slot8:width() - slot6)
		slot8:setItemsMargin(0)
		slot0:getResourceNode():xy(slot5.x + slot0.bg:size().width / 2 - 20, slot5.y + slot0.bg:size().height / 2 - 32)
	end

	slot6 = userDefault.getForeverLocalKey("chatEmoji", {})
	slot0.datas = {}

	for slot11, slot12 in pairs(gEmojiCsv) do
		if slot6[slot11] and slot6[slot11] > 0 then
			table.insert({}, {
				key = slot11,
				count = slot6[slot11] or 0,
				id = slot12.id
			})
		end

		for slot16, slot17 in ipairs(slot12.tab) do
			for slot21 = #slot0.datas + 1, slot17 do
				slot0.datas[slot21] = {}
			end

			table.insert(slot0.datas[slot17], {
				key = slot11,
				id = slot12.id
			})
		end
	end

	for slot11, slot12 in ipairs(slot0.datas) do
		table.sort(slot12, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end

	slot0.btnDatas = {}

	for slot11 = #slot0.datas, 1, -1 do
		if #slot0.datas[slot11] == 0 then
			table.remove(slot0.datas, slot11)
		else
			table.insert(slot0.btnDatas, 1, gLanguageCsv["emojiTab" .. slot11] or "")
		end
	end

	if #slot7 ~= 0 then
		table.sort(slot7, function (slot0, slot1)
			if slot0.count ~= slot1.count then
				return slot1.count < slot0.count
			end

			return slot0.id < slot1.id
		end)
		table.insert(slot0.datas, 1, slot7)
		table.insert(slot0.btnDatas, 1, gLanguageCsv.commonUse)
	end

	slot0.showTab = idler.new(1)
	slot0.pageIndex = idler.new(1)

	slot0.pageview:addEventListener(function (slot0)
		uv1 = "pageIndex"
		uv4 = "pageIndex"
		slot4 = slot4.pageview
		slot5 = slot4
		uv5 = "pageIndex"

		slot1.pageIndex:set(math.min(slot4.getCurPageIndex(slot5) + 1, slot5.pointDatas:size()))
	end)

	slot0.pageDatas = idlers.new()
	slot0.pointDatas = idlers.new()

	idlereasy.when(slot0.showTab, function (slot0, slot1)
		slot2 = {}
		slot3 = {}
		uv5 = "datas"
		uv6 = "table"

		for slot7 = 1, #slot5.datas[slot1], slot6 do
			uv11 = "datas"
			uv13 = "table"

			table.insert(slot2, arraytools.slice(slot11.datas[slot1], slot7, slot13))
			table.insert(slot3, {
				isCur = slot7 == 1
			})
		end

		uv4 = "datas"
		slot4 = slot4.pageDatas
		slot4 = slot4.update

		slot4(slot4, slot2)

		uv4 = "datas"
		slot4 = slot4.pointDatas
		slot4 = slot4.update

		slot4(slot4, slot3)

		uv4 = "datas"
		slot4 = slot4.pageIndex
		slot4 = slot4.set

		slot4(slot4, 1)

		uv4 = "datas"

		slot4.dotList:visible(#slot3 > 1)
	end)
	idlereasy.when(slot0.pageIndex, function (slot0, slot1)
		uv2 = "pointDatas"

		for slot5, slot6 in slot2.pointDatas:ipairs() do
			slot6:proxy().isCur = slot5 == slot1
		end
	end)
	Dialog.onCreate(slot0, {
		noBlackLayer = true,
		clickClose = true
	})
end

function slot1.setReuseEmoji(slot0, slot1)
	slot2 = userDefault.getForeverLocalKey("chatEmoji", {})

	for slot6, slot7 in pairs(slot1) do
		slot2[slot6] = slot7 + (slot2[slot6] or 0)
	end

	userDefault.setForeverLocalKey("chatEmoji", slot2)
end

function slot1.onSelPicture(slot0, slot1, slot2, slot3)
	if not dataEasy.isChatOpen(slot0.unlockKey) then
		return
	end

	if not slot0.cb then
		gGameApp:requestServer("/game/chat", function (slot0)
			uv1 = "setReuseEmoji"
			slot1 = slot1.setReuseEmoji
			uv4 = "freshList"

			slot1(slot1, {
				[slot4] = 1
			})

			uv1 = "setReuseEmoji"
			slot1 = slot1.freshList
			slot1 = slot1.jumpToBottom

			slot1(slot1)

			uv1 = "setReuseEmoji"

			slot1:onClose()
		end, "[" .. slot3.key .. "]", slot0.channel, slot0.sendData)
	else
		slot0.cb("[" .. slot4 .. "]")
		slot0:setReuseEmoji({
			[slot4] = 1
		})
		slot0.freshList:jumpToBottom()
		slot0:onClose()
	end
end

function slot1.onBtnItemClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

return slot1
