public class Cell {
  boolean flag;
  boolean opened;
  boolean mineHere;
  int minesSurrounding;
  
  public Cell(){
    flag = false;
    opened = false;
    mineHere = false;
    minesSurrounding = 0;
  }
  public boolean excavate(){
    
    return true;
  }
  public int getNeighbor(){
    return minesSurrounding;
  }
  public void toggleFlag(){
    flag = !flag;
  }
  
  public boolean getMine() {
    return mineHere;
  }
  
  public void setMinesSurrounding(int mine){
    minesSurrounding = mine;
  }
  public void setMine(boolean mine) {
    mineHere = mine;
  }
}
