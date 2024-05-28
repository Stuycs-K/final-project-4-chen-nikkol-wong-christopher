public class Displays{
  public Displays(){
    
  }
  public void win(){
    
  }
  public void lose(){
    fill(255,255,255);
    rect(width/4,height/4,width/2,height/2);
    fill(0,0,0);
    textSize(25);
    text("You Clicked On A Mine", width/2, height/2-10);
    textSize(15);
    text("Press Any Key to Restart", width/2, height/2+50);
  }
  public void restart(){
    setup();
  }
  public void openSettings(){
  }
}
