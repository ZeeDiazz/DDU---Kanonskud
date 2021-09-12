class Particle {
  
  PVector location = new PVector ();
  PVector velocity = new PVector ();
  PVector acceleration = new PVector (0,01);
  float lifespan = 200.0;

  float mass = 1;
  float x,y;
  
  Particle(float x, float y, float vX, float vY){
    location.x = x;
    location.y = y;
    velocity.x = vX;
    velocity.y = vY;
  }

  void run() {
    particleMover();
    particleDisplay();
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void particleMover() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 3.0;
  }
  
  void particleDisplay() {
    float rgb = 220;
    rgb -= 75;
    stroke(rgb,lifespan);
    fill(rgb);
    ellipse(location.x,location.y,10,10);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
