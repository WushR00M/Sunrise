draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(bg_color);
draw_set_font(Font7);

var draw_x = x - width / 2;
var draw_y = y - height / 2;

draw_set_color(bg_color);
draw_roundrect(draw_x, draw_y, draw_x + width, draw_y + height, false);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, text);
