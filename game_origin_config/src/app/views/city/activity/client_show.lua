slot0 = require("app.views.city.activity.view")
slot1 = class("ActivityClientShowView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "activity_client_show.json"
slot1.RESOURCE_BINDING = {
	img = "img",
	timeLabel = "timeLabel",
	list = "list",
	time = {
		varname = "time",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	timeLimit = {
		varname = "timeLimit",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	if csv.yunying.yyhuodong[slot1].clientParam.panelImg then
		slot0.img:texture(slot2.clientParam.panelImg)

		if slot2.clientParam.panelImgPos then
			slot4, slot5 = slot0.img:xy()

			slot0.img:xy(slot4 + slot3.x, slot5 + slot3.y)
		end
	end

	if slot2.clientParam.isHideDate then
		slot0.timeLimit:hide()
	elseif matchLanguage({
		"en"
	}) then
		slot3 = ""
		slot5 = {
			"st",
			"nd",
			"rd",
			[22.0] = "nd",
			[31.0] = "st",
			[21.0] = "st",
			[23.0] = "rd"
		}

		for slot10, slot11 in ipairs(string.split(time.getActivityOpenDate(slot1), "-")) do
			slot12 = string.split(slot6[slot10], "/")
			slot13 = string.split(slot12[2], " ")
			slot14 = string.split(slot13[2], "hrs")[1]
			slot15 = "(UTC+%d), "
			slot16 = ({
				"Jan ",
				"Feb ",
				"Mar ",
				"Apr ",
				"May ",
				"Jun ",
				"Jul ",
				"Aug ",
				"Sep ",
				"Oct ",
				"Nov ",
				"Dec "
			})[tonumber(slot12[1])]
			slot17 = tonumber(slot13[1]:match("[^0]+"))

			if UNIVERSAL_TIMEDELTA < 0 then
				slot15 = "(UTC%d), "
			end

			slot18 = "th"

			if slot5[slot17] then
				slot18 = slot5[slot17]
			end

			slot19 = tonumber(slot14) .. ":00 " .. string.format(slot15, UNIVERSAL_TIMEDELTA / 3600) .. slot16 .. slot17 .. slot18
			slot3 = slot10 == 1 and slot19 or slot3 .. "~" .. slot19
		end

		slot0.timeLimit:show():text(slot3)
		adapt.setTextScaleWithWidth(slot0.timeLimit, nil, 680)
	else
		slot0.timeLimit:show():text(time.getActivityOpenDate(slot1))
	end

	slot3 = beauty.textScroll

	slot3({
		fontSize = 42,
		isRich = true,
		list = slot0.list,
		strs = {
			verticalSpace = 21,
			str = "#C0x5B545B#" .. slot2.rDesc
		}
	})

	uv3 = "csv"

	slot3.setCountdown(slot0, slot1, slot0.timeLabel, slot0.time, {
		labelChangeCb = function ()
			uv1 = "adapt"
			uv3 = "adapt"
			slot3 = slot3.time
			uv3 = "adapt"

			adapt.oneLinePos(slot1.timeLabel, {
				slot3,
				slot3.timeLimit
			}, cc.p(15, 0))
		end
	})
end

return slot1
