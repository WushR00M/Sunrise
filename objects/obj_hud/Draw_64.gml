/// @description Draw the HUD

	//Don't render the hud
	if(!render)
	{
		exit;	
	}
	
	//Temp value
	var minute, sec, milsec, c, cx, cy;
	
	//Screen values
	c = view_camera[view_current]
	cx = camera_get_view_x(c)
	cy = camera_get_view_y(c)
	
	//Time
	milsec = floor(global.stage_timer/10) mod 100;
	sec = floor(global.stage_timer/1000) mod 60;
	minute = floor(global.stage_timer/60000);
	
	//Draw whole ass water
	if(!surface_exists(surf)) surf = surface_create(camera_get_view_width(0), camera_get_view_height(0));
		
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	
	//Draw normal text
	draw_sprite(spr_hudtext, 0, 16 + offset[0], 8);
	draw_sprite(spr_hudtext, 1, 16 + offset[1], 24);
	draw_sprite(spr_hudtext, 2, 16 + offset[2], 40);
	
	//Red flashing text
	if(global.bits == 0 && global.object_timer mod 20 < 20/2) draw_sprite(spr_hudtext, 4, 16 + offset[2], 40);
	if(global.stage_timer >= 540000 && global.object_timer mod 20 < 20/2) draw_sprite(spr_hudtext, 3, 16 + offset[1], 24);
	
	//Set font numbers
	draw_set_font(global.hud_number);
	draw_set_halign(fa_right);
	
	//Draw number
	draw_text(120 + offset[0], 9, string(global.score));
	draw_text(120 + offset[1], 25, string(minute)+" "+(sec > 9 ? "" : "0") + string(sec)+" "+(milsec > 9 ? "" : "0") + string(milsec));
	draw_text(96 + offset[2], 41, string(global.bits));
	
	surface_reset_target();
	
	draw_surface(surf, cx, cy);
	
