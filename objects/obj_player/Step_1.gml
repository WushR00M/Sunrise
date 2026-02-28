/// @description Pre-main player
	//Change character
	character = CHAR_DASH;
	
	//Flag reset
	ramp_fix = false;
	ceiling_allow = true;
	detach_allow = true;
	
	//Hitbox variables
	hitbox_top_offset = 0;
	hitbox_left_offset = 0;
	hitbox_bottom_offset = 0;
	hitbox_right_offset = 0;
	
	//Player input scripts
	player_get_input();
	
	//Hande player physics values
	player_handle_physics();
	
	//Handle invincibility and speed shoes
	player_inv_speed();