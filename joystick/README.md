<img src="https://via.placeholder.com/1000x4/45D7CA/45D7CA" alt="drawing" height="4px"/>

### Moving Ship with Joystick

<sub>[previous](../keyboard/README.md#user-content-moving-ship-with-keyboard) • [home](../README.md#user-content-gms2-top-down-shooter) • [next](../scrolling-water/README.md#user-content-scrolling-water)</sub>

<img src="https://via.placeholder.com/1000x4/45D7CA/45D7CA" alt="drawing" height="4px"/>

If you do not have a controller to test with then skip to the next chapter [Scrolling Water](scrolling-water/README.md#user-content-scrolling-water).  Otherwise lets continue and add a controller.  First make sure that you controller is compatible with your PC or Mac.  The XBox controller is a good option for a PC and the Sony controller is natively supported on most macs.

The original game and most shooters use a controller instead of the keyboard.  Game mechanics have developed with the user interface in mind.  Often game systems that work well on controllers don't translate so well on keyboards and mice.  I find shooters just shine using a game controller.

<br>

---


##### `Step 1.`\|`SPCRK`|:small_blue_diamond:

First lets import the game object that holds the code for the joystick [joystick.mauby.games.yymps](../Assets/Objects/joystick.mauby.games.yymps).

![download joystick.mauby.games.yymps](images/downloadAsset.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 2.`\|`FHIU`|:small_blue_diamond: :small_blue_diamond: 

Select **Tools | Import Local Package** and selet the file you just downloaded `download joystick.mauby.games.yymps` and press the <kbd>Open</kbd> button.

![import local package for joystick](images/importLocalPackage.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 3.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Select the **obj_gamepad** and press the <kbd>Add</kbd> button.  It should move the item into **Resources to Import**.  Press the <kbd>Import</kbd> button.

![import obj_gamepad](images/importGamepad.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 4.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now in the **Objects** folder you should have an **obj_gamepad**.  Double click to open it up. If you want to find out more about how this works, check out **GameMakers** excellent tutorial [Adding Gamepad Support GML](https://marketplace.yoyogames.com/assets/5785/adding-gamepad-support-gml).

![obj_gamepad in game](images/objGamepad.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 5.`\|`SPCRK`| :small_orange_diamond:

Lets quickly look at two items in the obj_gamepad object.  Open it and look at the **obj_gamepad | Create** event.  Notice that we initialize the four gamepads to **[noone](https://manual.yoyogames.com/GameMaker_Language/GML_Overview/Instance_Keywords.htm)**.  This is a keyword that means that something is empty or not there.  We are basically saying in Gamemaker parlance that there is no controller plugged into any of the 4 gamepad slots.

![Look at gamepad obj_gamepad Create event initializing controllers](images/InititalizeGamepadsToNoone.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 6.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond:

The event where the magic happens is in the **Asynchronous | Async System** event.  Here we print debug messages if a controller is plugged in or unplugged as well as save a reference to the index number that we can use in the global.gamepad array. 

The `global.` keyword allows us to create a variable that is not only seen inside the instance of an object.  It is a global variable where there is only one global copy and it is accessible everywhere. 

The square brackets `[i]` after `global.gamepad` indicates that it is a list.  A reference to the 4 **gamepads** are stored in **array**[0], [1], [2], [3], [4]. So `i` contains an integer of 0 through 4.

![async gamepad event](images/AsyncGamepad.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 7.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond:

Open **obj_player: Step** event and add controls after we check for keyboard. To stop cheating where players press both keyboard and joystick, we can add an if statement to ensure we are getting 0's for keyboard input (player is not pressing both at the same time).  Also, we don't have to compensate for diagonals because the controller returns a horizontal and vertical value with a **normalized** magnitude of 1.

We are using [gamepad_axis_value](https://manual.yoyogames.com/GameMaker_Language/GML_Reference/Game_Input/GamePad_Input/gamepad_axis_value.htm) where we can get 2D axis values for the left and right gamepad stick (we are looking for the left here). This will return a value of -1 to 1 just like when we check for the keyboard axis. Add the code after the keyboard controls but before you move the player. 

![add gamepad_axis_value to read gamepad](images/AddControllerToGame.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 8.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Open up **rm_lvl_1** and add **obj_gamepad** to the **Instance_Player** level.

![add obj_gamepad to rm_lvl_1](images/addGamepadToLevel.png)

##### `Step 9.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game and try your controller out.  You should be able to move the player around at any angle.  Look I can turn the player in circles.  You also don't go faster if you press both arrow keys and the gamepad.  Test it out!

![move player in game with joystick](images/GameadControllingShip.gif)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 10.`\|`SPCRK`| :large_blue_diamond:

Select the **File | Save Project** then press **File | Quit** to make sure everything in the game is saved. If you are using **GitHub** open up **GitHub Desktop** and add a title and longer description (if necessary) and press the <kbd>Commit to main</kbd> button. Finish by pressing **Push origin** to update the server with the latest changes.

![save, quit, commit and push to github](images/GitHub.png)



___


<img src="https://via.placeholder.com/1000x4/dba81a/dba81a" alt="drawing" height="4px" alt = ""/>

<img src="https://via.placeholder.com/1000x100/45D7CA/000000/?text=Next Up - Scrolling Water">
<img src="https://via.placeholder.com/1000x4/dba81a/dba81a" alt="drawing" height="4px" alt = ""/>

| [previous](../keyboard/README.md#user-content-moving-ship-with-keyboard)| [home](../README.md#user-content-gms2-top-down-shooter) | [next](../scrolling-water/README.md#user-content-scrolling-water)|
|---|---|---|
