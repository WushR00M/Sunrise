if (async_load[? "event_type"] == "steam_input_device_connected") {
    scr_game_add_device(async_load[? "connected_device_handle"]); // register an input_handle
    log("Discovered a new input_handle!");
	notify("Input Connection", "Your controller is connected, have fun!");
	gamepad_connected = true;
}
else if (async_load[? "event_type"] == "steam_input_device_disconnected") {
    scr_game_remove_device(async_load[? "disconnected_device_handle"]); // de-register an input_handle
    log("Lost an input_handle!");
	notify("Input Disconnection", "Your controller was disconnected!");
	gamepad_connected = false;
}