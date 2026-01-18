if global.cmplay == false {
	draw_set_font(Font8);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);

	draw_set_alpha(0.5);

	if global.cmmode == 1 {
		if global.inputtype
			draw_text(view_xport[0] + 72, view_hport[0] - 8, "Open Objects Menu using ENTER");
		else
			draw_text(view_xport[0] + 72, view_hport[0] - 8, "Open Objects Menu using ACTION");
	} else if global.cmmode == 2 {
		draw_text(view_xport[0] + 72, view_hport[0] - 8, "DELETE to Delete Selected Objects, INSERT to Autofill with Terrain");
	} else if global.cmmode == 3 {
		draw_text(view_xport[0] + 72, view_hport[0] - 8, "MIDDLE CLICK to Drag Camera, WHEEL UP / DOWN zoom in and out");
	}

	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_font(Font4);

	draw_set_alpha(1);

	if global.cmmode == 1 {
		draw_sprite(spr_brush_tool, 0, view_xport[0] + 32, view_hport[0] - 32);
		draw_text(view_xport[0] + 72, view_hport[0] - 32, "Brush Mode");
	} else if global.cmmode == 2 {
		draw_sprite(spr_lasso_tool, 0, view_xport[0] + 32, view_hport[0] - 32);
		draw_text(view_xport[0] + 72, view_hport[0] - 32, "Lasso Mode");
	} else if global.cmmode == 3 {
		draw_sprite(spr_cursor_mode, 0, view_xport[0] + 32, view_hport[0] - 32);
		draw_text(view_xport[0] + 72, view_hport[0] - 32, "Camera Mode");
	}

	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(Font8);

	draw_set_colour(c_black);
	draw_roundrect((view_wport[0] / 2) - 48, view_yport[0] + 32, (view_wport[0] / 2) + 48, view_yport[0] + 64, false);

	draw_set_colour(c_white);
	draw_text((view_wport[0] / 2), view_yport[0] + 48, string_concat(string(mouse_x), ", ", string(mouse_y)));
}