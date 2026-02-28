if (!visible) exit;

// Overlay
draw_set_alpha(bgfade);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);
draw_set_font(Font4);

// Get view offsets
var cam = view_camera[0];
var view_x = view_xport[0];
var view_y = view_yport[0];

var _w = 500;
var _h = display_get_gui_height();
var _x = draw_x + view_x;
var _y = view_y;

// Box
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

// Input box
var box_w = 350;
var box_h = 50;
var box_x = _x+_w/2 - box_w/2;
var box_y = _y+330;
draw_set_halign(fa_left);

draw_set_color(make_color_rgb(30, 30, 30));
draw_roundrect(box_x, box_y, box_x+box_w, box_y+box_h, false);

draw_set_color(c_white);
draw_text(box_x+10, box_y+box_h/2-8, input_string);

// Caret
if (input_active && caret_visible) {
    var text_w = string_width(input_string);
    var caret_x = box_x + 10 + text_w + 2;
    var caret_y1 = box_y + 8;
    var caret_y2 = box_y + box_h - 8;

    draw_line_width(caret_x, caret_y1, caret_x, caret_y2, 2);
}

draw_set_halign(fa_center);

// Buttons
var btn_w = 140;
var btn_h = 50;
var btn_gap = 20;
var by = _y + 420;

var ok_x = _x+_w/2 - btn_w - btn_gap/2;
var cancel_x = _x+_w/2 + btn_gap/2;

draw_set_color(hover_index == 0 ? make_color_rgb(20, 120, 255) : make_color_rgb(30, 30, 30));
draw_roundrect(ok_x, by, ok_x+btn_w, by+btn_h, false);
draw_set_color(c_white);
draw_text(ok_x+btn_w/2, by+btn_h/2-8, "Done");

draw_set_color(hover_index == 1 ? make_color_rgb(20, 120, 255) : make_color_rgb(30, 30, 30));
draw_roundrect(cancel_x, by, cancel_x+btn_w, by+btn_h, false);
draw_set_color(c_white);
draw_text(cancel_x+btn_w/2, by+btn_h/2-8, "Cancel Input");
