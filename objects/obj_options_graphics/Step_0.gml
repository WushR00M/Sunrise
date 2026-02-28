
// good lord this options code is so fucking messy i cannot wait to clean this up

var content_height = 0;
for (var i = 0; i < array_length(options); i++) {
    if (options[i].type == "header") {
        content_height += header_height;
    } else {
        content_height += line_height;
    }
}

hovered_item = -1;
description_text = "";
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var pos_y = menu_top - scroll_y;  // renamed from y
hovered_item = -1;
description_text = "Manage Sunrise's various Settings here!";

for (var i = 0; i < array_length(options); i++) {
    var item = options[i];
    var rect = item_rects[i];
	
	if !InputPlayerUsingGamepad(0) {
	    // Check mouse hover over item rectangle
	    if (my > rect.y && my < rect.y + rect.h && mx > rect.x && mx < rect.x + rect.w) {
			window_set_cursor(cr_handpoint);
	        hovered_item = i;
			if item.name == "Fullscreen Mode"
				description_text = "Enables or disables Windowed Mode";
			else if item.name == "Borderless Fullscreen"
				description_text = "Resizes the window to fit the screen size instead of switching display modes";
			else if item.name == "Letterbox Mode"
				description_text = "When enabled, instead of stretching the game window to your screen size, will add bars to the sides of the game screen";
			else if item.name == "x0.5 Windowed Scale"
				description_text = "Halves the window's size to fit on smaller displays, like laptop screens. This does not apply in fullscreen mode."
			else if item.name == "Shaders"
				description_text = "Visual effects found within levels or various sections of the game, disable for a performance boost";
			else if item.name == "Colorblind Icons"
				description_text = "Replaces specific assets with versions with symbols overlayed for the visually impaired";
			else if item.name == "Title Screen Snow"
				description_text = "When enabled, in the months of December or Janurary, snow is present on the background of the Title Screen.";
			else if item.name == "Menu Parallax Effects"
				description_text = "Moving the cursor around also very slightly pans the UI around with it when enabled.";
			else if item.name == "Seasonal Title Screen Colors"
				description_text = "On certain days or months, the color of the Title Screen background will change whenever enabled.";
			else if item.name == "Web-Friendly Screenshot Format (JPEG)"
				description_text = "Replaces the PNG lossless format screenshots are taken in with a web-friendly JPEG format instead";
			else if item.name == "Show FPS"
				description_text = "Self-explanatory.";
			else
				description_text = "Manage Sunrise's various Settings here!";
			
	        break;
		} else {
			window_set_cursor(cr_default);	
		}
    }
    pos_y += (item.type == "header") ? header_height : line_height;
}

// --- Gamepad Navigation ---
if global.inputtype == false {
    if (gamepad_cooldown > 0) gamepad_cooldown--;

    // Navigate Up
    if ((InputPressed(INPUT_VERB.UP) or InputPressed(INPUT_VERB.JOY_UP)) && gamepad_cooldown <= 0) {
		audio_play_sound(snd_highlight, 0, false);
        repeat (1) {
            selected_index = (selected_index - 1 + array_length(options)) mod array_length(options);
            if (options[selected_index].type != "header") break;
        }
        gamepad_cooldown = 6;
    }

    // Navigate Down
    if ((InputPressed(INPUT_VERB.JOY_DOWN) or InputPressed(INPUT_VERB.DOWN)) && gamepad_cooldown <= 0) {
		audio_play_sound(snd_highlight, 0, false);
        repeat (1) {
            selected_index = (selected_index + 1) mod array_length(options);
            if (options[selected_index].type != "header") break;
        }
        gamepad_cooldown = 6;
    }

    // Select with Face Button (A)
    if (InputPressed(INPUT_VERB.ACCEPT)) {
        audio_play_sound(snd_select_yes, 0, false);
	    var item = options[selected_index];

	    if (item.type == "toggle") {
	        item.value = !item.value;
	        save_options();
			
			if (item.name == "Web-Friendly Screenshot Format (JPEG)") {
				global.op_jpegscreenie = !global.op_jpegscreenie;
				save_options();
			} else if (item.name == "x0.5 Windowed Size") {
				global.op_halfsize = !global.op_halfsize;
				save_options();
			}
			
	    } else if (item.type == "slider") {
	        dragging_slider = hovered_item;
	    } else if (item.type == "dropdown") {
	        // Toggle dropdown open/close
	        for (var k = 0; k < array_length(options); k++) {
	            if (options[k].type == "dropdown") {
	                options[k].open = (k == hovered_item) ? !options[k].open : false;
	            }
	        }
	    } else if (item.type == "button") {
	        if (item.name == global.btn_credits) {
	            instance_create_depth(0, 0, -1, obj_fadein_routine);
	        } else if (item.name == "Edit Controls") {
				instance_create_depth(0, 0, -1, obj_fadein_routine_controllersettings);
			}
	    }
    }

	// i think we can optimize this by removing the duplicate and instead just sharing the other list above this one
    // Sync hovered_item with gamepad
    hovered_item = selected_index;
    if (hovered_item >= 0 && hovered_item < array_length(options)) {
        var item = options[hovered_item];
			if item.name == global.opt_photosen
				description_text = "Disables or smoothes most flashing lights";
			else if item.name == global.opt_fullscreen
				description_text = "Enables or disables Windowed Mode";
			else if item.name == global.opt_borderless
				description_text = "Allows for fullscreen without needing to re-render anything";
			else if item.name == global.opt_voice
				description_text = "Enables or disables Online Voice Chat";
			else if item.name == global.btn_credits
				description_text = "See who made this amazing game!";
			else if item.name == "In-Game Cursor Skin"
				description_text = "Changes the cursor to a custom in-game skin instead of the default system cursor"
			else if item.name == global.opt_videopb
				description_text = "Video playback lags and freezes the client on low-end hardware, disable this to avoid that";
			else if item.name == global.opt_showfps
				description_text = "Displays a small number in the bottom right with the game's FPS"
			else if item.name == global.opt_colorblind
				description_text = "Enables or disables icons to overlay colors for those visually impaired";
			else if item.name == global.opt_discordrp
				description_text = "Enables the rich presence display on your Discord profile if Discord is detected open on your desktop";
			else if item.name == global.opt_autosave
				description_text = "Tick this off to disable autosaving story progress and create mode levels, but beware in the case of an unexpected shutdown!";
			else if item.name == global.btn_clearsave
				description_text = "Resets all offline game data and starts from the inital setup";
			else if item.name == global.opt_telemetry
				description_text = "Sends data about the specifications of your device for the sake of compatibility and optimization, no private data is collected!";
			else if item.name == global.opt_errorrep
				description_text = "Tick this off to disable sending error report data to WushR00M Studios";
			else if item.name == global.btn_language
				description_text = "Sets the game's language, translations may not be 100% complete!"
			else if item.name == "Edit Controls"
				description_text = "Edit controls for in-game + controller settings, including haptics, button mappings, and PS4/5 light bar colors"
			else
				description_text = "Manage Sunrise's various Settings here!";
    }
}

