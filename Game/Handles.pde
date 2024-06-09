class Handle {
  int boardS;
  int mineN;
  int x, y;
  int boxx, boxy;
  int stretch;
  int size;
  boolean over;
  boolean press;
  boolean locked = false;
  boolean otherslocked = false;
  Handle[] others;
  Displays display;

  Handle(int ix, int iy, int il, int is, Handle[] o, Displays d) {
    x = ix;
    y = iy;
    stretch = il;
    size = is;
    boxx = x+stretch - size/2;
    boxy = y - size/2;
    others = o;
    display = d;
  }

  void update() {
    boxx = x + stretch;
    boxy = y - size/2;
    for (int i=0; i<others.length; i++) {
      if (others[i].locked == true) {
        otherslocked = true;
        break;
      } else {
        otherslocked = false;
      }
    }
    if (otherslocked == false) {
      overEvent();
      pressEvent();
    }

    if (press) {
      stretch = lock(mouseX-width/4-size/2, 0, width/2-size);
    }
    boardS = getSize();
    mineN = getMines();
  }

  void overEvent() {
    if (overRect(boxx, boxy, size, size)) {
      over = true;
    } else {
      over = false;
    }
  }

  void pressEvent() {
    if (over && display.isFirstMousePress() || locked) {
      press = true;
      locked = true;
    } else {
      press = false;
    }
  }

  void releaseEvent() {
    locked = false;
  }
  
  int getMines(){
    return ((stretch + size/2)/60) * 5  + 30;
  }
  
  int getSize(){
    return (stretch + size/2)/24 + 10;
  }
  
  void display() {
    if (this == others[0]) {
      fill(200,255,200);
      rect(width/4-10,height/4-25,270,70);
      fill(0);
      textSize(40);
      text("# of Mines: " + mineN, width/4, height/4-5, 250, 50);
    }
    else {
      fill(200,255,200);
      rect(width/4-10,height/4+180,270,70);
      fill(0);
      textSize(30);
      text("Board Size: " + boardS + " X " + boardS, width/4, height/4+200, 250, 50);
    }
    
    if (this == others[0]) {
      for (int i = 0; i <= 4; i++) {
        line(width/8.0 * i + width/4.0, y - 5, width/8.0 * i + width/4.0, y + 5);
      }
    }
    else {
      for (int i = 0; i <= 10; i++) {
        line(width/4.0 + width/20.0 * i, y-5, width/4.0 + width/20.0 * i, y+5);
      }
    }
    
    line(x, y, x+250, y);
    fill(255);
    stroke(0);
    rect(boxx, boxy, size, size);
    // x over box when hovered
    if (over || press) {
      line(boxx, boxy, boxx+size, boxy+size);
      line(boxx, boxy+size, boxx+size, boxy);
    }
  }

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  
  int lock(int val, int minv, int maxv) {
    return  min(max(val, minv), maxv);
  }
}
