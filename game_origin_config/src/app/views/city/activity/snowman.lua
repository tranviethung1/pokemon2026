slot0 = {
	shoutao = 1,
	weijin = 2,
	maozi = 3
}
slot1 = {
	event = "effect",
	data = {
		outline = {
			size = 3,
			color = cc.c4b(116, 59, 29, 255)
		}
	}
}
slot3 = class("ActivitySnowmanView", cc.load("mvc").ViewBase)
slot3.RESOURCE_FILENAME = "activity_snowman.json"
slot3.RESOURCE_BINDING = {
	leftList = "leftList",
	["leftPanel.subPanel.subItem"] = "subItem",
	time = "time",
	["bottomPanel.icon"] = "snowIcon",
	bg = "bg",
	["bottomPanel.progressNum"] = "progressNum",
	snowmanPanel = "snowmanPanel",
	timeText = "timeText",
	["leftPanel.mainItem"] = "mainItem",
	bottomPanel = "bottomPanel",
	["leftPanel.subPanel"] = "subPanel",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["bottomPanel.progress"] = {
		varname = "progressBar",
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				data = bindHelper.self("curPagePro")
			}
		}
	},
	["bottomPanel.degreeText"] = {
		varname = "degreeText",
		binds = slot1
	},
	["bottomPanel.degreeNum"] = {
		varname = "degreeNum",
		binds = slot1
	},
	["bottomPanel.haveText"] = {
		varname = "haveText",
		binds = slot1
	},
	["bottomPanel.haveNum"] = {
		varname = "haveNum",
		binds = slot1
	},
	["bottomPanel.btnUpgrade.txt"] = {
		binds = slot1
	},
	["bottomPanel.btnUpgrade"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onUpgrade")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					state = bindHelper.self("upgradeRedHint"),
					onNode = function (slot0)
						slot0:xy(295, 145)
					end
				}
			}
		}
	},
	["leftPanel.mainList"] = {
		varname = "mainList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("mainClothDatas"),
				item = bindHelper.self("mainItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("selected", "cloth", "Mask").selected:visible(slot3.isSel == true)

					for slot8, slot9 in orderCsvPairs(slot3) do
						if slot9.isSel == true then
							slot4.cloth:texture(slot9.icon)
						end

						slot4.Mask:visible(slot9.isUnlock)
						bind.touch(slot0, slot1, {
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3, slot9.isUnlock, slot9.needLevel)
							}
						})
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onMainItemClick")
			}
		}
	},
	["leftPanel.subPanel.subList"] = {
		varname = "subList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("subClothDatas"),
				item = bindHelper.self("subItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("subIcon", "line").subIcon:texture(slot3.icon)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onSubItemClick")
			}
		}
	},
	btnRule = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRules")
			}
		}
	},
	btnAward = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onAward")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					state = bindHelper.self("awardRedHint"),
					onNode = function (slot0)
						slot0:xy(330, 140)
					end
				}
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.activityId = slot1
	slot2 = csv.yunying.yyhuodong[slot1]
	slot0.huodongID = slot2.huodongID
	slot0.snowBallId = slot2.paramMap.items[1]
	slot0.yyCfg = slot2
	slot0.subListVisible = false

	slot0.subPanel:visible(slot0.subListVisible)

	for slot7, slot8 in ipairs(slot2.paramMap.items) do
		if slot8 then
			slot0.snowBallId = slot8

			break
		end
	end

	slot0.selIdx:addListener(function (slot0, slot1)
		uv2 = "mainClothDatas"

		if slot2.mainClothDatas:atproxy(slot1) then
			uv2 = "mainClothDatas"
			slot2.mainClothDatas:atproxy(slot1).isSel = false
		end

		uv2 = "mainClothDatas"

		if slot2.mainClothDatas:atproxy(slot0) then
			uv2 = "mainClothDatas"
			slot2.mainClothDatas:atproxy(slot0).isSel = true
		end
	end)
	slot0:updateTime()
	bind.click(slot0, slot0.snowIcon, {
		method = function ()
			uv1 = "snowBallId"
			uv3 = "snowBallId"

			gGameUI:showItemDetail(slot3.snowIcon, {
				key = slot1.snowBallId
			})
		end
	})
	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "yyhuodongs"
		slot2 = slot2.yyhuodongs
		slot3 = slot2
		uv3 = "read"
		slot2 = slot2.read(slot3)[slot3] or {}
		uv3 = "yyhuodongs"
		slot3.yyData = slot2
		uv3 = "yyhuodongs"
		slot3.info = slot2.info
		uv3 = "yyhuodongs"
		slot3 = slot3.snowLevel
		slot3 = slot3.set
		uv5 = "yyhuodongs"
		slot5 = slot5.info.level

		slot3(slot3, slot5)

		uv3 = "yyhuodongs"
		slot3 = slot3.degreeNum
		slot3 = slot3.text
		uv5 = "yyhuodongs"

		slot3(slot3, slot5.info.level)

		uv3 = "yyhuodongs"
		slot3 = slot3.haveNum
		slot4 = slot3
		uv6 = "yyhuodongs"

		slot3.text(slot4, dataEasy.getNumByKey(slot6.snowBallId))

		uv4 = "yyhuodongs"

		if dataEasy.getNumByKey(slot4.snowBallId) > 0 then
			uv3 = "yyhuodongs"

			slot3.upgradeRedHint:set(true)
		else
			uv3 = "yyhuodongs"

			slot3.upgradeRedHint:set(false)
		end

		uv3 = "yyhuodongs"

		slot3.awardRedHint:set(false)

		for slot6, slot7 in pairs(slot2.stamps) do
			if slot7 == 1 then
				uv8 = "yyhuodongs"

				slot8.awardRedHint:set(true)

				break
			end
		end

		uv4 = "yyhuodongs"
		slot4 = slot4.degreeText
		uv5 = "yyhuodongs"
		slot6 = cc.p

		adapt.oneLinePos(slot4, slot5.degreeNum, slot6(5, 0))

		uv4 = "yyhuodongs"
		uv6 = "yyhuodongs"
		slot6 = slot6.haveNum
		uv6 = "yyhuodongs"

		adapt.oneLinePos(slot4.haveText, {
			slot6,
			slot6.snowIcon
		}, {
			cc.p(-15, 0),
			cc.p(5, 0)
		})

		if matchLanguage({
			"en"
		}) then
			uv4 = "yyhuodongs"
			uv6 = "yyhuodongs"
			slot6 = slot6.haveNum
			uv6 = "yyhuodongs"

			adapt.oneLinePos(slot4.haveText, {
				slot6,
				slot6.snowIcon
			}, {
				cc.p(5, 0),
				cc.p(15, 0)
			})
		else
			uv4 = "yyhuodongs"
			uv6 = "yyhuodongs"
			slot6 = slot6.haveNum
			uv6 = "yyhuodongs"

			adapt.oneLinePos(slot4.haveText, {
				slot6,
				slot6.snowIcon
			}, {
				cc.p(-15, 0),
				cc.p(5, 0)
			})
		end

		for slot6, slot7 in orderCsvPairs(csv.yunying.huodongcloth_level) do
			uv9 = "yyData"

			if slot7.huodongID == slot9 then
				uv9 = "yyhuodongs"

				if slot7.level == slot9.info.level then
					uv8 = "yyhuodongs"
					slot8.curLevelMax = slot7.needExp

					break
				end
			end
		end

		uv3 = "yyhuodongs"
		uv4 = "yyhuodongs"

		if slot4.curLevelMax < slot3.info.exp then
			uv3 = "yyhuodongs"
			uv5 = "yyhuodongs"
			uv7 = "yyhuodongs"

			slot3.progressNum:text(slot5.curLevelMax .. "/" .. slot7.curLevelMax)
		else
			uv3 = "yyhuodongs"
			uv5 = "yyhuodongs"
			uv7 = "yyhuodongs"

			slot3.progressNum:text(slot5.info.exp .. "/" .. slot7.curLevelMax)
		end

		uv3 = "yyhuodongs"
		slot3 = slot3.curPagePro
		slot3 = slot3.set
		uv7 = "yyhuodongs"
		uv8 = "yyhuodongs"

		slot3(slot3, math.min(100, slot7.info.exp / slot8.curLevelMax * 100))

		uv3 = "yyhuodongs"

		slot3:initClothDatas()
	end)
