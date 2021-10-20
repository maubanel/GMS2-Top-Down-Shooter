# GMS2 UE4 Top Down Shooter


<!-- OVERVIEW -->
This tutorial is intended for those wanting an introduction to <i>GameMaker Studio 2</i> using their scrpting language <i>GML</i>. This assumes no prior knowledge of the software or scripting. 

This tutorial is a a simplified version of the arcade game **1942**.  It is NOT a complete game but a scaffolding that allows you to complete the game on your own.  It uses GML programming language.  It would be useful if you have completed a previous tutorial such as [GMS2-First-Look](https://github.com/maubanel/GMS2-First_Look), [YoYo Games Space Rocks GML](https://marketplace.yoyogames.com/assets/7423/space-rocks-gml) and [GMS2-Space-Rocks-Extended](https://github.com/maubanel/GMS2-Space-Rocks-Extended/blob/master/README.md) prior to starting the top down shooter.

All artwork needed for the game is supplied in this tutorial.  There is a folder called datafiles/TutorialResources/Sprites and a folder called datafiles/TutorialResources/Sounds that include all the assets that you need (except for one song that the tutorial asks you to find for yourself).

In this walk through we will be working on:

* Importing ship animation
* Moving ship with keyboard
* Moving ship with gamepad
* Scrolling water background
* Scrolling islands background
* Setting up enemy parent
* Regular, shooting and targeting enemy planes
* Player health
* Player damage
* Ghost mode
* Audio
* Front End

* Tested on GameMake Studio2.3.5.589
* [GitHub Account](https://github.com) (free)
* [GitHub Desktop](https://desktop.github.com)

<br>


<!-- TOC -->
## Table of Contents

<kbd></kbd> &nbsp;&nbsp; [Setting Up](setting-up/README.md#user-content-setting-up) <br>
<kbd></kbd> &nbsp;&nbsp; [Getting Ship in Room](ship-room/README.md#user-content-getting-ship-in-room) <br>


<!-- LICENSE -->
## License
Distributed under the MIT License. See `LICENSE` for more information: [link](LICENSE).

## Keyboard Controls
* Left, Right, Up and Down Arrow moves player in 4 directions
* Space bar shoots and starts game

## Gamepad Controls
* Left analog stick moves player
* Right trigger shoots
* Start button begins the game

## Programming Concepts

The following programming concepts are raised in the Top Down Shooter walk through. These follow concepts introduced in [GMS2-First-Look](https://github.com/maubanel/GMS2-First_Look) and [GMS2-Space-Rocks-Extended](https://github.com/maubanel/GMS2-Space-Rocks-Extended/blob/master/README.md). Here are the new GameMaker programming concepts that are introduced in this third walk through.

| Programming Concept                                 | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Example                                                                                                                                                                                                                                             |
|-----------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| dynamic arrays                                    | A dynamic array allows us to store a list of objects as opposed to a single value.  The array can grow and shrink at run-time and memory will ge allocated by the engine.  There are one dimensional and two dimensional arrays available.  An array starts with a variable name such as `cards` and is followed by square brackets `cards[0]` with the index to the array entry as an integer.  So `[0]` would be the first card and `[51]` (52nd card) would be the last in a standard deck of cards. The other advantages of arrays is that they can be altered in scripts without being returned one at a time.  This can allow for more complex scripts that make multiple adjustments and acts as a pass by reference for the array.  More information can be found in the [GameMaker Manual](https://docs.yoyogames.com/source/dadiospice/002_reference/001_gml%20language%20overview/401_06_arrays.html).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | for&#160;(var&#160;i=0;&#160;i<10;&#160;++i)<br>{<br>&#160;&#160;&#160;numbers[i]&#160;=&#160;i&#160;*&#160;10;<br>} |

## GameMaker Resources

On the right hand side of the game editor you have a list of all resources that can be added to the game.  Here are the new GameMaker resources that are introduced in this third walk through.

| GameMaker Resources | Description                                                                                                                                                                                                                                                                                                                                                 |
|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Timeline              | Timelines work in a similar way to alarms but are not limited to 12 events.  This is perfect for spawning enemies over the course of a level. This allows us the ability to escalate difficulty by adjusting how many enemies we spawn at what point of time in the level.  In this game, we are on rails (the player does not control the speed they are moving through the level) so the escalation is driven by the spawning of enemies in the timeline.  More information can be foud in the [GameMaker Manual](https://docs.yoyogames.com/source/dadiospice/001_advanced%20use/005_time%20lines.html) as well as [timeline functions and variables](https://docs.yoyogames.com/source/dadiospice/002_reference/timelines/index.html)



## GameMaker Built in Functions

These are the functions that GameMaker provides that we used in this exercise. Here are the new GameMaker built in functions that are introduced in this third walk through.

| Built In Functions                    | Description&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | Example                                                        |
|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| audio_sound_pitch(sound,pitch)       | This function allows us to adjust the pitch of the audio from its default state.  You pass it a single instance of the sound to affect an instance value **or** the name of the sound to affect all versions of it being played.  For the `pitch` argument, a value under `1` lowers the pitch and a value above `1` raises the pitch.  A value of `1` plays the pitch at the recorded value.  Use small increments as this makes fairly large changes in the audio and you can easily shift it outside the audible range. Changing the pitch also changes the duration of the audio being played back.     |  <pre>audio_sound_pitch (snd_explosion, choose(.8, .9, 1, 1.1, 1.2));</pre> |    | audio_sound_pitch(snd_explosion, choose(.8, .9, 1, 1.1, 1.2)); |
| audio_sound_gain(sound,volume,time) | This function allows us to adjust the gain (volume) of the sound over time.  You pass it a single instance of the sound to affect an instance value **or** the name of the sound to affect all versions of it being played. The `volume` argument is the loudness of the sound.  `0` would be completely silent, and `1` would be the original volume of the recording.  The `time` argument allows fading in or fading out thsi sound over time in milliseconds.  So to have the change occur immediately you would pass a `0` for time and it you wanted it over 3 seconds you would pass it a value of `3000` ms.                                      | <pre>audio_sound_gain(snd_explosion, choose(.6, .7, .8, .9, 1), 0));</pre>| | audio_sound_gain(snd_explosion, choose(.6, .7, .8, .9, 1), 0); |
| event_inherited()                     | Each game object has a single set of events available to it like the `step` or `create` event.  But when you inherit from a parent object you also get those parent objects event scripts.  To call the parents script and add specific children behavior that child object needs to call event inherited.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | <pre>//parent_enemy create event<br>health = 1000;<br>ammo = 10;<br><br>// obj child_enemy create event<br>// gets health and ammo value of parent<br>event_inherited();<br><br>// changes the amount of ammo in the child enemy<br>ammo = 20; </pre>|
|instance_create_layer(x,y,layer_id,obj) |This function creates a new object on the passed layer and returns the instance it has created.  This way you can use this return value to manipulate the single instance of the variable that is created by dot referencing the instance's variable name. |<pre>bullet = instance_create_layer(100, 200, "Instances", obj_bullet);<br>bullet.direction = image_angle;</pre> |
|point_direction (x1, y1, x2, y2)|This function converts a vector in room space from cartesian to a polar angle in degrees. You pass it two points and it returns the angle between the points|<pre>point_direction(obj_player.x, obj_player.y, obj_e.x, obj_y.x);</pre>|
|game_restart()|This function restarts the game from the very beginning.|<pre>if (lives <= 0) game_restart()</pre> |
|layer_vspeed(layer, speed) | You can use this function to set the vertical speed in pixels per step for the layer passed as a string.|`layer_vspeed("instance", 3);`|
|draw_healthbar(x1, y1, x2, y2, amount, backcol, mincol, maxcol, direction, showback, showborder);|This function should be placed in a draw event.  You pass it`x1`, `y1` the top left corner of the health bar and the `x2`, `y2` the bottom right hand corner of the health bar. You then pass it the `amount` which is the `health` variable you are using.  You set the `backcolor` to a color for the background, `mincol` for a color when you are low on health (typically `c_red`) and `maxcol` for when you are healthy (typically `c_lime`).  You give it a direction with `0` degrees being from left to right.  You pass it a boolean to show the background with `showback` and/or show a `border`.|<pre>// Draw Player 1 health bar<br>draw_healthbar(30, 30, 300, 60, hud_health, c_gray, c_red, c_green, 0, true, true);</pre>|
|draw_sprite_ext(sprite, subimg, x, y, xscale, yscale, rot, colour, alpha) |This function draws the `sprite` passed with the image_index passed as `subimg`. You then place it in world space passing it an `x` and `y` coordinate.  A scale is given for the x and y axis with `xscale` and `yscale`.  You can pass a rotation in degrees called `rot`, a `colour` and a number between `0` and `1` to represent the alpha and how opaque the sprite is|<pre>// draw small version of player sprites for lives<br>draw_sprite_ext(spr_player, 0, 360 + space, 45, .4, .4, true, c_white, 1);</pre>|
|distance_to_point(x, y)|This function returns the distance in pixels between the calling object and the `x` and `y` values passed|<pre>// returns distance between enemy and player from the player<br>dis = distance_to_point(obj_enemy.x, obj_enemy.y);</pre>|
|place_meeting(x, y, obj)|This function is a collision detection call between the calling object and another object in a given `x` and `y` position.  This returns `true` or `false` depending on whether a collision occurs|<pre>if (place_meeting(obj_player.x, obj_player.y, obj_enemy)<br>{<br>   do something...<br>}</pre>|
|instance_change(obj, perf)|This function changes the calling object to a new object passed as `obj`.  You set `perf` to true if you want to perform the new object's create and destroy events.|<pre>if (health<0)<br>instance_change(obj_ghost, true);</pre>|
|gamepad_axis_valuegamepad_axis_value(device, axisIndex)|This function returns a value between `-1` and `1` based on the axis of a joystick on the controller.  The `device` is the gamepad slot to check and `axisIndex` is which joystick to check|<pre>x_axis = gamepad_axis_value(global.gamepad[0], gp_axislh);</pre>|
|gamepad_button_value(device, button)|With this function you can get the current value of an analogue button, from 0 to 1, where `0` is no pressure and `1` is full pressure. The `device` is the gamepad slot to check and the `button` is the analogue button to check.|<pre>shoot = gamepad_button_check_pressed(global.gamepad[0], gp_shoulderrb));</pre>|

## Built in Object Variables

GameMaker objects all share common built in variables. Here are the ones that are important to this exercise. Here are the new Built-In Variables that are introduced in this third walk through.

| Built in Object Variables                    | Description&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; | Example   | 
|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
|timeline_index|This variable holds the index of the time line currently associated with the instance of the object.  You can use the name of the timeline that is in your asset folder |<pre>timeline_index = tml_lvl1;</pre>|
|timeline_running|Timelines default to `false` and do not run at playtime.  The timeline variable needs to be set to `true` for the timeline to run|<pre>// Start timeline<br>timeline_running = true;</pre>|
|timeline_position|This variable holds which frame the timeline is currently at.  You can change this dynamically in code as needed|<pre>if (health <= 0)<br>// reset timeline to begining<br>{<br>    timeline_position = 0;<br>}</pre>|
|delta_time|This variable changes each frame and holds a real number in microseconds since the last frame rendered.  To get this value in milliseconds (ms) you need to divide it by `1,000,000`.|<pre>var tick = delta_time / 1000000;</pre>|

## Algorythms

### vectors players velocity

### stopping repetitive audio

### parent child relationship

### rate of fire/timer not using alarms

### finite state machine

### explain place_meeting and two other collision detection functions

### clamping for bounds simplest for, of collision detection

### benefits of using actual seconds over steps

### controller bias in this scheme

### sinewave trig

gamemaker assets
timeline

## provided objects
obj_gamepad() adds up to 4 controllers to game.  Place this object in the very first room and make it `persistent`.  This way the controllers will be with the engine for the entire game.  You can access the controllers in `global.gamepad[0]`, `global.gamepad[1]`, `global.gamepad[2]` and `global.gamepad[3]`

replace diagonals with clamping speed


(5, 50)&#8226;-------> &#8226;(15, 50)