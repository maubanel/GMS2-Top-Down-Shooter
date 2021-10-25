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

Now lets destroy the bullet if it leaves the room. We don't want the game to run out of memory because we have too many bullets. Add a **Other | Outside Room** event on **obj_bullet**:

![Destroy bullet when it leaves room in obj_bullet outside room even](images/DestroyPlayerBulletLeaveRoom.gif)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 9.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Debug</kbd> button in the top menu bar to launch the game in debug mode. See how the bullets get destroyed once they leave the room.

![Run game in debug mode and notice that bullets are now destroyed](images/BulletsFireAndGetDestroyed.gif)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 10.`\|`SPCRK`| :large_blue_diamond:

Now lets deal with the bullet enemy collision. Create a new **Collision Event** script in **obj_bullet** with a **Collision | obj_enemy_parent**.  We collide with the parent as it allows us to get an event with one object as all the enemies inherit from the same parent.  This avoids having to check individually for the plane types.
	
We destroy the bullet itself and use with (other) to access the object that the bullet is colliding with.

```
/// @description All Enemies hit by bullet


// Destroy bullet
instance_destroy();

// Destroy enemy
with (other)
{
	instance_destroy();
}
```

![Destroy objects when bullets and enemies collide](images/enemyBulletCollision.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 11.`\|`SPCRK`| :large_blue_diamond: :small_blue_diamond: 

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game.  Fire away at the planes and you should destroy them (and the bullets):

![Run game and you should see the rock and bullet disappear](images/BulletKillsPlane.gif)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>


##### `Step 12.`\|`SPCRK`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond: 

Lets add some visual fluff and add an explosion animation. Download [spr_enemy_explosion_sprite_sheet.png](../Assets/Sprites/spr_enemy_explosion_sprite_sheet.png). *Create* a new **Sprite** and and call it `spr_enemy_explosion`. Click on the <kbd>Edit Image</kbd> button.

Since this is 5 frames long, I didn't provide separate files. I provided them in a single animation sheet or strip. This means you can import a longer sequence from one file. In this case each frame is **128 x 128** pixels and they are on a single row. To import this we need to click on the Image menu item at the top and select Import Strip Image.

This brings up the **Convert to Frames** menu. In this menu we select the size of each individual frame, how many there are and whether there are any offsets or margins.

Now I know there are **5** frames and they are in a single row. So I select `5` for **Number of Frames** and `5` for **Frames per Row**. Now you can see the default size is 32 x 32 and they show where the five frames line up in the artwork with white boxes. Change it to `128` and `128`.

Press the <kbd>Convert</kbd> button then select <kbd>Yes</kbd> to confirm that you will be replacing the frames.  Change the framerate to `12`.


![Add explosion animaton frames by setting size to 128 by 128, 5 frames per row and total number of frames](images/SprEnemyExplosion.gif)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 13.`\|`SPCRK`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond:  :small_blue_diamond: 

*Name* the sprite `spr_enemy_explosion`. Adjust its origin to Middle Center.

![Name sprite spr_enemy_explosion and adjust origin to middle center](images/SprEnemyExplosion.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 14.`\|`SPCRK`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:  :small_blue_diamond: 

Create a new **Game Object** called `obj_enemy_explosion` and bind the explosion animation you just imported.

![Create a new object called obj_enemy_explosion and bind spr_enemy_explosion](images/ObjEnemyExplosion.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 15.`\|`SPCRK`| :large_blue_diamond: :small_orange_diamond: 

Now we will trigger the explosion animation in a collision event between the **obj_bullet** and the **obj_enemy_parent**. Why the parent? This way any enemy that inherits from **obj_enemy_parent** will trigger this event, which is exactly what we want with three types of planes. This avoids us having to create three separate collision events. Open the **obj_player_bullet: Collision | obj_enemy_parent** event script and add the new animation.

![Add a obj_player_bullet collision script with enemy parent and destroy objects](images/ObjEnemyParentAddExplosion.png)

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
