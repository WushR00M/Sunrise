// Feather disable all
/// @desc    Outputs a string or struct containing all player and accessibility data
/// @param   [outputString=true]
/// @param   [prettify=false]

function input_system_export(_output_string = true, _prettify = false)
{
    __INPUT_GLOBAL_STATIC_LOCAL  //Set static _global
    
    var _players_array = array_create(INPUT_MAX_PLAYERS, undefined);
    
    var _root_json = {
        __accessibility: {
            __momentary_state: _global.__toggle_momentary_state,
            __momentary_verbs: variable_struct_get_names(_global.__toggle_momentary_dict),
            __cooldown_state:  _global.__cooldown_state,
            __cooldown_verbs:  variable_struct_get_names(_global.__cooldown_dict),
        },
        
        __mouse: {
            __capture:     _global.__mouse_capture,
            __sensitivity: _global.__mouse_capture_sensitivity,
        },
        
        __players: _players_array,
    };
    
    var _p = 0;
    repeat(INPUT_MAX_PLAYERS)
    {
        with(_global.__players[_p]) _players_array[@ _p] = __export();
        ++_p;
    }
    
    if (_output_string)
    {
        if (_prettify)
        {
            return __input_snap_to_json(_root_json, true, true);
        }
        else
        {
            return json_stringify(_root_json);
        }
    }
    else
    {
        return _root_json;
    }
}
