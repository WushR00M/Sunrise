var _len = steam_lobby_get_member_count();
for (var i = 0; i < _len; i++) {
	var _id = steam_lobby_get_member_id(i);
	var _name = steam_get_user_persona_name(_id);
	members[i][0] = _id;
	members[i][1] = _name;
}

if chat_menu == true {
	if obj_init.volume_slider_show {
		chat_y = lerp(chat_y, view_hport[0] - 48, 0.1);	
	} else {
		chat_y = lerp(chat_y, view_hport[0] - 32, 0.1);	
	}
	
	var key = keyboard_lastchar;
	caps_lock = false;

    if (keyboard_check_pressed(vk_backspace)) {
        chat_message = string_copy(chat_message, 1, string_length(chat_message) - 1);
    } else if (key != "") {
        var code = ord(key);
        if (code >= 32 && code <= 126 && string_length(chat_message) < 20) {
            chat_message += (caps_lock) ? string_upper(key) : key;
        }
    }

    keyboard_lastchar = "";
} else {
	chat_y = lerp(chat_y, view_hport[0] + 64, 0.1);	
}