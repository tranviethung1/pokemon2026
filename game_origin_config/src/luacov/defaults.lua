return {
	tick = true,
	runreport = true,
	onlysummary = false,
	csmode = false,
	statsfile = "luacov.stats.out",
	deletestats = false,
	reportfile = "luacov.report.out",
	savestepsize = 1000,
	savetick = 5,
	codefromstrings = false,
	include = {},
	exclude = {
		"net/",
		"3rd/",
		"config/",
		"luastl/",
		"util/",
		"editor/",
		"luacov/",
		"cocos/"
	},
	modules = {}
}
