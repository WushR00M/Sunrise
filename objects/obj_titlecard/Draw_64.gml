draw_set_color(c_black);

if (state < 2) {
    draw_rectangle(0, bg_y1, view_w, bg_y2, false);
}

if (state >= 2) {
    draw_rectangle(0, top_y, view_w, top_y + top_height, false);
    draw_rectangle(0, bottom_y, view_w, bottom_y + bottom_height, false);
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(FontTlCard);
draw_set_color(c_white);

draw_text(text_x, text_y, tc_text);
