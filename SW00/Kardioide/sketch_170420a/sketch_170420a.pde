void setup() {
  size(800, 800);
  background(0);
  stroke(255);
  //drawKardioide(600, 400, 100);
  drawKardioideFill(600, 400, 100);
}

void drawKardioideFill(float x, float y, int radius) {  
  stroke(255,0,0);
  point(x, y);
  float startX=x;
  float startY=y;
  for (float k = 0; k<radius; k+=0.01) {
    radius--;
    startX--;
    for (float f = 0; f<10000; f++) {
      x = startX+2*radius*(1-cos(f))*cos(f);
      y = startY+2*radius*(1-cos(f))*sin(f);
      point(x, y);
    }
  }
}

void drawKardioide(float x, float y, int radius) {  
  point(x, y);
  float startX=x;
  float startY=y;
  for (float f = 0; f<10000; f++) {
    x = startX+2*radius*(1-cos(f))*cos(f);
    y = startY+2*radius*(1-cos(f))*sin(f);
    point(x, y);
  }
}