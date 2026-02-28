/// @description Script
	//Timers
	if(!disable_timer) global.stage_timer += 1000/60
	
	//Cap the stage timer
	global.stage_timer = min(global.stage_timer, 599999);
	
	//Hide collision layer
	layer_set_visible("CollisionObject", false);
	layer_set_visible(global.col_tile[0], false);
	layer_set_visible(global.col_tile[1], false);
	layer_set_visible(global.col_tile[2], false);
	layer_set_visible(global.col_tile[3], false);
	
	//Reset score combo when player lands
	if(obj_player.landed) combo_chain = 0;
	
	if(InputPressed(INPUT_VERB.PAUSE))
	{
		instance_create_depth(0, 0, 0, obj_pause);
	}