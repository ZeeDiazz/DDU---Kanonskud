String[] highScore;
int score = 0;
int highScoreInt;

void setup(){
  textAlign(CENTER);
  size(800,800);  
  
  //Grab the highscore
  highScore = loadStrings("info.txt");
}

void draw(){
  
  highScoreInt = int(highScore[0]);
  
  clear();
  textSize(32);
  text("Press 'r' to reset highscore", 400, 300);
  text("Press 'a' to add a point", 400, 200);
  text("Press 'p' to reset score", 400, 100);
  text("Highscore: " + highScore[0], 400,400);
  text("Current score: " + score, 400, 600);
  
  if(score > highScoreInt){
    highScore[0] = str(score);
    saveStrings("info.txt", highScore);
    highScore = loadStrings("info.txt");
  }
  
}

void keyPressed(){
  if(key == 'a'){
    score++;
  }
  if(key == 'r'){
    highScore[0] = str(0);
    saveStrings("info.txt", highScore);
  }
  if(key == 'p'){
    score = 0;
  }
}
