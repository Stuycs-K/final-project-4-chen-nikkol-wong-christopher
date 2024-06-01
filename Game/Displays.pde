public class Displays{
  Minefield map;
  boolean settingsOpen;
  boolean inGame;
  int currentSize;
  int totalMines;
  
  public Displays(){
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
    //firstMousePress = false;
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
    map.shows();
  }
  public void openSettings(){
    if(settingsOpen == true){
      settingsOpen = false;
      show();
      fill(color(200,255,200));
      rect(0, 0, width, 50);
      rect(5, 5, 100, 40);
      fill(0);
      textSize(20);
      text("Settings", 5, 15, 100, 25);
      if(map.lost){
        lose();
      }else{
        inGame = true;
      }
    }else{
      settingsOpen = true;
      fill(0,0,0);
      textSize(25);
      text("Settings", width/2, height/2-85);
      inGame = false;
      //slider code
      setupH();
      //slider code
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
}
