public class Cell {
  boolean flag;
  boolean opened;
  boolean mineHere;
  int minesSurrounding;
  int squareSize;
  int xcoord;
  int ycoord;
  
  public Cell(int size, int x, int y){
    flag = false;
    opened = false;
    mineHere = false;
    minesSurrounding = 0;
    squareSize = size;
    xcoord = x;
    ycoord = y;
    rect(xcoord, ycoord, squareSize, squareSize);
  }
  
  /*
  0: mine found
  1: no mine, but neighbors
  2: no mine and no neighbors
  */
  public int excavate(){
    if (!opened && !flag) {
      opened = true;
      if (mineHere) {
        fill(0, 0, 255);
        rect(xcoord, ycoord, squareSize, squareSize);
        return 0;
      }
      else {
        fill(255, 225, 128);
        rect(xcoord, ycoord, squareSize, squareSize);
      }
    }
    if (minesSurrounding == 0) {
      return 2;
    }
    return 1;
  }
  public int getNeighbor(){
    return minesSurrounding;
  }
  public void toggleFlag(){
    if (!opened) {
      if (flag) {
        fill(80, 224, 80);
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
  
  public void setMine(boolean mine) {
    mineHere = mine;
  }
  public void setMinesSurrounding(int value){
    minesSurrounding = value;
  }
  public boolean isOpen() {
    return opened;
  }
}
