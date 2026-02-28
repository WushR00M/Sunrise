if global.cmsetup {
	var screen_w = display_get_gui_width();
	var screen_h = display_get_gui_height();

	draw_set_color(c_black);
	draw_rectangle(0, obj_toolbar.toolbar_height, screen_w, screen_h, false); // filled background

	draw_set_colour(c_white);
	
	draw_set_font(Font4);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(16, obj_toolbar.toolbar_height + 8, "Setup Your Level:");
	
	draw_set_font(Font7);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(screen_w / 2, screen_h / 2, "This feature is coming soon, stand by!");
}