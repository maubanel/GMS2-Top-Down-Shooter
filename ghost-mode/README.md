<img src="https://via.placeholder.com/1000x4/45D7CA/45D7CA" alt="drawing" height="4px"/>

### Ghost Mode

<sub>[previous](../player-damage/README.md#user-content-player-taking-damage) • [home](../README.md#user-content-gms2-top-down-shooter) • [next](../audio/README.md#user-content-audio)</sub>

<img src="https://via.placeholder.com/1000x4/45D7CA/45D7CA" alt="drawing" height="4px"/>

Now we want the plane when it runs out of health to go into ghost mode which is:

* Destroy player plane
* Animate new transluscent ghost plane offscreen bottom center
* Move ghost plane upwards
* Do not take damage, do not take player control
* After returning to starting point make player solid and give control back to gameplayer and give the plane 100% health again.

<br>

---


##### `Step 1.`\|`SPCRK`|:small_blue_diamond:

Now to do this we will need to create a finite state machine. What is a finite state machine? It is the logical state of any object. So a door can have 4 states. It can be closed, open (to more or less of a degree) or is in the act of opening or closing. Our **obj_player** will have two states: *Active In Game*vand *Out of Life Ghost Mode*.

	
For a very simple state machine, Create a new **object** for each state. We already have a **obj_player** for the *Active In Game* state. *Create* a new **Game Object**, then bind `spr_player` sprite to it and call it `obj_ghost_player`.

![New object with spr_player attached called obj_ghost_player](images/ObjGhostPlayer.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 2.`\|`FHIU`|:small_blue_diamond: :small_blue_diamond: 

We need to switch the **obj_player** game object to **obj_ghost_player** when player health is less or equal to zero. GameMaker provides a function to do this for us called **[instance_change(obj, perf)](https://manual.yoyogames.com/GameMaker_Language/GML_Reference/Asset_Management/Instances/instance_change.htm)**.
	 
The **obj** argument is the object you want to turn into and the **perf** parameter is whether to perform that new object's create and destroy events (true) or not (false).
	
We need to add to the **obj_player: Step** event script to switch the game object to **ObjGhostPlayer**. Add at the bottom logic to check for zero health.

![Switch to ghost player when player dies in obj_player step event](images/GhostModeFromPlayerWithoutHealth.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 3.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game. Get shot on purpose and get your health to 0.  Woops, another run time error.  In this case it is the health bar that can't find the player object.

![game controller crashes when playing as hud can't access player health](images/ErrorSwitchingToGhost.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 4.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Open **obj_game_controller: Draw | Draw GUI** event and we need to remove the reference to **obj_player.player_health** from the draw_healthbar() function.  Lets instead create a local variable hud_health and then reference the player only if it exists in the room (otherwise there is no plane so the health is 0):

![Add a loop that repeats 5 times and adds one to a variable](images/CheckPlayerExistsDrawGui.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 5.`\|`SPCRK`| :small_orange_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game. Get shot on purpose and get your health to 0.  Woops, yet another run time error.  It is in both the shooting and targeting player when it is checking to see if it is above it.

![Run game again, now there is a run time error on the shooting and targeting players who can't find the player"](images/SecondRunTimeErrorInShootingTargetEnemy.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 6.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond:

Open **obj_enemy_target: Step** event and we need to check if the player exists before firing a bullet.

![In enemy target check that player exists before shooting](images/CheckIfPlayerExistsBeforeShootingAtItTarget.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 7.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond:

Repeat for **obj_enemy_shoot: Step**  vent and we need to check if the player exists before firing a bullet.

![In enemy shoot check that player exists before shooting](images/CheckIfPlayerExistsBeforeShootingAtItShoot.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 8.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game. The player switches from **obj_player** to **obj_ghost_player**. This new ghost player cannot be controlled which is what we want!

![Play game and player switches and can't be controlled, this can only be seen in the debugger](images/ChangeFromPlayerToGhost.gif)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 9.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Open up **obj_ghost_player**. Press the <kbd>Add Event</kbd> and select a **Create** event. Put the player in the center horizontally off screen vertically.

![Add a create event and position center off bottom of screen](images/SendPlayerOffScreenGhostPlayerCreate.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 10.`\|`SPCRK`| :large_blue_diamond:

Look at **obj_game_controller: Create** event and look at where the game spawns the player at the beginning.  We want to move it to this same spot before switching from ghost back to game mode.

![Check out where we want to move plane back towards](images/XandYTarget.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 11.`\|`SPCRK`| :large_blue_diamond: :small_blue_diamond: 

![alt_text](images/.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>


##### `Step 12.`\|`SPCRK`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond: 

![alt_text](images/.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 13.`\|`SPCRK`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond:  :small_blue_diamond: 

![alt_text](images/.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 14.`\|`SPCRK`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:  :small_blue_diamond: 

![alt_text](images/.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 15.`\|`SPCRK`| :large_blue_diamond: :small_orange_diamond: 

![alt_text](images/.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 16.`\|`SPCRK`| :large_blue_diamond: :small_orange_diamond:   :small_blue_diamond: 

![alt_text](images/.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 17.`\|`SPCRK`| :large_blue_diamond: :small_orange_diamond: :small_blue_diamond: :small_blue_diamond:

![alt_text](images/.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 18.`\|`SPCRK`| :large_blue_diamond: :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

![alt_text](images/.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 19.`\|`SPCRK`| :large_blue_diamond: :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

![alt_text](images/.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 20.`\|`SPCRK`| :large_blue_diamond: :large_blue_diamond:

![alt_text](images/.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 21.`\|`SPCRK`| :large_blue_diamond: :large_blue_diamond: :small_blue_diamond:

![alt_text](images/.png)

___


<img src="https://via.placeholder.com/1000x4/dba81a/dba81a" alt="drawing" height="4px" alt = ""/>

<img src="https://via.placeholder.com/1000x100/45D7CA/000000/?text=Next Up - Audio">

<img src="https://via.placeholder.com/1000x4/dba81a/dba81a" alt="drawing" height="4px" alt = ""/>

| [previous](../player-damage/README.md#user-content-player-taking-damage)| [home](../README.md#user-content-gms2-top-down-shooter) | [next](../audio/README.md#user-content-audio)|
|---|---|---|
