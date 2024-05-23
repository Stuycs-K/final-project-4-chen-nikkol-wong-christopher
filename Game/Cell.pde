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
  public boolean excavate(){
    if (!opened && !flag) {
      if (mineHere) {
        fill(0, 0, 255);
        rect(xcoord, ycoord, squareSize, squareSize);
        return true;
      }
      else {
        opened = true;
        fill(255, 225, 128);
        rect(xcoord, ycoord, squareSize, squareSize);
      }
    }
    return false;
  }
  public int getNeighbor(){
    return minesSurrounding;
  }
  public void toggleFlag(){
    flag = !flag;
  }
  
  public boolean getMine() {
    return mineHere;
  }
  
  public void setMine(boolean mine) {
    mineHere = mine;
  }
}
