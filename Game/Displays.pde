public class Displays{
  
  Minefield map;
  boolean settingsOpen;
  boolean inGame;
  
  public Displays(){
    map = new Minefield(this);
    settingsOpen = false;
    inGame = true;
    
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
    map = new Minefield(this);
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
  
  public void openSettings(){
  }
  public void setSize() {
  }
  public void setNumMines() {
  }
}
