class Canonball{
  PVector vel;
  PVector loc;
  PVector acc;
  boolean destroy;
  float aVel = 0;
  float angle = 0;
  float aAcc = 0.05;
  float w = 40;
  
  Canonball() {
    loc = new PVector(50,750);
    acc = new PVector();
    vel = new PVector();
  }

  void update(float delta) {
    if(destroy){
      loc.x = 0;
      loc.y = 0;
    }
    
    if(!destroy){
      vel.add(acc);
      loc.x += vel.x * delta;
      loc.y += vel.y * delta;
      acc.mult(0);
      //Scored
      if(loc.x > width){
        ingame.score++;
        destroy = true;
        ingame.canShoot = true;
        ingame.newObstacle();
      }
    }
    collision();
  }
  
  void collision(){
    //Left side
    if((loc.x-(w/2) > ingame.obstacle.x && loc.x-w < ingame.obstacle.x+ingame.obstacle.w) || (loc.x+(w/2) > ingame.obstacle.x && loc.x-w < ingame.obstacle.x+ingame.obstacle.w)){
      if(loc.y-(w/2) < ingame.obstacle.hTop){
        reset();
      }
      if(loc.y+(w/2) > ingame.obstacle.hTop+ingame.obstacle.spaceBetween){
        reset();
      }
    }
    
    //Bottom
    if(loc.y > height){
        reset();
    }
    //Left side
    if(loc.x < 0){
      reset();
    }
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void display() {
    strokeWeight(1);
    if(!destroy){
      pushMatrix();
      fill(255);
      strokeWeight(2);
        translate(loc.x, loc.y);
        circle(0, 0, w);
      popMatrix();
    }
  }
  
  void reset(){
    destroy = true;
    ingame.canShoot = true;
    ingame.score = 0;
    ingame.newObstacle();
    for(int i = 0; i<=100; i++){
      ingame.particles.add(new Particle(loc.x,loc.y,random(-0.5,0.5),random(-1.5,1.5)));
    }
  }
  
}
