global.cmplay = true;

if global.op_cardskip
	instance_create_depth(0, 0, -1, obj_fadeout_routine);
else
	titlecard_show(global.cmname);
	
instance_destroy();