function notify(_title, _desc, _time = -1){
	if (!instance_exists(obj_notifications)) return;
    
    var inst = instance_find(obj_notifications, 0);
    
    var lifetime = (_time == -1) ? inst.lifetime_default : _time;
    
    var text_width = inst.box_width - 32;
    
    var wrapped = string_wrap(_desc, text_width, fnt_default);
    
    draw_set_font(fnt_default);
    var desc_height = string_height(wrapped);
    
    draw_set_font(fnt_default_bold);
    var title_height = string_height(_title);
    
    var padding_top = 14;
    var padding_bottom = 14;
    var spacing = 6;
    var progress_height = 6;
    
    var total_height =
        padding_top +
        title_height +
        spacing +
        desc_height +
        padding_bottom +
        progress_height;
    
    var n = {
        title : _title,
        desc  : _desc,
        wrapped_desc : wrapped,
        timer : lifetime,
        max_time : lifetime,
        read : false,
        removing : false,
        force_dismiss : false,
        x : 0,
        y : 0,
        height : total_height
    };
    
    array_push(inst.history, n);
    array_push(inst.queue, n);
}

function string_wrap(_text, _max_width, _font)
{
    draw_set_font(_font);
    
    var words = string_split(_text, " ");
    var result = "";
    var line = "";
    
    for (var i = 0; i < array_length(words); i++)
    {
        var test_line = line == "" ? words[i] : line + " " + words[i];
        
        if (string_width(test_line) > _max_width)
        {
            result += line + "\n";
            line = words[i];
        }
        else
        {
            line = test_line;
        }
    }
    
    result += line;
    
    return result;
}