slot0 = cc.load("mvc").ViewBase
slot1 = class("WeatherSelectView", Dialog)
slot1.RESOURCE_FILENAME = "weather_select.json"
slot1.RESOURCE_BINDING = {
	["panel.item"] = "item",
	["panel.txtWeather"] = "txtWeather",
	panel = "panel",
	["panel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["panel.btnRule"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	["panel.btnSure"] = {
		varname = "btnSure",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSure")
			}
		}
	},
	["panel.btnSure.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["panel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 10,
				asyncPreload = 4,
				data = bindHelper.self("data"),
				item = bindHelper.self("item"),
				weatherID = bindHelper.self("weatherID"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("icon", "select", "imgCheck", "bg", "spriteNode", "name", "txtDesc")

					idlereasy.when(slot0.weatherID, function (slot0, slot1)
						uv2 = "weatherID"
						slot2 = slot1 == slot2.weatherID
						uv3 = "select"
						slot3 = slot3.select
						slot3 = slot3.visible

						slot3(slot3, slot2)

						uv3 = "select"
						slot3 = slot3.imgCheck
						slot3 = slot3.visible

						slot3(slot3, slot2)

						uv3 = "select"

						slot3.bg:visible(not slot2)
					end):anonyOnly(slot0, slot2)

					slot5 = csv.weather_system.weather[slot3.weatherID]

					slot4.name:text(slot5.name)
					slot4.txtDesc:text(slot5.describe)
					slot4.icon:texture(slot5.iconRes)

					slot6 = slot3.data

					bind.extend(slot0, slot4.spriteNode, {
						class = "card_icon",
						props = {
							unitId = slot6.unitID,
							advance = slot6.advance,
							rarity = csv.unit[slot6.unitID].rarity,
							star = slot6.star,
							dbid = slot6.dbid,
							levelProps = {
								data = slot6.level
							},
							onNode = function (slot0)
								slot0:scale(0.8)
							end
						}
					})
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.params = slot1
	slot0.data = idlers.newWithMap(slot1.cardsData)
	slot2 = slot1.weatherID

	if isIdler(slot1.weatherID) then
		slot2 = slot1.weatherID:read()
	end

	if slot1.idx then
		slot2 = slot2[slot1.idx]
	end

	slot0.weatherID = idler.new(slot2)

	idlereasy.when(slot0.weatherID, function (slot0, slot1)
		if csv.weather_system.weather[slot1] then
			uv3 = "csv"

			slot3.txtWeather:text(gLanguageCsv.nowWeather .. slot2.name)
		end
	end)
	Dialog.onCreate(slot0)
end

function slot1.onItemClick(slot0, slot1, slot2, slot3, slot4)
	slot0.weatherID:set(slot4.weatherID)
end

function slot1.onSure(slot0)
	if slot0.params.cb then
		slot0.params.cb(slot0.weatherID:read())
	elseif slot0.params.idx then
		slot0.params.weatherID:modify(function (slot0)
			uv1 = "params"
			uv2 = "params"
			slot0[slot1.params.idx] = slot2.weatherID:read()

			return true, slot0
		end, true)
	else
		slot0.params.weatherID:set(slot0.weatherID)
	end

	Dialog.onClose(slot0)
end

function slot1.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1350
	})
end

function slot1.getRuleContext(slot0, slot1)
	return {
		adaptContext.noteText(133101, 133300)
	}
end

return slot1
