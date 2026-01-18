if (sign(image_yscale) = 1) {
	if (player_collide_object(C_BOTTOM)) {
		var player = instance_nearest(x, y, obj_player)
		with(player) {
			state = ST_JUMP;
			y_speed = -other.boost_power;
			ground = false;
		}
		
		var vfx = instance_create_layer(x, player.y - 4, "Objects", obj_boostpad_effect);
		vfx.image_yscale = -1;
	}
} else if (sign(image_yscale) = -1) {
	if (player_collide_object(C_TOP)) {
		var player = instance_nearest(x, y, obj_player)
		with(player) {
			state = ST_JUMP;
			y_speed = other.boost_power;
			ground = false;
		}
		
		var vfx = instance_create_layer(x, player.y + 4, "Objects", obj_boostpad_effect);
		vfx.image_yscale = -1;
	}
}