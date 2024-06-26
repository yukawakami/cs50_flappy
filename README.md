# CS50G_flappy

<a href= "https://cs50.harvard.edu/games/2018/weeks/1/">https://cs50.harvard.edu/games/2018/weeks/1/</a>

## Objectives
Read and understand all of the Flappy (Fifty!) Bird source code from Lecture 1.<br>
Influence the generation of pipes so as to bring about more complicated level generation.<br>
Give the player a medal for their performance, along with their score.<br>
Implement a pause feature, just in case life gets in the way of jumping through pipes!

## Specification
Randomize the gap between pipes (vertical space), such that they’re no longer hardcoded to 90 pixels.<br><br>
Randomize the interval at which pairs of pipes spawn, such that they’re no longer always 2 seconds apart.<br><br>
When a player enters the ScoreState, award them a “medal” via an image displayed along with the score; this can be any image or any type of medal you choose (e.g., ribbons, actual medals, trophies, etc.), so long as each is different and based on the points they scored that life. Choose 3 different ones, as well as the minimum score needed for each one (though make it fair and not too hard to test :)).<br><br>
Implement a pause feature, such that the user can simply press “P” (or some other key) and pause the state of the game. This pause effect will be slightly fancier than the pause feature we showed in class, though not ultimately that much different. When they pause the game, a simple sound effect should play (I recommend testing out bfxr for this, as seen in Lecture 0!). At the same time this sound effect plays, the music should pause, and once the user presses P again, the gameplay and the music should resume just as they were! To cap it off, display a pause icon in the middle of the screen, nice and large, so as to make it clear the game is paused.


## Changes made

### main.lua:
Line 41: included a PauseState<br>
Line 94: added a pause/continue sound effect<br>
Line 114: added a pause state to the StateMachine

### PipePair.lua:
Lines 14 - 21: Made the GAP_HEIGHT a random value<br>
Line 39: freed GAP_HEIGHT

### /graphics:
Created 3 simple medals

### /sounds:
Created pause_cont.wav

### /states:
PauseState.lua added (not used, implemented in PlayState.lua instead)

### /states/PlayState.lua:
Line 31: defined a pause flag<br>
Lines 46 - 57: implemented the pause functionality, stopping PlayState:update(dt) whenever self.pause is true<br>
Line 59: slightly changed pipe spawning interval<br>
Lines 134 - 146: altered PlayState:render() depending on self.pause

### /states/ScoreState.lua:
Lines 13 - 20: Initialized ScoreState with the newly created images, defined coordinates to render these in ScoreState:render()<br>
Lines 45 - 56: Added conditions to print medals onto the screen depending on the score


## License

This project is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.<br>
For details, see the [full license](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode).
