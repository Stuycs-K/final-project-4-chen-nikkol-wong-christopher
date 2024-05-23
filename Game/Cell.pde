public class Cell {
  boolean flag;
  boolean opened;
  boolean mineHere;
  int minesSurrounding;
  
  public Cell(){
    flag = false;
    opened = false;
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
}
