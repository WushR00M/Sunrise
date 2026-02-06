global.object_timer++;

try {
	steam_update();
	
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
		volume_slider_y2 = lerp(volume_slider_y2, view_hport[0] + 64, 0.1);
	}
	
	if global.op_mouseconfine == true
		window_mouse_set(clamp(window_mouse_get_x(), 0, window_get_width()), clamp(window_mouse_get_y(), 0, window_get_height()));	
	
	if !global.mobile {
		if !window_get_fullscreen() && global.op_halfsize {
			window_set_size(1366 / 2, 768 / 2);
		
		} else if !window_get_fullscreen() && !global.op_halfsize {
			window_set_size(1366, 768);
		
		}
	}
	
	if os_type == os_windows {
		if window_command_check(window_command_close) {
			var btns = [
				{label:"Let me out already!", action: dummyscript()},
				{label:"Actually, nevermind!",  action: dummyscript()},
			];
			
			scr_show_dialog("Are you sure you want to exit Sunrise?\nSave your unsaved work if there is any!", spr_dialog_warning, btns);
		}
	}
	
	if (fps) < 30 && (fps > 5) {
		if fpswarn == false {
			log("PERFORMANCE WARNING: FPS is dangerously low! Low-end PC or memory leak? (reported: " + string(fps) + " FPS)");
			fpswarn = true;
		}
	} else if (fps) > 30 {
		fpswarn = false;	
	}	
	randomize();
} catch(ex) {
	toast_create("FAILURE: An internal error has occured. Error data has been dumped to a debug file, it's recommended you file a bug report.", 3);
		
	if file_exists("error_rep.log") file_delete("error_rep.log");
	var _f = file_text_open_write("error_rep.log");
	file_text_write_string(_f, "Sunrise: Error Report\n \n" + ex.longMessage);
	file_text_close(_f);
	
	log( "--------------------------------------------------------------");
	log( "An error has occured:" );
    log( string(ex.longMessage) );
    log( "--------------------------------------------------------------");
}

exception_unhandled_handler(function(ex)
{
    log( "--------------------------------------------------------------");
	log( "A CRITICAL Error has occured, Sunrise will now close:" );
    log( string(ex.longMessage) );
    log( "--------------------------------------------------------------");

    if file_exists("crash.log") file_delete("crash.log");
    var _f = file_text_open_write("crash.log");
    file_text_write_string(_f, "Sunrise: CRITICAL Error Report" + "\n \n" + string(ex));
    file_text_close(_f);

    show_message("A serious error has occured and Sunrise needs to close. We apologise for the inconvience!");
});