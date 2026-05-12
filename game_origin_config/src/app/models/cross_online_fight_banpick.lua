slot0 = class("BanPickModel")

function slot0.ctor(slot0, slot1)
	slot0.game = slot1
	slot0.remote = {
		countdown = 0,
		countdown_timestamp = 0,
		step = 0,
		done = {
			false,
			false
		},
		offline = {
			false,
			false
		},
		inputsteps = {}
	}
end

function slot0.init(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end

	return slot0
end

function slot0.fromServer(slot0, slot1)
	print(" ***************************** BanPickModel.fromServer(d) !!!! ")
	print(" --- step = ", slot1.step, slot1.countdown, slot1.countdown_timestamp, dump(slot1.inputsteps))

	slot0.remote.done = slot1.done
	slot0.remote.offline = slot1.offline

	if slot1.countdown then
		slot0.remote.countdown = slot1.countdown
	end

	if slot1.countdown_timestamp then
		slot0.remote.countdown_timestamp = slot1.countdown_timestamp
	end

	slot2 = #slot0.remote.inputsteps

	for slot6, slot7 in ipairs(slot1.inputsteps) do
		if slot7[1] and slot2 < slot7[1].step + 1 then
			print("table insert inputs", dump(slot7), slot8, slot2)
			assertInWindows(slot8 == slot2 + 1, "BanPickModel:fromServer step error")
			table.insert(slot0.remote.inputsteps, slot7)

			slot2 = slot2 + 1
		end
	end

	slot0.remote.step = #slot0.remote.inputsteps
end

function slot0.ban(slot0, slot1, slot2, slot3)
	slot0:sendPacket({
		action = 1,
		step = slot1 - 1,
		cards = slot2,
		done = slot3
	})
end

function slot0.pick(slot0, slot1, slot2, slot3)
	slot0:sendPacket({
		action = 2,
		step = slot1 - 1,
		cards = slot2,
		done = slot3
	})
end

function slot0.deploy(slot0, slot1, slot2, slot3)
	slot0:sendPacket({
		action = 3,
		step = slot1 - 1,
		cards = slot2,
		done = slot3
	})
end

function slot0.sendPacket(slot0, slot1)
	gGameApp:requestPacket("/onlinefight/input", function (slot0, slot1)
		if slot1 then
			gGameUI:showTip(slot1.err)
		end
	end, {
		input = slot1
	})
end

return slot0
