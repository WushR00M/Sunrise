var duration = 60;
var t;
switch (state) {
    case 0:
        bg_y2 = lerp(bg_y2, view_h, 0.15);
        text_x = lerp(text_x, target_x, 0.15);
        text_y = lerp(text_y, view_h * 0.5, 0.15);

        if (abs(text_x - target_x) < 4) {
            state = 1;
            timer = 0;
        }
    break;

    case 1:
        timer++;
        if (timer > tc_hold) {
            top_y = view_h / 2;
            bottom_y = view_h / 2;
            top_height = view_h / 2;
            bottom_height = view_h / 2;
            state = 2;
            timer = 0;
        }
    break;

    case 2:
        t = min(timer / duration, 1);
        var ease = ease_out_cubic(t);

        top_y = lerp(0, 0, ease);
        bottom_y = lerp(view_h / 2, view_h - final_bar_height, ease);

        top_height = lerp(view_h / 2, final_bar_height, ease);
        bottom_height = lerp(view_h / 2, final_bar_height, ease);

        text_y = lerp(text_y, top_y + top_height * 0.5, 0.15);

        timer++;
        if (t >= 1) {
            state = 3;
            timer = 0;
        }
    break;

    case 3:
        t = min(timer / duration, 1);
        var ease_exit = ease_out_cubic(t);

        top_y = lerp(0, -top_height - 200, ease_exit);
        bottom_y = lerp(view_h - final_bar_height, view_h + 200, ease_exit);

        text_y = lerp(text_y, top_y + top_height * 0.5, 0.15);

        timer++;
        if (t >= 1) instance_destroy();
    break;
}
