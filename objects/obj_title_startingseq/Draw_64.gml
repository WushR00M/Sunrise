if phase == 1 {
	dr_a += 0.01;
	draw_set_alpha(dr_a);
	draw_sprite(spr_sunriselogo, 0, room_width / 2, room_height / 2);
} else if phase == 2 {
	draw_set_alpha(1);
	draw_sprite(spr_sunrise_logotext, 0, room_width / 2, room_height / 2);
} else if phase == 3 {
	draw_set_alpha(1);
	draw_sprite_ext(spr_sunrise_logotext, 0, room_width / 2, room_height / 2, 1.5, 1.5, 0, c_white, 1);	
}