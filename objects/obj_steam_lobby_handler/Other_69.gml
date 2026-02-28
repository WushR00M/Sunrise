var _type = async_load[? "type"];
if (_type == "lobby_chat_message") {
	var _user_id = async_load[? "user_id"];
	var _msg_id = async_load[? "message_index"];
	
	var _message = steam_lobby_get_chat_message_text(_msg_id);
	var _user_name = steam_get_user_persona_name_sync(_user_id);
	
	recent_msg = string_concat(_user_name, ": ", _message);
}