Displays result;

void setup(){
  size(500,550);
  result = new Displays();
}

void draw() {
  if(result.isSettingsOpen()){
    result.drawH();
  }
}

void keyPressed(){
  result.restart();
}

void mousePressed(){
  if (mouseY > 5 && mouseY < 45 && mouseX > 5 && mouseX < 105){
    result.openSettings();
  }
  else if (result.isSettingsOpen()) {
    result.mouseP();
  }
  else if(mouseButton==LEFT){
    result.leftClick(mouseX, mouseY);
  }
  else if(mouseButton==RIGHT){
    result.rightClick(mouseX, mouseY);
  }
}

void mouseReleased() {
  if(result.settingsOpen){
    result.mouseR();
  }
}
