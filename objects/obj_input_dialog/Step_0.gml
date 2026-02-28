if (!visible) exit;

// Get view offsets
var cam = view_camera[0];
var view_x = camera_get_view_x(cam);
var view_y = camera_get_view_y(cam);

var _w = 500;
var _x = draw_x + view_x;
var _y = view_y;

// Sliding animation
switch (state) {
   case "opening":
		
		if bgfade != 0.5
			bgfade += 0.05;
			
        draw_x = lerp(draw_x, target_x, 0.2);
        if (abs(draw_x - target_x) < 1) {
            draw_x = target_x;
            state = "open";
        }
    
        if instance_exists(obj_cm_camera) {
				with obj_cm_camera {
					cancelout = true;	
				}	
			}
    break;

    case "closing":
		
		if bgfade != 0
			bgfade -= 0.05;
			
        draw_x = lerp(draw_x, -_w, 0.2);
        if (draw_x <= -_w+1) {
            draw_x = -_w;
            state = "idle";
			visible = false;
		}
        
        if instance_exists(obj_cm_camera) {
				with obj_cm_camera {
					cancelout = false;	
				}	
			}
    break;
}

// Handle keyboard input when open
if (state == "open" && input_active) {
	var key = keyboard_lastchar;
	caps_lock = false;

    // Backspace handling
    if (keyboard_check_pressed(vk_backspace)) {
        input_string = string_copy(input_string, 1, string_length(input_string) - 1);
    } else if (keyboard_check_pressed(vk_enter)) {
        global.input_result = input_string;
        state = "closing";
    }
	
    // Add character if valid
    else if (key != "") {
        var code = ord(key);
        if (code >= 32 && code <= 126 && string_length(input_string) < 20) {
            input_string += (caps_lock) ? string_upper(key) : key;
        }
    }

    keyboard_lastchar = ""; // Reset input to avoid spamming
}

// Handle OK/Cancel buttons
if (state == "open") {
    var btn_w = 140;
    var btn_h = 50;
    var btn_gap = 20;
    var by = _y + 420;

    var ok_x = _x+_w/2 - btn_w - btn_gap/2;
    var cancel_x = _x+_w/2 + btn_gap/2;

    var new_hover = -1;

    if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), ok_x, by, ok_x+btn_w, by+btn_h)) {
        
		new_hover = 0;
        if (new_hover != hover_index && snd_hover != -1) {
            audio_play_sound(snd_hover, 1, false);
        }
        if (mouse_check_button_pressed(mb_left)) {
            if (snd_select != -1) audio_play_sound(snd_select, 1, false);
			if message_text == "Please enter your GameJolt username."
				global.gamejoltlogin1 = true;
			
            global.input_result = input_string;
			global.input_finished = true;
            state = "closing";
        }
    } else {
		
	}

    if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cancel_x, by, cancel_x+btn_w, by+btn_h)) {
        
		new_hover = 1;
        if (new_hover != hover_index && snd_hover != -1) {
            audio_play_sound(snd_hover, 1, false);
        }
        if (mouse_check_button_pressed(mb_left)) {
            if (snd_select != -1) audio_play_sound(snd_select, 1, false);
            global.input_result = ""; // cancel clears result
			global.input_finished = false;
            state = "closing";
        }
    } else {
		
	}

    hover_index = new_hover;
}

// ESC cancels
if (state == "open" && keyboard_check_pressed(vk_escape)) {
    global.input_result = "";
	global.input_finished = true;
    state = "closing";
	
}

// Block background input
if (visible) {
    mouse_clear(mb_left);
    mouse_clear(mb_right);
    mouse_clear(mb_middle);
}

// Caret blinking
if (state == "open" && input_active) {
    caret_timer += 1;
    if (caret_timer > room_speed/2) { // blink every ~0.5 sec
        caret_timer = 0;
        caret_visible = !caret_visible;
    }
}

if (state == "open" && mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, box_x, box_y, box_x+box_w, box_y+box_h)) {
        input_active = true;
    } else {
        input_active = false;
    }
}