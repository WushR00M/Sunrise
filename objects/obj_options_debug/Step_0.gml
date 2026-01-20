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
			if item.name == "Discord Rich Presence"
				description_text = "Shows a display on your Discord profile of what you're doing on Sunrise currently";
			else if item.name == "Credits"
				description_text = "See who was behind this game!";
			else if item.name == "Legacy Title Sequence"
				description_text = "Reverts the changes made to the Main Menu and Title Screen in v2026.4.0";
			else if item.name == "Confine Mouse to Window"
				description_text = "Locks the mouse from moving outside of the game window";
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
			
			if (item.name == "Legacy Title Sequence") {
				var btns = [
					{label:"Restart Sunrise", action: dummyscript()},
					{label:"Actually, nevermind!",  action: dummyscript()},
				];
				scr_show_dialog("This requires a game restart!", spr_dialog_warning, btns);
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
	        instance_create_depth(0, 0, -1, obj_slidein_routine_credits);
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

// Handle mouse click on option items
	if (mouse_check_button_pressed(mb_left) && hovered_item != -1) {
		audio_play_sound(snd_select_yes, 0, false);
	    var item = options[hovered_item];

	    if (item.type == "toggle") {
	        item.value = !item.value;
	        save_options();
			
			if (item.name == "Legacy Title Sequence") {
				var btns = [
					{label:"Restart Sunrise", action: dummyscript()},
					{label:"Actually, nevermind!",  action: dummyscript()},
				];
				scr_show_dialog("This requires a game restart!", spr_dialog_warning, btns);
			} else if (item.name == "Confine Mouse to Window") {
				global.op_mouseconfine = !global.op_mouseconfine;
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
	        instance_create_depth(0, 0, -1, obj_slidein_routine_credits);
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
