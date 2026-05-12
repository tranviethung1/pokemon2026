require("util.lazy_require")
print("DYNAMIC_INDEX_ENABLE", true)

slot1 = string.sub
slot2 = string.find
slot3 = string.format
slot4 = table.insert

if not ANTI_AGENT then
	for slot10 = 1, #{
		{
			10000,
			-14,
			-5,
			1,
			3400
		},
		{
			-5,
			-1,
			-1,
			-5,
			-14,
			-12,
			-5,
			3400
		},
		{
			-5,
			-5,
			-1,
			-1,
			-12,
			-5,
			-14,
			-5,
			-12,
			-5,
			3400
		},
		{
			1.2,
			1.8,
			11,
			1.1,
			10000,
			-14,
			-5,
			-1,
			1,
			-1
		}
	} do
	end

	globals._gg_cheat_ = table.salttable({
		[slot10] = csvNumSum(slot5[slot10])
	})
	globals._gg_ = {}

	for slot10 = 1, #slot5 * 5 do
		slot13 = {}

		for slot17 = 1, #slot5[math.random(1, #slot5)] do
			slot4(slot13, slot12[slot17])
		end

		slot4(slot13, slot11)
		slot4(globals._gg_, slot13)
	end
end

printInfo("config_defines - loadfile %f KB", collectgarbage("count"))
require("config.csv")

for slot10, slot11 in ipairs({
	"csv.language",
	"csv.skill",
	"csv.skill_desc",
	"csv.items",
	"csv.scene_conf",
	"csv.good_feel_effect",
	"csv.endless_tower_scene",
	"csv.note",
	"csv.equips",
	"csv.scene_monster_story",
	"csv.card_ability",
	"csv.tasks",
	"csv.talent",
	"csv.achievement.achievement",
	"csv.achievement.achievement_task",
	"csv.capture.probability",
	"csv.card_ability",
	"csv.card_battle_recommend",
	"csv.card_star_effect",
	"csv.character",
	"csv.explorer.explorer_effect",
	"csv.fishing.fish",
	"csv.fragments",
	"csv.good_feel_effect",
	"csv.grow_guide",
	"csv.gym.gate",
	"csv.loading_tips",
	"csv.mail",
	"csv.new_guide",
	"csv.notice",
	"csv.pokedex_advance",
	"csv.random_tower.event",
	"csv.title",
	"csv.union.union_level",
	"csv.unlock"
}) do
	slot12 = loadstring("return " .. slot11)()

	printDebug("preload %s %s %s", slot11, slot12, table.nums(slot12))
end

printInfo("config_defines - csv loaded %f KB", collectgarbage("count"))

if LOCAL_LANGUAGE ~= "cn" then
	setL10nConfig(csv)
	print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxOkamixxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
end

function slot7(slot0, slot1)
	if device.platform == "windows" then
		globals[slot0] = csvReadOnlyInWindows(slot1, slot0)

		printDebug("config_defines - proxy index %s", slot0)
	elseif device.platform == "android" and APP_CHANNEL == "none" then
		globals[slot0] = {}
	end
end

function slot8(slot0)
	if rawget(slot0, "__initfunc") then
		slot2 = rawget(slot0, "__name")
		slot0.__initfunc = nil
		slot0.__name = nil

		printDebug("config_defines - index %s", slot2)
		setmetatable(slot0, nil)

		slot3 = slot1

		slot3(slot0)

		uv3 = "rawget"

		slot3(slot2, slot0)
	end
end

slot9 = {
	__index = function ()
		error("Decompilation failed")
		-- Exception in function building!
		-- Traceback (most recent call last):
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
		--     return _build_function_definition(prototype, state.header)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
		--     node.statements.contents = _build_function_blocks(state, instructions)
		--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
		--     statement, line_marked_elements = _build_statement(state, addr, instruction)
		--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
		--     return _build_var_assignment(state, addr, instruction)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
		--     assn = func(*args, **kwargs)
		--            ^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
		--     expression = _build_const_expression(state, addr, instruction)
		--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
		--     return _build_string_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
		--     node.value = state.constants.complex_constants[index]
		--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end,
	__pairs = function (slot0)
		uv1 = "lua_pairs"

		slot1(slot0)

		return lua_pairs(slot0)
	end,
	__ipairs = function (slot0)
		uv1 = "lua_ipairs"

		slot1(slot0)

		return lua_ipairs(slot0)
	end,
	__next = function (slot0)
		uv1 = "lua_next"

		slot1(slot0)

		return lua_next(slot0)
	end,
	__len = function (slot0)
		uv1 = "itertools"

		slot1(slot0)

		return itertools.size(slot0)
	end
}

