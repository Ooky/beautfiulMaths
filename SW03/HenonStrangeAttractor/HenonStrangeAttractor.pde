float a = 1.4; //<>//
float b = 0.3;

float x, y;

void setup() {
  size(800, 800);
  background(0);
  stroke(255);
  x = map(random(1), 0, 1, -0.1, 0.1);
  y = map(random(1), 0, 1, -0.1, 0.1);
}

void draw() {
  //Center to mid
  translate(width / 2, height / 2);
  //calculate x/y
  float nextX = 1 - a * x*x + y;
  float nextY = b * x;
  //set x/y
  x = nextX;
  y = nextY;
  float xMapped = map(x, -1.5, 1.5, -250, 250);
  float yMapped = map(y, -0.4, 0.4, -250, 250);
  point(xMapped, yMapped);
}