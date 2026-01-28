// Collect fragment
global.fragments_collected++;

// Create notification
var _notif = instance_create_depth(0, 0, -11000, obj_fragment_notification);
_notif.fragment_count = global.fragments_collected;
_notif.fragment_total = global.fragments_needed;

// Destroy fragment
instance_destroy();