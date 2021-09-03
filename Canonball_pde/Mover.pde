class Mover {
PVector vel;
PVector loc;
PVector acc;


  float aVel = 0;
  float angle = 0;
  float aAcc = 0.05; 
  
  Mover() {
    loc = new PVector(50,750);
    acc = new PVector();
    vel = new PVector();
  }

  void update(float delta) {
    vel.add(acc);

    loc.x += vel.x * delta;
    loc.y += vel.y * delta;

    acc.mult(0);
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    ellipse(0, 0, 20, 20);
    popMatrix();
  }
}
