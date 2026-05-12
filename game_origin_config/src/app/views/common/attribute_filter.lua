slot0 = class("AttributeFilterView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "common_influence_attr.json"
slot0.RESOURCE_BINDING = {
	sm = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:atrributeBtn(1)
				end)
			}
		}
	},
	speed = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:atrributeBtn(13)
				end)
			}
		}
	},
	wg = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:atrributeBtn(7)
				end)
			}
		}
	},
	wf = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:atrributeBtn(9)
				end)
			}
		}
	},
	tg = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:atrributeBtn(8)
				end)
			}
		}
	},
	tf = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:atrributeBtn(10)
				end)
			}
		}
	},
	btn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnClose")
			}
		}
	},
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnClose")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.isShow = slot1.panelState
	slot0.selectDatas = slot1.selectDatas
end

function slot0.atrributeBtn(slot0, slot1)
	slot0.selectDatas:set(slot1)
	slot0.isShow:set(false)
end

function slot0.btnClose(slot0)
	slot0.isShow:set(false)
end

return slot0
