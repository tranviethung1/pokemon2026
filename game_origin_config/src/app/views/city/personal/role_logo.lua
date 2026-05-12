function slot0(slot0, slot1, slot2, slot3)
	for slot7, slot8 in slot2:ipairs() do
		if slot8:proxy().csvId == slot1 then
			slot9.inUse = false
		end

		if slot9.csvId == slot0 then
			slot9.inUse = true

			slot3:set(slot7)
		end
	end
end

function slot1(slot0, slot1, slot2, slot3, slot4)
	bind.extend(slot0, slot1, {
		event = "extend",
		class = "role_logo",
		props = {
			vip = false,
			level = false,
			logoId = slot2,
			frameId = slot3,
			onNode = function (slot0)
				uv3 = "scale"

				slot0:scale(slot3 or 1):z(3)
			end
		}
	})
end

function slot2(slot0, slot1, slot2, slot3)
	return rich.createWithWidth(slot0, 40, nil, 480):anchorPoint(0.5, 0.5):xy(slot1, slot2):addTo(slot3, 6)
end

function slot3(slot0)
	table.sort(slot0, function (slot0, slot1)
		if slot0.unlocked ~= slot1.unlocked then
			return slot0.unlocked < slot1.unlocked
		end

		return slot0.csvId < slot1.csvId
	end)

	return slot0
end

