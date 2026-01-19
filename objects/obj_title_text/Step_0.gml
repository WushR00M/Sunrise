if slideout == true {
	timer += 1;
	var _perc = clamp(timer / duration, 0, 1);
	var _easeVal = easeInOutQuad(_perc);
	y = basey + (finy - basey) * _easeVal;
}

function easeInOutQuad(_t) {
	_t *= 2;
	if (_t < 1) return 0.5 * _t * _t;
	_t -= 1;
	return -0.5 * (_t * (_t - 2) - 1);
}