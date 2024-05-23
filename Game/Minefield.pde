public class Minefield{
  Cell[][] grid;
  int foundFlags;
  int totalMines;
  boolean settingsOpen;
  boolean inGame;
  
  public Minefield(){
    this(10);
  }
  public Minefield(int n){
    grid = new Cell[n][n];
    foundFlags = 0;
    settingsOpen = false;
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
