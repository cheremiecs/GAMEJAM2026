// If showing choices, handle choice selection
if (show_choices && has_choices)
{
    // Navigate choices
    if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
    {
        choice_selected--;
        if (choice_selected < 0) choice_selected = array_length(choices) - 1;
    }
    
    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
    {
        choice_selected++;
        if (choice_selected >= array_length(choices)) choice_selected = 0;
    }
    
    // Confirm choice
    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
    {
        choice_confirmed = true;
        
        // Store the choice
        global.dialogue_choice = choice_selected;
        global.dialogue_choice_text = choices[choice_selected].text;
        
        // Execute callback
        if (variable_struct_exists(choices[choice_selected], "callback"))
        {
            choices[choice_selected].callback();
        }
        
        instance_destroy();
    }
    
    exit; // Don't process normal dialogue while choosing
}

// Normal dialogue progression
if (current_message < 0) exit; 
    
var _str = messages[current_message].msg;
if (current_char < string_length(_str))
{
    current_char += char_speed * (1 + keyboard_check(input_key));
    draw_message = string_copy(_str, 0, current_char);
}
else if (keyboard_check_pressed(input_key))
{
    current_message++;
    if (current_message >= array_length(messages))
    {
        // Check if we should show choices
        if (has_choices)
        {
            show_choices = true;
        }
        else
        {
            instance_destroy();
        }
    }
    else 
    {
        current_char = 0;
    }
}