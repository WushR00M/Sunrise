text = "Default Toast";
bg_color = c_dkgray;

duration = 5 * room_speed;
timer = 0;

state = "slide_in";
start_y = camera_get_view_height(0) + 100;
target_y = camera_get_view_height(0) - 100;
x = view_wport[0] * 0.5;
y = start_y;

padding = 16;
height = 32;
slide_speed = 0.1;

draw_set_font(Font7); // Use your custom font if needed
width = string_width(text) + padding;