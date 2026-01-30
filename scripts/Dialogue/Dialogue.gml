function create_dialog(_messages){
    if (instance_exists(obj_dialogue)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialogue);
    _inst.messages = _messages;
    _inst.current_message = 0; 
}

function create_dialog_with_choice(_messages, _choices){
    if (instance_exists(obj_dialogue)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialogue);
    _inst.messages = _messages;
    _inst.current_message = 0;
    _inst.has_choices = true;
    _inst.choices = _choices;
    _inst.choice_selected = 0;
    _inst.show_choices = false;
}

//colors sa names sa npcs
char_colors = {
    "Tommy" : c_blue,
    "Frog" : c_lime,
    "Chan" : c_orange,
    "Barney" : c_teal,
    "Dayan" : c_purple,
    "Chim" : c_fuchsia,
    "Ghost Frog" : c_white,
    "Ancient Frog" : c_yellow
}

welcome_dialog = [
{
    name: "Tommy",
    msg: "I like flies."
},

{
    name: "Frog",
    msg: "How ya doing?"
},

{
    name: "Tommy",
    msg: "FROG. I AM A FROG!"
},

{
    name: "Frog",
    msg: "Oh, um- "
},

{
    name: "Tommy",
    msg: "I am a frog, doing frogs things!"
},
] 

chan_diag1 = [
{
    name: "Chan",
    msg: "I love this place!"
},

{
    name: "Chan",
    msg: "I would never ever leave this place."
},
]

barney_diag1 = [
{
    name: "Barney",
    msg: "frog."
},

{
    name: "Barney",
    msg: "Ever though what is it like outside. Is there even an outside?"
},
]

dayan_diag1 = [
{
    name: "Dayan",
    msg: "They say not to venture out this place."
},

{
    name: "Dayan",
    msg: "It is dangerous out there."
},
]

chim_diag1 = [
{
    name: "Chim",
    msg: "Path less taken."
},

{
    name: "Chim",
    msg: "..."
},
]

ghost_diag1 = [
{
    name: "Ghost Frog",
    msg: "You have climbed far... farther than most with legs of flesh."
},
{
    name: "Ghost Frog",
    msg: "This hole... it is not just a tunnel."
},
{
    name: "Ghost Frog",
    msg: "It is where I left pieces of myself behind."
},
{
    name: "Ghost Frog",   
    msg: "Three fragments... small sparks of what I used to be."
},
{
    name: "Ghost Frog",
    msg: "If you gather them... the maze will recognize you."
},
{
    name: "Ghost Frog",
    msg: "Step forward, the path less taken awaits."
}
]

ancient_frog_diag1 = [
{
    name: "Ancient Frog",
    msg: "Greetings, young warrior. You have proven yourself worthy by defeating the guardian."
},
{
    name: "Ancient Frog",
    msg: "But your journey is far from over. Ahead lies a path less taken, filled with greater challenges."
},
{
    name: "Ancient Frog",
    msg: "Many have turned back, fearing what lies beyond. Few have the courage to continue."
},
{
    name: "Ancient Frog",
    msg: "Tell me, brave one... Will you take the path less taken?"
}
]

// Choices for Ancient Frog
ancient_frog_choices = [
{
    text: "Yes, I will continue the journey",
    callback: function() {
        global.player_choice = "continue";
        with (obj_ancient_frog) { alarm[0] = 60; }
    }
},
{
    text: "No, I need more time to prepare",
    callback: function() {
        global.player_choice = "turn_back";
        with (obj_ancient_frog) { alarm[1] = 60; }
    }
}
]

// Follow-up dialogues based on choice
ancient_frog_continue = [
{
    name: "Ancient Frog",
    msg: "Your courage is admirable. May fortune favor the bold."
},
{
    name: "Ancient Frog",
    msg: "The path ahead will test you. Good luck, brave warrior."
}
]

ancient_frog_turnback = [
{
    name: "Ancient Frog",
    msg: "There is wisdom in knowing your limits."
},
{
    name: "Ancient Frog",
    msg: "Perhaps the path will await you another time."
}
]