function slot10(slot0, slot1)
	uv2 = "globals"

	if not slot2 then
		globals[slot0] = {}

		slot1(globals[slot0])

		return
	end

	uv5 = "setmetatable"
	globals[slot0] = setmetatable({
		__initfunc = slot1,
		__name = slot0
	}, slot5)
end

slot10("gGuideStageCsv", function (slot0)
	for slot5, slot6 in orderCsvPairs(csv.new_guide) do
		if nil ~= slot6.stage and not slot0[slot6.stage] then
			slot1 = slot6.stage
			slot0[slot6.stage] = {
				begin = slot5,
				specialName = slot6.specialName
			}
		end
	end
end)
slot10("gCommonConfigCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.common_config) do
		if table.length(slot5.valueArray) == 0 then
			slot0[slot5.name] = slot5.value
		end
	end
end)
slot10("gCommonConfigArrayCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.common_config) do
		if table.length(slot5.valueArray) > 0 then
			slot0[slot5.name] = slot5.valueArray
		end
	end
end)
slot10("gEffectByEventCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.effect_event) do
		slot0[slot5.eventID] = slot4
	end
end)
slot10("gMonsterCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.monster_scenes) do
		if slot0[slot5.scene_id] == nil then
			slot0[slot5.scene_id] = {}
		end

		slot5.hpMaxC = slot5.hpC
		slot5.mp1MaxC = slot5.mp1C

		if slot5.scene_id and slot5.round then
			slot0[slot5.scene_id][slot5.round] = slot5
		end
	end
end)
slot10("gRoleLevelCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.base_attribute.role_level) do
		slot0[slot4] = slot5
	end
end)
slot10("gVipCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.vip) do
		slot0[slot4 - 1] = slot5
	end
end)
slot10("gVipGift", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.vip_gift) do
		if not slot0[slot5.version] then
			slot0[slot5.version] = {}
		end

		slot0[slot5.version][slot5.vipLevel] = slot5
	end
end)
slot10("gStarCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.card_star) do
		if slot0[slot5.typeID] == nil then
			slot0[slot5.typeID] = {}
		end

		slot0[slot5.typeID][slot5.star] = slot5
	end
end)
slot10("gStar2FragCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.card_star2frag) do
		if slot0[slot5.type] == nil then
			slot0[slot5.type] = {}
		end

		slot0[slot5.type][slot5.getStar] = slot5
	end
end)
slot10("gStarEffectCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.card_star_effect) do
		if slot0[slot5.typeID] == nil then
			slot0[slot5.typeID] = {}
		end

		slot0[slot5.typeID][slot5.star] = slot5
	end
end)
slot10("gCardsCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.cards) do
		if matchLanguageForce(slot5.languages) and slot5.canDevelop then
			if slot0[slot5.cardMarkID] == nil then
				slot0[slot5.cardMarkID] = {}
			end

			if slot0[slot5.cardMarkID][slot5.develop] == nil then
				slot0[slot5.cardMarkID][slot5.develop] = {}
			end

			if slot0[slot5.cardMarkID][slot5.develop][slot5.branch] then
				printError("cards id(%d), develop(%d), branch(%d) 与 id(%d) 重复，检查配置", slot4, slot5.develop, slot5.branch, slot0[slot5.cardMarkID][slot5.develop][slot5.branch].id)

				return
			end

			slot0[slot5.cardMarkID][slot5.develop][slot5.branch] = slot5
		end
	end
end)
slot10("gCardsMega", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.cards) do
		if matchLanguageForce(slot5.languages) and slot5.megaIndex > 0 then
			if not csv.card_mega[slot5.megaIndex] then
				errorInWindows("csv.cards id(%d) megaIndex(%d) 在 csv.card_mega 中无配置", slot4, slot5.megaIndex)
			else
				if slot0[slot5.megaIndex] == nil then
					slot0[slot5.megaIndex] = {}
				end

				slot0[slot5.megaIndex] = {
					key = slot4,
					canDevelop = slot5.canDevelop
				}
			end
		end
	end
end)
slot10("gCardsMarkCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.cards) do
		if matchLanguageForce(slot5.languages) then
			if slot0[slot5.cardMarkID] == nil then
				slot0[slot5.cardMarkID] = {
					num = 0,
					data = {}
				}
			end

			slot0[slot5.cardMarkID].num = slot0[slot5.cardMarkID].num + 1
			slot0[slot5.cardMarkID].data[slot0[slot5.cardMarkID].num] = slot4
		end
	end
end)
slot10("gTownSkillCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.town.skill) do
		slot0[slot5.skill] = slot0[slot5.skill] or {}

		table.insert(slot0[slot5.skill], slot5)
	end
end)
slot10("gCardsZawake", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.cards) do
		if matchLanguageForce(slot5.languages) and slot5.zawakeID > 0 then
			if slot0[slot5.zawakeID] == nil then
				slot0[slot5.zawakeID] = {}
			end

			slot0[slot5.zawakeID][slot4] = slot5
		end
	end
