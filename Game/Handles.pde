/**
 * Handles.
 *
 * Click and drag the white boxes to change their position.
 */




//True if a mouse button has just been pressed while no other button was.

/*
void setupH() {
  size(640, 360);
  handles = new Handle[2];
  for (int i = 0; i < handles.length; i++) {
    handles[i] = new Handle(width/3, height/3+(i*70), 5, 10, handles);
  }
}

void drawH() {
  background(153);

  for (int i = 0; i < handles.length; i++) {
    handles[i].update();
    handles[i].display();
  }

  //fill(0);
  //rect(0, 0, width/2, height);

  //After it has been used in the sketch, set it back to false
  if (firstMousePress) {
    firstMousePress = false;
  }
}


void mousePressedH() {
  
  if (!firstMousePress) {
    firstMousePress = true;
  }
}

void mouseReleasedH() {
  for (int i = 0; i < handles.length; i++) {
    handles[i].releaseEvent();
  }
}
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
  Handle[] others; // array of handles

  Handle(int ix, int iy, int il, int is, Handle[] o) {
    x = ix;
    y = iy;
    stretch = il;
    size = is;
    boxx = x+stretch - size/2;
    boxy = y - size/2;
    others = o;
    firstMousePress = false;
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
      stretch = lock(mouseX-width/4-size/2, 0, 240);
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
    if (over && firstMousePress || locked) {
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
