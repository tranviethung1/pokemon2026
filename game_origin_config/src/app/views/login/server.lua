slot0 = 10
slot1 = {
	"login/tag_hot_server.png",
	"login/tag_new_server.png",
	"login/tag_maintain_server.png"
}
slot2 = {
	"login/logo_red.png",
	"login/logo_green.png",
	"login/logo_gray.png"
}
slot3 = class("LoginServerView", Dialog)
slot3.RESOURCE_FILENAME = "login_server.json"
slot3.RESOURCE_BINDING = {
	subList = "subList",
	subTitle = "subTitle",
	title = "title",
	leftItem = "leftItem",
	bottomPanel = "bottomPanel",
	leftPanel = "leftPanel",
	item = "item",
	chooseText = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.RED
				}
			}
		}
	},
	["leftPanel.leftList"] = {
		varname = "leftList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 8,
				padding = 10,
				data = bindHelper.self("areaList"),
				item = bindHelper.self("leftItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()
						text.addEffect(slot1:get("selected"):show():get("name"), {
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					slot7 = slot6:get("name")

					if slot3.isMyServer then
						slot7:setFontSize(slot3.isMyServer and 50 or 40)
						slot7:text(gLanguageCsv.myServer)
					else
						slot7:setFontSize(40)
						slot7:text(string.format("%s %s %d-%d", gLanguageCsv.serverArea, SERVER_MAP[slot3.tag] and SERVER_MAP[slot3.tag].name or "", slot3.leftIdx, slot3.leftIdx + slot3.count - 1))
					end

					bind.click(slot0, slot1, {
						method = functools.partial(slot0.clickCell, slot2)
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onChooseArea")
			}
		}
	},
	btnClose = {
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
				asyncPreload = 12,
				data = bindHelper.self("serverList"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.server
					slot5 = slot3.userData
					slot8 = "tag"
					uv8 = "server"

					slot1:get(slot8):texture(slot8[slot4.status])

					slot8 = "circle"
					uv8 = "userData"

					slot1:get(slot8):texture(slot8[slot4.status])

					if matchLanguage({
						"kr"
					}) then
						slot1:get("name"):text(string.format("%s-%s", getServerArea(slot4.key, nil, true), getServerName(slot4.key, true)))
					else
						slot1:get("name"):text(string.format("%s\n%s", getServerArea(slot4.key, nil, true), getServerName(slot4.key, true)))
					end

					if slot5 then
						slot1:get("tag"):visible(false)
						bind.extend(slot0, slot1, {
							event = "extend",
							class = "role_logo",
							props = {
								logoId = slot5.logo,
								frameId = slot5.frame,
								level = math.max(slot5.level, 1),
								vip = slot5.vip,
								onNode = function (slot0)
									uv4 = "xy"

									slot0:xy(680, slot4:height() / 2):scale(0.75):z(6)
									slot0:get("vip"):xy(160, 20)
								end
							}
						})
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onChooseServer")
			}
		}
	},
	topPanel = {
		varname = "topPanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChooseDefaultServer")
			}
		}
	},
	hideIcon = {
		varname = "hideIcon",
		binds = {
			event = "click",
			method = bindHelper.self("onCheckBox")
		}
	},
	hideTip = {
		varname = "hideTip",
		binds = {
			event = "click",
			method = bindHelper.self("onCheckBox")
		}
	}
}

function slot3.onCreate(slot0, slot1)
	adapt.oneLinePos(slot0.title, slot0.subTitle, cc.p(4, 0))

	slot0.listOriginY = slot0.list:y()
	slot0.servers = slot1

	slot0:initModel()
	slot0:initData()

	slot0.serverList = idlereasy.new()
	slot0.showTab = idler.new(1)

	slot0.showTab:addListener(function (slot0, slot1, slot2)
		uv3 = "areaList"
		slot3 = slot3.areaList:atproxy(slot1)
		slot3.select = false
		uv3 = "areaList"
		slot3 = slot3.areaList:atproxy(slot0)
		slot3.select = true
		uv3 = "areaList"
		slot3 = slot3.resetList
		slot5 = slot0

		slot3(slot3, slot5)

		uv3 = "areaList"
		uv5 = "areaList"

		slot3.serverList:set(slot5:getServerData(slot0))
	end)
	uiEasy.addTabListClipping(slot0.leftList, slot0.leftPanel, {
		offsetX = 12,
		mask = "common/box/box_xzfwq.png",
		rect = cc.rect(187, 60, 1, 1)
	})
	Dialog.onCreate(slot0)
end

function slot3.initModel(slot0)
	slot0.roleInfos = gGameModel.account:read("role_infos")
end