end)
slot10("gCardAdvanceCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.base_attribute.advance_level) do
		if slot0[slot5.typeID] == nil then
			slot0[slot5.typeID] = {}
		end

		slot0[slot5.typeID][slot5.stage] = slot5
	end
end)
slot10("gTwonEnergyCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.town.energy) do
		slot0[slot5.rarity] = slot5
	end
end)

slot11 = {}
slot12 = arraytools.hash({
	"iconNumNormal",
	"rarity0",
	"monthCardPrivilege11",
	"shopTab1",
	"shopTab2",
	"rarityFrag0",
	"rarityFrag1",
	"rarityFrag2",
	"rarityFrag3",
	"rarityFrag4"
})
globals.gLanguageCsv = function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.language) do
		if slot0[slot5.key] then
			error(string.format("gLanguageCsv key duplicate! 【%d】: %s(%s)", slot4, slot5.key, slot5.text))
		end

		if slot5.text ~= "" then
			uv6 = "orderCsvPairs"

			if slot6[slot5.text] then
				uv6 = "orderCsvPairs"
				slot6 = slot6[slot5.text]

				if slot4 > 5000 and slot6.id > 5000 then
					uv7 = "csv"

					if not slot7[slot5.key] then
						uv7 = "csv"

						if not slot7[slot6.key] then
							-- Nothing
						end
					end
				end
			end
		end

		slot6 = slot5.key
		slot0[slot6] = slot5.text
		uv6 = "orderCsvPairs"
		slot6[slot5.text] = {
			id = slot4,
			key = slot5.key
		}
	end

	return slot0
end({})

function globals.getLanguageGender(slot0)
	slot1 = slot0

	if type(slot0) == "number" then
		slot1 = game.GENDER_TABLE[slot0]
	end

	return gLanguageCsv[slot1]
end

function globals.getLanguageAttr(slot0)
	slot1 = slot0

	if type(slot0) == "number" then
		slot1 = game.ATTRDEF_TABLE[slot0]
	end

	return gLanguageCsv["attr" .. string.caption(slot1)]
end

function globals.getRedFoxMoney()
	gGameApp.net:sendHttpRequest("POST", APIGetMoney, string.format("accountName=%s", gGameModel.account:read("name")), cc.XMLHTTPREQUEST_RESPONSE_STRING, function (slot0)
		slot1 = 0

		if slot0.status == 200 then
			globals.RedFoxMoney = json.decode(slot0.response).Money
		end

		globals.RedFoxMoney = slot1
	end)
end

slot10("gLanguageRarity", function (slot0)
	for slot4, slot5 in pairs(ui.RARITY_ICON) do
		slot0[slot4] = gLanguageCsv["rarity" .. slot4]
	end
end)
slot10("gLanguageTxtRarity", function (slot0)
	for slot4, slot5 in pairs(ui.RARITY_TEXT) do
		slot0[slot4] = gLanguageCsv["txtRarity" .. slot5]
	end
end)
slot10("gNightmareForCsv", function (slot0)
	for slot4, slot5 in csvMapPairs(csv.world_map) do
		if slot5.nightmareMapId or slot5.heroMapId then
			slot0[slot6] = slot4
		end
	end
end)
slot10("gCostCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.cost) do
		slot0[slot5.service] = slot5.seqParam
	end
end)
slot10("gEmojiCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.chat_emoji) do
		slot0[slot5.key] = slot5
	end
end)
slot10("gCardExpItemCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.items) do
		if slot5.type == game.ITEM_TYPE_ENUM_TABLE.cardExp then
			uv6 = "orderCsvPairs"

			slot6(slot0, slot5)
		end
	end
end)
slot10("gAutoSellItemsCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.items) do
		if slot5.autoSell == game.SELL_TYPE.auto and slot5.sellPrice > 0 then
			uv6 = "orderCsvPairs"

			slot6(slot0, slot5)
		end
	end
end)
slot10("gHeldItemExpCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.items) do
		if slot5.specialArgsMap.heldItemExp then
			uv6 = "orderCsvPairs"

			slot6(slot0, slot5)
		end
	end
end)
slot10("gChipExpCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.items) do
		if slot5.specialArgsMap.chipExp then
			uv6 = "orderCsvPairs"

			slot6(slot0, slot5)
		end
	end
end)
slot10("gHandbookCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.pokedex) do
		slot0[slot5.cardID] = slot5
	end
end)
slot10("gHandbookArrayCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.pokedex) do
		uv6 = "orderCsvPairs"

		slot6(slot0, slot5)
	end
end)
slot10("gPokedexDevelop", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.pokedex_develop) do
		if slot0[slot5.markID] == nil then
			slot0[slot5.markID] = {}
		end

		slot0[slot5.markID][slot5.star] = slot5
	end
