slot0 = class("SelectFigureView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "character_select_figure.json"
slot0.RESOURCE_BINDING = {
	["leftPanel.figure"] = "leftFigure",
	["rightPanel.figure"] = "rightFigure",
	["leftPanel.select"] = "leftSelect",
	["rightPanel.select"] = "rightSelect",
	input = "input",
	leftPanel = {
		varname = "leftPanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:selectClick(1)
				end)
			}
		}
	},
	rightPanel = {
		varname = "rightPanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:selectClick(2)
				end)
			}
		}
	},
	btnRandom = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRandom")
			}
		}
	},
	btnSure = {
		binds = {
			event = "touch",
			clicksafe = true,
			methods = {
				ended = bindHelper.self("onSure")
			}
		}
	}
}
slot0.RESOURCE_STYLES = {
	full = true
}

function slot0.onCreate(slot0, slot1)
	slot0.cb = slot1

	if not matchLanguage({
		"kr"
	}) then
		slot0:onRandom()
	end

	slot0.input:setPlaceHolderColor(ui.COLORS.DISABLED.WHITE)
	slot0.input:setTextHorizontalAlignment(cc.TEXT_ALIGNMENT_CENTER)

	slot0.figures = csv.newbie_init[1].figures
	slot0.select = idler.new(0)
	slot0.leftFigureCfg = gRoleFigureCsv[slot0.figures[1]]
	slot0.rightFigureCfg = gRoleFigureCsv[slot0.figures[2]]
	slot0.leftSpine = widget.addAnimation(slot0.leftFigure, slot0.leftFigureCfg.resSpine, "standby_loop1"):scale(2.3):xy(slot0.leftFigure:size().width / 2, -100)
	slot0.rightSpine = widget.addAnimation(slot0.rightFigure, slot0.rightFigureCfg.resSpine, "standby_loop1"):scale(2.3):xy(slot0.rightFigure:size().width / 2, -100)

	idlereasy.when(slot0.select, function (slot0, slot1)
		if slot1 ~= 0 then
			uv2 = "figures"
			slot2 = slot2.figures[slot1]
			uv3 = "figures"
			slot3 = slot3.leftSelect
			slot3 = slot3.visible

			slot3(slot3, slot1 == 1)

			uv3 = "figures"
			slot3 = slot3.rightSelect
			slot3 = slot3.visible

			slot3(slot3, slot1 == 2)

			uv3 = "figures"
			slot3 = slot3.leftSelect
			slot3 = slot3.visible

			slot3(slot3, slot1 == 1)

			uv3 = "figures"

			slot3.rightSelect:visible(slot1 == 2)

			if slot1 == 1 then
				uv3 = "figures"
				slot3 = slot3.leftSpine
				slot3 = slot3.x
				uv5 = "figures"

				slot3(slot3, slot5.leftFigure:size().width / 2 + 200)

				uv3 = "figures"
				slot3 = slot3.leftSpine
				slot3 = slot3.play

				slot3(slot3, "standby_loop2")

				uv3 = "figures"
				slot3 = slot3.rightSpine
				slot3 = slot3.play

				slot3(slot3, "weixuanzhong")

				uv3 = "figures"
				slot3 = slot3.rightSpine
				slot3 = slot3.addPlay
				slot5 = "standby_loop1"

				slot3(slot3, slot5)

				uv3 = "figures"
				uv5 = "figures"

				slot3.rightSpine:xy(slot5.rightFigure:size().width / 2, -100)
			else
				uv3 = "figures"
				slot3 = slot3.leftSpine
				slot3 = slot3.xy
				uv5 = "figures"

				slot3(slot3, slot5.leftFigure:size().width / 2, -100)

				uv3 = "figures"
				slot3 = slot3.leftSpine
				slot3 = slot3.play

				slot3(slot3, "weixuanzhong")

				uv3 = "figures"
				slot3 = slot3.leftSpine
				slot3 = slot3.addPlay

				slot3(slot3, "standby_loop1")

				uv3 = "figures"
				slot3 = slot3.rightSpine
				slot3 = slot3.play
				slot5 = "standby_loop2"

				slot3(slot3, slot5)

				uv3 = "figures"
				uv5 = "figures"

				slot3.rightSpine:x(slot5.rightFigure:size().width / 2 - 180)
			end
		else
			uv4 = "figures"
			slot4 = slot4.leftSelect
			uv4 = "figures"

			itertools.invoke({
				slot4,
				slot4.rightSelect
			}, "hide")
		end

		uv4 = "figures"
		slot4 = slot4.leftSelect
		uv4 = "figures"

		itertools.invoke({
			slot4,
			slot4.rightSelect
		}, "y", 100)
	end)
	blacklist:addListener(slot0.input, nil, functools.partial(slot0.nameAdapt, slot0))
end

function slot0.selectClick(slot0, slot1)
	slot0.select:set(slot1)
end

function slot0.onRandom(slot0)
	slot0.input:text(beauty.singleTextLimitWord(randomName(), {
		fontSize = 40
	}, {
		width = 300,
		replaceStr = "",
		onlyText = true
	}))
end

function slot0.nameAdapt(slot0, slot1)
	slot0.input:text(beauty.singleTextLimitWord(slot1 or slot0.input:text(), {
		fontSize = 40
	}, {
		width = 300,
		replaceStr = "",
		onlyText = true
	}))
end

function slot0.onSure(slot0)
	slot0:nameAdapt()

	if slot0.select:read() == 0 then
		gGameUI:showTip(gLanguageCsv.chooseFigure)

		return
	end

	if uiEasy.checkText(slot0.input:text()) then
		gGameApp:requestServer("/game/role/newbie/init", function (slot0)
			uv1 = "addCallbackOnExit"
			slot1 = slot1.addCallbackOnExit
			uv3 = "addCallbackOnExit"

			slot1(slot1, slot3.cb)

			uv1 = "addCallbackOnExit"

			slot1:onClose()
		end, 1, slot1, slot0.figures[slot0.select:read()])
	end

	if slot0.select:read() == 1 then
		sdk.trackEvent("male_char")
	elseif slot0.select:read() == 2 then
		sdk.trackEvent("female_char")
	end
end

return slot0
