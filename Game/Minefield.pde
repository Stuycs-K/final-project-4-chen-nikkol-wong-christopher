public class Minefield {
  Cell[][] grid;
  int totalMines;
  int squareSize;
  boolean minesPlaced;
  int openedSquares;
  boolean lost;
  boolean won;
  Displays show;
  int foundFlags;

  public Minefield(Displays d) {
    this(d, 15, 40);
  }
  
  public Minefield(Displays d, int size, int mines) {
    show = d;
    fill(60, 201, 91);
    grid = new Cell[size][size];
    squareSize = width/size;
    for (int row = 0; row < grid.length; row++) {
      for (int col = 0; col < grid.length; col++) {
        grid[row][col] = new Cell(squareSize, col * squareSize, row * squareSize + 50);
      }
    }
    foundFlags = 0;
    totalMines = mines;
    minesPlaced = false;
    openedSquares = 0;
    lost = false;
    won = false;
  }

  //methods
  public int getMines(){
    return totalMines;
  }
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
    y = y - 50;
    if (x >= 0 && y >= 0 && x < grid.length * squareSize && y < grid.length * squareSize) {
      if (!minesPlaced) {
        placeMines(y/squareSize, x/squareSize);
      }
      explore(y/squareSize, x/squareSize);
      if (openedSquares + totalMines == grid.length * grid.length) {
        show.win();
      }
    }
  }

  public void explore(int row, int column) {
    if (row < grid.length && column < grid.length && row >= 0 && column >= 0) {
      Cell target = grid[row][column];
      if (!target.isOpen() && !target.hasFlag()) {
        boolean mined = target.excavate();
        if (!mined) {
          int neighbors = checkNeighs(row, column);
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
            textSize(37 - grid.length);
            target.printNeighbors(neighbors);
          }
        } else {
          show.lose();
          lost = true;
        }
      }
    }
  }

  public void rightClick(int x, int y) {
    if (minesPlaced) {
      y = y - 50;
      if (x >= 0 && y >= 0 && x < grid.length * squareSize && y < grid.length * squareSize) {
        grid[y/squareSize][x/squareSize].toggleFlag();
        Cell subj = grid[y/squareSize][x/squareSize];
        if(subj.hasFlag()){
          show.updateFlagCount(-1);
        }else if(!subj.hasFlag()){
          show.updateFlagCount(1);
        }
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
  
  public void redraw(){
    textSize(37 - grid.length);
    for(int i = 0; i<grid.length; i++){
     for(int j = 0; j<grid[0].length; j++){
       grid[i][j].redraw();
     }
    }
  }
  
  public boolean getWin() {
    return won;
  }
  public boolean getLose() {
    return lost;
  }
}