// this mouse scrolling code doesn't even work
if (mouse_wheel_up()) {
    scroll_target -= 36;
}
if (mouse_wheel_down()) {
    scroll_target += 36;
}
scroll_target = clamp(scroll_target, 0, max_scroll);
scroll_y = lerp(scroll_y, scroll_target, 0.25);

for (var j = 0; j < array_length(options); j++) {
    if (options[j].name == "Fullscreen Mode") {
        var camShake = options[j];
        if window_get_fullscreen() == true {
	        camShake.value = true;
	        options[j] = camShake;
		} else {
			camShake.value = false;
	        options[j] = camShake;
		}
    }
}

// Handle mouse click on option items
	if (mouse_check_button_pressed(mb_left) && hovered_item != -1) {
		audio_play_sound(snd_select_yes, 0, false);
	    var item = options[hovered_item];

	    if (item.type == "toggle") {
	        item.value = !item.value;
	        save_options();
			
			if (item.name == "Web-Friendly Screenshot Format (JPEG)") {
				global.op_jpegscreenie = !global.op_jpegscreenie;
				save_options();
			} else if (item.name == "x0.5 Windowed Size") {
				global.op_halfsize = !global.op_halfsize;
				save_options();
			}
			
			
			if (item.name == global.opt_fullscreen && item.value) {
				window_set_fullscreen(true);
				save_options();
			} else if (item.name == global.opt_fullscreen && !item.value) {
				window_set_fullscreen(false);
				save_options();
			}
			
			if (item.name == global.opt_borderless && item.value) {
				window_enable_borderless_fullscreen(true);
				save_options();
			} else if (item.name == global.opt_borderless && !item.value) {
				window_enable_borderless_fullscreen(false);
				save_options();
			}
			
			if (item.name == "Show FPS") {
				if global.op_showfps == 0
					global.op_showfps = 1;
				else
					global.op_showfps = 0;
			}
			
			rescan_options();
	    } else if (item.type == "slider") {
	        dragging_slider = hovered_item;
	    } else if (item.type == "dropdown") {
	        // Toggle dropdown open/close
	        for (var k = 0; k < array_length(options); k++) {
	            if (options[k].type == "dropdown") {
	                options[k].open = (k == hovered_item) ? !options[k].open : false;
	            }
	        }
	    } else if (item.type == "button") {
	        if (item.name == global.btn_credits) {
	            instance_create_depth(0, 0, -1, obj_fadein_routine);
	        } else if (item.name == "Edit Controls") {
				instance_create_depth(0, 0, -1, obj_fadein_routine_controllersettings);
			}
	    }
	}

// Dragging slider: update slider value while dragging
if (mouse_check_button(mb_left) && dragging_slider != -1) {
    var slider_item = options[dragging_slider];
    var slider_x = padding_x + 200;
    var slider_w = 180;

    var new_val = clamp(((mx - slider_x) / slider_w) * (slider_item.max - slider_item.min) + slider_item.min, slider_item.min, slider_item.max);
    slider_item.value = new_val;
    save_options();
} else {
    dragging_slider = -1;
}

// Handle clicking on dropdown choices if dropdown is open
if (mouse_check_button_pressed(mb_left)) {
    for (var i = 0; i < array_length(options); i++) {
        var item = options[i];
        if (item.type == "dropdown" && item.open) {
            var dd_x = room_width - 72;
            var dd_y = rect.y + rect.h / 2 - 14;
            var dd_w = (256);
            var dd_h = 28;
            for (var c = 0; c < array_length(item.choices); c++) {
                var choice_y_start = dd_y + dd_h * c;
                var choice_y_end = dd_y + dd_h * (c + 1);
                if (mx > dd_x && mx < dd_x - dd_w && my > choice_y_start && my < choice_y_end) {
                    item.selected = c;
                    item.value = c; // keep value synced if needed
                    item.open = false;
                    save_options();
                    break;
                }
            }
        }
    }
}


// --- Save function for options ---
function save_options() {
    ini_open("settings.ini");
    for (var i = 0; i < array_length(options); i++) {
        var opt = options[i];
        if (opt.type == "toggle") {
            ini_write_real("options", opt.name, opt.value ? 1 : 0);
        } else if (opt.type == "dropdown") {
            ini_write_real("options", opt.name, opt.selected);
        } else if (opt.type == "slider") {
            ini_write_real("options", opt.name, opt.value);
        }
    }
    ini_close();
}
