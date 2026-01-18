
	var screen_w = display_get_gui_width();
	var toolbar_h = button_height;

	// Draw full black background across top
	draw_set_color(c_black);
	draw_rectangle(0, 0, screen_w, toolbar_h, false); // filled background

	draw_set_font(Font7);

	// Center-aligned text
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	// Draw buttons
	for (var i = 0; i < array_length(buttons); i++) {
	    var bx = i * button_width;
	    var by = 0;

	    // Button background
	    draw_set_color(button_color);
	    draw_rectangle(bx, by, bx + button_width, by + toolbar_h, false);

	    // Hover highlight
	    if (mouse_over_button == i) {
	        draw_set_alpha(0.3);
	        draw_set_color(hover_color);
	        draw_rectangle(bx, by, bx + button_width, by + toolbar_h, false);
	        draw_set_alpha(1);
	    }

	    // Draw label centered
	    draw_set_color(c_white);
	    var label_text = buttons[i].name;
	    draw_text(bx + button_width / 2, by + toolbar_h / 2, label_text);
	}

	// Draw dropdown menu
	if (active_button >= 0 && active_button < array_length(buttons)) {
	    var bx = active_button * button_width;
	    var by = toolbar_h;
	    var item_h = button_height;

	    draw_set_color(dropdown_color);
	    draw_rectangle(bx, by, bx + button_width, by + dropdown_height, false);

	    // Optional border for dropdown
	    draw_set_color(c_black);
	    draw_rectangle(bx, by, bx + button_width - 1, by + dropdown_height - 1, true);

	    var max_items = array_length(buttons[active_button].items);
	    var visible_items = floor(dropdown_height / item_h);

	    for (var j = 0; j < visible_items && j < max_items; j++) {
	        var item_y = by + j * item_h;

			if global.inputtype {
		        if (mouse_over_item == j) {
		            draw_set_alpha(0.4);
		            draw_set_color(c_navy);
		            draw_rectangle(bx, item_y, bx + button_width, item_y + item_h, false);
		            draw_set_alpha(1);
		        }
			} else {
				if (controller_item_index == j) {
		            draw_set_alpha(0.4);
		            draw_set_color(c_navy);
		            draw_rectangle(bx, item_y, bx + button_width, item_y + item_h, false);
		            draw_set_alpha(1);
		        }
			}

	        draw_set_color(c_white);
	        var item_text = buttons[active_button].items[j];
	        draw_text(bx + button_width / 2, item_y + item_h / 2, item_text);
	    }
	}

	draw_set_color(c_dkgray);
	draw_set_halign(fa_right);
	draw_text(1344, 16, "Editor v2026.4.0 (ALPHA): it's subject to change!");

	// Reset alignment
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	// Toolbar border line at bottom of toolbar
	draw_set_color(make_color_rgb(35, 35, 35)); // or c_gray for softer line
	draw_line(0, toolbar_h, screen_w, toolbar_h);