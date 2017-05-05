int center = 400;
int factor = 100;
float t = ((1.0+sqrt(5.0)) / 2.00);

void setup() {
  background(0);
  stroke(255);
  size(800, 800, P3D);
  noFill();
}

void draw() {
  background(0);

  camera(400.0, 400.0, 0.0, // eyeX, eyeY, eyeZ
    mouseY, mouseX, 0.0, // centerX, centerY, centerZ
    0.0, 1.0, 0.0); // upX, upY, upZ




  drawVertices();
}


void drawVertices() {



  beginShape(TRIANGLE_STRIP);
  vertex(-100+center, t+center, 0);
  vertex(100+center, t+center, 0);
  vertex(-100+center, -t+center, 0);
  vertex(100+center, -t+center, 0);

  vertex(0+center, -100+center, t);
  vertex(0+center, 100+center, t);
  vertex(0+center, -100+center, -t);
  vertex(0+center, 100+center, -t);

  vertex(t+center, 0+center, -100);
  vertex(t+center, 0+center, 100);
  vertex(-t+center, 0+center, -100);
  vertex(-t+center, 0+center, 100);
  vertex(-100+center, t+center, 0);
  endShape();
}