require("battle.app_views.battle.battle_entrance.local")

function slot0(slot0, ...)
	if slot0 == nil then
		return
	end

	return slot0(...)
end

slot1 = battleEntrance._switchUI
slot2 = battleEntrance._runBattleModel
slot3 = battleEntrance._localHack
slot4 = {
	__cname = "remoteRunnerFuncs",
	__index = slot4,
	onStartOK = function (slot0, slot1)
		slot0._onStartOK = slot1

		return slot0
	end,
	onRequestCustom = function (slot0, slot1)
		slot0._onRequestCustom = slot1

		return slot0
	end,
	onResult = function (slot0, slot1)
		slot0._onResult = slot1

		return slot0
	end
}

function slot4.run(slot0)
	slot0._isRun = true
	slot0._runStarted = true

	function slot0._runBattle()
		uv0 = "_runOver"
		uv1 = "_runOver"

		slot0(slot1)

		uv0 = "_runOver"
		slot0._runOver = true
	end

	slot1 = gGameApp:requestServerCustom(slot0._startUrl)
	slot2 = slot1
	slot1 = slot1.params(slot2, unpack(slot0._startArgs, 1, slot0._startArgsN))
	uv2 = "_runStarted"

	slot2(slot0._onRequestCustom, slot1)
	slot1:doit(function (slot0)
		slot1 = gGameModel.battle
		slot2 = slot1
		slot1 = slot1.getData(slot2)
		uv2 = "gGameModel"
		uv3 = "battle"
		slot3 = slot3._onStartOK

		slot2(slot3, slot1)

		uv2 = "battle"
		slot2._data = slot1
		uv2 = "gGameModel"
		uv3 = "battle"

		slot2(slot3._runBattle)
	end)

	return slot0
end

function slot4.show(slot0)
	slot0._isShow = true

	function slot1()
		slot0 = assert
		uv1 = "assert"
		slot1 = slot1._data

		slot0(slot1, "battle data was nil")

		uv0 = "_data"
		uv1 = "assert"

		slot0(slot1, function ()
			uv0 = "_runOver"

			if slot0._runOver then
				slot0 = assert
				uv1 = "_runOver"
				slot1 = slot1._postRespOver

				slot0(slot1, "request must be done before battle.view")

				uv0 = "assert"
				slot0 = slot0.postEndResultToServer
				uv1 = "_runOver"

				slot0(slot1)

				uv0 = "assert"
				slot0 = slot0.enableQuickPass
				uv1 = "_runOver"

				slot0(slot1)

				uv0 = "assert"
				uv1 = "_runOver"

				slot0.enableQuickPassOneWave(slot1)
			end
		end, function ()
			uv0 = "_runBattleInLoading"

			if slot0._runBattleInLoading then
				uv0 = "onRunBattleModel"
				uv1 = "_runBattleInLoading"

				slot0.onRunBattleModel(slot1)
			end
		end)
	end

	if slot0._runStarted or slot0._runOver then
		if slot0._runOver then
			return slot1()
		end

		slot0._runBattleInLoading = slot0._runBattle
		slot0._runBattle = slot1

		if slot0._onResult then
			slot2 = slot0._onResult

			function slot0._onResult()
				uv0 = "_data"
				uv1 = "_results"
				uv2 = "_results"

				slot0(slot1._data, slot2._results)
			end
		end

		return
	end

	slot2 = gGameApp:requestServerCustom(slot0._startUrl)
	slot3 = slot2
	slot2 = slot2.params(slot3, unpack(slot0._startArgs, 1, slot0._startArgsN))
	uv3 = "_runStarted"

	slot3(slot0._onRequestCustom, slot2)
	slot2:doit(function (slot0)
		slot1 = gGameModel.battle
		slot3 = slot1
		slot2 = slot1.getData(slot3)
		uv3 = "gGameModel"
		uv4 = "battle"

		slot3(slot4._onStartOK, slot2)

		slot3 = assert
		slot4 = slot2

		slot3(slot4, "battle data was nil")

		uv3 = "battle"
		slot3._data = slot2
		uv3 = "getData"
		uv4 = "battle"

		slot3(slot4, function ()
			uv0 = "checkCheat"
			slot1 = slot0
			slot0 = slot0.checkCheat

			slot0(slot1)

			uv0 = "showEndView"
			uv1 = "checkCheat"

			slot0.showEndView(slot1)
		end)
	end)
end

function slot4.restart(slot0)
	slot1 = slot0._runStarted
	slot2 = slot0._runOver

	assert(slot0._isRun or slot0._isShow, "remote entrance no run and show")

	slot0._runStarted = false
	slot0._runOver = false
	slot0._runBattle = nil
	slot0._runBattleInLoading = nil
	slot0._data = nil
	slot0._results = nil

	if slot0._isRun then
		slot0:run()
	end

	if slot0._isShow then
		slot0:show()
	end
end

function battleEntrance.battleRequest(slot0, ...)
	slot1 = select("#", ...)
	uv6 = "select"

	return setmetatable({
		_post = true,
		_startUrl = slot0,
		_startArgsN = slot1,
		_startArgs = table.flatArray({
			...
		}, slot1)
	}, slot6)
end
