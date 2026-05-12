slot1 = class("CardChoose1In2", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "drawcard_2choose1.json"
slot1.RESOURCE_BINDING = {
	["left.btn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("clickLeft")
			}
		}
	},
	["left.card"] = {
		varname = "card1",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("clickLeft")
			}
		}
	},
	["right.btn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("clickRight")
			}
		}
	},
	["right.card"] = {
		varname = "card2",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("clickRight")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.id = slot1
	slot0.cb = slot2
	slot0.cardId = {}

	for slot7 = 1, 2 do
		slot9 = dataEasy.getCfgByKey(slot1).specialArgsMap["choose" .. slot7]

		assertInWindows(slot9, "道具2选1必须要有choose1和choose2, error id(%s)", slot1)

		slot11 = csv.unit[csv.cards[slot9.card.id].unitID]
		slot0.cardId[slot7] = slot9.card.id

		widget.addAnimationByKey(slot0["card" .. slot7], slot11.unitRes, "hero", "standby_loop", 1000):scale(slot11.scale):setSkin(slot11.skin)
	end
end

function slot1.clickLeft(slot0)
	gGameUI:showDialog({
		isRich = true,
		btnType = 2,
		title = gLanguageCsv.spaceTips,
		content = string.format(gLanguageCsv.confirmSelectSprite, csv.cards[slot0.cardId[1]].name),
		cb = function ()
			uv4 = "gGameApp"

			gGameApp:requestServer("/game/role/gift/choose", function (slot0)
				uv1 = "choosed_dbid"
				slot1.choosed_dbid = slot0.view.carddbIDs[1][1]
				uv1 = "choosed_dbid"

				slot1:onClose()
			end, slot4.id, 1, "choose1", true)
		end
	})
end

function slot1.clickRight(slot0)
	gGameUI:showDialog({
		isRich = true,
		btnType = 2,
		title = gLanguageCsv.spaceTips,
		content = string.format(gLanguageCsv.confirmSelectSprite, csv.cards[slot0.cardId[2]].name),
		cb = function ()
			uv4 = "gGameApp"

			gGameApp:requestServer("/game/role/gift/choose", function (slot0)
				uv1 = "choosed_dbid"
				slot1.choosed_dbid = slot0.view.carddbIDs[1][1]
				uv1 = "choosed_dbid"

				slot1:onClose()
			end, slot4.id, 1, "choose2", true)
		end
	})
end

function slot1.onClose(slot0)
	if slot0.cb then
		slot0:addCallbackOnExit(functools.partial(slot0.cb, slot0.choosed_dbid))
	end

	uv1 = "cb"

	slot1.onClose(slot0)
end

return slot1
