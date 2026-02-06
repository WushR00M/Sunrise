if !global.titleanim {
	if !steam_initialised() {
		if file_exists(GameJolt_File_LogIn) {
			log("GameJolt login from cache starting...");
			GameJolt_User_LogIn_FromCache();
			GameJolt_User_FetchMe(
				function(_userData) {
					global.current_user = _userData.username;
					var _avatar_url = _userData.avatar_url;
							
					sprite = sprite_add(_avatar_url, 0, 0, 0, 0, 0);
									
					toast_dismiss();
					toast_create("SUCCESS: Logged into GameJolt as: " + global.current_user, 1);	
					log("GameJolt login success.");
				}, function(message) {
					log("GameJolt login success, but we weren't able to get any user information; Reported back: " + string(message));
					toast_dismiss();
					toast_create("NOTICE: Authorization with GameJolt succeeded, however we couldn't grab details.");	
				}
			);
			global.online_user = true;
			GameJolt_Session_Open();
		}
	} else {
		global.current_user = steam_get_persona_name();
		global.online_user = true;
		toast_dismiss();
		toast_create("Logged into Steam as: " + global.current_user, 1);	
		log("Steam login success.");
	}
}

if date_get_month(date_current_datetime()) == 12 {
    layer_background_change(layer_background_get_id("Background"), bg_sunrise_bg_christmas);
} else if (date_get_month(date_current_datetime()) == 10 or date_get_month(date_current_datetime()) == 11) {
    layer_background_change(layer_background_get_id("Background"), bg_sunrise_bg_halloween);
}