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
    fill(80, 224, 80);
    grid = new Cell[size][size];
    squareSize = width/grid.length;
    for (int row = 0; row < grid.length; row++) {
      for (int col = 0; col < grid.length; col++) {
        grid[row][col] = new Cell();
        rect(col * squareSize, row * squareSize, squareSize, squareSize);
      }
    }
    
    foundFlags = 0;
    totalMines = mines;
    settingsOpen = false;
    inGame = false;
    
    fill(224, 80, 80);
    setupGame();
  }
  
  //methods
  public void setupGame(){
    for (int i = 0; i < totalMines; i++) {
      int row = (int)(Math.random() * grid.length);
      int col = (int)(Math.random() * grid.length);
      while (grid[row][col].getMine()) {
        row = (int)(Math.random() * grid.length);
        col = (int)(Math.random() * grid.length);
      }
      grid[row][col].setMine(true);
      rect(col * squareSize, row * squareSize, squareSize, squareSize);
    }
  }
  
  public void leftClick(int row, int col){
    grid[row][col].excavate();
    
  }
  public void rightClick(int row, int col){
    grid[row][col].toggleFlag();
  }
  public boolean explore(int row, int column){
    return true;
  }
  public void checkNeighs(int row, int col){
   int total = 0;
   Cell current = grid[row][col-1];
   if(current.getMine()){
     total ++;
   }
   current = grid[row][col+1];
   if(current.getMine()){
     total ++;
   }
   current = grid[row+1][col+1];
   if(current.getMine()){
     total ++;
   }
   current = grid[row+1][col-1];
   if(current.getMine()){
     total ++;
   }
   current = grid[row+1][col];
   if(current.getMine()){
     total ++;
   }
   current = grid[row-1][col+1];
   if(current.getMine()){
     total ++;
   }
   current = grid[row-1][col-1];
   if(current.getMine()){
     total ++;
   }
   current = grid[row-1][col];
   if(current.getMine()){
     total ++;
   }
   grid[row][col].setMinesSurrounding(total); 
  }
  public void setSize(){
  }
  public void setMines(){
  }
}
