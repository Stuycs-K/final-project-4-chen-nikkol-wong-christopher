public class Cell {
  boolean flag;
  boolean opened;
  boolean mineHere;
  int squareSize;
  int xcoord;
  int ycoord;
  
  public Cell(int size, int x, int y){
    flag = false;
    opened = false;
    mineHere = false;
    //minesSurrounding = 0;
    squareSize = size;
    xcoord = x;
    ycoord = y;
    rect(xcoord, ycoord, squareSize, squareSize);
  }
  
  public boolean excavate(){
<<<<<<< HEAD
    
    return true;
  }
  public int getNeighbor(){
    return minesSurrounding;
=======
    opened = true;
    if (mineHere) {
      fill(0, 0, 255);
      rect(xcoord, ycoord, squareSize, squareSize);
      return true;
    }
    else {
      fill(245, 222, 159);
      rect(xcoord, ycoord, squareSize, squareSize);
    }
    return false;
>>>>>>> e1d3f63bfa108ec774379018ae65d1cc3c845085
  }

  public void toggleFlag(){
    if (!opened) {
      if (flag) {
        fill(60, 201, 91);
        rect(xcoord, ycoord, squareSize, squareSize);
        flag = false;
      }
      else {
        fill(255, 0, 0);
        circle(xcoord + squareSize/2.0, ycoord + squareSize/2.0, squareSize);
        flag = true;
      }
    }
  }
  
  public boolean getMine() {
    return mineHere;
  }
  
<<<<<<< HEAD
  public void setMinesSurrounding(int mine){
    minesSurrounding = mine;
  }
  public void setMine(boolean mine) {
=======
  public void placeMine(boolean mine) {
>>>>>>> e1d3f63bfa108ec774379018ae65d1cc3c845085
    mineHere = mine;
  }

  public boolean isOpen() {
    return opened;
  }
  
  public boolean hasFlag() {
    return flag;
  }
}
