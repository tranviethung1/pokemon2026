require("easy.richtext")

slot0 = string.utf8charlen
globals.ActionRichText = class("ActionRichText", ccui.RichText)

function ActionRichText.ctor(slot0, slot1, slot2)
	slot0:ignoreContentAdaptWithSize(false)
	slot0:size(slot2.width, slot0:getVirtualRendererSize().height)
	slot0:size(slot2.width, slot0:getVirtualRendererSize().height):xy(0, slot2.height - 20):anchorPoint(0, 1)

	slot0.elemens = {}
	slot0.lineWidth = slot2.width

	slot0:splitString(slot1)
end

function ActionRichText.splitString(slot0, slot1)
	slot6 = slot0.lineWidth

	for slot6, slot7 in ipairs(rich.createElemsWithWidth(slot1, nil, , slot6)) do
		slot8 = slot7[1]
		slot10, slot11, slot12, slot13, slot14 = unpack(slot7[2])
		slot15 = 1

		while slot15 <= #slot12 do
			slot17 = slot12
			uv17 = "rich"
			slot17 = slot17(slot12.byte(slot17, slot15)) + slot15
			slot18 = slot12:sub(slot15, slot17 - 1)
			slot15 = slot17
			slot19 = cc.Label:createWithTTF(slot18, slot13, slot14):color(slot10):opacity(slot11)

			print("resultStr", slot18)
			table.insert(slot0.elemens, slot19)
			slot0:pushBackElement(ccui.RichElementCustomNode:create(#slot0.elemens, slot10, slot11, slot19))
		end
	end
end

function ActionRichText.runWaveAction(slot0)
	slot1 = 1
	slot2 = 20

	for slot6, slot7 in ipairs(slot0.elemens) do
		performWithDelay(slot7, function ()
			uv0 = "x"
			slot1 = slot0
			slot0 = slot0.x(slot1)
			uv1 = "x"
			slot1 = slot1:y()
			slot2 = cc.Sequence
			slot3 = slot2
			uv8 = "y"
			slot9 = cc.p
			uv11 = "cc"
			uv9 = "y"
			uv3 = "x"

			slot3:runAction(cc.RepeatForever:create(slot2.create(slot3, cc.EaseSineInOut:create(cc.MoveTo:create(slot8 / 2, slot9(slot0, slot1 + slot11))), cc.EaseSineInOut:create(cc.MoveTo:create(slot9 / 2, cc.p(slot0, slot1))))))
		end, slot6 * 0.1)
	end
end
