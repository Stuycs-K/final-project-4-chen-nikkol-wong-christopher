public class Displays{
  Minefield map;
  boolean settingsOpen;
  boolean inGame;
  Handle[] handles;
  boolean firstMousePress;
  int currentSize;
  int totalMines;
  
  public Displays(){
    background(color(29,113,43));
    fill(color(200,255,200));
    rect(0, 0, width, 50);
    rect(5, 5, 100, 40);
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Settings", 5, 15, 100, 25);
    map = new Minefield(this);
    settingsOpen = false;
    inGame = true; 
    firstMousePress = false;
    currentSize = 15;
    totalMines = 40;
  }
  public void win(){
    fill(255,255,255);
    rect(width/4,height/4,width/2,height/2);
    fill(0,0,0);
    textSize(25);
    text("You Won!!!", width/2, height/2-10);
    textSize(15);
    text("Press Any Key to Restart", width/2, height/2+50);
    inGame = false;
  }
  public void lose(){
    fill(255,255,255);
    rect(width/4,height/4,width/2,height/2);
    fill(0,0,0);
    textSize(25);
    text("You Clicked On A Mine", width/2, height/2-10);
    textSize(15);
    text("Press Any Key to Restart", width/2, height/2+50);
    inGame = false;
  }
  public void restart(){
    map = new Minefield(this, currentSize, totalMines);
    inGame = true;
  }
  
  public void rightClick(int x, int y) {
    if (inGame) {
      map.rightClick(x, y);
    }
  }
  
  public void leftClick(int x, int y) {
    if (inGame) {
      map.leftClick(x, y);
    }
  }
  
  public void show(){
    map.redraw();
  }
  public void openSettings(){
    if(settingsOpen == true){
      settingsOpen = false;
      show();
      if(map.lost){
        lose();
      }
      else if (map.won) {
        win();
      }
      else{
        inGame = true;
      }
    }else{
      settingsOpen = true;
      inGame = false;
      //slider code
      handles = new Handle[2];
      for (int i = 0; i < handles.length; i++) {
        handles[i] = new Handle(width/4, height/2+(i*200), 0, 10, handles, this);
      }
      //slider code
    }
  }
  public void drawH(){
    if (settingsOpen) {
      fill(color(29,113,43));
      rect(0, 50, width, height);
      fill(66,193,88);
      rect(width/4-10,height/4+25,270,70);
      rect(width/4-10,height/4+230,270,70);
      fill(0);
      textSize(50);
      text("# of Mines", width/4, height/4+45, 250, 50);
      text("Board Size", width/4, height/4+250, 250, 50);
      
      for (int i = 0; i < handles.length; i++) {
        handles[i].update();
        handles[i].display();
      }
      if (firstMousePress) {
        firstMousePress = false;
      }
    }
  }
  public void mouseR(){
    if (settingsOpen) {
      for (int i = 0; i < handles.length; i++) {
        handles[i].releaseEvent();
      }
    }
  }
  public void mouseP(){
    if (settingsOpen) {
      if (!firstMousePress) {
         firstMousePress = true;
      }
    }
  }
  public void setSize(int size) {
    currentSize = size;
    map = new Minefield(this, currentSize, totalMines);
  }
  public void setNumMines(int mines) {
    totalMines = mines;
    map = new Minefield(this, currentSize, totalMines);
  }
  
  public boolean isFirstMousePress() {
    return firstMousePress;
  }
}
