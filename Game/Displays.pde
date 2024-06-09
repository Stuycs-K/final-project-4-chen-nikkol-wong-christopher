public class Displays{
  Minefield map;
  boolean inGame;
  boolean settingsOpen;
  Handle[] handles;
  boolean firstMousePress;
  int currentSize;
  int totalMines;
  int unflaggedMines;
  boolean messageOpen;
  
  public Displays(){
    fill(245, 222, 159);
    rect(0, 50, width, height);
    fill(color(200,255,200));
    rect(0, 0, width, 50);
    rect(5, 5, 100, 40);
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Settings", 5, 15, 100, 25);
    map = new Minefield(this);
    totalMines = map.getMines(); //make accessor to acces minefield total mines varibale
    unflaggedMines = map.getMines();
    settingsOpen = false;
    inGame = true; 
    currentSize = 15;
    firstMousePress = false;
    handles = new Handle[2];
    for (int i = 0; i < handles.length; i++) {
      handles[i] = new Handle(width/4, height/2+(i*190) - 70, 120, 10, handles, this);
    }
    messageOpen = false;
    
    fill(color(200,255,200));
    rect(215, 5, 175, 40);
    fill(0);
    textSize(20);
    text("Flag Counter: " + unflaggedMines, 300, 30);
  }

  public void lose(){
    inGame = false;
    fill(255,255,255);
    rect(width/4 - 10,height/4,width/2 + 20,height/2);
    fill(0,0,0);
    textSize(25);
    text("You Clicked On A Mine", width/2, height/2-50);
    textSize(15);
    text("Left-Click or Press Space to Restart", width/2, height/2+40);
    text("Press H to hide message and see board", width/2, height/2 + 90);
    messageOpen = true;
  }

  public void win(){
    fill(255,255,255);
    rect(width/4 - 10,height/4,width/2 + 20,height/2);
    fill(0,0,0);
    textSize(25);
    text("You Won!!!", width/2, height/2-50);
    textSize(15);
    text("Left-Click or Press Space to Restart", width/2, height/2+40);
    text("Press H to hide message and see board", width/2, height/2 + 90);
    inGame = false;
    messageOpen = true;
  }
  
  public void restart(){
    if (!settingsOpen) {
      map = new Minefield(this, currentSize, totalMines);
      unflaggedMines = totalMines;
      inGame = true;
      fill(color(200,255,200));
      rect(215, 5, 175, 40);
      fill(0);
      textSize(20);
      text("Flag Counter: " + unflaggedMines, 300, 30);
    }
  }
  
  public void rightClick(int x, int y) {
    if (inGame) {
      map.rightClick(x, y);
    }
  }
  
  public void leftClick(int x, int y) {
    pressHandles();
    if (y > 5 && y < 45 && x > 5 && x < 105) {
      openSettings();
    }
    else if (y > 50) {
      if (inGame) {
        map.leftClick(x, y);
      }
      else if (settingsOpen) {
        if (x > width/2 - 100 && x < width/2 + 100 && y > 455 && y < 525) {
          apply(handles[1].getSize(), handles[0].getMines());
        }
      }
      else {
        restart();
      }
    }
  }
  
  public void openSettings(){
    if(settingsOpen == true){
      settingsOpen = false;
      map.redraw();
      if(map.getLose()){
        if (messageOpen) {
          lose();
        }
      }
      else if (map.getWin()) {
        if (messageOpen) {
          win();
        }
      }
      else{
        inGame = true;
      }
    }else{
      settingsOpen = true;
      inGame = false;
      firstMousePress = false;
    }
  }
  
  void drawHandles() {
    if (settingsOpen) {
      fill(245, 222, 159);
      rect(0, 50, width, height);
      fill(200,255,200);
      rect(width/2 - 100, 455, 200, 70);
      fill(0);
      textSize(40);
      text("Apply", width/4, 470, 250, 50);
      
      for (int i = 0; i < handles.length; i++) {
        handles[i].update();
        handles[i].display();
      }
    
      //After it has been used in the sketch, set it back to false
      if (firstMousePress) {
        firstMousePress = false;
      }
    }
  }
  void pressHandles() {
    if (settingsOpen) {
      if (!firstMousePress) {
        firstMousePress = true;
      }
    }
  }
  
  void releaseHandles() {
    if (settingsOpen) {
      for (int i = 0; i < handles.length; i++) {
        handles[i].releaseEvent();
      }
    }
  }
  
  public boolean isFirstMousePress() {
    return firstMousePress;
  }
  
  public void apply(int size, int mines) {
    currentSize = size;
    totalMines = mines;
    unflaggedMines = mines;
    fill(color(200,255,200));
    rect(215, 5, 175, 40);
    fill(0);
    textSize(20);
    text("Flag Counter: " + unflaggedMines, 300, 30);
    map = new Minefield(this, currentSize, totalMines);
    openSettings();
  }
  
  public void decreaseCounter() {
    unflaggedMines--;
    fill(color(200,255,200));
    rect(215, 5, 175, 40);
    fill(0);
    textSize(20);
    text("Flag Counter: " + unflaggedMines, 300, 30);
  }
  
  public void increaseCounter() {
    unflaggedMines++;
    fill(color(200,255,200));
    rect(215, 5, 175, 40);
    fill(0);
    textSize(20);
    text("Flag Counter: " + unflaggedMines, 300, 30);
  }
  
  public void toggleMessage() {
    if (!settingsOpen) {
      if (messageOpen) {
        map.redraw();
        messageOpen = false;
      }
      else if (map.getWin()) {
        win();
        messageOpen = true;
      }
      else if (map.getLose()) {
        lose();
        messageOpen = true;
      }
    }
  }
}
