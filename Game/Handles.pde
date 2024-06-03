/**
 * Handles.
 *
 * Click and drag the white boxes to change their position.
 */

Handle[] handles;

//True if a mouse button has just been pressed while no other button was.
boolean firstMousePress = false;

void setupH() {
  handles = new Handle[2];
      for (int i = 0; i < handles.length; i++) {
        handles[i] = new Handle(width/4, height/2+(i*200), 0, 10, handles);
      }
}

void drawHa() {
  background(color(29,113,43));

  for (int i = 0; i < handles.length; i++) {
    handles[i].update();
    handles[i].display();
  }

 // fill(0);
 // rect(0, 0, width/2, height);

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

  Handle(int ix, int iy, int il, int is, Handle[] o) {
    x = ix;
    y = iy;
    stretch = il;
    size = is;
    boxx = x+stretch - size/2;
    boxy = y - size/2;
    others = o;
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
    boardS = returnB();
    mineN = returnM();
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
  
  int returnM(){
    if(boxx >= x && boxx < x+ 50){
      return 30;
    } else if(boxx >= x+50 && boxx < x+100){
      return 35;
    } else if(boxx >= x+100 && boxx < x+150){
      return 40;
    } else if(boxx >= x+ 150 && boxx < x+ 200){
      return 45;
    }else{
      return 50;
    }
  }
  
  int returnB(){
    if(boxx >= x && boxx < x+ 50){
      return 9;
    } else if(boxx >= x+50 && boxx < x+100){
      return 12;
    } else if(boxx >= x+100 && boxx < x+150){
      return 15;
    } else if(boxx >= x+ 150 && boxx < x+ 200){
      return 18;
    }else{
      return 21;
    }
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
    fill(255);
    rect(x+270, y-100, 50,50);
    fill(0);
    textSize(25);
    if(y>width/2+30){
      textSize(20);
      text(boardS + " X " + boardS, x+295, y-70);
    }else{
      text(mineN + "", x+290, y-70);
    }
    
    
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
