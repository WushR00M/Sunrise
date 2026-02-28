// timer += 1;

// if timer == 60 {
// 	show = !show;
// 	timer = 0;
// }

if !audio_is_playing(mus_titlescreen) && !audio_is_playing(mus_capslock)
	audio_play_sound_on(emit, mus_capslock, true, 0, 0, 0, 0);

if audio_emitter_get_gain(emit) != 0.5 {
	gain += 0.005
	audio_emitter_gain(emit, gain);
	
	pitch += 0.005;
	audio_emitter_pitch(emit, pitch);
}