slot4 = class("PersonalRoleLogoView", Dialog)
slot4.RESOURCE_FILENAME = "personal_role_logo.json"
slot4.RESOURCE_BINDING = {
	title3 = "frameTitle",
	name = "nodeName",
	itemFrame = "itemFrame",
	title = "title",
	leftItem = "leftItem",
	title2 = "logoTitle",
	title1 = "title1",
	logoPanel = "logoPanel",
	subList1 = "subList1",
	itemLogo = "itemLogo",
	condition = "condition",
	subList2 = "subList2",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	leftList = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("leftDatas"),
				item = bindHelper.self("leftItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()
						slot1:get("selected"):show():get("txt"):getVirtualRenderer():setLineSpacing(-10)
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					adapt.setAutoText(slot6:get("txt"), slot3.name, slot6:getSize().height - 40)
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onLeftButtonClick")
			}
		}
	},
	logoList = {
		varname = "logoList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 5,
				asyncPreload = 25,
				data = bindHelper.self("logoData"),
				item = bindHelper.self("subList1"),
				cell = bindHelper.self("itemLogo"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("locked"):visible(slot3.unlocked == 2)
					slot1:get("used"):visible(slot3.inUse)

					slot4 = slot1:get("selected")
					slot4 = slot4.visible

					slot4(slot4, slot3.selectEffect or false)

					uv4 = "get"

					slot4(slot0, slot1, slot3.csvId, false, 1.1)
					bind.click(slot0, slot1, {
						method = functools.partial(slot0.itemClick, slot0:getIdx(slot2), slot3)
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onLogoItemClick")
			}
		}
	},
	frameList = {
		varname = "frameList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 4,
				asyncPreload = 20,
				data = bindHelper.self("frameData"),
				item = bindHelper.self("subList2"),
				cell = bindHelper.self("itemFrame"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("locked"):visible(slot3.unlocked == 2)
					slot1:get("used"):visible(slot3.inUse)

					slot4 = slot1:get("selected")
					slot4 = slot4.visible

					slot4(slot4, slot3.selectEffect or false)

					uv4 = "get"

					slot4(slot0, slot1, false, slot3.csvId)
					bind.click(slot0, slot1, {
						method = functools.partial(slot0.itemClick, slot0:getIdx(slot2), slot3)
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onFrameItemClick")
			}
		}
	},
	btnSave = {
		varname = "btnSave",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSaveClick")
			}
		}
	},
	["btnSave.txt"] = {
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

function slot4.onCreate(slot0, slot1)
	slot0.cb = slot1

	slot0:initModel()

	slot0.leftDatas = idlers.newWithMap({
		{
			name = gLanguageCsv.roleLogo
		},
		{
			name = gLanguageCsv.roleLogoFrame
		}
	})
	slot0.selectFrame = idler.new(slot0.frame:read())
	slot0.selectLogo = idler.new(slot0.logo:read())
	slot0.csvIdLogo = idler.new(slot0.logo:read())
	slot0.csvIdFrame = idler.new(slot0.frame:read())
	slot0.showTab = idler.new(1)

	slot0.showTab:addListener(function (slot0, slot1, slot2)
		uv3 = "leftDatas"
		slot3 = slot3.leftDatas:atproxy(slot1)
		slot3.select = false
		uv3 = "leftDatas"
		slot3.leftDatas:atproxy(slot0).select = true

		if slot0 == 1 then
			uv5 = "leftDatas"
			slot5 = slot5.logoTitle
			uv5 = "leftDatas"
			slot5 = "show"

			itertools.invoke({
				slot5,
				slot5.logoList
			}, slot5)

			slot3 = itertools.invoke
			uv5 = "leftDatas"
			slot5 = slot5.frameTitle
			uv5 = "leftDatas"

			slot3({
				slot5,
				slot5.frameList
			}, "hide")

			uv3 = "leftDatas"
			slot3 = slot3.title1
			slot3 = slot3.text
			slot5 = gLanguageCsv.roleLogo

			slot3(slot3, slot5)

			uv3 = "leftDatas"
			uv5 = "leftDatas"

			slot3.selectLogo:set(slot5.selectLogo:read(), true)
		else
			uv5 = "leftDatas"
			slot5 = slot5.logoTitle
			uv5 = "leftDatas"
			slot5 = "hide"

			itertools.invoke({
				slot5,
				slot5.logoList
			}, slot5)

			slot3 = itertools.invoke
			uv5 = "leftDatas"
			slot5 = slot5.frameTitle
			uv5 = "leftDatas"

			slot3({
				slot5,
				slot5.frameList
			}, "show")

			uv3 = "leftDatas"
			slot3 = slot3.title1
			slot3 = slot3.text
			slot5 = gLanguageCsv.roleLogoFrame

			slot3(slot3, slot5)

			uv3 = "leftDatas"
			uv5 = "leftDatas"

			slot3.selectFrame:set(slot5.selectFrame:read(), true)
		end

		uv4 = "leftDatas"
		uv5 = "leftDatas"

		adapt.oneLinePos(slot4.title, slot5.title1, cc.p(10, 0), "left")
	end)

	slot0.logoData = idlers.new()

	idlereasy.when(slot0.activeLogos, function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in pairs(gRoleLogoCsv) do
			uv8 = "pairs"

			table.insert(slot2, {
				csvId = slot6,
				inUse = slot8.logo:read() == slot6,
				unlocked = slot1[slot6] and 1 or 2,
				cfg = slot7
			})
		end

		uv3 = "pairs"
		uv5 = "gRoleLogoCsv"

		slot3.logoData:update(slot5(slot2))
	end)

	slot0.frameData = idlers.new()

	idlereasy.when(slot0.frames, function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in pairs(gRoleFrameCsv) do
			uv8 = "pairs"

			if slot7.isShow or not slot7.isShow and slot1[slot6] then
				table.insert(slot2, {
					csvId = slot6,
					inUse = slot8.frame:read() == slot6,
					unlocked = slot1[slot6] and 1 or 2,
					cfg = slot7
				})
			end
		end

		uv3 = "pairs"
		uv5 = "gRoleFrameCsv"

		slot3.frameData:update(slot5(slot2))
	end)
	slot0.logo:addListener(function (slot0, slot1)
		uv2 = "logoData"
		uv5 = "selectLogo"
		uv6 = "selectLogo"

		slot2(slot0, slot1, slot5.logoData, slot6.selectLogo)
	end)
	slot0.frame:addListener(function (slot0, slot1)
		uv2 = "frameData"
		uv5 = "selectFrame"
		uv6 = "selectFrame"

		slot2(slot0, slot1, slot5.frameData, slot6.selectFrame)
	end)
	slot0.selectFrame:addListener(function (slot0, slot1)
		uv2 = "setRightPanel"
		uv6 = "setRightPanel"

		slot2:setRightPanel(slot0, slot1, slot6.frameData)
	end)
	slot0.selectLogo:addListener(function (slot0, slot1)
		uv2 = "setRightPanel"
		uv6 = "setRightPanel"

		slot2:setRightPanel(slot0, slot1, slot6.logoData)
	end)
	Dialog.onCreate(slot0)
end

function slot4.initModel(slot0)
	slot0.logo = gGameModel.role:getIdler("logo")
	slot0.logos = gGameModel.role:getIdler("logos")
	slot0.figures = gGameModel.role:getIdler("figures")
	slot0.frame = gGameModel.role:getIdler("frame")
	slot0.frames = gGameModel.role:getIdler("frames")
	slot0.pokedex = gGameModel.role:getIdler("pokedex")
	slot0.activeLogos = gGameModel.role:getIdler("active_logos")
end

function slot4.setRightPanel(slot0, slot1, slot2, slot3)
	slot0.condition:removeAllChildren()
	slot0.condition:text("")

	if slot3:atproxy(slot1).unlocked == 2 then
		slot0.condition:text(slot4.cfg.unlockDesc)

		if slot0.condition:size().width > 480 then
			slot6 = slot0.condition
			slot6 = slot6.text

			slot6(slot6, "")

			uv6 = "atproxy"

			slot6("#C0x5B545B#" .. slot5, 0, 0, slot0.condition)
		end
	end

	slot0.btnSave:visible(slot4.unlocked == 1)
	slot0.nodeName:text(slot4.cfg.name)

	if matchLanguage({
		"en"
	}) then
		slot0.nodeName:hide()
		slot0:getResourceNode():removeChildByName("rich")
		rich.createByStr("#C0x5B545B#" .. slot4.cfg.name, 40):anchorPoint(0.5, 0.5):xy(slot0.logoPanel:x(), slot0.nodeName:y()):addTo(slot0:getResourceNode()):name("rich"):z(1)
	end

	if slot0.showTab:read() == 1 then
		uv5 = "condition"

		slot5(slot0, slot0.logoPanel, slot4.csvId, slot0.csvIdFrame:read(), 1.5)
	else
		uv5 = "condition"

		slot5(slot0, slot0.logoPanel, slot0.csvIdLogo:read(), slot4.csvId, 1.5)
	end

	if slot3:atproxy(slot2) then
		slot5.selectEffect = false
	end

	slot4.selectEffect = true
end

function slot4.onLeftButtonClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot4.onFrameItemClick(slot0, slot1, slot2, slot3)
	slot0.selectFrame:set(slot2.k)
	slot0.csvIdFrame:set(slot3.csvId)
end

function slot4.onLogoItemClick(slot0, slot1, slot2, slot3)
	slot0.selectLogo:set(slot2.k)
	slot0.csvIdLogo:set(slot3.csvId)
end

function slot4.onSaveClick(slot0)
	if slot0.showTab:read() == 1 then
		if slot0.logoData:atproxy(slot0.selectLogo:read()).unlocked == 2 then
			gGameUI:showTip(gLanguageCsv.logoNotUnlock)

			return
		end

		slot3 = {}

		if slot0.logo:read() == slot2.csvId then
			gGameUI:showTip(gLanguageCsv.logoHasBeenSaved)

			return
		end

		gGameApp:requestServer("/game/role/logo", function ()
			gGameUI:showTip(gLanguageCsv.logoWasSavedSuccessfully)
		end, slot2.csvId)

		return
	end

	if slot0.frameData:atproxy(slot0.selectFrame:read()).unlocked == 2 then
		gGameUI:showTip(gLanguageCsv.frameNotUnlock)

		return
	end

	if slot0.frame:read() == slot2.csvId then
		gGameUI:showTip(gLanguageCsv.frameHasBeenSaved)

		return
	end

	gGameApp:requestServer("/game/role/frame", function ()
		gGameUI:showTip(gLanguageCsv.frameWasSavedSuccessfully)
	end, slot2.csvId)
end

function slot4.onClose(slot0)
	slot4 = slot0.frameData:atproxy(slot0.selectFrame:read())

	if slot0.logo:read() ~= slot0.logoData:atproxy(slot0.selectLogo:read()).csvId and slot2.unlocked == 1 or slot0.frame:read() ~= slot4.csvId and slot4.unlocked == 1 then
		gGameUI:showDialog({
			btnType = 2,
			content = slot5 and gLanguageCsv.changesHaveBeenDetectedLogo or gLanguageCsv.changesHaveBeenDetectedFrame,
			cb = function ()
				uv1 = "Dialog"

				Dialog.onClose(slot1)
			end
		})

		return
	end

	Dialog.onClose(slot0)
end

function slot4.onChangeClick(slot0, slot1)
	slot0.selectPage:set(slot1)
end

return slot4
