messages = [];
current_message = -1;
current_char = 0;
draw_message = "";

char_speed = 0.5;
input_key = vk_space;

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

has_choices = false;
choices = [];
choice_selected = 0;
show_choices = false;
choice_confirmed = false;