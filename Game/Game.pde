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
    map.leftClick(mouseY/50,mouseX/50);
  }
  if(mouseButton==RIGHT){
    map.rightClick(mouseY/50,mouseX/50);
  }
}
