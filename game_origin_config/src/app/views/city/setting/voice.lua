slot0 = require("app.views.city.setting.view")
slot1 = slot0.BTN_TYPE
slot2 = slot0.BTN_DATA
slot3 = {
	OPEN = 100,
	CLOSE = 0
}

function slot4(slot0, slot1, slot2)
	uv3 = "BTN"
	slot3 = slot3[slot1]
	uv4 = "texture"

	if slot1 == slot4.BTN then
		slot0:texture(slot2 and slot3.resNormal or slot3.resSelected)

		if slot2 then
			slot0:get("btnImg"):xy(30, 30)
		else
			slot4:xy(100, 30)
		end
	else
		uv4 = "texture"

		if slot1 == slot4.RADIO then
			slot0:get("btnImg"):visible(slot2)
		end
	end
end

slot6 = class("SettingVoiceView", cc.load("mvc").ViewBase)
slot6.RESOURCE_FILENAME = "setting_voice.json"
slot6.RESOURCE_BINDING = {
	["centerPanel.item"] = "listItem",
	centerPanel = "centerPanel",
	["centerPanel.itemBattleVoice.slider"] = "btSlider",
	["centerPanel.itemBgVoice.slider"] = "bgSlider",
	["centerPanel.slidrBg"] = "sliderBg",
	["centerPanel.text"] = "bottomText",
	["centerPanel.itemBgVoice.btn"] = {
		varname = "itemBgVoiceBtn",
		binds = {
			event = "click",
			method = bindHelper.self("onBgVoiceOpen")
		}
	},
	["centerPanel.itemBattleVoice.btn"] = {
		varname = "itemBattleVoiceBtn",
		binds = {
			event = "click",
			method = bindHelper.self("onBattleVocieOpen")
		}
	},
	["centerPanel.musicList"] = {
		varname = "musicList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 8,
				data = bindHelper.self("listData"),
				item = bindHelper.self("listItem"),
				sliderBg = bindHelper.self("sliderBg"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("switch", "musicName", "voiceImg", "check")

					slot4.musicName:text(slot3.cfg.name)
					slot4.voiceImg:visible(slot3.inTest)
					slot4.check:setSelectedState(slot3.selected)
					slot4.switch:setSelectedState(slot3.inTest)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.playMusic, slot2, slot3)
						}
					})
					slot4.switch:onEvent(functools.partial(slot0.playTestMusic, slot2, slot3))
				end,
				onBeforeBuild = function (slot0)
					if slot0.sliderBg:visible() then
						slot1, slot2 = slot0:xy()
						slot3 = slot0:size()
						slot4, slot5 = slot0.sliderBg:xy()
						slot6 = slot0.sliderBg:size()

						slot0:setScrollBarEnabled(true)
						slot0:setScrollBarColor(cc.c3b(241, 59, 84))
						slot0:setScrollBarOpacity(255)
						slot0:setScrollBarAutoHideEnabled(false)
						slot0:setScrollBarPositionFromCorner(cc.p(slot1 + slot3.width - slot4, (slot3.height - slot6.height) / 2 + 5))
						slot0:setScrollBarWidth(slot6.width)
						slot0:refreshView()
					else
						slot0:setScrollBarEnabled(false)
					end
				end
			},
			handlers = {
				playMusic = bindHelper.self("onPlayMusic"),
				playTestMusic = bindHelper.self("onPlayTestMusic")
			}
		}
	}
}

function slot7(slot0, slot1, slot2, slot3, slot4)
	slot0:set(slot4())
	idlereasy.when(slot0, function (slot0, slot1)
		uv2 = "CLOSE"
		uv3 = "setPercent"
		slot4 = slot3
		slot3 = slot3.setPercent
		slot5 = slot1

		slot3(slot4, slot5)

		uv3 = "BTN"
		uv4 = "CLOSE"
		uv5 = "setPercent"

		slot3(slot4, slot5.BTN, slot1 == slot2.CLOSE)

		uv3 = "BTN"

		slot3(slot1)
	end)
	slot1:addEventListener(function (slot0, slot1)
		if slot1 == ccui.SliderEventType.percentChanged then
			uv2 = "ccui"

			slot2:set(slot0:getPercent())
		end
	end)