end

function slot3.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.curPagePro = idler.new(0)
	slot0.snowLevel = idler.new(0)
	slot0.mainClothDatas = idlers.newWithMap({})
	slot0.subClothDatas = idlers.newWithMap({})
	slot0.selIdx = idler.new(1)
	slot0.upgradeRedHint = idler.new(false)
	slot0.awardRedHint = idler.new(false)
end

function slot3.initClothDatas(slot0)
	slot2 = slot0.yyData.targets

	for slot6, slot7 in orderCsvPairs(csv.yunying.huodongcloth_level) do
		if slot7.huodongID == slot0.huodongID and slot7.unlockPart then
			if slot7.unlockPart > 0 and slot7.unlockPart <= 100 then
				for slot11, slot12 in orderCsvPairs(csv.yunying.huodongcloth_part) do
					if slot12.huodongID == slot0.huodongID and slot12.belongPart == slot7.unlockPart then
						slot13 = slot12.isDefault

						if slot2[tostring(slot7.unlockPart)] then
							slot13 = slot2[tostring(slot7.unlockPart)] == slot11 and true or false
						end

						slot15 = slot1[slot7.unlockPart]

						table.insert(slot15, {
							id = slot11,
							icon = slot12.icon,
							showType = slot12.showType,
							res = slot12.res,
							isSel = slot13,
							lookPos = slot12.lookPos,
							needLevel = slot7.level,
							isUnlock = slot0.snowLevel:read() < slot7.level
						})

						uv15 = "yyData"

						if itertools.map(slot15, function (slot0, slot1)
							return slot1, slot0
						end)[slot7.unlockPart] then
							if slot0.snowLevel:read() < slot7.level then
								slot0.snowmanPanel:get(slot15):hide()
							elseif slot13 then
								slot0.snowmanPanel:get(slot15):show():texture(slot12.res)
							end
						end
					end
				end
			else
				for slot11, slot12 in orderCsvPairs(csv.yunying.huodongcloth_part) do
					if slot7.level <= slot0.snowLevel:read() and slot12.huodongID == slot0.huodongID and slot12.belongPart == slot7.unlockPart then
						if not slot0.snowmanPanel:get("decoration" .. slot11) then
							if slot12.showType == "pic" then
								ccui.ImageView:create(slot12.res):xy(slot12.lookPos.x, slot12.lookPos.y):addTo(ccui.Layout:create():xy(cc.p(750, 400)):size(650, 350):addTo(slot0.snowmanPanel, slot12.zOrder, "decoration" .. slot11), 4, "decoration"):scale(2)
							else
								widget.addAnimationByKey(slot13, slot12.res, "decoration", "night_loop", 120):scale(2):xy(slot14, slot15)
							end
						else
							slot13:xy(cc.p(750, 400))
						end
					end
				end
			end
		end
	end

	if #{
		[slot7.unlockPart] = {}
	} ~= 0 then
		slot0.selIdx:set(math.min(#slot1, slot0.selIdx:read()), true)

		slot1[slot0.selIdx:read()].isSel = true
	end

	slot0.mainClothDatas:update(slot1)
end

function slot3.onRules(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1000
	})
end

function slot3.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(153),
		slot2.noteText(109001, 109020)
	}
