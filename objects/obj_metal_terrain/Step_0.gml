
	if place_meeting(x, y - 32, obj_metal_terrain) {
		sprite_index = spr_autoter_metal_bottom;
	}

	if sprite_index != spr_autoter_metal_bottom {
		if place_meeting(x + 32, y, obj_metal_terrain) {
			sprite_index = spr_autoter_metal_top_left;
		} else if place_meeting(x - 32, y, obj_metal_terrain) {
			sprite_index = spr_autoter_metal_top_right;
		}

		if place_meeting(x + 32, y, obj_metal_terrain) && place_meeting(x - 32, y, obj_metal_terrain) {
			sprite_index = spr_autoter_metal_top_middle;
		}
	}