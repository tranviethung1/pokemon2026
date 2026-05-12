slot0 = {
	__size = 0
}
csv.sprite_jump.base = {
	{
		interval = 140,
		height_score = 1.6,
		jump_height_max = 600,
		px_to_height = 0.02,
		speedx = 20,
		gravity = 0.8,
		countdown = 70,
		stage_floor = 30,
		id = 1,
		fall_speed = 40,
		speedy = 30
	},
	__size = 1,
	__default = {
		__index = {
			startCountDown = 3,
			height_score = 0,
			interval = 0,
			gravity = 0,
			speedx = 0,
			px_to_height = 0,
			countdown = 0,
			fall_speed = 0,
			speedy = 0
		}
	}
}

return csv.sprite_jump.base
