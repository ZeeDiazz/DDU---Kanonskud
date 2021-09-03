
Canon canon;
ArrayList<Mover> moves;
PVector g = new PVector(0, 0.05);
PVector gravity = new PVector(0, 10);

void setup() {
  size(1000, 800);

  canon = new Canon();
  moves = new ArrayList<Mover>();

}
void draw() {
  background(95, 64, 255);
  for (int i = 0; i < moves.size(); i++) {
    Mover m = moves.get(i);
    m.applyForce(gravity);
    m.display();
    m.update(0.016);
  }
  
  canon.cannon();

}
void mousePressed() {
  canon.shoot();
}
