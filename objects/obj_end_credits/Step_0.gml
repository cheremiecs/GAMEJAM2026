if (state == "fade_in")
{
    fade_alpha += fade_speed;
    if (fade_alpha >= 1)
    {
        fade_alpha = 1;
        state = "scrolling";
    }
}
else if (state == "scrolling")
{
    // Scroll credits up
    credits_y -= scroll_speed;
    
    // When credits finish scrolling
    if (credits_y < -array_length(credits_text) * 40 - 500)
    {
        state = "fade_out";
    }
    
    // Skip with space
    if (keyboard_check_pressed(vk_space))
    {
        state = "fade_out";
    }
}
else if (state == "fade_out")
{
    fade_alpha -= fade_speed;
    if (fade_alpha <= 0)
    {
        game_restart();
    }
}