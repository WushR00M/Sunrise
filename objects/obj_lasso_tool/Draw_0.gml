if (lasso_active) {
    var l = min(start_x, end_x);
    var r = max(start_x, end_x) + GRID;
    var t = min(start_y, end_y);
    var b = max(start_y, end_y) + GRID;

    draw_set_color(c_aqua);
	draw_set_alpha(0.5);
    draw_rectangle(l, t, r, b, false);
}
