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
    squareSize = size;
    xcoord = x;
    ycoord = y;
    rect(xcoord, ycoord, squareSize, squareSize);
  }
  
  public boolean excavate(){
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
  
  public void placeMine(boolean mine) {
    mineHere = mine;
  }

  public boolean isOpen() {
    return opened;
  }
  
  public boolean hasFlag() {
    return flag;
  }
}
