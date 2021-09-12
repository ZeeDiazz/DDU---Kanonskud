class Obstacles{
  //Data
  float hTop, x, w, spaceBetween;
  
  //Konstruktør
  Obstacles(float x_, float w_, float _hTop, float _spaceBetween){
    x=x_;
    w=w_;
    hTop = _hTop;
    spaceBetween = _spaceBetween;
  }
  
  void makeObstacles(){
    strokeWeight(2);
    stroke(0);
    fill(200,100,100);
    //Øverste forhindring
    rect(x,0,w,hTop);
    
    //Nederste forhindring
    rect(x,hTop+spaceBetween,w,height); 
  }
}
