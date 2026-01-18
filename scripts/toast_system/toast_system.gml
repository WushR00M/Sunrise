function toast_create(_text, _color_index){
	/// toast_create(text, color_index)

	_text = argument0;
	_color_index = argument1;

	var _color;

	switch (_color_index) {
	    case 1: _color = c_dkgray; break;
	    case 2: _color = c_green; break;
	    case 3: _color = c_olive; break;
	    case 4: _color = c_maroon; break;
	    default: _color = c_dkgray;
	}

	// Ensure toast manager exists
	if (!instance_exists(obj_toastman)) {
	    instance_create_depth(0, 0, -1, obj_toastman);
	}

	// Add to global arrays
	global.toast_texts[global.toast_queue_size] = _text;
	global.toast_colors[global.toast_queue_size] = _color;
	global.toast_queue_size++;
	
	if _color_index == 1
		audio_play_sound(snd_notification, 0, false);
	else if _color_index == 2
		audio_play_sound(snd_notification_success, 0, false);
	else if _color_index == 3
		audio_play_sound(snd_notification_warning, 0, false);
	else if _color_index == 4
		audio_play_sound(snd_notification_failure, 0, false);
	else
		audio_play_sound(snd_notification, 0, false);
}

function toast_dismiss(){
	with obj_toast {
		timer = duration;	
	}
}