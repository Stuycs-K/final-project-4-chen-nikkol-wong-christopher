Displays result;
void setup(){
  size(500,550);
  result = new Displays();
}

void draw() {
}

void keyPressed(){
  result.restart();
}

void mousePressed(){
  if(mouseButton==LEFT){
    if (mouseY < 50 && mouseX < 100) {
      result.openSettings();
    }
    else {
      result.leftClick(mouseX, mouseY);
    }
  }
  if(mouseButton==RIGHT){
    result.rightClick(mouseX, mouseY);
  }
}
