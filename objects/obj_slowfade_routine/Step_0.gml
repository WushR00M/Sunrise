fadeal += 0.01;

if fadeal == 0.9 {
	draw_set_color(c_white);
	draw_set_alpha(1);
	if global.op_legacytitle
		room_goto(rm_intro_animation_legacy);
	else
		room_goto(rm_intro_animation);
}