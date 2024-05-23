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
        grid[row][col] = new Cell(squareSize, col * squareSize, row * squareSize);
      }
    }
    
    foundFlags = 0;
    totalMines = mines;
    settingsOpen = false;
    inGame = false;
    placeMines();
    
    
    /*fill(224, 80, 80);
    for (int row = 0; row < grid.length; row++) {
      for (int col = 0; col < grid.length; col++) {
        if (grid[row][col].getMine()) {
          rect(col * squareSize, row * squareSize, squareSize, squareSize);
        }
      }
    }*/
  }
  
  //methods
  public void placeMines(){
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
  

  public void leftClick(int x, int y){
    try {
      //grid[y/squareSize][x/squareSize].excavate();
      explore(y/squareSize,x/squareSize);
    }
    catch (ArrayIndexOutOfBoundsException e) {};
  }
  public void rightClick(int x, int y){
    try {
      grid[y/squareSize][x/squareSize].toggleFlag();
    }
    catch (ArrayIndexOutOfBoundsException e) {}
  }
  public void explore(int row, int column){
    if(!grid[row][column].excavate()){ //assuming it's when there is no mine
      if(checkNeighs(row,column) == 0){
        explore(row, column +1);
        explore(row, column -1);
        explore(row+1, column);
        explore(row+1, column +1);
        explore(row+1, column -1);
        explore(row-1, column);
        explore(row-1,column+1);
        explore(row-1,column-1);
      }else{
        Cell current = grid[row][column];
        text(checkNeighs(row,column) + "", current.xcoord, current.ycoord, current.squareSize, current.squareSize);
      }
    }
  }
  public int checkNeighs(int row, int col){
   int total = 0;
   for(int i = -1; i<2; i++){
     for(int j = -1; j<2; j++){
       Cell current = grid[row+i][col+j];
       if(current.getMine()){
         total ++;
       }
     }
   }
   grid[row][col].setMinesSurrounding(total); 
   return total;
  }
  public void setSize(){
  }
  public void setMines(){
  }
}
