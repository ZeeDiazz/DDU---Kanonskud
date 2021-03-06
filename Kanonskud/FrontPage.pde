class FrontPage{
  boolean viewFrontPage = true; 
  boolean viewHowToPlay = false;
  Howtoplay htp = new Howtoplay();
  
  Button htpButton = new Button(350, 600, 300, 60, 40, "How to play?");
  Button playButton = new Button(350, 500, 300, 60, 40, "Play");
  
  void showPages(){
    imageMode(CORNER);
    image(landscapeImg,0,0);
    textAlign(CORNER,CORNER);
    textSize(100);
    text("CanonBall",280,150);
    
    if(viewFrontPage){
      htpButton.display();
      htpButton.update();
      playButton.display();
      playButton.update();
    }
    
    if(viewHowToPlay){
      background(169, 169, 169);
      htp.display();
    }  
  }
  
  void mousePressed(){
    if(viewHowToPlay){
      if(htp.homeBtn.checkMouse()){
          htp.homeBtn.isPressed = true;
          htp.homeBtn.isReleased = false;
        }
    }
    
    if(htpButton.checkMouse()){
      htpButton.isPressed = true;
      htpButton.isReleased = false;
    }
    if(playButton.checkMouse()){
      playButton.isPressed = true;
      playButton.isReleased = false;
    }
  }
  
  void mouseReleased(){
    if(viewHowToPlay && htp.homeBtn.isPressed){
      htp.homeBtn.isPressed = false;
      htp.homeBtn.isReleased = true;
      if(htp.homeBtn.checkMouse()){
        Click.play();
        viewFrontPage = true;
        viewHowToPlay = false;
      }
    }
    
    if(playButton.isPressed){
      playButton.isPressed = false;
      playButton.isReleased = true;
      if(playButton.checkMouse()){
        Click.play();
        viewFrontPage = false;
        viewHowToPlay = false;
      }
    }
    
    if(htpButton.isPressed){
      htpButton.isPressed = false;
      htpButton.isReleased = true;
      if(htpButton.checkMouse()){
        Click.play();
        viewFrontPage = false;
        viewHowToPlay = true;
      }
    }
    
  }
}
