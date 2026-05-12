slot1 = 50
slot2 = class("ChatView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "chat.json"
slot2.RESOURCE_BINDING = {
	btn = "btn",
	item = "item",
	topView = "topView",
	["chatPanel.bottomPanel.textInput"] = "textInput",
	chatPanel = "chatPanel",
	["chatPanel.bottomPanel"] = {
		varname = "bottomPanel",
		binds = {
			event = "visible",
			idler = bindHelper.self("bottomShow")
		}
	},
	["chatPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["chatPanel.closePanel"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["chatPanel.bottomPanel.btnSend"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSendClick")
			}
		}
	},
	["chatPanel.bottomPanel.btnSend.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["chatPanel.bottomPanel.btnPicture"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPictureClick")
			}
		}
	},
	["chatPanel.btnList"] = {
		varname = "btnList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("btnsInfo"),
				item = bindHelper.self("btn"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("selected"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					if slot3.fontSize then
						slot6:get("txt"):setFontSize(slot3.fontSize)
					end

					adapt.setAutoText(slot6:get("txt"), slot3.name, 160)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot2)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onChangePage")
			}
		}
	},
	["chatPanel.list"] = {
		varname = "contentList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				preloadBottom = true,
				data = bindHelper.self("contents"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot0.initItem(slot1, slot2, slot3)
				end,
				asyncPreload = bindHelper.self("asyncPreload")
			},
			handlers = {
				itemClick = bindHelper.self("onShowInfo"),
				initItem = bindHelper.self("onInitItem")
			}
		}
	}
}

function slot2.setCommonContent(slot0, slot1, slot2, slot3, slot4)
	slot6 = slot2:get(slot4.isMine and "mine" or "other"):visible(true)
	slot7 = slot6:y()

	slot6:multiget("txtName", "txtFlag", "vip", "imgEmoji", "imgTextBG", "imgFlagBG", "rolePanel", "title").txtFlag:text(slot0.channels[slot4.channel].name)

	if slot4.role then
		slot8.txtName:text(slot4.role.name)

		if slot4.role.vip > 0 then
			slot8.vip:texture(ui.VIP_ICON[slot4.role.vip]):show()
		else
			slot8.vip:hide()
		end

		if slot4.channel == "official" then
			-- Nothing
		end

		bind.extend(slot1, slot8.rolePanel, {
			event = "extend",
			class = "role_logo",
			props = {
				vip = false,
				logoId = slot4.role.logo,
				frameId = slot4.role.frame,
				level = slot4.role.level,
				onNodeClick = function (slot0)
					uv2 = "functools"
					uv3 = "partial"
					uv4 = "itemClick"
					uv5 = "functools"

					functools.partial(slot2.itemClick, slot3, slot4, slot5)(slot0)
				end,
				onNodeClick = nil
			}
		})

		if slot4.role.title and slot4.role.title > 0 then
			bind.extend(slot1, slot8.title, {
				event = "extend",
				class = "role_title",
				props = {
					data = slot4.role.title,
					onNode = function (slot0)
						uv1 = "title"
						slot3 = slot0.size

						slot1.title:size(slot3(slot0))

						uv3 = "title"

						slot0:alignCenter(slot3.title:size())
					end
				}
			})
		else
			slot8.title:hide()
		end

		if slot4.isMine then
			adapt.oneLinePos(slot8.txtFlag, {
				slot8.vip,
				slot8.txtName,
				slot8.title
			}, {
				cc.p(30, 0),
				cc.p(10, 0)
			}, "right")
		else
			adapt.oneLinePos(slot8.txtFlag, {
				slot8.vip,
				slot8.title,
				slot8.txtName
			}, {
				cc.p(30, 0),
				cc.p(10, 0)
			}, "left")
		end
	end

	return slot6, slot7
end

