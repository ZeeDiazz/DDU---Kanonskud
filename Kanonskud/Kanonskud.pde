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
  
  wheelImg = loadImage("Wheel.png");
  wheelImg.resize(120, 120);
  canonImg = loadImage("Canon.png");
  canonImg.resize(120, 60);
  wallImg = loadImage("wall.png");
  landscapeImg = loadImage("landscape.png");
  landscapeImg.resize(width, height);
}

void draw() {
  clear();
  background(200);
  //Reset cursor
  if (!frontpage.htpButton.checkMouse() && !frontpage.playButton.checkMouse() && !frontpage.htp.homeBtn.checkMouse()) {
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
}

boolean inGame(){
  if(!frontpage.viewFrontPage && !frontpage.viewHowToPlay){
    return true;
  }
  return false;
}
