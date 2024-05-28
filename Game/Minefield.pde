public class Minefield {
  Cell[][] grid;
  int foundFlags;
  int totalMines;
  int squareSize;
  boolean minesPlaced;
  int openedSquares;
  
  boolean settingsOpen;
  boolean inGame;

  public Minefield() {
    this(15, 40);
  }
  public Minefield(int size, int mines) {
    fill(60, 201, 91);
    textSize(24);
    textAlign(CENTER);
    grid = new Cell[size][size];
    squareSize = width/grid.length;
    for (int row = 0; row < grid.length; row++) {
      for (int col = 0; col < grid.length; col++) {
        grid[row][col] = new Cell(squareSize, col * squareSize, row * squareSize);
      }
    }
    
    foundFlags = 0;
    totalMines = mines;
    settingsOpen = false;
    inGame = false;
    minesPlaced = false;
    openedSquares = 0;
  }

  //methods
  public void placeMines(int clickedRow, int clickedCol) {
    for (int i = 0; i < totalMines; i++) {
      int row = (int)(Math.random() * grid.length);
      int col = (int)(Math.random() * grid.length);
      while (grid[row][col].getMine() || (Math.abs(clickedRow - row) <= 1 && Math.abs(clickedCol - col) <= 1)) {
        row = (int)(Math.random() * grid.length);
        col = (int)(Math.random() * grid.length);
      }
      grid[row][col].placeMine(true);
    }
    minesPlaced = true;
  }

  public void leftClick(int x, int y) {
    if (!minesPlaced) {
      placeMines(y/squareSize, x/squareSize);
    }
    explore(y/squareSize, x/squareSize);
    println(openedSquares);
    if (openedSquares + totalMines == grid.length * grid.length) {
      result = new Displays();
      result.win();
    }
  }

  public void explore(int row, int column) {
    if (row < grid.length && column < grid.length && row >= 0 && column >= 0) {
      Cell target = grid[row][column];
      if (!target.isOpen() && !target.hasFlag()) {
        int neighbors = checkNeighs(row, column);
        boolean mined = target.excavate();
        if (!mined) {
          openedSquares++;
          if (neighbors == 0) {
            explore(row, column + 1);
            explore(row, column - 1);
            explore(row+1, column);
            explore(row+1, column + 1);
            explore(row+1, column - 1);
            explore(row-1, column);
            explore(row-1, column+1);
            explore(row-1, column-1);
          } else {
            printNeighbors(neighbors, row, column);
          }
        } else {
          result = new Displays();
          result.lose();
        }
      }
    }
  }

  public void printNeighbors(int num, int row, int col) {
    if (num == 1) {
      fill(0, 0, 200);
    }
    else if (num == 2) {
      fill(0, 200, 0);
    }
    else if (num == 3) {
      fill(200, 0, 0);
    } 
    else if (num == 4) {
      fill(200, 0, 200);
    }
    else if (num == 5) {
      fill(222, 163, 0);
    }
    else if (num == 6) {
      fill(0, 200, 200);
    }
    else if (num == 7) {
      fill(64, 64, 64);
    }
    else if (num == 8) {
      fill(164, 164, 164);
    }
    text(num + "", col * squareSize, row * squareSize + squareSize / 4.0, squareSize, squareSize);
  }


  public void rightClick(int x, int y) {
    if (minesPlaced) {
      if (x >= 0 && y >= 0 && x < grid.length * squareSize && y < grid.length * squareSize) {
        grid[y/squareSize][x/squareSize].toggleFlag();
      }
    }
  }

  public int checkNeighs(int row, int col) {
    int total = 0;
    for (int i = -1; i<2; i++) {
      for (int j = -1; j<2; j++) {
        if (row + i >= 0 && col + j >= 0 && row + i < grid.length && col + j < grid.length) {
          Cell current = grid[row+i][col+j];
          if (current.getMine()) {
            total ++;
          }
        }
      }
    }
    return total;
  }
  public void setSize() {
  }
  public void setNumMines() {
  }
}
