volume = 3;
slider_timer = 0;
SLIDER_TIMEOUT = 5 * 60;

y_hidden = -sprite_height; // Offscreen above the screen
y_visible = 96;            // Visible Y position
y_target = y_hidden;
y = y_hidden;

slide_speed = 0.1;
slider_visible = false;

x = (window_get_width()/2);