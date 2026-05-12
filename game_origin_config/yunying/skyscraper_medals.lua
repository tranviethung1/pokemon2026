slot0 = {
	__size = 3,
	[6] = {
		129,
		80,
		61
	},
	[9] = {
		82,
		108,
		136
	},
	[13] = {
		131,
		78,
		0
	}
}
slot1 = {
	[10] = slot0[13],
	[3] = slot0[6],
	[5] = slot0[9],
	[4] = slot0[6],
	[7] = slot0[9],
	[6] = slot0[9],
	[9] = slot0[13],
	[8] = slot0[13]
}
csv.yunying.skyscraper_medals = {
	{
		resourceNum = "activity/sky_scraper/txt_1_tie.png",
		medalsName = "skyscraperMedalsName1",
		huodongID = 1,
		points = 60,
		id = 1,
		rankRes = "activity/sky_scraper/icon_tie.png",
		resource = "activity/sky_scraper/icon_xz_tie.png",
		award = {
			__size = 2,
			stamina = 100,
			[2322.0] = 1
		}
	},
	{
		medalLevel = 2,
		resourceNum = "activity/sky_scraper/txt_2_tie.png",
		medalsName = "skyscraperMedalsName1",
		rankRes = "activity/sky_scraper/icon_tie.png",
		resource = "activity/sky_scraper/icon_xz_tie.png",
		huodongID = 1,
		id = 2,
		points = 80,
		award = {
			[503.0] = 5,
			gold = 288000,
			__size = 2
		}
	},
	{
		medalLevel = 3,
		resourceNum = "activity/sky_scraper/txt_1_tong.png",
		medalsName = "skyscraperMedalsName2",
		rankRes = "activity/sky_scraper/icon_tong.png",
		resource = "activity/sky_scraper/icon_xz_tong.png",
		huodongID = 1,
		id = 3,
		points = 100,
		award = {
			[519.0] = 3,
			__size = 2,
			[2023.0] = 1
		},
		color = slot1[3]
	},
	{
		medalLevel = 4,
		resourceNum = "activity/sky_scraper/txt_2_tong.png",
		medalsName = "skyscraperMedalsName2",
		rankRes = "activity/sky_scraper/icon_tong.png",
		resource = "activity/sky_scraper/icon_xz_tong.png",
		huodongID = 1,
		id = 4,
		points = 120,
		award = {
			__size = 2,
			rmb = 188,
			[520.0] = 5
		},
		color = slot1[4]
	},
	{
		medalLevel = 5,
		resourceNum = "activity/sky_scraper/txt_1_yin.png",
		medalsName = "skyscraperMedalsName3",
		rankRes = "activity/sky_scraper/icon_yin.png",
		resource = "activity/sky_scraper/icon_xz_yin.png",
		huodongID = 1,
		id = 5,
		points = 140,
		award = {
			__size = 2,
			[901.0] = 30,
			[502.0] = 6
		},
		color = slot1[5]
	},
	{
		medalLevel = 6,
		resourceNum = "activity/sky_scraper/txt_2_yin.png",
		medalsName = "skyscraperMedalsName3",
		rankRes = "activity/sky_scraper/icon_yin.png",
		resource = "activity/sky_scraper/icon_xz_yin.png",
		huodongID = 1,
		id = 6,
		points = 160,
		award = {
			gold = 588000,
			[902.0] = 20,
			__size = 2
		},
		color = slot1[6]
	},
	{
		medalLevel = 7,
		resourceNum = "activity/sky_scraper/txt_3_yin.png",
		medalsName = "skyscraperMedalsName3",
		rankRes = "activity/sky_scraper/icon_yin.png",
		resource = "activity/sky_scraper/icon_xz_yin.png",
		huodongID = 1,
		id = 7,
		points = 180,
		award = {
			__size = 2,
			[2412.0] = 1,
			[850.0] = 500
		},
		color = slot1[7]
	},
	{
		medalLevel = 8,
		resourceNum = "activity/sky_scraper/txt_1_jin.png",
		medalsName = "skyscraperMedalsName4",
		rankRes = "activity/sky_scraper/icon_jin.png",
		resource = "activity/sky_scraper/icon_xz_jin.png",
		huodongID = 1,
		id = 8,
		points = 200,
		award = {
			gold = 880000,
			[4000.0] = 200,
			__size = 2
		},
		color = slot1[8]
	},
	{
		medalLevel = 9,
		resourceNum = "activity/sky_scraper/txt_2_jin.png",
		medalsName = "skyscraperMedalsName4",
		rankRes = "activity/sky_scraper/icon_jin.png",
		resource = "activity/sky_scraper/icon_xz_jin.png",
		huodongID = 1,
		id = 9,
		points = 220,
		award = {
			__size = 2,
			[151.0] = 1000,
			[521.0] = 1
		},
		color = slot1[9]
	},
	{
		medalLevel = 10,
		resourceNum = "activity/sky_scraper/txt_3_jin.png",
		medalsName = "skyscraperMedalsName4",
		rankRes = "activity/sky_scraper/icon_jin.png",
		resource = "activity/sky_scraper/icon_xz_jin.png",
		huodongID = 1,
		id = 10,
		points = 240,
		award = {
			__size = 2,
			rmb = 388,
			[529.0] = 5000
		},
		color = slot1[10]
	},
	__size = 10,
	__default = {
		__index = {
			medalLevel = 1,
			resourceNum = "",
			medalsName = "",
			rankRes = "",
			resource = "",
			huodongID = 1001,
			points = 0,
			award = {
				__size = 0
			},
			color = {
				76,
				81,
				106
			}
		}
	}
}

return csv.yunying.skyscraper_medals
