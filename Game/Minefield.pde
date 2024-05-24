public class Minefield {
  Cell[][] grid;
  int foundFlags;
  int totalMines;
  int squareSize;
  boolean settingsOpen;
  boolean inGame;

  public Minefield() {
    this(15, 40);
  }
  public Minefield(int size, int mines) {
    fill(80, 224, 80);
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
    placeMines();
  }

  //methods
  public void placeMines() {
    for (int i = 0; i < totalMines; i++) {
      int row = (int)(Math.random() * grid.length);
      int col = (int)(Math.random() * grid.length);
      while (grid[row][col].getMine()) {
        row = (int)(Math.random() * grid.length);
        col = (int)(Math.random() * grid.length);
      }
      grid[row][col].setMine(true);
    }
  }
  
  public void leftClick(int x, int y) {
    explore(y/squareSize, x/squareSize); 
  }

  public void explore(int row, int column) {
    if (row < grid.length && column < grid.length && row >= 0 && column >= 0) {
      Cell target = grid[row][column];
      if (!target.isOpen() && !target.hasFlag()) {
        int neighbors = checkNeighs(row, column);
        boolean mined = target.excavate();
         if (!mined) {
           if (neighbors == 0) {
             explore(row, column + 1);
             explore(row, column - 1);
             explore(row+1, column);
             explore(row+1, column + 1);
             explore(row+1, column - 1);
             explore(row-1, column);
             explore(row-1, column+1);
             explore(row-1, column-1);
           }
           else{
             fill(0, 0, 0);
             text(checkNeighs(row, column) + "", target.xcoord + squareSize/2.0, target.ycoord + squareSize * 3/4.0);
           }
         }
         else {}
       }
    }
  }
  public void rightClick(int x, int y) {
    if (x >= 0 && y >= 0 && x < grid.length * squareSize && y < grid.length * squareSize) {
      grid[y/squareSize][x/squareSize].toggleFlag();
    }
  }
  
  public int checkNeighs(int row, int col) {
    int total = 0;
    for (int i = -1; i<2; i++) {
      for (int j = -1; j<2; j++) {
        try {
          Cell current = grid[row+i][col+j];
          if (current.getMine()) {
            total ++;
          }
        }
        catch (ArrayIndexOutOfBoundsException e) {};
      }
    }
    return total;
  }
  public void setSize() {
  }
  public void setMines() {
  }
}
