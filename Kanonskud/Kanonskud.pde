import processing.sound.*;

SoundFile Pew;
SoundFile Miss;
SoundFile Score;
SoundFile Fly;
SoundFile Click;
SoundFile Highscore;

PImage landscapeImg;
PImage wheelImg;
PImage canonImg;
PImage wallImg;

InGame ingame = new InGame();
FrontPage frontpage = new FrontPage();

void setup() {
  textAlign(CENTER);
  size(1000, 800);  
  ingame.setup();
  
  Pew = new SoundFile(this, "Pew.mp3");
  Miss = new SoundFile(this, "Miss.mp3"); 
  Score = new SoundFile(this, "Score.mp3");
  Fly = new SoundFile(this, "Fly.mp3");
  Click = new SoundFile(this, "Click.mp3");
  Highscore = new SoundFile(this, "Highscore.mp3");
  
  wheelImg = loadImage("Wheel.png");
  wheelImg.resize(120, 120);
  canonImg = loadImage("Canon.png");
  canonImg.resize(120, 60);
  wallImg = loadImage("wall.png");
  landscapeImg = loadImage("landscape.png");
}

void draw() {
  clear();
  background(200);
  //Reset cursor
  if (!frontpage.htpButton.checkMouse() && !frontpage.playButton.checkMouse() && !frontpage.htp.homeBtn.checkMouse() && !ingame.homeBtn.checkMouse()){
    cursor(ARROW);
  }
  //Frontpage
  if(!inGame()){
    frontpage.showPages();
  }
  if(inGame()){
    ingame.run(); 
  }
}

void mousePressed() {
  if(inGame()){
   ingame.mousePressed();
  }
  frontpage.mousePressed();
  
}

void mouseReleased() {
 frontpage.mouseReleased();
 if(inGame()){
   ingame.mouseReleased();
 }
}

boolean inGame(){
  if(!frontpage.viewFrontPage && !frontpage.viewHowToPlay){
    return true;
  }
  return false;
}