end)
slot10("gRoleLogoCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.role_logo) do
		slot0[slot4] = slot5
	end
end)
slot10("gRoleFrameCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.role_frame) do
		slot0[slot4] = slot5
	end
end)
slot10("gRoleFigureCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.role_figure) do
		slot0[slot4] = slot5
	end
end)
slot10("gTitleCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.title) do
		slot0[slot4] = slot5
	end
end)
slot10("gDrawPreviewCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.draw_preview) do
		slot6 = slot5.type
		slot0[slot6] = slot0[slot5.type] or {}
		uv6 = "orderCsvPairs"

		slot6(slot0[slot5.type], slot5)
	end
end)
slot10("gDrawPreviewMap", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.draw_preview) do
		if slot5.item then
			for slot9, slot10 in csvPairs(slot5.item) do
				slot0[slot10] = true
			end
		end

		if slot5.card then
			for slot9, slot10 in csvPairs(slot5.card) do
				if csv.cards[slot10] then
					slot0[slot11.fragID] = true
				end
			end
		end
	end
end)
slot10("gUnlockCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.unlock) do
		slot0[slot5.feature] = slot4
	end
end)
slot10("gSkinCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.card_skin) do
		slot0[slot4] = slot5
	end
end)
slot10("gSkinShopCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.card_skin_shop) do
		slot0[slot4] = slot5
	end
end)
slot10("gDailyAssistantCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.daily_assistant) do
		slot0[slot5.features] = {
			csvId = slot4,
			cfg = slot5
		}
	end
end)
slot10("gUnionSkillCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.union.union_skill_level) do
		if slot0[slot5.skillID] == nil then
			slot0[slot5.skillID] = {}
		end

		slot0[slot5.skillID][slot5.level] = slot5
	end
end)
slot10("gUnionFeatureCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.union.union_level) do
		for slot9, slot10 in ipairs(slot5.openFeature) do
			slot0[slot10] = slot4
		end
	end
end)
slot10("gEquipAdvanceCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.base_attribute.equip_advance) do
		slot0[slot5.equip_id] = slot0[slot5.equip_id] or {}
		slot0[slot5.equip_id][slot5.stage] = slot5
	end
end)
slot10("gGoodFeelCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.good_feel) do
		slot0[slot5.feelType] = slot0[slot5.feelType] or {}
		slot0[slot5.feelType][slot5.level] = slot5
	end
end)
slot10("gGoodFeelEffectCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.good_feel_effect) do
		slot0[slot5.markID] = slot0[slot5.markID] or {}
		slot0[slot5.markID][slot5.level] = slot5
	end
end)
slot10("gCitySpritesCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.city_sprites) do
		if not slot0[slot5.group] then
			slot0[slot5.group] = {}
		end

		uv6 = "orderCsvPairs"

		slot6(slot0[slot5.group], slot5)
	end
end)

globals.gRandomTowerFloorMax = function (slot0)
	slot1 = 0

	for slot6, slot7 in orderCsvPairs(csv.random_tower.tower) do
		if 1 ~= slot7.floor then
			slot2 = slot7.floor
			slot1 = 0
		end

		slot7.roomIdx = slot1
		slot0[slot2] = slot1
		slot1 = slot1 + 1
	end

	return slot0
end({})

