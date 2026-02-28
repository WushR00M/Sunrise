if global.op_showfps == 1 {
	draw_set_alpha(1);
	draw_set_font(Font7);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_set_color(c_black);
	draw_text(view_wport[0] - 9, view_hport[0] - 9, string(fps));
	
	if fps < 30
		draw_set_color(c_red);
	else if fps < 60 && fps >= 30
		draw_set_color(c_yellow);
	else
		draw_set_color(c_white);
		
	draw_text(view_wport[0] - 8, view_hport[0] - 8, string(fps));
}

draw_set_alpha(1);
draw_set_font(Font7);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_colour(c_black);
draw_text(view_xport[0] + 7, volume_slider_y + 1, "Master Volume: " + string(global.mastervol));
draw_set_colour(c_white);
draw_text(view_xport[0] + 8, volume_slider_y, "Master Volume: " + string(global.mastervol));

draw_set_alpha(1);
draw_set_colour(make_colour_rgb(237, 0, 140));
draw_rectangle(view_xport[0], volume_slider_y2, view_wport[0] * (global.mastervol / 100), volume_slider_y2 + 16, false);	