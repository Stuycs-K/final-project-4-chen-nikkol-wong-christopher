class Handle {

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
    boxx = x+stretch;
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
      stretch = lock(mouseX-width/4-size/2, 0, width/2-size-1);
    }
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
  

  void display() {
    
    fill(255);
    rect(x+270, y-100, 50,50);
    line(x + 0, y-5, x, y+5);
    line(x + 50, y-5, x+50, y+5);
    line(x + 100, y-5, x+100, y+5);
    line(x + 150, y-5, x+150, y+5);
    line(x + 200, y-5, x+200, y+5);
    line(x + 250, y-5, x+250, y+5);
    
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
