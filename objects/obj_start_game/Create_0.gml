// timer = 0;
show = false;

if !audio_is_playing(mus_titlescreen)
	audio_play_sound(mus_titlescreen, 0, false);
	
emit = audio_emitter_create();
gain = 0;
pitch = 0;

if date_get_month(date_current_datetime()) == 12 {
    layer_background_change(layer_background_get_id("Background"), bg_sunrise_bg_christmas);
} else if (date_get_month(date_current_datetime()) == 10 or date_get_month(date_current_datetime()) == 11) {
    layer_background_change(layer_background_get_id("Background"), bg_sunrise_bg_halloween);
}

if file_exists(GameJolt_File_LogIn) {
	GameJolt_User_LogIn_FromCache();
	GameJolt_User_FetchMe(
		function(_userData) {
			global.current_user = _userData.username;
			var _avatar_url = _userData.avatar_url;
							
			sprite = sprite_add(_avatar_url, 0, 0, 0, 0, 0);
									
			toast_dismiss();
			toast_create("SUCCESS: Logged into GameJolt as: " + global.current_user, 1);	
		}, function(message) {
			toast_dismiss();
			toast_create("NOTICE: Authorization with GameJolt succeeded, however we couldn't grab details, returned: " + string(message), 3);	
		}
	);
	global.online_user = true;
	GameJolt_Session_Open();
}