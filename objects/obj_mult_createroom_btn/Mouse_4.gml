audio_play_sound(snd_select_yes, 0, false);
if !steam_initialised() {
	toast_create("This feature is coming soon, stand by!", 1);
	if !instance_exists(obj_fadeout_routine) {
		if !clicked {
			clicked = true;
		}
	}
} else {
	steam_lobby_create(steam_lobby_type_private, 4);
	instance_create_depth(0, 0, -1, obj_steam_lobby_handler);
	toast_dismiss();
	toast_create("You've created a new room!");
	room_goto(rm_mult_lobby);
}