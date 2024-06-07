public class Cell {
  boolean flag;
  boolean opened;
  boolean mineHere;
  int squareSize;
  int xcoord;
  int ycoord;
  int minesSurrounding;
  color mine;
  boolean incorrect;
  
  public Cell(int size, int x, int y){
    flag = false;
    opened = false;
    mineHere = false;
    incorrect = false;
    squareSize = size;
    xcoord = x;
    ycoord = y;
    minesSurrounding = 0;
    rect(xcoord, ycoord, squareSize, squareSize);
    int red = (int)(Math.random() * 205) + 50;
    int green = (int)(Math.random() * 205) + 50;
    int blue = (int)(Math.random() * 205) + 50;
    mine = color(red, green, blue);
  }
  
  public boolean excavate(){
    opened = true;
    if (mineHere) {
      fill(mine);
      rect(xcoord, ycoord, squareSize, squareSize);
      fill(red(mine) - 50, green(mine) - 50, blue(mine) - 50);
      circle(xcoord + squareSize/2, ycoord + squareSize/2, squareSize * 3/4);
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
        strokeWeight(3);
        stroke(255, 0, 0);
        line(xcoord + 9, ycoord + 5, xcoord + 9, ycoord + squareSize - 5);
        line(xcoord + 6, ycoord + squareSize - 5, xcoord + 12, ycoord + squareSize - 5);
        strokeWeight(1);
        triangle(xcoord + 9, ycoord + 3, xcoord + squareSize - 5, ycoord + 2*squareSize/7 + 3, xcoord + 9, ycoord + 4*squareSize/7 + 3);
        stroke(0);
        flag = true;
        if(mineHere){
         // updateFlagCount(-1);
        }

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
        fill(mine);
        rect(xcoord, ycoord, squareSize, squareSize);
        fill(red(mine) - 50, green(mine) - 50, blue(mine) - 50);
        circle(xcoord + squareSize/2, ycoord + squareSize/2, squareSize * 3/4);
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
    if (incorrect) {
      misplace();
    }
    else if (flag) {
      fill(255, 0, 0);       
      strokeWeight(3);
      stroke(255, 0, 0);
      line(xcoord + 9, ycoord + 5, xcoord + 9, ycoord + squareSize - 5);
      line(xcoord + 6, ycoord + squareSize - 5, xcoord + 12, ycoord + squareSize - 5);
      strokeWeight(1);
      triangle(xcoord + 9, ycoord + 3, xcoord + squareSize - 2, ycoord + 2*squareSize/7 + 3, xcoord + 9, ycoord + 4*squareSize/7 + 3);
      stroke(0);
    }
  }
  
  public void misplace() {
    fill(60, 201, 91);
    rect(xcoord, ycoord, squareSize, squareSize);
    stroke(255, 0, 0);
    strokeWeight(3);
    line(xcoord + 3, ycoord + 3, xcoord + squareSize - 3, ycoord + squareSize - 3);
    line(xcoord + squareSize - 3, ycoord + 3, xcoord + 3, ycoord + squareSize - 3);
    strokeWeight(1);
    stroke(0);
    incorrect = true;
  }
}
