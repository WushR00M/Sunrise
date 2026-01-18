try {
	if global.cmmode == 1 {
		if global.cmplay == false && InputPressed(INPUT_VERB.ACTION) {
			global.cmselection = 0;
			if !instance_exists(obj_instance_list)
				instance_create_layer(0, 0, "UI", obj_instance_list);
		}
	} else if global.cmmode == 2 {
		
	} else if global.cmmode == 3 {
			
	}
	
	if device_mouse_y_to_gui(0) <= 32
		global.cmselection = 0;
		if instance_exists(obj_lasso_tool)
			instance_destroy(obj_lasso_tool);
	if keyboard_check_pressed(ord("1")) {
		global.cmmode = 1;
	} else if keyboard_check_pressed(ord("2")) {
		global.cmmode = 2;
		if !instance_exists(obj_lasso_tool)
			instance_create_layer(mouse_x, mouse_y, "UI", obj_lasso_tool);
	} else if keyboard_check_pressed(ord("3")) {
		global.cmmode = 3;
		if instance_exists(obj_lasso_tool)
			instance_destroy(obj_lasso_tool);
	}
	
} catch(ex) {
	if global.op_errorep
		toast_create("FAILURE: An internal error has occured and has been reported to WushR00M Studios.", 4);
	else
		toast_create("FAILURE: An internal error has occured. Error data has been dumped to a debug file.", 4);
		
	if file_exists("error_rep.log") file_delete("error_rep.log");
	var _f = file_text_open_write("error_rep.log");
	file_text_write_string(_f, "Sunrise: Error Report\n \n" + ex.longMessage);
	file_text_close(_f);
	
	show_debug_message( "--------------------------------------------------------------");
	show_debug_message( "An error has occured:" );
    show_debug_message( string(ex.longMessage) );
    show_debug_message( "--------------------------------------------------------------");
}