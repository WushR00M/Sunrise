function titlecard_show(_text) {
    var inst = instance_create_depth(0, 0, -1, obj_titlecard);
    inst.tc_text = _text;
    inst.tc_hold = 180; // frames (180 = ~3 seconds)
}

/// Cubic ease out: f(t) = 1 - (1-t)^3
function ease_out_cubic(t) {
    return 1 - power(1 - t, 3);
}