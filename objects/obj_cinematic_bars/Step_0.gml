if enabled {
	ty = lerp(ty, 0, 0.25);	
	by = lerp(by, camera_get_view_height(0), 0.25);
} else {
	ty = lerp(ty, -128, 0.25);	
	by = lerp(by, camera_get_view_height(0) + 128, 0.25);	
}