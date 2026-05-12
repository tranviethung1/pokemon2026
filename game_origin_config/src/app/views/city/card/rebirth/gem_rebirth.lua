slot0 = class("GemRebirth", Dialog)

function slot1(slot0, slot1)
	if gGameModel.gems:find(slot1):read("card_db_id") then
		ccui.ImageView:create("city/card/helditem/bag/icon_cd.png"):align(cc.p(0.5, 0.5), 40, 30):addTo(slot0, 9999, "isEquiped"):xy(150, 150)
	end
end

slot0.RESOURCE_FILENAME = "rebirth_gem.json"
slot0.RESOURCE_BINDING = {
	item = "item",
	innerList = "innerList",
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
				topPadding = 10,
				leftPadding = 10,
				columnSize = 6,
				data = bindHelper.self("showData"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("name"):text(slot3.cfg.name)

					slot4 = slot1:get("name")
					slot4 = slot4.color

					slot4(slot4, ui.COLORS.QUALITY[slot3.cfg.quality])

					uv4 = "get"

					slot4(slot1, slot3.dbid)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.id,
								num = slot3.num,
								dbId = slot3.dbid
							},
							specialKey = {
								leftTopLv = slot3.level
							},
							onNode = function (slot0)
								uv2 = "bind"
								uv6 = "bind"
								uv7 = "click"
								uv8 = "functools"

								bind.click(slot2, slot0, {
									method = functools.partial(slot6.itemClick, slot7, slot8)
								})
							end
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	tipPanel = {
		binds = {
			event = "visible",
			idler = bindHelper.self("showTip")
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.item:visible(false)
	slot0.list:setScrollBarEnabled(false)
	slot0.innerList:setScrollBarEnabled(false)

	slot0.showData = idlers.new({})
	slot0.handlers = slot1.handlers
	slot2 = {}
	slot3 = {}
	slot0.showTip = idler.new(false)

	for slot8, slot9 in pairs(gGameModel.role:read("gems")) do
		slot10 = gGameModel.gems:find(slot9)
		slot11 = slot10:read("gem_id")

		if slot10:read("level") >= 2 then
			slot13 = {
				num = 1,
				id = slot11,
				cfg = dataEasy.getCfgByKey(slot11),
				level = slot12,
				dbid = slot9,
				cardDbId = slot10:read("card_db_id"),
				dbids = {
					slot9
				}
			}

			if slot12 == 1 then
				if not slot3[slot11] then
					slot3[slot11] = slot13

					table.insert(slot2, slot13)
				else
					table.insert(slot3[slot11].dbids, slot9)

					slot3[slot11].num = slot3[slot11].num + 1
				end
			else
				table.insert(slot2, slot13)
			end
		end
	end

	table.sort(slot2, function (slot0, slot1)
		if (slot0.cardDbId == nil or slot1.cardDbId == nil) and slot0.cardDbId ~= slot1.cardDbId then
			return slot0.cardDbId == nil
		end

		if slot0.cfg.quality ~= slot1.cfg.quality then
			return slot1.cfg.quality < slot0.cfg.quality
		end

		if slot0.cfg.suitID ~= slot1.cfg.suitID then
			return slot0.cfg.suitID < slot1.cfg.suitID
		end

		if slot0.cfg.suitNo ~= slot1.cfg.suitNo then
			return slot0.cfg.suitNo < slot1.cfg.suitNo
		end

		return slot1.level < slot0.level
	end)
	slot0.showData:update(slot2)
	slot0.showTip:set(#slot2 == 0)
	Dialog.onCreate(slot0)
end

function slot0.onItemClick(slot0, slot1, slot2, slot3)
	if gGameModel.gems:find(slot3.dbid):read("card_db_id") then
		gGameUI:showDialog({
			isRich = true,
			btnType = 2,
			cb = function ()
				uv0 = "handlers"

				if slot0.handlers then
					uv0 = "handlers"
					uv1 = "dbid"

					slot0.handlers(slot1.dbid)
				end

				uv0 = "handlers"

				slot0:onClose()
			end,
			content = string.format(gLanguageCsv.inlayCard, uiEasy.getCardName(slot5:read("card_db_id")))
		})
	else
		slot4()
	end
end

return slot0
