slot0 = class("SeekPokemonRewardView", Dialog)
slot0.RESOURCE_FILENAME = "activity_seeksprite_reward.json"
slot0.RESOURCE_BINDING = {
	item = "item",
	["title.textTitle2"] = "textTitle2",
	["title.textTitle1"] = "textTitle1",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 12,
				asyncPreload = 4,
				data = bindHelper.self("rankDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					uiEasy.createItemsToList(slot0, slot1:get("list"), slot3.award, {
						scale = 1
					})
					slot1:get("unfinished"):visible(not slot3.indeterminacy)
					slot1:get("finished"):visible(slot3.indeterminacy)
					slot1:get("finished"):texture("activity/seeksprite/txt_xzwb.png")
					slot1:get("finished"):scale(1)
					slot1:get("textRank"):text(string.format(gLanguageCsv.howManyLevels, slot2))
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	for slot7, slot8 in ipairs(slot1 or {}) do
		-- Nothing
	end

	slot0.rankDatas = idlers.newWithMap({
		[slot7] = {
			award = slot8.award,
			indeterminacy = slot7 < slot2
		}
	})

	adapt.oneLinePos(slot0.textTitle1, slot0.textTitle2, nil, "left")
	Dialog.onCreate(slot0)
end

return slot0
