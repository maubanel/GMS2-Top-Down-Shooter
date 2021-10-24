<img src="https://via.placeholder.com/1000x4/45D7CA/45D7CA" alt="drawing" height="4px"/>

### Scrolling Islands

<sub>[previous](../scrolling-water/README.md#user-content-scrolling-water) • [home](../README.md#user-content-gms2-top-down-shooter) • [next](../preparing-enemies/README.md#user-content-setting-up-three-enemy-types)</sub>

<img src="https://via.placeholder.com/1000x4/45D7CA/45D7CA" alt="drawing" height="4px"/>

Now that the water is moving, lets give it more impact by adding islands to fly over.  The islands play no part in gameplay, it is just eye candy. 

All the islands will have the same behavior.  We could do what was done in the Space Rocks game and assign the sprite in the create event.  There is another way for multiple objects to share the same behavior/scripts.  It is by using a parent and child relationship.  We will put the entire behavior in the parent script and the child will inherit this behavior without having to retype the script allowing us to have one script for three islands.  

Let's break it down:

* Import spr_island_1, spr_island_2 and spr_island_3 sprites and center them 
* Create an obj_island_parent script
* Scroll the island parent at the same speed as the water
* When the island scrolls off the bottom place it randomly on the X axes at a random rotation in an EMPTY spot.
* Create an obj_island_1, obj_island_2, and obj_island_3 objects inheriting from the parent * obj_island_parent
* Place three islands on the level/map

<br>

---


##### `Step 1.`\|`SPCRK`|:small_blue_diamond:

Lets start by downloading the 3 island sprites **[spr_island_1.png](../Assets/Sprites/spr_island_1.png)**, **[spr_island_2.png](../Assets/Sprites/spr_island_2.png)** and **[spr_island_3.png](../Assets/Sprites/spr_island_3.png)**. 

*Create* three new sprites by *right clicking* **Sprites** and select **Create | Sprite** sthree times.  Press the **Import** button on each sprite and import the above sprites.. You can download them from   TutorialResources | Sprites . *Name* the three sprites: `spr_island_1`, `spr_island_2` and `spr_island_3`.

![Add three sprites of the islands called sp_island_1, sp_island_2 and sp_island_3](images/ThreeIslandSprites.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 2.`\|`FHIU`|:small_blue_diamond: :small_blue_diamond: 

Since we want the islands to all share the same behavior, we will create a **Game Object** that will act as a **Parent** that all the children will inherit from. This allows us to write the **Island** logic once and be able to debug and tune it but all islands will inherit the behavior.
	
*Create* a blank **Game Object** called `obj_island_parent` that we will write all our scripts for and the three islands will inherit from. DO NOT assign a sprite to it.	

![Add a obj_island_parent with NO sprite assigned](images/ObjIslandParents.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 3.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now create three new objects and assign the appropriate sprite and attach the `obj_island_parent` to the **Parent** selector. Call them `obj_island_1`, `obj_island_2` and `obj_island_3`:

![Add obj_island_1, obj_island_2 and obj_island_3 and assign the three sprites](images/ThreeIslandChildren.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 4.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Open **rm_lvl_1** and create a new **Instance** Layer and call it **Islands** and put it between the **Instance_Player** and the **Background** layer. We want the plane to be above the islands, and the islands to be in front of the water. The layers in **GameMaker** are like those in **Photoshop** in terms of rendering order.

![Add a new instance layer called Islands between Player and Background](images/SilandsBackgroundLayer.gif)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 5.`\|`SPCRK`| :small_orange_diamond:

*Creatively* drag and drop 6-8 islands and place them on the Islands layer in the room. You can select an island with the left mouse click then when the circular arrow appears you can rotate the sprite so they are not all in the same orientation. You can also just double click on the island (make sure you are on the Island layer) to bring up the instance editor and type in a new value in the Rotation field.  Here is how I filled in my room.

![Add Islands to level and rotate them](images/PutIslandsInRoom.gif)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 6.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond:

Run the game by pressing the <img style="vertical-align:middle" src="http://marcaubanel.com/gamemaker/GMS2-Images/Shared/Icon_RunProject.png" alt="Play button icon"> Play Button and the background scrolls and islands stay put. 

![alt_text](images/.png)

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

<img src="https://via.placeholder.com/1000x100/45D7CA/000000/?text=Next Up - Setting Up Three Enemy Types">

<img src="https://via.placeholder.com/1000x4/dba81a/dba81a" alt="drawing" height="4px" alt = ""/>

| [previous](../scrolling-water/README.md#user-content-scrolling-water)| [home](../README.md#user-content-gms2-top-down-shooter) | [next](../preparing-enemies/README.md#user-content-setting-up-three-enemy-types)|
|---|---|---|