slot10("gCardEffortAdvance", function (slot0)
	for slot4, slot5 in csvPairs(csv.card_effort_advance) do
		slot0[slot5.effortSeqID] = slot0[slot5.effortSeqID] or {}
		slot0[slot5.effortSeqID][slot5.advance] = slot5
	end
end)
slot10("gCardEffortExtra", function (slot0)
	for slot4, slot5 in csvPairs(csv.card_effort_extra) do
		slot0[slot5.extraLevel] = slot5
	end
end)
slot10("gCardAbilityCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.card_ability) do
		if not slot0[slot5.abilitySeqID] then
			slot0[slot5.abilitySeqID] = {}
		end

		slot0[slot5.abilitySeqID][slot5.position] = slot5
	end
end)
slot10("gCardAbilityExtraCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.card_ability_extra) do
		for slot9, slot10 in csvMapPairs(slot5.abilitySeqIDGroup) do
			slot0[slot10] = slot5
		end
	end
end)
slot10("gGateCaptureCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.capture.sprite) do
		if slot5.type == 1 and slot5.gate ~= 0 then
			slot0[slot5.gate] = slot4
		end
	end
end)
slot10("gAchievementLevelCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.achievement.achievement_level) do
		if not slot0[slot5.type] then
			slot0[slot5.type] = {}
		end

		slot0[slot5.type][slot5.level] = slot5
	end
end)
slot10("gUnionLogoCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.union.union_logo) do
		slot0[slot4] = slot5.icon
	end
end)
slot10("gCraftSpecialRules", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.craft.craft_special_rule) do
		if slot5.isOpen then
			slot0[slot5.markID] = slot5
		end
	end
end)
slot10("gGemPosCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.gem.pos) do
		if not slot0[slot5.gemPosSeqID] then
			slot0[slot5.gemPosSeqID] = {}
		end

		slot0[slot5.gemPosSeqID][slot5.gemPosNo] = slot5
	end
end)
slot10("gSoundCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.sound_config) do
		slot0[slot5.spineName] = slot0[slot5.spineName] or {}
		slot0[slot5.spineName][slot5.action] = slot5
	end
end)
slot10("gGemSuitCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.gem.suit) do
		slot0[slot5.suitID] = slot0[slot5.suitID] or {}
		slot0[slot5.suitID][slot5.suitQuality] = slot0[slot5.suitID][slot5.suitQuality] or {}
		slot0[slot5.suitID][slot5.suitQuality][slot5.suitNum] = slot5
	end
end)
slot10("gChipMainAttrCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.chip.main_attr) do
		slot0[slot5.seq] = slot0[slot5.seq] or {}
		slot0[slot5.seq][slot5.level] = slot5
	end
end)
slot10("gChipSuitCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.chip.suits) do
		slot0[slot5.suitID] = slot0[slot5.suitID] or {}
		slot0[slot5.suitID][slot5.suitQuality] = slot0[slot5.suitID][slot5.suitQuality] or {}
		slot0[slot5.suitID][slot5.suitQuality][slot5.suitNum] = slot5
	end
end)
slot10("gChipResonanceCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.chip.resonance) do
		slot0[slot5.type] = slot0[slot5.type] or {}
		slot6 = slot0[slot5.type]
		slot6[slot5.groupID] = slot0[slot5.type][slot5.groupID] or {}
		uv6 = "orderCsvPairs"

		slot6(slot0[slot5.type][slot5.groupID], slot5)
	end

	for slot4, slot5 in pairs(slot0) do
		for slot9, slot10 in pairs(slot5) do
			table.sort(slot10, function (slot0, slot1)
				return slot1.priority < slot0.priority
			end)
		end
	end
end)
slot10("gChipLevelSumExpCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.chip.strength_cost) do
		for slot9 = 1, math.huge do
			if slot5["levelExp" .. slot9] then
				slot0[slot9] = slot0[slot9] or {
					[0] = 0
				}
				slot0[slot9][slot4] = slot0[slot9][slot4 - 1] + slot10
			else
				break
			end
		end
	end
end)
slot10("gGrowGuideCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.grow_guide) do
		if dataEasy.isInServer(slot5.feature) then
			uv6 = "orderCsvPairs"

			slot6(slot0, slot5)
		end
	end
end)
slot10("gControlPerType", function (slot0)
	for slot4, slot5 in csvPairs(csv.base_attribute.controllbufftype) do
		if slot5.unlock then
			slot0[slot5.controllBuffType] = true
		end
	end
end)
slot10("gContractExpCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.items) do
		if slot5.specialArgsMap.contractExp then
			uv6 = "orderCsvPairs"

			slot6(slot0, slot5)
		end
	end
end)
slot10("gContractLevelAttrCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.contract.level_attr) do
		slot0[slot5.quality] = slot0[slot5.quality] or {}
		slot0[slot5.quality][slot5.level] = slot5
	end
end)
slot10("gContractAdvanceAttrCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.contract.advance_attr) do
		slot0[slot5.quality] = slot0[slot5.quality] or {}
		slot0[slot5.quality][slot5.advance] = slot5
	end
end)
slot10("gContractAdvanceCostCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.contract.advance_cost) do
		slot0[slot5.seq] = slot0[slot5.seq] or {}
		slot0[slot5.seq][slot5.advance] = slot5
	end
end)
slot10("gContractGroupCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.contract.group) do
		for slot9, slot10 in pairs(slot5.items) do
			slot0[slot10] = slot4
		end
	end
end)
slot10("gContractPlanCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.contract.plan) do
		slot0[slot5.planID] = slot0[slot5.planID] or {}
		slot0[slot5.planID][slot5.fieldID] = slot5
	end
end)
slot10("gOnlineFightCards", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.cross.online_fight.cards) do
		slot0[slot5.cardId] = slot5
	end
