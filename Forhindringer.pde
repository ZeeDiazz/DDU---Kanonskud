class Forhindringer{
  //Data
  float hTop, x, w, pladsImellem;;
  
  //Konstruktør
  Forhindringer(float x_, float w_, float _hTop, float _pladsImellem){
    x=x_;
    w=w_;
    hTop = _hTop;
    pladsImellem = _pladsImellem;
  }
  
  void lavForhindringer(){
    fill(255,0,0);
    //Øverste forhindring
    rect(x,0,w,hTop);
    
    fill(0,255,0);
    //Nederste forhindring
    rect(x,hTop+pladsImellem,w,height);
    
    
  }
}
