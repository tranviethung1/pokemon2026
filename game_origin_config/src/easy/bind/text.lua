slot0 = require("easy.bind.helper")

function bind.text(slot0, slot1, slot2)
	uv3 = "bindData"

	slot3.bindData(slot0, slot1, slot2, slot1.setString or slot1.setTitleText)
end

function bind.effect(slot0, slot1, slot2)
	uv3 = "bindData"

	slot3.bindData(slot0, slot1, slot2, text.addEffect)
end

function bind.visible(slot0, slot1, slot2)
	uv3 = "bindData"

	slot3.bindData(slot0, slot1, slot2, slot1.setVisible)
end

function bind.font(slot0, slot1, slot2)
	uv3 = "bindData"

	slot3.bindData(slot0, slot1, slot2, slot1.setFontSize)
end