function slot2.onInitItem(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot2:size()
	slot6 = 0
	slot7 = nil
	slot8 = slot2:multiget("mine", "system", "other", "txtTime", "imgTime")
	slot9 = nil

	itertools.invoke({
		slot8.mine,
		slot8.system,
		slot8.other
	}, "hide")

	if itertools.first(game.MESSAGE_SHOW_TYPE[slot4.type], 1) then
		slot7 = slot8.system:visible(true)

		slot7:removeChildByName("_text_")

		slot9 = slot7:y()
		slot10 = slot7:multiget("imgTextBG", "txtFlag", "txtContent", "imgFlagBG", "imgTextBG")

		slot10.txtFlag:text(slot0.channels[slot4.channel].name)
		slot10.imgFlagBG:texture(slot0.channels[slot4.channel].icon)
		slot10.txtContent:removeAllChildren()

		slot11 = rich.createWithWidth(slot4.msg, 40, nil, 800, nil, cc.p(0, 0))

		slot11:anchorPoint(0, 1):xy(10, 40):addTo(slot10.txtContent, 2):name("_text_")
		slot10.imgTextBG:size(slot11:size().width + 80, slot11:size().height + 50)
		slot2:size(slot2:size().width, slot11:size().height + 56)

		slot6 = slot7:size().height - slot11:size().height - 66

		uiEasy.setUrlHandler(slot11, slot4)
	elseif itertools.first(game.MESSAGE_SHOW_TYPE[slot4.type], 2) then
		slot10, slot9 = slot0:setCommonContent(slot1, slot2, slot3, slot4)

		slot10:removeChildByName("_text_")

		slot10 = slot4.isMine and -30 or 0
		slot11 = slot7:multiget("txtName", "txtFlag", "vip", "imgEmoji", "imgTextBG", "imgFlagBG", "rolePanel", "title")
		slot13 = 0

		slot11.imgFlagBG:texture(slot0.channels[slot4.channel].icon)
		slot11.imgEmoji:visible(gEmojiCsv[string.match(slot4.msg, "%[(%w+)%]")] ~= nil)

		if gEmojiCsv[slot12] then
			slot11.imgEmoji:texture(gEmojiCsv[slot12].resource)

			slot13 = slot11.imgEmoji:size().height
			slot14 = slot11.imgEmoji:getBoundingBox()

			slot11.imgTextBG:size(slot14.width + 40, slot14.height + 20)
			slot11.imgEmoji:y(slot11.imgTextBG:y() - slot11.imgTextBG:height() / 2)
			slot2:size(slot2:size().width, slot14.height + 136)

			slot6 = slot7:size().height - slot14.height - 146
		else
			slot15, slot16 = slot7:get("txtContent"):xy()
			slot17 = cc.Label:createWithTTF(slot4.msg, ui.FONT_PATH, 40)

			slot17:anchorPoint(slot4.isMine and 1 or 0, 1):xy(slot15, slot16 + 5):addTo(slot7, 5):name("_text_")
			slot17:setMaxLineWidth(550)
			slot17:setTextColor(ui.COLORS.NORMAL.DEFAULT)

			slot13 = slot17:height()

			slot11.imgTextBG:size(slot17:width() + 105, slot13 + 60)
			slot2:height(slot13 + 178)

			slot6 = slot7:height() - slot13 - 178
		end

		slot7:x(slot7:x() + slot10)
	elseif itertools.first(game.MESSAGE_SHOW_TYPE[slot4.type], 4) then
		slot7, slot9 = slot0:setCommonContent(slot1, slot2, slot3, slot4)

		slot7:removeChildByName("_text_")
		slot7:removeChildByName("_bg_")

		slot10 = slot7:multiget("txtContent", "imgTextBG", "imgEmoji", "imgFlagBG", "txtFlag", "rolePanel")

		slot10.imgEmoji:visible(false)

		slot11, slot12 = slot10.imgTextBG:xy()

		if slot4.channel ~= "official" then
			slot14 = rich.createWithWidth("#C0x5B545B#" .. slot4.msg, 40, nil, 550, nil, cc.p(0, 0))

			slot14:anchorPoint(slot4.isMine and 1 or 0, 1):xy(slot11 + (slot4.isMine and -25 or 57), slot12 - 25):addTo(slot7, 3, "_text_")
			slot10.imgTextBG:size(slot14:width() + 80, slot14:height() + 50)
			slot2:size(slot2:width(), slot14:height() + 178)

			slot6 = slot7:height() - slot14:height() - 178

			uiEasy.setUrlHandler(slot14, slot4)
		else
			slot2:setTouchEnabled(true)
			slot10.txtFlag:text(slot4.args.official_name)

			slot14 = rich.createWithWidth("#C0x5B545B#" .. slot4.msg, 40, nil, 750, nil, cc.p(0, 0))

			slot14:anchorPoint(slot4.isMine and 1 or 0, 1):xy(slot11 + slot13, slot12 - 25):addTo(slot7, 3, "_text_")
			slot10.imgTextBG:size(slot14:width() + 80, slot14:height() + 50)
			slot2:size(slot2:width(), slot14:height() + 178)

			slot15 = cc.rect(64, 100, 1, 1)
			slot16 = ccui.Scale9Sprite:create()

			slot16:initWithFile(slot15, "city/chat/box_ltgg.png")
			slot16:setScale9Enabled(true)
			slot16:size(1100, slot9 - (slot7:height() - slot14:height() - 178) + 40):anchorPoint(0, 1):xy(-20, 240):addTo(slot7, -1, "_bg_"):setCapInsets(slot15)

			slot18 = slot10.imgFlagBG:x()

			slot10.imgFlagBG:setScale9Enabled(true)
			slot10.imgFlagBG:width(math.max(slot10.imgFlagBG:width(), slot10.txtFlag:width() + 30)):anchorPoint(0, 0.5):x(225):setCapInsets(cc.rect(43, 40, 1, 1))
			slot10.txtFlag:x(slot10.imgFlagBG:x() + slot10.imgFlagBG:width() / 2)
		end
	end

	if slot4.showTime == true then
		slot8.txtTime:text(slot0:timestampToStr(slot4.time))
		slot8.imgTime:width(slot8.txtTime:width() / 2 + 20)
		slot8.imgTime:y(slot2:height() + 58)
		slot8.txtTime:y(slot2:height() + 58)
		slot2:size(slot2:size().width, slot2:size().height + 116)
	else
		slot8.txtTime:hide()
		slot8.imgTime:hide()
	end

	slot7:y(slot9 - slot6)
end

function slot2.playAction(slot0, slot1, slot2, slot3)
	if not slot0.chatPanelPosX then
		slot0.chatPanelPosX = slot0.chatPanel:x() - 114 + adapt.dockWithScreen(nil, "left", "up")

		slot0.chatPanel:x(slot0.chatPanelPosX)
	end

	slot0.isPlayAction = true

	transition.executeSequence(slot0.chatPanel, true):func(function ()
		uv0 = "topView"

		slot0.topView:visible(true)
	end):moveTo(slot2 or 0.3, slot1 and slot0.chatPanelPosX + slot0.chatPanel:size().width or slot0.chatPanelPosX):func(function ()
		uv0 = "isPlayAction"
		slot0.isPlayAction = false
		uv0 = "isPlayAction"
		slot0 = slot0.topView
		slot0 = slot0.visible

		slot0(slot0, false)

		uv0 = "topView"

		if not slot0 then
			uv0 = "visible"
			uv1 = "isPlayAction"

			slot0.onClose(slot1)
		end

		uv0 = "onClose"

		if slot0 then
			uv0 = "onClose"

			slot0()
		end
	end):done()
end

function slot2.initModel(slot0)
	slot0.unionId = gGameModel.role:getIdler("union_db_id")
	slot0.chatMsgIdler = {
		gGameModel.messages:getIdler("news"),
		gGameModel.messages:getIdler("world"),
		gGameModel.messages:getIdler("union"),
		gGameModel.messages:getIdler("team")
	}
end

function slot2.onCreate(slot0, slot1)
	slot0.asyncPreload = 9
	slot0.channels = {
		official = {
			name = "",
			icon = "city/chat/box_ltggb.png"
		},
		news = {
			icon = "city/chat/box_xtd.png",
			name = gLanguageCsv.system
		},
		world = {
			icon = "city/chat/box_sjd.png",
			name = gLanguageCsv.world
		},
		union = {
			icon = "city/chat/box_ghd.png",
			name = gLanguageCsv.guild
		},
		team = {
			icon = "city/chat/box_zdd.png",
			name = gLanguageCsv.formTeam
		},
		huodong = {
			icon = "city/chat/box_hdd.png",
			name = gLanguageCsv.activity
		},
		private = {
			icon = "city/chat/box_zdd.png",
			name = gLanguageCsv.privateChat
		}
	}

	slot0.bottomPanel:z(5)
	slot0.bottomPanel:get("bg1"):setTouchEnabled(true)
	slot0:initModel()
	blacklist:addListener(slot0.textInput, "*", function (slot0)
		uv1 = "textInput"
		uv5 = "text"

		slot1.textInput:text(string.utf8limit(slot0, slot5, true))
	end)

	slot0.bottomShow = idler.new(true)

	slot0.textInput:setPlaceHolderColor(ui.COLORS.DISABLED.WHITE)
	slot0.textInput:setTextColor(ui.COLORS.NORMAL.DEFAULT)
	slot0:getBtnsInfo()

	slot2 = slot0.contentList:y()
	slot0.originSize = slot0.contentList:size()
	slot0.contents = idlers.newWithMap({})

	if slot0.btnsInfo:size() < (slot1 or 2) then
		slot1 = 2
	end

	slot0.showTab = idler.new(slot1)

	slot0.showTab:addListener(function (slot0, slot1, slot2)
		uv3 = "btnsInfo"
		slot3 = slot3.btnsInfo:atproxy(slot1)
		slot3.select = false
		uv3 = "btnsInfo"
		slot3 = slot3.btnsInfo:atproxy(slot0)
		slot3.select = true
		uv3 = "btnsInfo"
		slot5 = slot0
		slot3 = slot3.btnsInfo:atproxy(slot5).showBottom
		slot4 = 130
		uv5 = "btnsInfo"
		slot5 = slot5.bottomShow
		slot6 = slot5
		slot5 = slot5.set

		slot5(slot6, slot3)

		uv5 = "atproxy"
		slot5 = slot5.height
		uv6 = "btnsInfo"
		slot6 = slot6.contentList
		slot6 = slot6.y
		uv8 = "select"
		slot8 = slot8 + (slot3 and slot4 or 0)

		slot6(slot6, slot8)

		uv6 = "btnsInfo"
		slot6 = slot6.contentList
		slot6 = slot6.height
		uv8 = "atproxy"

		slot6(slot6, slot8.height - (slot3 and slot4 or 0))

		uv6 = "btnsInfo"

		slot6:initMsg()
	end)
	slot0:playAction(true)
end

function slot2.getBtnsInfo(slot0)
	slot0.btnsInfo = idlers.newWithMap({
		{
			tag = "news",
			showBottom = false,
			name = gLanguageCsv.system,
			text = gLanguageCsv.currChannelNotTalk
		},
		{
			tag = "world",
			showBottom = true,
			name = gLanguageCsv.world
		},
		{
			tag = "union",
			showBottom = false,
			name = gLanguageCsv.guild,
			text = gLanguageCsv.notGuildNotUse
		}
	})

	idlereasy.when(slot0.unionId, function (slot0, slot1)
		if slot1 then
			uv2 = "btnsInfo"
			slot2.btnsInfo:atproxy(3).showBottom = true
		else
			uv2 = "btnsInfo"
			slot2.btnsInfo:atproxy(3).showBottom = false
		end
	end)
end

function slot2.initMsg(slot0)
	slot1 = slot0.showTab:read()
	slot2 = slot0.btnsInfo:atproxy(slot1).showBottom
	slot3 = 130

	idlereasy.any({
		slot0.chatMsgIdler[slot1],
		gGameModel.messages:getIdler("official")
	}, function (slot0, slot1, slot2)
		for slot6, slot7 in ipairs(slot1) do
			if slot6 == 1 then
				slot1[slot6].showTime = true
			elseif slot7.time - slot1[slot6 - 1].time > 300 or slot1[slot6 - 1].time - slot7.time > 0 then
				slot1[slot6].showTime = true
			else
				slot1[slot6].showTime = false
			end
		end

		uv3 = "ipairs"
		slot3 = slot3.contentList
		slot3 = slot3.refreshView

		slot3(slot3)

		uv3 = "ipairs"
		slot4 = dataEasy.tryCallFunc
		uv5 = "ipairs"

		slot4(slot5.contentList, "updatePreloadCenterIndex")

		uv4 = "ipairs"
		slot4 = slot4.contents
		slot4 = slot4.update

		slot4(slot4, slot1)

		uv4 = "ipairs"

		if slot4.contentList.enableAsyncload then
			uv4 = "ipairs"
			slot4 = slot4.contentList
			slot4 = slot4.enableAsyncload

			slot4(slot4)

			uv4 = "ipairs"

			slot4.contentList:quickFor("sync")

			if slot3.contentList:getScrolledPercentVertical() > 99 then
				uv5 = "ipairs"

				performWithDelay(slot5, function ()
					uv0 = "contentList"

					slot0.contentList:jumpToBottom()
				end, 0.016666666666666666)
			end
		end

		uv4 = "ipairs"
		slot4 = slot4.contentList
		slot5 = slot4
		slot4 = slot4.height
		uv6 = "ipairs"
		slot6 = slot6.originSize.height
		uv7 = "showTime"

		if slot7 then
			uv7 = "time"

			if not slot7 then
				slot7 = 0
			end
		end

		slot4(slot5, slot6 - slot7)

		uv4 = "ipairs"

		slot4.chatPanel:removeChildByName("officialPanel")

		if not itertools.isempty(slot2) then
			uv4 = "ipairs"
			uv6 = "contentList"

			if slot4.btnsInfo:atproxy(slot6).tag == "world" and time.getTime() < slot2[itertools.size(slot2)].args.end_time then
				uv5 = "ipairs"
				uv7 = "ipairs"
				slot8 = 1430
				slot5 = slot5.item:clone():addTo(slot7.chatPanel, 10, "officialPanel"):xy(240, slot8)
				slot6 = slot5
				uv6 = "ipairs"
				slot6 = slot6.onInitItem
				uv8 = "ipairs"
				slot9 = slot5.show(slot6)

				slot6(slot6, slot8, slot9, nil, {
					isMine = false,
					channel = "official",
					showTime = false,
					msg = slot4.msg,
					args = slot4.args,
					role = {
						vip = 0,
						name = "",
						logo = 1077,
						frame = 1,
						level = false
					},
					type = game.MESSAGE_TYPE_DEFS.official
				})

				uv6 = "ipairs"
				slot6 = slot6.contentList
				slot7 = slot6
				slot6 = slot6.height
				uv8 = "ipairs"
				slot8 = slot8.originSize.height
				uv9 = "showTime"

				if slot9 then
					uv9 = "time"

					if not slot9 then
						slot9 = 0
					end
				end

				slot6(slot7, slot8 - slot9 - slot5:height())
			end
		end
	end):anonyOnly(slot0)
end

function slot2.onPictureClick(slot0, slot1, slot2)
	if not slot0.isPlayAction then
		gGameUI:stackUI("city.chat.emoji", nil, , , slot0.btnsInfo:atproxy(slot0.showTab).tag, slot0.contentList)
	end
end

function slot2.onShowInfo(slot0, slot1, slot2, slot3, slot4)
	if not slot3.isMine then
		slot5, slot6 = slot4:xy()

		gGameUI:stackUI("city.chat.personal_info", nil, , slot4:getParent():convertToWorldSpace(cc.p(slot5, slot6)), slot3)
	end
end

function slot2.onChangePage(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot2.onSendClick(slot0, slot1, slot2)
	if not dataEasy.isChatOpen(gUnlockCsv.worldChat) then
		return
	end

	if slot0.textInput:getStringValue() == nil or slot3 == "" then
		gGameUI:showTip(gLanguageCsv.canNotEmpty)
	else
		gGameApp:requestServer("/game/chat", function (slot0)
			uv1 = "showTab"

			if slot1.showTab:read() == 2 then
				sdk.trackEvent("world_text")
			else
				uv1 = "showTab"

				if slot1.showTab:read() == 3 then
					sdk.trackEvent("union_text")
				end
			end

			uv1 = "showTab"
			slot1 = slot1.contentList
			slot1 = slot1.jumpToBottom

			slot1(slot1)

			uv1 = "showTab"

			slot1.textInput:text("")
		end, slot3, slot0.btnsInfo:atproxy(slot0.showTab:read()).tag)
	end
end

function slot2.onClose(slot0)
	slot0:playAction(false)
end

function slot2.timestampToStr(slot0, slot1)
	slot2 = time.getDate(slot1)

	if time.getTime() - slot1 > 604800 then
		return string.formatex(gLanguageCsv.timeMonthDay, {
			month = slot2.month,
			day = slot2.day
		}) .. " " .. string.format("%02d:%02d", slot2.hour, slot2.min)
	elseif slot2.day ~= time.getDate(time.getTime()).day then
		return gLanguageCsv["weekday" .. (slot2.wday == 1 and 7 or slot2.wday - 1)] .. " " .. slot3
	else
		return slot3
	end
end

return slot2
