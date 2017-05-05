void setup() {
  background(0);
  stroke(255);
  size(800, 800);
}



void drawRandomPixel() {

  float x;
  float y;
  for (int i = 0; i<10000; i++) {
    x = random(width);
    y = random(height);
    point(x, y);
  }
}

void draw() {
  drawRandomPixel();
}