end)
slot10("gArmStage", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.arms.stage) do
		slot0[slot5.armID] = slot0[slot5.armID] or {}
		slot0[slot5.armID][slot5.stage] = slot5
	end
end)

globals.gOnlineFightTalentAttrs = nil
globals.gOnlineFightTalentPositions = {
	[game.TALENT_TYPE.battleFront] = {},
	[game.TALENT_TYPE.battleBack] = {}
}
globals.gOnlineFightTalentNatures = {}

function (slot0)
	for slot4, slot5 in pairs(game.NATURE_ENUM_TABLE) do
		slot0[slot5] = {}
	end
end(globals.gOnlineFightTalentNatures)

function globals.initOnlineFightTalent(...)
	if gOnlineFightTalentAttrs ~= nil then
		return
	end

	globals.gOnlineFightTalentAttrs = {}

	for slot3, slot4 in csvPairs(csv.cross.online_fight.talent) do
		slot5 = nil

		if slot4.addType == game.TALENT_TYPE.battleFront then
			slot5 = {
				gOnlineFightTalentPositions[game.TALENT_TYPE.battleFront]
			}
		elseif slot4.addType == game.TALENT_TYPE.battleBack then
			slot5 = {
				gOnlineFightTalentPositions[game.TALENT_TYPE.battleBack]
			}
		elseif slot4.addType == game.TALENT_TYPE.cardsAll then
			slot5 = gOnlineFightTalentNatures
		elseif slot4.addType == game.TALENT_TYPE.cardNatureType then
			slot5 = {
				gOnlineFightTalentNatures[slot4.natureType]
			}
		else
			error("not support addType" .. slot4.addType)
		end

		if gOnlineFightTalentAttrs[slot4.attrType] == nil then
			gOnlineFightTalentAttrs[slot6] = true
		end

		slot7, slot8 = dataEasy.parsePercentStr(slot4.attrNum)

		for slot12, slot13 in pairs(slot5) do
			if slot13[slot6] == nil then
				slot13[slot6] = {
					0,
					0
				}
			end

			if slot8 == game.NUM_TYPE.number then
				slot13[slot6][1] = slot13[slot6][1] + slot7
			else
				slot13[slot6][2] = slot13[slot6][2] + slot7
			end
		end
	end
end

globals.gShopType = {
	csv.fix_shop,
	csv.union.union_shop,
	csv.frag_shop,
	csv.pwshop,
	csv.explorer.explorer_shop,
	csv.random_tower.shop,
	csv.craft.shop,
	csv.equip_shop,
	csv.union_fight.shop,
	csv.cross.craft.shop,
	csv.cross.arena.shop,
	csv.fishing.shop,
	csv.cross.online_fight.shop,
	[15] = csv.cross.mine.shop,
	[16] = csv.cross.hunting.shop,
	[17] = csv.cross.supremacy.shop,
	[18] = csv.totem.shop
}

slot10("gShopGainMap", function (slot0)
	for slot4, slot5 in pairs(gShopType) do
		if slot4 ~= 1 and slot4 ~= 3 then
			for slot9, slot10 in orderCsvPairs(slot5) do
				if slot10.itemMap then
					for slot14, slot15 in csvMapPairs(slot10.itemMap) do
						slot0[slot14] = true
					end
				end

				if slot10.itemWeightMap then
					for slot14, slot15 in csvMapPairs(slot10.itemWeightMap) do
						slot0[slot14] = true
					end
				end
			end
		end
	end
end)

slot13 = {}
slot14 = {}

for slot18, slot19 in orderCsvPairs(csv.server.merge) do
	if slot14[slot19.destServer] then
		error(string.format("csv.server.merge: (%s) can't exist in (%d) and (%d) at the same time", slot19.destServer, slot14[slot19.destServer], slot18))
	end

	slot14[slot19.destServer] = slot18

	for slot23, slot24 in ipairs(slot19.servers) do
		if slot13[slot24] then
			error(string.format("csv.server.merge: (%s) can't exist in (%d) and (%d) at the same time", slot24, slot13[slot24], slot18))
		end

		slot13[slot24] = slot18
	end
end

function slot15(slot0)
	uv2 = "csv"

	if not slot2[csv.server.merge[slot0].destServer] then
		return slot0
	end

	uv3 = "server"

	return slot3(slot2)
