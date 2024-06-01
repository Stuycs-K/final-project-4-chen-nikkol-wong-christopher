Displays result;

void setup(){
  size(500,550);
  result = new Displays();
  if(result.settingsOpen){
    setupH();
  }
}

void draw() {
  if(result.settingsOpen){
    drawHa();
  }
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
    mousePressedH();
  }
  else if(mouseButton==LEFT){
    result.leftClick(mouseX, mouseY);
  }
  else if(mouseButton==RIGHT){
    result.rightClick(mouseX, mouseY);
  }
}

void mouseReleased(){
  if(result.settingsOpen){
    mouseReleasedH();
  }

}
