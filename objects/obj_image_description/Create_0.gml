y = -384;
image = irandom_range(1, 3);
switch image {
	case 1:
		sprite_index = spr_ui_aboutplay;
		break;
		
	case 2:
		sprite_index = spr_ui_aboutconnect;
		break;
		
	case 3:
		sprite_index = spr_ui_aboutcreate;
}

if global.op_legacytitle {
	if !audio_is_playing(mus_mainmenu)
		audio_play_sound(mus_mainmenu, 0, true);
}