function battleEasy.logHerosInfo(slot0, slot1)
	slot2 = nil

	(slot1 ~= "newWave" or lazylog.battle.gate.newWave) and lazylog.battle.scene.allHerosInfo({
		heros = function ()
			slot0 = {}
			uv1 = "heros"

			for slot4, slot5 in slot1.heros:order_pairs() do
				printDebug(" -- 己方: seat=%s, hp=%.2f, hpMax=%.2f mp=%.2f, atk=%.2f, def=%.2f, speed=%.2f", slot5.seat, slot5:hp(), slot5:hpMax(), slot5:mp1(), slot5:damage(), slot5:defence(), slot5:speed())
				table.insert(slot0, slot5)
			end

			return slot0
		end,
		enemyHeros = function ()
			slot0 = {}
			uv1 = "enemyHeros"

			for slot4, slot5 in slot1.enemyHeros:order_pairs() do
				printDebug(" -- 敌方: seat=%s, hp=%.2f, hpMax=%.2f, mp=%.2f, atk=%.2f, def=%.2f, speed=%.2f", slot5.seat, slot5:hp(), slot5:hpMax(), slot5:mp1(), slot5:damage(), slot5:defence(), slot5:speed())
				table.insert(slot0, slot5)
			end

			return slot0
		end
	})
end
