class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  float mass = 1;

  Particle(PVector l) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    ParticleMover();
    ParticleDisplay();
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void ParticleMover() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }
  
  void ParticleDisplay() {
    float rgb = 220;
    rgb -= 75;
    stroke(rgb,lifespan);
    fill(rgb,lifespan);
    ellipse(location.x,location.y,8,8);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
