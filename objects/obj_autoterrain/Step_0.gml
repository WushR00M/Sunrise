if global.cmtheme == "Plains" or global.cmtheme == "Forest" {
	if place_meeting(x, y - 32, obj_autoterrain) {
		if sprite_index == spr_autoter_grass
			sprite_index = spr_autoter_dirt;
	}
} else if global.cmtheme == "Metropolis" {
	if place_meeting(x, y - 32, obj_autoterrain) {
		sprite_index = spr_autoter_metal_bottom;
	}

	if sprite_index != spr_autoter_metal_bottom {
		if place_meeting(x + 32, y, obj_autoterrain) {
			sprite_index = spr_autoter_metal_top_left;
		} else if place_meeting(x - 32, y, obj_autoterrain) {
			sprite_index = spr_autoter_metal_top_right;
		}

		if place_meeting(x + 32, y, obj_autoterrain) && place_meeting(x - 32, y, obj_autoterrain) {
			sprite_index = spr_autoter_metal_top_middle;
		}
	}
} else if global.cmtheme == "Stage" {
	sprite_index = spr_autoter_stage;	
} else if global.cmtheme == "Mansion" {
	if place_meeting(x, y - 32, obj_autoterrain) {
		if sprite_index == spr_autoter_mansion_top
			sprite_index = spr_autoter_mansion_bottom;
	}
}