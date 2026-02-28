function scr_show_dialog(_msg, _icon, _buttons) {
	with (obj_dialog) {
	    message_text = argument0;
	    icon_sprite  = argument1;
	    buttons      = argument2;

	    hover_index  = -1;

	    var _w = 500;
	    target_x = 0;                     // snap target to 0 (left edge)
	    draw_x   = -_w;                   // start off-screen left
	    state    = "opening";
	    visible  = true;
	}
}

function scr_show_input_dialog(_msg, _icon) {
	with (obj_input_dialog) {
	    message_text = argument0;
	    icon_sprite  = argument1;

	    input_string = "";
	    input_active = true;
	    hover_index  = -1;

	    var _w = 500;
	    target_x = 0;
	    draw_x   = -_w;
	    state    = "opening";
	    visible  = true;

	    // Show virtual keyboard on Android
	    if (os_type == os_android) {
	        keyboard_virtual_show(kbv_type_default, kbv_returnkey_done, kbv_autocapitalize_none, false);
	    }
	}
}

function scr_show_instancelist(_buttons) {
	with (obj_instance_list) {
	    buttons      = argument0;

	    hover_index  = -1;

	    var _w = 500;
	    target_x = 0;                     // snap target to 0 (left edge)
	    draw_x   = -_w;                   // start off-screen left
	    state    = "opening";
	    visible  = true;
	}
}

function scr_show_quickmenu(_buttons) {
	with (obj_instance_list) {
	    buttons      = argument0;

	    hover_index  = -1;

	    var _w = 500;
	    target_x = 0;                     // snap target to 0 (left edge)
	    draw_x   = -_w;                   // start off-screen left
	    state    = "opening";
	    visible  = true;
	}
}