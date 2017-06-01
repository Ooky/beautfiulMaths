CA ca;


void setup() {
  size(800, 800);
  stroke(255);
  background(0);
  ca = new CA();
}

void draw() {
  ca.display();    // Draw the CA
  if (ca.generation < height/ca.w) {
    ca.generate();
  }
  
}