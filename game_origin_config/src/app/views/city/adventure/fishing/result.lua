slot0 = class("FishingResultView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "fishing_result.json"
slot0.RESOURCE_BINDING = {
	["fishItem.list"] = "descList",
	item = "item",
	fishItem = "fishItem",
	pos = "skelPos",
	["fishItem.iconPos"] = "iconPos",
	["fishItem.imgNew"] = "imgNew",
	["fishItem.imgTipPos"] = "imgTipPos",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("datas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.id ~= nil then
						slot4 = csv.cards[slot3.id].unitID

						bind.extend(slot0, slot1, {
							class = "card_icon",
							props = {
								unitId = slot4,
								rarity = csv.unit[slot4].rarity,
								star = csv.cards[slot3.id].star
							},
							bind.touch(slot0, slot1, {
								methods = {
									ended = functools.partial(slot0.itemClick, slot1, slot2, slot3)
								}
							})
						})
					else
						bind.extend(slot0, slot1, {
							class = "icon_key",
							props = {
								data = {
									key = slot3.key,
									num = slot3.num
								}
							}
						})
					end
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				itemClick = bindHelper.self("onitemClick")
			}
		}
	},
	["fishItem.name"] = {
		varname = "fishName",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["fishItem.length"] = {
		varname = "length",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["fishItem.numLength"] = {
		varname = "numLength",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	score = {
		varname = "score",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	score1 = {
		varname = "score1",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	score2 = {
		varname = "score2",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0:initSkel()
	performWithDelay(slot0, function ()
		uv0 = "skel"

		slot0.skel:play("effect_loop")
	end, 0.8)

	slot0.datas = idlers.newWithMap({})

	if csv.fishing.fish[slot1].showType == "pic" then
		ccui.ImageView:create(slot7.res):xy(slot0.iconPos:xy()):scale(slot7.scale):addTo(slot0.fishItem, 1, "icon")
	elseif slot7.showType == "spine" then
		widget.addAnimationByKey(slot0.fishItem, slot7.res, "fish", "standby_loop", 1):anchorPoint(cc.p(0.5, 0)):xy(slot0.iconPos:x(), slot0.iconPos:y() - 150):scale(slot7.scale)
	end

	slot0.fishName:text(slot7.name)
	slot0.numLength:text(slot2 .. "cm")
	adapt.oneLinePos(slot0.length, slot0.numLength, cc.p(3, 0), "left")

	if slot2 == 0 then
		itertools.invoke({
			slot0.length,
			slot0.numLength
		}, "hide")
	end

	if slot4 < slot2 then
		slot0.imgNew:show()
	end

	slot8 = ccui.ImageView:create(ui.RARITY_ICON[slot7.rare]):xy(slot0.imgTipPos:xy()):scale(1):addTo(slot0.fishItem, 2, "rarity")

	beauty.textScroll({
		align = "center",
		list = slot0.descList,
		strs = {
			fontPath = "font/youmi1.ttf",
			str = slot7.desc
		},
		effect = {
			color = cc.c4b(255, 252, 237, 255)
		}
	})

	if slot5 == game.FISHING_GAME then
		itertools.invoke({
			slot0.score1,
			slot0.score2
		}, "show")
		slot0.score2:text(gGameModel.fishing:read("point") - slot6)
		adapt.oneLinePos(slot0.score1, slot0.score2, cc.p(3, 0), "left")
		adapt.oneLinePos(slot0.score1, slot0.score, cc.p(10, 0), "right")
	end

	if slot3.cards ~= nil then
		table.insert({}, slot3.cards[1])
	else
		for slot13, slot14 in csvMapPairs(slot3) do
			table.insert(slot9, {
				key = slot13,
				num = slot14
			})
		end
	end

	slot0.datas:update(slot9)
end

function slot0.onitemClick(slot0, slot1, slot2, slot3, slot4)
	gGameUI:showItemDetail(slot2, {
		key = "card",
		num = slot4.id
	})
end

function slot0.initSkel(slot0)
	slot0.skel = widget.addAnimationByKey(slot0.skelPos, "diaoyuchenggong/diaoyuchenggong.skel", "diaoyu", "effect", 1):scale(2)
end

return slot0
