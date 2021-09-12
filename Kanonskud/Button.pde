class Button{
  //PImage bg;
  
  float x,y,w,h,textSize;
  String text;
  boolean isPressed = false;
  boolean isReleased = true;
  
  Button(float _x, float _y, float _w, float _h, float _textSize, String _text){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    textSize = _textSize;
    text = _text;
  }
  
  void update(){
    if(isReleased){
      isPressed = false;
    }
  }
  
  boolean checkMouse(){
    if(mouseX > x && mouseX < x + w){
      if(mouseY > y && mouseY < y + h){
        return true;
      }
    }
    return false;
  }
  
  void display(){
    mouseHover();
    if(isPressed){
      fill(255);
      strokeWeight(3);
      rect(x,y,w,h);

    }
    if(isReleased){
      fill(255);
      strokeWeight(1);
      rect(x,y,w,h);
    }
      textAlign(CENTER, CENTER);
      textSize(textSize);
      fill(10);
      text(text,x+w/2,y+h/2);
  }
  
  void mouseHover(){
    if(checkMouse()){
      cursor(HAND);
      return;
    }    
  }
}
