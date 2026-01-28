var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// Black background
draw_set_color(c_black);
draw_rectangle(0, 0, _gui_width, _gui_height, false);

// Draw credits
if (state == "scrolling" || state == "fade_in")
{
    draw_set_font(Font2);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    var _line_height = 40;
    var _y = credits_y;
    
    for (var i = 0; i < array_length(credits_text); i++)
    {
        var _text = credits_text[i];
        
        // Only draw if on screen
        if (_y > -50 && _y < _gui_height + 50)
        {
            // Check if it's a header (has ===)
            if (string_pos("===", _text) > 0)
            {
                draw_set_color(c_yellow);
            }
            else if (_text == "DEMO COMPLETED" || _text == "THE END")
            {
                draw_set_color(c_white);
                draw_text_transformed(_gui_width / 2, _y, _text, 1.5, 1.5, 0);
                _y += _line_height;
                continue;
            }
            else
            {
                draw_set_color(c_white);
            }
            
            draw_text(_gui_width / 2, _y, _text);
        }
        
        _y += _line_height;
    }
    
    // Skip hint
    if (state == "scrolling")
    {
        draw_set_alpha(0.5 + sin(current_time / 300) * 0.5);
        draw_set_color(c_gray);
        draw_text(_gui_width / 2, _gui_height - 30, "Press SPACE to skip");
        draw_set_alpha(1);
    }
}

// Fade overlay
if (fade_alpha > 0)
{
    draw_set_alpha(1 - fade_alpha); // Inverse for fade in
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gui_width, _gui_height, false);
    draw_set_alpha(1);
}

// Reset draw settings
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);