function slot3.onChooseArea(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot3.onChooseServer(slot0, slot1, slot2)
	slot0.setServerInfo(slot2.server)
	slot0:onClose()
end

function slot3.onChooseDefaultServer(slot0)
	if slot0.lastChooseServer then
		slot0:onChooseServer(nil, {
			server = slot0.lastChooseServer
		})
	end
end

function slot3.initData(slot0)
	slot2 = userDefault.getForeverLocalKey("OkamiLan", "", {
		rawKey = true
	})
	slot0.checkStatusVisible = userDefault.getForeverLocalKey("hideLevelStatus", false, {
		rawKey = true
	}) ~= false

	userDefault.setForeverLocalKey("hideLevelStatus", slot0.checkStatusVisible, {
		rawKey = true
	})
	slot0.hideIcon:texture(slot0.checkStatusVisible and "common/icon/radio_selected.png" or "common/icon/radio_normal.png")
	slot0.topPanel:hide()

	slot0.lastChooseServer = nil

	if userDefault.getForeverLocalKey("serverKey", nil, {
		rawKey = true
	}) then
		itertools.first(slot0.servers, function (slot0)
			uv2 = "key"

			if slot0.key == slot2 then
				uv1 = "lastChooseServer"
				slot1.lastChooseServer = slot0
				uv1 = "lastChooseServer"
				slot3 = "img.circle"
				uv3 = "topPanel"

				slot1.topPanel:get(slot3):texture(slot3[slot0.status])

				slot4 = string.format("%s %s", getServerArea(slot0.key, nil, true), getServerName(slot0.key, true))
				slot2 = string.format(gLanguageCsv.brackets, slot4)
				uv2 = "lastChooseServer"
				uv4 = "lastChooseServer"

				if slot2:getRoleInfo(slot4.roleInfos[slot0.key]) then
					uv4 = "lastChooseServer"
					slot1 = slot2 .. " " .. slot4.roleInfos[slot0.key].name
				end

				uv2 = "lastChooseServer"
				slot2 = slot2.topPanel:get("name")
				slot3 = slot2

				slot2.text(slot3, slot1)

				slot2 = adapt.oneLinePos
				uv3 = "lastChooseServer"
				slot3 = slot3.topPanel
				slot4 = slot3
				uv4 = "lastChooseServer"

				slot2(slot3.get(slot4, "name"), slot4.topPanel:get("img"), nil, "right")

				uv2 = "lastChooseServer"

				slot2.topPanel:show()

				return true
			end
		end)
	end

	for slot8, slot9 in ipairs(slot0.servers) do
		if slot0:getRoleInfo(slot0.roleInfos[slot9.key]) then
			table.insert({}, {
				isMyServer = true
			})

			break
		end
	end

	slot5 = {}
	slot6 = 1
	slot7 = 1
	slot8 = #slot0.servers
	slot9 = nil

	while slot6 <= slot8 do
		slot10 = getServerTag(slot0.servers[slot6].key)
		slot11 = 1
		uv13 = "getForeverLocalKey"

		for slot15 = math.min(slot13 - 1, slot8 - slot6), 1, -1 do
			if SERVER_MAP[slot10] == SERVER_MAP[getServerTag(slot0.servers[slot6 + slot15].key)] then
				slot11 = slot15 + 1

				break
			end
		end

		if slot2 ~= "br" and slot2 ~= "vn" or slot10 ~= "en" then
			if slot10 ~= slot9 then
				slot9 = slot10
				slot7 = 1
			end

			table.insert(slot5, {
				count = slot11,
				leftId = slot6,
				leftIdx = slot7,
				tag = slot10,
				server = slot0.servers[slot6]
			})
		end

		slot6 = slot6 + slot11
		slot7 = slot7 + slot11
	end

	for slot13 = #slot5, 1, -1 do
		table.insert(slot4, slot5[slot13])
	end

	slot0.areaList = idlers.newWithMap(slot4)
end

function slot3.onCheckBox(slot0)
	slot0.checkStatusVisible = not slot0.checkStatusVisible
	slot1 = {}

	userDefault.setForeverLocalKey("hideLevelStatus", slot0.checkStatusVisible, {
		rawKey = true
	})
	slot0.hideIcon:texture(slot0.checkStatusVisible and "common/icon/radio_selected.png" or "common/icon/radio_normal.png")
	slot0.serverList:set(slot0:getServerData(slot0.showTab:read()))
end

function slot3.getRoleInfo(slot0, slot1)
	return slot1
end

function slot3.resetList(slot0, slot1)
	slot2 = slot0.areaList:atproxy(slot1)
	slot3 = slot0.listOriginY

	if not slot0.lastChooseServer then
		slot4 = 900 + 140
	end

	if not slot2.isMyServer then
		slot3 = slot3 + 60

		slot0.bottomPanel:show()
	else
		slot4 = slot4 + 60

		slot0.bottomPanel:hide()
	end

	slot0.list:y(slot3)
	slot0.list:height(slot4)
end

function slot3.getServerData(slot0, slot1)
	slot0.hideIcon:visible(false)
	slot0.hideTip:visible(false)

	if slot0.areaList:atproxy(slot1).isMyServer then
		slot0.hideIcon:visible(true)
		slot0.hideTip:visible(true)

		slot3 = {}

		for slot7, slot8 in ipairs(slot0.servers) do
			if slot0:getRoleInfo(slot0.roleInfos[slot8.key]) then
				if not slot0.checkStatusVisible or slot0.roleInfos[slot8.key].level > 1 then
					table.insert(slot3, {
						id = slot7,
						server = slot8,
						userData = slot0.roleInfos[slot8.key]
					})
				end
			end
		end

		table.sort(slot3, function (slot0, slot1)
			if slot0.userData.level ~= slot1.userData.level then
				return slot1.userData.level < slot0.userData.level
			end

			if slot0.userData.vip ~= slot1.userData.vip then
				return slot1.userData.vip < slot0.userData.vip
			end

			return slot0.id < slot1.id
		end)

		return slot3
	end

	slot3 = {}

	for slot7 = slot2.leftId, slot2.leftId + slot2.count - 1 do
		table.insert(slot3, {
			server = slot0.servers[slot7]
		})

		if slot0:getRoleInfo(slot0.roleInfos[slot0.servers[slot7].key]) then
			slot3[#slot3].userData = slot8
		end
	end

	return slot3
end

return slot3
