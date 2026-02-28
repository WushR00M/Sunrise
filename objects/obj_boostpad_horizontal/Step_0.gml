if super == true {
	sprite_index = spr_superboostpad_horizontal;
	boost_power = 20;
}

if (sign(image_xscale) = 1) {
	if (player_collide_object(C_LEFT)) {
		var player = instance_nearest(x, y, obj_player)
		with(player) {
			x_speed = other.boost_power;
			ground_speed = other.boost_power;
		}
		
		var vfx = instance_create_layer(player.x - 4, y, "Objects", obj_boostpad_effect);
		vfx.image_yscale = -1;
	}
} else if (sign(image_xscale) = -1) {
	if (player_collide_object(C_RIGHT)) {
		var player = instance_nearest(x, y, obj_player)
		with(player) {
			x_speed = -other.boost_power;
			ground_speed = -other.boost_power;
		}
		
		var vfx = instance_create_layer(player.x + 4, y, "Objects", obj_boostpad_effect);
		vfx.image_yscale = -1;
	}
}