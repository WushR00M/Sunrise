draw_self();

draw_set_font(Font7);
if fade == true {
	if draw_get_alpha() != 0
		draw_set_alpha(draw_get_alpha() - 0.1);
}

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if phase == 1
	draw_text(16, 16, "Sunrise v0.3: Codename Laser, loading...");
else if phase == 2
	draw_text(16, 16, "Loaded options data (options.ini)");
else if phase == 3
	draw_text(16, 16, "Loaded profiles (user.ini)");
else if phase == 4
	draw_text(16, 16, "Enabled audio group no. 1");
else if phase == 5
	draw_text(16, 16, "Discord Rich Presence initalized");
else if phase >= 6
	draw_text(16, 16, "Sunrise v0.3: Codename Laser LOADED!");