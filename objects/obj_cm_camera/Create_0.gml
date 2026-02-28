camera = view_camera[0];

// camera state
cam_x = 0;
cam_y = 0;
cam_x_target = 0;
cam_y_target = 0;

// zoom state
zoom = 1;
zoom_target = 1;

// constants
zoom_factor = 1.1;
zoom_min = 0.25;
zoom_max = 4;
zoom_speed = 0.25;
pan_speed = 0.25;

// mouse prev
mouse_x_prev = mouse_x;
mouse_y_prev = mouse_y;

cancelout = false;