slot1 = class("NewNewWorldView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "new_new_world.json"
slot1.RESOURCE_BINDING = {
	["panel.list"] = "awardList",
	["panel.txt1"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(252, 241, 160, 255)
				}
			}
		}
	},
	["panel.txt2"] = {
		varname = "txt2",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(191, 137, 56, 255)
				}
			}
		}
	},
	["panel.txt3"] = {
		varname = "txt3",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(191, 137, 56, 255)
				}
			}
		}
	},
	["panel.btnRecieve"] = {
		varname = "btnRecieve",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRecieveClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.activityID = slot1
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")

	slot0.txt2:text(gLanguageCsv.newnewWorldDesc1)
	slot0.txt3:text(gLanguageCsv.newnewWorldDesc2)
	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityID"
		uv4 = "activityID"

		for slot8, slot9 in csvPairs(csv.yunying.generaltask) do
			if slot9.huodongID == csv.yunying.yyhuodong[slot4.activityID].huodongID then
				uv10 = "activityID"
				slot10.csvID = slot8
				slot10 = (slot1[slot2.activityID] or {}).stamps or {}
				uv12 = "activityID"
				uv13 = "activityID"
				slot13 = slot13.awardList

				uiEasy.createItemsToList(slot12, slot13, slot9.award, {
					margin = 20,
					scale = 0.9,
					onAfterBuild = function ()
						uv0 = "awardList"

						slot0.awardList:setItemAlignCenter()
					end
				})

				slot11 = uiEasy.setBtnShader
				uv12 = "activityID"
				uv13 = "activityID"

				slot11(slot12.btnRecieve, slot13.btnRecieve:get("txt"), slot10[slot8] == 1 and 1 or 2)

				uv11 = "activityID"

				slot11.btnRecieve:get("txt"):text(slot10[slot8] == 1 and gLanguageCsv.spaceReceive or gLanguageCsv.received)

				break
			end
		end
	end)
end

function slot1.onRecieveClick(slot0)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityID, slot0.csvID)
end

return slot1
