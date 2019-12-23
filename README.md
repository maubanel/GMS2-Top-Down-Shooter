# GameMaker Studio 2 Top Down Shooter

## Introduction
This tutorial is a a simplified version of the arcade game **1942**.  It is NOT a complete game but a scaffolding that allows you to complete the game on your own.  It uses GML programming language.  It would be useful if you have completed a previous tutorial such as [GMS2-First-Look](https://github.com/maubanel/GMS2-First_Look), [YoYo Games Space Rocks GML](https://marketplace.yoyogames.com/assets/7423/space-rocks-gml) and [GMS2-Space-Rocks-Extended](https://github.com/maubanel/GMS2-Space-Rocks-Extended/blob/master/README.md) prior to workign in this tutorial.

All artwork needed for the game is supplied in this tutorial.  There is a folder called datafiles/TutorialResources/Sprites and a folder called datafiles/TutorialResources/Sounds that include all the assets that you need (except for one song that the tutorial asks you to find for yourself).

<br><br>
In this walk through:

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

|

## GameMaker Built in Functions

These are the functions that GameMaker provides that we used in this exercise. Here are the new GameMaker built in functions that are introduced in this third walk through.


<div style="width:290px">
<table>
<thead>
<tr>
<th>
Built In Functions
</th>
<th>
Description
</th> 
<th>
Example
</th>
</tr>
</thead>
          
<tbody>     
<tr>     
<td>
<sub>
<sup>
audio_sound_pitch (sound, pitch) 
</sup>
</sub>
</td>
<td>
This function allows us to adjust the pitch of the audio from its default state.  You pass it a single instance of the sound to affect an instance value **or** the name of the sound to affect all versions of it being played.  For the `pitch` argument, a value under `1` lowers the pitch and a value above `1` raises the pitch.  A value of `1` plays the pitch at the recorded value.  Use small increments as this makes fairly large changes in the audio and you can easily shift it outside the audible range. Changing the pitch also changes the duration of the audio being played back
</td>
<td>
<sub>
<sup>
<pre>
audio_sound_pitch
   (snd_explosion,
   choose(.8,1,1.2));
</pre>
</sup>
</sub>
</small>
</td>    
</tr>
<tr>
<td>
audio_sound_gain (sound, volume, time)
</td>
<td>
This function allows us to adjust the gain (volume) of the sound over time.  You pass it a single instance of the sound to affect an instance value **or** the name of the sound to affect all versions of it being played. The `volume` argument is the loudness of the sound.  `0` would be completely silent, and `1` would be the original volume of the recording.  The `time` argument allows fading in or fading out thsi sound over time in milliseconds.  So to have the change occur immediately you would pass a `0` for time and it you wanted it over 3 seconds you would pass it a value of `3000` ms.                                                                                                
</td>
<sub>
<sup>
<pre>
audio_sound_gain(snd_explosion, choose(.6, .7, .8, .9, 1), 0); 
</pre>
</sup>
</sub>
</tbody>   
</table>           
</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | audio_sound_pitch(snd_explosion, choose(.8, .9, 1, 1.1, 1Each game object has a single set of events available to it like the `step` or `create` event.  But when you inherit from a parent object you also get those parent objects event scripts.  To call the parents script and add specific children behavior that child object needs to call event inherited.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |<pre>//parent_enemy create event
    health = 1000;
    ammo = 10;
    
    // obj child_enemy create event
    // gets health and ammo value of parent
    event_inherited();
    
    ammo = 20; 
    // changes the amount of ammo in the child enemy</pre>|


event_inherited 
instance_exists?
instance_Create_layer returns instance
point_direction()?
game_restart()?
layer_vspeed()
draw_healthbar()
draw_sprite_ext
distance_to_point()
place_meeting
gamepad_axis_value
gamepad_button_value
instance_change


gms2 internal variables
timeline_index
timeline_runnung
timeline_position
delta_time

vectors players velocity
stopping repetitive audio
parent child relationship
rate of fire/timer not using alarms
finite state machine
explain place_meeting and two other collision detection functions
clamping for bounds simplest for, of collision detection
benefits of using actual seconds over steps
controller bias in this scheme
sinewave trig

gamemaker assets
timeline

provided objects
obj_gamepad() adds 4 controllers to game

replace diagonals with clamping speed


(5, 50)&#8226;-------> &#8226;(15, 50)
