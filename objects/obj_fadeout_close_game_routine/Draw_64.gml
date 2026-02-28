draw_self();
draw_set_halign(fa_center);
draw_set_font(Font7);
	if voice == 1
		draw_text(room_width / 2, room_height - 64, "Woohoo, goodbye I guess or something- I don't know, bye");
	else if voice == 2
		draw_text(room_width / 2, room_height - 64, "BAI BAI :3");
	else if voice == 3
		draw_text(room_width / 2, room_height - 64, "Awhh man...");
	else if voice == 4
		draw_text(room_width / 2, room_height - 64, "If anyone is listening, please send help. Wushy has me- oh you're not getting away that easy H4.");
	else if voice == 5
		draw_text(room_width / 2, room_height - 64, "DAAAYYYUUUUUMMM");
	else if voice == 6
		draw_text(room_width / 2, room_height - 64, "*totally epic music*");
	else if voice == 7
		draw_text(room_width / 2, room_height - 64, "Didj' I eva tell you about tha time Keith tried to deep fry a turkay? 3rd degree burns over 90% of his body, he-OOAOAAAAAA");
	else if voice == 8
		draw_sprite(spr_getaloadofthisdingus, 0, room_width / 2, room_height - 64);
	else if voice == 9 {
		if hasplayed == false {
			video_open("goodbye_vid.mp4");
			hasplayed = true;
		}
			var _data = video_draw();
			if(_data[0] == 0)
			{
				switch(video_get_format())
				{
					case video_format_rgba:
						var _surf = _data[1];
						draw_surface(_surf,0,0);
					break;
	
					//  #### YUV PART HERE ####
					case video_format_yuv:
						var _surf = _data[1];
						var _chromasurf = _data[2];
						if(surface_exists(_surf) and surface_exists(_chromasurf))
						{
							shader_set(shader_YUV);
			
							var _tex_id = surface_get_texture(_surf);
							var _chroma_tex_id = surface_get_texture(_chromasurf);
							texture_set_stage(videochromasampler, _chroma_tex_id);
							gpu_set_texfilter(false);
			
							draw_primitive_begin_texture(pr_trianglestrip, _tex_id);
						        draw_vertex_texture(0, 0, 0, 0);
							draw_vertex_texture(surface_get_width(_chromasurf), 0, 1, 0);
							draw_vertex_texture(0, surface_get_height(_chromasurf), 0, 1);
							draw_vertex_texture(surface_get_width(_chromasurf), surface_get_height(_chromasurf), 1, 1);
							draw_primitive_end();
			
							gpu_set_texfilter(true);
							shader_reset();
						}
					break;
				}
			}

	} else if voice == 10
		draw_text(room_width / 2, room_height - 64, "*ahem*... see you later!");
	else if voice == 11
		draw_text(room_width / 2, room_height - 64, "See you next time...");