end

function slot6.onCreate(slot0)
	slot1 = idler.new()
	slot0.bgVoiceState = slot1
	uv1 = "bgVoiceState"

	slot1(slot0.bgVoiceState, slot0.bgSlider, slot0.itemBgVoiceBtn, function (slot0)
		audio.setMusicVolume(slot0 / 100)
		userDefault.setForeverLocalKey("musicVolume", slot0, {
			rawKey = true
		})
	end, function ()
		return userDefault.getForeverLocalKey("musicVolume", 100, {
			rawKey = true
		})
	end)

	slot1 = idler.new()
	slot0.battleVoiceState = slot1
	uv1 = "bgVoiceState"

	slot1(slot0.battleVoiceState, slot0.btSlider, slot0.itemBattleVoiceBtn, function (slot0)
		audio.setSoundsVolume(slot0 / 100)
		userDefault.setForeverLocalKey("effectVolume", slot0, {
			rawKey = true
		})
	end, function ()
		return userDefault.getForeverLocalKey("effectVolume", 100, {
			rawKey = true
		})
	end)
	slot0.sliderBg:setVisible(csvSize(csv.citysound) > 3)

	slot2 = {}

	for slot6, slot7 in orderCsvPairs(csv.citysound) do
		table.insert(slot2, {
			inTest = false,
			cfg = slot7,
			selected = userDefault.getForeverLocalKey("musicIdx", 1) == slot6
		})
	end

	slot0.listData = idlers.newWithMap(slot2)
end

function slot6.onBattleVocieOpen(slot0)
	slot1 = slot0.battleVoiceState
	slot2 = slot1
	uv2 = "battleVoiceState"
	slot2 = slot0.battleVoiceState
	slot3 = slot2
	slot2 = slot2.set

	if slot2.CLOSE < slot1.read(slot2) then
		uv4 = "battleVoiceState"

		if not slot4.CLOSE then
			uv4 = "battleVoiceState"
			slot4 = slot4.OPEN
		end
	end

	slot2(slot3, slot4)
end

function slot6.onBgVoiceOpen(slot0)
	slot1 = slot0.bgVoiceState
	slot2 = slot1
	uv2 = "bgVoiceState"
	slot2 = slot0.bgVoiceState
	slot3 = slot2
	slot2 = slot2.set

	if slot2.CLOSE < slot1.read(slot2) then
		uv4 = "bgVoiceState"

		if not slot4.CLOSE then
			uv4 = "bgVoiceState"
			slot4 = slot4.OPEN
		end
	end

	slot2(slot3, slot4)
end

function slot6.onCleanup(slot0)
	if slot0.inTest then
		audio.playMusic(csv.citysound[userDefault.getForeverLocalKey("musicIdx", 1)].path)
	end

	uv1 = "inTest"

	slot1.onCleanup(slot0)
end

function slot6.onPlayMusic(slot0, slot1, slot2, slot3)
	for slot7, slot8 in slot0.listData:pairs() do
		slot8:proxy().inTest = false
		slot9.selected = slot7 == slot2
	end

	audio.playMusic(slot3.cfg.path, true, true)
	userDefault.setForeverLocalKey("musicIdx", slot2)
end

function slot6.onPlayTestMusic(slot0, slot1, slot2, slot3)
	slot4 = nil

	for slot8, slot9 in slot0.listData:pairs() do
		slot10 = slot9:proxy()

		if slot8 == slot2 then
			slot10.inTest = not slot10.inTest
			slot0.inTest = slot10.inTest
		else
			slot10.inTest = false
		end

		if slot10.selected then
			slot4 = slot10
		end
	end

	if slot0.inTest then
		audio.playMusic(slot3.cfg.path, true, true)
	else
		audio.playMusic(slot4.cfg.path)
	end
end

return slot6
