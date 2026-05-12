slot1 = class("RotationCardView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "character_rotation_card.json"
slot1.RESOURCE_BINDING = {
	["bottomCenterPanel.attr"] = "attr",
	["bottomCenterPanel.name"] = {
		varname = "nodeName",
		binds = {
			{
				event = "effect",
				data = {
					glow = {
						color = ui.COLORS.GLOW.WHITE
					}
				}
			}
		}
	},
	centerPanel = {
		binds = {
			event = "extend",
			class = "rotation_spine",
			props = {
				a = 500,
				minScale = 0.5,
				b = 170,
				maxScale = 0.8,
				data = bindHelper.self("ids"),
				unitRes = bindHelper.self("unitRes"),
				textNode = bindHelper.self("nodeName"),
				icon = bindHelper.self("attr"),
				onNode = function (slot0, slot1)
					slot1:y(450)
				end,
				clickCb = function (slot0, slot1)
					gGameUI:stackUI("new_character.select_card", nil, , slot1, slot0.clickClose)
				end
			},
			handlers = {
				clickClose = bindHelper.self("onClose")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.cb = slot1
	slot0.ids = {}
	slot0.unitRes = {
		"koudai_miaowazhongzi2/miaowazhongzi2.skel",
		"koudai_xiaohuolong2/xiaohuolong2.skel",
		"koudai_jienigui2/jienigui_zhanshi2.skel"
	}

	for slot5, slot6 in ipairs(csv.newbie_init[1].cards) do
		table.insert(slot0.ids, slot6.id)
	end

	slot2 = csv.cards[slot0.ids[2]]

	slot0.nodeName:text(slot2.name)
	slot0.attr:texture(ui.ATTR_ICON[csv.unit[slot2.unitID].natureType])
end

function slot1.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot1
