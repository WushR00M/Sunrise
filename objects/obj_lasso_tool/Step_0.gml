var mouse_down = mouse_check_button(mb_left);

if (mouse_down && !mouse_was_down) {
    lasso_active = true;

    start_x = floor(mouse_x / GRID) * GRID;
    start_y = floor(mouse_y / GRID) * GRID;

    end_x = start_x;
    end_y = start_y;
}

if (mouse_down && lasso_active) {
    end_x = floor(mouse_x / GRID) * GRID;
    end_y = floor(mouse_y / GRID) * GRID;
}

if (!mouse_down && mouse_was_down && lasso_active) {
    lasso_active = false;

    var left   = min(start_x, end_x);
    var right  = max(start_x, end_x) + GRID;
    var top    = min(start_y, end_y);
    var bottom = max(start_y, end_y) + GRID;

    selected_instances = lasso_get_instances(left, top, right, bottom);
    if (array_length(selected_instances) > 0) {
		if keyboard_check_pressed(vk_delete)
			lasso_delete_instances(selected_instances);
    } else {
		if keyboard_check_pressed(vk_insert)
			lasso_fill_autoterrain(left, top, right, bottom);
    }
}

mouse_was_down = mouse_down;
