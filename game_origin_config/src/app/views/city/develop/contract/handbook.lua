slot0 = class("ContractHandbookView", Dialog)
slot1 = require("app.views.city.develop.contract.tools")
slot2 = {
	"btn_tj_qb1.png",
	"btn_tj_lv1.png",
	"btn_tj_l1.png",
	"btn_tj_z1.png",
	"btn_tj_c1.png",
	"btn_tj_h1.png"
}
slot3 = {
	"btn_tj_qb2.png",
	"btn_tj_lv2.png",
	"btn_tj_l2.png",
	"btn_tj_z2.png",
	"btn_tj_c2.png",
	"btn_tj_h2.png"
}
slot0.RESOURCE_FILENAME = "contract_handbook.json"
slot0.RESOURCE_BINDING = {
	["leftPanel.item"] = "leftItem",
	tabItem = "tabItem",
	["leftPanel.filterPanel.arrow"] = "filterArrow",
	["rightPanel.fetterPanel"] = "fetterPanel",
	["rightPanel.tip"] = "tip",
	["rightPanel.attrPanel.item"] = "attrItem",
	["rightPanel.descPanel"] = "descPanel",
	leftPanel = "leftPanel",
	["rightPanel.name"] = "rightName",
	["leftPanel.noItem"] = "emptyPanel",
	["rightPanel.list"] = "list",
	["rightPanel.attrPanel.subList"] = "attrSubList",
	["rightPanel.linkPanel"] = "linkPanel",
	["rightPanel.attrPanel"] = "attrPanel",
	["leftPanel.subList"] = "leftSubList",
	rightPanel = "rightPanel",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["leftPanel.list"] = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 4,
				asyncPreload = 20,
				data = bindHelper.self("datas"),
				item = bindHelper.self("leftSubList"),
				cell = bindHelper.self("leftItem"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					idlereasy.when(slot0.selectIdx(), function (slot0, slot1)
						uv2 = "get"
						slot4 = "imgSel"
						uv4 = "imgSel"

						slot2:get(slot4):visible(slot4.k == slot1)
					end):anonyOnly(slot0, slot0:getIdx(slot2).k)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.csvID
							},
							onNode = function (slot0)
								uv2 = "bind"
								uv6 = "bind"
								uv7 = "click"
								uv8 = "functools"

								bind.click(slot2, slot0, {
									method = functools.partial(slot6.clickCell, slot7, slot8)
								})
							end
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick"),
				selectIdx = bindHelper.self("selectIdx", true)
			}
		}
	},
	tabList = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabData"),
				item = bindHelper.self("tabItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:get("normal")
					slot5 = slot1:get("selected")
					slot7 = slot4
					slot6 = slot4.texture
					slot8 = "city/develop/contract/hand_book/"
					uv9 = "get"

					if not slot9[slot3.quality] then
						uv9 = "get"
						slot9 = slot9[1]
					end

					slot6(slot7, slot8 .. slot9)

					slot7 = slot5
					slot6 = slot5.texture
					slot8 = "city/develop/contract/hand_book/"
					uv9 = "normal"

					if not slot9[slot3.quality] then
						uv9 = "normal"
						slot9 = slot9[1]
					end

					slot6(slot7, slot8 .. slot9)

					slot6 = nil

					if slot3.select then
						slot4:hide()

						slot6 = slot5:show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					if not slot3.quality then
						slot6:get("txt"):text(gLanguageCsv.all)
					else
						slot6:get("txt"):text(gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot3.quality]])
					end

					adapt.setTextScaleWithWidth(slot6:get("txt"), nil, slot6:width() - 40)
					slot4:setTouchEnabled(true)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.selectQuality, slot3)
						}
					})
				end
			},
			handlers = {
				selectQuality = bindHelper.self("onSelectQuality")
			}
		}
	},
	["leftPanel.filterPanel"] = {
		varname = "btnFilter",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onFilter")
			}
		}
	},
	["leftPanel.filterPanel.txt"] = {
		varname = "filterTxt",
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot0.onCreate(slot0)
	Dialog.onCreate(slot0)
	slot0.list:setScrollBarEnabled(false)

	slot0.tabData = idlers.new()
	slot0.datas = idlers.new()
	slot0.quality = idler.new()
	slot0.selectIdx = idler.new(1)
	slot0.filterType = idler.new(0)
	slot1 = {}
	slot2 = {}

	for slot6, slot7 in orderCsvPairs(csv.contract.contract) do
		if not slot1[slot7.quality] then
			slot1[slot7.quality] = true

			table.insert(slot2, {
				quality = slot7.quality
			})
		end
	end

	table.sort(slot2, function (slot0, slot1)
		return slot1.quality < slot0.quality
	end)
	table.insert(slot2, 1, {})
	slot0.tabData:update(slot2)
	slot0:setFilterType(0)
	idlereasy.any({
		slot0.quality,
		slot0.filterType
	}, function (slot0, slot1)
		uv2 = "tabData"

		for slot5, slot6 in slot2.tabData:pairs() do
			slot7.select = slot1 == slot6:proxy().quality
		end

		uv2 = "tabData"
		slot2 = slot2.tabData
		slot2 = slot2.notify

		slot2(slot2)

		uv2 = "tabData"
		slot2 = slot2.updateLeftPanel

		slot2(slot2)

		uv2 = "tabData"

		slot2.selectIdx:set(1, true)
	end)
	idlereasy.any({
		slot0.selectIdx
	}, function ()
		uv0 = "updateRightPanel"

		slot0:updateRightPanel()
	end)
end

function slot0.onSelectQuality(slot0, slot1, slot2)
	slot0.quality:set(slot2.quality)
end

function slot0.onItemClick(slot0, slot1, slot2, slot3)
	slot0.selectIdx:set(slot2.k)
end

function slot0.updateLeftPanel(slot0)
	slot1 = slot0.quality:read()
	slot2 = slot0.filterType:read()
	slot3 = {}

	for slot7, slot8 in orderCsvPairs(csv.contract.contract) do
		if (not slot1 or slot1 == slot8.quality) and (slot2 == 0 or slot2 == slot8.type) then
			table.insert(slot3, {
				csvID = slot7,
				cfg = slot8
			})
		end
	end

	table.sort(slot3, function (slot0, slot1)
		if slot0.cfg.quality ~= slot1.cfg.quality then
			return slot1.cfg.quality < slot0.cfg.quality
		end

		return slot0.csvID < slot1.csvID
	end)
	slot0.emptyPanel:visible(itertools.isempty(slot3))
	slot0.datas:update(slot3)
end

function slot0.updateRightPanel(slot0)
	if not slot0.datas:atproxy(slot0.selectIdx:read()) then
		slot0.rightPanel:hide()

		return
	end

	slot0.rightPanel:show()
	slot0.list:removeAllChildren()

	slot3 = slot2.csvID
	slot4 = dataEasy.getCfgByKey(slot3)

	slot0.rightName:text(slot4.name)
	slot0.tip:visible(not slot4.canExpend)

	slot5 = text.addEffect

	slot5(slot0.rightName, {
		color = ui.COLORS.QUALITY[slot4.quality]
	})

	uv5 = "selectIdx"
	slot5 = slot5.getAttrData(slot3)

	slot0.attrPanel:hide()

	slot6 = slot0.attrPanel:clone():show()
	slot7 = slot6:get("list")

	bind.extend(slot0, slot7, {
		class = "tableview",
		props = {
			columnSize = 2,
			data = slot5,
			item = slot0.attrSubList,
			cell = slot0.attrItem,
			onCell = function (slot0, slot1, slot2, slot3)
				slot1:multiget("icon", "text").icon:visible(slot3.sortKey ~= nil)
				slot4.text:text(getLanguageAttr(slot3.attr) .. " +" .. dataEasy.getAttrValueString(slot3.attr, slot3.num))

				if slot3.sortKey ~= nil then
					slot4.icon:texture(ui.ATTR_LOGO[game.ATTRDEF_TABLE[slot3.attr]])
				else
					slot4.text:x(slot4.icon:box().x)
				end
			end
		}
	})

	slot8 = slot6:get("subList"):height() * math.ceil(itertools.size(slot5) / 2)
	slot9 = slot8 - slot7:height()

	slot7:height(slot8):y(slot7:y() - slot9)
	slot7:setTouchEnabled(false)
	setContentSizeOfAnchor(slot6, cc.size(slot6:width(), slot6:height() + slot9))
	slot0.list:pushBackCustomItem(slot6)
	slot0.linkPanel:hide()

	slot10 = slot0.linkPanel:clone()
	slot11 = slot10
	slot10 = slot10.show(slot11)
	uv11 = "selectIdx"

	if slot11.getLinkData(slot3) then
		uv12 = "selectIdx"

		slot12.adaptPanel(slot10, slot11)
		slot0.list:pushBackCustomItem(slot10)
	end

	bind.touch(slot0, slot10:get("btnInfo"), {
		methods = {
			ended = bindHelper.self("onInfoClick")
		}
	})

	slot12 = slot0.fetterPanel
	slot12 = slot12.hide

	slot12(slot12)

	uv12 = "selectIdx"
	slot12, slot13 = slot12.getFetterData(slot3, {
		isActive = true
	})

	if slot12 then
		slot14 = slot0.fetterPanel:clone()
		slot15 = slot14
		slot14 = slot14.show(slot15)
		uv15 = "selectIdx"

		slot15.adaptPanel(slot14, slot12, slot13, slot0)
		slot0.list:pushBackCustomItem(slot14)
	end

	slot0.descPanel:hide()

	slot14 = slot0.descPanel:clone():show()
	slot16 = slot4.desc
	uv16 = "selectIdx"

	slot16.adaptPanel(slot14, "#C0x5B545B#" .. slot16)
	slot0.list:pushBackCustomItem(slot14)
end

function slot0.onInfoClick(slot0)
	gGameUI:stackUI("city.develop.contract.advance_detail", nil, , slot0.datas:atproxy(slot0.selectIdx:read()).csvID)
end

function slot0.onFilter(slot0)
	slot0.filterArrow:setRotation(180)

	slot1 = slot0.btnFilter:size()
	slot2 = slot0.btnFilter:parent():convertToWorldSpace(cc.p(slot0.btnFilter:xy()))
	slot2.x = slot2.x - slot1.width / 2
	slot2.y = slot2.y - slot1.height / 2

	gGameUI:stackUI("city.develop.contract.filter", nil, , slot2, {
		"left",
		"top"
	}, slot0:createHandler("setFilterType"))
end

function slot0.setFilterType(slot0, slot1)
	slot0.filterArrow:setRotation(0)

	if slot1 then
		slot0.filterType:set(slot1)
		slot0.filterTxt:text(gLanguageCsv["contractType" .. slot1] or gLanguageCsv.typeFilter)
		slot0.quality:notify()
	end
end

return slot0
