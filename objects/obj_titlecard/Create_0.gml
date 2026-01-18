tc_text = "";
tc_hold = 180;
state = 0;          
timer = 0;
if instance_exists(obj_camera) {
	view_w = camera_get_view_width(view_camera[0]);
	view_h = camera_get_view_height(view_camera[0]);
} else {
	view_w = camera_get_view_width(view_camera[0]);
	view_h = camera_get_view_height(view_camera[0]);	
}
bg_y1 = 0;
bg_y2 = 0;
text_x = -400;          
text_y = view_h * 0.5;  
target_x = view_w * 0.5;
bar_height = 128;
top_y = -bar_height;
bottom_y = view_h;
final_bar_height = 128;
