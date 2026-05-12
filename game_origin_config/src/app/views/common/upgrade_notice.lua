slot1 = class("UpgradeNoticeView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "common_upgrade_notice.json"
slot1.RESOURCE_BINDING = {
	top = "top",
	["top.limitItem"] = "limitItem",
	item = "noticeItem",
	["top.revertItem"] = "revertItem",
	["top.limitItem.textNum"] = "newLimit",
	["top.limitItem.textOldNum"] = "oldLimit",
	["top.revertItem.textNum"] = "staminaGive",
	back = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["top.imgInfo"] = {
		varname = "imgInfo",
		binds = {
			event = "extend",
			class = "text_atlas",
			props = {
				isEqualDist = false,
				align = "center",
				pathName = "lv_big",
				data = bindHelper.self("roleLv"),
				onNode = function (slot0)
					slot0:xy(415, 200)
				end
			}
		}
	},
	list = {
		varname = "noticeList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				data = bindHelper.self("noticeDatas"),
				item = bindHelper.self("noticeItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("imgBG", "imgIconBG", "imgIcon", "lockPanel", "textName", "textDesc", "imgUnLock", "lock", "btnJump")
					slot6 = "common/box/box_panel.png"

					if not slot3.isOpened then
						slot6 = "common/box/box_panel_2.png"
					end

					slot4.imgBG:texture(slot6)
					slot4.imgIcon:texture(slot3.icon)
					slot4.lockPanel:visible(not slot5)
					slot4.textName:text(slot3.name)
					slot4.textDesc:text(slot3.desc)
					slot4.imgUnLock:visible(slot3.isOpened)
					slot4.lock:get("textLv"):text(gLanguageCsv.textLv2)
					slot4.lock:get("textLvNum"):text(slot3.openLv)
					slot4.lock:visible(not slot3.isOpened)
					slot4.btnJump:visible(slot3.isOpened and string.len(slot3.goToPanel) > 0)
					slot4.lockPanel:get("imgBg"):hide()

					slot7 = slot5 and cc.c3b(255, 255, 255) or cc.c3b(128, 128, 128)

					slot4.imgIconBG:color(slot7)
					slot4.imgIcon:color(slot7)
					text.addEffect(slot4.btnJump:get("textNote"), {
						glow = {
							color = ui.COLORS.GLOW.WHITE
						}
					})
					bind.touch(slot0, slot4.btnJump, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
					adapt.oneLinePos(slot4.textName, slot4.imgUnLock, cc.p(50, 0))
				end
			},
			handlers = {
				clickCell = bindHelper.self("onGoClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	audio.playEffectWithWeekBGM("role_levelup.mp3")
	slot0:initModel()
	sdk.commitRoleInfo(2, function ()
		print("commitRoleInfo level up callback")
	end)

	slot2 = slot0.roleLv:read()
	slot3 = gGameModel.role:read("trainer_level")

	slot0.oldLimit:text(gRoleLevelCsv[slot1].staminaMax)
	slot0.newLimit:text(gRoleLevelCsv[slot2].staminaMax)
	slot0.staminaGive:text(gRoleLevelCsv[slot2].staminaGive)

	slot5 = {}

	for slot10, slot11 in orderCsvPairs(csv.notice) do
		if slot11.noticeLv <= slot2 and slot2 <= slot11.openLv then
			slot6 = 0 + 1

			table.insert(slot5, {
				csvId = slot10,
				name = slot11.name,
				icon = slot11.icon,
				desc = slot11.desc,
				openLv = slot11.openLv,
				isOpened = slot11.openLv <= slot2,
				priority = slot2 == slot11.openLv and -1 or slot11.type,
				goToPanel = slot11.goToPanel
			})
		end

		if slot6 == 3 then
			break
		end
	end

	slot0.noticeDatas = slot5

	if next(slot5) == nil then
		slot0.top:y(760)
		slot0.imgInfo:y(slot0.imgInfo:y() + 74)
		slot0.noticeList:visible(false)
	elseif #slot5 < 3 then
		slot0.top:y(988)
		slot0.noticeList:size(1605, 495)
		slot0.noticeList:y(slot0.noticeList:y() + 94)
	end

	slot7 = slot0.imgInfo

	widget.addAnimationByKey(slot7, "level/jiesuanshengli.skel", "jiesuanshengli", "shengji", 1):anchorPoint(cc.p(0.5, 0.5)):xy(slot7:width() / 2 + 15, -340):addPlay("shengji_loop")

	if slot2 == 2 then
		sdk.trackEvent("lvl_2")
	elseif slot2 == 6 then
		sdk.trackEvent("lvl_6")
	elseif slot2 == 23 then
		sdk.trackEvent("lvl_24")
	elseif slot2 == 28 then
		sdk.trackEvent("lvl_28")
	end

	slot0:initGoodComments()
	slot0:initTiktok()
end

function slot1.initGoodComments(slot0)
	if not APP_CHANNEL:find("ks_") then
		return
	end

	slot2 = 0

	for slot6, slot7 in ipairs(gGameModel.role:getIdler("yy_open"):read()) do
		if csv.yunying.yyhuodong[slot7].type == game.YYHUODONG_TYPE_ENUM_TABLE.praise and slot8.paramMap and slot8.paramMap.goodComments then
			slot2 = slot7

			break
		end
	end

	if slot2 == 0 then
		return
	end

	if gGameModel.role:getIdler("yyhuodongs"):read()[slot2] and slot4.info and slot4.info[APP_TAG] then
		return
	end

	slot5 = ""

	for slot10, slot11 in csvPairs(csv.yunying.praise_tag) do
		if slot11.tag == APP_TAG then
			slot5 = slot11.url

			break
		end
	end

	if slot5 == "" then
		return
	end

	slot7 = slot0.roleLv:read()

	if userDefault.getForeverLocalKey("goodComments", false) then
		return
	end

	if slot7 < 30 then
		return
	end

	gGameUI:stackUI("city.activity.good_comments.view", nil, , {
		tag = APP_TAG,
		url = slot5,
		award = csv.yunying.yyhuodong[slot2].paramMap.award,
		yyID = slot2
	})
end

function slot1.initTiktok(slot0)
	if userDefault.getCurrDayKey("tiktokClick", false) then
		return
	end

	slot3 = nil

	for slot7, slot8 in ipairs(gGameModel.role:getIdler("yy_open"):read()) do
		if csv.yunying.yyhuodong[slot8].type == game.YYHUODONG_TYPE_ENUM_TABLE.praise and slot9.paramMap and slot9.paramMap.tiktok then
			slot3 = slot8

			break
		end
	end

	if not slot3 then
		return false
	end

	if gGameModel.role:read("level") < (csv.yunying.yyhuodong[slot3].leastLevel or 20) then
		return
	end

	if gGameModel.role:getIdler("yyhuodongs"):read()[slot3] and slot7.info and slot7.info.us_tiktok then
		return
	end

	slot8 = nil

	for slot13, slot14 in csvPairs(csv.yunying.praise_tag) do
		if slot14.tag == "us_tiktok" then
			slot8 = slot14.url

			break
		end
	end

	if not slot8 then
		return
	end
end

function slot1.initModel(slot0)
	slot0.roleLv = gGameModel.role:getIdler("level")
end

function slot1.onGoClick(slot0, slot1, slot2, slot3)
	jumpEasy.jumpTo(slot3.goToPanel)
end

function slot1.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if slot0.priority ~= slot1.priority then
			return slot0.priority < slot1.priority
		end

		if slot0.openLv ~= slot1.openLv then
			return slot0.openLv < slot1.openLv
		end

		return slot0.csvId < slot1.csvId
	end
end

return slot1
