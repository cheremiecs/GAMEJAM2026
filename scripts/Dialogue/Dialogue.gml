function create_dialog(_messages){
    if (instance_exists(obj_dialogue)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialogue);
    _inst.messages = _messages;
    _inst.current_message = 0; 
}

//colors sa names sa npcs
char_colors = {
    "Tommy" : c_blue,
    "Frog" : c_lime,
    "Chan" : c_orange,
    "Barney" : c_teal,
    "Dayan" : c_purple,
    "Chim" : c_fuchsia,
    "Ghost Frog" : c_white
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
    msg: "Moo."
},
]

dayan_diag1 = [
{
    name: "Dayan",
    msg: "HIYAAAAAA!"
},

{
    name: "Dayan",
    msg: "..."
},
]

chim_diag1 = [
{
    name: "Chim",
    msg: "Kontol is not real."
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