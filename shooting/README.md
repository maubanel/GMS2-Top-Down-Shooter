<img src="https://via.placeholder.com/1000x4/45D7CA/45D7CA" alt="drawing" height="4px"/>

### Shooting

<sub>[previous](../basic-timelines/README.md#user-content-basic-enemy-and-timelines) • [home](../README.md#user-content-gms2-top-down-shooter) • [next](../shooting-enemies/README.md#user-content-shooting-enemies)</sub>

<img src="https://via.placeholder.com/1000x4/45D7CA/45D7CA" alt="drawing" height="4px"/>

Now there is not much to do without the ability for the player to shoot an enemy.  Lets add this.

<br>

---


##### `Step 1.`\|`SPCRK`|:small_blue_diamond:

Now we should add shooting and collision between bullets and enemies. Download a bullet sprite [spr_player_bullet.png](../Assets/Sprites/spr_player_bullet.png). Create a new **Sprite**, press the **Import** button and add the downloaded file.

Call it `spr_player_bullet` and change the **Origin** to `Bottom Center`.  We want the bullet to spawn at the front of the plane so it is best to have the origin at the bottom of the sprite so it spawns in front of the plane.

![Add spr_play_bullet and adjust origin to bottom center](images/SprPlayerBullet.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 2.`\|`FHIU`|:small_blue_diamond: :small_blue_diamond: 

Create a new **Game Object** and call it `obj_player_bullet`. *Assign* the `spr_player_bullet` to the new object.

![Add obj_player_bullet and bind spr_player_bullet to it](images/ObjPlayerBullet.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 3.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond:
Press the <kbd>Add Event</kbd> and select a **Create** event. Send the bullet upscreen fast!

![Add an obj_player_bullet: Create event and add some script](images/PlayerBulletCreateEvent.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 4.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Open **rm_lvl_1** and add a new **Instance Layer** to the room and call it `Bullets` and place it between **Instance_Player** and **Islands**.

![Add instance layer Bullets to rm_lvl_1](images/AddBulletLayerRm.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 5.`\|`SPCRK`| :small_orange_diamond:

Open the **obj_player: Create** event script for **obj_player** and add the rate of fire for the bullets.  We also want to add a speed relative to room speed (3 times a second) and a variable called cooldown that will be used to limit how often you can fire a bullet (simulate the time for a new bullet to be loaded in the chamber).

![Add an obj_player Create event and set a speed for it in script](images/PllayerShootingCreate.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 6.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond:

Open the **Step Event** Script for **obj_player** and *add* to the bottom of the script.  First we check if either the space bar or the right shoulder button on the gamepad was pressed and if the cooldown is still valid (set to 1/3 of a second each time the fire is pressed).

We will add an offset horizontally to the bullet or it looks like it fires behind the plane as opposed to outside of its turret as it is hidden during the first frame beneath the plane.  Offsetting it one player moves has it catch up to current frame. When the button fires we set the rate_of_fire.  After that we just subtract the cooldown by 1 so that the bullet will become available again in a third of a second.

![Add firing bullet spawning logic to obj_player step event](images/AddShottingToStep.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 7.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Debug</kbd> button in the top menu bar to launch the game in debug mode (right to the left of the regular run game button). Check the Instances tab below. Notice that the plane fires bullets every time you press the space bar.  Notice that the bullets just keep adding up and are never destroyed.

![Play game and press the space bar to fire bullets.  Notice that the bullets are fired but never destroyed.](images/BulletsFlyAndDontGetDestroyed.gif)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 8.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

![alt_text](images/.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 9.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

![alt_text](images/.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 10.`\|`SPCRK`| :large_blue_diamond:

![alt_text](images/.png)

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

<img src="https://via.placeholder.com/1000x100/45D7CA/000000/?text=Next Up - Shooting Enemies">

<img src="https://via.placeholder.com/1000x4/dba81a/dba81a" alt="drawing" height="4px" alt = ""/>

| [previous](../basic-timelines/README.md#user-content-basic-enemy-and-timelines)| [home](../README.md#user-content-gms2-top-down-shooter) | [next](../shooting-enemies/README.md#user-content-shooting-enemies)|
|---|---|---|
