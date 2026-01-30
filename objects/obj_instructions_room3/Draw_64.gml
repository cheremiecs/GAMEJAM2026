var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// Save settings
var _old_font = draw_get_font();
draw_set_font(Font3);

// Semi-transparent background
draw_set_alpha(alpha * 0.7);
draw_set_color(c_black);
draw_rectangle(0, 0, _gui_width, _gui_height, false);

// Draw instructions
draw_set_alpha(alpha);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _center_x = _gui_width / 2;
var _center_y = _gui_height / 2;
var _line_height = 40;

// Draw each instruction line
for (var i = 0; i < array_length(instructions); i++)
{
    var _y_offset = (_center_y - 60) + (i * _line_height);
    
    // Make first line bigger
    if (i == 0)
    {
        draw_set_color(c_yellow);
        draw_text_transformed(_center_x, _y_offset, instructions[i], 1.2, 1.2, 0);
        draw_set_color(c_white);
    }
    else
    {
        draw_text(_center_x, _y_offset, instructions[i]);
    }
}

// Hint to dismiss
draw_set_alpha(alpha * 0.5);
draw_text(_center_x, _gui_height - 80, "Press SPACE or ENTER to continue");

// Reset settings
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(_old_font);