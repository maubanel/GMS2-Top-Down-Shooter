![](../images/line3.png)

### Player Taking Damage

<sub>[previous](../player-health/README.md#user-content-player-health) • [home](../README.md#user-content-gms2-top-down-shooter) • [next](../ghost-mode/README.md#user-content-ghost-mode)</sub>

![](../images/line3.png)

Lets add the animation for the player getting hit by bullet and subtract points from its health. We will reuse the animation for the enemy getting hit. 

<br>

---


##### `Step 1.`\|`TDS`|:small_blue_diamond:

Open up **P4v**.  Select the top folder of the **GameMaker** project. Press the <kbd>Checkout</kbd> button.  Checkout out all files in P4V so that they are all writable (otherwise they will be read only and none of the changes will be saved). Select a **New** changelist and add a message describing the unit of work you will be performing. Press the <kbd>OK</kbd> button.

Open up the project you are working on in **GameMaker**. 

![checkout files and create new changelist](images/checkoutFiles.png)


Open **obj_enemy_bullet** and press the <kbd>Add Event</kbd> button and add a **Collision | obj_player** event.

![Add a collision from obj_enemy_bullet to obj_player event](images/AddCollisionBulletPlayerEvent.png)

![](../images/line2.png)

##### `Step 2.`\|`TDS`|:small_blue_diamond: :small_blue_diamond: 

*Add* to this new script an instance of **obj_enemy_explosion** and *deduct* from the player's health `p1_health` and destroy the bullet.  We do not destroy the player as we only would do this if there is no health left. Let add this logic to the **obj_enemy_bullet: Collision obj_player** Event.

![Add to collision event to sap player's health when hit by bullet](images/AddBulletPlayerCollisionScript.png)

![](../images/line2.png)

##### `Step 3.`\|`TDS`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now for testing purposes I just want these three waves to continue for ever.  *Add* a **Step | Step** event script to **obj_game** and lets loop at `900` frames the timeline forever:

![Make rocks spawn endlessly in obj_game_controller step event](images/DebugAddedToGameControllerStep.png)

![](../images/line2.png)

##### `Step 4.`\|`TDS`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game. You should now see an explosion and the health should depleat to beyond 0. Also the enemies will just keep respawning.

![Enemies respawn, and health depletes when player is hit](images/FistPassPlayerHealth.gif)

![](../images/line2.png)

##### `Step 5.`\|`TDS`| :small_orange_diamond:

I would like the explosion to be above the player and not behind him.  This is not currenlty possible as our top most layer in the room is **Instance_Player**.  Lets open **rm_lvl_1** and add an instance layer to the top called Explosion:

![Add Explosion layer at very top called Explosion](images/AddExplosionLayerToRoom.png)

![](../images/line2.png)

##### `Step 6.`\|`TDS`| :small_orange_diamond: :small_blue_diamond:

In **obj_enemy_bullet: Collision | obj_player player** script change the layer from `"Instance_Player"` to `"Explosion"`.

![Change layer animation spawns on in obj_enemy_bullet collision event with obj_player](images/ChangeScriptToExplosion.png)

![](../images/line2.png)

##### `Step 7.`\|`TDS`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game. Now explosions should be on top of the player.

![Run game and now when player gets hit the explosion is on top of everything](images/ExplosionTopLayer.gif)

![](../images/line2.png)

##### `Step 8.`\|`TDS`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now lets deal with enemy plane and player collision.  This will destroy the plane and do triple damage of `30` points.  Lets try two explosions. Double click **obj_enemy_parent** and press <kbd>Add Event</kbd> button and select **Collision | obj_player**:

![Change damage done in obj_enemy_parent collision with obj_player script](images/AddCollisionParentEvent.png)

![](../images/line2.png)

##### `Step 9.`\|`TDS`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Add two explosions and take away triple health damage to bullets inside the **obj_enemy_parent Collision obj_player** event script.

![Add two explosions and take away triple health points](images/DamageToPlayerForPlaneCollision.png)

![](../images/line2.png)

##### `Step 10.`\|`TDS`| :large_blue_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game. Now run into an enemy to see if it works.

![Play game and run into enemy](images/PlaneOnPlaneDeath.gif)

![](../images/line2.png)

##### `Step 11.`\|`TDS`| :large_blue_diamond: :small_blue_diamond: 

Now play test the game and adjust your **Collision Masks** on the player sprite and enemy sprites to your liking.  I like to have them a bit loose and not take the entire sprite.  Here are the settings that I liked, but choose your own, based on your preference.

![Adjust all sprite collision masks to your liking](images/PlayerCollisionMast.png)


![Adjust all sprite collision masks to your liking](images/EnemyShootCollisionMask.png)


![Adjust all sprite collision masks to your liking](images/EnemyTargetCollisionMask.png)


![Adjust all sprite collision masks to your liking](images/BasicEnemyCollisionMask.png)

![](../images/line2.png)


##### `Step 12.`\|`TDS`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond: 

Lets not have the targeting planes shoot backwards or the shooting planes shoot when they are below the player.  We will check to see if the player is in front of the enemy before firing.  Open **obj_enemy_shoot: Step** event and add a check for the player plane behind the enemy.

![Stop shooting up screen in obj_enemy_shoot object](images/AddCheckOnY.png)

![](../images/line2.png)

##### `Step 13.`\|`TDS`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond:  :small_blue_diamond: 

Do the same thing in **obj_enemy_target: Step Event**.

![Stop shooting up screen in obj_enemy_target object](images/AddCheckOnY2.png)

![](../images/line2.png)

##### `Step 14.`\|`TDS`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:  :small_blue_diamond: 

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game. Now the enemies shouldn't shoot before moving upwards.

![Run game and look to see that player's don't fire up screen](images/EnemiesDontShootUp.gif)

![](../images/line2.png)

##### `Step 15.`\|`TDS`| :large_blue_diamond: :small_orange_diamond: 

The other thing I want to adjust is to not have all the planes fire at exactly the same time. This makes them feel robotic and not very natural.  Lets adjust the **rate_of_fire** timing to be different. Open `tl_lvl_1` timeline and adjust the spawner for **obj_enemy_shoot**.  We need to get an instance reference then adjust the **rate_of_fire** and **cooldown** variables.

![Adjust enemy shoot timeline event in second wave by randomizing shoot timing](images/AdjustEnemyShootRateOfFire.png)

![](../images/line2.png)

##### `Step 16.`\|`TDS`| :large_blue_diamond: :small_orange_diamond:   :small_blue_diamond: 

Repeat this for the spawning scripts for obj_enemy_target

![Adjust enemy target timeline event in second wave by randomizing shoot timing](images/AdjustEnemyShootRateOfFire2.png)

![](../images/line2.png)

##### `Step 17.`\|`TDS`| :large_blue_diamond: :small_orange_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game. Now the timing seems more natural.  

![Play game and notice time delay in firing](images/BulletTimingAltered.gif)

![](../images/line2.png)

##### `Step 18.`\|`TDS`| :large_blue_diamond: :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Select the **File | Save Project**, then press **File | Quit** (PC) **Game Maker | Quit** on Mac to make sure everything in the game is saved.

![save then quit gamemaker](images/saveQuit.png)

Open up **P4V**.  Select the top folder and press the **Add** button.  We want to add all the new files we created during this last session.  Add these files to the last change list you used at the begining of the session (in my case it was `Spaceship I portion of walkthrough`). Press the <kbd>OK</kbd> button.

![add new and changed files to p4v](images/add.png)

Now you can submit the changelist by pressing both <kbd>Submit</kbd> buttons.

![submit changelist to p4v](images/submit.png)

![](../images/line.png)

<!-- <img src="https://via.placeholder.com/1000x100/45D7CA/000000/?text=Next Up - Ghost Mode"> -->
![next up - ghost mode](images/banner.png)

![](../images/line.png)

| [previous](../player-health/README.md#user-content-player-health)| [home](../README.md#user-content-gms2-top-down-shooter) | [next](../ghost-mode/README.md#user-content-ghost-mode)|
|---|---|---|
