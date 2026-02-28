global.cmselection = 1;
init_var();

audio_stop_all();


instance_create_depth(0, 0,-1,obj_flashout_routine);

lvlprop = false;

filemenu = false;
objmenu = false;
logicmenu = false;

if global.fromgo == true {
	global.fromgo = false;
	quick_load_level();
} else {
	audio_play_sound(snd_mainmenu_btn, 0, false);
}