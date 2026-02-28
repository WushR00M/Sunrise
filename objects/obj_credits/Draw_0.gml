draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(Font7);
draw_set_color(c_white);
var cx = 16;

// Draw each line
for (var i = 0; i < array_length(credit_text); i++) {
    var y_pos = scroll_y + (i * line_height);
    draw_text(cx, y_pos, credit_text[i]);
}
