if InputMouseMoved() && global.inputtype == false {
	global.inputtype = true;
	
	if room == rm_main_menu {
		with obj_story_mode_button {
			hover = false;
		} with obj_create_mode_button {
			hover = false;
		} with obj_connect_menu_button {
			hover = false;
		} with obj_options_menu_button {
			hover = false;
		}
	}
}

if (InputPlayerUsingGamepad() or InputPressed(INPUT_CLUSTER.NAVIGATION)) && global.inputtype == true
	global.inputtype = false;

// Keyboard + Controller Handling

if !global.inputtype {
	if room == rm_title_screen {
		if (InputPressed(INPUT_VERB.ACTION)) or (InputPressed(INPUT_VERB.CANCEL)) or (InputPressed(INPUT_VERB.SPECIAL)) or (InputPressed(INPUT_VERB.ACCEPT)) {
			audio_stop_all();
			audio_play_sound(snd_select_yes, 0, false);

			audio_stop_all();
			audio_play_sound(snd_startgame_jingle, 0, false);
			instance_create_depth(0, 0, -1, obj_flashout_routine);
			instance_create_depth(0, 0, -1, obj_slowtitlefadein);
		
			global.inputtype = false;
		}
	} else if room == rm_main_menu {
		if !global.dialogup {
			if (InputPressed(INPUT_VERB.LEFT) or InputPressed(INPUT_VERB.JOY_UP)) && index == 4 {
				if index != 1
					index--;
		
				audio_play_sound(snd_highlight, 0, false);	
				global.inputtype = false;
			} if (InputPressed(INPUT_VERB.RIGHT) or InputPressed(INPUT_VERB.JOY_RIGHT)) && index == 3 {
				if index != 4
					index++;
		
				audio_play_sound(snd_highlight, 0, false);	
				global.inputtype = false;
			} if InputPressed(INPUT_VERB.ACCEPT) {
				switch index {
					case 1:
						instance_create_depth(0, 0, -1, obj_slidein_routine_sm);
						index = 1;
						break;
			
					case 2:
						instance_create_depth(0, 0, -1, obj_fadein_routine_connectmenu);
						index = 1;
						break;
				
					case 3:
						room_goto(rm_create);
						index = 1;
						break;
				
					case 4:
						instance_create_depth(0, 0, -1, obj_fadein_routine_settingsmenu);
						index = 1;
						break;
				}
			} if InputPressed(INPUT_VERB.SPECIAL) {
				toast_dismiss();
				audio_play_sound(snd_select_yes, 0, false);

				var btns = [
					{label:"Let me out already!", action: dummyscript()},
					{label:"Just a little more...",  action: dummyscript()},
				];

				scr_show_dialog("Are you sure you want to exit Sunrise?", spr_dialog_warning, btns);
			} if InputPressed(INPUT_VERB.ACTION) {
				instance_create_depth(0, 0, -1, obj_fadein_routine_login);
			}
		}
	
		///////////////////////////////////////////////
	
			if index == 1 {
				with obj_btn_play {
					hover = true;
				} with obj_btn_create {
					hover = false;
				} with obj_btn_connect {
					hover = false;
				} with obj_btn_options {
					hover = false;
				}
			} else if index == 2 {
				with obj_btn_play {
					hover = false;
				} with obj_btn_create {
					hover = false;
				} with obj_btn_connect {
					hover = true;
				} with obj_btn_options {
					hover = false;
				}
			} else if index == 3 {
				with obj_btn_play {
					hover = false;
				} with obj_btn_create {
					hover = true;
				} with obj_btn_connect {
					hover = false;
				} with obj_btn_options {
					hover = false;
				}	
			} else if index == 4 {
				with obj_btn_play {
					hover = false;
				} with obj_btn_create {
					hover = false;
				} with obj_btn_connect {
					hover = false;
				} with obj_btn_options {
					hover = true;
				}	
			}
	}
} else {
	
}

// Controller Button Guide Handling
if InputPlayerUsingGamepad(0) {
	if room == rm_main_menu {
		prompt_action = "Play"
	}
}