class Canonball {
PVector vel;
PVector loc;
PVector acc;
boolean destroy;

  float aVel = 0;
  float angle = 0;
  float aAcc = 0.05;
  float w = 20;
  
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
        score++;
        destroy = true;
        newObstacle();
      }
    }
    
    collision();
  }
  
  void collision(){
    //Left side
    if((loc.x-(w/2) > F1.x && loc.x-w < F1.x+F1.w) || (loc.x+(w/2) > F1.x && loc.x-w < F1.x+F1.w)){
      println("X koordinate");
      if(loc.y-(w/2) < F1.hTop){
        println("Top side");
        destroy = true;
        score = 0;
        newObstacle();
      }
      if(loc.y+(w/2) > F1.hTop+F1.pladsImellem){
        println("Bot side");
        destroy = true;
        score = 0;
        newObstacle();
      }
    }
    
    //Bottom
    if(loc.y > height){
        destroy = true;
        score = 0;
        newObstacle();
    }
    //Left side
    if(loc.x < 0){
      destroy = true;
      score = 0;
      newObstacle();
    }
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void display() {
    if(!destroy){
      pushMatrix();
      fill(255);
        translate(loc.x, loc.y);
        circle(0, 0, w);
      popMatrix();
    }
  }
}
