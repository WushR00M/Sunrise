/// @description Draw the player
	if(state = ST_KNOCKOUT || invincible_timer mod 12 >= 6 || invincible_timer = 0 || invincible)
	{
		if(speed_shoes)
		{
			for (var i = 0; i < 3; ++i) 
			{
				if((global.object_timer) mod 4 = i )
				{
					if(x_speed != 0 || y_speed != 0)
					{
						
					}
				}
			}
		}		
		//Draw the player:
		draw_animator(animator, floor(x), floor(y) - 32, image_xscale, 1, image_angle, c_white, 1);
	}