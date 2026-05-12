slot1 = class("SettingSceneView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "setting_scene.json"
slot1.RESOURCE_BINDING = {
	["centerPanel.item"] = "item",
	["centerPanel.subList"] = "subList",
	["centerPanel.btnOK"] = {
		varname = "btnOK",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnOK")
			}
		}
	},
	["centerPanel.btnOK.text"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["centerPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				asyncPreload = 6,
				topPadding = 20,
				columnSize = 2,
				data = bindHelper.self("data"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				preloadCenterIndex = bindHelper.self("preloadCenterIndex"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("img", "selected", "name", "logo", "tip")

					slot4.img:texture(slot3.cfg.path)
					slot4.name:text(slot3.cfg.name)
					idlereasy.when(slot0.usedId(), function (slot0, slot1)
						uv2 = "logo"
						uv4 = "visible"

						slot2.logo:visible(slot1 == slot4.csvId)
					end):anonyOnly(slot0, slot3.csvId)
					idlereasy.when(slot0.selectId(), function (slot0, slot1)
						uv2 = "selected"
						uv4 = "visible"

						slot2.selected:visible(slot1 == slot4.csvId)
					end):anonyOnly(slot0, slot3.csvId)
					slot4.tip:hide()

					if slot0.isActivityScene() and slot5:read() ~= slot3.csvId then
						slot4.tip:show()
						text.addEffect(slot4.tip, {
							color = ui.COLORS.NORMAL.RED,
							outline = {
								color = ui.COLORS.NORMAL.WHITE
							}
						})
						cache.setShader(slot1, false, "hsl_gray")
					elseif not slot7 and not slot3.cfg.canChoose then
						slot4.tip:show():text(gLanguageCsv.settingSceneNotCanChoose)
						text.addEffect(slot4.tip, {
							color = ui.COLORS.NORMAL.RED,
							outline = {
								color = ui.COLORS.NORMAL.WHITE
							}
						})
						cache.setShader(slot1, false, "hsl_gray")
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()

					if itertools.size(slot0.data) == 1 then
						slot0:x(313)
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick"),
				selectId = bindHelper.self("selectId", true),
				usedId = bindHelper.self("usedId", true),
				isActivityScene = bindHelper.self("isActivityScene", true)
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.params = slot1
	slot2, slot0.isActivityScene = dataEasy.getCitySceneIdx()
	slot0.usedId = idler.new(slot2)
	slot0.selectId = idler.new(slot2)
	slot4 = {}

	for slot8, slot9 in orderCsvPairs(csv.cityscene) do
		table.insert(slot4, {
			csvId = slot8,
			cfg = slot9
		})

		if slot8 == slot2 then
			slot0.preloadCenterIndex = math.ceil(#slot4 / 2)
		end
	end

	slot0.data = slot4

	idlereasy.any({
		slot0.selectId,
		slot0.usedId
	}, function (slot0, slot1, slot2)
		uv4 = "uiEasy"
		uv5 = "uiEasy"

		uiEasy.setBtnShader(slot4.btnOK, slot5.btnOK:get("text"), slot1 == slot2 and 2 or 1)
	end)
end

function slot1.onBtnOK(slot0)
	if slot0.selectId:read() == slot0.usedId:read() then
		return
	end

	gGameApp:requestServer("/game/role/city/scene/switch", function (slot0)
		slot1 = dataEasy.getCitySceneIdx()
		uv2 = "dataEasy"

		slot2.usedId:set(slot1)

		slot2 = gGameUI
		slot2 = slot2.showTip

		slot2(slot2, string.format(gLanguageCsv.settingSceneChange, csv.cityscene[slot1].name))

		uv2 = "dataEasy"

		if slot2.params.citySceneIdx then
			uv2 = "dataEasy"

			slot2.params.citySceneIdx:set(slot1)
		end
	end, slot1)
end

function slot1.onItemClick(slot0, slot1, slot2, slot3)
	if slot0.selectId:read() == slot3.csvId then
		return
	end

	if slot0.isActivityScene then
		gGameUI:showTip(gLanguageCsv.settingSceneSpecialActivity)

		return
	end

	if not slot3.cfg.canChoose then
		gGameUI:showTip(gLanguageCsv.settingSceneSpecialActivity)

		return
	end

	slot0.selectId:set(slot3.csvId)
end

return slot1
