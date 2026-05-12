require("battle.app_views.battle.preload_res")

slot0 = {
	loadOver = 2,
	loading = 1,
	switchUI = 3
}
slot2 = class("BattleLoadingView", cc.load("mvc").ViewBase)
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

function slot2.onCreate(slot0, slot1, slot2, slot3, slot4)
	assert(slot4, "entrance was nil !")

	slot0.data = slot1
	slot0.sceneID = slot2
	slot0.modes = slot3 or {}
	slot0.entrance = slot4
	slot0.percent = idler.new(0)

	slot0.tipText:text(csv.loading_tips[math.random(1, csvSize(csv.loading_tips))].tip)
	slot0.bg:texture(string.format("loading/bg_%d.png", gCommonConfigArrayCsv.loadingBgTotal[math.random(1, table.length(gCommonConfigArrayCsv.loadingBgTotal))]))
	slot0:enableAsyncload():asyncFor(functools.partial(slot0.onLoading, slot0), functools.partial(slot0.onLoadOver, slot0))

	slot7, slot8 = slot0.bar:xy()
	slot9 = slot0.bar:box()
	slot10 = widget.addAnimationByKey(slot0:getResourceNode(), "loading/loading_pikaqiu.skel", "effect", "effect_loop", 5):xy(slot7 - slot9.width / 2, slot8 + slot9.height / 2):scale(1.6)

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
	checkGGCheat()
	coroutine.yield()
	slot0.percent:set(6)
	battleEntrance.preloadConfig()
	slot0.percent:set(7)
	cache.texturePreload("battle_common_ui")
	cache.texturePreload("battle_module")
	coroutine.yield()

	slot2 = {}
	slot3 = {}

	if not gMonsterCsv[slot0.sceneID][1] then
		printError(" 查找 monster_scenes 时出错!!! 有场景第一波的配置不存在: sceneID=%s", slot0.sceneID)
	end

	visitFightResources(slot2, slot3, slot4, slot0.data)

	slot8 = slot0.sceneID

	for slot8 = 2, itertools.size(gMonsterCsv[slot8]) do
		for slot13, slot14 in ipairs(gMonsterCsv[slot0.sceneID][slot8].monsters) do
			if slot14 > 0 then
				for slot19, slot20 in ipairs(csv.unit[slot14].skillList) do
					if csv.skill[slot20].sound then
						slot3[slot21.sound.res] = true
					end
				end
			end
		end
	end

	uv5 = "count"

	slot5(slot2, battle.SpriteRes)

	uv5 = "count"

	slot5(slot2, battle.ShowHeadNumberRes)

	uv5 = "count"

	slot5(slot2, battle.MainAreaRes)

	uv5 = "count"

	slot5(slot2, battle.StageRes)

	uv5 = "count"

	slot5(slot2, battle.RestraintTypeIcon)

	slot5 = 0
	slot11 = itertools.size

	log.battleloading.preload(" ---- preLoad res, allCount=", itertools.sum(slot2) + itertools.size(slot3), itertools.sum(slot2), slot11(slot3))
	slot0.percent:set(10)
	coroutine.yield()

	slot10 = 0.01

	performWithDelay(slot0, function ()
		uv0 = "onRunBattleModel"

		slot0:onRunBattleModel()
	end, slot10)

	for slot10, slot11 in pairs(slot2) do
		slot15 = slot11

		log.battleloading.preload(" ---- preload: file path=", slot10, slot15)

		for slot15 = 1, slot11 do
			CSprite.preLoad(slot10)
			slot0.percent:set(10 + 70 * (slot5 + 1) / slot6)
			coroutine.yield()
		end
	end

	slot7 = cc.FileUtils:getInstance()

	if display.textureCache:removeLongTimeUnusedTexturesWithCallback(function (slot0, slot1)
		uv2 = "getRawPathInRepoCache"

		return slot2:getRawPathInRepoCache(slot1:getPath()):find("battle/") == nil and slot2:find("res/spine/koudai_") == nil
	end, 0, -1) > 0 then
		printInfo("remove %d textures in battle.loading", slot8)
	end

	coroutine.yield()
	cc.SpriteFrameCache:getInstance():addSpriteFrames("battle/buff_icon/buffs0.plist")
	cc.SpriteFrameCache:getInstance():addSpriteFrames("battle/txt/txts0.plist")
	coroutine.yield()

	slot0.canPlayMusic = true

	for slot12, slot13 in pairs(slot3) do
		log.battleloading.preload(" ---- preload: audio path=", slot12, slot13)
		audio.preloadSound(slot12)
		slot0.percent:set(10 + 70 * (slot5 + 1) / slot6)
		coroutine.yield()
	end

	for slot12 = 1, 15 do
		collectgarbage("step", 10000)
		slot0.percent:set(80 + slot12)
		coroutine.yield()
	end

	uv10 = "collectgarbage"

	while slot0.loadingState ~= slot10.loadOver do
		collectgarbage("step", 10000)
		coroutine.yield()
	end

	collectgarbage()
	printInfo("battle loading gc over %.2f KB %s s", slot1 - collectgarbage("count"), os.clock() - os.clock())
	slot0.percent:set(100)

	slot10 = coroutine.yield

	slot10()

	uv10 = "collectgarbage"
	slot0.loadingState = slot10.loadOver
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
			uv4 = "gGameUI"
			uv5 = "gGameUI"
			uv6 = "gGameUI"

			gGameUI:switchUI("battle.view", slot3.data, slot4.sceneID, slot5.modes, slot6.entrance)
		end
	end, 0)
end

function slot2.onRunBattleModel(slot0)
	uv1 = "loadingState"
	slot0.loadingState = slot1.loadOver
end

return slot2
