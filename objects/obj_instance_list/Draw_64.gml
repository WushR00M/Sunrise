draw_set_font(Font7);

// === BACKGROUND ===
draw_set_color(c_black);
draw_set_alpha(1);
draw_roundrect(box_x, box_y, box_x + box_w, box_y + box_h_actual, false);
draw_set_alpha(1);

// === DRAW TOP BUTTON BAR ===
var bx = box_x + padding;
var by = box_y + padding;
var bh = btn_h;

// LEFT BUTTONS
for (var i = 0; i < array_length(btn_labels); i++)
{
    var x1 = bx + (btn_w + btn_padding) * i;
    var y1 = by;

    // Hover detection
    var hovered = (mx > x1 && mx < x1 + btn_w && my > y1 && my < y1 + bh);

    // Button background
    draw_set_color(hovered ? make_color_rgb(20, 120, 255) : make_color_rgb(30, 30, 30));
    draw_roundrect(x1, y1, x1 + btn_w, y1 + bh, false);

    // Label
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
    draw_set_color(c_white);
    draw_text(x1 + (btn_w / 2), y1 + (btn_h / 2), btn_labels[i]);

    // Debug checkmark
    if (btn_labels[i] == "Debug" && debug_enabled)
        draw_text(x1 + btn_w - 16, y1 + 6, "ON");
}


// EXIT BUTTON
var exit_x1 = box_w - padding - btn_exit_w;
var exit_hover =
    (mx > exit_x1 && mx < exit_x1 + btn_exit_w &&
     my > by       && my < by + bh);

draw_set_color(exit_hover ? make_color_rgb(255, 20, 20) : make_color_rgb(30, 30, 30));
draw_roundrect(exit_x1, by, exit_x1 + btn_exit_w, by + bh, false);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(exit_x1 + (btn_w / 2), by + (btn_h / 2), btn_exit_label);

// === ICON GRID ===
var total_icons = array_length(icons);
var rows = ceil(total_icons / icons_per_row);

var usable_w = box_w - padding * 2;
var cell_w = usable_w / icons_per_row;

var grid_top = by + bh + padding * 2 + 24;

for (var i = 0; i < total_icons; i++)
{
    var row = i div icons_per_row;
    var col = i mod icons_per_row;

    var cx = padding + col * cell_w + cell_w / 2;
    var cy = grid_top + row * (icon_size + icon_spacing_y);

    var ix = cx - icon_size/2;
    var iy = cy - icon_size/2;

    // === ICON SPRITE ===
    draw_set_color(c_white);
    draw_sprite(icons[i].spr, 0, ix, iy);

    // === LABEL ===
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
    draw_text(cx, iy + icon_size + icon_text_gap, icons[i].label);
}
