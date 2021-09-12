class Canon{
  float ballSpeed = 1200;
  float x = 50;
  float y = 780;
  
  void makeCannon() { 
    imageMode(CENTER);
    //Rotating cannon
    image(wheelImg,x-5,y-5);
    
    pushMatrix();
      fill(100,255,255);
      translate(x,y);
      rotate(getDir());
      image (canonImg,40,-25);
    popMatrix(); 
    
    image(wheelImg,x,y);
  }
   
  void shoot() {
    
    Canonball c = new Canonball();
    c.loc.y = y-20; 
    
    float dire = getDir();
    float rot = dire + PI/2;
    
    float x = sin(rot) * ballSpeed;
    float y = -cos(rot) * ballSpeed;

    c.applyForce( new PVector(x, y));

    ingame.balls.add(c);
  }
  
  
  float getDir() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector cannon = new PVector(16, height + 72);
    PVector dire = PVector.sub(mouse, cannon);    
    return atan2(dire.y+20, dire.x);
  }
  
 }
