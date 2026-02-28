
	// === SLIDE ANIMATION ===
	var target = is_open ? 1 : 0;
	slide = lerp(slide, target, slide_speed);
	
	if is_open == false && box_y == box_y_hidden {
		instance_destroy();	
	}

	// === CAMERA DIMENSIONS ===
	cam_w = camera_get_view_width(0);
	cam_h = camera_get_view_height(0);

	// === DIALOG BOX RECT ===
	box_h = cam_h * box_h_frac;
	box_y_hidden  = cam_h;
	box_y_visible = cam_h - box_h;

	box_x = 0;
	box_y = lerp(box_y_hidden, box_y_visible, slide);
	box_w = cam_w;
	box_h_actual = box_h;

	// === MOUSE POS (GUI SPACE) ===
	mx = device_mouse_x_to_gui(0);
	my = device_mouse_y_to_gui(0);

	// === TRACK HOVERED ICON ===
	hover_index = -1;

	// === BUTTON BAR RECT ===
	var bx = box_x + padding;
	var by = box_y + padding;
	var bh = btn_h;

	// === HANDLE BUTTON CLICKS ===
	if (mouse_check_button_pressed(mb_left))
	{
	    // Left side buttons
	    for (var i = 0; i < array_length(btn_labels); i++)
	    {
	        var x1 = bx + (btn_w + btn_padding) * i;
	        var y1 = by;

	        if (mx > x1 && mx < x1 + btn_w && my > y1 && my < y1 + bh)
	        {
	            if (btn_labels[i] == "Debug")
	                debug_enabled = !debug_enabled;
					
	            audio_play_sound(snd_select_yes, 0, false);
				
				is_open = false;
	        }
	    }

	    // Exit button (right aligned)
	    var exit_x1 = box_w - padding - btn_exit_w;

	    if (mx > exit_x1 && mx < exit_x1 + btn_exit_w && my > by && my < by + bh)
	    {
	        is_open = false;
	        audio_play_sound(snd_select_yes, 0, false);
	    }
	}

	// === ICON GRID ===
	var total_icons = array_length(icons);
	var rows        = ceil(total_icons / icons_per_row);

	var usable_w = box_w - padding * 2;
	var cell_w   = usable_w / icons_per_row;

	var grid_top = by + bh + padding * 2 + 24;

	// Detect hover + clicks
	for (var i = 0; i < total_icons; i++)
	{
	    var row = i div icons_per_row;
	    var col = i mod icons_per_row;

	    var cx = padding + col * cell_w + cell_w / 2;
	    var cy = grid_top + row * (icon_size + icon_spacing_y);

	    var ix = cx - icon_size/2;
	    var iy = cy - icon_size/2;

	    // Hover detection
	    if (mx > ix && mx < ix + icon_size && my > iy && my < iy + icon_size)
	        hover_index = i;

	    // Click detection
	    if (mouse_check_button_pressed(mb_left))
	    {
	        if (mx > ix && mx < ix + icon_size && my > iy && my < iy + icon_size)
	        {
	            selected_index = i;
	            audio_play_sound(snd_select_yes, 0, false);
				
				if selected_index == 0
					global.cmselection = 2;
				else if selected_index == 1
					global.cmselection = 4;
				else if selected_index == 2
					global.cmselection = 5;
				else if selected_index == 3
					global.cmselection = 6;
				else if selected_index == 4
					global.cmselection = 7;
				else if selected_index == 5
					global.cmselection = 1;
				else if selected_index == 6
					global.cmselection = 8;
				
				is_open = false;  // auto-close
	            break;
	        }
	    }
	}
	
	mouse_clear(mb_left);
	mouse_clear(mb_right);
	mouse_clear(mb_middle);
	mouse_clear(mouse_wheel_up());
	mouse_clear(mouse_wheel_down());