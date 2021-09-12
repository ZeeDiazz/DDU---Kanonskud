class Canon {
  float ballSpeed = 1300;
  
  void makeCannon() { 
    pushMatrix();
      fill(100,255,255);
      translate(50,780);
      rotate(getDir());
      rect (0,0,50,20);
    popMatrix(); 
  }
  
  void shoot() {
    
    Canonball c = new Canonball();
    c.loc.y = height - c.loc.x; 
    
    float dire = getDir();
    float rot = dire + PI/2;
    
    float x = sin(rot) * ballSpeed;
    float y = -cos(rot) * ballSpeed;

    c.applyForce( new PVector(x, y));

    balls.add(c);
    particles.add(new Particle(50,780,random(0.5,1.5),random(-2,0)));  
    particles.add(new Particle(50,780,random(0.5,1.5),random(-2,0)));  
    particles.add(new Particle(50,780,random(0.5,1.5),random(-2,0)));  
    particles.add(new Particle(50,780,random(0.5,1.5),random(-2,0)));  
    particles.add(new Particle(50,780,random(0.5,1.5),random(-2,0)));  
    particles.add(new Particle(50,780,random(0.5,1.5),random(-2,0)));  
    particles.add(new Particle(50,780,random(0.5,1.5),random(-2,0))); 
    particles.add(new Particle(50,780,random(0.5,1.5),random(-2,0)));  
}
  
  
  float getDir() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector cannon = new PVector(16, height + 72);
    PVector dire = PVector.sub(mouse, cannon);    
    return atan2(dire.y+20, dire.x);
  }
  
 }
