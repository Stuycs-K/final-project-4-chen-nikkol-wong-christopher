Displays result;
void setup(){
  size(500,500);
  result = new Displays();
}

void draw() {
}

void keyPressed(){
  if(result.settingsOpen == true && key=='s'){
    result.openSettings();
  }else{
    if(key != 's'){
      result.restart();
    }
    if(key == 's'){
      result.openSettings();
    }
  }
}

void mousePressed(){
  if(mouseButton==LEFT){
    result.leftClick(mouseX, mouseY);
  }
  if(mouseButton==RIGHT){
    result.rightClick(mouseX, mouseY);
  }
}
