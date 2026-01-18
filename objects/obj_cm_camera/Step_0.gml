
	if cancelout == false {
		if (mouse_check_button(mb_middle)) {
		    var dx = mouse_x - mouse_x_prev;
		    var dy = mouse_y - mouse_y_prev;

		    cam_x_target -= dx / zoom; 
		    cam_y_target -= dy / zoom;
	
			if cam_x_target < 0
				cam_x_target = 0;
			else if cam_x_target > (room_width - window_get_width())
				cam_x_target = (room_width - window_get_width());
		
			if cam_y_target < 0
				cam_y_target = 0;
			else if cam_y_target > (room_height - window_get_height())
				cam_y_target = (room_height - window_get_height());
		}

    
	       	// controller panning
	       	if (InputCheck(INPUT_VERB.RJOY_LEFT))  cam_x_target -= 8 / zoom;
	       	if (InputCheck(INPUT_VERB.RJOY_RIGHT)) cam_x_target += 8 / zoom;
	       	if (InputCheck(INPUT_VERB.RJOY_UP))    cam_y_target -= 8 / zoom; 
	        if (InputCheck(INPUT_VERB.RJOY_DOWN))  cam_y_target += 8 / zoom;
    
	    if cam_x_target < 0
				cam_x_target = 0;
			else if cam_x_target > (room_width - window_get_width())
				cam_x_target = (room_width - window_get_width());
		
			if cam_y_target < 0
				cam_y_target = 0;
			else if cam_y_target > (room_height - window_get_height())
				cam_y_target = (room_height - window_get_height());

		var wheel = mouse_wheel_up() - mouse_wheel_down();

		if (wheel != 0) {
		    var old_zoom = zoom_target;

		    zoom_target *= power(zoom_factor, wheel);
		    zoom_target = clamp(zoom_target, zoom_min, zoom_max);

		    // compute ratios BEFORE zoom changes cam_w & cam_h
		    var cam_w = camera_get_view_width(camera);
		    var cam_h = camera_get_view_height(camera);

		    var mx_ratio = (mouse_x - cam_x) / cam_w;
		    var my_ratio = (mouse_y - cam_y) / cam_h;

		    // how much the view size will change
		    var zoom_mult = zoom_target / old_zoom;

		    // shift camera so mouse stays anchored
		    cam_x_target += cam_w * (zoom_mult - 1) * mx_ratio;
		    cam_y_target += cam_h * (zoom_mult - 1) * my_ratio;
		}

		cam_x = lerp(cam_x, cam_x_target, pan_speed);
		cam_y = lerp(cam_y, cam_y_target, pan_speed);

		zoom = lerp(zoom, zoom_target, zoom_speed);

		var win_w = window_get_width();
		var win_h = window_get_height();

		var view_w = win_w / zoom;
		var view_h = win_h / zoom;

		camera_set_view_size(camera, view_w, view_h);
		camera_set_view_pos(camera, cam_x, cam_y);

		mouse_x_prev = mouse_x;
		mouse_y_prev = mouse_y;
	} else if cancelout == true {
		cam_x = lerp(cam_x, 0, pan_speed);
		cam_y = lerp(cam_y, 0, pan_speed);

		zoom = lerp(zoom, 1, zoom_speed);
	
		var win_w = window_get_width();
		var win_h = window_get_height();

		var view_w = win_w / zoom;
		var view_h = win_h / zoom;
	
		camera_set_view_size(camera, view_w, view_h);
		camera_set_view_pos(camera, cam_x, cam_y);
	}