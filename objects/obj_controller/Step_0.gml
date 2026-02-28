if gamepad_connected == true {
	if room == rm_title_screen {
		if global.titleanim {
			if os_device == os_xboxseriesxs {
				prompt_action = "Select";
				prompt_triangle = "Switch User";
			} else if os_device == os_ps5 or os_device == os_switch2 {
				prompt_action = "Select";
			} else if os_device == os_windows {
				prompt_action = "Select";
				prompt_triangle = "Switch User";
				prompt_special = "Exit Game";
			}
		} else {
			if os_device == os_xboxseriesxs {
				prompt_action = "Start Game";
				prompt_triangle = "Switch User";
			} else if os_device == os_ps5 or os_device == os_switch2 {
				prompt_action = "Start Game";
			} else if os_device == os_windows {
				prompt_action = "Start Game";
				prompt_triangle = "Switch User";
			}
		}
	} else if room == rm_title_screen_legacy {
		if os_device == os_xboxseriesxs {
			prompt_action = "Start Game";
			prompt_triangle = "Switch User";
		} else if os_device == os_ps5 or os_device == os_switch2 {
			prompt_action = "Start Game";
		} else if os_device == os_windows {
			prompt_action = "Start Game";
			prompt_triangle = "Switch User";
			prompt_special = "Exit Game";
		}	
	} else if room == rm_main_menu_legacy {
		if os_device == os_xboxseriesxs {
			prompt_action = "Select";
			prompt_triangle = "Switch User";
		} else if os_device == os_ps5 or os_device == os_switch2 {
			prompt_action = "Select";
		} else if os_device == os_windows {
			prompt_action = "Select";
			prompt_triangle = "Switch User";
			prompt_special = "Exit Game";
		}
	} else if room == rm_story_mode or room == rm_saved_levels {
		prompt_cancel = "Back";
		prompt_rb = "Next Page";
		
		if room == rm_saved_levels
			prompt_lb = "Previous Page";
	} else if room == rm_multiplayer_lounge {
		prompt_select = "Select";
		prompt_cancel = "Back";
		prompt_triangle = "View Game Invites"
		prompt_lb = "Previous Page";
	} else if room == rm_settings {
		prompt_select = "Select";
		prompt_cancel = "Back";
		prompt_lb = "Previous Page";
		prompt_rb = "Next Page";
	} else if room == rm_settings_gameplay {
		prompt_select = "Select";
		prompt_cancel = "Back";
		prompt_lb = "Previous Page";
		prompt_rb = "Next Page";
	} else if room == rm_settings_graphics {
		prompt_select = "Select";
		prompt_cancel = "Back";
		prompt_lb = "Previous Page";
		prompt_rb = "Next Page";
	} else if room == rm_settings_input {
		prompt_select = "Select";
		prompt_cancel = "Back";
		prompt_lb = "Previous Page";
	} else {
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
	}
}