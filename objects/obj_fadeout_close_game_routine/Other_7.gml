voice = irandom_range(1, 11);
if voice == 1 {
	audio_play_sound(vo_goodbye_wushy, 0, false);
} else if voice == 2 {
	audio_play_sound(vo_goodbye_blue1, 0, false);
} else if voice == 3 {
	audio_play_sound(vo_goodbye_blue2, 0, false);
} else if voice == 4 {
	audio_play_sound(vo_goodbye_h49, 0, false);
} else if voice == 5 {
	audio_play_sound(vo_goodbye_blue3, 0, false, 0.5);
} else if voice == 6 {
	audio_play_sound(vo_goodbye_blue4, 0, false, 0.35);
} else if voice == 7 {
	audio_play_sound(vo_goodbye_blue5, 0, false, 0.25);
} else if voice == 8 {
	audio_play_sound(vo_goodbye_blue6, 0, false, 0.5);
} else if voice == 9 {
	audio_play_sound(vo_goodbye_wushy, 0, false, 0);
} else if voice == 10 {
	audio_play_sound(vo_goodbye_xawo, 0, false);	
} else if voice == 11 {
	audio_play_sound(vo_goodbye_osu, 0, false);	
}
instance_deactivate_layer("Instances");

sprite_index = spr_blackscreen;