class InGame{
  //Canon
  Canon canon;
  ArrayList<Canonball> balls;
  PVector g = new PVector(0, 1);
  PVector gravity = new PVector(0, 10);
  boolean nextShot = true;
  
  //Score
  String[] highScore;
  int score = 0;
  int highScoreInt;
  
  //Obstacles
  Obstacles obstacle;
  
  //Particles
  ArrayList<Particle> particle;

  
  void setup(){
    //Obstacles
    obstacle = new Obstacles(800, 80, random(0, 400), 120);
  
    //Canon
    canon = new Canon();
    balls = new ArrayList<Canonball>();
  
    //Particles
    //particle = new ArrayList<Particle>();
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
      highScore[0] = str(score);
      saveStrings("score.txt", highScore);
      highScore = loadStrings("score.txt");
    }
    
    //Obstacles
    obstacle.makeObstacles();

    //Canon
    
    for(Canonball c : balls){
      if(c.destroy){
        nextShot = true;
      }
      c.applyForce(gravity);
      c.display();
      c.update(0.016);
    }   
    canon.makeCannon();  
  }
  
  void newObstacle(){
    obstacle.hTop = random(120,height-120);
  }
  
  void mousePressed(){
    if(nextShot){
      canon.shoot();
    }
  }
}
