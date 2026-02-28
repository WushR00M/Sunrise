// Scroll variables
scroll_target = 0;
scroll_y = 0;

// Fonts (replace with your actual font resource names)
font_header = Font4;
font_normal = Font7;

// Mouse tracking
hovered_item = -1;

// Options data
options = [];
item_rects = [];
description_text = "";
description = "";

selected_index = 0;           // Tracks gamepad focus

if global.gamepad_id == 4
	gamepad_id = 4;               // Default to gamepad 0
else
	gamepad_id = 0;
	
gamepad_cooldown = 0;         // Delay between gamepad inputs

// Visual config
line_height = 36;
header_height = 48;
padding_x = 48;
scroll_area_height = 400; // Adjust as needed
menu_top = 64;

array_push(options, { type: "header", name: "Input Settings" });
array_push(options, make_toggle("Tablet Mode", "Switches out input to use touch-screen controls only, no matter the type of device", false));
array_push(options, make_toggle("Always Use Virtual Keyboard", "An on-screen keyboard will show up whenever dialog / text input is needed", false));

array_push(options, { type: "header", name: "Controller Settings" });
array_push(options, make_toggle("Haptics", "Certain actions in-game will vibrate your controller at different levels, disable this to avoid that.", true));
array_push(options, make_toggle("In-Game Button Guide", "Displays a guide at the lower left corner of the screen showcasing which button does what", true));
array_push(options, make_toggle("Custom Light Bar Color", "Various events in-game will change your DUALSHOCK 4 / DualSense light bar color to match", false));
array_push(options, make_toggle("Switch ACCEPT and CANCEL Mappings", "Switches the ACCEPT and CANCEL buttons around on the controller to do the exact opposite", false));
array_push(options, make_button("Calibrate Controller", "This will automatically optimize the deadzone on your controller to avoid stick-drift only", function() {}));

update_item_rects();
// === Load options from ini ===
ini_open("controller.ini");
for (var i = 0; i < array_length(options); i++) {
    var opt = options[i];
    if (opt.type == "toggle") {
        if (ini_key_exists("options", opt.name)) {
            var val = ini_read_real("options", opt.name, opt.value ? 1 : 0);
            opt.value = (val == 1);
            options[i] = opt;
        }
    } else if (opt.type == "dropdown") {
        if (ini_key_exists("options", opt.name)) {
            var val = ini_read_real("options", opt.name, opt.selected);
            val = clamp(val, 0, array_length(opt.choices) - 1);
            opt.selected = val;
            options[i] = opt;
        }
    } else if (opt.type == "slider") {
        if (ini_key_exists("options", opt.name)) {
            var val = ini_read_real("options", opt.name, opt.value);
            val = clamp(val, opt.min, opt.max);
            opt.value = val;
            options[i] = opt;
        }
    }
}
ini_close();

// Helper functions to create option entries
function make_toggle(name, desc, default_val) {
    return {
        type: "toggle",
        name: name,
        desc: desc,
        value: default_val,
        id: string(name) + "_" + string(array_length(options))
    };
}

function make_dropdown(name, desc, choices, default_index) {
    return {
        type: "dropdown",
        name: name,
        desc: desc,
        choices: choices,
        selected: default_index,
        open: false,
        id: string(name) + "_" + string(array_length(options))
    };
}

function make_slider(name, desc, min_val, max_val, default_val) {
    return {
        type: "slider",
        name: name,
        desc: desc,
        min: min_val,
        max: max_val,
        value: default_val,
        id: string(name) + "_" + string(array_length(options))
    };
}

function make_button(name, desc, action) {
    return {
        type: "button",
        name: name,
        desc: desc,
        action: action,
        id: string(name) + "_" + string(array_length(options))
    };
}

function update_item_rects() {
    item_rects = [];
    var cur_y = menu_top - scroll_y;
    for (var i = 0; i < array_length(options); i++) {
        var item = options[i];
        var h = (item.type == "header") ? header_height : line_height;
        var rect = {
            x: padding_x,
            y: cur_y,
            w: room_width - padding_x * 2,
            h: h
        };
        array_push(item_rects, rect);
        cur_y += h;
    }
    // Recalculate max scroll height
    max_scroll = max(0, cur_y - menu_top - scroll_area_height);
}

// Special: Enforce Camera Shake disable if Photosensitive Mode ON
for (var j = 0; j < array_length(options); j++) {
    if (options[j].name == "Camera Shake") {
        var camShake = options[j];
        var photosensitive = false;
        for (var k = 0; k < array_length(options); k++) {
            if (options[k].name == "Photosensitive Mode") {
                photosensitive = options[k].value;
                break;
            }
        }
        camShake.value = !photosensitive;
        options[j] = camShake;
    }
}
