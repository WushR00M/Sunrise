function __InputConfigVerbs()
{
    enum INPUT_VERB
    {
        //Add your own verbs here!
        UP,
        DOWN,
        LEFT,
        RIGHT,
		JOY_UP,
        JOY_DOWN,
        JOY_LEFT,
        JOY_RIGHT,
		RJOY_UP,
        RJOY_DOWN,
        RJOY_LEFT,
        RJOY_RIGHT,
        ACCEPT,
        CANCEL,
        ACTION,
        SPECIAL,
        PAUSE,
		MIDDLE_CLICK,
		RIGHT_CLICK,
		LEFT_CLICK,
		L1,
		R1,
		PLACE,
		DELETE,
    }
    
    enum INPUT_CLUSTER
    {
        //Add your own clusters here!
        //Clusters are used for two-dimensional checkers (InputDirection() etc.)
        NAVIGATION,
    }
    
    if (not INPUT_ON_SWITCH)
    {
        InputDefineVerb(INPUT_VERB.UP,      "up",         [vk_up],    [gp_padu]);
        InputDefineVerb(INPUT_VERB.DOWN,    "down",       [vk_down],    [gp_padd]);
        InputDefineVerb(INPUT_VERB.LEFT,    "left",       [vk_left],    [gp_padl]);
        InputDefineVerb(INPUT_VERB.RIGHT,   "right",      [vk_right],    [gp_padr]);
		
		InputDefineVerb(INPUT_VERB.JOY_UP,      "up",     ["W"],    [-gp_axislv]);
        InputDefineVerb(INPUT_VERB.JOY_DOWN,    "down",   ["S"],    [ gp_axislv]);
        InputDefineVerb(INPUT_VERB.JOY_LEFT,    "left",   ["A"],    [-gp_axislh]);
        InputDefineVerb(INPUT_VERB.JOY_RIGHT,   "right",  ["D"],    [ gp_axislh]);
		
		InputDefineVerb(INPUT_VERB.RJOY_UP,      "up",     ["I"],    [-gp_axisrv]);
        InputDefineVerb(INPUT_VERB.RJOY_DOWN,    "down",   ["K"],    [ gp_axisrv]);
        InputDefineVerb(INPUT_VERB.RJOY_LEFT,    "left",   ["J"],    [-gp_axisrh]);
        InputDefineVerb(INPUT_VERB.RJOY_RIGHT,   "right",  ["L"],    [ gp_axisrh]);
		
        InputDefineVerb(INPUT_VERB.ACCEPT,  "accept",      vk_space,            gp_face1);
        InputDefineVerb(INPUT_VERB.CANCEL,  "cancel",      vk_backspace,        gp_face2);
        InputDefineVerb(INPUT_VERB.ACTION,  "action",      vk_enter,            gp_face3);
        InputDefineVerb(INPUT_VERB.SPECIAL, "special",     vk_shift,            gp_face4);
        InputDefineVerb(INPUT_VERB.PAUSE,   "pause",       vk_escape,           gp_start);
	
		InputDefineVerb(INPUT_VERB.L1,		"l1",			vk_pageup,			gp_shoulderl);
		InputDefineVerb(INPUT_VERB.R1,		"r1",			vk_pagedown,		gp_shoulderr);
		InputDefineVerb(INPUT_VERB.PLACE,	"place",		vk_insert,		gp_shoulderlb);
		InputDefineVerb(INPUT_VERB.DELETE,	"place",		vk_delete,		gp_shoulderrb);
    }
    else //Flip A/B over on Switch
    {
        InputDefineVerb(INPUT_VERB.UP,      "up",         [vk_up,    "W"],    [gp_padu]);
        InputDefineVerb(INPUT_VERB.DOWN,    "down",       [vk_down,  "S"],    [gp_padd]);
        InputDefineVerb(INPUT_VERB.LEFT,    "left",       [vk_left,  "A"],    [gp_padl]);
        InputDefineVerb(INPUT_VERB.RIGHT,   "right",      [vk_right, "D"],    [gp_padr]);
		InputDefineVerb(INPUT_VERB.JOY_UP,      "up",     ["W"],    [-gp_axislv]);
        InputDefineVerb(INPUT_VERB.JOY_DOWN,    "down",   ["S"],    [ gp_axislv]);
        InputDefineVerb(INPUT_VERB.JOY_LEFT,    "left",   ["A"],    [-gp_axislh]);
        InputDefineVerb(INPUT_VERB.JOY_RIGHT,   "right",  ["D"],    [ gp_axislh]);
        InputDefineVerb(INPUT_VERB.ACCEPT,  "accept",      vk_backspace,            gp_face2);
        InputDefineVerb(INPUT_VERB.CANCEL,  "cancel",      vk_space,        gp_face1);
        InputDefineVerb(INPUT_VERB.ACTION,  "action",      vk_enter,            gp_face3);
        InputDefineVerb(INPUT_VERB.SPECIAL, "special",     vk_shift,            gp_face4);
        InputDefineVerb(INPUT_VERB.PAUSE,   "pause",       vk_escape,           gp_start);
    }
    
    //Define a cluster of verbs for moving around
    InputDefineCluster(INPUT_CLUSTER.NAVIGATION, INPUT_VERB.UP, INPUT_VERB.RIGHT, INPUT_VERB.DOWN, INPUT_VERB.LEFT);
}
