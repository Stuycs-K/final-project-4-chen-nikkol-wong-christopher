Displays result;

void setup(){
  size(500,550);
  result = new Displays();
}

void draw() {
  result.drawHandles();
}

void keyPressed(){
  if (key == ' ') {
    result.restart();
  }
  else if (key == 'h' || key =='H') {
    result.toggleMessage();
  }
}

void mousePressed(){
  if(mouseButton==LEFT){
    result.leftClick(mouseX, mouseY);
  }
  else if(mouseButton==RIGHT){
    result.rightClick(mouseX, mouseY);
  }
}

void mouseReleased(){
  result.releaseHandles();
}
