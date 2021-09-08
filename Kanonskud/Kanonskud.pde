//Canon
Canon canon;
ArrayList<Canonball> balls;
PVector g = new PVector(0, 1);
PVector gravity = new PVector(0, 10);

PImage wheelImg;
PImage canonImg;
PImage wallImg;
PImage landscapeImg;

//Score
String[] highScore;
int score = 0;
int highScoreInt;

//Forhindringer
Forhindringer F1;

//Particle
ArrayList<Particle> particle;

void setup(){
  textAlign(CENTER);
  size(1000,800);  
  
  
  wheelImg = loadImage("Wheel.png");
  wheelImg.resize(120,120);
  canonImg = loadImage("Canon.png");
  canonImg.resize(120,60);
  wallImg = loadImage("wall.png");
  landscapeImg = loadImage("landscape.png");
  landscapeImg.resize(width,height);
  
  int random = int(random(0,400));
  F1 = new Forhindringer(800,80,random,120);
  
  //Grab the highscore
  highScore = loadStrings("info.txt");
  
  //Canon
  canon = new Canon();
  balls = new ArrayList<Canonball>();

  //Particle
  particle = new ArrayList<Particle>();
}

void draw(){
  
  highScoreInt = int(highScore[0]);
  clear();
  imageMode(CORNER);
  image(landscapeImg,0,0);

  textSize(32);
  fill(255);
  text("Highscore: " + highScore[0], 400,100);
  text("Current score: " + score, 400, 200);
  
  if(score > highScoreInt){
    highScore[0] = str(score);
    saveStrings("info.txt", highScore);
    highScore = loadStrings("info.txt");
  }
  
  F1.lavForhindringer();
  
  //Canon
  for (int i = 0; i < balls.size(); i++) {
    Canonball c = balls.get(i);
    c.applyForce(gravity);
    c.display();
    c.update(0.016);
  }
  
  canon.makeCannon();
  
}

void newObstacle(){
  F1.hTop = random(120,height-120);
}


void mousePressed() {
  canon.shoot();
}