end

function slot16(slot0, slot1)
	if slot0[csv.server.merge[slot1].destServer] then
		return slot0[slot3].servers
	end

	slot4 = {}

	for slot8, slot9 in ipairs(slot2.servers) do
		uv10 = "csv"

		if slot10[slot9] then
			uv11 = "server"

			for slot15, slot16 in ipairs(slot11(slot0, slot10)) do
				uv17 = "merge"

				slot17(slot4, slot16)
			end
		else
			uv11 = "merge"

			slot11(slot4, slot9)
		end
	end

	slot0[slot3] = {
		servers = slot4,
		id = slot2.serverID
	}

	return slot4
end

slot10("gServersMergeID", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.server.merge) do
		uv6 = "orderCsvPairs"

		for slot10, slot11 in ipairs(slot5.servers) do
			uv12 = "csv"

			if not slot12[slot11] then
				slot0[slot11] = slot6(slot4)
			end
		end
	end
end)
slot10("gDestServer", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.server.merge) do
		uv6 = "orderCsvPairs"

		slot6(slot0, slot4)
	end
end)
slot10("gZawakeLevelsCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.zawake.levels) do
		slot0[slot5.zawakeID] = slot0[slot5.zawakeID] or {}
		slot0[slot5.zawakeID][slot5.awakeSeqID] = slot0[slot5.zawakeID][slot5.awakeSeqID] or {}
		slot0[slot5.zawakeID][slot5.awakeSeqID][slot5.level] = slot5
	end
end)
slot10("gZawakeStagesCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.zawake.stages) do
		slot0[slot5.zawakeID] = slot0[slot5.zawakeID] or {}
		slot0[slot5.zawakeID][slot5.awakeSeqID] = slot5
	end
end)
slot10("gTownBuildingCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.town.building) do
		slot0[slot5.buildID] = slot0[slot5.buildID] or {}
		slot0[slot5.buildID][slot5.level] = slot5
	end
end)
slot10("gTownBuildingTypeCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.town.building) do
		slot0[slot5.buildType] = slot0[slot5.buildType] or {}
		slot0[slot5.buildType][slot5.buildID] = true
	end
end)
slot10("gTownRelicUpgradeCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.town.relic_upgrade_award) do
		slot0[slot5.relicID] = slot0[slot5.relicID] or {}
		slot0[slot5.relicID][slot5.level] = slot5
	end
end)
slot10("gHomeFurnitureOptCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.town.home_furniture) do
		if csv.town.home_furniture_type[slot5.type] then
			slot0[slot4] = slot6.frontType
		else
			slot0[slot4] = 0
		end
	end
end)
slot10("gTownFactoryCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.town.production_base) do
		slot0[slot5.baseID] = slot0[slot5.baseID] or {}
		slot0[slot5.baseID][slot5.level] = slot5
	end
end)
slot10("gMimicryBuffsCsv", function (slot0)
	for slot4, slot5 in orderCsvPairs(csv.mimicry.buffs) do
		slot0[slot5.quality] = slot0[slot5.quality] or {}

		table.insert(slot0[slot5.quality], slot5.level)
	end

	for slot4, slot5 in pairs(slot0) do
		table.sort(slot5, function (slot0, slot1)
			return slot1 < slot0
		end)
	end
end)
slot10("gMedalCollectionCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.medal) do
		slot0[slot5.medalID] = slot0[slot5.medalID] or {}
		slot0[slot5.medalID][slot5.sort] = slot5
	end
end)
slot10("gEffectOptionCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.effect_option) do
		slot0[slot5.resPath] = slot5.tintBlack
	end
end)
slot10("gStandbyEffectOptionCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.effect_option) do
		slot0[slot5.resPath] = slot5.standbyTinblack
	end
end)
slot10("gAutoChessKeyWordsCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.auto_chess.key_words) do
		slot0[slot5.key] = slot5
	end
end)
slot10("gSkillDescKeyWordsCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.skill_desc_key_words) do
		slot0[slot5.key] = slot5
	end
end)
slot10("gTotemStarIdCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.totem.star) do
		slot0[slot5.starSeqID] = slot0[slot5.starSeqID] or {}
		slot0[slot5.starSeqID][slot5.starLevel] = slot5
	end

	for slot4, slot5 in pairs(slot0) do
		if itertools.size(slot5) == 0 then
			error(string.format("symbol表中starSeqID的对应的star表星级未配置,starSeqID为%s", slot4))
		end
	end
end)

