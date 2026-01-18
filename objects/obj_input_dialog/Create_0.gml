/// Create Event
message_text   = "";
icon_sprite    = -1;
visible        = false;

input_string   = "";
input_active   = false; // whether the input field has focus

global.input_result = ""; // result string after pressing OK

snd_open       = snd_cancel_return_back;
snd_hover      = snd_highlight;
snd_select     = snd_select_yes;

bgfade		   = 0;

caret_timer = 0;
caret_visible = true;

hover_index    = -1;

// Slide animation
target_x = -1;
draw_x   = -1;
state    = "idle"; // "idle", "opening", "open", "closing"
