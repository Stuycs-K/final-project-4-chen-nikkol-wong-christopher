public class Minefield{
  Cell[][] grid;
  int foundFlags;
  int totalMines;
  int squareSize;
  boolean settingsOpen;
  boolean inGame;
  
  public Minefield(){
    this(15, 40);
  }
  public Minefield(int size, int mines){
    grid = new Cell[size][size];
    squareSize = width/grid.length;
    for (int row = 0; row < grid.length; row++) {
      for (int col = 0; col < grid.length; col++) {
        grid[row][col] = new Cell();
        fill(80, 224, 80);
        rect(col * squareSize, row * squareSize, squareSize, squareSize);
      }
    }
    
    foundFlags = 0;
    totalMines = mines;
    settingsOpen = false;
    inGame = false;
  }
  
  //methods
  public void setupGame(){
  }
  
  public void leftClick(int row, int col){
    grid[row][col].excavate();
  }
  public void rightClick(int row, int col){
    grid[row][col].toggleFlag();
  }
  public void win(){
  }
  public void lose(){
  }
  public void restart(){
  }
  public void openSetting(){
  }
  public void setSize(){
  }
  public void setMines(){
  }
}
