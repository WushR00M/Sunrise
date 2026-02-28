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
description_text = "Edit your controller settings here!";

for (var i = 0; i < array_length(options); i++) {
    var item = options[i];
    var rect = item_rects[i];
	
	if global.inputtype == false {
	    // Check mouse hover over item rectangle
	    if (my > rect.y && my < rect.y + rect.h && mx > rect.x && mx < rect.x + rect.w) {
	        hovered_item = i;
			if item.name == "Haptics"
				description_text = "Certain actions in-game will vibrate your controller at different levels, disable this to avoid that.";
			else if item.name == "In-Game Button Guide"
				description_text = "Displays a guide at the lower left corner of the screen showcasing which button does what";
			else if item.name == "Custom Light Bar Color"
				description_text = "Various events in-game will change your DUALSHOCK 4 / DualSense light bar color to match";
			else if item.name == "Switch ACCEPT and CANCEL Mappings"
				description_text = "Switches the ACCEPT and CANCEL buttons around on the controller to do the exact opposite";
			else if item.name == "Calibrate Controller"
				description_text = "This will automatically optimize the deadzone on your controller to avoid minor stick-drift only";
			else if item.name == "Tablet Mode"
				description_text = "Switches out input to use touch-screen controls only, no matter the type of device"
			else if item.name == "Always Use Virtual Keyboard"
				description_text = "An on-screen keyboard will show up whenever dialog / text input is needed";
			else
				description_text = "Edit your input and controller settings here!";
			
	        break;
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
			
			if item.name == "Custom Light Bar Color" {
				if item.value == true {
					if InputColorSupportedByDevice(0)
						InputColorSet(c_fuchsia, 0)
					else
						toast_create("The input device you're using doesn't support custom colors!", 3);
				} else {
					InputColorReset(0);
				}
			} else if item.name == "Haptics" {
				if item.value == true {
					var _type = InputPlayerGetGamepadType(0);
					var _hd = false;
				    switch(_type)
				    {
				        default:
							_hd = false;
							break;

				        case INPUT_GAMEPAD_TYPE_PS5:
							_hd = true;
							break;
					}
				
					if InputVibrateGetSupported(0)
						InputVibratePulse(3, 0, false, 60, 0);
					else
						toast_create("The input device you're using doesn't support haptic feedback!", 3);
				}
			} else if item.name == "DualSense Adaptive Trigger Support" {
				if item.value == true {
					if !InputTriggerEffectGetSupported(0)
						toast_create("A PlayStation 5 / DualSense controller is required to use adaptive triggers!", 3);
				}
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
	        if item.name == "Calibrate Controller" {
				InputMotionCalibrate(0);
				toast_create("SUCCESS: Motion controls were calibrated on your controller!", 2);
			}
	    }
    }

	// i think we can optimize this by removing the duplicate and instead just sharing the other list above this one
    // Sync hovered_item with gamepad
    hovered_item = selected_index;
    if (hovered_item >= 0 && hovered_item < array_length(options)) {
        var item = options[hovered_item];
			if item.name == "Haptics"
				description_text = "Certain actions in-game will vibrate your controller at different levels, disable this to avoid that.";
			else if item.name == "In-Game Button Guide"
				description_text = "Displays a guide at the lower left corner of the screen showcasing which button does what";
			else if item.name == "Custom Light Bar Color"
				description_text = "Various events in-game will change your DUALSHOCK 4 / DualSense light bar color to match";
			else if item.name == "Switch ACCEPT and CANCEL Mappings"
				description_text = "Switches the ACCEPT and CANCEL buttons around on the controller to do the exact opposite";
			else if item.name == "Calibrate Controller"
				description_text = "This will automatically optimize the deadzone on your controller to avoid minor stick-drift only";
			else if item.name == "Tablet Mode"
				description_text = "Switches out input to use touch-screen controls only, no matter the type of device"
			else if item.name == "Always Use Virtual Keyboard"
				description_text = "An on-screen keyboard will show up whenever dialog / text input is needed";
			else
				description_text = "Edit your input and controller settings here!";
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
    ini_open("controller.ini");
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
