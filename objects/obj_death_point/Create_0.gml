sprite_index = obj_player.sprite_index;
timer = 0;

notres_fade = false;
error = false;

notres_alpha = 0;

toast_dismiss();

audio_stop_all();
audio_play_sound(snd_glass_shatter, 0, false, 1, 0, 2);
log("Player died!");

if room == rm_create
	global.fromeditor = true;