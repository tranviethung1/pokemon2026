slot0 = class("ChipDrawResultView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "gem_result.json"
slot0.RESOURCE_BINDING = {
	bgPanel = "bgPanel",
	subList = "subList",
	["downPanel.costInfo.imgIcon"] = "costIcon",
	["downPanel.costInfo.textCost"] = "textCost",
	item = "item",
	["downPanel.costInfo.textNote"] = "textNote",
	downPanel = "downPanel",
	list = "list",
	movePanel = "movePanel",
	["downPanel.btnOk"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["downPanel.btnOk.textNote"] = {
		binds = {
			{
				event = "effect",
				data = {
					glow = {
						color = ui.COLORS.GLOW.WHITE
					}
				}
			}
		}
	},
	["downPanel.btnAgain"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("drawAgain")
			}
		}
	},
	["downPanel.btnAgain.textNote"] = {
		binds = {
			{
				event = "text",
				data = bindHelper.self("drawAgainStr")
			},
			{
				event = "effect",
				data = {
					glow = {
						color = ui.COLORS.GLOW.WHITE
					}
				}
			}
		}
	},
	effect = {
		varname = "effect",
		binds = {
			{
				event = "click",
				method = bindHelper.self("onClickEffect")
			},
			{
				event = "visible",
				idler = bindHelper.self("showEffect")
			}
		}
	}
}
slot0.RESOURCE_STYLES = {
	full = true
}

