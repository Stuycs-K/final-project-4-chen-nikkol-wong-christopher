Minefield map;

void setup(){
  size(500,500);
  map = new Minefield();
}

void draw(){
}

void keyPressed(){
  for (int i = 0; i < height; i++) {
    for (int j = 0; i < width; j++) {
    
    }
  }
}

void mousePressed(){
  if(mouseButton==LEFT){
    map.leftClick(mouseX, mouseY);
  }
  if(mouseButton==RIGHT){
    map.rightClick(mouseX, mouseY);
  }
}
