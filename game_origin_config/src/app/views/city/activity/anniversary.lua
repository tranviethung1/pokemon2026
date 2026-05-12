slot0 = class("ActivityAnniversaryView", cc.load("mvc").ViewBase)
slot1 = game.YYHUODONG_TYPE_ENUM_TABLE

function slot2(slot0, slot1)
	if matchLanguage({
		"en"
	}) then
		adapt.setTextScaleWithWidth(slot0, gLanguageCsv.activityTime .. time.getCutDown(slot1, true, true).str, 600)
	else
		adapt.setTextScaleWithWidth(slot0, gLanguageCsv.activityTime .. slot2.date_str, 450)
	end
end

slot0.RESOURCE_FILENAME = "activity_anniversary.json"
slot0.RESOURCE_BINDING = {
	signIn = "signIn",
	shop = "shop",
	gridWalk = "gridWalk",
	horseRace = "horseRace",
	countdownPanel = "countdownPanel",
	braveChallenge = "braveChallenge",
	["countdownPanel.time"] = "countdown"
}
slot0.RESOURCE_STYLES = {
	full = true
}

function slot0.onCreate(slot0, slot1)
	slot0:createTitle()
	slot0:enableSchedule()

	slot0.isRunning = true

	widget.addAnimation(slot0:getResourceNode(), slot1.spineName or "activityheji/znqrk.skel", "effect_ruchang", 0):scale(2):alignCenter(display.sizeInView):addPlay("effect_loop")
	slot0:createTable()

	slot3 = nil

	for slot7, slot8 in ipairs(slot1) do
		if slot0.tb[csv.yunying.yyhuodong[slot8.id].type] then
			slot0.tb[slot9.type].data = slot8
		else
			uv11 = "createTitle"

			if slot9.type == slot11.LoginGift then
				slot10 = 0

				if gGameModel.role:read("yy_endtime")[slot8.id] then
					slot10 = slot12[slot11] - time.getTime()
				end

				if slot10 > 0 then
					slot13 = {
						[slot19.daySum] = {
							award = slot19.award,
							id = slot18
						}
					}

					for slot18, slot19 in csvPairs(csv.yunying.loginweal) do
						if slot19.huodongID == csv.yunying.yyhuodong[slot11].huodongID then
							-- Nothing
						end
					end

					if slot13[1] and ((gGameModel.role:read("yyhuodongs")[slot11] or {}).stamps or {})[slot13[1].id] == 1 then
						slot3 = {
							yyid = slot11,
							data = slot13[1].award,
							cb = function ()
								uv4 = "gGameApp"
								uv5 = "requestServer"

								gGameApp:requestServer("/game/yy/award/get", function (slot0)
									gGameUI:showGainDisplay(slot0)
								end, slot4, slot5[1].id)
							end
						}
					end
				end
			end
		end
	end

	slot0:refreshPanel()

	for slot7, slot8 in pairs(slot0.tb) do
		slot8.node:hide()
	end

	slot0.countdownPanel:hide()
	slot2:setTimeScale(0)
	performWithDelay(slot0, function ()
		uv0 = "setTimeScale"

		slot0:setTimeScale(1)
	end, 0.016666666666666666)
	performWithDelay(slot0, function ()
		uv1 = "pairs"

		for slot3, slot4 in pairs(slot1.tb) do
			slot4.node:show()
		end

		uv0 = "tb"

		if slot0 then
			uv5 = "tb"

			gGameUI:stackUI("city.activity.anniversary_login_gift", nil, {
				blackLayer = true
			}, slot5)
		end
	end, 0.6666666666666666)
	performWithDelay(slot0, function ()
		uv0 = "countdownPanel"
		slot0 = slot0.countdownPanel:scaleY(0.3)
		slot1 = slot0

		slot0.show(slot1)

		uv1 = "countdownPanel"

		transition.executeSequence(slot1.countdownPanel):easeBegin("ELASTICOUT"):scaleTo(2, 1, 1):easeEnd():done()
	end, 1.3)
end

