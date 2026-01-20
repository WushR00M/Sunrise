// === GENERAL CONFIG ===
padding        = 4;
box_h_frac     = 0.5;        // dialog takes half the camera height
icon_size      = 48;
icon_text_gap  = 10;

// === SLIDE / STATE ===
is_open        = true;
slide          = 0;          // 0=hidden, 1=visible
slide_speed    = 0.15;
selected_index = -1;

// === DEBUG TOGGLE ===
debug_enabled  = false;

// === ICON DEFINITIONS ===
// Replace with your own sprites + names
icons = [
    { spr: spr_oblist_autoterrain, label: "Autoterrain"  },
    { spr: spr_oblist_bit, label: "Bit"  },
    { spr: spr_oblist_grass, label: "Grass Terrain"  },
    { spr: spr_oblist_mansion, label: "Mansion Terrain" },
    { spr: spr_oblist_metal, label: "Metal Terrain" },
    { spr: spr_oblist_solid, label: "Solid Block" },
    { spr: spr_oblist_stage, label: "Stagefloor Terrain"  }
];

// === ICON GRID CONFIG ===
icons_per_row  = 8;     // grid columns
icon_spacing_y = 48;    // vertical spacing between rows

hover_index    = -1;    // track which icon is hovered

// === TOP BUTTONS ===
btn_labels = [
    "Brush Mode",
];

btn_exit_label = "Exit Menu";
btn_h          = 28;
btn_padding    = 8;
btn_w          = 110;        // width of each left-side button
btn_exit_w     = 120;        // width of right-side Exit button

cam_w = camera_get_view_width(view_camera[0]);
cam_h = camera_get_view_height(view_camera[0]);

box_h = cam_h * box_h_frac;
box_y_hidden  = cam_h;
box_y_visible = cam_h - box_h;

box_x = 0;
box_y = 0;
box_w = cam_w;
box_h_actual = box_h;

mx = device_mouse_x_to_gui(0);
my = device_mouse_y_to_gui(0);