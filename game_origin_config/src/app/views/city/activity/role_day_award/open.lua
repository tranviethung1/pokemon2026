slot0 = class("RoleDayAwardOpenView", Dialog)
slot0.RESOURCE_FILENAME = "activity_role_day_award_open.json"
slot0.RESOURCE_BINDING = {
	["panelOpen.btnRecieve.txt"] = "btntxt",
	["panelOpen.list"] = "list",
	["panelOpen.textList"] = "textList",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["panelOpen.btnRecieve"] = {
		varname = "btnRecieve",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRecieveClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.activityID = slot1
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityID"
		slot2 = slot1[slot2.activityID] or {}
		slot4 = (slot2.info or {}).days or 0
		slot5 = gGameModel.role:read("name") or ""
		slot8.rewardlevel, slot7 = next(slot2.stamps)
		uv8 = "activityID"
		uv9 = "activityID"
		uv10 = "activityID"
		uv12 = "activityID"

		uiEasy.createItemsToList(slot9, slot10.list, csv.yunying.roleday_award[slot12.rewardlevel].award, {
			onAfterBuild = function (slot0)
				slot0:setItemAlignCenter()
			end
		})

		if slot7 == 1 then
			uv8 = "activityID"

			slot8.btntxt:text(gLanguageCsv.spaceReceive)
		else
			uv8 = "activityID"

			slot8.btntxt:text(gLanguageCsv.received)
		end

		uv9 = "activityID"
		uv10 = "activityID"
		slot10 = slot10.btnRecieve:get("txt")

		uiEasy.setBtnShader(slot9.btnRecieve, slot10, slot7 == 1 and 1 or 2)

		slot8 = beauty.textScroll
		uv10 = "activityID"

		slot8({
			isRich = true,
			verticalSpace = 36,
			list = slot10.textList,
			strs = string.format(gLanguageCsv.activityRoleDayAward, slot5, slot4)
		})

		uv8 = "activityID"

		slot8.textList:y(656)
	end)
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot0.onRecieveClick(slot0)
	userDefault.setForeverLocalKey("roleDayAwardTime", time.getTime())
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityID, slot0.rewardlevel)
end

return slot0
