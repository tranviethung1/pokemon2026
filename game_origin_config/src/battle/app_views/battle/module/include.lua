slot0 = {}
globals.battleModule = slot0

require("battle.app_views.battle.module.base")
require("battle.app_views.battle.module.notify")

slot0.mods = {
	require("battle.app_views.battle.module.objmanager"),
	require("battle.app_views.battle.module.mainarea"),
	require("battle.app_views.battle.module.skillinfo"),
	require("battle.app_views.battle.module.speedrank"),
	require("battle.app_views.battle.module.sys"),
	require("battle.app_views.battle.module.vsinfo"),
	require("battle.app_views.battle.module.weather"),
	require("battle.app_views.battle.module.stage"),
	require("battle.app_views.battle.module.bufficon"),
	require("battle.app_views.battle.module.headnum"),
	require("battle.app_views.battle.module.frame"),
	require("battle.app_views.battle.module.linkeffect"),
	require("battle.app_views.battle.module.rayeffect"),
	require("battle.app_views.battle.module.debugarea")
}
slot0.dailyActivityMods = {
	require("battle.app_views.battle.module.spec.daily_activity")
}
slot0.craftMods = {
	require("battle.app_views.battle.module.spec.craft")
}
slot0.bossMods = {
	require("battle.app_views.battle.module.spec.world_boss")
}
slot0.onlineFightMods = {
	require("battle.app_views.battle.module.spec.online_fight")
}
slot0.gymMods = {
	require("battle.app_views.battle.module.spec.gym")
}
slot0.crossMineMods = {
	require("battle.app_views.battle.module.spec.cross_mine")
}
slot0.mimicryMods = {
	require("battle.app_views.battle.module.spec.mimicry")
}

return slot0
