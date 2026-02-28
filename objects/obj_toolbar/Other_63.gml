var i_d = ds_map_find_value(async_load, "id");
if (i_d == msg)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
            global.newlvl = ds_map_find_value(async_load, "result");
			window_set_caption("Sunrise Editor - " + global.newlvl);
		} else {
			toast_dismiss();
			toast_create("FAILURE: Invalid level name entered", 4);
		}
    }
}