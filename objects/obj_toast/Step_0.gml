start_y = camera_get_view_height(0) + 100;
target_y = camera_get_view_height(0) - 100;
x = view_wport[0] * 0.5;

// Slide in
if (state == "slide_in") {
    y = lerp(y, target_y, slide_speed);
    if (abs(y - target_y) < 1) {
        y = target_y;
        state = "showing";
    }
}
// Wait
else if (state == "showing") {
    timer++;
	y = lerp(y, target_y, slide_speed);
    if (timer >= duration) {
        state = "slide_out";
    }
}
// Slide out
else if (state == "slide_out") {
    y = lerp(y, start_y, slide_speed);
    if (y >= start_y - 1) {
        instance_destroy();
    }
}

width = string_width(text) + padding;