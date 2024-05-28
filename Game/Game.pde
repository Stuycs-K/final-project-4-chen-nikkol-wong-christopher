Displays result;
void setup(){
  size(500,500);
  result = new Displays();
}

void draw() {
}

void keyPressed(){
  result.restart();
}

void mousePressed(){
  if(mouseButton==LEFT){
    result.leftClick(mouseX, mouseY);
  }
  if(mouseButton==RIGHT){
    result.rightClick(mouseX, mouseY);
  }
}
