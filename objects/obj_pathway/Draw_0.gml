// Draw with glow when lit up
if (lit_up)
{
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_yellow, image_alpha * 0.5);
}

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, image_alpha);