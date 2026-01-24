// Fade in
if (alpha < 1)
{
    alpha += fade_speed;
}

// Press space or click to restart
if (alpha >= 1 && (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)))
{
    room_restart();
}