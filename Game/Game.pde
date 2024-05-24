Minefield map;

void setup(){
  size(500,500);
  map = new Minefield();
}

void draw(){
}

void keyPressed(){
}

void mousePressed(){
  if(mouseButton==LEFT){
    map.leftClicker(mouseX, mouseY);
  }
  if(mouseButton==RIGHT){
    map.rightClick(mouseX, mouseY);
  }
}
