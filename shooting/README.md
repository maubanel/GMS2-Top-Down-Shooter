![](../images/line3.png)

### Shooting

<sub>[previous](../basic-timelines/README.md#user-content-basic-enemy-and-timelines) • [home](../README.md#user-content-gms2-top-down-shooter) • [next](../shooting-enemies/README.md#user-content-shooting-enemies)</sub>

![](../images/line3.png)

Now there is not much to do without the ability for the player to shoot an enemy.  Lets add this.

<br>

---


##### `Step 1.`\|`TDS`|:small_blue_diamond:

Open up **P4v**.  Select the top folder of the **GameMaker** project. Press the <kbd>Checkout</kbd> button.  Checkout out all files in P4V so that they are all writable (otherwise they will be read only and none of the changes will be saved). Select a **New** changelist and add a message describing the unit of work you will be performing. Press the <kbd>OK</kbd> button.

Open up the project you are working on in **GameMaker**. 

![checkout files and create new changelist](images/checkoutFiles.png)

![](../images/line2.png)

##### `Step 2.`\|`TDS`|:small_blue_diamond: :small_blue_diamond: 

Now we should add shooting and collision between bullets and enemies. Download a bullet sprite [spr_player_bullet.png](../Assets/Sprites/spr_player_bullet.png). Create a new **Sprite**, press the **Import** button and add the downloaded file.

Call it `spr_player_bullet` and change the **Origin** to `Middle Left`.  We want the bullet to spawn at the front of the plane so it is best to have the origin at the bottom of the sprite so it spawns in front of the plane.

![Add spr_play_bullet and adjust origin to bottom center](images/SprPlayerBullet.png)

![](../images/line2.png)

##### `Step 3.`\|`TDS`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Create a new **Game Object** and call it `obj_player_bullet`. *Assign* the `spr_player_bullet` to the new object.

![Add obj_player_bullet and bind spr_player_bullet to it](images/ObjPlayerBullet.png)

![](../images/line2.png)

##### `Step 4.`\|`TDS`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Press the <kbd>Add Event</kbd> and select a **Create** event. Send the bullet upscreen quickly.  Rotate the bullet so it points up. 

![Add an obj_player_bullet: Create event and add some script](images/PlayerBulletCreateEvent.png)

![](../images/line2.png)

##### `Step 5.`\|`TDS`| :small_orange_diamond:

Open **rm_lvl_1** and add a new **Instance Layer** to the room and call it `Bullets` and place it between **Instance_Player** and **Game**.

![Add instance layer Bullets to rm_lvl_1](images/AddBulletLayerRm.png)

![](../images/line2.png)

##### `Step 6.`\|`TDS`| :small_orange_diamond: :small_blue_diamond:

Open the **obj_player: Create** event script for **obj_player** and add the rate of fire for the bullets.  We also want to add a speed relative to room spesed (3 times a second) and a variable called cooldown that will be used to limit how often you can fire a bullet (simulate the time for a new bullet to be loaded in the chamber).

![Add an obj_player Create event and set a speed for it in script](images/PllayerShootingCreate.png)

![](../images/line2.png)

##### `Step 7.`\|`TDS`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond:

Open the **Step Event** Script for **obj_player** and *add* to the bottom of the script.  First we check if either the space bar or the right shoulder button on the gamepad was pressed and if the cooldown is still valid (set to 1/3 of a second each time the fire is pressed).

We will add an offset horizontally to the bullet or it looks like it fires behind the plane as opposed to outside of its turret as it is hidden during the first frame beneath the plane.  Offsetting it one player moves has it catch up to current frame. When the button fires we set the rate_of_fire.  After that we just subtract the cooldown by 1 so that the bullet will become available again in a third of a second.

![Add firing bullet spawning logic to obj_player step event](images/AddShottingToStep.png)

![](../images/line2.png)

##### `Step 8.`\|`TDS`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Debug</kbd> button in the top menu bar to launch the game in debug mode (right to the left of the regular run game button). Check the Instances tab below. Notice that the plane fires bullets every time you press the space bar.  Notice that the bullets just keep adding up and are never destroyed.

![Play game and press the space bar to fire bullets.  Notice that the bullets are fired but never destroyed.](images/BulletsFlyAndDontGetDestroyed.gif)

![](../images/line2.png)

##### `Step 9.`\|`TDS`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now lets destroy the bullet if it leaves the room. We don't want the game to run out of memory because we have too many bullets. Add a **Other | Outside Room** event on **obj_bullet**:

![Destroy bullet when it leaves room in obj_bullet outside room even](images/DestroyPlayerBulletLeaveRoom.gif)

![](../images/line2.png)

##### `Step 10.`\|`TDS`| :large_blue_diamond:

Now *press* the <kbd>Debug</kbd> button in the top menu bar to launch the game in debug mode. See how the bullets get destroyed once they leave the room.

![Run game in debug mode and notice that bullets are now destroyed](images/BulletsFireAndGetDestroyed.gif)

![](../images/line2.png)

##### `Step 11.`\|`TDS`| :large_blue_diamond: :small_blue_diamond: 

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

![](../images/line2.png)

##### `Step 12.`\|`TDS`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond: 

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game.  Fire away at the planes and you should destroy them (and the bullets):

![Run game and you should see the rock and bullet disappear](images/BulletKillsPlane.gif)

![](../images/line2.png)

##### `Step 13.`\|`TDS`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond:  :small_blue_diamond: 

Lets add some visual fluff and add an explosion animation. Download [spr_enemy_explosion_sprite_sheet.png](../Assets/Sprites/spr_enemy_explosion_sprite_sheet.png). *Create* a new **Sprite** and and call it `spr_enemy_explosion`. Click on the <kbd>Edit Image</kbd> button.

Since this is 5 frames long, I didn't provide separate files. I provided them in a single animation sheet or strip. This means you can import a longer sequence from one file. In this case each frame is **128 x 128** pixels and they are on a single row. To import this we need to click on the **Imag**e menu item at the top and select **Import Strip Image**.

This brings up the **Convert to Frames** menu. In this menu we select the size of each individual frame, how many there are and whether there are any offsets or margins.

Now I know there are **5** frames and they are in a single row. So I select `5` for **Number of Frames** and `5` for **Frames per Row**. Now you can see the default size is 32 x 32 and they show where the five frames line up in the artwork with white boxes. Change it to `128` and `128`.

Press the <kbd>Convert</kbd> button then select <kbd>Yes</kbd> to confirm that you will be replacing the frames.  Change the framerate to `12`.


![Add explosion animaton frames by setting size to 128 by 128, 5 frames per row and total number of frames](images/SprEnemyExplosion.gif)

![](../images/line2.png)

##### `Step 14.`\|`TDS`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:  :small_blue_diamond: 

*Name* the sprite `spr_enemy_explosion`. Adjust its origin to Middle Center.

![Name sprite spr_enemy_explosion and adjust origin to middle center](images/SprEnemyExplosion.png)

![](../images/line2.png)

##### `Step 15.`\|`TDS`| :large_blue_diamond: :small_orange_diamond: 

Create a new **Game Object** called `obj_enemy_explosion` and bind the explosion animation you just imported.

![Create a new object called obj_enemy_explosion and bind spr_enemy_explosion](images/ObjEnemyExplosion.png)

![](../images/line2.png)

##### `Step 16.`\|`TDS`| :large_blue_diamond: :small_orange_diamond:   :small_blue_diamond: 

Now we will trigger the explosion animation in a collision event between the **obj_bullet** and the **obj_enemy_parent**. Why the parent? This way any enemy that inherits from **obj_enemy_parent** will trigger this event, which is exactly what we want with three types of planes. This avoids us having to create three separate collision events. Open the **obj_player_bullet: Collision | obj_enemy_parent** event script and add the new animation.

![Add a obj_player_bullet collision script with enemy parent and destroy objects](images/ObjEnemyParentAddExplosion.png)

![](../images/line2.png)

##### `Step 17.`\|`TDS`| :large_blue_diamond: :small_orange_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game.  Fire away at the planes and see a cool explosion but they do not dissappear and loop endlessly!

![Play game and fire at planes.  Notice that explosions do not disappear](images/ShotPlaneExplosionDontDissapear.gif)

![](../images/line2.png)

##### `Step 18.`\|`TDS`| :large_blue_diamond: :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

There is an event that runs once an animation has finished playing.  That will be perfect for us a we only want the explosion animation to run once.  Open up **obj_enemy_explosion** and press the <kbd>Add Event</kbd> button and select **Other | Animation End** and destroy the object.

![Destroy animation object at end of animation](images/DestroyExplosionAfterPlaying.gif)

![](../images/line2.png)

##### `Step 19.`\|`TDS`| :large_blue_diamond: :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game.  Fire away at the planes and the explosions work correctly!

![Run game and fire at enemies and notice explosion only runs once](images/ExplosionGC.gif)

![](../images/line2.png)

##### `Step 20.`\|`TDS`| :large_blue_diamond: :large_blue_diamond:

Select the **File | Save Project**, then press **File | Quit** (PC) **Game Maker | Quit** on Mac to make sure everything in the game is saved.

![save then quit gamemaker](images/saveQuit.png)

![](../images/line2.png)

##### `Step 21.`\|`TDS`| :large_blue_diamond: :large_blue_diamond: :small_blue_diamond:

Open up **P4V**.  Select the top folder and press the **Add** button.  We want to add all the new files we created during this last session.  Add these files to the last change list you used at the begining of the session (in my case it was `Spaceship I portion of walkthrough`). Press the <kbd>OK</kbd> button.

![add new and changed files to p4v](images/add.png)

![](../images/line2.png)

##### `Step 22.`\|`TDS`| :large_blue_diamond: :large_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now you can submit the changelist by pressing both <kbd>Submit</kbd> buttons.

![submit changelist to p4v](images/submit.png)

![](../images/line.png)

<!-- <img src="https://via.placeholder.com/1000x100/45D7CA/000000/?text=Next Up - Shooting Enemies"> -->
![next up - shooting enemies](images/banner.png)

![](../images/line.png)

| [previous](../basic-timelines/README.md#user-content-basic-enemy-and-timelines)| [home](../README.md#user-content-gms2-top-down-shooter) | [next](../shooting-enemies/README.md#user-content-shooting-enemies)|
|---|---|---|
