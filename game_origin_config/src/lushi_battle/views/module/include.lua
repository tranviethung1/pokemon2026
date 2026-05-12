slot0 = {}
globals.autoChessModule = slot0

require("lushi_battle.views.module.notify")
require("battle.app_views.battle.module.base")

slot0.mods = {
	require("lushi_battle.views.module.objmanager"),
	require("lushi_battle.views.module.headnum"),
	require("lushi_battle.views.module.encounter"),
	require("lushi_battle.views.module.trainer"),
	require("lushi_battle.views.module.handselect"),
	require("lushi_battle.views.module.event_show")
}
