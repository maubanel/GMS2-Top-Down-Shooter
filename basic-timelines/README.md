<img src="https://via.placeholder.com/1000x4/45D7CA/45D7CA" alt="drawing" height="4px"/>

### Basic Enemy and Timelines

<sub>[previous](../preparing-enemies/README.md#user-content-setting-up-three-enemy-types) • [home](../README.md#user-content-gms2-top-down-shooter) • [next](../shooting/README.md#user-content-shooting)</sub>

<img src="https://via.placeholder.com/1000x4/45D7CA/45D7CA" alt="drawing" height="4px"/>

All three planes fly downwards at the same speed. One shoots straight down and the other shoots with targeting. We are looking for common behavior in the obj_enemy_parent.  Lets start by setting the common behavior for **all** planes which is flying down screen. The will also get removed when they leave the play area.

<br>

---


##### `Step 1.`\|`SPCRK`|:small_blue_diamond:

All three planes fly down at a constant speed. Make sure this speed isn't the same as the water or it will look like the planes are floating on the water like a boat. *Double click* on **obj_enemy_parent** and press <kbd>Add Event</kbd> button and add a new **Create** event script then add a downward motion.

![Add a create event and give them a speed](images/EnemyParentCreateEvent.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 2.`\|`FHIU`|:small_blue_diamond: :small_blue_diamond: 

Now we need to create a **[Timeline](https://manual.yoyogames.com/The_Asset_Editors/Timelines.htm)** to launch our enemy waves. Right click on **Timelines** and select **Create | Timeline** and call it `tl_lvl_1`.

![Create a Timeline called tl_lvl_1](images/tl_lvl_1.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 3.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Add a new **Moment** to the timeline.  *Right click* on **moment 0** and select **Change Moment**.  We will change it to 1 second in, at the `60`th frame.  We will then add three basic enemies evenly spaced horizontally. 

![Add a moment to tl_lvl_1 and set it to the 30th frame](images/SpawnThreeShipInTimeline.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 4.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Each object has a timeline that is accessed through **timeline_index** but it defaults to `-1`.  We need to *assign* the newly created timeline and also start it.  Since it is unassigned it needs to be started.  Open **obj_game | Create event** and assign the timeline at the bottom of the script.

![Assign the timeline index and start running the timeline in obj_game_controller Create event](images/StartTimelineController.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 5.`\|`SPCRK`| :small_orange_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game.  Now after one second you should see three enemy ships move down screen:

![Run game, first wave of ships appear after 1 second](images/FirstWaveBasicA.gif)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 6.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond:

We have a small problem with the enemies. It is small now, but if we spawn many more it will become an even bigger issue later. Can you figure it out? 

</details>
<details><summary>Answer</summary>
So what is the problem with the enemies as we have them currently? Try running the game in debug mode (right to the left of the regular run game button), let the enemies go off the screen, pause the game and look at your instances. Make sure you press the **Update** real time instances button and have the Instances window open.  Notice that the planes never disappear even when they go off the bottom of the screen.  If we spawn too many enemies the game will run out of memory and crash.

![Run game in debug mode and look at instances](images/EnableRealTimeDebugging.png)
</details>




<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 7.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond:

![alt_text](images/.png)

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

<img src="https://via.placeholder.com/1000x100/45D7CA/000000/?text=Next Up - Shooting">
<img src="https://via.placeholder.com/1000x4/dba81a/dba81a" alt="drawing" height="4px" alt = ""/>

| [previous](../preparing-enemies/README.md#user-content-setting-up-three-enemy-types)| [home](../README.md#user-content-gms2-top-down-shooter) | [next](../shooting/README.md#user-content-shooting)|
|---|---|---|
