prompt_action = "";
prompt_cancel = "";
prompt_special = "";
prompt_triangle = "";

prompt_start = "";
prompt_select = "";

prompt_lb = "";
prompt_rb = "";
prompt_lt = "";
prompt_rt = "";

prompt_touchpad = "";

prompt_func1 = "";
prompt_func2 = "";

index = 1;
gamepad_connected = false;
deck_mode = false;

global.inputtype = true;
global.dialogup = false;
global.gamepad_id = 0;

glyph_mode = 0;
glyph_action = "";
glyph_cancel = "";
glyph_special = "";
glyph_triangle = "";
glyph_start = "";
glyph_select = "";
glyph_lb = "";
glyph_rb = "";
glyph_lt = "";
glyph_rt = "";
glyph_l4 = "";
glyph_r4 = "";
glyph_l5 = "";
glyph_r5 = "";
glyph_touchpad = "";
glyph_func1 = "";
glyph_func2 = "";
	// 0: Xbox 360
	// 1: Xbox One
	// 3: DualShock 4
	// 6: Switch (both Joycons)
	// 7: Switch (only one Joycon)
	// 10: DualShock 3
	// 11: DualSense
	// 12: Steam Deck

if steam_initialised() {
	steam_input_init(false);
	if (!steam_input_init(false)) {
		log("Failed to initialize Steam input!");
		instance_destroy();
	} else {
		if steam_utils_is_steam_running_on_steam_deck() {
			deck_mode = true;
			glyph_mode = 12;
			
			log("Sunrise is running on a Steam Deck, how cool! Entering Deck Mode...");
		} else {
			controllers = steam_input_get_connected_controllers();
			if (is_undefined(controllers)) {
				log("Unable to poll for controllers in Steam Input! Are there any even connected?");	
			}
			
			steam_input_enable_device_callbacks();
			var _input_type = steam_input_get_input_type_for_handle(0);
			var _msg = "Connected controller is type: ";
			switch (_input_type) {
			    case steam_input_type_steam_controller: glyph_mode = 12; break;
			    case steam_input_type_xbox_360_controller: glyph_mode = 0; break;
			    case steam_input_type_xbox_one_controller: glyph_mode = 1; break;
			    case steam_input_type_generic_gamepad: glyph_mode = 1; break;
			    case steam_input_type_ps4_controller: glyph_mode = 3; break;
			    case steam_input_type_apple_mfi_controller: glyph_mode = 1; break;
			    case steam_input_type_android_controller: glyph_mode = 1; break;
			    case steam_input_type_switch_joycon_pair: glyph_mode = 6; break;
			    case steam_input_type_switch_joycon_single: glyph_mode = 7; break;
			    case steam_input_type_switch_pro_controller: glyph_mode = 6; break;
			    case steam_input_type_mobile_touch: glyph_mode = 1; break;
			    case steam_input_type_ps3_controller: glyph_mode = 10; break;
			    case steam_input_type_ps5_controller: glyph_mode = 11; break;
			    case steam_input_type_steam_deck_controller: glyph_mode = 12; break;
			}
			
			log(string_concat("Steam Input detected controller type is: ", string(_input_type)));
			log(string(glyph_mode));
		}
	}
}