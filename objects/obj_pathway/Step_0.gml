// Check if all fragments collected
if (global.fragments_collected >= global.fragments_needed && !lit_up)
{
    lit_up = true;
    // Optional: play sound
    // audio_play_sound(snd_pathway_unlock, 1, false);
}

// Fade in when lit up
if (lit_up && image_alpha < 1)
{
    image_alpha += 0.05;
}