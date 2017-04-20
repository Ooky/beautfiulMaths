void setup() {
  size(800,800);
  background(0);
  stroke(255);
  drawKardioide(400, 400, 100);
}


void drawKardioide(float x, float y, int radius) {  
  point(x,y);
  float startX=x;
  float startY=y;
  for(float f = 0; f<100000; f++) {
    x = startX+2*radius*(1-cos(f))*cos(f);
    y = startY+2*radius*(1-cos(f))*sin(f);
    point(x,y);
  } 
}