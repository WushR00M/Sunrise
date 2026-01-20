global.object_timer++;

try {
	if volume_slider_show {
		if volume_slider_time > 0 {
			volume_slider_y = lerp(volume_slider_y, view_hport[0] - 24, 0.1);
			volume_slider_y2 = lerp(volume_slider_y2, view_hport[0] - 16, 0.1);
			volume_slider_time--;
		} else {
			volume_slider_show = false;
			volume_slider_time = 5*60;
		}
	} else {
		volume_slider_y = lerp(volume_slider_y, view_hport[0] + 64, 0.1);
		volume_slider_y2 = lerp(volume_slider_y2, view_hport[0] + 16, 0.1);
	}
	
	if global.op_mouseconfine == true
		window_mouse_set(clamp(window_mouse_get_x(), 0, window_get_width()), clamp(window_mouse_get_y(), 0, window_get_height()));	
	
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