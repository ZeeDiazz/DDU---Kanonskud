class InGame{
  //Canon
  Canon canon;
  ArrayList<Canonball> balls;
  PVector g = new PVector(0, 1);
  PVector gravity = new PVector(0, 10);
  boolean canShoot = true;
  
  //Score
  String[] highScore;
  int score = 0;
  int highScoreInt;
  
  //Obstacles
  Obstacles obstacle;
  
  //Particles
  ArrayList<Particle> particles;
  
  //Home Button
  Button homeBtn = new Button(50, 50, 50, 50, 12, "Home");
  
  void setup(){
    //Obstacles
    obstacle = new Obstacles(800, 80, random(0, 400), 120);
  
    //Canon
    canon = new Canon();
    balls = new ArrayList<Canonball>();
  
    //Particles
    particles = new ArrayList<Particle>();
    
  }
    
  void run(){
    //Higscore
    highScore = loadStrings("score.txt");
    highScoreInt = int(highScore[0]);
    imageMode(CORNER);
    image(landscapeImg, 0, 0);
    textSize(32);
    fill(255);
    text("Highscore: " + highScore[0], 400, 100);
    text("Current score: " + score, 400, 200);

    if (score > highScoreInt) {
      Highscore.play();
      highScore[0] = str(score);
      saveStrings("score.txt", highScore);
      highScore = loadStrings("score.txt");
    }
    
    //Home Button
    homeBtn.display();
    
    //Obstacles
    obstacle.makeObstacles();

    //Canon
    for(Canonball c : balls){
      c.applyForce(gravity);
      c.display();
      c.update(0.016);
    }   
    canon.makeCannon();  
    
    //Particles
    try{
    for (Particle p : particles){
      p.run();
      if (p.isDead() == true){
        particles.remove(p);
       }
     }
   }
   catch(Exception e){}
  }
  
  void newObstacle(){
    obstacle.hTop = random(120,height-120);
  }
  
  void mousePressed(){
    if(canShoot){
      canon.shoot();
      canShoot = false;
    }
    if(homeBtn.checkMouse()){
      homeBtn.isPressed = true;
      homeBtn.isReleased = false;
    }
  }
  
  void mouseReleased(){
    if(homeBtn.checkMouse()){
      homeBtn.isReleased = true;
      homeBtn.isPressed = false;
      if(homeBtn.checkMouse()){
        Score.play();
        frontpage.viewFrontPage = true;
        score = 0;
        canShoot = true;
        for(Canonball c : balls){
          c.destroy = true;
        }
      }
    }
  }
}