end

function slot3.onUpgrade(slot0)
	if dataEasy.getNumByKey(slot0.snowBallId) == 0 then
		gGameUI:showTip(gLanguageCsv.inadequateProps)

		return
	end

	gGameApp:requestServer("/game/yy/cloth/item/use", function (slot0)
		gGameUI:showGainDisplay(slot0.view.result)
	end, slot0.activityId)
end

function slot3.onAward(slot0)
	gGameUI:stackUI("city.activity.snowman_reward", nil, , slot0.activityId)
end

function slot3.updateTime(slot0)
	bind.extend(slot0, slot0.time, {
		class = "cutdown_label",
		props = {
			endTime = gGameModel.role:read("yy_endtime")[slot0.activityId],
			endFunc = function ()
				uv0 = "time"

				slot0.time:text(gLanguageCsv.activityOver)
			end
		}
	})
end

function slot3.onMainItemClick(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot4 then
		gGameUI:showTip(string.format(gLanguageCsv.snowNeedLevel, slot5))

		return
	end

	if slot0.selIdx:read() == slot2 then
		slot0.subListVisible = not slot0.subListVisible
	else
		slot0.subListVisible = true

		slot0.selIdx:set(slot2)
	end

	slot0.subPanel:visible(slot0.subListVisible)

	slot6 = {}

	for slot11, slot12 in pairs(slot0.mainClothDatas:atproxy(slot2)) do
		if type(slot12) == "table" and slot11 ~= "__sorted" then
			table.insert(slot6, table.shallowcopy(table.shallowcopy(slot12)))
		end
	end

	slot0.subClothDatas:update(slot6)
end

function slot3.onSubItemClick(slot0, slot1, slot2)
	if slot0.yyData.targets[tostring(slot0.selIdx:read())] == slot2.id then
		return
	end

	gGameApp:requestServer("/game/yy/cloth/decorate", function (slot0)
	end, slot0.activityId, slot0.selIdx:read(), slot2.id)
end

function slot3.onClose(slot0)
	uv1 = "onClose"

	slot1.onClose(slot0)
end

return slot3
