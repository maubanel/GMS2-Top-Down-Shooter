<img src="https://via.placeholder.com/1000x4/45D7CA/45D7CA" alt="drawing" height="4px"/>

### Audio

<sub>[previous](../ghost-mode/README.md#user-content-ghost-mode) • [home](../README.md#user-content-gms2-top-down-shooter) • [next](../front-end/README.md#user-content-front-end)</sub>

<img src="https://via.placeholder.com/1000x4/45D7CA/45D7CA" alt="drawing" height="4px"/>

Lets add some music and sound effects to the game.

<br>

---


##### `Step 1.`\|`SPCRK`|:small_blue_diamond:

Pick some free music that you think might be appropriate for the game. I used The *Spririt of Russian Love* by **Zinaida Troikai** for mine from the free music archive. Look for an MP4 or OGG format.  *Download* a song that you have permission to use and right click on **Sounds** and select **Create | Sound**.  Call it *snd_theme_music* and press the three periods (dots) next to the name to bring up an explorer menu to pick the music.

![Download and pick theme music for the game and create a sound resource called snd_theme_music](images/AddNewSound.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 2.`\|`FHIU`|:small_blue_diamond: :small_blue_diamond: 

Pick the music you have downloaded.

![Press three dots and select song you just downloaded](images/PIckSong.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 3.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Open **obj_game: Create** event script and at the bottom check to make sure the song is not already playing, then play the song in an endless loop.

![Add to obj_game_controller a check to see if song is already playing and if not, then play song in an endless loop](images/PlayMusicGameControllerCreate.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 4.`\|`SPCRK`|:small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game. Play it and notice that the music should play and go on forever.

https://user-images.githubusercontent.com/5504953/139530532-cb5d8513-7082-4fd4-a452-d79599d7ed0d.mp4

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 5.`\|`SPCRK`| :small_orange_diamond:

Download [snd_enemy_explode.wav](../Assets/Sounds/snd_enemy_explode.wav) to your computer. Call this **Sound** file `snd_enemy_explode`.

![Add a snd_enemy_explode sound resource and load file from TutorialResources/Sounds folder](images/AddEnemyExplodeSFX.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 6.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond:

Add the enemy explosion to **obj_player_bullet: Collision | obj_enemy_parent** event and add the audio playback at the bottom of the script.

![Add logic to play sound on obj_bullet: Collision event at the bottom](images/EnemyExplodeSound.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 7.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond:

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game. Play it and shoot enemies ot hear the sounds played!

https://user-images.githubusercontent.com/5504953/139530785-5453222b-188a-47bc-9d84-62f6948e6dc4.mp4

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 8.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Repeat the process for [snd_player_explode.wav](../Assets/Sounds/snd_player_explode.wav), [snd_player_shoot.wav](../Assets/Sounds/snd_player_shoot.wav) and [snd_enemy_shoot.wav](../Assets/Sounds/snd_enemy_shoot.wav). Name the files the same as the downloads and link audio files with the appropriate name. 

![three more audio files](images/LastThreeSounds.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 9.`\|`SPCRK`| :small_orange_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:

Lets play all of these sounds in their appropriate places.  Open up **obj_enemy_bullet | Collision | obj_player**.

![Add player dying when enemy bullet hits it](images/PlaySoundPlayerExplode.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 10.`\|`SPCRK`| :large_blue_diamond:

*Open* up **obj_player: Step** and inside the shooting braces (`if ( (keyboard_check_pressed(vk_space)...`)

![Add shooting sound to where player hits the space bar](images/PlayerSoundPlayerSHoot.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 11.`\|`SPCRK`| :large_blue_diamond: :small_blue_diamond: 

*Open* up **obj_enemy_target: Step**.

![Add shooting sound for enemy target](images/PlayerSoundEnemyTargetShoot.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>


##### `Step 12.`\|`SPCRK`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond: 

Finally *open* up **obj_enemy_shoot: Step**.

![Add shooting sound for enemy shoot](images/PlayerSoundEnemyShootShoot.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 13.`\|`SPCRK`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond:  :small_blue_diamond: 

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game. Play it and listen to all the sounds.  

ADD AUDIO RECORDING ON PC

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 14.`\|`SPCRK`| :large_blue_diamond: :small_blue_diamond: :small_blue_diamond: :small_blue_diamond:  :small_blue_diamond: 

The audio gets repetitive really quickly.  Lets look at a way of tricking the ear to get more out of a single sound.  Lets alter the pitch with **[audio_sound_pitch(index, pitch)](https://manual.yoyogames.com/GameMaker_Language/GML_Reference/Asset_Management/Audio/audio_sound_pitch.htm)**. The pitch is a value less than 1 is lower in pitch (0 would be none) and 2 would be an ocatve higher.

Lets alter the volume (gain) with **[audio_sound_gain(index, volume, time)](https://manual.yoyogames.com/GameMaker_Language/GML_Reference/Asset_Management/Audio/audio_sound_gain.htm)**. The volume argument is between `0` (quiet) to `1` (full volume).  We will set the time argument to `0` as we don't want it to fade in or out we want it to apply right away.

Here is an example of what it looks like in **obj_player: Step**.  Repeat this for all other sounds played (except for the music looping).

![Add a pitch and gain random shift in shooting sound](images/RandomizeGainPitchAllSounds.png)

<img src="https://via.placeholder.com/500x2/45D7CA/45D7CA" alt="drawing" height="2px" alt = ""/>

##### `Step 15.`\|`SPCRK`| :large_blue_diamond: :small_orange_diamond: 

Now *press* the <kbd>Play</kbd> button in the top menu bar to launch the game. Play it and the sounds should alter a bit during playback. The only sound we forgot to put in was the sound playing when the player is hit directly by a plane.  I will let you figure this out on your own.

https://user-images.githubusercontent.com/5504953/139531886-3c7525a8-9d0c-4a45-b42a-2e778ebd36e7.mp4

___

<img src="https://via.placeholder.com/1000x4/dba81a/dba81a" alt="drawing" height="4px" alt = ""/>

<img src="https://via.placeholder.com/1000x100/45D7CA/000000/?text=Next Up - Front End">

<img src="https://via.placeholder.com/1000x4/dba81a/dba81a" alt="drawing" height="4px" alt = ""/>

| [previous](../ghost-mode/README.md#user-content-ghost-mode)| [home](../README.md#user-content-gms2-top-down-shooter) | [next](../front-end/README.md#user-content-front-end)|
|---|---|---|
