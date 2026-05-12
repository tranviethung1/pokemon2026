slot0 = cc.load("mvc").ViewBase
slot1 = class("ActivityPosterView", Dialog)
slot2 = game.YYHUODONG_TYPE_ENUM_TABLE
slot1.RESOURCE_FILENAME = "activity_poster.json"
slot1.RESOURCE_BINDING = {
	["leftPanel.title"] = "checkBoxTitle",
	["leftPanel.checkBox"] = "checkBox",
	["timeNode.activityTime"] = "activityTime",
	btnClose = {
		varname = "btnClose",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	leftPanel = {
		varname = "leftPanel",
		binds = {
			event = "click",
			method = bindHelper.self("onCheckBox")
		}
	},
	btnSkip = {
		varname = "btnSkip",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("jumpToActivity")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	Dialog.onCreate(slot0, {
		blackOpacity = 204,
		blackType = 1,
		clickClose = slot1.clickClose
	})

	slot0.cb = slot1.cb

	if not slot1.state then
		slot0.leftPanel:hide()
	else
		slot0.state = slot1.state()
	end

	slot0.yyID = slot1.id
	slot0.jumpTo = slot1.cfg.clientParam.jumpTo
	slot0.jumpCb = slot1.jumpCb
	slot0.onLimitBoxReFreshRedHint = slot1.onLimitBoxReFreshRedHint

	if slot0.jumpTo and (dataEasy.isUnlock(gUnlockCsv.posterSkip) or slot1.cfg.clientParam.mouthCardSub or slot1.cfg.clientParam.newPackageJump) then
		slot0.btnSkip:show()
	else
		slot0.btnSkip:hide()
	end

	idlereasy.when(slot0.state, function (slot0, slot1)
		uv2 = "checkBox"

		slot2.checkBox:setSelectedState(slot1)
	end)

	slot3 = slot0:getResourceNode()

	ccui.ImageView:create(slot1.cfg.clientParam.res):alignCenter(slot3:size()):scale(2):addTo(slot3):setTouchEnabled(false)
	slot0:initEndTime(slot1)

	if slot1.cfg.clientParam.closeButton then
		slot0.btnClose:loadTextureNormal(slot1.cfg.clientParam.closeButton)
	end

	slot0.showIntervalDay = slot1.cfg.clientParam.showIntervalDay

	if slot0.showIntervalDay then
		slot0.checkBoxTitle:text(string.format(gLanguageCsv.afterAnyDayTips, slot1.cfg.clientParam.showIntervalDay))
	end
end

function slot1.initEndTime(slot0, slot1, slot2)
	if slot1.cfg.clientParam.showId then
		slot0.activityTime:show()

		if slot1.cfg.clientParam.hideHour then
			slot3, slot4, slot5 = time.getYearMonthDay(slot1.cfg.endDate)

			slot0.activityTime:text((slot2 or "") .. string.formatex(gLanguageCsv.timeMonthDay, {
				month = slot4,
				day = slot5
			}))
		else
			slot0.activityTime:text(slot2 .. string.split(time.getActivityOpenDate(slot1.cfg.clientParam.showId), "-")[2])
		end

		if slot1.cfg.clientParam.countInfo then
			slot0.activityTime:setRotation(slot3.rotation or 0)
			slot0.activityTime:x(slot3.posX or slot0.activityTime:x())
			slot0.activityTime:y(slot3.posY or slot0.activityTime:y())

			if slot3.color then
				slot0.activityTime:setTextColor(slot3.color)
			end

			if slot3.outline then
				slot0.activityTime:enableOutline(slot3.outline, slot3.outlineSize or 4)
			end
		end
	else
		slot0.activityTime:hide()
	end
end

function slot1.onCheckBox(slot0)
	slot0.state:modify(function (slot0)
		return true, not slot0
	end)
end

function slot1.jumpToActivity(slot0)
	if slot0.jumpCb then
		slot0.jumpCb()

		return
	end

	if type(slot0.jumpTo) ~= "table" then
		jumpEasy.jumpTo(slot0.jumpTo)
	else
		slot1, slot2 = nil

		for slot6, slot7 in ipairs(slot0.jumpTo) do
			if string.split(slot0.jumpTo[1], "-")[1] == "huodongType" then
				slot1 = tonumber(slot8[2])
			elseif slot8[1] == "huodongId" then
				slot2 = tonumber(slot8[2])
			end
		end

		slot3 = false

		if slot2 then
			slot7 = "yy_open"

			for slot7, slot8 in ipairs(gGameModel.role:read(slot7)) do
				if slot8 == slot2 then
					slot3 = true

					break
				end
			end
		end

		if slot3 then
			jumpEasy.jumpTo("huodongId-" .. slot2)
		else
			jumpEasy.jumpTo("huodongType-" .. slot1)
		end
	end

	slot0:enableMessage():registerMessage("stackUIViewExit", function (slot0, slot1)
		if slot1 == "city.activity.poster" then
			uv3 = "city.activity.poster"

			performWithDelay(slot3, function ()
				uv0 = "onClose"

				slot0:onClose()
			end, 0)
		end
	end)
end

function slot1.onClose(slot0)
	slot0:enableMessage():unregisterMessage("stackUIViewExit")

	if slot0.showIntervalDay and slot0.state:read() == true then
		userDefault.setForeverLocalKey("activity", {
			[slot0.yyID] = tonumber(time.getStrInClock())
		})
	end

	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "enableMessage"

	slot1.onClose(slot0)
end

return slot1
