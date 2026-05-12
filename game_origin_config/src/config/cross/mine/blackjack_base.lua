slot0 = {
	{},
	{
		__size = 0
	},
	__size = 2
}
csv.cross.mine.blackjack_base = {
	{
		id = 1,
		playTimes = 5,
		greatPoints = 40,
		points = 20,
		openTime = {
			{
				1000,
				2000
			},
			{
				1200,
				2200
			}
		},
		rewards = {
			gold = 30000,
			__size = 3,
			coin13 = 750,
			[14.0] = 3
		},
		greatRewards = {
			gold = 60000,
			__size = 3,
			coin13 = 1500,
			[14.0] = 6
		},
		talks = {
			"#C0xF76B45##Pfont/youmi1.ttf#Fun City#C0x5B545B##Pfont/youmi1.ttf# is great, don’t you know? You can have fun from #C0xF76B45##Pfont/youmi1.ttf#%s:00#C0x5B545B##Pfont/youmi1.ttf# to #C0xF76B45##Pfont/youmi1.ttf#%s:00#C0x5B545B##Pfont/youmi1.ttf#. Go quickly, or you would arrive closed!",
			"#C0x5B545B##Pfont/youmi1.ttf#It's heard that #C0xF76B45##Pfont/youmi1.ttf#Fun City#C0x5B545B##Pfont/youmi1.ttf# was built in the left square, of #C0xF76B45##Pfont/youmi1.ttf#%s:00 to %s:00#C0x5B545B##Pfont/youmi1.ttf# today open for fun. I have to go quickly...;#Pfont/youmi1.ttf##C0x5B545B#What's the matter? I have an appointment on #C0xF76B45##Pfont/youmi1.ttf#%s:00#C0x5B545B##Pfont/youmi1.ttf# at #C0xF76B45##Pfont/youmi1.ttf#Fun City#C0x5B545B##Pfont/youmi1.ttf# to meet my friends and have fun, till #C0xF76B45##Pfont/youmi1.ttf#%s:00#C0x5B545B##Pfont/youmi1.ttf#, having fun all day. Don'st be in my way...;#Pfont/youmi1.ttf##C0x5B545B#Hey, long time no see! It turns out you are also heading #C0xF76B45##Pfont/youmi1.ttf#Fun City#C0x5B545B##Pfont/youmi1.ttf# uh，today it opens at #C0xF76B45##Pfont/youmi1.ttf#%s:00#C0x5B545B##Pfont/youmi1.ttf#, and close at #C0xF76B45##Pfont/youmi1.ttf#%s:00#C0x5B545B##Pfont/youmi1.ttf# Let's go together!",
			"#C0xF76B45##Pfont/youmi1.ttf#Fun City#C0x5B545B##Pfont/youmi1.ttf# opens from #C0xF76B45##Pfont/youmi1.ttf#%s:00 to %s:00#C0x5B545B##Pfont/youmi1.ttf# today. Hey, I don’t know if it’s a gimmick, the openinghour is not certain",
			"#Pfont/youmi1.ttf##C0x5B545B#Hold there! I know what you are going to ask!#C0xF76B45##Pfont/youmi1.ttf# Fun City is open from %s:00 to %s:00 #C0x5B545B##Pfont/youmi1.ttf#, go ahead and you're welcome!"
		}
	},
	__size = 1,
	__default = {
		__index = {
			playTimes = 0,
			greatPoints = 0,
			points = 0,
			openTime = ({
				default = slot0[1]
			}).default,
			rewards = ({
				default = slot0[2]
			}).default,
			greatRewards = ({
				default = slot0[2]
			}).default,
			talks = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.cross.mine.blackjack_base
