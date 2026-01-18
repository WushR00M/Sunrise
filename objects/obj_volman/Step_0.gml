// Handle volume increase
if (keyboard_check_pressed(vk_pageup) || keyboard_check_pressed(ord("="))) {
    if (volume < 5) volume += 1;
    show_slider();
	audio_master_gain((volume)/10);
}

// Handle volume decrease
if (keyboard_check_pressed(vk_pagedown) || keyboard_check_pressed(ord("-"))) {
    if (volume > 0) volume -= 1;
    show_slider();
	audio_master_gain((volume)/10);
}

// Show slider function
function show_slider() {
    slider_visible = true;
    slider_timer = 0;
    y_target = y_visible;
}

if (slider_visible) {
    slider_timer += 1;
    if (slider_timer > SLIDER_TIMEOUT) {
        slider_visible = false;
        y_target = y_hidden;
    }
}

// Smooth vertical slide
y = lerp(y, y_target, slide_speed);