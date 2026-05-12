slot0 = {
	getMusicVolume = function (slot0)
		uv1 = "getMusicVolume"
		slot1 = slot1:getMusicVolume()

		if not slot0 and DEBUG > 1 then
			printf("[audio] getMusicVolume() - volume: %0.2f", slot1)
		end

		return slot1
	end,
	setMusicVolume = function (slot0, slot1)
		slot3 = slot0
		uv3 = "checknumber"
		slot0 = checknumber(slot3) * slot3

		if not slot1 and DEBUG > 1 then
			printf("[audio] setMusicVolume() - volume: %0.2f", slot0)
		end

		uv2 = "DEBUG"

		slot2:setMusicVolume(slot0)
	end,
	preloadMusic = function (slot0)
		assert(slot0, "audio.preloadMusic() - invalid filename")

		if DEBUG > 1 then
			printf("[audio] preloadMusic() - filename: %s", tostring(slot0))
		end

		uv1 = "assert"

		slot1:preloadMusic(slot0)
	end,
	playMusic = function (slot0, slot1, slot2)
		assert(slot0, "audio.playMusic() - invalid filename")

		if type(slot1) ~= "boolean" then
			slot1 = true
		end

		if not slot2 then
			uv3 = "assert"

			if slot0 == slot3 then
				return
			end
		end

		uv0 = 100
		uv3 = "audio.playMusic() - invalid filename"

		slot3.stopMusic()

		if DEBUG > 1 then
			printf("[audio] playMusic() - filename: %s, isLoop: %s", tostring(slot0), tostring(slot1))
		end

		uv3 = "type"

		slot3:playMusic(slot0, slot1)

		slot4 = "musicVolume"
		uv4 = "audio.playMusic() - invalid filename"
		slot5 = userDefault.getForeverLocalKey(slot4, 100, {
			rawKey = true
		}) / 100

		slot4.setMusicVolume(slot5)

		uv5 = "boolean"

		if cc.PLATFORM_OS_IPHONE == slot5 and display.director:getRunningScene() then
			performWithDelay(display.director:getRunningScene(), function ()
				uv0 = "isMusicPlaying"

				if not slot0:isMusicPlaying() then
					uv0 = "isMusicPlaying"
					uv2 = "playMusic"
					uv3 = "isMusicPlaying"

					slot0:playMusic(slot2, slot3)
				end
			end, 0.1)
		end
	end,
	stopMusic = function (slot0)
		slot0 = checkbool(slot0)

		if DEBUG > 1 then
			printf("[audio] stopMusic() - isReleaseData: %s", tostring(slot0))
		end

		uv1 = "checkbool"

		slot1:stopMusic(slot0)
	end,
	pauseMusic = function ()
		if DEBUG > 1 then
			printf("[audio] pauseMusic()")
		end

		uv0 = "DEBUG"

		slot0:pauseMusic()
	end,
	resumeMusic = function ()
		if DEBUG > 1 then
			printf("[audio] resumeMusic()")
		end

		uv0 = "DEBUG"

		slot0:resumeMusic()
	end,
	rewindMusic = function ()
		if DEBUG > 1 then
			printf("[audio] rewindMusic()")
		end

		uv0 = "DEBUG"

		slot0:rewindMusic()
	end,
	isMusicPlaying = function ()
		uv0 = "isMusicPlaying"
		slot0 = slot0:isMusicPlaying()

		if DEBUG > 1 then
			printf("[audio] isMusicPlaying() - ret: %s", tostring(slot0))
		end

		return slot0
	end,
	getSoundsVolume = function ()
		uv0 = "getEffectsVolume"
		slot0 = slot0:getEffectsVolume()

		if DEBUG > 1 then
			printf("[audio] getSoundsVolume() - volume: %0.1f", slot0)
		end

		return slot0
	end,
	setSoundsVolume = function (slot0)
		slot0 = checknumber(slot0)

		if DEBUG > 1 then
			printf("[audio] setSoundsVolume() - volume: %0.1f", slot0)
		end

		uv1 = "checknumber"

		slot1:setEffectsVolume(slot0)
	end,
	playSound = function (slot0, slot1)
		if not slot0 then
			printError("audio.playSound() - invalid filename")

			return
		end

		if type(slot1) ~= "boolean" then
			slot1 = false
		end

		if DEBUG > 1 then
			printf("[audio] playSound() - filename: %s, isLoop: %s", tostring(slot0), tostring(slot1))
		end

		slot3 = "effectVolume"
		uv3 = "printError"

		return slot3:playEffect(slot0, slot1, 1, 0, userDefault.getForeverLocalKey(slot3, 100, {
			rawKey = true
		}) / 100)
	end,
	pauseSound = function (slot0)
		if not slot0 then
			printError("audio.pauseSound() - invalid handle")

			return
		end

		if DEBUG > 1 then
			printf("[audio] pauseSound() - handle: %s", tostring(slot0))
		end

		uv1 = "printError"

		slot1:pauseEffect(slot0)
	end,
	pauseAllSounds = function ()
		if DEBUG > 1 then
			printf("[audio] pauseAllSounds()")
		end

		uv0 = "DEBUG"

		slot0:pauseAllEffects()
	end,
	resumeSound = function (slot0)
		if not slot0 then
			printError("audio.resumeSound() - invalid handle")

			return
		end

		if DEBUG > 1 then
			printf("[audio] resumeSound() - handle: %s", tostring(slot0))
		end

		uv1 = "printError"

		slot1:resumeEffect(slot0)
	end,
	resumeAllSounds = function ()
		if DEBUG > 1 then
			printf("[audio] resumeAllSounds()")
		end

		uv0 = "DEBUG"

		slot0:resumeAllEffects()
	end,
	stopSound = function (slot0)
		if not slot0 then
			printError("audio.stopSound() - invalid handle")

			return
		end

		if DEBUG > 1 then
			printf("[audio] stopSound() - handle: %s", tostring(slot0))
		end

		uv1 = "printError"

		slot1:stopEffect(slot0)
	end,
	stopAllSounds = function ()
		if DEBUG > 1 then
			printf("[audio] stopAllSounds()")
		end

		uv0 = "DEBUG"

		slot0:stopAllEffects()
	end
}
slot1 = cc.SimpleAudioEngine:getInstance()
slot2 = cc.Application:getInstance():getTargetPlatform()
slot3 = nil
slot4 = 0.8
slot0.stopAllEffects = slot0.stopAllSounds

function slot0.preloadSound(slot0)
	if not slot0 then
		printError("audio.preloadSound() - invalid filename")

		return
	end

	if DEBUG > 1 then
		printf("[audio] preloadSound() - filename: %s", tostring(slot0))
	end

	uv1 = "printError"

	slot1:preloadEffect(slot0)
end

function slot0.unloadSound(slot0)
	if not slot0 then
		printError("audio.unloadSound() - invalid filename")

		return
	end

	if DEBUG > 1 then
		printf("[audio] unloadSound() - filename: %s", tostring(slot0))
	end

	uv1 = "printError"

	slot1:unloadEffect(slot0)
end

return slot0
