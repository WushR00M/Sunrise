hover = false;
slideout = false;
click = false;
temp = false;

timer = 0;
timer2 = 0;
duration = 60;
basey = y;
finy = -360;

if global.titleanim {
	y = -360;
	instance_create_depth(0, 0, -1, obj_fadeout_routine);
}