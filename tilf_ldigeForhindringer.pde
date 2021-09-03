Forhindringer F1;

void setup(){
  size(1000,800);
  
  int random = int(random(0,400));
  F1 = new Forhindringer(800,80,random,200); //Maks 290
}

void draw(){
  clear();
  
  F1.lavForhindringer();
  
}

void keyPressed(){
  F1.hTop = random(0,500);
}
