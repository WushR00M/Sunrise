// Feather disable all

function __InputTrace()
{
    var _string = "";
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    log("Input responded: " + _string);
}
