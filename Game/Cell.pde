public class Cell {
  boolean flag;
  boolean opened;
  boolean mineHere;
  int squareSize;
  int xcoord;
  int ycoord;
  int minesSurrounding;
  
  public Cell(int size, int x, int y){
    flag = false;
    opened = false;
    mineHere = false;
    squareSize = size;
    xcoord = x;
    ycoord = y;
    minesSurrounding = 0;
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
      return false;
    }
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
  
  public void printNeighbors(int num) {
    minesSurrounding = num;
    if (num == 1) {
      fill(0, 0, 200);
    }
    else if (num == 2) {
      fill(0, 200, 0);
    }
    else if (num == 3) {
      fill(200, 0, 0);
    } 
    else if (num == 4) {
      fill(200, 0, 200);
    }
    else if (num == 5) {
      fill(222, 163, 0);
    }
    else if (num == 6) {
      fill(0, 200, 200);
    }
    else if (num == 7) {
      fill(64, 64, 64);
    }
    else if (num == 8) {
      fill(164, 164, 164);
    }
    text(num + "", xcoord, ycoord + squareSize/4.0, squareSize, squareSize);
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
  public void redraw(){
    if(opened){
      if (mineHere) {
        fill(0, 0, 255);
        rect(xcoord, ycoord, squareSize, squareSize);
      }
      else {
        fill(245, 222, 159);
        rect(xcoord, ycoord, squareSize, squareSize);
        printNeighbors(minesSurrounding);
      }
    }
    else {
      fill(60, 201, 91);
      rect(xcoord, ycoord, squareSize, squareSize);
    }
    if (flag) {
      fill(255, 0, 0);
      circle(xcoord + squareSize/2.0, ycoord + squareSize/2.0, squareSize);
    }
  }
}
