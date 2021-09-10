Howtoplay htp;

boolean viewHowtoplay = false;
boolean viewFrontpage = true; 
boolean viewBackground = true;

PImage bg;

ArrayList<Button> list = new ArrayList<Button>(); 


void setup (){
  size(1000, 800);
  htp = new Howtoplay();
  
  bg =  loadImage("landscape.png");
  
  list.add(new Button(350, 600, 300, 60, 40, 380, 645, "How to play?"));
  list.add(new Button(350, 500, 300, 60, 40, 460, 545,  "Play"));

}


void draw(){
  if (viewFrontpage == true && viewBackground == true){
    background(bg);
    for(Button c: list){
    c.display();
    c.update();
  }
  }
   
  if(viewFrontpage == false && viewHowtoplay == true && viewBackground == false){
    background(169, 169, 169);
    htp.draw();
  }    
 println(mouseX, mouseY);
}

void mousePressed(){
  for(Button c: list){
    
    if(c.checkMouse() == true){
      c.isPressed = true;
      c.isReleased = false;
    }
    c.mouseHover();
  }
    
  if( viewFrontpage == true && mouseX >=350  && mouseY >=600 && mouseX <=650 && mouseY <=660){
    viewFrontpage = false;
    viewHowtoplay = true;
    viewBackground = false;
  }
  if( viewFrontpage == true && mouseX >= 350 && mouseY >=500 && mouseX <=650 && mouseY <=560){
    viewFrontpage = false;
    viewHowtoplay = false;
    viewBackground = false;
        background(20);
  }
  
  if (viewHowtoplay == true && mouseX >= 20 && mouseY >=206 && mouseX <=120 && mouseY <=255){
    viewFrontpage = true;
    viewHowtoplay = false;
    viewBackground = true;
  }
}
  
void mouseReleased(){
  for(Button c: list){
    c.isReleased = true;
    
  }
}
