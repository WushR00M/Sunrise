ready = false;
global.discord_active = false;

alarm[0] = room_speed * 5;

if (!np_initdiscord("1285814729398554634", true, np_steam_app_id_empty))
{
	toast_create("FAILURE: An internal error has occured. Error data has been dumped to a debug file, it's recommended you file a bug report.", 3);
		
	if file_exists("error_rep.log") file_delete("error_rep.log");
	var _f = file_text_open_write("error_rep.log");
	file_text_write_string(_f, "Sunrise: Error Report\n \n" + "Discord Rich Presence crashed or didn't work!");
	file_text_close(_f);
	
	show_debug_message( "--------------------------------------------------------------");
	show_debug_message( "An error has occured:" );
    show_debug_message( "Unable to initialize Discord Rich Presence" );
    show_debug_message( "--------------------------------------------------------------");
}

state = "";
details = "";