function slot0.refreshPanel(slot0)
	slot1, slot2 = nil

	for slot6, slot7 in pairs(slot0.tb) do
		slot9 = slot7.node:get("icon")

		if not slot7.iconPos then
			slot7.iconPos = cc.p(slot9:xy())
		end

		slot9:stopAllActions()
		slot9:xy(slot7.iconPos)
		slot9:removeChildByName("lock")

		slot10 = ccui.ImageView:create("activity/anniversary/logo_lock.png"):anchorPoint(0.5, 0.5):scale(0.5):xy(slot7.redHintPos.x - 10, slot7.redHintPos.y - 10):addTo(slot9, 2, "icon"):hide()

		if slot7.data then
			slot11 = 0

			if gGameModel.role:read("yy_endtime")[slot7.data.id] then
				slot11 = slot13[slot12] - time.getTime()
			end

			if slot11 <= 0 then
				slot7.isOver = true

				slot10:show()
			else
				slot2 = not slot2 and slot11 or math.min(slot2, slot11)
				slot1 = not slot1 and slot11 or math.max(slot1, slot11)

				slot0:iconRunAction(slot9, slot7.iconPos.x, slot7.iconPos.y)

				if slot7.data.redHint then
					function slot7.data.redHint.props.onNode(slot0)
						slot1 = slot0:scale(0.5)
						slot1 = slot1.xy

						slot1(slot1, 180, 100)

						uv1 = "scale"

						if slot1.redHintPos then
							uv3 = "scale"

							slot0:xy(slot3.redHintPos)
						end
					end

					bind.extend(slot0, slot9, slot7.data.redHint)
				end
			end
		else
			slot10:show()
		end

		slot0:bindClick(slot8, slot7.data, slot7.isOver)
	end

	slot0:unSchedule(1)

	if not slot1 then
		slot0.countdown:text(gLanguageCsv.activityOver)
	else
		uv3 = "pairs"

		slot3(slot0.countdown, slot1)
		slot0:schedule(function ()
			uv0 = "refreshPanel"

			if slot0 <= 0 then
				uv0 = "countdown"

				slot0:refreshPanel()

				return false
			end

			uv0 = "refreshPanel"
			uv1 = "countdown"
			uv2 = "refreshPanel"

			slot0(slot1.countdown, slot2)

			uv0 = "refreshPanel"
			slot0 = slot0 - 1
			uv0 = 1
		end, 1, 0, 1)
		performWithDelay(slot0.countdown, function ()
			uv0 = "refreshPanel"

			slot0:refreshPanel()
		end, slot2)
	end
end

function slot0.createTitle(slot0)
	slot1 = gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "ANNIVERSARY",
		title = gLanguageCsv.anniversary
	})
end

function slot0.iconRunAction(slot0, slot1, slot2, slot3)
	if slot0.isRunning then
		slot4 = 3
		slot5 = 10

		slot1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveTo:create(slot4 / 4, cc.p(slot2, slot3 + slot5)), cc.MoveTo:create(slot4 / 2, cc.p(slot2, slot3 - slot5)), cc.MoveTo:create(slot4 / 4, cc.p(slot2, slot3)))))
	end
end

function slot0.bindClick(slot0, slot1, slot2, slot3)
	bind.click(slot0, slot1, {
		method = function ()
			uv0 = "gGameUI"

			if slot0 then
				uv0 = "showTip"

				if slot0 then
					gGameUI:showTip(gLanguageCsv.activityOver)
				else
					uv0 = "gLanguageCsv"
					uv2 = "gGameUI"

					slot0:onItemClick(slot2)
				end
			else
				gGameUI:showTip(gLanguageCsv.huodongNoOpen)
			end
		end
	})
end

function slot0.createTable(slot0)
	uv2 = "tb"
	slot2 = slot2.gridWalk
	uv2 = "tb"
	slot2 = slot2.braveChallenge
	uv2 = "tb"
	slot2 = slot2.horseRace
	uv2 = "tb"
	slot2 = slot2.itemBuy2
	uv2 = "tb"
	slot0.tb = {
		[slot2] = {
			node = slot0.gridWalk,
			redHintPos = cc.p(155, 82)
		},
		[slot2] = {
			node = slot0.braveChallenge,
			redHintPos = cc.p(160, 86)
		},
		[slot2] = {
			node = slot0.horseRace,
			redHintPos = cc.p(170, 88)
		},
		[slot2] = {
			node = slot0.shop,
			redHintPos = cc.p(154, 78)
		},
		[slot2.playPassport] = {
			node = slot0.signIn,
			redHintPos = cc.p(162, 74)
		}
	}
end

function slot0.onItemClick(slot0, slot1)
	if slot1.func then
		slot1.func(function (...)
			uv1 = "clone"
			slot0 = clone(slot1.params or {})

			for slot4, slot5 in ipairs({
				...
			}) do
				table.insert(slot0, slot5)
			end

			uv3 = "clone"
			uv5 = "clone"

			gGameUI:stackUI(slot3.viewName, nil, slot5.styles, unpack(slot0))
		end, slot1.params or {})
	elseif slot1.viewName then
		gGameUI:stackUI(slot1.viewName, nil, slot1.styles, unpack(slot1.params or {}))
	end
end

return slot0
