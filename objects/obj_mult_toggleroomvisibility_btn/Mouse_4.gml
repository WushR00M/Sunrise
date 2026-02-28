audio_play_sound(snd_select_yes, 0, false);

if index == 0 {
	steam_lobby_set_type(steam_lobby_type_friends_only);
	toast_dismiss();
	toast_create("Room type was set to \"Friends Only\".", 1);
	index = 1;
} else if index == 1 {
	steam_lobby_set_type(steam_lobby_type_public);
	toast_dismiss();
	toast_create("Room type was set to \"Public\".", 1);
	index = 2;
} else if index == 2 {
	steam_lobby_set_type(steam_lobby_type_private);
	toast_dismiss();
	toast_create("Room type was set to \"Private\".", 1);
	index = 0;
}