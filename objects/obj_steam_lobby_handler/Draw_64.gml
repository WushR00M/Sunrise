draw_set_colour(c_black);
draw_set_font(Font4);
draw_set_halign(fa_left);

draw_text(view_xport[0] + 17, view_yport[0] + 17, "Connected to Lobby:");
draw_set_colour(c_white);
draw_text(view_xport[0] + 16, view_yport[0] + 16, "Connected to Lobby:");

draw_set_font(Font7);

var _len = array_length(members);
for (var i = 0; i < len; i++) {
	draw_set_colour(c_black);
	draw_text(view_xport[0] + 16, yy + 1, members[i][1]);
	draw_set_colour(c_white);
	draw_text(view_xport[0] + 16, yy, members[i][1]);
	
	yy += 16;
}

if chat_menu {
	draw_set_colour(c_black);
	draw_rectangle(view_xport[0], chat_y, view_wport[0], chat_y + 32, false);
	draw_set_colour(c_dkgray);
	draw_set_font(Font7);
	draw_set_halign(fa_right);
	draw_set_halign(fa_center);
	draw_text(view_wport[0] - 16, chat_y + 16, "Enter your chat message here...");
	draw_set_halign(fa_left);
	draw_set_colour(c_white);
	draw_text(view_xport[0], chat_y + 16, chat_message);
}