# Work Log

## Christopher Wong

### 5/22/2024

- updated minefield and cell constructor, drew basic minefield grid in minefield constructor
- wrote setupGame() to place mines with additional Cell methods (getMine(), setMine()), temporarily colored in mines red

### 5/23/2024

- wrote leftClick() and excavate() to open individual squares
- wrote rightClick() and toggleFlag() to place and remove flags

- finished leftClick() and combined it with explore() --> added text and fixed various errors so it works as intended

### 5/24/2024 and 5/25/2024

- Edited clicking methods for edge cases regarding boundary issues
- Added checks for flags in leftClick()/explore() to make flags work as intended
- Added different colors for different numbers of neighbors and fixed text boxes
- Renamed methods for clarity

### 5/28/2024

- Edited placeMines() to place mines on first click and to never start on a mine
- Wrote win() and simple win procedure
- Added interactions with Displays class

### 5/29/2024

- Added demo branch
- Looked into Processing examples to learn how to use Handles (no commits in class because I was reading and testing)
- Added display bar to top with "button" to open settings

### 5/30/2024

- Wrote setSize() and setNumMines() to use for handles/sliders
- Added to redraw() and show() to redraw board after closing settings

### 5/31/2024 and 6/1/2024

- Made sliders move correctly
- Edited displays to make settings menu look better
- Moved code from main sketch class into Displays class and edited accordingly

### 6/3/2024

- Added clicking after winning or losing to restart
- Improved handle accessing
- Added apply "button" and apply() method to apply handle settings
- Minor fixes to improve code

### 6/5/2024

- Added revealMines() to reveal mines after losing and Xs for wrongly placed flags
- Redrew flags and mines

## Nikkol Chen

### 5/22/2024

- made repo and made template of methods described in UML digram
- wrote the left click and right click

### 5/23/2024

- wrote setMinesSurrounding(int) and checkNeighs() involving grabbing mine data from neighbors
- wrote excavate() to do more widespread excavating/ recursive implementation --> did not succeed in displaying text

### 5/28/2024
- Wrote lose() with placeholder losing screen
- Wrote restart() and accessed it through keyPressed()
- worked on openSetting() and the mechanisms involved with opening it during gameplay, after losing, and closing the settings tab

### 5/29/2024
- examined the code at the Handles example under GUI for settings
- initial implementation of Handles into Displays --> settings

### 5/30/2024
- added to README
- fixed how setting popup is displayed
- cannot figure out why the slider/handle does not move (experimented around and problem lies with firstMouseClick variable (???))

### 5/31/2024
- made the sliders/handle move now
- added increments to the slider handle as well as space to display number of mines and board size selected
- fixed null pointer exception bug for mouseReleased() with booleans

