if instance_number(obj_steam_lobby_handler) == 2 {
	instance_destroy();
} else {
	instance_create_depth(0, 0, -1, obj_steam_lobby_handler);
	instance_destroy();
}