class Button{
  //PImage bg;
  
  float x,y,w,h,textSize, textX, textY;
  String text;
  boolean isPressed = false;
  boolean isReleased = true;
  
  Button(float _x, float _y, float _w, float _h, float ts, float tx, float ty, String txt){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    textSize = ts;
    text = txt;
    textX = tx;
    textY = ty;
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
    //bg =  loadImage("landscape.png");
    //background(bg);
    
    textSize(100);
    text("CanonBall",280,150);
    
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
        textSize(textSize);
      fill(10);
      text(text,textX,textY);
  }
  
  void mouseHover(){
    cursor(HAND);
    if(checkMouse()){
      cursor(POINT);
      return;
    }
    
  }
}
