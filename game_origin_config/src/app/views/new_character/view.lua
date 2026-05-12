slot0 = class("NewCharacterView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "character.json"
slot0.RESOURCE_BINDING = {}

function slot0.onCreate(slot0)
	performWithDelay(slot0, function ()
		uv0 = "gotoNext"
		slot0 = slot0.gotoNext

		slot0(slot0)

		uv0 = "gotoNext"

		slot0:getResourceNode():onClick(function ()
			uv0 = "onShowNextView"

			slot0:onShowNextView()
		end)
	end, 0)
	audio.playMusic("city.mp3")
end

function slot0.gotoNext(slot0)
	if gGameUI.guideManager:isInGuiding() then
		return
	end

	slot0.showView = false

	if gGameUI.guideManager:checkGuide({
		specialName = "nameAndFigureBefore",
		endCb = functools.partial(slot0.onShowNextView, slot0)
	}) then
		return
	end

	if gGameUI.guideManager:checkGuide({
		specialName = "chooseCardBefore",
		endCb = functools.partial(slot0.onShowNextView, slot0)
	}) then
		return
	end

	slot0:onShowNextView()
end

function slot0.onShowNextView(slot0)
	if gGameUI.guideManager:isInGuiding() then
		return
	end

	if slot0.showView then
		return
	end

	slot0.showView = true

	if not gGameUI.guideManager:checkFinished(1) then
		gGameUI:stackUI("new_character.select_figure", nil, , slot0:createHandler("gotoNext"))

		return
	end

	if not gGameUI.guideManager:checkFinished(2) then
		gGameUI:stackUI("new_character.rotation_card", nil, , slot0:createHandler("gotoNext"))

		return
	end

	sdk.commitRoleInfo(4, function ()
		print("sdk commitRoleInfo new role")
	end)

	if matchLanguageForce({
		"kr",
		"tw",
		"en_us"
	}) then
		sdk.commitRoleInfo(1, function ()
			print("info upload for kr version")
		end)
	end

	gGameUI:switchUI("city.view")
	sdk.trackEvent("create_role")
end

return slot0
