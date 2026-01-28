if (state == "fade_in")
{
    alpha += fade_in_speed;
    if (alpha >= 1)
    {
        alpha = 1;
        state = "showing";
    }
}
else if (state == "showing")
{
    timer++;
    if (timer >= display_time)
    {
        state = "fade_out";
    }
}
else if (state == "fade_out")
{
    alpha -= fade_out_speed;
    if (alpha <= 0)
    {
        instance_destroy();
    }
}

// Optional: Press key to dismiss early
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
{
    state = "fade_out";
}