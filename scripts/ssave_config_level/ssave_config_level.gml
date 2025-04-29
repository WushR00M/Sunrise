function ssave_config_level() : SSave("level") constructor{
	add_value("instances", SSAVE_TYPE.ARRAY, []);
	add_value("tilemap", SSAVE_TYPE.ARRAY, []);
}