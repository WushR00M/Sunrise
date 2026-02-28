// timer = 0;
show = false;

if !audio_is_playing(mus_titlescreen)
	audio_play_sound(mus_titlescreen, 0, false);
	
emit = audio_emitter_create();
gain = 0;
pitch = 0;

if date_get_month(date_current_datetime()) == 12 {
    layer_background_change(layer_background_get_id("Background"), bg_sunrise_bg_christmas);
} else if (date_get_month(date_current_datetime()) == 10 or date_get_month(date_current_datetime()) == 11) {
    layer_background_change(layer_background_get_id("Background"), bg_sunrise_bg_halloween);
}