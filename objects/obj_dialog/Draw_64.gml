if (!visible) exit;

// Overlay (still covers whole screen)
draw_set_alpha(bgfade);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);
draw_set_font(Font4);

// --- Top-left of current view ---
var cam = view_camera[0];
var view_x = view_xport[0];
var view_y = view_yport[0];

// Dialog box
var _w = 500;
var _h = display_get_gui_height(); 
var _x = draw_x + view_x;  // apply sliding offset
var _y = view_y;           // stick to top

draw_set_color(c_black);
draw_roundrect(_x, _y, _x+_w, _y+_h, false);

// Icon
if (icon_sprite != -1) {
    draw_sprite_ext(icon_sprite, 0, _x+_w/2, _y+128, 1, 1, 0, c_white, 1);
}

// Text
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(_x+_w/2, _y+260, message_text);

// Buttons
var btn_count = array_length(buttons);
var btn_w = 300;
var btn_h = 50;
var btn_gap = 16;
var start_y = _y+350;

for (var i=0; i<btn_count; i++) {
    var bx = _x+_w/2 - btn_w/2;
    var by = start_y + i*(btn_h+btn_gap);
    var hovered = (hover_index == i);

    var col = hovered ? make_color_rgb(20, 120, 255) : make_color_rgb(30, 30, 30);

    draw_set_color(col);
    draw_roundrect(bx, by, bx+btn_w, by+btn_h, false);

    draw_set_color(c_white);
    draw_text(bx+btn_w/2, by+btn_h/2-8, buttons[i].label);
}
