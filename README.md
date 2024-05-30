[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project
THIS DOCUMENT IS REQUIRED
## Group Info
Period: Period 4
Group Members: Nikkol Chen and Christopher Wong
Group Name: The Stuy 51ers
## Overview
### Brief Description: 
	For our project, we plan to recreate Minesweeper in Processing. It will likely be mostly similar to regular Minesweeper. Left-clicking will explore a square, either excavating the square and its surroundings or finding a mine and ending the game. Right-clicking places flags to mark potential mines, preventing those squares from being left-clicked unless the flag is removed by right-clicking again. We hope to add settings to toggle the board size and the number of mines. We also hope to add cool graphics if time allows, especially when finding a mine or winning.

### Expanded Description: 
Critical Features:
- Cells class to represent each square and its status (open vs. unopened, flagged, mines, count of surrounding mines)
- 2D array of cells to represent map of the game
Left-clicking explores the cell and any neighboring cells if the initial cell has no surrounding mines (recursive)
- Right-clicking places (or removes) flags to mark potential mines (can’t left-click flags)
- Initialize mines after first click (can’t start on a mine, starting chunk)
Winning/losing procedures: End game, open new board

Nice-to-Have Features:
- Counter to show number of unflagged mines remaining
- Cool graphics for winning, losing, and more
- Changing board size and number of mines (edit settings with user input)
- Reveal remaining/false mines when losing

## Instructions
- left click to explore a cell
- right click to place and un-place a flag
- click on settings button to open settings; reclick to close
- press any key to restart
