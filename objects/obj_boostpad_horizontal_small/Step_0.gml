if (sign(image_xscale) = 1) {
	if (player_collide_object(C_LEFT)) {
		var player = instance_nearest(x, y, obj_player)
		with(player) {
			x_speed = other.boost_power;
			ground_speed = other.boost_power;
		}
	}
} else if (sign(image_xscale) = -1) {
	if (player_collide_object(C_RIGHT)) {
		var player = instance_nearest(x, y, obj_player)
		with(player) {
			x_speed = -other.boost_power;
			ground_speed = -other.boost_power;
		}
	}
}