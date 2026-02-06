members = array_create(4);
yy = view_yport[0] + 32;

chat_menu = false;
chat_message = "";

chat_y = view_hport[0] + 64;

is_owner = steam_lobby_is_owner();
recent_msg = "";