function slot0.onCreate(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.bgPanel:get("cover"):visible(false)

	slot0.costType = slot2
	slot0.drawTimes = slot3
	slot0.againCb = slot6
	slot0.costNum = slot4
	slot0.ticketKey = slot5
	slot0.isJump = false

	slot0.item:visible(false)

	slot0.showEffect = idler.new(false)

	slot0.item:visible(false)

	slot0.drawAgainStr = string.format(gLanguageCsv.drawNum, slot3)
	slot8 = 0

	widget.addAnimationByKey(slot0.bgPanel, "chip/xdck.skel", "effectBg", "effect", -2):alignCenter(slot0.bgPanel:size()):scale(2)
	slot0.list:setClippingEnabled(false)
	slot0.downPanel:visible(false)
	slot0.list:setScrollBarEnabled(false)
	performWithDelay(slot0, function ()
		uv4 = "chip/xdck.skel"
		slot5 = "chip/xdck.skel"
		uv5 = "chip/xdck.skel"
		slot5 = slot5.bgPanel
		slot6 = slot5
		slot3 = widget.addAnimationByKey(slot4.bgPanel, slot5, "effectBg2", "effect_loop", -1):alignCenter(slot5.size(slot6))
		slot4 = slot3

		slot3.scale(slot4, 2)

		uv4 = "chip/xdck.skel"
		uv6 = "effect_loop"

		performWithDelay(slot4, function ()
			uv1 = "widget"
			slot2 = 2
			uv2 = "widget"
			slot2 = slot2.bgPanel
			slot3 = slot2
			slot0 = widget.addAnimationByKey(slot1.bgPanel, "effect/chouka.skel", "efc1", "huode", 11):scale(slot2):alignCenter(slot2.size(slot3))
			slot1 = slot0
			slot0 = slot0.y(slot1, 720)
			uv1 = "widget"
			uv3 = "addAnimationByKey"

			slot1:showItems(slot3)
		end, slot6)
	end, 2)
	slot0:initModel()
	idlereasy.when(slot0.items, function (slot0, slot1)
		uv2 = "set"
		uv4 = "ticketKey"

		slot2:set(slot1[slot4.ticketKey])
	end)
	idlereasy.any({
		slot0.rmb,
		idler.new()
	}, function ()
		uv1 = "dataEasy"
		slot0 = dataEasy.getNumByKey(slot1.ticketKey)
		slot1 = true
		uv2 = "dataEasy"

		if slot2.costType == "rmb" then
			uv2 = "dataEasy"

			if slot2.drawTimes <= slot0 then
				uv2 = "dataEasy"
				slot2 = slot2.textCost
				slot2 = slot2.text
				slot5 = "/"
				uv6 = "dataEasy"

				slot2(slot2, slot0 .. slot5 .. slot6.drawTimes)

				uv2 = "dataEasy"
				uv5 = "dataEasy"

				slot2.costIcon:texture(dataEasy.getIconResByKey(slot5.ticketKey))
			else
				uv2 = "dataEasy"
				slot2 = slot2.textCost
				slot2 = slot2.text
				uv4 = "dataEasy"

				slot2(slot2, slot4.costNum)

				uv2 = "dataEasy"
				slot2 = slot2.costIcon
				slot3 = slot2
				uv5 = "dataEasy"

				slot2.texture(slot3, dataEasy.getIconResByKey(slot5.costType))

				uv3 = "dataEasy"
				slot3 = slot3.costType
				uv3 = "dataEasy"
				slot1 = slot3.costNum <= dataEasy.getNumByKey(slot3)
			end
		else
			uv2 = "dataEasy"

			if slot2.costType == "item" then
				uv3 = "dataEasy"
				slot3 = slot3.ticketKey
				slot2 = dataEasy.getNumByKey(slot3)
				uv3 = "dataEasy"
				slot3 = slot3.textCost
				slot3 = slot3.text
				slot6 = "/"
				uv7 = "dataEasy"

				slot3(slot3, slot2 .. slot6 .. slot7.costNum)

				uv3 = "dataEasy"
				slot3 = slot3.costIcon
				slot3 = slot3.texture
				uv6 = "dataEasy"

				slot3(slot3, dataEasy.getIconResByKey(slot6.ticketKey))

				uv3 = "dataEasy"
				slot1 = slot3.costNum < slot2
			end
		end

		uv3 = "dataEasy"

		text.addEffect(slot3.textCost, {
			color = slot1 and ui.COLORS.NORMAL.BLACK or ui.COLORS.NORMAL.RED
		})
	end)
end

function slot0.onClickEffect(slot0)
	slot0.showEffect:set(false)

	slot0.isJump = true
end

function slot0.showItems(slot0, slot1)
	slot0.decomposedItems = {}

	slot0.list:removeAllItems()
	slot0.downPanel:visible(false)
	slot0.movePanel:visible(true)

	slot0.data = slot1

	slot0:getResourceNode():removeChildByName("centerItem")

	if slot0.drawTimes > 1 then
		slot0.bgPanel:get("cover"):visible(true)
	end

	slot0:showOneItem(1)
end

function slot0.showOneItem(slot0, slot1)
	if not slot0.data[slot1] then
		slot0:showEnd()

		return
	end

	slot3 = slot0.item:clone():show()

	slot3:get("textName"):visible(false)
	slot3:get("imgBg"):visible(false)
	slot0:pushBackCustomItem(slot3)
	bind.extend(slot0, slot0.item:get("icon"):clone():addTo(slot0.movePanel):visible(false), {
		class = "icon_key",
		props = {
			data = {
				key = slot2.key,
				dbId = slot2.dbId
			},
			specialKey = {
				maxLimit = true
			}
		}
	})

	slot5 = 0.1

	performWithDelay(slot0, function ()
		slot1 = 0
		slot0 = cc.p(slot1, 0)
		uv1 = "cc"

		if slot1.drawTimes == 10 then
			uv3 = "p"
			slot4 = slot3
			uv4 = "cc"
			slot0 = gGameUI:getConvertPosAR(slot3.get(slot4, "icon"), slot4.movePanel)
		end

		uv1 = "drawTimes"
		slot1 = slot1:xy(1280, 120):visible(true)
		slot1 = slot1.scale

		slot1(slot1, 0)

		uv1 = "drawTimes"
		slot1 = slot1.runAction
		uv7 = "gGameUI"
		uv10 = "cc"
		slot10 = slot10.movePanel
		slot11 = slot10
		uv11 = "cc"
		slot6 = cc.CallFunc
		slot7 = slot6

		slot1(slot1, cc.Sequence:create(cc.MoveTo:create(slot7, cc.p(slot0.x + slot10.width(slot11) / 2, slot0.y + slot11.movePanel:height() / 2)), slot6.create(slot7, function ()
			slot0 = bind.extend
			uv1 = "bind"
			uv2 = "extend"
			uv6 = "get"
			slot6 = slot6.key
			uv6 = "get"
			slot6 = slot6.num
			uv6 = "get"

			slot0(slot1, slot2:get("icon"), {
				class = "icon_key",
				props = {
					effect = "drawcard",
					data = {
						key = slot6,
						num = slot6,
						dbId = slot6.dbId
					},
					specialKey = {
						maxLimit = true
					}
				}
			})

			uv0 = "get"

			if slot0.decomposed then
				uv0 = "extend"
				slot0 = slot0:get("textName"):text(gLanguageCsv.decomposed)
				slot1 = slot0

				slot0.color(slot1, ui.COLORS.GREEN)

				uv1 = "bind"
				uv3 = "extend"
				uv3 = "get"

				table.insert(slot1.decomposedItems, {
					slot3,
					slot3
				})
			else
				uv1 = "get"
				slot3, slot1 = uiEasy.setIconName(slot1.key)
				uv3 = "extend"
				slot3 = slot3:get("textName")
				slot4 = slot3

				slot3.text(slot4, beauty.singleTextLimitWord(slot3, {
					fontSize = 40
				}, {
					width = 240,
					onlyText = true
				}))

				uv4 = "extend"

				text.addEffect(slot4:get("textName"), slot1)
			end

			uv0 = "extend"
			slot0 = slot0:get("textName")
			slot0 = slot0.visible

			slot0(slot0, true)

			uv0 = "extend"
			slot0 = slot0:get("imgBg")
			slot0 = slot0.visible

			slot0(slot0, true)

			uv0 = "icon"

			slot0:removeSelf()
		end)))

		uv1 = "drawTimes"
		slot2 = slot1
		uv7 = "gGameUI"
		slot8 = 720
		uv8 = "gGameUI"

		slot1.runAction(slot2, cc.Spawn:create(cc.RotateTo:create(slot7, slot8), cc.ScaleTo:create(slot8, 1)))

		uv2 = "cc"

		performWithDelay(slot2, function ()
			uv0 = "showOneItem"
			uv2 = "showOneItem"

			slot0:showOneItem(slot2 + 1)
		end, 0.03)
	end, 0.02)
end

function slot0.pushBackCustomItem(slot0, slot1)
	if slot0.drawTimes == 1 then
		slot0:getResourceNode():add(slot1, 100)
		slot1:alignCenter(slot0:getResourceNode():size())
		slot1:setName("centerItem"):y(620)

		return
	end

	slot2 = nil

	if #slot0.list:getItems() > 0 then
		slot2 = slot3[#slot3]
	else
		slot2 = slot0.subList:clone()

		slot2:setScrollBarEnabled(false)
		slot0.list:pushBackCustomItem(slot2)
	end

	if #slot2:getItems() > 4 then
		slot2 = slot0.subList:clone()

		slot2:setScrollBarEnabled(false)
		slot0.list:pushBackCustomItem(slot2)
	end

	slot2:pushBackCustomItem(slot1)
	slot2:setClippingEnabled(false)
end

function slot0.showEnd(slot0)
	slot0.downPanel:visible(true)
	adapt.oneLineCenterPos(cc.p(139, 35), {
		slot0.textNote,
		slot0.textCost,
		slot0.costIcon
	})

	slot1 = 1

	slot0:enableSchedule():schedule(function (slot0)
		uv1 = "ipairs"
		slot1 = slot1 + 1
		uv0 = 2
		uv2 = "decomposedItems"

		for slot4, slot5 in ipairs(slot2.decomposedItems) do
			slot7 = slot5[2]
			uv8 = "ipairs"

			if slot8 % 2 == 1 then
				uv9 = "decomposedItems"

				bind.extend(slot9, slot5[1]:get("icon"), {
					class = "icon_key",
					props = {
						data = {
							key = slot7.key,
							num = slot7.num,
							dbId = slot7.dbId
						},
						specialKey = {
							maxLimit = true
						}
					}
				})
			else
				slot9, slot10 = csvNext(csv.gem.gem[slot7.key].decomposeReturn)
				uv12 = "decomposedItems"

				bind.extend(slot12, slot6:get("icon"), {
					class = "icon_key",
					props = {
						data = {
							key = slot7.decomposed.key,
							num = slot7.decomposed.num
						},
						specialKey = {
							maxLimit = true
						}
					}
				})
			end
		end
	end, 1, 0, "playEffect")
end

function slot0.drawAgain(slot0)
	if slot0.againCb then
		slot0.againCb(slot0.costType, slot0.drawTimes, function (slot0)
			uv1 = "showItems"

			slot1:showItems(slot0)
		end)
	end
end

function slot0.initModel(slot0)
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.items = gGameModel.role:getIdler("items")
end

return slot0
