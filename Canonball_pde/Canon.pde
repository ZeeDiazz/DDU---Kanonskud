 class Canon {
  float ballSpeed = 950;
  
  void cannon() { 
    
    pushMatrix();
      translate(50,780);
      rotate(getDir());
      rect (0,0,50,20);
    popMatrix();
    
    
  }
  
  void shoot() {
    Mover m = new Mover();
    m.loc.y = height - m.loc.x; 
    
    float dire = getDir();
    float rot = dire + PI/2;
    
    float x = sin(rot) * ballSpeed;
    float y = -cos(rot) * ballSpeed;

    m.applyForce( new PVector(x, y));

    moves.add(m);
  }
  
  
  float getDir() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector cannon = new PVector(16, height + 72);
    PVector dire = PVector.sub(mouse, cannon);    
    return atan2(dire.y+20, dire.x);
  }
  
 }
 
 
