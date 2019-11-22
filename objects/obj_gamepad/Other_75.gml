/// @description Detect Gamepads

// Debug code so you can see which event has been
// triggered and the pad associated with it.
show_debug_message("Event = " + async_load[? "event_type"]);
show_debug_message("Pad = " + string(async_load[? "pad_index"]));

// Parse the async_load map to see which event has been triggered

//Gampad index
var i = 0;

switch(async_load[? "event_type"])
{
// A game pad has been discovered
case "gamepad discovered":
  // Get the pad index value from the async_load map
  var pad = async_load[? "pad_index"];
  // Set the "deadzone" for the axis
  gamepad_set_axis_deadzone(pad, 0.2);
  // Set the "threshold" for the triggers
  gamepad_set_button_threshold(pad, 0.1);
  // Store the pad index number in order
  global.gamepad[i] = pad;
  
  show_debug_message("Pad attached");
  break;
// Gamepad has been removed or otherwise disabled
case "gamepad lost":
  // Get the pad index
  var pad = async_load[? "pad_index"];
  // Check for a player instance associated with the pad and remove it
  global.gamepad[pad] = noone;
    show_debug_message("Pad detached");
  break;
  
 ++i;
}