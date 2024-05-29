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

