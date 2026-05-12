slot0 = {
	{},
	__size = 1
}
csv.yunying.skyscraper_resources = {
	{
		id = 1,
		huodongID = 1,
		range = {
			0,
			1
		},
		pngResource = {
			"activity/sky_scraper/img_fz1.png",
			"activity/sky_scraper/img_fz5.png",
			"activity/sky_scraper/img_fz6.png",
			"activity/sky_scraper/img_fz8.png"
		}
	},
	{
		id = 2,
		huodongID = 1,
		range = {
			1,
			35
		},
		pngResource = {
			"activity/sky_scraper/img_fz1.png",
			"activity/sky_scraper/img_fz2.png",
			"activity/sky_scraper/img_fz3.png",
			"activity/sky_scraper/img_fz4.png",
			"activity/sky_scraper/img_fz5.png",
			"activity/sky_scraper/img_fz6.png",
			"activity/sky_scraper/img_fz7.png",
			"activity/sky_scraper/img_fz8.png",
			"activity/sky_scraper/img_fz9.png",
			"activity/sky_scraper/img_fz10.png",
			"activity/sky_scraper/img_fz11.png",
			"activity/sky_scraper/img_fz12.png",
			"activity/sky_scraper/img_fz13.png",
			"activity/sky_scraper/img_fz14.png",
			"activity/sky_scraper/img_fz15.png"
		}
	},
	{
		id = 3,
		huodongID = 1,
		range = {
			35,
			50
		},
		spineResource = {
			"skyscraper/floor_2.skel",
			"skyscraper/floor_3.skel",
			"skyscraper/floor_5.skel",
			"skyscraper/flooor_6.skel"
		}
	},
	{
		id = 4,
		huodongID = 1,
		range = {
			50,
			51
		},
		spineResource = {
			"skyscraper/floor_1.skel"
		}
	},
	__size = 4,
	__default = {
		__index = {
			huodongID = 1001,
			range = ({
				default = slot0[1]
			}).default,
			pngResource = ({
				default = slot0[1]
			}).default,
			spineResource = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.yunying.skyscraper_resources
