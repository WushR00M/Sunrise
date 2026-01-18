global.storymenu_deletemode = !global.storymenu_deletemode;
audio_play_sound(snd_select_yes, 0, false);

if global.storymenu_deletemode {
	toast_dismiss();
	toast_create("TIP: You can right click when in Delete Mode to remove any save file without confirmation.", 1);
}