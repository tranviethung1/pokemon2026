slot0 = class("GemDrawResultView", cc.load("mvc").ViewBase)
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
slot1 = {
	gold = {
		[1.0] = "effect_jinbi1",
		[10.0] = "effect_jinbi10"
	},
	rmb = {
		[1.0] = "effect_zuan1",
		[10.0] = "effect_zuan10"
	}
}
slot2 = {
	[1.0] = "effect_zhanshi1_loop",
	[10.0] = "effect_zhanshi10_loop"
}
slot3 = {
	gold = {
		[1.0] = "gem_draw_1.mp3",
		[10.0] = "gem_gold_10.mp3"
	},
	rmb = {
		[1.0] = "gem_draw_1.mp3",
		[10.0] = "gem_diamond_10.mp3"
	}
}

function slot0.onCreate(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.bgPanel:get("cover"):visible(false)

	slot0.costType = slot2
	slot0.drawTimes = slot3
	slot0.againCb = slot6
	slot0.costNum = slot4
	slot0.ticketKey = slot5
	slot0.gemUp = slot7
	slot0.isJump = false

	slot0.item:visible(false)

	slot0.showEffect = idler.new(false)

	slot0.item:visible(false)

	slot0.drawAgainStr = string.format(gLanguageCsv.drawNum, slot3)
	slot8 = slot7 and 0 or 2
	slot9 = nil

	if not slot7 then
		uv14 = "bgPanel"

		widget.addAnimationByKey(slot0.bgPanel, "fushichouqu/ryl.skel", "effectBg", slot14[slot2][slot3], -2):alignCenter(slot0.bgPanel:size()):scale(2)

		slot9 = 0
	else
		slot9 = slot3 == 1 and 2.4 or 8
	end

	slot0.list:setClippingEnabled(false)
	slot0.downPanel:visible(false)

	slot10 = slot0.list
	slot11 = slot10

	slot10.setScrollBarEnabled(slot11, false)
	audio.pauseMusic()

	uv11 = "get"

	audio.playEffectWithWeekBGM(slot11[slot2][slot3])

	if slot7 and slot3 == 10 then
		slot0.showEffect:set(true)
		widget.addAnimationByKey(slot0.bgPanel, "effect/chouka.skel", "efc", "shilianchou", -1):alignCenter(slot0.bgPanel:size()):scale(2)

		slot10 = false

		function slot11()
			uv0 = "isJump"

			if not slot0 then
				uv0 = true
				uv0 = "showEffect"
				slot0.isJump = false
				uv0 = "showEffect"
				slot0 = slot0.showEffect
				slot1 = slot0

				slot0.set(slot1, false)
				audio.stopAllSounds()
				audio.resumeMusic()

				uv1 = "showEffect"
				slot2 = 2
				uv2 = "showEffect"
				slot0 = widget.addAnimationByKey(slot1.bgPanel, "effect/chouka.skel", "efc1", "huode", 11):scale(slot2):alignCenter(slot2.bgPanel:size())
				slot1 = slot0

				slot0.y(slot1, 720)

				uv1 = "showEffect"
				slot2 = "effect/chouka.skel"
				uv2 = "showEffect"
				slot0 = widget.addAnimationByKey(slot1.bgPanel, slot2, "efc2", "shilianchou_loop", 1):alignCenter(slot2.bgPanel:size())
				slot0 = slot0.scale
				slot2 = 2

				slot0(slot0, slot2)

				uv0 = "showEffect"
				uv2 = "set"

				slot0:showItems(slot2)
			end
		end

		performWithDelay(slot0, function ()
			uv0 = "enableSchedule"
			slot0 = slot0:enableSchedule()
			slot0 = slot0.unSchedule

			slot0(slot0, "playEffect")

			uv0 = "unSchedule"

			slot0()
		end, slot9)
		slot0:enableSchedule():schedule(function (slot0)
			uv1 = "isJump"

			if slot1.isJump then
				uv1 = "isJump"
				slot1 = slot1.stopAllActions

				slot1(slot1)

				uv1 = "stopAllActions"

				slot1()

				return false
			end
		end, 0.016666666666666666, 0, "playEffect")
	else
		performWithDelay(slot0, function ()
			slot0 = "fushichouqu/ryl.skel"
			slot1 = "effectBg2"
			uv2 = "fushichouqu/ryl.skel"
			uv3 = "effectBg2"
			slot2 = slot2[slot3]
			uv3 = "effect/chouka.skel"

			if slot3 then
				slot1 = "efc"
				slot0 = "effect/chouka.skel"
				slot2 = "danchou"
			end

			uv4 = "efc"
			slot5 = slot0
			uv5 = "efc"
			slot5 = slot5.bgPanel
			slot6 = slot5
			slot3 = widget.addAnimationByKey(slot4.bgPanel, slot5, slot1, slot2, -1):alignCenter(slot5.size(slot6))
			slot4 = slot3

			slot3.scale(slot4, 2)

			uv4 = "efc"
			uv6 = "widget"

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
		end, slot8)
	end

	slot0:initModel()
	idlereasy.when(slot0.items, function (slot0, slot1)
		uv2 = "set"
		uv4 = "ticketKey"

		slot2:set(slot1[slot4.ticketKey])
	end)
	idlereasy.any({
		slot0[slot2],
		idler.new()
	}, function ()
		uv1 = "dataEasy"
		slot1 = slot1.ticketKey
		uv1 = "dataEasy"

		if slot1.drawTimes <= dataEasy.getNumByKey(slot1) then
			uv1 = "getNumByKey"

			if not slot1 then
				uv1 = "dataEasy"
				slot1 = slot1.textCost
				slot1 = slot1.text
				slot4 = "/"
				uv5 = "dataEasy"

				slot1(slot1, slot0 .. slot4 .. slot5.drawTimes)

				uv1 = "dataEasy"
				uv4 = "dataEasy"

				slot1.costIcon:texture(dataEasy.getIconResByKey(slot4.ticketKey))
			end
		else
			uv1 = "dataEasy"
			slot1 = slot1.textCost
			slot2 = slot1
			uv3 = "dataEasy"

			slot1.text(slot2, slot3.costNum)

			uv2 = "dataEasy"
			slot2 = slot2.costType
			uv2 = "dataEasy"
			slot2 = text.addEffect
			uv3 = "dataEasy"
			slot5 = slot2.costNum <= dataEasy.getNumByKey(slot2) and ui.COLORS.NORMAL.BLACK or ui.COLORS.NORMAL.RED

			slot2(slot3.textCost, {
				color = slot5
			})

			uv2 = "dataEasy"
			uv5 = "dataEasy"

			slot2.costIcon:texture(dataEasy.getIconResByKey(slot5.costType))
		end
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

	if slot0.drawTimes > 1 and not slot0.gemUp then
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
				key = slot2.key
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

			slot0(slot1, slot2:get("icon"), {
				class = "icon_key",
				props = {
					effect = "drawcard",
					data = {
						key = slot6,
						num = slot6.num
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
				slot0, slot1 = uiEasy.setIconName(slot1.key)
				uv2 = "extend"
				slot2 = slot2:get("textName")
				slot3 = slot2

				slot2.text(slot3, slot0)

				uv3 = "extend"

				text.addEffect(slot3:get("textName"), slot1)
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
	audio.stopAllSounds()
	audio.resumeMusic()
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
							num = slot7.num
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
		if slot0.gemUp then
			slot0.againCb(slot0.drawTimes, function (slot0)
				uv1 = "showItems"

				slot1:showItems(slot0)
			end)
		else
			slot0.againCb(slot0.costType, slot0.drawTimes, function (slot0)
				uv1 = "showItems"

				slot1:showItems(slot0)
			end)
		end
	end
end

function slot0.initModel(slot0)
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.items = gGameModel.role:getIdler("items")
end

return slot0
