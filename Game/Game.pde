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
    if (mouseY > 50) {
      result.leftClick(mouseX, mouseY);
      
    }
    else if (mouseY > 5 && mouseY < 45 && mouseX > 5 && mouseX < 105){
      result.openSettings();
    }
  }
  if(mouseButton==RIGHT){
    result.rightClick(mouseX, mouseY);
  }
}
