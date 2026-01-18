global.object_timer++;

try {
	

	randomize();
} catch(ex) {
	toast_create("FAILURE: An internal error has occured. Error data has been dumped to a debug file, it's recommended you file a bug report.", 3);
		
	if file_exists("error_rep.log") file_delete("error_rep.log");
	var _f = file_text_open_write("error_rep.log");
	file_text_write_string(_f, "Sunrise: Error Report\n \n" + ex.longMessage);
	file_text_close(_f);
	
	show_debug_message( "--------------------------------------------------------------");
	show_debug_message( "An error has occured:" );
    show_debug_message( string(ex.longMessage) );
    show_debug_message( "--------------------------------------------------------------");
}

exception_unhandled_handler(function(ex)
{
    show_debug_message( "--------------------------------------------------------------");
	show_debug_message( "A CRITICAL Error has occured, Sunrise will now close:" );
    show_debug_message( string(ex.longMessage) );
    show_debug_message( "--------------------------------------------------------------");

    if file_exists("crash.log") file_delete("crash.log");
    var _f = file_text_open_write("crash.log");
    file_text_write_string(_f, "Sunrise: CRITICAL Error Report" + "\n \n" + string(ex));
    file_text_close(_f);

    show_message("A serious error has occured and Sunrise needs to close. We apologise for the inconvience! You can view the crash log in \"crash.txt\".");
});