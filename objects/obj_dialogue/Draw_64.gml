// Draw dialogue box
var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;
draw_sprite_stretched(spr_box, 0, _dx, _dy, _boxw, _boxh);
_dx += 16;
_dy += 16;
draw_set_font(Font1); 

// Only draw dialogue if not showing choices or still has messages
if (current_message >= 0 && current_message < array_length(messages))
{
    var _name = messages[current_message].name;
    draw_set_colour(global.char_colors[$ _name]); //set color for names
    draw_text(_dx, _dy, _name);
    draw_set_colour(c_white); //ibalik to white
    _dy += 40;  
    draw_text_ext(_dx, _dy, draw_message, -1, _boxw - _dx * 2);
}

// Draw choices if showing
if (show_choices && has_choices)
{
    var _choice_box_width = 600;
    var _choice_box_height = 70 * array_length(choices) + 60;
    var _choice_box_x = (gui_w / 2) - (_choice_box_width / 2);
    var _choice_box_y = gui_h - _choice_box_height - 30;
    
    // Draw choice box background
    draw_set_color(c_black);
    draw_set_alpha(0.85);
    draw_rectangle(_choice_box_x, _choice_box_y, _choice_box_x + _choice_box_width, _choice_box_y + _choice_box_height, false);
    draw_set_alpha(1);
    
    // Draw border
    draw_set_color(c_yellow);
    draw_rectangle(_choice_box_x, _choice_box_y, _choice_box_x + _choice_box_width, _choice_box_y + _choice_box_height, true);
    draw_rectangle(_choice_box_x + 2, _choice_box_y + 2, _choice_box_x + _choice_box_width - 2, _choice_box_y + _choice_box_height - 2, true);
    
    // Draw choices
    draw_set_font(Font1);
    var _choice_y = _choice_box_y + 30;
    
    for (var i = 0; i < array_length(choices); i++)
    {
        var _y = _choice_y + (i * 70);
        
        // Highlight selected
        if (i == choice_selected)
        {
            // Selection background
            draw_set_color(c_yellow);
            draw_set_alpha(0.3);
            draw_rectangle(_choice_box_x + 10, _y - 5, _choice_box_x + _choice_box_width - 10, _y + 40, false);
            draw_set_alpha(1);
            
            draw_set_color(c_yellow);
            draw_text(_choice_box_x + 30, _y, "> " + choices[i].text);
        }
        else
        {
            draw_set_color(c_white);
            draw_text(_choice_box_x + 50, _y, choices[i].text);
        }
    }
    
    // Instructions
    draw_set_color(c_gray);
    draw_set_halign(fa_center);
    draw_text(_choice_box_x + _choice_box_width / 2, _choice_box_y + _choice_box_height - 25, "Use W/S to choose, SPACE to confirm");
    draw_set_halign(fa_left);
    
    // Reset draw settings
    draw_set_color(c_white);
    draw_set_alpha(1);
}