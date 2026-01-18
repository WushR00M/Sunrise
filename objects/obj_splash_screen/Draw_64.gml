		for (var i = 0; i < 3; ++i) 
	{
		if(!surface_exists(logo_surface[i]))
		{
			logo_surface[i] = surface_create(window_get_width(), window_get_height());
		}
	}
	
	surface_set_target(logo_surface[0]);
	
	draw_clear_alpha(c_white, 0);
	
	draw_sprite_ext(spr_wrstudios_logo, 0, room_width / 2, room_height / 2, scale_x, scale_y, 0, c_white, 1);
	
	surface_reset_target();
	
	
	surface_set_target(logo_surface[1]);
	
	surface_deform(window_get_width(), window_get_height(), distortion_y, global.object_timer * 3, 1);
	surface_copy(logo_surface[1], 0, 0, logo_surface[0]);
	shader_reset();
	
	surface_reset_target();
	
	surface_set_target(logo_surface[2]);
	
	surface_deform(window_get_width(), window_get_height(), distortion_x, global.object_timer);
	surface_copy(logo_surface[2], 0, 0, logo_surface[1]);
	shader_reset();
	
	surface_reset_target();
	
	alpha_dither(dither_timer);
	draw_surface(logo_surface[2], 0, 0);
	shader_reset();