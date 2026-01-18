if (!instance_exists(current_toast) && global.toast_queue_size > 0) {
    var _text = global.toast_texts[0];
    var _color = global.toast_colors[0];

    // Shift all items forward
    for (var i = 1; i < global.toast_queue_size; i++) {
        global.toast_texts[i - 1] = global.toast_texts[i];
        global.toast_colors[i - 1] = global.toast_colors[i];
    }

    global.toast_queue_size--;

    current_toast = instance_create_depth(room_width / 2, room_height - 96, -1, obj_toast);
    current_toast.text = _text;
    current_toast.bg_color = _color;
}
