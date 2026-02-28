if variable_global_exists("gamerestart") {
	if global.gamerestart == true {
		global.gamerestart = false;	
	} else {
		steam_shutdown();	
	}
}