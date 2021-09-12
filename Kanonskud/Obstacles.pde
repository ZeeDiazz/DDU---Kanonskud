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
    fill(255,0,0);
    imageMode(CORNER);
    //Øverste forhindring
    image(wallImg,x,0,w,hTop);
    
    //Nederste forhindring
    image(wallImg,x,hTop+spaceBetween,w,height); 
  }
}
