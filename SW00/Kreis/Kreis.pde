void setup() {
  size(800, 800);
  background(0);
  drawCircle(400, 400, 400);
}


void drawCircle(int radius, int posX, int posY) {
  //Color
  stroke(255, 255, 255);
  //MiddlePoint
  point(posX, posY);
  for (float f = 0; f<720*2; f+=0.25) {//f<360; f+=1  //f<720; f+=0.5
    point(posX+cos(f)*radius, posY+sin(f)*radius);
  }
}