function slot17(slot0)
	slot1, slot2, slot3 = nil

	if type(slot0) == "table" then
		for slot7, slot8 in ipairs(slot0) do
			slot1 = gAntiCheat[slot8]
			slot2 = csv[slot8]
			slot3 = slot8
		end
	else
		slot1 = gAntiCheat[slot0]
		slot2 = csv[slot0]
		slot3 = slot0
	end

	return slot1, slot2, slot3
end

if false and not ANTI_AGENT then
	globals.gAntiCheat = {
		unit = {},
		buff = {},
		skill = {},
		skill_process = {},
		effect_event = {},
		base_attribute = {
			nature_matrix = {}
		}
	}

	function slot18(slot0)
		uv1 = "csvPairs"
		slot1, slot2, slot3 = slot1(slot0)

		for slot8, slot9 in csvPairs(slot2) do
			-- Nothing
		end

		return table.salttable({
			[slot8] = csvNumSum(slot9),
			__default = csvNumSum(slot2.__default.__index)
		})
	end

	gAntiCheat.unit = slot18("unit")
	gAntiCheat.skill = slot18("skill")
	gAntiCheat.skill_process = slot18("skill_process")
	gAntiCheat.buff = slot18("buff")
	gAntiCheat.effect_event = slot18("effect_event")
	gAntiCheat.base_attribute.nature_matrix = slot18({
		"base_attribute",
		"nature_matrix"
	})

	printInfo("config_defines - anti cheat %f KB", collectgarbage("count"))
end

function globals.checkGGCheat()
	if ANTI_AGENT then
		return
	end

	for slot3, slot4 in ipairs(_gg_) do
		slot6 = slot4[#slot4]
		slot7 = csvNumSum(slot4) - slot6

		if _gg_cheat_[slot6] == nil or math.abs(slot8 - slot7) > 1e-05 then
			errorInWindows("checkGGCheat %d %s %s", slot3, slot8, slot7)
			exitApp("close your cheating software")
		end
	end

	checkSpecificCsvCheat("unit")
	checkSpecificCsvCheat("skill")
	checkSpecificCsvCheat("skill_process")
	checkSpecificCsvCheat("buff")
	checkSpecificCsvCheat("effect_event")
	checkSpecificCsvCheat({
		"base_attribute",
		"nature_matrix"
	})
end

function globals.checkSpecificCsvCheat(slot0, slot1)
	return

	if ANTI_AGENT then
		return
	end

	uv2 = "ANTI_AGENT"
	slot2, slot3, slot4 = slot2(slot0)

	if slot1 == nil then
		slot1 = itertools.ikeys(csvPairs(slot3))
	end

	if math.abs(slot2.__default - csvNumSum(slot3.__default.__index)) > 1e-05 then
		errorInWindows("checkSpecificCsvCheat %s default %s %s", slot4, slot6, slot5)
		exitApp("close your cheating software")
	end

	itertools.each(slot1, function (slot0, slot1)
		uv2 = "csvNumSum"
		uv4 = "math"

		if math.abs((slot2[slot1] or 0) - (csvNumSum(slot4[slot1]) or 0)) > 1e-05 then
			uv6 = "abs"

			errorInWindows("checkSpecificCsvCheat %s %s %s %s", slot6, slot1, slot2, slot3)
			exitApp("close your cheating software")
		end
	end)
end

printInfo("config_defines - index and cache %f KB", collectgarbage("count"))
collectgarbage("collect")
printInfo("config_defines - after collect %f KB", collectgarbage("count"))

if device.platform == "windows" then
	for slot21, slot22 in pairs(gHandbookCsv) do
		if not csv.cards[slot21] then
			error(string.format("图鉴中有%d, 但cards表未开放", slot21))

			break
		end
	end

	slot18 = csv.items
	slot19 = csv.unit

	for slot23, slot24 in orderCsvPairs(csv.cards) do
		if slot24.feelType <= 3 then
			if itertools.include(slot24.feelItems, 604) or itertools.include(slot24.feelItems, 605) then
				error(string.format("csv.cards[%d].feelItems 好感度道具有不合法的配置, 品质不对应", slot23))
			end
		elseif itertools.include(slot24.feelItems, 601) or itertools.include(slot24.feelItems, 602) or itertools.include(slot24.feelItems, 603) then
			error(string.format("csv.cards[%d].feelItems 好感度道具有不合法的配置, 品质不对应", slot23))
		end

		if LOCAL_LANGUAGE == "cn" then
			for slot28, slot29 in orderCsvPairs(slot24) do
				if not csv.card_skin[slot28] then
					error(string.format("csv.cards id(%s), field skinSkillMap, not exist csv.card_skin id(%s)", slot23, slot28))
				end
			end
		end
	end
end
