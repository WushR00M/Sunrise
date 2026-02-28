var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_w = camera_get_view_width(cam);

var base_x = cam_x + cam_w - box_width - padding;
var base_y = cam_y + padding;

while (array_length(notifications) < max_visible && array_length(queue) > 0) {
    var next = queue[0];
    array_delete(queue, 0, 1);
    array_push(notifications, next);
}

if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    for (var i = 0; i < array_length(notifications); i++) {
        var n = notifications[i];
        
        if (point_in_rectangle(mx, my, n.x, n.y, n.x + box_width, n.y + n.height)) {
            n.timer = min(n.timer, room_speed * 0.3);
            n.force_dismiss = true;
            n.read = true;
            notifications[i] = n;
        }
    }
}

for (var i = 0; i < array_length(notifications); i++) {
    var n = notifications[i];
    
    var offset_y = 0;

	for (var j = 0; j < i; j++) {
	    offset_y += notifications[j].height + spacing;
	}

	var target_y = base_y + offset_y;
    n.y = target_y;
    
    if (!n.removing) {
		if n.x == 0
			n.x = cam_x + cam_w + box_width + padding;
			
        n.x = lerp(n.x, base_x, slide_speed);
	}
    
    n.timer--;
    
    if (n.timer <= 0)
        n.removing = true;
    
    if (n.removing) {
        n.x = lerp(n.x, cam_x + cam_w + box_width, n.force_dismiss ? dismiss_speed : slide_speed);
        
        if (abs(n.x - (cam_x + cam_w + box_width)) < 2) {
            array_delete(notifications, i, 1);
            i--;
            continue;
        }
    }
    
    notifications[i] = n;
}

depth = -2;