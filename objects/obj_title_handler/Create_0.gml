if !global.titleanim {
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
}