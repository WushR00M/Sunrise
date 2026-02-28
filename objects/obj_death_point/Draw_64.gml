draw_set_alpha(1);
draw_sprite(spr_gameover_glass, 0, view_xport[0], view_yport[0]);

if notres_fade == true {
	draw_set_alpha(notres_alpha);
	draw_set_colour(c_white);
	
	draw_rectangle(0, 0, room_width, room_height, false);
}

if error == true {
	draw_set_alpha(1);
	draw_set_colour(c_white);
	draw_sprite_ext(spr_gameover_error, 0, view_wport[0] / 2, view_hport[0] / 2, 2, 2, 0, c_white, 1);
}