//Canon
Canon canon;
ArrayList<Canonball> balls;
PVector g = new PVector(0, 0.05);
PVector gravity = new PVector(0, 10);

//Score
String[] highScore;
int score = 0;
int highScoreInt;

//Forhindringer
Forhindringer F1;

void setup(){
  textAlign(CENTER);
  size(1000,800);  
  
  int random = int(random(0,400));
  F1 = new Forhindringer(800,80,random,200); //Maks 290
  
  //Grab the highscore
  highScore = loadStrings("info.txt");
  
  //Canon
  canon = new Canon();
  balls = new ArrayList<Canonball>();
}

void draw(){
  
  highScoreInt = int(highScore[0]);
  clear();
  background(120, 80, 255);

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

void keyPressed(){
  newObstacle();
}

void newObstacle(){
  F1.hTop = random(20,height-20);
}


void mousePressed() {
  canon.shoot();
}
