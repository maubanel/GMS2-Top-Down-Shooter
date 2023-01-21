![](../images/line3.png)

### Basic Enemy and Timelines

<sub>[previous](../preparing-enemies/README.md#user-content-setting-up-three-enemy-types) • [home](../README.md#user-content-gms2-top-down-shooter) • [next](../shooting/README.md#user-content-shooting)</sub>

![](../images/line3.png)

All three planes fly downwards at the same speed. One shoots straight down and the other shoots with targeting. We are looking for common behavior in the obj_enemy_parent.  Lets start by setting the common behavior for **all** planes which is flying down screen. The will also get removed when they leave the play area.

<br>

---


##### `Step 1.`\|`SPCRK`|:small_blue_diamond:

All three planes fly down at a constant speed. Make sure this speed isn't the same as the water or it will look like the planes are floating on the water like a boat. *Double click* on **obj_enemy_parent** and press <kbd>Add Event</kbd> button and add a new **Create** event script then add a downward motion.

![Add a create event and give them a speed](images/EnemyParentCreateEvent.png)

![](../images/line2.png)

##### `Step 2.`\|`FHIU`|:small_blue_diamond: :small_blue_diamond: 

Now we need to create a **[Timeline](https://manual.yoyogames.com/The_Asset_Editors/Timelines.htm)** to launch our enemy waves. Right click on **Timelines** and select **Create | Timeline** and call it `tl_lvl_1`.

![Create a Timeline called tl_lvl_1](images/tl_lvl_1.png)

![](../images/line2.png)

##### `Step 3.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Add a new **Moment** to the timeline.  *Right click* on **moment 0** and select **Change Moment**.  We will change it to 1 second in, at the `60`th frame.  We will then add three basic enemies evenly spaced horizontally. 

![Add a moment to tl_lvl_1 and set it to the 30th frame](images/SpawnThreeShipInTimeline.png)

![](../images/line2.png)

##### `Step 4.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Each object has a timeline that is accessed through **timeline_index** but it defaults to `-1`.  We need to *assign* the newly created timeline and also start it.  Since it is unassigned it needs to be started.  Open **obj_game | Create event** and assign the timeline at the bottom of the script.

![Assign the timeline index and start running the timeline in obj_game_controller Create event](images/StartTimelineController.png)

![](../images/line2.png)

##### `Step 5.`\|`SPCRK`| :small_orange_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game.  Now after one second you should see three enemy ships move down screen:

![Run game, first wave of ships appear after 1 second](images/FirstWaveBasicA.gif)

![](../images/line2.png)

##### `Step 6.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond:

We have a small problem with the enemies. It is small now, but if we spawn many more it will become an even bigger issue later. Can you figure it out? 

</details>
<details><summary>Answer</summary>
So what is the problem with the enemies as we have them currently? Try running the game in debug mode (right to the left of the regular run game button), let the enemies go off the screen, pause the game and look at your instances. Make sure you press the Update real time instances button and have the Instances window open.  Notice that the planes never disappear even when they go off the bottom of the screen.  If we spawn too many enemies the game will run out of memory and crash.

![Run game in debug mode and look at instances](images/EnableRealTimeDebugging.png)

![Run game in debug mode and see that ships don't disappear](images/EnemyBasicNotGettingDeleted.gif)

</details>

![](../images/line2.png)

##### `Step 7.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond:

The enemy planes have not been dealt with and we need to do some housecleaning. Open up the **obj_enemy_parent: Create** event script and add a variable to the bottom to represent the bottom of the screen.

![Add a loop that repeats 5 times and adds one to a variable](images/BottomOfLevelVariable.png)

![](../images/line2.png)

##### `Step 8.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Go back to **obj_enemy_parent** and press the <kbd>Add Event</kbd> button for a **Step | Step** event script and delete the planes when they go off the bottom of the screen.

![Add step event to delete planes when they go off screen](images/DestroyPlaneFlyingOffLevelStep.png)

![](../images/line2.png)

##### `Step 9.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Debug</kbd> button in the top menu bar to launch the game in debug mode (right to the left of the regular run game button). Check the **Instance** tab below.  Now the three planes should get removed once they are off the screen. Up next we will get back to the player for a bit and handle player shooting.

![Run games now enemies disappear when they go off the bottom of the screen](images/PlanesGoAwayOffBottom.gif)

![](../images/line2.png)

##### `Step 10.`\|`SPCRK`| :large_blue_diamond:

Select the **File | Save Project** then press **File | Quit** to make sure everything in the game is saved. If you are using **GitHub** open up **GitHub Desktop** and add a title and longer description (if necessary) and press the <kbd>Commit to main</kbd> button. Finish by pressing **Push origin** to update the server with the latest changes.

![save, quit, commit and push to github](images/GitHub.png)

___


![](../images/line.png)

<!-- <img src="https://via.placeholder.com/1000x100/45D7CA/000000/?text=Next Up - Shooting"> -->
![next up - shooting](images/banner.png)

![](../images/line.png)

| [previous](../preparing-enemies/README.md#user-content-setting-up-three-enemy-types)| [home](../README.md#user-content-gms2-top-down-shooter) | [next](../shooting/README.md#user-content-shooting)|
|---|---|---|
