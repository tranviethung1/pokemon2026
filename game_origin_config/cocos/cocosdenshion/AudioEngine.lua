if cc.SimpleAudioEngine == nil then
	return
end

slot0 = {
	stopAllEffects = function ()
		cc.SimpleAudioEngine:getInstance():stopAllEffects()
	end,
	getMusicVolume = function ()
		return cc.SimpleAudioEngine:getInstance():getMusicVolume()
	end,
	isMusicPlaying = function ()
		return cc.SimpleAudioEngine:getInstance():isMusicPlaying()
	end,
	getEffectsVolume = function ()
		return cc.SimpleAudioEngine:getInstance():getEffectsVolume()
	end,
	setMusicVolume = function (slot0)
		cc.SimpleAudioEngine:getInstance():setMusicVolume(slot0)
	end,
	stopEffect = function (slot0)
		cc.SimpleAudioEngine:getInstance():stopEffect(slot0)
	end,
	stopMusic = function (slot0)
		slot1 = false

		if slot0 ~= nil then
			slot1 = slot0
		end

		cc.SimpleAudioEngine:getInstance():stopMusic(slot1)
	end,
	playMusic = function (slot0, slot1)
		slot2 = false

		if slot1 ~= nil then
			slot2 = slot1
		end

		cc.SimpleAudioEngine:getInstance():playMusic(slot0, slot2)
	end,
	pauseAllEffects = function ()
		cc.SimpleAudioEngine:getInstance():pauseAllEffects()
	end,
	preloadMusic = function (slot0)
		cc.SimpleAudioEngine:getInstance():preloadMusic(slot0)
	end,
	resumeMusic = function ()
		cc.SimpleAudioEngine:getInstance():resumeMusic()
	end,
	playEffect = function (slot0, slot1)
		slot2 = false

		if slot1 ~= nil then
			slot2 = slot1
		end

		return cc.SimpleAudioEngine:getInstance():playEffect(slot0, slot2, 1, 0, userDefault.getForeverLocalKey("effectVolume", 100, {
			rawKey = true
		}) / 100)
	end,
	rewindMusic = function ()
		cc.SimpleAudioEngine:getInstance():rewindMusic()
	end,
	willPlayMusic = function ()
		return cc.SimpleAudioEngine:getInstance():willPlayMusic()
	end,
	unloadEffect = function (slot0)
		cc.SimpleAudioEngine:getInstance():unloadEffect(slot0)
	end,
	preloadEffect = function (slot0)
		cc.SimpleAudioEngine:getInstance():preloadEffect(slot0)
	end,
	setEffectsVolume = function (slot0)
		cc.SimpleAudioEngine:getInstance():setEffectsVolume(slot0)
	end,
	pauseEffect = function (slot0)
		cc.SimpleAudioEngine:getInstance():pauseEffect(slot0)
	end,
	resumeAllEffects = function (slot0)
		cc.SimpleAudioEngine:getInstance():resumeAllEffects()
	end,
	pauseMusic = function ()
		cc.SimpleAudioEngine:getInstance():pauseMusic()
	end,
	resumeEffect = function (slot0)
		cc.SimpleAudioEngine:getInstance():resumeEffect(slot0)
	end,
	getInstance = function ()
		return cc.SimpleAudioEngine:getInstance()
	end,
	destroyInstance = function ()
		return cc.SimpleAudioEngine:destroyInstance()
	end
}
