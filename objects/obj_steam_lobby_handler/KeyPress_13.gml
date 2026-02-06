if chat_menu == true {
	chat_menu = false;
	if chat_message != "" {
		audio_play_sound(snd_tab_change);
		steam_lobby_send_chat_message(string(chat_message));
	}
}