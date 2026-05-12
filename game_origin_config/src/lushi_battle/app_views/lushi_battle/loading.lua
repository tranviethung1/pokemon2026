require("lushi_battle.models.defines")

slot0 = {
	loadOver = 2,
	loading = 1,
	switchUI = 3
}
slot2 = class("AutoChessLoadingView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "battle_loading.json"
slot2.RESOURCE_BINDING = {
	bg = "bg",
	bar = {
		varname = "bar",
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				maskImg = "common/icon/mask_bar_red.png",
				data = bindHelper.self("percent")
			}
		}
	},
	percentText = {
		binds = {
			{
				event = "text",
				idler = bindHelper.self("percent"),
				method = function (slot0)
					return math.floor(slot0) .. "%"
				end
			},
			{
				event = "effect",
				data = {
					outline = {
						color = ui.COLORS.OUTLINE.DEFAULT
					}
				}
			}
		}
	},
	tipText = {
		varname = "tipText",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	}
}

function slot3(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot6] = 1 + (slot0[slot6] or 0)
	end
end

function slot2.onCreate(slot0, slot1)
	slot0.data = slot1
	slot0.modes = {}
	slot0.percent = idler.new(0)

	slot0.tipText:text(csv.loading_tips[math.random(1, csvSize(csv.loading_tips))].tip)
	slot0.bg:texture(string.format("loading/bg_%d.png", gCommonConfigArrayCsv.loadingBgTotal[math.random(1, table.length(gCommonConfigArrayCsv.loadingBgTotal))]))
	slot0:enableAsyncload():asyncFor(functools.partial(slot0.onLoading, slot0), functools.partial(slot0.onLoadOver, slot0))

	slot4, slot5 = slot0.bar:xy()
	slot6 = slot0.bar:box()
	slot7 = widget.addAnimationByKey(slot0:getResourceNode(), "loading/loading_pikaqiu.skel", "effect", "effect_loop", 5):xy(slot4 - slot6.width / 2, slot5 + slot6.height / 2):scale(1.6)

	idlereasy.when(slot0.percent, function (slot0, slot1)
		uv2 = "x"
		uv4 = "width"
		uv5 = "x"
		slot5 = slot5.width / 2
		uv5 = "x"

		slot2:x(slot4 - slot5 + slot1 * slot5.width / 100)
	end)

	slot0.canPlayMusic = false

	if not slot0.modes.baseMusic then
		slot0.modes.baseMusic = string.format("battle%d.mp3", math.random(1, 5))
	end

	audio.preloadMusic(slot0.modes.baseMusic)
end

function slot2.onLoading(slot0)
	slot2 = "count"
	slot1 = collectgarbage(slot2)
	uv2 = "collectgarbage"
	slot0.loadingState = slot2.loading

	slot0.percent:set(1)
	coroutine.yield()
	slot0.percent:set(4)
	cache.onBattleClear()
	coroutine.yield()
	slot0.percent:set(5)
	coroutine.yield()
	slot0.percent:set(6)
	battleEntrance.preloadConfig()

	for slot5, slot6 in ipairs(lushi.PreloadCsv) do
		slot7 = loadstring("return " .. slot6)()

		printDebug("battle preload %s %s %s", slot6, slot7, table.nums(slot7))
	end

	slot4 = 7

	slot0.percent:set(slot4)
	coroutine.yield()

	slot2 = {}
	slot3 = {}
	uv4 = "count"

	slot4(slot2, lushi.PreLoadSpireRes)

	slot4 = 0
	slot10 = itertools.size

	log.battleloading.preload(" ---- preLoad res, allCount=", itertools.sum(slot2) + itertools.size(slot3), itertools.sum(slot2), slot10(slot3))
	slot0.percent:set(10)
	coroutine.yield()

	slot9 = 0.01

	performWithDelay(slot0, function ()
		uv0 = "onRunBattleModel"

		slot0:onRunBattleModel()
	end, slot9)

	for slot9, slot10 in pairs(slot2) do
		slot14 = slot10

		log.battleloading.preload(" ---- preload: file path=", slot9, slot14)

		for slot14 = 1, slot10 do
			CSprite.preLoad(slot9)
			slot0.percent:set(10 + 70 * (slot4 + 1) / slot5)
			coroutine.yield()
		end
	end

	slot6 = cc.FileUtils:getInstance()

	if display.textureCache:removeLongTimeUnusedTexturesWithCallback(function (slot0, slot1)
		uv2 = "getRawPathInRepoCache"

		return slot2:getRawPathInRepoCache(slot1:getPath()):find("lushi/") == nil and slot2:find("battle/") == nil and slot2:find("res/spine/koudai_") == nil
	end, 0, -1) > 0 then
		printInfo("remove %d textures in battle.loading", slot7)
	end

	coroutine.yield()

	slot0.canPlayMusic = true

	for slot11 = 1, 15 do
		collectgarbage("step", 10000)
		slot0.percent:set(80 + slot11)
		coroutine.yield()
	end

	uv9 = "collectgarbage"

	while slot0.loadingState ~= slot9.loadOver do
		collectgarbage("step", 10000)
		coroutine.yield()
	end

	collectgarbage()
	printInfo("battle loading gc over %.2f KB %s s", slot1 - collectgarbage("count"), os.clock() - os.clock())
	slot0.percent:set(100)

	slot9 = coroutine.yield

	slot9()

	uv9 = "collectgarbage"
	slot0.loadingState = slot9.loadOver
end

function slot2.onPlayMusic(slot0, slot1, slot2)
	if not slot0.canPlayMusic then
		return
	end

	if slot1 then
		audio.playMusic(slot1)
	else
		audio.playMusic(slot0.modes.baseMusic)

		slot0.canPlayMusic = false
	end
end

function slot2.onLoadOver(slot0)
	uv2 = "loadingState"

	if slot0.loadingState ~= slot2.loadOver then
		return
	end

	slot0.percent:set(100)
	performWithDelay(slot0, function ()
		if not gGameUI.isPlayVideo then
			uv0 = "gGameUI"
			uv1 = "isPlayVideo"
			slot0.loadingState = slot1.switchUI
			uv0 = "gGameUI"

			slot0:onPlayMusic()

			uv3 = "gGameUI"

			gGameUI:switchUI("lushi_battle.view", slot3.data)
		end
	end, 0)
end

function slot2.onRunBattleModel(slot0)
	uv1 = "loadingState"
	slot0.loadingState = slot1.loadOver
end

return slot2
