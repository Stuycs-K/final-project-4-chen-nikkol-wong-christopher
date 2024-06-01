/**
 * Handles.
 *
 * Click and drag the white boxes to change their position.
 */

class Handle {
  boolean firstMousePress;
  int x, y;
  int boxx, boxy;
  int stretch;
  int size;
  boolean over;
  boolean press;
  boolean locked = false;
  boolean otherslocked = false;

  Handle(int ix, int iy, int il, int is) {
    x = ix;
    y = iy;
    stretch = il;
    size = is;
    boxx = x+stretch - size/2;
    boxy = y - size/2;
    firstMousePress = false;
  }

  void update() {
    boxx = x+stretch * 3/2;
    boxy = y - size/2;
    if (otherslocked == false) {
      overEvent();
      pressEvent();
    }

    if (press) {
      stretch = lock(mouseX-width/2-size/2, 0, width/2-size-1);
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
    if (over || locked) {
      press = true;
      locked = true;
      println("Press!");
    } else {
      press = false;
    }
  }

  void releaseEvent() {
    locked = false;
  }

  void display() {
    
    background(color(29,113,43));
    textAlign(CENTER);
    fill(color(200,255,200));
    rect(0, 0, width, 50);
    rect(5, 5, 100, 40);
    fill(0);
    textSize(20);
    text("Settings", 5, 15, 100, 25);
    fill(66,193,88);
    rect(width/4-10,height/4+25,270,70);
    rect(width/4-10,height/4+230,270,70);
    fill(0);
    textSize(50);
    text("# of Mines", width/4, height/4+45, 250, 50);
    text("Board Size", width/4, height/4+250, 250, 50);
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
