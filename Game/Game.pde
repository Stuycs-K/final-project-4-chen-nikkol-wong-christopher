Minefield map;
Displays result;
void setup(){
  size(500,500);
  map = new Minefield();
}

void draw(){
}

void keyPressed(){
  result = new Displays();
  result.restart();
}

void mousePressed(){
  if(mouseButton==LEFT){
    map.leftClick(mouseX, mouseY);
  }
  if(mouseButton==RIGHT){
    map.rightClick(mouseX, mouseY);
  }
}
